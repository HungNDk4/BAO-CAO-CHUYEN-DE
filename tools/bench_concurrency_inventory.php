<?php

declare(strict_types=1);

require __DIR__.'/../vendor/autoload.php';

$app = require_once __DIR__.'/../bootstrap/app.php';
$app->make(Illuminate\Contracts\Console\Kernel::class)->bootstrap();

use Illuminate\Support\Facades\DB;

if (in_array('--worker', $argv, true)) {
    $opts = getopt('', ['worker', 'mode:', 'sku:', 'start:', 'id:']);
    $mode = (string) ($opts['mode'] ?? 'nolock');
    $sku = (string) ($opts['sku'] ?? '');
    $startAt = (float) ($opts['start'] ?? microtime(true));
    $workerId = (string) ($opts['id'] ?? '0');

    while (microtime(true) < $startAt) {
        usleep(1000);
    }

    $t0 = microtime(true);

    if ($mode === 'nolock') {
        $row = DB::selectOne('SELECT id, qty FROM exp_product_inventories WHERE sku = ?', [$sku]);
        $before = (int) ($row->qty ?? 0);
        if ($before >= 1) {
            usleep(60000);
            DB::update('UPDATE exp_product_inventories SET qty = qty - 1 WHERE sku = ?', [$sku]);
            $after = (int) DB::selectOne('SELECT qty FROM exp_product_inventories WHERE sku = ?', [$sku])->qty;
            $ms = round((microtime(true) - $t0) * 1000, 1);
            echo "Worker #{$workerId} [NO_LOCK]   -> SUCCESS (saw qty={$before}, after update qty={$after}, {$ms}ms)\n";
        } else {
            $ms = round((microtime(true) - $t0) * 1000, 1);
            echo "Worker #{$workerId} [NO_LOCK]   -> REJECTED (saw qty={$before}, {$ms}ms)\n";
        }
        exit(0);
    }

    try {
        $result = DB::transaction(static function () use ($sku, $workerId, $t0): string {
            $row = DB::selectOne('SELECT id, qty FROM exp_product_inventories WHERE sku = ? FOR UPDATE', [$sku]);
            $before = (int) ($row->qty ?? 0);
            if ($before >= 1) {
                usleep(60000);
                DB::update('UPDATE exp_product_inventories SET qty = qty - 1 WHERE sku = ?', [$sku]);
                $after = (int) DB::selectOne('SELECT qty FROM exp_product_inventories WHERE sku = ?', [$sku])->qty;
                $ms = round((microtime(true) - $t0) * 1000, 1);

                return "Worker #{$workerId} [FOR_UPDATE] -> SUCCESS (locked qty={$before}, after qty={$after}, {$ms}ms)";
            }
            $ms = round((microtime(true) - $t0) * 1000, 1);

            return "Worker #{$workerId} [FOR_UPDATE] -> BLOCKED_OUT_OF_STOCK (locked qty={$before}, {$ms}ms)";
        }, 3);
        echo $result."\n";
    } catch (Throwable $e) {
        echo "Worker #{$workerId} [FOR_UPDATE] -> ERROR: ".$e->getMessage()."\n";
    }
    exit(0);
}

$rawLog = [];
$log = static function (string $line) use (&$rawLog): void {
    echo $line."\n";
    $rawLog[] = $line;
};

$runScenario = static function (string $title, string $sku, int $initialQty, int $workers, string $mode) use ($log): array {
    DB::statement('DROP TABLE IF EXISTS exp_product_inventories');
    DB::statement('
        CREATE TABLE exp_product_inventories (
            id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
            sku VARCHAR(64) NOT NULL UNIQUE,
            name VARCHAR(255) NOT NULL,
            qty INT NOT NULL
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
    ');
    DB::table('exp_product_inventories')->insert([
        'sku' => $sku,
        'name' => "Experiment Perfume {$sku}",
        'qty' => $initialQty,
    ]);

    $log("\n--- {$title} ({$mode}, initial qty={$initialQty}, concurrent workers={$workers}) ---");

    $startAt = microtime(true) + 0.5;
    $procs = [];
    $pipesList = [];
    $phpBin = PHP_BINARY;
    $script = __FILE__;

    for ($i = 1; $i <= $workers; $i++) {
        $cmd = sprintf(
            '"%s" "%s" --worker --mode=%s --sku=%s --start=%.6f --id=%d',
            $phpBin,
            $script,
            $mode,
            $sku,
            $startAt,
            $i
        );
        $desc = [1 => ['pipe', 'w'], 2 => ['pipe', 'w']];
        $proc = proc_open($cmd, $desc, $pipes);
        if (is_resource($proc)) {
            $procs[] = $proc;
            $pipesList[] = $pipes;
        }
    }

    $successCount = 0;
    $rejectedCount = 0;

    foreach ($procs as $idx => $proc) {
        $stdout = stream_get_contents($pipesList[$idx][1]);
        $stderr = stream_get_contents($pipesList[$idx][2]);
        fclose($pipesList[$idx][1]);
        fclose($pipesList[$idx][2]);
        proc_close($proc);

        foreach (explode("\n", trim($stdout)) as $line) {
            if ($line !== '') {
                $log($line);
                if (str_contains($line, '-> SUCCESS')) {
                    $successCount++;
                } elseif (str_contains($line, 'REJECTED') || str_contains($line, 'BLOCKED_OUT_OF_STOCK')) {
                    $rejectedCount++;
                }
            }
        }
        if (trim($stderr) !== '') {
            $log('[STDERR] '.trim($stderr));
        }
    }

    $finalQty = (int) DB::table('exp_product_inventories')->where('sku', $sku)->value('qty');
    $log("FINAL DB QTY: {$finalQty} | Success: {$successCount} | Rejected: {$rejectedCount}");

    return [
        'title' => $title,
        'mode' => $mode,
        'initial_qty' => $initialQty,
        'workers' => $workers,
        'success' => $successCount,
        'rejected' => $rejectedCount,
        'final_qty' => $finalQty,
    ];
};

$log('=== BENCHMARK B: CONCURRENCY & PESSIMISTIC LOCKING (exp_product_inventories) ===');
$log('Date: '.date('Y-m-d H:i:s'));

$results = [];
$results[] = $runScenario('Scenario 1: qty=1, 2 buyers', 'EXP-0103', 1, 2, 'nolock');
$results[] = $runScenario('Scenario 1: qty=1, 2 buyers', 'EXP-0103', 1, 2, 'forupdate');
$results[] = $runScenario('Scenario 2: qty=5, 8 buyers', 'EXP-0153', 5, 8, 'nolock');
$results[] = $runScenario('Scenario 2: qty=5, 8 buyers', 'EXP-0153', 5, 8, 'forupdate');

DB::statement('DROP TABLE IF EXISTS exp_product_inventories');

$log("\n=== SUMMARY TABLE ===");
foreach ($results as $r) {
    $log(sprintf(
        '%-28s | %-9s | Init=%d | Workers=%d | OK=%d | Reject=%d | FinalQty=%d',
        $r['title'],
        $r['mode'],
        $r['initial_qty'],
        $r['workers'],
        $r['success'],
        $r['rejected'],
        $r['final_qty']
    ));
}

file_put_contents(__DIR__.'/../mockdata/bench_b_concurrency_raw.txt', implode("\n", $rawLog)."\n");
echo "\nSaved raw log to mockdata/bench_b_concurrency_raw.txt\n";
