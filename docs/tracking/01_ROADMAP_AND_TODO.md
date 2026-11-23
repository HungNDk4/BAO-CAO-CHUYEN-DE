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

## Giai Đoạn 2B: Import Ảnh Thật Từ `picturetemplate/`

- [ ] **2B.1 Quét và kiểm tra tính toàn vẹn thư mục ảnh:** Quét các thư mục con trong `picturetemplate/`, đếm số lượng ảnh nạp vào.
- [ ] **2B.2 Chuẩn hóa tên file ảnh tự động:** Chuyển đổi tên file sang tiếng Việt không dấu, viết thường, thay khoảng trắng bằng gạch ngang, độ dài < 40 ký tự.
- [ ] **2B.3 Import ảnh vào hệ thống:**
  - Copy ảnh vào `storage/app/public/products/<id>/`.
  - Cập nhật đường dẫn vào bảng `product_images` trong CSDL.
  - Cập nhật ảnh branding vào cấu hình theme trong `theme_customization_translations`.
  - Đồng bộ sang `public/storage/`.
- [ ] **2B.4 Tái lập chỉ mục & Dọn cache:** Chạy `php artisan indexer:index --mode=full`, `php artisan optimize:clear`.

---

## Giai Đoạn 3: Rải Đơn Hàng 30 Ngày & Xuất Bản CSDL Hoàn Thiện

- [ ] **3.1 Tạo 4–5 tài khoản khách hàng tiếng Việt:** Tên người Việt, địa chỉ tại các tỉnh thành Việt Nam (Hà Nội, TP.HCM, Đà Nẵng, Cần Thơ...).
- [ ] **3.2 Sinh 25–30 đơn hàng COD giả lập thực tế:**
  - Đầy đủ các trạng thái: Chờ xử lý (Pending), Đang xử lý (Processing), Đã hoàn thành (Completed), Đã hủy (Canceled).
  - Có 18–20 đơn hàng đã xuất Hóa đơn (Invoice) và Phiếu giao hàng (Shipment).
- [ ] **3.3 Thực thi Script SQL rải đều thời gian đơn hàng (30 ngày):**
  - Cập nhật đồng bộ `created_at` và `updated_at` trên cả 8 bảng: `orders`, `order_items`, `order_addresses`, `order_payment`, `order_transactions`, `invoices`, `invoice_items`, `shipments`, `shipment_items`.
  - Đảm bảo biểu đồ doanh thu và báo cáo thống kê trên Admin Dashboard hiển thị biểu đồ tăng trưởng thực tế.
- [ ] **3.4 Xuất bản CSDL hoàn thiện:**
  - Chạy `mysqldump` xuất file `mockdata/database_final.sql`.
  - Đảm bảo file được ignore trên Git để tránh phình dung lượng repo.

---

## Giai Đoạn 4: 3 Thực Nghiệm CSDL Chuyên Sâu & Kiểm Thử QA Chuẩn ISTQB

- [ ] **4.1 Thực nghiệm Benchmark 1 — Tối ưu hóa truy vấn tìm kiếm tiếng Việt:**
  - Tạo bảng thực nghiệm riêng biệt: `exp_product_search_bench`.
  - So sánh chi phí (Query Cost), số dòng duyệt (Rows Examined) và thời gian thực thi (Execution Time) qua `EXPLAIN ANALYZE`:
    - Truy vấn `LIKE %...%` (Full table scan).
    - Truy vấn B-Tree Index (Prefix matching `LIKE '...'`).
    - Truy vấn FULLTEXT Index (ngram parser tiếng Việt).
  - Khảo sát các trường hợp: tiếng Việt có dấu, không dấu, từ ngắn 2–3 ký tự.
- [ ] **4.2 Thực nghiệm Benchmark 2 — Mô phỏng khóa bi quan (`SELECT ... FOR UPDATE`):**
  - Thực hiện trên bản sao bảng tồn kho: `exp_product_inventories`.
  - Trường hợp 1: Không dùng khóa $\rightarrow$ 2 giao dịch đồng thời mua sản phẩm `qty = 1` $\rightarrow$ xảy ra Overselling (tồn kho âm `-1`).
  - Trường hợp 2: Dùng `SELECT ... FOR UPDATE` trong Transaction của Laravel $\rightarrow$ giao dịch thứ 2 bị chặn hoặc nhận thông báo hết hàng an toàn $\rightarrow$ bảo toàn toàn vẹn dữ liệu.
- [ ] **4.3 Thực nghiệm Benchmark 3 — Quy trình sao lưu & Kiểm tra toàn vẹn CSDL:**
  - Sao lưu bằng `mysqldump` kèm cờ chuẩn: `--single-transaction --routines --triggers --events`.
  - Phục hồi sang database thử nghiệm `bagisto_restore_test`.
  - Xác thực toàn vẹn bằng lệnh `COUNT(*)` trên các bảng lõi và `CHECKSUM TABLE` đối chiếu 100% khớp.
- [ ] **4.4 Hỗ trợ QA kiểm thử Hộp đen (20 Test Cases ISTQB):**
  - Hỗ trợ thành viên Phát chạy và nghiệm thu 20 Test Cases (EP/BVA) trên giao diện tiếng Việt hoàn chỉnh.
  - Cập nhật Ma trận truy xuất nguồn gốc yêu cầu (RTM) và đánh giá chất lượng phần mềm theo tiêu chuẩn ISO/IEC 25010.

---

## Giai Đoạn 5: Biên Tập 2 Cuốn Báo Cáo & Chuẩn Bị Bảo Vệ Đồ Án

- [ ] **5.1 Hoàn thiện Báo cáo Chuyên đề 1 (Nguyễn Duy Hùng):** Kiến trúc Bagisto 2.4.x, Bản địa hóa, Tối ưu hóa CSDL & 3 bài thực nghiệm benchmark.
- [ ] **5.2 Hoàn thiện Báo cáo Chuyên đề 2 (Phát):** Quản trị dự án Jira, Quy trình kiểm thử ISTQB, 20 Test Cases & Đánh giá ISO/IEC 25010.
- [ ] **5.3 Khử văn phong AI & Đối soát chéo số liệu:** Đảm bảo 100% số liệu giữa 2 cuốn khớp nhau hoàn toàn (số bảng, số key dịch, thời gian benchmark, số lượng đơn hàng, test case pass rate).
- [ ] **5.4 Sản xuất Video Demo Offline (2,5 – 3 phút):** Quay màn hình demo trơn tru từ lúc khởi động offline -> duyệt shop -> mua hàng -> admin xử lý.
- [ ] **5.5 Luyện tập 30 câu hỏi - đáp trước Hội đồng:** Ôn tập các câu hỏi hóc búa về EAV, Race Condition, FULLTEXT ngram, ISO 25010.
