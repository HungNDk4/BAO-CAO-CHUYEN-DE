<?php

use App\Http\Controllers\Shop\OrderTrackingController;
use App\Http\Controllers\Shop\SepayWebhookController;
use Illuminate\Support\Facades\Route;

Route::controller(OrderTrackingController::class)->group(function () {
    Route::get('order-tracking', 'index')->name('shop.order_tracking.index');

    Route::post('order-tracking', 'track')
        ->middleware('throttle:5,1')
        ->name('shop.order_tracking.track');
});

Route::controller(SepayWebhookController::class)->group(function () {
    Route::post('webhooks/sepay', 'webhook')
        ->middleware('throttle:60,1')
        ->name('shop.webhooks.sepay');

    Route::get('payment/sepay/status/{incrementId}', 'status')
        ->middleware('throttle:60,1')
        ->name('shop.sepay.status');

    Route::post('payment/sepay/simulate', 'simulate')
        ->middleware('throttle:20,1')
        ->name('shop.sepay.demo_simulate');

    Route::get('payment/sepay/checkout/{incrementId}', 'checkout')
        ->middleware('throttle:30,1')
        ->name('shop.sepay.gateway_checkout');

    Route::get('payment/sepay/return/{status}', 'gatewayReturn')
        ->whereIn('status', ['success', 'error', 'cancel'])
        ->middleware('throttle:30,1')
        ->name('shop.sepay.gateway_return');
});
