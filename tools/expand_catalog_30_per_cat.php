<?php

declare(strict_types=1);

require __DIR__.'/../vendor/autoload.php';

$app = require_once __DIR__.'/../bootstrap/app.php';
$app->make(Illuminate\Contracts\Console\Kernel::class)->bootstrap();

use Illuminate\Support\Facades\DB;

$perfumeIds = DB::table('products')
    ->where('sku', 'like', 'PERFUME-%')
    ->orderBy('id')
    ->pluck('id')
    ->all();

if (count($perfumeIds) === 0) {
    fwrite(STDERR, "No PERFUME-% products found.\n");
    exit(1);
}

// 1. Enable all 103 PERFUME-% products in product_flat & EAV (status=8, visible_individually=7)
DB::table('product_flat')
    ->whereIn('product_id', $perfumeIds)
    ->update([
        'status' => 1,
        'visible_individually' => 1,
    ]);

DB::table('product_attribute_values')
    ->whereIn('product_id', $perfumeIds)
    ->whereIn('attribute_id', [7, 8])
    ->update(['boolean_value' => 1]);

echo '[OK] Enabled '.count($perfumeIds)." PERFUME-% products (status=1, visible_individually=1).\n";

// 2. Map 24 real perfume image paths grouped by category
$realSkusByCat = [
    10 => ['PERFUME-0101', 'PERFUME-0102', 'PERFUME-0103', 'PERFUME-0104', 'PERFUME-0106', 'PERFUME-0107'],
    11 => ['PERFUME-0127', 'PERFUME-0128', 'PERFUME-0129', 'PERFUME-0130', 'PERFUME-0131', 'PERFUME-0134'],
    12 => ['PERFUME-0153', 'PERFUME-0154', 'PERFUME-0155', 'PERFUME-0156', 'PERFUME-0158', 'PERFUME-0163'],
    13 => ['PERFUME-0181', 'PERFUME-0182', 'PERFUME-0184', 'PERFUME-0185', 'PERFUME-0199', 'PERFUME-0200'],
];

$realPoolByCat = [];
$realProductIds = [];
foreach ($realSkusByCat as $catId => $skus) {
    $rows = DB::table('product_images')
        ->join('products', 'products.id', '=', 'product_images.product_id')
        ->whereIn('products.sku', $skus)
        ->orderBy('products.id')
        ->get(['products.id as pid', 'product_images.path']);
    foreach ($rows as $r) {
        $realPoolByCat[$catId][] = $r->path;
        $realProductIds[] = $r->pid;
    }
}
$realProductIds = array_values(array_unique($realProductIds));

// 3. Assign real perfume images to the 79 products that still have non-perfume placeholder images
$catByProduct = DB::table('product_categories')
    ->whereIn('product_id', $perfumeIds)
    ->whereIn('category_id', [10, 11, 12, 13])
    ->pluck('category_id', 'product_id')
    ->all();

$updatedImages = 0;
$counters = [10 => 0, 11 => 0, 12 => 0, 13 => 0];
foreach ($perfumeIds as $pid) {
    if (in_array($pid, $realProductIds, true)) {
        continue;
    }
    $catId = (int) ($catByProduct[$pid] ?? 10);
    $pool = $realPoolByCat[$catId] ?? $realPoolByCat[10];
    $imgPath = $pool[$counters[$catId] % count($pool)];
    $counters[$catId]++;

    DB::table('product_images')->where('product_id', $pid)->delete();
    DB::table('product_images')->insert([
        'type' => null,
        'path' => $imgPath,
        'product_id' => $pid,
        'position' => 1,
    ]);
    $updatedImages++;
}
echo "[OK] Assigned real perfume images to {$updatedImages} additional products.\n";

// 4. Cross-assign categories so each of 10, 11, 12, 13 has exactly 30 products
$baseByCat = [10 => [], 11 => [], 12 => [], 13 => []];
foreach ($perfumeIds as $pid) {
    $c = (int) ($catByProduct[$pid] ?? 10);
    if (isset($baseByCat[$c])) {
        $baseByCat[$c][] = $pid;
    }
}

$extraAssignments = [
    10 => array_slice($baseByCat[12], 0, 4),
    11 => array_slice($baseByCat[12], 2, 4),
    12 => array_merge(array_slice($baseByCat[10], 0, 2), array_slice($baseByCat[11], 0, 2)),
    13 => array_slice($baseByCat[12], 0, 5),
];

$addedLinks = 0;
foreach ($extraAssignments as $targetCat => $pids) {
    foreach ($pids as $pid) {
        $exists = DB::table('product_categories')
            ->where('product_id', $pid)
            ->where('category_id', $targetCat)
            ->exists();
        if (! $exists) {
            DB::table('product_categories')->insert([
                'product_id' => $pid,
                'category_id' => $targetCat,
            ]);
            $addedLinks++;
        }
    }
}
echo "[OK] Added {$addedLinks} cross-category links.\n";

foreach ([10, 11, 12, 13] as $cid) {
    $cnt = DB::table('product_categories')
        ->where('category_id', $cid)
        ->whereIn('product_id', $perfumeIds)
        ->count();
    echo "Category #{$cid} total products: {$cnt}\n";
}

// 5. Ensure all 103 products have 4 related & up-sell products
DB::table('product_relations')->whereIn('parent_id', $perfumeIds)->delete();
DB::table('product_up_sells')->whereIn('parent_id', $perfumeIds)->delete();

$relInserts = [];
$upsellInserts = [];
foreach ($baseByCat as $catId => $ids) {
    $total = count($ids);
    foreach ($ids as $idx => $pid) {
        for ($k = 1; $k <= 4; $k++) {
            $relInserts[] = ['parent_id' => $pid, 'child_id' => $ids[($idx + $k) % $total]];
            $upsellInserts[] = ['parent_id' => $pid, 'child_id' => $ids[($idx + $k + 2) % $total]];
        }
    }
}
DB::table('product_relations')->insert($relInserts);
DB::table('product_up_sells')->insert($upsellInserts);
echo '[OK] Populated '.count($relInserts).' product_relations and '.count($upsellInserts)." product_up_sells.\n";
