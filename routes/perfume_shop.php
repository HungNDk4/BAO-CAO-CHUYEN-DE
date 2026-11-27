<?php

use App\Http\Controllers\Shop\OrderTrackingController;
use Illuminate\Support\Facades\Route;

Route::controller(OrderTrackingController::class)->group(function () {
    Route::get('tra-cuu-don-hang', 'index')->name('shop.order_tracking.index');

    Route::post('tra-cuu-don-hang', 'track')
        ->middleware('throttle:5,1')
        ->name('shop.order_tracking.track');
});
