<?php

return [
    'checkout' => [
        'cart' => [
            'integrity' => [
                'qty-missing' => 'Ít nhất một sản phẩm phải có số lượng lớn hơn 1.',
            ],
            'invalid-file-extension' => 'Phát hiện định dạng tệp không hợp lệ.',
            'inventory-warning' => 'Số lượng yêu cầu không khả dụng, vui lòng thử lại sau.',
            'missing-links' => 'Thiếu liên kết tải về cho sản phẩm này.',
            'missing-options' => 'Thiếu các tùy chọn cho sản phẩm này.',
            'selected-products-simple' => 'Sản phẩm được chọn phải thuộc loại sản phẩm đơn giản.',
        ],
    ],

    'datagrid' => [
        'copy-of-slug' => 'ban-sao-cua-:value',
        'copy-of' => 'Bản sao của :value',
        'variant-already-exist-message' => 'Biến thể với các tùy chọn thuộc tính này đã tồn tại.',
    ],

    'response' => [
        'product-can-not-be-copied' => 'Không thể sao chép sản phẩm thuộc loại :type',
    ],

    'sort-by' => [
        'options' => [
            'cheapest-first' => 'Giá thấp đến cao',
            'expensive-first' => 'Giá cao đến thấp',
            'from-a-z' => 'Từ A đến Z',
            'from-z-a' => 'Từ Z đến A',
            'latest-first' => 'Mới nhất trước',
            'oldest-first' => 'Cũ nhất trước',
        ],
    ],

    'type' => [
        'abstract' => [
            'offers' => 'Mua :qty với giá :price mỗi sản phẩm và tiết kiệm :discount',
        ],
        'bundle' => 'Gói sản phẩm (Bundle)',
        'booking' => 'Đặt chỗ (Booking)',
        'configurable' => 'Sản phẩm có biến thể (Configurable)',
        'downloadable' => 'Sản phẩm tải về (Downloadable)',
        'grouped' => 'Nhóm sản phẩm (Grouped)',
        'simple' => 'Sản phẩm đơn giản (Simple)',
        'virtual' => 'Sản phẩm ảo (Virtual)',
    ],
];
