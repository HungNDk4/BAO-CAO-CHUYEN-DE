# 01_ROADMAP_AND_TODO.md — Lộ Trình Triển Khai & Checklist Chi Tiết

> **Trạng thái cập nhật:** Ngày 23/11/2026  
> **Ký hiệu:**  
> - `[x]` : Đã hoàn thành và kiểm chứng thành công.  
> - `[ ]` : Đang chờ thực hiện theo lộ trình.

---

## Giai Đoạn 0: Bảo Toàn Hiện Trạng & Kiểm Chứng Hạ Tầng

- [x] **0.1 Sao lưu CSDL gốc:** Xuất file backup an toàn trước khi chuyển đổi sang shop nước hoa (`mockdata/backup_before_perfume.sql`).
- [x] **0.2 Sao lưu kho ảnh cũ:** Nén toàn bộ ảnh sản phẩm demo cũ (`mockdata/storage_app_public_backup.zip`).
- [x] **0.3 Lưu trữ số liệu hiện trạng:** Chụp lại các màn hình dashboard và số liệu đơn hàng/sản phẩm ban đầu để phục vụ đối soát trong báo cáo chuyên đề.
- [x] **0.4 Kiểm tra hệ thống lệnh Artisan:** Rà soát danh sách lệnh khả dụng qua `php artisan list` trên Laravel 12.
- [x] **0.5 Kiểm tra cài đặt Locales:** Kích hoạt và xác nhận locale tiếng Việt (`vi`) hoạt động trong cấu hình Bagisto Admin.
- [x] **0.6 Kiểm tra Adapter lưu trữ:** Đảm bảo hệ thống sử dụng local disk lưu trữ thay vì phụ thuộc dịch vụ ngoài (`CloudinaryStorageAdapter`).

---

## Giai Đoạn 1: Bản Địa Hóa Toàn Diện & Cô Lập Môi Trường Offline

- [x] **1.1 Bản địa hóa Storefront (`packages/Webkul/Shop/`):**
  - Hoàn thành dịch 1.319 key sang tiếng Việt chuẩn thương mại điện tử.
  - Đồng bộ bản dịch sang thư mục `lang/vendor/shop/vi/app.php`.
- [x] **1.2 Bản địa hóa Bảng quản trị (`packages/Webkul/Admin/`):**
  - Hoàn thành dịch toàn bộ 4.496 key (Sidebar, Widgets, Notifications, Orders, RMA, Catalog, Marketing, Configuration...).
  - Đồng bộ bản dịch sang thư mục `lang/vendor/admin/vi/app.php`.
  - Khắc phục triệt để lỗi Vue runtime compiler do dấu quote trong template mega-search.
- [x] **1.3 Bản địa hóa các gói vệ tinh & Thư mục gốc:**
  - Hoàn thành dịch `packages/Webkul/Product/` (24 key - sort options: *Giá cao/thấp, Từ A-Z, Mới/Cũ nhất*).
  - Hoàn thành `packages/Webkul/Customer/`, `Attribute/`, `Core/`.
  - Hoàn thành thư mục gốc `lang/vi/` (*auth.php, validation.php, pagination.php, passwords.php*).
- [x] **1.4 Chuẩn hóa hiển thị tiền tệ VNĐ:**
  - Định dạng hiển thị: `right_with_space`, không chữ số thập phân, ký hiệu `₫` (tránh lỗi `UnhandledMatchError`).
- [x] **1.5 Chuyển đổi Footer trang bán hàng:**
  - Thiết kế lại [footer/index.blade.php](file:///d:/CD12/bagisto-store/packages/Webkul/Shop/src/Resources/views/components/layouts/footer/index.blade.php) hỗ trợ song ngữ động cho cửa hàng nước hoa, loại bỏ toàn bộ chuỗi hard-code tiếng Anh.
- [x] **1.6 Tự động hóa vận hành Windows (`setup.bat`):**
  - Script tự sinh `.env`, tự copy đồng bộ ảnh từ `storage/app/public/` sang `public/storage/`, dọn sạch cache chỉ với 1 click.
- [x] **1.7 Quản trị Git & GitHub:**
  - Cập nhật `.gitignore` loại bỏ file sao lưu nặng (`mockdata/*.sql`, `mockdata/*.zip`).
  - Tạo nhánh mới `feature/vietnamese-localization`, commit 19 file sạch và push thành công lên GitHub remote.
- [ ] **1.8 Cô lập 100% Offline trên Admin:**
  - Tắt Social Login (Google, Facebook, X, LinkedIn).
  - Tắt Google reCAPTCHA.
  - Tắt cổng thanh toán online (PayPal, Stripe, PayU...), chỉ kích hoạt COD và Chuyển khoản ngân hàng.
- [ ] **1.9 Thiết lập Jira Kanban 2 người:**
  - Khởi tạo bảng Kanban trên Jira, cấu hình workflow chuẩn (*To Do -> In Progress -> Code Review/QA -> Done*), gán task cho Hùng & Phát.

---

## Giai Đoạn 2: Nạp Dữ Liệu Nước Hoa, EAV, Phân Quyền & Đơn Hàng Mẫu

- [x] **2.1 Chuẩn bị dữ liệu mẫu sạch:**
  - Xây dựng file dữ liệu `database/data/vietnamese_content.php` (nội dung nước hoa, danh mục Nam/Nữ/Unisex, cam kết chính hãng, sạch placeholder).
- [x] **2.2 Xây dựng kịch bản Seeder:**
  - Viết `VietnameseContentSeeder.php` (cập nhật theme section, CMS pages, category, channel).
  - Viết sẵn kịch bản song ngữ `EnglishPerfumeContentSeeder.php`.
- [ ] **2.3 Thực thi Seeder vào Database:**
  - Chạy `php artisan db:seed --class=VietnameseContentSeeder`.
  - Quét kiểm tra nghiệm thu SQL để đảm bảo 0 placeholder rác trong database.
- [ ] **2.4 Thiết lập Custom Attributes EAV cho ngành nước hoa:**
  - Tạo 3 thuộc tính EAV tùy chỉnh:
    1. *Dung tích* (Dropdown: 10ml, 30ml, 50ml, 100ml).
    2. *Nhóm hương* (Select: Hương Gỗ phương Đông, Hương Hoa cỏ tươi mát, Hương Cam chanh biển...).
    3. *Nồng độ* (Select: Extrait de Parfum, Eau de Parfum - EDP, Eau de Toilette - EDT).
  - Gán 3 thuộc tính vào bộ thuộc tính (Attribute Family) áp dụng cho Simple Product.
- [ ] **2.5 Nhập liệu 15–20 sản phẩm nước hoa thực tế:**
  - Nhập đầy đủ thông tin: Tên sản phẩm tiếng Việt, SKU, Giá bán VNĐ, Thuộc tính EAV, Mô tả, Ảnh sắc nét.
  - **Ràng buộc kịch bản:**
    - Cài đặt sẵn **01 sản phẩm có tồn kho `qty = 1`** (để test mua hết hàng / race condition).
    - Cài đặt sẵn **01 sản phẩm có tồn kho `qty = 5`, `Weight = 1`** (dùng cho bài toán concurrency test).
- [ ] **2.6 Cấu hình Phân quyền người dùng (RBAC):**
  - Tạo các Role trong Admin (*Quản lý kho hàng, Nhân viên bán hàng/CSKH, Quản trị viên tối cao*).
  - Gán quyền hạn chi tiết và kiểm chứng khả năng phân quyền truy cập menu.
- [ ] **2.7 Tạo 25–30 đơn hàng COD giả lập thực tế:**
  - Tạo tài khoản khách hàng và đặt 25–30 đơn hàng với đầy đủ các trạng thái: *Đang chờ (Pending), Đang xử lý (Processing), Đã hoàn thành (Completed), Đã hủy (Canceled)*.
- [ ] **2.8 Rải đều thời gian đơn hàng (SQL Distribution):**
  - Thực thi script SQL cập nhật `created_at` và `updated_at` của các đơn hàng rải đều trong vòng 30 ngày gần nhất để biểu đồ thống kê Dashboard hiển thị sống động, thực tế.
- [ ] **2.9 Xuất bản CSDL hoàn thiện:**
  - Xuất file dump CSDL cuối cùng vào `mockdata/database_final.sql` để bảo tồn trạng thái chuẩn phục vụ bảo vệ đồ án.

---

## Giai Đoạn 3: Thực Nghiệm CSDL Chuyên Sâu & Kiểm Thử Hộp Đen

- [ ] **3.1 Thực nghiệm Benchmark 1 — Tối ưu hóa truy vấn tìm kiếm tiếng Việt:**
  - So sánh chi phí và thời gian thực thi giữa:
    - *Truy vấn LIKE:* `SELECT * FROM product_flat WHERE name LIKE '%nước hoa%'`
    - *Truy vấn Index B-Tree:* Tìm kiếm tiền tố `LIKE 'nước hoa%'`
    - *Truy vấn FULLTEXT Search:* Sử dụng bộ phân tích từ tiếng Việt / n-gram `MATCH(...) AGAINST(...)`
  - Thu thập kết quả chi tiết từ `EXPLAIN ANALYZE` và lập biểu đồ so sánh.
- [ ] **3.2 Thực nghiệm Benchmark 2 — Mô phỏng khóa bi quan (`SELECT ... FOR UPDATE`):**
  - Viết script mô phỏng 2 phiên giao dịch đồng thời đặt mua cùng 1 sản phẩm chỉ còn tồn kho 1 chiếc.
  - Ghi nhận hiện tượng Race Condition khi không khóa (tồn kho âm).
  - Thực thi với cơ chế khóa bi quan trong Laravel Transaction $\rightarrow$ chứng minh giao dịch an toàn tuyệt đối.
- [ ] **3.3 Thực nghiệm Benchmark 3 — Quy trình sao lưu & Kiểm tra toàn vẹn CSDL:**
  - Chạy quy trình sao lưu bằng `mysqldump`.
  - So sánh mã băm bảng dữ liệu trước và sau phục hồi bằng lệnh `CHECKSUM TABLE`.
- [ ] **3.4 Kiểm thử Hộp đen (QA Testing):**
  - Chạy lại toàn bộ **20 Test Cases** được xây dựng theo kỹ thuật Phân vùng tương đương (EP) và Phân tích giá trị biên (BVA) trên giao diện tiếng Việt mới.
  - Cập nhật Ma trận truy xuất nguồn gốc yêu cầu (RTM).
  - Ghi nhận kết quả thực tế vào biên bản kiểm thử.

---

## Giai Đoạn 4: Biên Tập Báo Cáo, Video Demo & Luyện Tập Vấn Đáp

- [ ] **4.1 Hoàn thiện 2 cuốn Báo cáo Chuyên đề:**
  - Biên tập cuốn **Chuyên đề 1** (Nguyễn Duy Hùng: Kiến trúc Bagisto, Bản địa hóa, Tối ưu hóa CSDL & Thực nghiệm).
  - Biên tập cuốn **Chuyên đề 2** (Phát: Quản trị dự án Jira, Quy trình kiểm thử ISTQB, 20 Test Cases & Đánh giá ISO/IEC 25010).
- [ ] **4.2 Khử văn phong AI & Đồng bộ số liệu:**
  - Rà soát toàn bộ báo cáo, loại bỏ các mẫu câu lặp lại của AI, diễn đạt theo phong cách văn phong kỹ thuật học thuật mạch lạc.
  - Đối soát chéo từng số liệu giữa Chuyên đề 1 và Chuyên đề 2 (số lượng test case, số bảng CSDL, thời gian đo benchmark, số lượng key dịch...).
- [ ] **4.3 Sản xuất Video Demo Offline dự phòng:**
  - Quay video màn hình chất lượng cao (thời lượng 2,5 – 3 phút), quay rõ quy trình vận hành offline từ lúc chạy `setup.bat` -> duyệt shop nước hoa -> đặt hàng -> admin xử lý đơn hàng.
- [ ] **4.4 Luyện tập 30 câu hỏi - đáp trước Hội đồng:**
  - Ôn luyện kỹ 30 tình huống câu hỏi phản biện của Hội đồng xoay quanh kiến trúc EAV, giải pháp khóa bi quan, hiệu năng FULLTEXT search và tiêu chuẩn ISO 25010.
