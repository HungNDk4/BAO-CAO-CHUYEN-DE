<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class EnglishPerfumeContentSeeder extends Seeder
{
    /**
     * Run the database seeds for English perfume theme sections.
     * Note: This seeder is prepared for review and is NOT run automatically.
     *
     * @return void
     */
    public function run(): void
    {
        $this->updateEnglishSections();
        $this->command->info('EnglishPerfumeContentSeeder completed successfully.');
    }

    /**
     * Update English theme sections to align with Perfume store theme.
     *
     * @return void
     */
    protected function updateEnglishSections(): void
    {
        $menCatId = DB::table('category_translations')
            ->where('locale', 'en')
            ->where('slug', 'mens-perfumes')
            ->value('category_id');

        if (! $menCatId) {
            throw new \RuntimeException("Category lookup failed for slug: 'mens-perfumes' in locale 'en'. Seeder aborted.");
        }

        $womenCatId = DB::table('category_translations')
            ->where('locale', 'en')
            ->where('slug', 'womens-perfumes')
            ->value('category_id');

        if (! $womenCatId) {
            throw new \RuntimeException("Category lookup failed for slug: 'womens-perfumes' in locale 'en'. Seeder aborted.");
        }

        // Section 2: Offer Info
        $this->updateSectionOptions(2, function (array $opts) {
            $opts['html'] = '<div class="home-offer"><h1>SPECIAL OFFER - WORLD OF AUTHENTIC &amp; LUXURY PERFUMES</h1></div>';
            return $opts;
        });

        // Section 12: Services
        $this->updateSectionOptions(12, function (array $opts) {
            if (isset($opts['services'][0])) {
                $opts['services'][0]['title'] = 'Nationwide Express Shipping';
                $opts['services'][0]['description'] = 'Shockproof packaging, fast & safe delivery';
            }
            if (isset($opts['services'][1])) {
                $opts['services'][1]['title'] = '100% Authentic Perfumes';
                $opts['services'][1]['description'] = 'Authentic quality guaranteed, reputable origin';
            }
            if (isset($opts['services'][2])) {
                $opts['services'][2]['title'] = '24/7 Fragrance Consultation';
                $opts['services'][2]['description'] = 'Expert advice on scent notes & style matching';
            }
            return $opts;
        });

        // Section 22: Showroom Showcase
        $this->updateSectionOptions(22, function (array $opts) {
            $opts['html'] = str_replace(
                ['ShopSiuu Showroom', "Don't just trust the hype,<br />feel the gear yourself", 'Over 200 gaming gear models ready for hands-on trial and side-by-side comparison on-site. Friendly, zero-pressure advice.'],
                ['Authentic Perfume Showroom', "Don't just trust the hype,<br />experience the fragrance yourself", 'Hundreds of perfume samples ready for trial on skin. Friendly, professional advice with zero pressure.'],
                $opts['html'] ?? ''
            );
            return $opts;
        });

        // Section 23: Men's Perfumes
        $this->updateSectionOptions(23, function (array $opts) use ($menCatId) {
            $opts['title'] = "Men's Luxury Perfumes";
            $opts['filters']['category_id'] = (string) $menCatId;
            return $opts;
        });

        // Section 25: Women's Perfumes
        $this->updateSectionOptions(25, function (array $opts) use ($womenCatId) {
            $opts['title'] = "Women's Elegant Perfumes";
            $opts['filters']['category_id'] = (string) $womenCatId;
            return $opts;
        });
    }

    /**
     * Update section options JSON while preserving all other keys.
     *
     * @param  int  $sectionId
     * @param  callable  $callback
     * @return void
     */
    protected function updateSectionOptions(int $sectionId, callable $callback): void
    {
        $trans = DB::table('theme_section_translations')
            ->where('section_id', $sectionId)
            ->where('locale', 'en')
            ->first();

        if (! $trans) {
            return;
        }

        $opts = json_decode($trans->options, true) ?: [];
        $updatedOpts = $callback($opts);
        $encoded = json_encode($updatedOpts, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);

        DB::table('theme_section_translations')
            ->where('id', $trans->id)
            ->update([
                'options'       => $encoded,
                'draft_options' => $encoded,
            ]);
    }
}
