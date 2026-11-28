<?php

declare(strict_types=1);

namespace App\Services;

use Illuminate\Support\Facades\DB;
use Webkul\Sales\Models\Order;
use Webkul\Sales\Repositories\InvoiceRepository;
use Webkul\Sales\Repositories\OrderTransactionRepository;

/**
 * Handle SePay webhook verification, order matching, and offline demo simulation.
 */
class SepayPaymentService
{
    /**
     * Create a new service instance.
     */
    public function __construct(
        protected InvoiceRepository $invoiceRepository,
        protected OrderTransactionRepository $orderTransactionRepository,
    ) {}

    /**
     * Extract the Bagisto order increment_id from a bank transfer description.
     */
    public function extractOrderIncrementId(string $content): ?string
    {
        if (preg_match('/\bDH([A-Za-z0-9]+)\b/i', $content, $matches) === 1) {
            return $matches[1];
        }

        return null;
    }

    /**
     * Check whether SePay Payment Gateway credentials are configured.
     */
    public function isGatewayConfigured(): bool
    {
        return (string) config('perfume_payment.sepay.gateway.merchant_id', '') !== ''
            && (string) config('perfume_payment.sepay.gateway.secret_key', '') !== '';
    }

    /**
     * Build signed form fields for SePay Payment Gateway checkout initialization.
     */
    public function buildGatewayCheckoutFields(Order $order): array
    {
        $merchantId = (string) config('perfume_payment.sepay.gateway.merchant_id', '');
        $secretKey = (string) config('perfume_payment.sepay.gateway.secret_key', '');
        $amount = (string) ((int) round((float) $order->grand_total));
        $invoiceNumber = 'DH'.$order->increment_id;

        $fields = [
            'merchant' => $merchantId,
            'currency' => 'VND',
            'order_amount' => $amount,
            'operation' => 'PURCHASE',
            'order_description' => 'Thanh toan don hang '.$order->increment_id,
            'payment_method' => 'BANK_TRANSFER',
            'order_invoice_number' => $invoiceNumber,
            'customer_id' => $order->customer_id ? (string) $order->customer_id : '',
            'success_url' => route('shop.sepay.gateway_return', ['status' => 'success', 'order' => $order->increment_id]),
            'error_url' => route('shop.sepay.gateway_return', ['status' => 'error', 'order' => $order->increment_id]),
            'cancel_url' => route('shop.sepay.gateway_return', ['status' => 'cancel', 'order' => $order->increment_id]),
        ];

        $fields = array_filter($fields, static fn ($value): bool => $value !== '' && $value !== null);

        $fields['signature'] = $this->signGatewayFields($fields, $secretKey);

        return $fields;
    }

    /**
     * Generate HMAC-SHA256 base64 signature matching SePay's official PHP SDK.
     */
    public function signGatewayFields(array $fields, string $secretKey): string
    {
        $allowedFields = [
            'merchant',
            'env',
            'operation',
            'payment_method',
            'order_amount',
            'currency',
            'order_invoice_number',
            'order_description',
            'customer_id',
            'agreement_id',
            'agreement_name',
            'agreement_type',
            'agreement_payment_frequency',
            'agreement_amount_per_payment',
            'success_url',
            'error_url',
            'cancel_url',
        ];

        $signed = [];

        foreach (array_keys($fields) as $field) {
            if (! in_array($field, $allowedFields, true) || ! isset($fields[$field])) {
                continue;
            }

            $signed[] = $field.'='.$fields[$field];
        }

        return base64_encode(hash_hmac('sha256', implode(',', $signed), $secretKey, true));
    }

    /**
     * Process an incoming SePay webhook or Payment Gateway IPN payload.
     */
    public function processWebhook(array $payload): array
    {
        if (strtoupper((string) ($payload['notification_type'] ?? '')) === 'ORDER_PAID') {
            return $this->processGatewayIpn($payload);
        }

        $transferType = strtolower((string) ($payload['transferType'] ?? ''));

        if ($transferType !== 'in') {
            return [
                'status' => 'ignored',
                'reason' => 'not_incoming_transfer',
            ];
        }

        $transferAmount = (float) ($payload['transferAmount'] ?? 0);

        if ($transferAmount <= 0) {
            return [
                'status' => 'ignored',
                'reason' => 'invalid_amount',
            ];
        }

        $content = (string) ($payload['content'] ?? '');
        $incrementId = $this->extractOrderIncrementId($content);

        if ($incrementId === null) {
            return [
                'status' => 'ignored',
                'reason' => 'order_code_not_found_in_content',
            ];
        }

        $transactionId = (string) ($payload['id'] ?? $payload['referenceCode'] ?? ('SEPAY-'.md5($content.'|'.$transferAmount)));

        return $this->confirmOrderPayment(
            $incrementId,
            $transferAmount,
            $transactionId,
            'sepay_webhook',
            $payload
        );
    }

    /**
     * Process SePay Payment Gateway IPN notification (ORDER_PAID).
     */
    protected function processGatewayIpn(array $payload): array
    {
        $orderData = is_array($payload['order'] ?? null) ? $payload['order'] : [];
        $transactionData = is_array($payload['transaction'] ?? null) ? $payload['transaction'] : [];

        $orderStatus = strtoupper((string) ($orderData['order_status'] ?? ''));
        $transactionStatus = strtoupper((string) ($transactionData['transaction_status'] ?? ''));

        if ($orderStatus !== 'CAPTURED' && $transactionStatus !== 'APPROVED') {
            return [
                'status' => 'ignored',
                'reason' => 'order_not_captured',
            ];
        }

        $invoiceNumber = trim((string) ($orderData['order_invoice_number'] ?? ''));
        $incrementId = $this->extractOrderIncrementId($invoiceNumber) ?? ($invoiceNumber !== '' ? $invoiceNumber : null);

        if ($incrementId === null) {
            return [
                'status' => 'ignored',
                'reason' => 'order_code_not_found_in_content',
            ];
        }

        $paidAmount = (float) ($orderData['order_amount'] ?? 0);

        if ($paidAmount <= 0) {
            return [
                'status' => 'ignored',
                'reason' => 'invalid_amount',
            ];
        }

        $transactionId = (string) ($transactionData['transaction_id'] ?? $transactionData['id'] ?? ('SEPAY-PG-'.md5($invoiceNumber.'|'.$paidAmount)));

        return $this->confirmOrderPayment(
            $incrementId,
            $paidAmount,
            $transactionId,
            'sepay_gateway_ipn',
            $payload
        );
    }

    /**
     * Simulate a successful SePay webhook payment for local offline demos.
     */
    public function simulateDemoPayment(string $incrementId): array
    {
        $transactionId = 'DEMO-SEPAY-'.$incrementId.'-'.time();

        return $this->confirmOrderPayment(
            $incrementId,
            null,
            $transactionId,
            'sepay_demo_simulation',
            ['simulated' => true]
        );
    }

    /**
     * Confirm order payment atomically using a pessimistic row lock on orders.
     */
    protected function confirmOrderPayment(
        string $incrementId,
        ?float $paidAmount,
        string $transactionId,
        string $source,
        array $rawPayload = []
    ): array {
        return DB::transaction(function () use ($incrementId, $paidAmount, $transactionId, $source, $rawPayload): array {
            /** @var Order|null $order */
            $order = Order::query()
                ->where('increment_id', $incrementId)
                ->lockForUpdate()
                ->first();

            if (! $order) {
                return [
                    'status' => 'ignored',
                    'reason' => 'order_not_found',
                ];
            }

            if ($order->payment?->method !== 'moneytransfer') {
                return [
                    'status' => 'ignored',
                    'reason' => 'invalid_payment_method',
                    'order_id' => $order->id,
                    'increment_id' => $order->increment_id,
                ];
            }

            if ($order->status === Order::STATUS_CANCELED) {
                return [
                    'status' => 'ignored',
                    'reason' => 'order_canceled',
                    'order_id' => $order->id,
                    'increment_id' => $order->increment_id,
                ];
            }

            $existingTransaction = $this->orderTransactionRepository->findOneWhere([
                'transaction_id' => $transactionId,
            ]);

            if ($existingTransaction || ! $order->canInvoice()) {
                return [
                    'status' => 'already_processed',
                    'order_id' => $order->id,
                    'increment_id' => $order->increment_id,
                ];
            }

            $expectedAmount = (int) round((float) $order->grand_total);

            if ($paidAmount !== null && $paidAmount < $expectedAmount) {
                return [
                    'status' => 'ignored',
                    'reason' => 'insufficient_amount',
                    'order_id' => $order->id,
                    'increment_id' => $order->increment_id,
                ];
            }

            $invoiceItems = [];

            foreach ($order->items as $item) {
                if ($item->qty_to_invoice > 0) {
                    $invoiceItems[$item->id] = $item->qty_to_invoice;
                }
            }

            if ($invoiceItems === []) {
                return [
                    'status' => 'already_processed',
                    'order_id' => $order->id,
                    'increment_id' => $order->increment_id,
                ];
            }

            $invoice = $this->invoiceRepository->create([
                'order_id' => $order->id,
                'invoice' => [
                    'items' => $invoiceItems,
                ],
            ]);

            $this->orderTransactionRepository->create([
                'transaction_id' => $transactionId,
                'status' => 'paid',
                'type' => $source,
                'amount' => $paidAmount ?? (float) $order->grand_total,
                'payment_method' => 'moneytransfer',
                'data' => json_encode($rawPayload, JSON_UNESCAPED_UNICODE) ?: '{}',
                'invoice_id' => $invoice->id,
                'order_id' => $order->id,
            ]);

            return [
                'status' => 'processed',
                'order_id' => $order->id,
                'increment_id' => $order->increment_id,
                'invoice_id' => $invoice->id,
            ];
        });
    }
}
