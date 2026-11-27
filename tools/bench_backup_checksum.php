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

$findMysqlBinary = static function (string $exe): string {
    $base = 'D:\\tool\\laragon\\bin\\mysql';
    if (is_dir($base)) {
        $it = new RecursiveIteratorIterator(new RecursiveDirectoryIterator($base));
        foreach ($it as $file) {
            if ($file->isFile() && strtolower($file->getFilename()) === strtolower($exe)) {
                return $file->getPathname();
            }
        }
    }

    return $exe;
};

$mysqldump = $findMysqlBinary('mysqldump.exe');
$mysql = $findMysqlBinary('mysql.exe');
$backupFile = __DIR__.'/../mockdata/bench_c_backup.sql';
$srcDb = (string) config('database.connections.mysql.database');
$dstDb = 'bagisto_restore_test';
$host = (string) config('database.connections.mysql.host', '127.0.0.1');
$user = (string) config('database.connections.mysql.username', 'root');

$log('=== BENCHMARK C: BACKUP, RESTORE & CHECKSUM VERIFICATION ===');
$log('Date: '.date('Y-m-d H:i:s'));
$log("Source DB: {$srcDb} | Target Restore DB: {$dstDb}");

$tDump0 = microtime(true);
$dumpCmd = sprintf('"%s" -h %s -u %s --single-transaction --routines --triggers --events %s > "%s"', $mysqldump, $host, $user, $srcDb, $backupFile);
exec($dumpCmd, $dumpOut, $dumpCode);
$tDump = round(microtime(true) - $tDump0, 2);
$sizeBytes = is_file($backupFile) ? filesize($backupFile) : 0;
$log("1. mysqldump exit={$dumpCode} | time={$tDump}s | size={$sizeBytes} bytes");

DB::statement("DROP DATABASE IF EXISTS `{$dstDb}`");
DB::statement("CREATE DATABASE `{$dstDb}` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci");

$tRestore0 = microtime(true);
$restoreCmd = sprintf('"%s" -h %s -u %s %s < "%s"', $mysql, $host, $user, $dstDb, $backupFile);
exec($restoreCmd, $resOut, $resCode);
$tRestore = round(microtime(true) - $tRestore0, 2);
$log("2. restore exit={$resCode} | time={$tRestore}s");

$tables = [
    'channels',
    'core_config',
    'customers',
    'orders',
    'order_items',
    'invoices',
    'shipments',
    'products',
    'product_flat',
    'product_images',
    'product_inventories',
    'theme_sections',
    'theme_section_translations',
];

$log("\n3. COUNT(*) & CHECKSUM TABLE COMPARISON:");
$log(sprintf('%-28s | %-8s | %-8s | %-12s | %-12s | %s', 'Table', 'SrcCnt', 'DstCnt', 'SrcChecksum', 'DstChecksum', 'Match'));
$log(str_repeat('-', 92));

$allMatched = true;
foreach ($tables as $tbl) {
    $srcCnt = (int) DB::selectOne("SELECT COUNT(*) as c FROM `{$srcDb}`.`{$tbl}`")->c;
    $dstCnt = (int) DB::selectOne("SELECT COUNT(*) as c FROM `{$dstDb}`.`{$tbl}`")->c;
    $srcChk = (string) (DB::selectOne("CHECKSUM TABLE `{$srcDb}`.`{$tbl}`")->Checksum ?? 'NULL');
    $dstChk = (string) (DB::selectOne("CHECKSUM TABLE `{$dstDb}`.`{$tbl}`")->Checksum ?? 'NULL');
    $match = ($srcCnt === $dstCnt && $srcChk === $dstChk) ? 'OK' : 'MISMATCH';
    if ($match !== 'OK') {
        $allMatched = false;
    }
    $log(sprintf('%-28s | %-8d | %-8d | %-12s | %-12s | %s', $tbl, $srcCnt, $dstCnt, $srcChk, $dstChk, $match));
}

DB::statement("DROP DATABASE IF EXISTS `{$dstDb}`");
$log("\nOverall Integrity: ".($allMatched ? '100% MATCHED' : 'MISMATCH DETECTED'));

file_put_contents(__DIR__.'/../mockdata/bench_c_backup_raw.txt', implode("\n", $rawLog)."\n");
echo "\nSaved raw log to mockdata/bench_c_backup_raw.txt\n";
