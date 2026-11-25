<?php

/**
 * Perfume Store - Scattered Orders Seeder for Bagisto 2.4.x
 *
 * Usage:
 *   php tools/seed_scattered_orders.php [count=30] [end_date=YYYY-MM-DD|today|december] [--clean]
 *
 * Examples:
 *   php tools/seed_scattered_orders.php
 *   php tools/seed_scattered_orders.php 30 2026-12-25 --clean
 *   php tools/seed_scattered_orders.php 30 today --clean
 */

require __DIR__.'/../vendor/autoload.php';
$app = require_once __DIR__.'/../bootstrap/app.php';
$kernel = $app->make(Kernel::class);
$kernel->bootstrap();

use Illuminate\Contracts\Console\Kernel;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

echo '======================================================================'.PHP_EOL;
echo '  BAGISTO 2.4 - PERFUME STORE: ORDER SCATTERING SEEDER               '.PHP_EOL;
echo '======================================================================'.PHP_EOL;

// Parse CLI arguments
$args = array_slice($argv, 1);
$count = 30;
$endDateStr = Carbon::now()->format('Y-m-d'); // Default to today so Admin Dashboard displays all 30 days immediately
$clean = true; // Default clean to ensure consistent 30 mock orders

foreach ($args as $arg) {
    if ($arg === '--clean') {
        $clean = true;
    } elseif ($arg === '--append') {
        $clean = false;
    } elseif (is_numeric($arg)) {
        $count = (int) $arg;
    } elseif ($arg === 'today') {
        $endDateStr = Carbon::now()->format('Y-m-d');
    } elseif ($arg === 'december') {
        $endDateStr = '2026-12-25';
    } elseif (preg_match('/^\d{4}-\d{2}-\d{2}$/', $arg)) {
        $endDateStr = $arg;
    }
}

$endDate = Carbon::parse($endDateStr)->endOfDay();
$startDate = (clone $endDate)->subDays(30)->startOfDay();

echo "-> Target Orders Count : {$count}".PHP_EOL;
echo "-> Date Window         : {$startDate->format('d/m/Y H:i:s')} ---> {$endDate->format('d/m/Y H:i:s')}".PHP_EOL;
echo '-> Clean previous mock : '.($clean ? 'YES (--clean active)' : 'NO (Append mode)').PHP_EOL;
echo '----------------------------------------------------------------------'.PHP_EOL;

DB::beginTransaction();

try {
    if ($clean) {
        echo '-> Cleaning existing mock orders (with mock increment_ids or IDs >= 7)...'.PHP_EOL;
        // Keep initial test orders if any, or remove mock orders
        $orderIdsToDelete = DB::table('orders')->where('id', '>', 6)->pluck('id')->toArray();
        if (! empty($orderIdsToDelete)) {
            DB::table('shipment_items')->whereIn('shipment_id', function ($q) use ($orderIdsToDelete) {
                $q->select('id')->from('shipments')->whereIn('order_id', $orderIdsToDelete);
            })->delete();
            DB::table('shipments')->whereIn('order_id', $orderIdsToDelete)->delete();

            DB::table('invoice_items')->whereIn('invoice_id', function ($q) use ($orderIdsToDelete) {
                $q->select('id')->from('invoices')->whereIn('order_id', $orderIdsToDelete);
            })->delete();
            DB::table('invoices')->whereIn('order_id', $orderIdsToDelete)->delete();

            DB::table('order_transactions')->whereIn('order_id', $orderIdsToDelete)->delete();
            DB::table('order_payment')->whereIn('order_id', $orderIdsToDelete)->delete();
            DB::table('order_items')->whereIn('order_id', $orderIdsToDelete)->delete();
            DB::table('addresses')->whereIn('order_id', $orderIdsToDelete)->delete();
            DB::table('orders')->whereIn('id', $orderIdsToDelete)->delete();

            echo '   Cleaned '.count($orderIdsToDelete).' previous mock orders.'.PHP_EOL;
        }
    }

    // 1. Ensure 5 Vietnamese customers exist
    $vnCustomers = [
        [
            'first_name' => 'Hùng',
            'last_name' => 'Nguyễn',
            'email' => 'nguyen.hung.perfume@gmail.com',
            'phone' => '0903123456',
            'gender' => 'Male',
        ],
        [
            'first_name' => 'Mai',
            'last_name' => 'Trần Thị',
            'email' => 'tran.thi.mai.vn@gmail.com',
            'phone' => '0912345678',
            'gender' => 'Female',
        ],
        [
            'first_name' => 'Long',
            'last_name' => 'Lê Hoàng',
            'email' => 'le.hoang.long.perfume@gmail.com',
            'phone' => '0987654321',
            'gender' => 'Male',
        ],
        [
            'first_name' => 'Thảo',
            'last_name' => 'Phạm Thu',
            'email' => 'pham.thu.thao.vn@gmail.com',
            'phone' => '0978112233',
            'gender' => 'Female',
        ],
        [
            'first_name' => 'Tuấn',
            'last_name' => 'Đặng Minh',
            'email' => 'dang.minh.tuan.perfume@gmail.com',
            'phone' => '0898556677',
            'gender' => 'Male',
        ],
    ];

    $customerIds = [];
    foreach ($vnCustomers as $vc) {
        $existing = DB::table('customers')->where('email', $vc['email'])->first();
        if (! $existing) {
            $cid = DB::table('customers')->insertGetId([
                'first_name' => $vc['first_name'],
                'last_name' => $vc['last_name'],
                'email' => $vc['email'],
                'phone' => $vc['phone'],
                'gender' => $vc['gender'],
                'date_of_birth' => '1995-05-15',
                'status' => 1,
                'password' => Hash::make('Admin123@'),
                'customer_group_id' => 2,
                'channel_id' => 1,
                'is_verified' => 1,
                'subscribed_to_news_letter' => 1,
                'created_at' => Carbon::now()->subDays(45),
                'updated_at' => Carbon::now()->subDays(45),
            ]);
            $customerIds[] = $cid;
        } else {
            $customerIds[] = $existing->id;
        }
    }
    echo '-> Registered Vietnamese Customers ready : '.count($customerIds).' customers'.PHP_EOL;

    // 2. Load active Vietnamese perfume products
    $perfumes = DB::table('product_flat')
        ->where('locale', 'vi')
        ->where('sku', 'like', 'PERFUME-%')
        ->where('price', '>', 0)
        ->select('product_id', 'sku', 'name', 'price', 'weight')
        ->get();

    if ($perfumes->isEmpty()) {
        throw new Exception('No Vietnamese perfume products found in product_flat!');
    }
    echo '-> Perfume catalog pool loaded           : '.$perfumes->count().' products'.PHP_EOL;

    // Vietnamese locations pool
    $vnLocations = [
        ['address' => '72 Lê Thánh Tôn, Bến Nghé', 'city' => 'Quận 1', 'state' => 'TP. Hồ Chí Minh', 'postcode' => '700000'],
        ['address' => '15 Tràng Tiền, Hoàn Kiếm', 'city' => 'Quận Hoàn Kiếm', 'state' => 'Hà Nội', 'postcode' => '100000'],
        ['address' => '128 Nguyễn Thị Minh Khai, Phường 6', 'city' => 'Quận 3', 'state' => 'TP. Hồ Chí Minh', 'postcode' => '700000'],
        ['address' => '45 Lê Duẩn, Thạch Thang', 'city' => 'Quận Hải Châu', 'state' => 'Đà Nẵng', 'postcode' => '550000'],
        ['address' => '88 Nguyễn Huệ, Bến Nghé', 'city' => 'Quận 1', 'state' => 'TP. Hồ Chí Minh', 'postcode' => '700000'],
        ['address' => '24 Lý Thường Kiệt, Hàng Bài', 'city' => 'Quận Hoàn Kiếm', 'state' => 'Hà Nội', 'postcode' => '100000'],
        ['address' => '102 Trần Phú, Ninh Kiều', 'city' => 'Quận Ninh Kiều', 'state' => 'Cần Thơ', 'postcode' => '900000'],
        ['address' => '56 Hai Bà Trưng, Bến Nghé', 'city' => 'Quận 1', 'state' => 'TP. Hồ Chí Minh', 'postcode' => '700000'],
        ['address' => '19 Pasteur, Phường 4', 'city' => 'TP. Vũng Tàu', 'state' => 'Bà Rịa - Vũng Tàu', 'postcode' => '790000'],
        ['address' => '32 Hoàng Hoa Thám, Lộc Thọ', 'city' => 'TP. Nha Trang', 'state' => 'Khánh Hòa', 'postcode' => '650000'],
        ['address' => '90 Hùng Vương, Phú Nhuận', 'city' => 'TP. Huế', 'state' => 'Thừa Thiên Huế', 'postcode' => '530000'],
        ['address' => '14 Cầu Đất, Cầu Đất', 'city' => 'Quận Ngô Quyền', 'state' => 'Hải Phòng', 'postcode' => '180000'],
        ['address' => '235 Đại lộ Bình Dương', 'city' => 'TP. Thủ Dầu Một', 'state' => 'Bình Dương', 'postcode' => '820000'],
    ];

    // Status distribution: completed: ~53%, processing: ~27%, pending: ~13%, canceled: ~7%
    $statusPool = [];
    $completedCount = (int) round($count * 0.53);
    $processingCount = (int) round($count * 0.27);
    $pendingCount = (int) round($count * 0.13);
    $canceledCount = max(1, $count - ($completedCount + $processingCount + $pendingCount));

    for ($i = 0; $i < $completedCount; $i++) {
        $statusPool[] = 'completed';
    }
    for ($i = 0; $i < $processingCount; $i++) {
        $statusPool[] = 'processing';
    }
    for ($i = 0; $i < $pendingCount; $i++) {
        $statusPool[] = 'pending';
    }
    for ($i = 0; $i < $canceledCount; $i++) {
        $statusPool[] = 'canceled';
    }
    shuffle($statusPool);

    // Timeline distribution: calculate step between dates
    $totalSeconds = abs($endDate->diffInSeconds($startDate));
    $stepSeconds = (int) ($totalSeconds / max(1, $count));

    $maxCurrentOrderId = (int) (DB::table('orders')->max('id') ?? 0);
    $nextIncrementId = $maxCurrentOrderId + 1;

    $createdOrders = 0;
    $totalRevenue = 0;

    echo "-> Generating {$count} orders evenly distributed across 30 days...".PHP_EOL;

    for ($idx = 0; $idx < $count; $idx++) {
        $status = $statusPool[$idx];
        // Distribute 1 order per day across 30 days
        $dayIndex = (int) floor(($idx / max(1, $count)) * 30);
        $orderCreatedAt = (clone $startDate)->addDays($dayIndex)->setTime(rand(8, 21), rand(0, 59), rand(0, 59));

        // Ensure within bounds and not exceeding current time if ending today
        if ($orderCreatedAt->gt($endDate)) {
            $orderCreatedAt = (clone $endDate)->subMinutes(rand(10, 180));
        }
        if ($endDateStr === Carbon::now()->format('Y-m-d') && $orderCreatedAt->gt(Carbon::now())) {
            $orderCreatedAt = Carbon::now()->subMinutes(rand(10, 180));
        }
        $orderUpdatedAt = (clone $orderCreatedAt)->addMinutes(rand(15, 120));

        // Customer selection: 60% registered customer, 40% guest checkout
        $isGuest = (rand(1, 100) > 60) ? 1 : 0;
        $loc = $vnLocations[array_rand($vnLocations)];

        if ($isGuest) {
            $guestNames = [
                ['first' => 'Minh', 'last' => 'Hoàng', 'email' => 'minh.hoang.guest'.rand(10, 99).'@gmail.com', 'phone' => '093'.rand(1000000, 9999999)],
                ['first' => 'Hương', 'last' => 'Ngô Ngọc', 'email' => 'huong.ngo.guest'.rand(10, 99).'@gmail.com', 'phone' => '094'.rand(1000000, 9999999)],
                ['first' => 'Quân', 'last' => 'Đỗ Anh', 'email' => 'quan.do.guest'.rand(10, 99).'@gmail.com', 'phone' => '096'.rand(1000000, 9999999)],
                ['first' => 'Trang', 'last' => 'Bùi Huyền', 'email' => 'trang.bui.guest'.rand(10, 99).'@gmail.com', 'phone' => '097'.rand(1000000, 9999999)],
                ['first' => 'Đức', 'last' => 'Phan Trọng', 'email' => 'duc.phan.guest'.rand(10, 99).'@gmail.com', 'phone' => '098'.rand(1000000, 9999999)],
                ['first' => 'Lan', 'last' => 'Võ Thị', 'email' => 'lan.vo.guest'.rand(10, 99).'@gmail.com', 'phone' => '091'.rand(1000000, 9999999)],
            ];
            $g = $guestNames[array_rand($guestNames)];
            $cId = null;
            $cType = null;
            $cFirstName = $g['first'];
            $cLastName = $g['last'];
            $cEmail = $g['email'];
            $cPhone = $g['phone'];
        } else {
            $regId = $customerIds[array_rand($customerIds)];
            $regCust = DB::table('customers')->where('id', $regId)->first();
            $cId = $regCust->id;
            $cType = 'Webkul\\Customer\\Models\\Customer';
            $cFirstName = $regCust->first_name;
            $cLastName = $regCust->last_name;
            $cEmail = $regCust->email;
            $cPhone = $regCust->phone;
        }

        // Items selection: 1 to 3 random perfumes
        $numItems = (rand(1, 100) <= 65) ? 1 : ((rand(1, 100) <= 85) ? 2 : 3);
        $orderPerfumes = $perfumes->random($numItems);

        $subTotal = 0;
        $totalQty = 0;
        $totalWeight = 0;
        $orderItemsData = [];

        foreach ($orderPerfumes as $p) {
            $itemQty = (rand(1, 100) <= 85) ? 1 : 2;
            $itemPrice = (float) $p->price;
            $itemTotal = $itemPrice * $itemQty;
            $itemWeight = (float) ($p->weight ?? 1.0);

            $subTotal += $itemTotal;
            $totalQty += $itemQty;
            $totalWeight += ($itemWeight * $itemQty);

            $orderItemsData[] = [
                'product_id' => $p->product_id,
                'sku' => $p->sku,
                'name' => $p->name,
                'price' => $itemPrice,
                'weight' => $itemWeight,
                'qty' => $itemQty,
                'total' => $itemTotal,
            ];
        }

        // Coupon application: 25% apply NUOCHOA10
        $couponCode = null;
        $discountAmount = 0;
        $discountPercent = 0;
        $appliedCartRuleIds = null;

        if (rand(1, 100) <= 25) {
            $couponCode = 'NUOCHOA10';
            $discountPercent = 10;
            $discountAmount = round($subTotal * 0.10);
            $appliedCartRuleIds = '1';
        }

        // Shipping fee: 30,000 VND unless subTotal >= 1,000,000 VND
        $shippingAmount = ($subTotal >= 1000000) ? 0 : 30000;
        $grandTotal = max(0, $subTotal - $discountAmount + $shippingAmount);

        // Payment method: 60% cashondelivery, 40% moneytransfer
        $payMethod = (rand(1, 100) <= 60) ? 'cashondelivery' : 'moneytransfer';
        $payTitle = ($payMethod === 'cashondelivery')
            ? 'Thanh toán tiền mặt khi nhận hàng (COD)'
            : 'Chuyển khoản liên ngân hàng (Vietcombank / MB Bank QR)';

        // Invoicing & shipping flags
        $isInvoiced = in_array($status, ['processing', 'completed']);
        $isShipped = ($status === 'completed');

        // Insert Order
        $orderId = DB::table('orders')->insertGetId([
            'increment_id' => (string) $nextIncrementId,
            'status' => $status,
            'channel_name' => 'Default',
            'is_guest' => $isGuest,
            'customer_email' => $cEmail,
            'customer_first_name' => $cFirstName,
            'customer_last_name' => $cLastName,
            'shipping_method' => 'flatrate_flatrate',
            'shipping_title' => 'Giao hàng tiêu chuẩn (Toàn quốc, 2 - 3 ngày)',
            'shipping_description' => 'Đóng gói hộp carton cao cấp kèm bóng khí chống sốc bảo vệ chai nước hoa.',
            'coupon_code' => $couponCode,
            'is_gift' => 0,
            'total_item_count' => count($orderItemsData),
            'total_qty_ordered' => $totalQty,
            'base_currency_code' => 'VND',
            'channel_currency_code' => 'VND',
            'order_currency_code' => 'VND',
            'grand_total' => $grandTotal,
            'base_grand_total' => $grandTotal,
            'grand_total_invoiced' => $isInvoiced ? $grandTotal : 0,
            'base_grand_total_invoiced' => $isInvoiced ? $grandTotal : 0,
            'grand_total_refunded' => 0,
            'base_grand_total_refunded' => 0,
            'sub_total' => $subTotal,
            'base_sub_total' => $subTotal,
            'sub_total_invoiced' => $isInvoiced ? $subTotal : 0,
            'base_sub_total_invoiced' => $isInvoiced ? $subTotal : 0,
            'sub_total_refunded' => 0,
            'base_sub_total_refunded' => 0,
            'discount_percent' => $discountPercent,
            'discount_amount' => $discountAmount,
            'base_discount_amount' => $discountAmount,
            'discount_invoiced' => $isInvoiced ? $discountAmount : 0,
            'base_discount_invoiced' => $isInvoiced ? $discountAmount : 0,
            'discount_refunded' => 0,
            'base_discount_refunded' => 0,
            'tax_amount' => 0,
            'base_tax_amount' => 0,
            'tax_amount_invoiced' => 0,
            'base_tax_amount_invoiced' => 0,
            'tax_amount_refunded' => 0,
            'base_tax_amount_refunded' => 0,
            'shipping_amount' => $shippingAmount,
            'base_shipping_amount' => $shippingAmount,
            'shipping_invoiced' => $isInvoiced ? $shippingAmount : 0,
            'base_shipping_invoiced' => $isInvoiced ? $shippingAmount : 0,
            'shipping_refunded' => 0,
            'base_shipping_refunded' => 0,
            'shipping_discount_amount' => 0,
            'base_shipping_discount_amount' => 0,
            'shipping_tax_amount' => 0,
            'base_shipping_tax_amount' => 0,
            'shipping_tax_refunded' => 0,
            'base_shipping_tax_refunded' => 0,
            'sub_total_incl_tax' => $subTotal,
            'base_sub_total_incl_tax' => $subTotal,
            'shipping_amount_incl_tax' => $shippingAmount,
            'base_shipping_amount_incl_tax' => $shippingAmount,
            'customer_id' => $cId,
            'customer_type' => $cType,
            'channel_id' => 1,
            'channel_type' => 'Webkul\\Core\\Models\\Channel',
            'cart_id' => null,
            'applied_cart_rule_ids' => $appliedCartRuleIds,
            'created_at' => $orderCreatedAt,
            'updated_at' => $orderUpdatedAt,
        ]);

        $nextIncrementId++;

        // Insert Order Items
        $insertedItemIds = [];
        foreach ($orderItemsData as $item) {
            $itemDiscount = ($discountPercent > 0) ? round($item['total'] * 0.10) : 0;
            $qtyShipped = $isShipped ? $item['qty'] : 0;
            $qtyInvoiced = $isInvoiced ? $item['qty'] : 0;
            $qtyCanceled = ($status === 'canceled') ? $item['qty'] : 0;

            $itemId = DB::table('order_items')->insertGetId([
                'sku' => $item['sku'],
                'type' => 'simple',
                'name' => $item['name'],
                'coupon_code' => $couponCode,
                'weight' => $item['weight'],
                'total_weight' => $item['weight'] * $item['qty'],
                'qty_ordered' => $item['qty'],
                'qty_shipped' => $qtyShipped,
                'qty_invoiced' => $qtyInvoiced,
                'qty_canceled' => $qtyCanceled,
                'qty_refunded' => 0,
                'price' => $item['price'],
                'base_price' => $item['price'],
                'total' => $item['total'],
                'base_total' => $item['total'],
                'total_invoiced' => $isInvoiced ? $item['total'] : 0,
                'base_total_invoiced' => $isInvoiced ? $item['total'] : 0,
                'amount_refunded' => 0,
                'base_amount_refunded' => 0,
                'discount_percent' => $discountPercent,
                'discount_amount' => $itemDiscount,
                'base_discount_amount' => $itemDiscount,
                'discount_invoiced' => $isInvoiced ? $itemDiscount : 0,
                'base_discount_invoiced' => $isInvoiced ? $itemDiscount : 0,
                'discount_refunded' => 0,
                'base_discount_refunded' => 0,
                'tax_percent' => 0,
                'tax_amount' => 0,
                'base_tax_amount' => 0,
                'tax_amount_invoiced' => 0,
                'base_tax_amount_invoiced' => 0,
                'tax_amount_refunded' => 0,
                'base_tax_amount_refunded' => 0,
                'price_incl_tax' => $item['price'],
                'base_price_incl_tax' => $item['price'],
                'total_incl_tax' => $item['total'],
                'base_total_incl_tax' => $item['total'],
                'product_id' => $item['product_id'],
                'product_type' => 'Webkul\\Product\\Models\\Product',
                'order_id' => $orderId,
                'tax_category_id' => null,
                'parent_id' => null,
                'additional' => json_encode(['locale' => 'vi', 'quantity' => $item['qty'], 'product_id' => $item['product_id']]),
                'rma_return_period' => null,
                'created_at' => $orderCreatedAt,
                'updated_at' => $orderUpdatedAt,
            ]);

            $insertedItemIds[] = [
                'order_item_id' => $itemId,
                'product_id' => $item['product_id'],
                'sku' => $item['sku'],
                'name' => $item['name'],
                'qty' => $item['qty'],
                'price' => $item['price'],
                'total' => $item['total'],
                'weight' => $item['weight'],
                'discount_amount' => $itemDiscount,
            ];
        }

        // Insert Addresses (shipping and billing)
        $shippingAddressId = DB::table('addresses')->insertGetId([
            'address_type' => 'order_shipping',
            'parent_address_id' => null,
            'customer_id' => $cId,
            'cart_id' => null,
            'order_id' => $orderId,
            'first_name' => $cFirstName,
            'last_name' => $cLastName,
            'gender' => null,
            'company_name' => null,
            'address' => $loc['address'],
            'city' => $loc['city'],
            'state' => $loc['state'],
            'country' => 'VN',
            'postcode' => $loc['postcode'],
            'email' => $cEmail,
            'phone' => $cPhone,
            'vat_id' => null,
            'default_address' => 0,
            'use_for_shipping' => 0,
            'additional' => null,
            'created_at' => $orderCreatedAt,
            'updated_at' => $orderUpdatedAt,
        ]);

        DB::table('addresses')->insert([
            'address_type' => 'order_billing',
            'parent_address_id' => null,
            'customer_id' => $cId,
            'cart_id' => null,
            'order_id' => $orderId,
            'first_name' => $cFirstName,
            'last_name' => $cLastName,
            'gender' => null,
            'company_name' => null,
            'address' => $loc['address'],
            'city' => $loc['city'],
            'state' => $loc['state'],
            'country' => 'VN',
            'postcode' => $loc['postcode'],
            'email' => $cEmail,
            'phone' => $cPhone,
            'vat_id' => null,
            'default_address' => 0,
            'use_for_shipping' => 0,
            'additional' => null,
            'created_at' => $orderCreatedAt,
            'updated_at' => $orderUpdatedAt,
        ]);

        // Insert Order Payment
        DB::table('order_payment')->insert([
            'order_id' => $orderId,
            'method' => $payMethod,
            'method_title' => $payTitle,
            'additional' => null,
            'created_at' => $orderCreatedAt,
            'updated_at' => $orderUpdatedAt,
        ]);

        // Invoices (for processing & completed)
        $invoiceId = null;
        if ($isInvoiced) {
            $invoiceIncrementId = (string) (DB::table('invoices')->max('id') + 1);
            $invoiceCreatedAt = (clone $orderCreatedAt)->addMinutes(rand(5, 30));

            $invoiceId = DB::table('invoices')->insertGetId([
                'increment_id' => $invoiceIncrementId,
                'state' => 'paid',
                'email_sent' => 1,
                'total_qty' => $totalQty,
                'base_currency_code' => 'VND',
                'channel_currency_code' => 'VND',
                'order_currency_code' => 'VND',
                'sub_total' => $subTotal,
                'base_sub_total' => $subTotal,
                'grand_total' => $grandTotal,
                'base_grand_total' => $grandTotal,
                'shipping_amount' => $shippingAmount,
                'base_shipping_amount' => $shippingAmount,
                'tax_amount' => 0,
                'base_tax_amount' => 0,
                'discount_amount' => $discountAmount,
                'base_discount_amount' => $discountAmount,
                'shipping_tax_amount' => 0,
                'base_shipping_tax_amount' => 0,
                'sub_total_incl_tax' => $subTotal,
                'base_sub_total_incl_tax' => $subTotal,
                'shipping_amount_incl_tax' => $shippingAmount,
                'base_shipping_amount_incl_tax' => $shippingAmount,
                'order_id' => $orderId,
                'transaction_id' => null,
                'reminders' => 0,
                'next_reminder_at' => null,
                'created_at' => $invoiceCreatedAt,
                'updated_at' => $invoiceCreatedAt,
            ]);

            foreach ($insertedItemIds as $item) {
                DB::table('invoice_items')->insert([
                    'parent_id' => null,
                    'name' => $item['name'],
                    'description' => null,
                    'sku' => $item['sku'],
                    'qty' => $item['qty'],
                    'price' => $item['price'],
                    'base_price' => $item['price'],
                    'total' => $item['total'],
                    'base_total' => $item['total'],
                    'tax_amount' => 0,
                    'base_tax_amount' => 0,
                    'discount_percent' => $discountPercent,
                    'discount_amount' => $item['discount_amount'],
                    'base_discount_amount' => $item['discount_amount'],
                    'price_incl_tax' => $item['price'],
                    'base_price_incl_tax' => $item['price'],
                    'total_incl_tax' => $item['total'],
                    'base_total_incl_tax' => $item['total'],
                    'product_id' => $item['product_id'],
                    'product_type' => 'Webkul\\Product\\Models\\Product',
                    'order_item_id' => $item['order_item_id'],
                    'invoice_id' => $invoiceId,
                    'additional' => json_encode(['locale' => 'vi', 'quantity' => $item['qty'], 'product_id' => $item['product_id']]),
                    'created_at' => $invoiceCreatedAt,
                    'updated_at' => $invoiceCreatedAt,
                ]);
            }
        }

        // Shipments (for completed orders)
        if ($isShipped) {
            $shipmentCreatedAt = (clone $orderCreatedAt)->addHours(rand(2, 24));
            $carrierPrefix = (rand(1, 100) <= 50) ? 'VNP' : 'GHN';
            $trackNumber = $carrierPrefix.rand(10000000, 99999999).'VN';

            $shipmentId = DB::table('shipments')->insertGetId([
                'status' => null,
                'total_qty' => $totalQty,
                'total_weight' => $totalWeight,
                'carrier_code' => 'flatrate',
                'carrier_title' => 'Giao hàng tiêu chuẩn (Toàn quốc, 2 - 3 ngày)',
                'track_number' => $trackNumber,
                'email_sent' => 1,
                'customer_id' => $cId,
                'customer_type' => $cType,
                'order_id' => $orderId,
                'order_address_id' => $shippingAddressId,
                'inventory_source_id' => 1,
                'inventory_source_name' => 'Default',
                'created_at' => $shipmentCreatedAt,
                'updated_at' => $shipmentCreatedAt,
            ]);

            foreach ($insertedItemIds as $item) {
                DB::table('shipment_items')->insert([
                    'name' => $item['name'],
                    'description' => null,
                    'sku' => $item['sku'],
                    'qty' => $item['qty'],
                    'weight' => $item['weight'],
                    'price' => $item['price'],
                    'base_price' => $item['price'],
                    'total' => $item['total'],
                    'base_total' => $item['total'],
                    'price_incl_tax' => $item['price'],
                    'base_price_incl_tax' => $item['price'],
                    'product_id' => $item['product_id'],
                    'product_type' => 'Webkul\\Product\\Models\\Product',
                    'order_item_id' => $item['order_item_id'],
                    'shipment_id' => $shipmentId,
                    'additional' => json_encode(['locale' => 'vi', 'quantity' => $item['qty'], 'product_id' => $item['product_id']]),
                    'created_at' => $shipmentCreatedAt,
                    'updated_at' => $shipmentCreatedAt,
                ]);
            }
        }

        // Transactions (for completed or paid orders)
        if ($isInvoiced) {
            DB::table('order_transactions')->insert([
                'transaction_id' => 'TXN-'.strtoupper(Str::random(12)),
                'status' => 'paid',
                'type' => $payMethod,
                'amount' => $grandTotal,
                'payment_method' => $payMethod,
                'data' => null,
                'invoice_id' => $invoiceId,
                'order_id' => $orderId,
                'created_at' => $orderCreatedAt,
                'updated_at' => $orderUpdatedAt,
            ]);
        }

        $createdOrders++;
        if ($status !== 'canceled') {
            $totalRevenue += $grandTotal;
        }
    }

    DB::commit();

    echo '======================================================================'.PHP_EOL;
    echo '  SEEDING COMPLETED SUCCESSFULLY!                                     '.PHP_EOL;
    echo '======================================================================'.PHP_EOL;
    echo "-> Total Orders Created : {$createdOrders}".PHP_EOL;
    echo "   - Completed          : {$completedCount} (Invoiced & Shipped with tracking code)".PHP_EOL;
    echo "   - Processing         : {$processingCount} (Invoiced, preparing in warehouse)".PHP_EOL;
    echo "   - Pending            : {$pendingCount} (Awaiting bank transfer / COD confirm)".PHP_EOL;
    echo "   - Canceled           : {$canceledCount} (Customer canceled)".PHP_EOL;
    echo '-> Estimated Revenue    : '.number_format($totalRevenue, 0, ',', '.').' ₫'.PHP_EOL;
    echo "-> Date Range           : {$startDate->format('d/m/Y')} to {$endDate->format('d/m/Y')}".PHP_EOL;
    echo '----------------------------------------------------------------------'.PHP_EOL;

} catch (Exception $e) {
    DB::rollBack();
    echo 'ERROR during order seeding: '.$e->getMessage().PHP_EOL;
    echo $e->getTraceAsString().PHP_EOL;
    exit(1);
}
