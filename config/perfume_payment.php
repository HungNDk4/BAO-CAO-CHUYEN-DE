<?php

return [
    'bank_bin' => env('VIETQR_BANK_BIN', '970436'),
    'bank_name' => env('VIETQR_BANK_NAME', 'Ngân hàng TMCP (Placeholder - cập nhật trong .env)'),
    'account_number' => env('VIETQR_ACCOUNT_NUMBER', '000000000000'),
    'account_name' => env('VIETQR_ACCOUNT_NAME', 'CHU TAI KHOAN PLACEHOLDER'),

    'sepay' => [
        'api_token' => env('SEPAY_API_TOKEN', ''),
        'allow_demo_simulation' => filter_var(env('SEPAY_ALLOW_DEMO_SIMULATION', false), FILTER_VALIDATE_BOOL),
        'gateway' => [
            'environment' => env('SEPAY_ENV', 'sandbox'),
            'merchant_id' => env('SEPAY_MERCHANT_ID', ''),
            'secret_key' => env('SEPAY_SECRET_KEY', ''),
            'ipn_secret_key' => env('SEPAY_IPN_SECRET_KEY', ''),
            'checkout_url' => env('SEPAY_ENV', 'sandbox') === 'production'
                ? 'https://pay.sepay.vn/v1/checkout/init'
                : 'https://pay-sandbox.sepay.vn/v1/checkout/init',
        ],
    ],
];
