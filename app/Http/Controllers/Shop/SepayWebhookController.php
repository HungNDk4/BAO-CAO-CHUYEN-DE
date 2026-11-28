<?php

declare(strict_types=1);

namespace App\Http\Controllers\Shop;

use App\Services\SepayPaymentService;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller;
use Illuminate\View\View;
use Webkul\Sales\Models\Order;
use Webkul\Sales\Repositories\OrderRepository;

/**
 * Receive SePay webhooks and handle local-only demo payment simulation.
 */
class SepayWebhookController extends Controller
{
    /**
     * Handle incoming SePay webhook or Payment Gateway IPN notifications.
     */
    public function webhook(Request $request, SepayPaymentService $sepayPaymentService): JsonResponse
    {
        $expectedApiToken = (string) config('perfume_payment.sepay.api_token', '');
        $authHeader = (string) $request->header('Authorization', '');
        $providedApiToken = preg_replace('/^Apikey\s+/i', '', trim($authHeader)) ?? '';

        $expectedIpnSecret = (string) (config('perfume_payment.sepay.gateway.ipn_secret_key') ?: config('perfume_payment.sepay.gateway.secret_key', ''));
        $providedIpnSecret = trim((string) $request->header('X-Secret-Key', ''));

        $validApiToken = $expectedApiToken !== '' && $providedApiToken !== '' && hash_equals($expectedApiToken, $providedApiToken);
        $validIpnSecret = $expectedIpnSecret !== '' && $providedIpnSecret !== '' && hash_equals($expectedIpnSecret, $providedIpnSecret);

        if (! $validApiToken && ! $validIpnSecret) {
            return response()->json([
                'success' => false,
                'message' => 'Unauthorized',
            ], 401);
        }

        $result = $sepayPaymentService->processWebhook($request->all());

        return response()->json([
            'success' => true,
        ] + $result, 200);
    }

    /**
     * Render an auto-submitting POST form to redirect the customer to SePay Payment Gateway.
     */
    public function checkout(string $incrementId, SepayPaymentService $sepayPaymentService): View|RedirectResponse
    {
        $order = Order::query()
            ->where('increment_id', $incrementId)
            ->firstOrFail();

        if (! $order->canInvoice()) {
            session()->flash('order_id', $order->id);

            return redirect()->route('shop.checkout.onepage.success');
        }

        if (! $sepayPaymentService->isGatewayConfigured()) {
            session()->flash('order_id', $order->id);
            session()->flash('error', __('perfume.vietqr.gateway_not_configured'));

            return redirect()->route('shop.checkout.onepage.success');
        }

        $checkoutUrl = (string) config('perfume_payment.sepay.gateway.checkout_url');
        $fields = $sepayPaymentService->buildGatewayCheckoutFields($order);

        return view('shop::checkout.sepay_redirect', [
            'checkoutUrl' => $checkoutUrl,
            'fields' => $fields,
            'order' => $order,
        ]);
    }

    /**
     * Handle return URLs (success, error, cancel) from SePay Payment Gateway.
     */
    public function gatewayReturn(Request $request, string $status, SepayPaymentService $sepayPaymentService): RedirectResponse
    {
        $incrementId = trim((string) $request->query('order', ''));

        if ($incrementId !== '') {
            $order = Order::query()->where('increment_id', $incrementId)->first();

            if ($order) {
                if (
                    $status === 'success'
                    && $order->canInvoice()
                    && app()->environment('local')
                    && config('perfume_payment.sepay.gateway.environment') === 'sandbox'
                ) {
                    $sepayPaymentService->simulateDemoPayment($order->increment_id);
                } elseif (
                    $status === 'cancel'
                    && $order->canInvoice()
                    && $order->canCancel()
                ) {
                    app(OrderRepository::class)->cancel($order->id);
                }

                session()->flash('order_id', $order->id);
            }
        }

        if ($status === 'success') {
            session()->flash('success', __('perfume.vietqr.gateway_return_success'));
        } elseif ($status === 'error') {
            session()->flash('error', __('perfume.vietqr.gateway_return_error'));
        } else {
            session()->flash('warning', __('perfume.vietqr.gateway_return_cancel'));
        }

        return redirect()->route('shop.checkout.onepage.success');
    }

    /**
     * Check whether an order has been paid and invoiced for frontend polling.
     */
    public function status(string $incrementId): JsonResponse
    {
        $order = Order::query()
            ->where('increment_id', $incrementId)
            ->first(['id', 'increment_id', 'status']);

        if (! $order) {
            return response()->json(['paid' => false], 404);
        }

        $paid = ! $order->canInvoice();

        if ($paid) {
            session()->flash('order_id', $order->id);
        }

        return response()->json([
            'paid' => $paid,
            'status' => $order->status,
        ]);
    }

    /**
     * Simulate a SePay webhook confirmation on local environment for offline demos.
     */
    public function simulate(Request $request, SepayPaymentService $sepayPaymentService): RedirectResponse
    {
        if (
            ! app()->environment('local')
            || ! config('perfume_payment.sepay.allow_demo_simulation')
        ) {
            abort(404);
        }

        $validated = $request->validate([
            'increment_id' => ['required', 'string', 'max:64'],
        ]);

        $result = $sepayPaymentService->simulateDemoPayment($validated['increment_id']);

        if (isset($result['order_id'])) {
            session()->flash('order_id', $result['order_id']);
        }

        if (($result['status'] ?? '') === 'processed') {
            session()->flash('success', __('perfume.vietqr.demo_success'));
        } elseif (($result['status'] ?? '') === 'already_processed') {
            session()->flash('info', __('perfume.vietqr.demo_already_paid'));
        } else {
            session()->flash('error', __('perfume.vietqr.demo_failed'));
        }

        return redirect()->route('shop.checkout.onepage.success');
    }
}
