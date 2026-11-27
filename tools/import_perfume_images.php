<?php

declare(strict_types=1);

use Illuminate\Contracts\Console\Kernel;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

require __DIR__.'/../vendor/autoload.php';

$app = require_once __DIR__.'/../bootstrap/app.php';
$app->make(Kernel::class)->bootstrap();

/**
 * Import perfume product and branding images from picturetemplate/ into Bagisto.
 */
final class PerfumeImageImporter
{
    private const ALLOWED_EXTENSIONS = ['jpg', 'jpeg', 'png', 'webp'];

    private const MAX_BASENAME_LENGTH = 35;

    private string $sourceRoot;

    private string $storagePublicRoot;

    private string $publicStorageRoot;

    public function __construct(string $basePath)
    {
        $this->sourceRoot = $basePath.DIRECTORY_SEPARATOR.'picturetemplate';
        $this->storagePublicRoot = $basePath.DIRECTORY_SEPARATOR.'storage'.DIRECTORY_SEPARATOR.'app'.DIRECTORY_SEPARATOR.'public';
        $this->publicStorageRoot = $basePath.DIRECTORY_SEPARATOR.'public'.DIRECTORY_SEPARATOR.'storage';
    }

    /**
     * Execute the full import pipeline.
     */
    public function run(): int
    {
        if (! is_dir($this->sourceRoot)) {
            fwrite(STDERR, "ERROR: Directory not found: {$this->sourceRoot}\n");

            return 1;
        }

        $productStats = $this->importProducts();
        $brandingStats = $this->importBranding();
        $syncedFiles = $this->syncDirectory($this->storagePublicRoot, $this->publicStorageRoot);

        echo "\n=== IMPORT SUMMARY ===\n";
        echo "Products matched   : {$productStats['matched']}\n";
        echo "Products skipped   : {$productStats['skipped']}\n";
        echo "Product images     : {$productStats['images']}\n";
        echo "Logo updated       : ".($brandingStats['logo'] ? 'YES' : 'NO')."\n";
        echo "Banners updated    : {$brandingStats['banners']}\n";
        echo "Synced public files: {$syncedFiles}\n";

        return 0;
    }

    /**
     * Import all product images from <SKU>__<slug> subdirectories.
     *
     * @return array{matched: int, skipped: int, images: int}
     */
    private function importProducts(): array
    {
        $matched = 0;
        $skipped = 0;
        $totalImages = 0;

        $entries = scandir($this->sourceRoot);
        if ($entries === false) {
            return ['matched' => 0, 'skipped' => 0, 'images' => 0];
        }

        sort($entries);

        foreach ($entries as $entry) {
            if ($entry === '.' || $entry === '..' || $entry === '_branding') {
                continue;
            }

            $folderPath = $this->sourceRoot.DIRECTORY_SEPARATOR.$entry;
            if (! is_dir($folderPath)) {
                continue;
            }

            $parts = explode('__', $entry, 2);
            $sku = trim($parts[0]);

            $product = DB::table('products')->where('sku', $sku)->first(['id', 'sku']);
            if (! $product) {
                echo "[SKIP] SKU not found in DB: {$sku} ({$entry})\n";
                $skipped++;

                continue;
            }

            $imageFiles = $this->collectImages($folderPath);
            if ($imageFiles === []) {
                echo "[WARN] No images in folder: {$entry}\n";
                $skipped++;

                continue;
            }

            $relativeDir = 'product/'.$product->id;
            $targetDir = $this->storagePublicRoot.DIRECTORY_SEPARATOR.'product'.DIRECTORY_SEPARATOR.$product->id;
            $this->recreateDirectory($targetDir);

            $records = [];
            $position = 1;
            $usedNames = [];

            foreach ($imageFiles as $srcFile) {
                $normalized = $this->normalizeFilename(basename($srcFile), $usedNames);
                $usedNames[] = $normalized;

                $destFile = $targetDir.DIRECTORY_SEPARATOR.$normalized;
                if (! copy($srcFile, $destFile)) {
                    fwrite(STDERR, "ERROR: Failed to copy {$srcFile} -> {$destFile}\n");

                    continue;
                }

                $records[] = [
                    'type' => null,
                    'path' => $relativeDir.'/'.$normalized,
                    'product_id' => $product->id,
                    'position' => $position++,
                ];
            }

            DB::transaction(function () use ($product, $records): void {
                DB::table('product_images')->where('product_id', $product->id)->delete();
                if ($records !== []) {
                    DB::table('product_images')->insert($records);
                }
            });

            $count = count($records);
            $totalImages += $count;
            $matched++;
            echo "[OK] {$sku} (ID={$product->id}): imported {$count} image(s)\n";
        }

        return ['matched' => $matched, 'skipped' => $skipped, 'images' => $totalImages];
    }

    /**
     * Import logo and carousel banners from _branding/.
     *
     * @return array{logo: bool, banners: int}
     */
    private function importBranding(): array
    {
        $brandingDir = $this->sourceRoot.DIRECTORY_SEPARATOR.'_branding';
        if (! is_dir($brandingDir)) {
            return ['logo' => false, 'banners' => 0];
        }

        $logoUpdated = false;
        $logoSrc = $brandingDir.DIRECTORY_SEPARATOR.'logo.png';
        if (is_file($logoSrc)) {
            $channelDir = $this->storagePublicRoot.DIRECTORY_SEPARATOR.'channel'.DIRECTORY_SEPARATOR.'1';
            $this->ensureDirectory($channelDir);
            $logoDest = $channelDir.DIRECTORY_SEPARATOR.'logo.png';
            if (copy($logoSrc, $logoDest)) {
                DB::table('channels')->where('id', 1)->update(['logo' => 'channel/1/logo.png']);
                $logoUpdated = true;
                echo "[OK] Branding logo -> channel/1/logo.png\n";
            }
        }

        $bannersUpdated = 0;
        $carouselSections = DB::table('theme_sections')->where('type', 'image_carousel')->get(['id']);

        foreach ($carouselSections as $section) {
            $sectionDir = $this->storagePublicRoot
                .DIRECTORY_SEPARATOR.'themes'
                .DIRECTORY_SEPARATOR.'default'
                .DIRECTORY_SEPARATOR.'sections'
                .DIRECTORY_SEPARATOR.$section->id;
            $this->ensureDirectory($sectionDir);

            $bannerPaths = [];
            for ($i = 1; $i <= 3; $i++) {
                $bannerFile = $this->findBannerFile($brandingDir, $i);
                if ($bannerFile === null) {
                    continue;
                }

                $ext = strtolower(pathinfo($bannerFile, PATHINFO_EXTENSION));
                $targetName = "banner-{$i}.{$ext}";
                if (copy($bannerFile, $sectionDir.DIRECTORY_SEPARATOR.$targetName)) {
                    $bannerPaths[$i - 1] = "storage/themes/default/sections/{$section->id}/{$targetName}";
                }
            }

            if ($bannerPaths === []) {
                continue;
            }

            $translations = DB::table('theme_section_translations')
                ->where('section_id', $section->id)
                ->get(['id', 'locale', 'options']);

            foreach ($translations as $tr) {
                $options = json_decode((string) $tr->options, true);
                if (! is_array($options)) {
                    $options = [];
                }

                $existingImages = is_array($options['images'] ?? null) ? $options['images'] : [];
                $newImages = [];

                foreach ($bannerPaths as $idx => $path) {
                    $prev = $existingImages[$idx] ?? [];
                    $newImages[] = [
                        'link' => is_string($prev['link'] ?? null) ? $prev['link'] : '',
                        'image' => $path,
                        'title' => is_string($prev['title'] ?? null) ? $prev['title'] : '',
                    ];
                }

                $options['images'] = $newImages;

                DB::table('theme_section_translations')
                    ->where('id', $tr->id)
                    ->update(['options' => json_encode($options, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES)]);
            }

            $bannersUpdated = count($bannerPaths);
            echo "[OK] Branding banners -> section {$section->id} ({$bannersUpdated} slide(s))\n";
        }

        return ['logo' => $logoUpdated, 'banners' => $bannersUpdated];
    }

    /**
     * Collect valid image files in a folder sorted naturally.
     *
     * @return list<string>
     */
    private function collectImages(string $folderPath): array
    {
        $files = scandir($folderPath);
        if ($files === false) {
            return [];
        }

        natsort($files);
        $images = [];

        foreach ($files as $file) {
            if ($file === '.' || $file === '..') {
                continue;
            }

            $fullPath = $folderPath.DIRECTORY_SEPARATOR.$file;
            if (! is_file($fullPath)) {
                continue;
            }

            $ext = strtolower(pathinfo($file, PATHINFO_EXTENSION));
            if (in_array($ext, self::ALLOWED_EXTENSIONS, true)) {
                $images[] = $fullPath;
            }
        }

        return $images;
    }

    /**
     * Find banner-N.{jpg,jpeg,png,webp} inside _branding/.
     */
    private function findBannerFile(string $brandingDir, int $index): ?string
    {
        foreach (self::ALLOWED_EXTENSIONS as $ext) {
            $candidate = $brandingDir.DIRECTORY_SEPARATOR."banner-{$index}.{$ext}";
            if (is_file($candidate)) {
                return $candidate;
            }
        }

        return null;
    }

    /**
     * Normalize filename to ASCII lowercase hyphenated form under 40 chars.
     *
     * @param  list<string>  $usedNames
     */
    private function normalizeFilename(string $filename, array $usedNames): string
    {
        $ext = strtolower(pathinfo($filename, PATHINFO_EXTENSION));
        $base = pathinfo($filename, PATHINFO_FILENAME);

        $ascii = Str::ascii($base);
        $slug = strtolower((string) preg_replace('/[^a-zA-Z0-9]+/', '-', $ascii));
        $slug = trim($slug, '-');
        if ($slug === '') {
            $slug = 'image';
        }

        $maxBase = max(8, self::MAX_BASENAME_LENGTH - strlen($ext) - 1);
        $slug = substr($slug, 0, $maxBase);
        $slug = rtrim($slug, '-');

        $candidate = "{$slug}.{$ext}";
        $suffix = 2;

        while (in_array($candidate, $usedNames, true)) {
            $tag = "-{$suffix}";
            $trimmed = rtrim(substr($slug, 0, $maxBase - strlen($tag)), '-');
            $candidate = "{$trimmed}{$tag}.{$ext}";
            $suffix++;
        }

        return $candidate;
    }

    /**
     * Ensure directory exists.
     */
    private function ensureDirectory(string $path): void
    {
        if (! is_dir($path)) {
            mkdir($path, 0775, true);
        }
    }

    /**
     * Recreate directory cleanly so stale files are removed.
     */
    private function recreateDirectory(string $path): void
    {
        if (is_dir($path)) {
            $items = scandir($path);
            if ($items !== false) {
                foreach ($items as $item) {
                    if ($item === '.' || $item === '..') {
                        continue;
                    }
                    $target = $path.DIRECTORY_SEPARATOR.$item;
                    if (is_file($target)) {
                        unlink($target);
                    }
                }
            }
        } else {
            mkdir($path, 0775, true);
        }
    }

    /**
     * Recursively copy files from source to destination (Windows symlink workaround).
     */
    private function syncDirectory(string $src, string $dst): int
    {
        if (! is_dir($src)) {
            return 0;
        }

        $this->ensureDirectory($dst);
        $count = 0;

        $items = scandir($src);
        if ($items === false) {
            return 0;
        }

        foreach ($items as $item) {
            if ($item === '.' || $item === '..') {
                continue;
            }

            $srcPath = $src.DIRECTORY_SEPARATOR.$item;
            $dstPath = $dst.DIRECTORY_SEPARATOR.$item;

            if (is_dir($srcPath)) {
                $count += $this->syncDirectory($srcPath, $dstPath);
            } elseif (is_file($srcPath)) {
                if (copy($srcPath, $dstPath)) {
                    $count++;
                }
            }
        }

        return $count;
    }
}

$importer = new PerfumeImageImporter(dirname(__DIR__));
exit($importer->run());
