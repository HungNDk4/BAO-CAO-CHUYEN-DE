<?php

declare(strict_types=1);

require __DIR__.'/../vendor/autoload.php';

$app = require_once __DIR__.'/../bootstrap/app.php';
$app->make(Illuminate\Contracts\Console\Kernel::class)->bootstrap();

use Illuminate\Support\Facades\DB;

$rawLog = [];
$log = static function (string $line) use (&$rawLog): void {
    echo $line."\n";
    $rawLog[] = $line;
};

$median = static function (array $values): float {
    sort($values);
    $n = count($values);
    $mid = intdiv($n, 2);

    return $n % 2 === 1 ? (float) $values[$mid] : ($values[$mid - 1] + $values[$mid]) / 2.0;
};

$ngramRow = DB::selectOne("SHOW VARIABLES LIKE 'ngram_token_size'");
$ngramSize = $ngramRow->Value ?? 'unknown';

$log('=== BENCHMARK A: VIETNAMESE SEARCH PERFORMANCE ===');
$log('Date: '.date('Y-m-d H:i:s'));
$log('MySQL Version: '.DB::selectOne('SELECT VERSION() as v')->v);
$log("ngram_token_size: {$ngramSize}");
$log('Table: exp_product_search_bench (isolated experiment table)');
$log('Data generation: deterministic perfume catalog combinations (brands, lines, notes, concentrations, volumes) with 0.1% rare mid-string target and 0.2% rare prefix target.');

$sizes = [10000, 100000, 500000];

$brands = ['Dior', 'Chanel', 'Creed', 'Tom Ford', 'Le Labo', 'YSL', 'Byredo', 'Kilian', 'Maison Margiela', 'Lancôme'];
$lines = ['Sauvage', 'Bleu', 'Aventus', 'Ombré Leather', 'Libre', 'Mojave Ghost', 'Lost Cherry', 'La Vie Est Belle', 'Tobacco Vanille', 'Another 13'];
$notes = ['Hương Gỗ', 'Hương Hoa Cỏ', 'Hương Cam Chanh', 'Hương Hổ Phách', 'Hương Tiêu Cay', 'Hương Vani', 'Hương Da Thuộc'];
$concs = ['EDP', 'EDT', 'Parfum', 'Extrait'];
$vols = ['10ml', '30ml', '50ml', '90ml', '100ml', '200ml'];

$summaryRows = [];

foreach ($sizes as $targetRows) {
    $log("\n------------------------------------------------------------");
    $log("DATASET SIZE: {$targetRows} ROWS");
    $log('------------------------------------------------------------');

    DB::statement('DROP TABLE IF EXISTS exp_product_search_bench');
    DB::statement('
        CREATE TABLE exp_product_search_bench (
            id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
            sku VARCHAR(64) NOT NULL,
            name VARCHAR(255) NOT NULL,
            description TEXT NOT NULL
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
    ');

    $tGenStart = microtime(true);
    $pdo = DB::getPdo();
    $batchSize = 5000;
    $batches = intdiv($targetRows, $batchSize);

    for ($b = 0; $b < $batches; $b++) {
        $placeholders = [];
        $params = [];
        for ($i = 1; $i <= $batchSize; $i++) {
            $idx = $b * $batchSize + $i;
            $brand = $brands[$idx % count($brands)];
            $line = $lines[($idx * 3) % count($lines)];
            $note = $notes[($idx * 7) % count($notes)];
            $conc = $concs[$idx % count($concs)];
            $vol = $vols[($idx * 5) % count($vols)];

            if ($idx % 1000 === 0) {
                $name = "Nước Hoa {$brand} Tuyệt Tác Cổ Điển {$conc} {$vol} #{$idx}";
            } elseif ($idx % 500 === 0) {
                $name = "Hương Trầm {$brand} {$line} {$conc} {$vol} #{$idx}";
            } else {
                $name = "Nước Hoa {$brand} {$line} {$conc} {$vol} #{$idx}";
            }
            $desc = "Sản phẩm chính hãng {$brand} thuộc nhóm {$note}, nồng độ {$conc}, dung tích {$vol}.";
            $placeholders[] = '(?,?,?)';
            $params[] = "EXP-{$idx}";
            $params[] = $name;
            $params[] = $desc;
        }
        $sql = 'INSERT INTO exp_product_search_bench (sku, name, description) VALUES '.implode(',', $placeholders);
        $stmt = $pdo->prepare($sql);
        $stmt->execute($params);
    }
    $tGen = round(microtime(true) - $tGenStart, 2);
    $log("Inserted {$targetRows} rows in {$tGen}s");

    DB::statement('ALTER TABLE exp_product_search_bench ADD INDEX idx_exp_name_btree (name)');
    DB::statement('ALTER TABLE exp_product_search_bench ADD FULLTEXT INDEX ft_exp_name_ngram (name) WITH PARSER ngram');
    DB::statement('ANALYZE TABLE exp_product_search_bench');

    $queries = [
        [
            'label' => "LIKE '%Tuyệt Tác%' (Full Scan)",
            'sql' => "SELECT id, name FROM exp_product_search_bench WHERE name LIKE '%Tuyệt Tác%' LIMIT 50",
        ],
        [
            'label' => "LIKE 'Hương Trầm%' (B-Tree Prefix)",
            'sql' => "SELECT id, name FROM exp_product_search_bench WHERE name LIKE 'Hương Trầm%' LIMIT 50",
        ],
        [
            'label' => "FULLTEXT ngram ('\"Tuyệt Tác\"' có dấu)",
            'sql' => "SELECT id, name FROM exp_product_search_bench WHERE MATCH(name) AGAINST('\"Tuyệt Tác\"' IN BOOLEAN MODE) LIMIT 50",
        ],
        [
            'label' => "FULLTEXT ngram ('\"Tuyet Tac\"' không dấu)",
            'sql' => "SELECT id, name FROM exp_product_search_bench WHERE MATCH(name) AGAINST('\"Tuyet Tac\"' IN BOOLEAN MODE) LIMIT 50",
        ],
    ];

    foreach ($queries as $q) {
        $times = [];
        $rowCount = 0;
        for ($run = 1; $run <= 5; $run++) {
            $t0 = microtime(true);
            $res = DB::select($q['sql']);
            $elapsedMs = (microtime(true) - $t0) * 1000.0;
            $times[] = round($elapsedMs, 3);
            if ($run === 1) {
                $rowCount = count($res);
            }
        }
        $med = round($median($times), 3);

        $explainRows = DB::select('EXPLAIN ANALYZE '.$q['sql']);
        $explainText = implode("\n", array_map(static fn ($r) => (string) ($r->EXPLAIN ?? array_values((array) $r)[0]), $explainRows));

        $log("\n[{$q['label']}]");
        $log('Runs (ms): '.implode(', ', $times)." | Median: {$med} ms | Returned (LIMIT 50): {$rowCount}");
        $log("EXPLAIN ANALYZE:\n{$explainText}");

        $summaryRows[] = [
            'size' => $targetRows,
            'method' => $q['label'],
            'median_ms' => $med,
            'returned' => $rowCount,
        ];
    }
}

DB::statement('DROP TABLE IF EXISTS exp_product_search_bench');

$log("\n=== SUMMARY TABLE ===");
foreach ($summaryRows as $sr) {
    $log(sprintf('%-8d | %-42s | Median: %8.3f ms | Rows: %d', $sr['size'], $sr['method'], $sr['median_ms'], $sr['returned']));
}

file_put_contents(__DIR__.'/../mockdata/bench_a_search_raw.txt', implode("\n", $rawLog)."\n");
echo "\nSaved raw log to mockdata/bench_a_search_raw.txt\n";
