# 03_SESSION_HANDOFF.md — Biên Bản Giao Ca Cho Phiên Làm Việc Kế Tiếp

> **Mục đích:** File ngắn gọn ghi nhận trạng thái bàn giao giữa các phiên làm việc (Chat Sessions). Bất kỳ AI Agent nào bắt đầu phiên mới chỉ cần đọc file này là nắm bắt ngay kết quả phiên trước và bắt tay vào việc tiếp theo ngay lập tức mà không cần hỏi lại người dùng.

---

## 1. Mẫu Chuẩn Giao Ca (Session Handoff Template)

```markdown
### [BÀN GIAO PHIÊN LÀM VIỆC — NGÀY DD/MM/YYYY]

1. **Phiên vừa rồi làm xong gì:**
   - **Sửa nút Giỏ hàng trên Header:** Chỉnh sửa file [mini-cart.blade.php](file:///d:/CD12/bagisto-store/packages/Webkul/Shop/src/Resources/views/checkout/cart/mini-cart.blade.php#L355), chuyển liên kết từ `route('shop.checkout.onepage.index')` sang `route('shop.checkout.cart.index')` $\rightarrow$ bấm vào icon giỏ hàng nhảy chuẩn xác 100% vào `/checkout/cart`.
   - **Chuẩn hóa Phương thức vận chuyển Checkout:**
     * Tắt hẳn carrier `Free Shipping` rời rạc để xóa bỏ thẻ xe tải `0 ₫` thừa thãi.
     * Cấu hình carrier duy nhất `flatrate`: Phí thực tế `30.000 ₫`, chế độ tính theo đơn hàng `per_order`, tiêu đề *"Giao hàng tiêu chuẩn (Toàn quốc, 2 - 3 ngày)"* kèm mô tả đóng gói hộp carton và bóng khí bảo vệ vòi xịt.
     * Kích hoạt tự động Cart Rule miễn phí ship khi đơn hàng từ 1.000.000 ₫ trở lên.
   - **Tinh gọn trang Giỏ hàng:** Tắt khối ước tính bưu điện và thuế (`estimate_shipping = 0`) giúp giao diện giỏ hàng tinh tế, sạch đẹp.
   - **Kiểm chứng tự động & Chụp ảnh đối chứng:** Chạy Playwright kiểm chứng thực tế và lưu ảnh minh chứng `fix01_cart_page_clean.png` và `fix02_checkout_shipping_single_clean.png`.
   - [Tóm tắt 3-5 gạch đầu dòng các công việc và file cụ thể đã sửa/tạo].
2. **Trạng thái Kỹ thuật & CSDL hiện tại:**
   - Nhánh Git hiện tại: ...
   - Trạng thái Git: Clean / Dirty (nêu rõ các file chưa commit nếu có).
   - Trạng thái CSDL: Đã chạy seeder nào / Đang ở bản backup nào.
   - Trạng thái Server Localhost: Đang chạy cổng nào, có lỗi gì không.
3. **Cảnh báo / Lưu ý quan trọng cho phiên sau:**
   - [Các lưu ý về quy tắc, các bẫy kỹ thuật cần tránh].
4. **HÀNH ĐỘNG CẦN THỰC HIỆN NGAY Ở PHIÊN TIẾP THEO:**
   - [1 hành động cụ thể, rõ ràng nhất để tiếp tục lộ trình].
```

---

## 2. Trạng Thái Bàn Giao Hiện Tại (Cập Nhật: Ngày 27/11/2026)

### [BÀN GIAO PHIÊN LÀM VIỆC — NGÀY 27/11/2026]

1. **Phiên vừa rồi làm xong gì:**
   - **Đóng Ngày 1:** Cập nhật `section_id = 22` (`vi`), kiểm chứng restore `mockdata/backup_before_day1.sql` (147 bảng), bổ sung `packages/Webkul/Core/src/Resources/lang/vi/validation.php` (0 key thiếu toàn bộ 7 bộ lang), tạo `.env.demo`, cấu hình Laragon vhost `bagisto-store.test`, build Shop Vite, đo tốc độ (Warm TTFB median `656.2 ms` $\rightarrow$ `553.2 ms`), kiểm tra `13/13` asset HTTP 200.
   - **Hoàn tất Ngày 2–3 (3 Benchmark CSDL):** Chạy thực nghiệm trên bảng cô lập `exp_*` qua `tools/bench_search_vietnamese.php`, `tools/bench_concurrency_inventory.php`, `tools/bench_backup_checksum.php` và lưu raw log tại `mockdata/bench_*_raw.txt`.
   - **Triển khai hoàn tất Tính năng A, B, C, D & Media Hybrid Fallback (không sửa core Bagisto):**
     * **Guest Order Tracking (`/tra-cuu-don-hang`):** Đăng ký qua `PerfumeStoreServiceProvider` với middleware `shop` + `throttle:5,1`, dùng `OrderRepository`, hỗ trợ `vi`/`en`, thông báo lỗi chung, ẩn PII.
     * **VietQR Cục Bộ:** `app/Support/VietQrPayload.php` (EMVCo + CRC16-CCITT + `BaconQrCode` SVG offline), `config/perfume_payment.php` (đọc `.env` placeholder), theme override `resources/themes/default/views/checkout/success.blade.php` (nội dung `DH{increment_id}`).
     * **Kim tự tháp 3 tầng hương (C):** `app/Support/FragrancePyramidParser.php` + `resources/views/shop/partials/fragrance-pyramid.blade.php` tiêm qua `bagisto.shop.products.view.description.before` (24/24 sản phẩm parse & hiển thị chuẩn).
     * **Scent Finder Quiz (D):** `/tim-mui-huong` (`ScentFinderController` + `scent-finder.blade.php`), redirect sang bộ lọc EAV chuẩn của Bagisto; đã capture SQL EAV thật tại `mockdata/eav_filter_sql_capture.txt`.
     * **Media Hybrid Fallback:** JS `onerror` tự chuyển `res.cloudinary.com` $\rightarrow$ `/storage/...` qua `bagisto.shop.layout.body.after`.
   - **Kiểm thử tự động & Xuất bản CSDL cuối cùng:** Tất cả kiểm thử `TC-21`..`TC-25`, C, D và Media Hybrid đạt **100% PASS**; đã xuất `mockdata/database_final.sql`.

2. **Trạng thái Kỹ thuật & CSDL hiện tại:**
   - **Nhánh Git hiện tại:** `feature/vietnamese-localization`.
   - **Trạng thái CSDL & Media:** 24/24 sản phẩm nước hoa chủ lực đã gắn ảnh thật, logo & 3 banner đã cập nhật; toàn bộ file tồn tại trong `public/storage/`.
   - **Trạng thái Môi trường:** `APP_LOCALE=vi`, `APP_CURRENCY=VND`, `FILESYSTEM_DISK=public`, MySQL chạy ổn định trên cổng 3306.

3. **Cảnh báo / Lưu ý quan trọng cho phiên sau:**
   - Khi bạn Phát thay hoặc thêm ảnh vào `picturetemplate/`, chỉ cần chạy lại đúng 1 lệnh: `php tools/import_perfume_images.php` rồi chạy `php artisan optimize:clear` và `php artisan responsecache:clear`.
   - Khi demo cho giảng viên hoặc bảo vệ đồ án, nên tắt `APP_DEBUG=false`, chạy `php artisan optimize` và truy cập qua Nginx/Apache của Laragon (tránh `php artisan serve` đơn luồng).
   - Tuyệt đối **KHÔNG** push trực tiếp lên nhánh `main`.
   - Sau mỗi lượt chạy phải in **Báo Cáo Tiến Độ 4 Dòng**.

4. **HÀNH ĐỘNG CẦN THỰC HIỆN NGAY Ở PHIÊN TIẾP THEO:**
   - **Giai đoạn 4.5 & Giai đoạn 5:** Hoàn thiện nghiệm thu 20 Test Cases ISTQB gốc + 5 Test Cases bổ sung (`TC-21`..`TC-25`), Ma trận RTM, đánh giá ISO/IEC 25010, biên tập 2 cuốn Báo cáo, quay video demo offline và luyện 30 câu hỏi-đáp. (Cập nhật `VIETQR_BANK_BIN`, `VIETQR_BANK_NAME`, `VIETQR_ACCOUNT_NUMBER`, `VIETQR_ACCOUNT_NAME` trong `.env` nếu muốn dùng STK thật).
