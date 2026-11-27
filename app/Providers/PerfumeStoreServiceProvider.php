<?php

declare(strict_types=1);

namespace App\Providers;

use Illuminate\Foundation\Http\Middleware\PreventRequestsDuringMaintenance;
use Illuminate\Support\Facades\Event;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\ServiceProvider;

/**
 * Register custom Perfume Store routes and Vietnamese font overrides.
 */
class PerfumeStoreServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap custom storefront routes and head font overrides.
     */
    public function boot(): void
    {
        Route::middleware(['web', 'shop', PreventRequestsDuringMaintenance::class])
            ->group(base_path('routes/perfume_shop.php'));

        Event::listen('bagisto.shop.layout.head.after', static function ($viewRenderEventManager): void {
            $html = <<<'HTML'
<link rel="stylesheet" href="/fonts/perfume-fonts.css">
<style>
    html, body, .font-poppins {
        font-family: 'Be Vietnam Pro', 'Segoe UI', system-ui, -apple-system, sans-serif !important;
    }
    .font-dmserif, .dmserif {
        font-family: 'Playfair Display', Georgia, 'Times New Roman', serif !important;
    }
</style>
HTML;
            $viewRenderEventManager->addTemplate($html);
        });
    }
}
