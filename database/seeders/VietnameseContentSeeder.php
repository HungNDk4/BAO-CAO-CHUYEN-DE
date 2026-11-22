<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class VietnameseContentSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run(): void
    {
        $contentPath = database_path('data/vietnamese_content.php');

        if (! file_exists($contentPath)) {
            $this->command->error("Data file not found at: {$contentPath}");
            return;
        }

        $data = require $contentPath;

        $this->seedThemeSections($data['theme_sections'] ?? []);
        $this->seedCmsPages($data['cms_pages'] ?? []);
        $this->seedChannelTranslations($data['channel'] ?? []);
        $this->seedCoreConfig($data['core_config'] ?? []);
        $this->seedAttributeTranslations($data['attributes'] ?? []);

        $this->command->info('VietnameseContentSeeder completed successfully.');
    }

    /**
     * Seed Vietnamese theme section translations preserving all JSON structure.
     *
     * @param  array  $sections
     * @return void
     */
    protected function seedThemeSections(array $sections): void
    {
        foreach ($sections as $sectionId => $sectionData) {
            $section = DB::table('theme_sections')->where('id', $sectionId)->first();

            if (! $section) {
                continue;
            }

            // Section 26 (Footer Info): Hide by default until user fills placeholders
            if ($sectionId == 26) {
                DB::table('theme_sections')
                    ->where('id', 26)
                    ->update([
                        'status'       => 0,
                        'draft_status' => 0,
                    ]);
            }

            // Read existing options from en or current row
            $existing = DB::table('theme_section_translations')
                ->where('section_id', $sectionId)
                ->where('locale', 'en')
                ->first();

            $options = $existing ? json_decode($existing->options, true) : [];

            switch ($section->type) {
                case 'static_content':
                    if (isset($sectionData['options']['html'])) {
                        $options['html'] = $sectionData['options']['html'];
                    }
                    break;

                case 'services_content':
                    if (isset($options['services']) && is_array($options['services'])) {
                        foreach ($options['services'] as $idx => &$srv) {
                            if (isset($sectionData['options']['services'][$idx])) {
                                $srv['title'] = $sectionData['options']['services'][$idx]['title'];
                                $srv['description'] = $sectionData['options']['services'][$idx]['description'];
                            }
                        }
                        unset($srv);
                    }
                    break;

                case 'image_carousel':
                    if (isset($options['images']) && is_array($options['images'])) {
                        foreach ($options['images'] as $idx => &$img) {
                            if (isset($sectionData['options']['images'][$idx])) {
                                $img['title'] = $sectionData['options']['images'][$idx]['title'] ?? '';
                                if (! empty($sectionData['options']['images'][$idx]['link'])) {
                                    $img['link'] = $sectionData['options']['images'][$idx]['link'];
                                }
                            }
                        }
                        unset($img);
                    }
                    break;

                case 'product_carousel':
                    if (isset($sectionData['options']['title'])) {
                        $options['title'] = $sectionData['options']['title'];
                    }
                    if (isset($sectionData['options']['target_slug'])) {
                        $targetCatId = DB::table('category_translations')
                            ->where('locale', 'vi')
                            ->where('slug', $sectionData['options']['target_slug'])
                            ->value('category_id');

                        if (! $targetCatId) {
                            throw new \RuntimeException("Category lookup failed for slug: '{$sectionData['options']['target_slug']}' in locale 'vi'. Seeder aborted.");
                        }

                        $options['filters']['category_id'] = (string) $targetCatId;
                    }
                    if (isset($sectionData['options']['filters']['sort'])) {
                        $options['filters']['sort'] = $sectionData['options']['filters']['sort'];
                    }
                    break;

                case 'category_carousel':
                    if (isset($sectionData['options']['title'])) {
                        $options['title'] = $sectionData['options']['title'];
                    }
                    break;

                case 'footer_links':
                    $linkMap = $sectionData['link_map'] ?? [];
                    foreach ($options as $colKey => &$links) {
                        if (is_array($links)) {
                            foreach ($links as &$linkItem) {
                                if (isset($linkItem['url'])) {
                                    $matched = false;
                                    foreach ($linkMap as $slugKey => $transInfo) {
                                        if (str_contains($linkItem['url'], $slugKey)) {
                                            $linkItem['title'] = $transInfo['title'];
                                            $linkItem['url']   = $transInfo['url'];
                                            $matched = true;
                                            break;
                                        }
                                    }
                                    if (! $matched) {
                                        $this->command->warn("Footer link not found in linkMap: {$linkItem['url']} ({$linkItem['title']})");
                                    }
                                }
                            }
                            unset($linkItem);
                        }
                    }
                    unset($links);
                    break;
            }

            $jsonOptions = json_encode($options, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);

            DB::table('theme_section_translations')->updateOrInsert(
                [
                    'section_id' => $sectionId,
                    'locale'     => 'vi',
                ],
                [
                    'options'       => $jsonOptions,
                    'draft_options' => $jsonOptions,
                ]
            );
        }

        $this->command->info('Theme section translations (vi) updated.');
    }

    /**
     * Seed Vietnamese CMS page translations.
     *
     * @param  array  $pages
     * @return void
     */
    protected function seedCmsPages(array $pages): void
    {
        foreach ($pages as $pageId => $pageData) {
            $exists = DB::table('cms_pages')->where('id', $pageId)->exists();

            if (! $exists) {
                continue;
            }

            DB::table('cms_page_translations')->updateOrInsert(
                [
                    'cms_page_id' => $pageId,
                    'locale'      => 'vi',
                ],
                [
                    'url_key'          => $pageData['url_key'],
                    'page_title'       => $pageData['page_title'],
                    'html_content'     => $pageData['html_content'],
                    'meta_title'       => $pageData['meta_title'],
                    'meta_description' => $pageData['meta_description'],
                    'meta_keywords'    => $pageData['meta_keywords'],
                ]
            );
        }

        $this->command->info('CMS page translations (vi) updated.');
    }

    /**
     * Seed Vietnamese channel translations.
     *
     * @param  array  $channelData
     * @return void
     */
    protected function seedChannelTranslations(array $channelData): void
    {
        if (empty($channelData)) {
            return;
        }

        $channel = DB::table('channels')->first();

        if (! $channel) {
            return;
        }

        $homeSeo = json_encode($channelData['home_seo'], JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);

        DB::table('channel_translations')->updateOrInsert(
            [
                'channel_id' => $channel->id,
                'locale'     => 'vi',
            ],
            [
                'name'        => $channelData['name'],
                'description' => $channelData['description'] ?? 'Cửa hàng nước hoa chính hãng uy tín hàng đầu',
                'home_seo'    => $homeSeo,
                'created_at'  => now(),
                'updated_at'  => now(),
            ]
        );

        $this->command->info('Channel translations (vi) updated.');
    }

    /**
     * Seed Vietnamese core config records.
     *
     * @param  array  $configs
     * @return void
     */
    protected function seedCoreConfig(array $configs): void
    {
        foreach ($configs as $config) {
            DB::table('core_config')->updateOrInsert(
                [
                    'code'         => $config['code'],
                    'channel_code' => 'default',
                    'locale_code'  => 'vi',
                ],
                [
                    'value' => $config['value'],
                ]
            );
        }

        $this->command->info('Core config (vi) updated.');
    }

    /**
     * Seed Vietnamese attribute translations.
     *
     * @param  array  $attributes
     * @return void
     */
    protected function seedAttributeTranslations(array $attributes): void
    {
        foreach ($attributes as $code => $label) {
            $attribute = DB::table('attributes')->where('code', $code)->first();

            if (! $attribute) {
                continue;
            }

            DB::table('attribute_translations')->updateOrInsert(
                [
                    'attribute_id' => $attribute->id,
                    'locale'       => 'vi',
                ],
                [
                    'name' => $label,
                ]
            );
        }

        $this->command->info('Attribute translations (vi) updated.');
    }
}
