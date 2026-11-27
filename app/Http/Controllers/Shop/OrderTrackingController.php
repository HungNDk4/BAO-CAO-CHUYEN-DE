<?php

declare(strict_types=1);

namespace App\Http\Controllers\Shop;

use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller;
use Illuminate\View\View;
use Webkul\Sales\Repositories\OrderRepository;

/**
 * Guest order tracking controller with minimal PII exposure.
 */
class OrderTrackingController extends Controller
{
    public function __construct(
        protected OrderRepository $orderRepository
    ) {}

    /**
     * Show the guest order tracking form.
     */
    public function index(): View
    {
        return view('shop.order-tracking');
    }

    /**
     * Look up an order by increment_id and matching email or phone.
     */
    public function track(Request $request): View|RedirectResponse
    {
        $validated = $request->validate([
            'order_code' => ['required', 'string', 'max:64'],
            'contact' => ['required', 'string', 'max:191'],
        ]);

        $orderCode = ltrim(trim($validated['order_code']), '#');
        $contactRaw = trim($validated['contact']);

        $order = $this->orderRepository->with(['addresses', 'items', 'payment', 'shipments'])
            ->findOneByField('increment_id', $orderCode);

        if (! $order || ! $this->matchesContact($order, $contactRaw)) {
            return back()
                ->withInput()
                ->with('tracking_error', __('perfume.tracking.not_found'));
        }

        $trackingNumbers = $order->shipments
            ->pluck('track_number')
            ->filter()
            ->values()
            ->all();

        $phone = $order->shipping_address?->phone ?? $order->billing_address?->phone ?? '';

        $summary = [
            'increment_id' => $order->increment_id,
            'created_at' => $order->created_at?->format('d/m/Y H:i'),
            'status_label' => $order->status_label,
            'payment_title' => $order->payment?->method_title ?: ($order->payment?->method ?? '-'),
            'grand_total' => core()->formatPrice((float) $order->grand_total, $order->order_currency_code),
            'masked_phone' => $this->maskPhone((string) $phone),
            'tracking_numbers' => $trackingNumbers,
            'items' => $order->items->map(static fn ($item) => [
                'name' => $item->name,
                'qty' => (int) $item->qty_ordered,
                'total' => core()->formatPrice((float) $item->total, $order->order_currency_code),
            ])->all(),
        ];

        return view('shop.order-tracking', [
            'orderSummary' => $summary,
            'prefillCode' => $orderCode,
            'prefillContact' => $contactRaw,
        ]);
    }

    /**
     * Verify whether the input matches the order's email or phone.
     */
    private function matchesContact(object $order, string $contactRaw): bool
    {
        $lowerContact = strtolower($contactRaw);
        $orderEmail = strtolower(trim((string) $order->customer_email));

        if ($orderEmail !== '' && hash_equals($orderEmail, $lowerContact)) {
            return true;
        }

        $normalizedInput = $this->normalizePhone($contactRaw);
        if ($normalizedInput === '') {
            return false;
        }

        $phones = [
            $order->billing_address?->phone ?? '',
            $order->shipping_address?->phone ?? '',
        ];

        foreach ($phones as $phone) {
            $normalizedOrderPhone = $this->normalizePhone((string) $phone);
            if ($normalizedOrderPhone !== '' && hash_equals($normalizedOrderPhone, $normalizedInput)) {
                return true;
            }
        }

        return false;
    }

    /**
     * Normalize Vietnamese phone numbers (strip non-digits, +84 -> 0).
     */
    private function normalizePhone(string $phone): string
    {
        $digits = preg_replace('/\D+/', '', $phone) ?? '';
        if (str_starts_with($digits, '84') && strlen($digits) >= 11) {
            return '0'.substr($digits, 2);
        }

        return $digits;
    }

    /**
     * Mask phone number to expose only the last 3 digits.
     */
    private function maskPhone(string $phone): string
    {
        $digits = $this->normalizePhone($phone);
        if (strlen($digits) <= 3) {
            return '***';
        }

        return str_repeat('*', strlen($digits) - 3).substr($digits, -3);
    }
}
