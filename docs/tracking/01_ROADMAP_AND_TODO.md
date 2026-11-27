# 01_ROADMAP_AND_TODO.md — Lộ Trình Triển Khai & Checklist Chi Tiết

> **Trạng thái cập nhật:** Ngày 23/11/2026  
> **Ký hiệu:**  
> - `[x]` : Đã hoàn thành và kiểm chứng thành công.  
> - `[ ]` : Đang chờ thực hiện theo lộ trình.

---

## Giai Đoạn 0: Bảo Toàn Hiện Trạng & Bản Địa Hóa 100% Tiếng Việt (ĐÃ HOÀN THÀNH)

- [x] **0.1 Sao lưu CSDL gốc:** Đã xuất file backup an toàn trước khi chuyển đổi (`mockdata/backup_before_perfume.sql`).
- [x] **0.2 Sao lưu kho ảnh cũ:** Nén toàn bộ ảnh sản phẩm demo cũ (`mockdata/storage_app_public_backup.zip`).
- [x] **0.3 Bản địa hóa Storefront (`packages/Webkul/Shop/`):** Hoàn thành dịch 1.319 key sang tiếng Việt chuẩn thương mại điện tử, đồng bộ sang `lang/vendor/shop/vi/app.php`.
- [x] **0.4 Bản địa hóa Bảng quản trị (`packages/Webkul/Admin/`):** Hoàn thành dịch toàn bộ 4.496 key (Sidebar, Widgets, Notifications, Orders, RMA, Catalog, Marketing, Configuration...), đồng bộ sang `lang/vendor/admin/vi/app.php`.
- [x] **0.5 Bản địa hóa các gói vệ tinh & Thư mục gốc:** 
  - `packages/Webkul/Product/` (24 key sort options: *Giá cao/thấp, Từ A-Z, Mới/Cũ nhất*).
  - `packages/Webkul/Customer/`, `Attribute/`, `Core/`.
  - Thư mục gốc `lang/vi/` (*auth.php, validation.php, pagination.php, passwords.php*).
- [x] **0.6 Khắc phục triệt để các lỗi kỹ thuật phát sinh:**
  - Sửa lỗi Vue compiler `SyntaxError: missing ) after argument list` do dấu quote trong template Mega Search.
  - Sửa lỗi `UnhandledMatchError` tiền tệ VNĐ trong `CurrencyFormatter.php` (chuẩn hóa `right_with_space`, ký hiệu `₫`).
  - Thêm type hint cho Channel trong footer Blade tắt cảnh báo Intelephense.
- [x] **0.7 Tự động hóa vận hành Windows (`setup.bat`):** Script tự copy đồng bộ ảnh từ `storage/app/public/` sang `public/storage/`, dọn cache với 1 click.
- [x] **0.8 Quản trị Git & GitHub:** Cập nhật `.gitignore` (loại bỏ `mockdata/*.sql`, `mockdata/*.zip`, `picturetemplate/`), tạo nhánh `feature/vietnamese-localization` và push thành công lên GitHub remote.

---

## Giai Đoạn 1: Bảo Toàn Hiện Trạng & Cấu Hình Vận Hành Offline 100% (ĐÃ HOÀN THÀNH)

- [x] **1.1 Kiểm tra file backup CSDL:** Xác nhận `mockdata/backup_before_perfume.sql` tồn tại, dung lượng 2.529.428 bytes (~2.5 MB) qua lệnh `mysqldump` chuẩn `--single-transaction --routines --triggers --events`.
- [x] **1.2 Kiểm tra cấu hình môi trường (.env):**
  - Đảm bảo `FILESYSTEM_DISK=public`.
  - Không lộ khóa API Cloudinary.
  - Đảm bảo `APP_LOCALE=vi`, `APP_FALLBACK_LOCALE=en`, `APP_CURRENCY=VND`.
- [x] **1.3 Cấu hình Bảng quản trị (Admin) cô lập 100% Offline:**
  - Tắt Social Login (Facebook, Google, Twitter, LinkedIn, GitHub = 0).
  - Tắt Google reCAPTCHA.
  - Tắt các cổng thanh toán online (PayPal, Stripe, PayU, Razorpay, PhonePe, PayGlocal = 0); kích hoạt COD (`cashondelivery.active = 1`) và Chuyển khoản ngân hàng (`moneytransfer.active = 1`).
  - Thiết lập Tiền tệ mặc định là `VND` (Base Currency) và Ngôn ngữ mặc định là `vi`.
- [x] **1.4 Thực thi Seeder nội dung Tiếng Việt ban đầu:**
  - Chạy thành công `php artisan db:seed --class=VietnameseContentSeeder`.
  - Chạy `php artisan indexer:index --mode=full`.
  - Dọn cache: `php artisan optimize:clear`, `php artisan responsecache:clear`.
  - Đồng bộ 188 file tài nguyên từ `storage/app/public/` sang `public/storage/`.
  - Xác nhận 0 placeholder rác trong `theme_section_translations` và `cms_page_translations`.

---

## Giai Đoạn 1B: Tùy Biến & Tinh Gọn Nghiệp Vụ Theo Thị Trường Việt Nam (ĐÃ HOÀN THÀNH)

- [x] **1B.1 Tinh gọn Tiền tệ trên Storefront Header:** Xóa liên kết `USD` (ID 1) khỏi bảng `channel_currencies` của Channel 1; chỉ giữ lại duy nhất đồng tiền cơ sở `VND` (ID 2). Dropdown chọn ngoại tệ tự động biến mất trên Header.
- [x] **1B.2 Bật tính năng Mua hàng nhanh không cần tài khoản (Guest Checkout):** Thiết lập `sales.checkout.shopping_cart.allow_guest_checkout = 1` trong `core_config`, phục vụ demo kiểm thử đơn hàng nhanh chóng trong 10 giây trước Hội đồng.
- [x] **1B.3 Bản địa hóa thông tin cửa hàng & kho vận nội địa:** Cấu hình nguồn gốc vận chuyển trong `core_config`: Quốc gia `VN`, Tỉnh/Thành: `Hồ Chí Minh`, Quận: `Quận 1`, Địa chỉ: `123 Đồng Khởi, Phường Bến Nghé`, SĐT: `0901234567`.
- [x] **1B.4 Tùy biến phương thức thanh toán chuyển khoản nội địa (Money Transfer):** Kích hoạt `moneytransfer` kèm số tài khoản ngân hàng Vietcombank (STK: `999988886868`) & MB Bank (STK: `0901234567`), hướng dẫn cú pháp `[MÃ ĐƠN HÀNG] - [SĐT KHÁCH HÀNG]`. Chuẩn hóa song song thông báo phương thức COD (`cashondelivery`).
- [x] **1B.5 Tạo 2 mã giảm giá (Cart Rules) thực tế:**
  - `NUOCHOA10`: Giảm trực tiếp 10% trên tổng giá trị giỏ hàng (`action_type = by_percent`, `discount_amount = 10.0000`).
  - `FREESHIP`: Miễn phí vận chuyển toàn quốc cho đơn hàng từ 1.000.000 VNĐ trở lên (`free_shipping = 1`, điều kiện `cart|base_sub_total >= 1000000`).
- [x] **1B.6 Tinh gọn giao diện Trang cá nhân bằng Custom CSS:** Tiêm mã CSS qua `general.content.custom_scripts.custom_css` ẩn sạch sẽ mục *Sản phẩm kỹ thuật số (Downloadable Products)* và *Yêu cầu GDPR Châu Âu* trên Storefront mà không can thiệp sửa đổi bất kỳ file Blade/Vue lõi nào.
- [x] **1B.7 Xóa bộ nhớ đệm hệ thống:** Chạy `php artisan optimize:clear` và `php artisan responsecache:clear`.
- [x] **1B.8 Tinh gọn Nút Giỏ Hàng & Phương thức Vận chuyển Checkout:**
  - Sửa nút Giỏ hàng trên Header ([mini-cart.blade.php](file:///d:/CD12/bagisto-store/packages/Webkul/Shop/src/Resources/views/checkout/cart/mini-cart.blade.php#L355)) chuyển đúng vào trang Giỏ hàng (`/checkout/cart`) thay vì nhảy thẳng vào Checkout.
  - Chuẩn hóa hãng vận chuyển duy nhất `flatrate`: Mức phí thực tế `30.000 ₫`, chế độ `per_order`, tiêu đề *"Giao hàng tiêu chuẩn (Toàn quốc, 2 - 3 ngày)"*.
  - Tắt hẳn hãng `Free Shipping` rời rạc (`sales.carriers.free.active = 0`) để loại bỏ hoàn toàn tình trạng hiển thị 2 thẻ vận chuyển phi lý (10đ và 0đ).
  - Tắt khối bưu chính ước tính vận chuyển rườm rà tại trang Giỏ hàng (`sales.checkout.shopping_cart.estimate_shipping = 0`).
  - Chuyển Cart Rule Freeship sang chế độ tự động miễn phí cho đơn hàng từ 1.000.000 ₫ trở lên.

---

## Giai Đoạn 2A: Nạp Dữ Liệu Nước Hoa Thật & Tạo Khung `picturetemplate/` (ĐÃ HOÀN THÀNH)

- [x] **2A.1 Thiết lập 3 Thuộc tính EAV tùy chỉnh cho nước hoa:**
  - *Dung tích* (`capacity` - ID 31): Dropdown 10ml (Chiết), 50ml, 100ml, 200ml; `is_filterable = 1`.
  - *Nhóm hương* (`fragrance_family` - ID 32): Select Hương Gỗ & Tiêu Cay, Hương Hoa Cỏ & Trái Cây, Hương Cam Chanh Tươi Mát, Hương Hổ Phách & Phương Đông; `is_filterable = 1`.
  - *Nồng độ* (`concentration` - ID 33): Select Eau de Toilette (EDT), Eau de Parfum (EDP), Parfum / Extrait; `is_filterable = 1`.
  - Đã gán vào Bộ thuộc tính Default áp dụng cho Simple Product để hiển thị bộ lọc ở Storefront.
- [x] **2A.2 Chốt danh sách 24 sản phẩm nước hoa tiêu biểu & Nạp mô tả HTML 4 phần:**
  - Đã rà soát và cô lập chuẩn xác bộ **24 sản phẩm nước hoa tiêu biểu nhất** (phủ đều 4 danh mục: 6 Nam, 6 Nữ, 6 Unisex, 6 Chiết & Mini).
  - Vô hiệu hóa (`status = 0`, `visible_individually = 0`) toàn bộ sản phẩm dư thừa và danh mục đồ công nghệ cũ để Storefront chỉ hiển thị 100% 24 chai nước hoa này.
  - Cập nhật nội dung mô tả dài HTML 4 phần chuyên nghiệp (1. Câu chuyện & Cảm hứng mùi hương; 2. Kim tự tháp 3 tầng hương chuẩn hãng; 3. Thông số kỹ thuật & Hoàn cảnh sử dụng; 4. Hướng dẫn sử dụng & Cam kết chính hãng).
  - **Cài đặt 2 sản phẩm đặc thù:**
    - `PERFUME-0103` (ID 43: Nước Hoa Creed Aventus EDP 100ml Hoàng Gia) có tồn kho `qty = 1` (kiểm thử mua hết hàng).
    - `PERFUME-0153` (ID 93: Nước Hoa Le Labo Santal 33 EDP 50ml) có tồn kho `qty = 5`, `Weight = 1.0000` (kiểm thử Concurrency / Overselling).
- [x] **2A.3 Tái cấu trúc thư mục `picturetemplate/` theo cấu trúc `<SKU>__<slug>`:**
  - Đã tái cấu trúc đúng **24 thư mục con** đặt tên dễ nhìn: `<SKU>__<slug-ten-san-pham>` (ví dụ: `PERFUME-0103__creed-aventus-edp-100ml`, `PERFUME-0153__le-labo-santal-33-edp-50ml`...), mỗi thư mục đều có file `info.txt` hướng dẫn.
  - Thư mục `picturetemplate/_branding/` có file `README.txt` hướng dẫn kích thước ảnh logo và 3 banner slider (`banner-1.jpg`, `banner-2.jpg`, `banner-3.jpg`).
  - Đã cập nhật file `picturetemplate/README.md`. Thư mục được bảo vệ trong `.gitignore`.

---

## Giai Đoạn 2B: Import Ảnh Thật Từ `picturetemplate/` (ĐÃ HOÀN THÀNH)

- [x] **2B.1 Quét và kiểm tra tính toàn vẹn thư mục ảnh:** Quét 24 thư mục con + `_branding/` trong `picturetemplate/`, xác nhận đủ 24 ảnh sản phẩm (`1000x1000 px`, `172–776 KB`), `logo.png` (`400x100 px`, PNG transparent) và 3 banner (`1920x650 px`).
- [x] **2B.2 Chuẩn hóa tên file ảnh tự động:** Xây dựng script tái sử dụng [import_perfume_images.php](file:///d:/CD12/bagisto-store/tools/import_perfume_images.php) tự động chuyển tên file sang ASCII không dấu, viết thường, gạch ngang, độ dài < 35 ký tự.
- [x] **2B.3 Import ảnh vào hệ thống:**
  - Copy 24 ảnh sản phẩm vào `storage/app/public/product/<id>/` và cập nhật bảng `product_images`.
  - Cập nhật `channels.logo` (`channel/1/logo.png`) và 3 slide banner trong `theme_section_translations` (`section_id = 19`, cả `vi` và `en`).
  - Đồng bộ 216 file sang `public/storage/`.
- [x] **2B.4 Tái lập chỉ mục & Dọn cache:** Đã chạy `php artisan indexer:index --mode=full`, `php artisan optimize:clear` và `php artisan responsecache:clear`.

---

## Giai Đoạn 3: Rải Đơn Hàng 30 Ngày & Xuất Bản CSDL Hoàn Thiện

- [x] **3.1 Tạo 4–5 tài khoản khách hàng tiếng Việt:** Đã tạo 5 tài khoản khách hàng người Việt trong `customers` (Hùng Nguyễn, Mai Trần Thị, Long Lê Hoàng, Thảo Phạm Thu, Tuấn Đặng Minh) kèm địa chỉ tại các tỉnh thành Việt Nam (Hà Nội, TP.HCM, Đà Nẵng, Cần Thơ, Hải Phòng...).
- [x] **3.2 Sinh 25–30 đơn hàng COD & Chuyển khoản QR giả lập thực tế:**
  - Đầy đủ các trạng thái thực tế: 16 Đã hoàn thành (Completed - 53%), 8 Đang xử lý (Processing - 27%), 4 Chờ xử lý (Pending - 13%), 2 Đã hủy (Canceled - 7%).
  - Có 24 đơn hàng đã xuất Hóa đơn (`invoices` & `invoice_items`) và 16 đơn hàng đã xuất Phiếu giao hàng (`shipments` & `shipment_items` kèm mã vận đơn bưu điện `VNP` / `GHN`).
- [x] **3.3 Thực thi Script rải đều thời gian đơn hàng (30 ngày linh hoạt):**
  - Xây dựng script linh hoạt [seed_scattered_orders.php](file:///d:/CD12/bagisto-store/tools/seed_scattered_orders.php) hỗ trợ tùy biến tham số: `php tools/seed_scattered_orders.php [count=30] [end_date=today|YYYY-MM-DD]`.
  - Mặc định rải đều 30 đơn hàng cho 30 ngày liên tục tính đến hôm nay (26/10/2026 - 25/11/2026), mỗi ngày 1 đơn hàng vào các khung giờ thực tế (sáng, chiều, tối).
  - Cập nhật đồng bộ `created_at` và `updated_at` trên toàn bộ 8 bảng lõi: `orders`, `order_items`, `addresses` (shipping & billing), `order_payment`, `order_transactions`, `invoices`, `invoice_items`, `shipments`, `shipment_items`.
  - Đảm bảo biểu đồ doanh thu và báo cáo thống kê trên Admin Dashboard hiển thị doanh số tăng trưởng thực tế (tổng doanh thu ~160 triệu VNĐ, lấp đầy toàn bộ các cột từ 26 Th10 đến 25 Th11).
- [x] **3.4 Xuất bản CSDL hoàn thiện:**
  - Chạy `mysqldump` xuất file `mockdata/database_final.sql` (dung lượng 1.5 MB).
  - Đảm bảo cơ sở dữ liệu sẵn sàng phục vụ báo cáo và bảo vệ đồ án 100% Offline.

---

## Giai Đoạn 4: 3 Thực Nghiệm CSDL Chuyên Sâu & Kiểm Thử QA Chuẩn ISTQB

- [x] **4.1 Thực nghiệm Benchmark 1 — Tối ưu hóa truy vấn tìm kiếm tiếng Việt:**
  - Chạy thực nghiệm trên bảng cô lập `exp_product_search_bench` ở 3 cỡ `10k / 100k / 500k` dòng qua [bench_search_vietnamese.php](file:///d:/CD12/bagisto-store/tools/bench_search_vietnamese.php), lưu nguyên văn `EXPLAIN ANALYZE` tại [bench_a_search_raw.txt](file:///d:/CD12/bagisto-store/mockdata/bench_a_search_raw.txt).
- [x] **4.2 Thực nghiệm Benchmark 2 — Mô phỏng khóa bi quan (`SELECT ... FOR UPDATE`):**
  - Chạy song song nhiều tiến trình PHP trên `exp_product_inventories` (`qty=1` với 2 luồng; `qty=5` với 8 luồng) qua [bench_concurrency_inventory.php](file:///d:/CD12/bagisto-store/tools/bench_concurrency_inventory.php), lưu log thật tại [bench_b_concurrency_raw.txt](file:///d:/CD12/bagisto-store/mockdata/bench_b_concurrency_raw.txt) (mô phỏng & đề xuất giải pháp).
- [x] **4.3 Thực nghiệm Benchmark 3 — Quy trình sao lưu & Kiểm tra toàn vẹn CSDL:**
  - Chạy `mysqldump --single-transaction --routines --triggers --events` + restore vào `bagisto_restore_test` + đối chiếu `COUNT(*)` & `CHECKSUM TABLE` trên 13 bảng lõi (khớp 100%) qua [bench_backup_checksum.php](file:///d:/CD12/bagisto-store/tools/bench_backup_checksum.php), lưu log tại [bench_c_backup_raw.txt](file:///d:/CD12/bagisto-store/mockdata/bench_c_backup_raw.txt).
- [x] **4.4 Tính năng mở rộng (Bắt buộc + Tùy chọn A, B, C, D) & 5 Test Cases bổ sung (`TC-21`..`TC-25`):**
  - **Tính năng A (Guest Order Tracking):** `/tra-cuu-don-hang` qua [PerfumeStoreServiceProvider.php](file:///d:/CD12/bagisto-store/app/Providers/PerfumeStoreServiceProvider.php) + [OrderTrackingController.php](file:///d:/CD12/bagisto-store/app/Http/Controllers/Shop/OrderTrackingController.php) (`throttle:5,1`, hỗ trợ `vi`/`en`, ẩn PII, thông báo lỗi chung).
  - **Tính năng B (VietQR cục bộ):** [VietQrPayload.php](file:///d:/CD12/bagisto-store/app/Support/VietQrPayload.php) + [perfume_payment.php](file:///d:/CD12/bagisto-store/config/perfume_payment.php) + theme override [success.blade.php](file:///d:/CD12/bagisto-store/resources/themes/default/views/checkout/success.blade.php) (nội dung `DH{increment_id}`, QR SVG offline 100%).
  - **Tính năng C (Kim tự tháp 3 tầng hương):** [FragrancePyramidParser.php](file:///d:/CD12/bagisto-store/app/Support/FragrancePyramidParser.php) + [fragrance-pyramid.blade.php](file:///d:/CD12/bagisto-store/resources/views/shop/partials/fragrance-pyramid.blade.php) (hiển thị trực quan trên 24/24 trang chi tiết sản phẩm).
  - **Tính năng D (Scent Finder Quiz):** `/tim-mui-huong` qua [ScentFinderController.php](file:///d:/CD12/bagisto-store/app/Http/Controllers/Shop/ScentFinderController.php) + [scent-finder.blade.php](file:///d:/CD12/bagisto-store/resources/views/shop/scent-finder.blade.php), đã capture SQL lọc EAV thật tại [eav_filter_sql_capture.txt](file:///d:/CD12/bagisto-store/mockdata/eav_filter_sql_capture.txt).
  - **Media Hybrid Fallback:** JS `onerror` chuyển `res.cloudinary.com` $\rightarrow$ `/storage/...` tiêm qua `bagisto.shop.layout.body.after`.
  - Kiểm thử tự động toàn bộ A, B, C, D & `TC-21`..`TC-25` đạt **100% PASS**.
- [x] **4.5 Hoàn tất xuất bản CSDL cuối cùng:** Xuất `mockdata/database_final.sql` sau khi hoàn thành toàn bộ tính năng.
- [ ] **4.6 Nghiệm thu 20 Test Cases ISTQB gốc trên giao diện & điền vào Báo cáo Chuyên đề 2:** Cập nhật bảng kết quả 20 TC gốc + 5 TC bổ sung (`TC-21`..`TC-25`), Ma trận RTM và ISO/IEC 25010 vào file báo cáo của Phát.

---

## Giai Đoạn 5: Biên Tập 2 Cuốn Báo Cáo & Chuẩn Bị Bảo Vệ Đồ Án

- [ ] **5.1 Hoàn thiện Báo cáo Chuyên đề 1 (Nguyễn Duy Hùng):** Kiến trúc Bagisto 2.4.x, Bản địa hóa, Tối ưu hóa CSDL & 3 bài thực nghiệm benchmark.
- [ ] **5.2 Hoàn thiện Báo cáo Chuyên đề 2 (Phát):** Quản trị dự án Jira, Quy trình kiểm thử ISTQB, 20 Test Cases & Đánh giá ISO/IEC 25010.
- [ ] **5.3 Khử văn phong AI & Đối soát chéo số liệu:** Đảm bảo 100% số liệu giữa 2 cuốn khớp nhau hoàn toàn (số bảng, số key dịch, thời gian benchmark, số lượng đơn hàng, test case pass rate).
- [ ] **5.4 Sản xuất Video Demo Offline (2,5 – 3 phút):** Quay màn hình demo trơn tru từ lúc khởi động offline -> duyệt shop -> mua hàng -> admin xử lý.
- [ ] **5.5 Luyện tập 30 câu hỏi - đáp trước Hội đồng:** Ôn tập các câu hỏi hóc búa về EAV, Race Condition, FULLTEXT ngram, ISO 25010.
