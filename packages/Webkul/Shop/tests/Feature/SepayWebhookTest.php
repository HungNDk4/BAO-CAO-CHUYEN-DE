<?php

use App\Services\SepayPaymentService;
use Webkul\Sales\Repositories\InvoiceRepository;
use Webkul\Sales\Repositories\OrderTransactionRepository;

it('rejects sepay webhook requests without a valid apikey', function () {
    config()->set('perfume_payment.sepay.api_token', 'secret-sepay-token');

    $this->postJson(route('shop.webhooks.sepay'), [
        'transferType' => 'in',
        'transferAmount' => 500000,
        'content' => 'DH100001',
    ])->assertUnauthorized();

    $this->withHeader('Authorization', 'Apikey wrong-token')
        ->postJson(route('shop.webhooks.sepay'), [
            'transferType' => 'in',
            'transferAmount' => 500000,
            'content' => 'DH100001',
        ])->assertUnauthorized();
});

it('accepts sepay webhook requests with a valid apikey and delegates to service', function () {
    config()->set('perfume_payment.sepay.api_token', 'secret-sepay-token');

    $mock = Mockery::mock(SepayPaymentService::class);
    $mock->shouldReceive('processWebhook')
        ->once()
        ->andReturn([
            'status' => 'processed',
            'order_id' => 10,
            'increment_id' => '100010',
            'invoice_id' => 20,
        ]);

    $this->app->instance(SepayPaymentService::class, $mock);

    $this->withHeader('Authorization', 'Apikey secret-sepay-token')
        ->postJson(route('shop.webhooks.sepay'), [
            'id' => 999,
            'transferType' => 'in',
            'transferAmount' => 1500000,
            'content' => 'Thanh toan don hang DH100010',
        ])
        ->assertOk()
        ->assertJson([
            'success' => true,
            'status' => 'processed',
            'increment_id' => '100010',
        ]);
});

it('blocks demo simulation route when allow_demo_simulation is disabled', function () {
    config()->set('perfume_payment.sepay.allow_demo_simulation', false);

    $this->post(route('shop.sepay.demo_simulate'), [
        'increment_id' => '100010',
    ])->assertNotFound();
});

it('extracts order increment id from transfer descriptions', function () {
    $service = new SepayPaymentService(
        Mockery::mock(InvoiceRepository::class),
        Mockery::mock(OrderTransactionRepository::class),
    );

    expect($service->extractOrderIncrementId('MBVCB.12345.DH000031.CT tu'))
        ->toBe('000031')
        ->and($service->extractOrderIncrementId('chuyen khoan dh100005'))
        ->toBe('100005')
        ->and($service->extractOrderIncrementId('chuyen tien mua nuoc hoa'))
        ->toBeNull();
});

it('accepts sepay gateway ipn requests with a valid x-secret-key', function () {
    config()->set('perfume_payment.sepay.gateway.secret_key', 'spsk_test_secret_123');
    config()->set('perfume_payment.sepay.gateway.ipn_secret_key', '');

    $mock = Mockery::mock(SepayPaymentService::class);
    $mock->shouldReceive('processWebhook')
        ->once()
        ->andReturn([
            'status' => 'processed',
            'order_id' => 15,
            'increment_id' => '133',
            'invoice_id' => 25,
        ]);

    $this->app->instance(SepayPaymentService::class, $mock);

    $this->withHeader('X-Secret-Key', 'spsk_test_secret_123')
        ->postJson(route('shop.webhooks.sepay'), [
            'notification_type' => 'ORDER_PAID',
            'order' => [
                'order_status' => 'CAPTURED',
                'order_amount' => '6950000.00',
                'order_invoice_number' => 'DH133',
            ],
            'transaction' => [
                'transaction_id' => 'PG_133',
                'transaction_status' => 'APPROVED',
            ],
        ])
        ->assertOk()
        ->assertJson([
            'success' => true,
            'status' => 'processed',
            'increment_id' => '133',
        ]);
});

it('signs gateway fields in exact sepay official sdk order', function () {
    $service = new SepayPaymentService(
        Mockery::mock(InvoiceRepository::class),
        Mockery::mock(OrderTransactionRepository::class),
    );

    $fields = [
        'merchant' => 'SP-TEST-123',
        'currency' => 'VND',
        'order_amount' => '50000',
        'operation' => 'PURCHASE',
        'order_description' => 'Test order',
        'order_invoice_number' => 'DH100',
    ];

    $expected = base64_encode(hash_hmac(
        'sha256',
        'merchant=SP-TEST-123,currency=VND,order_amount=50000,operation=PURCHASE,order_description=Test order,order_invoice_number=DH100',
        'secret_key_test',
        true
    ));

    expect($service->signGatewayFields($fields, 'secret_key_test'))->toBe($expected);
});

it('renders the english order tracking route', function () {
    $this->get(route('shop.order_tracking.index'))
        ->assertOk();
});
