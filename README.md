# ĐỒ ÁN CHUYÊN ĐỀ TỐT NGHIỆP: NGHIÊN CỨU & TRIỂN KHAI HỆ THỐNG THƯƠNG MẠI ĐIỆN TỬ

## 1. THÔNG TIN ĐỀ TÀI & NHÓM THỰC HIỆN
* **Tên đề tài:** Nghiên cứu kiến trúc, quy trình phát triển và tối ưu hóa hệ quản trị cơ sở dữ liệu cho hệ thống thương mại điện tử chuyên nghiệp.
* **Thời gian thực hiện:** Tháng 09/2026 – Tháng 10/2026
* **Danh sách thành viên nhóm (02 thành viên):**
  1. **Nguyễn Duy Hùng** (Leader / Tech Lead) - Quản trị mã nguồn, hạ tầng, cơ sở dữ liệu & tích hợp hệ thống
  2. **Phát** - Phát triển chức năng, kiểm thử hệ thống & tối ưu hóa cơ sở dữ liệu

---

## 2. TUYÊN BỐ LIÊM CHÍNH HỌC THUẬT (ACADEMIC INTEGRITY)
* **Kế thừa mã nguồn mở:** Hệ thống được phát triển và kế thừa dựa trên nền tảng thương mại điện tử mã nguồn mở **Bagisto** (bản quyền thuộc Webkul Software Pvt. Ltd., phát hành theo giấy phép mã nguồn mở MIT) làm **môi trường thực nghiệm đối chứng** phục vụ mục đích nghiên cứu, học thuật và báo cáo chuyên đề.
* **Mục đích dữ liệu và hình ảnh:** Toàn bộ dữ liệu sản phẩm, hình ảnh, banner và thương hiệu minh họa trong hệ thống được sử dụng thuần túy cho mục đích nghiên cứu học thuật phi thương mại, không có bất kỳ giá trị thương mại hay giao dịch thực tế nào.
* **Tài khoản quản trị demo:** Tài khoản quản trị viên (`admin@example.com` / `admin123`) chỉ là tài khoản mẫu thử nghiệm cục bộ trên môi trường phát triển (Local Development Environment), không đại diện cho bất kỳ tài khoản thực tế nào ngoài thực tế.

---

## 3. CÔNG NGHỆ SỬ DỤNG
* **Backend:** PHP 8.3, Laravel 12.x
* **Frontend:** Blade Template, Vue.js, Tailwind CSS
* **Database:** MySQL 8.x / MariaDB (RDBMS)
* **Cloud Storage & CDN (Tùy chọn):** Cloudinary CDN Media Storage
* **Công cụ hỗ trợ & Vận hành:** Laragon, HeidiSQL, DBeaver, Git, Jira Software

---

## 4. HƯỚNG DẪN CÀI ĐẶT DỰ ÁN (POST-CLONE SETUP)
> **Yêu cầu môi trường tiên quyết:** Máy tính Windows cài đặt **Laragon** (PHP >= 8.3, MySQL >= 8.0, Composer). Các PHP extension cần bật: `pdo_mysql`, `fileinfo`, `intl`, `gd`, `zip`, `curl`.

Thực hiện lần lượt các bước sau sau khi clone mã nguồn:

### Bước 1: Clone mã nguồn
```bash
git clone https://github.com/HungNDk4/BAO-CAO-CHUYEN-DE.git
cd BAO-CAO-CHUYEN-DE
```

### Bước 2: Cài đặt thư viện phụ thuộc (Vendor)
Mở **Terminal** trong Laragon và chạy:
```bash
composer install
```

### Bước 3: Tạo cơ sở dữ liệu trống & nạp dữ liệu mẫu
1. Mở **HeidiSQL** (hoặc công cụ MySQL quản trị bất kỳ), tạo một database mới tên: `bagisto_perfume` với bảng mã `utf8mb4_unicode_ci`.
2. Nạp tệp SQL dữ liệu mẫu từ thư mục `mockdata/` (ví dụ `mockdata/database_final.sql`):
   - **Cách 1 (HeidiSQL):** Chọn database `bagisto_perfume` -> Nhấn **Ctrl + O** -> Chọn `mockdata/database_final.sql` -> Nhấn **F9** để thực thi.
   - **Cách 2 (Terminal Laragon):**
     ```bash
     mysql -u root -e "CREATE DATABASE IF NOT EXISTS bagisto_perfume CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"
     mysql -u root bagisto_perfume < mockdata/database_final.sql
     ```

### Bước 4: Chạy tập lệnh thiết lập tự động (`setup.bat`)
Nhấp đúp chuột vào tệp `setup.bat` ở thư mục gốc (hoặc chạy trong Terminal):
```cmd
.\setup.bat
```
*Tập lệnh sẽ tự động tạo tệp `.env` chuẩn, sinh `APP_KEY`, đồng bộ tài nguyên hình ảnh từ `storage/app/public/` sang `public/storage/` và dọn sạch bộ nhớ đệm (`php artisan optimize:clear`).*

### Bước 5: Khởi chạy máy chủ
```bash
php artisan serve
```

---

## 5. THÔNG TIN TRUY CẬP HỆ THỐNG & TÀI KHOẢN MẪU
* **Giao diện người dùng (Storefront):** [http://127.0.0.1:8000](http://127.0.0.1:8000)
* **Giao diện quản trị (Admin Panel):** [http://127.0.0.1:8000/admin](http://127.0.0.1:8000/admin)
  * **Email đăng nhập:** `admin@example.com`
  * **Mật khẩu (Password):** `admin123`
  *(Tài khoản demo cục bộ dùng cho thực nghiệm)*

---

## 6. KIẾN TRÚC LƯU TRỮ ĐÁM MÂY (CLOUDINARY ADAPTER - TÙY CHỌN)
Hệ thống hỗ trợ kiến trúc **Local-first Dual Storage** qua adapter `app/Filesystem/CloudinaryStorageAdapter.php`:
* Mặc định dự án lưu trữ và đọc ảnh trực tiếp tại `storage/app/public/` (hoàn toàn ngoại tuyến, không cần internet).
* Khi cần tích hợp CDN Cloudinary, cấu hình các biến trong `.env`:
  ```env
  FILESYSTEM_DISK=cloudinary
  CLOUDINARY_CLOUD_NAME=your_cloud_name
  CLOUDINARY_KEY=your_cloudinary_key
  CLOUDINARY_SECRET=your_cloudinary_secret
  ```
* Lệnh đồng bộ hình ảnh lên Cloudinary:
  ```bash
  php artisan cloudinary:sync-local-images
  ```

---

## 7. QUY TRÌNH PHỐI HỢP NHÓM & ĐỒNG BỘ DỮ LIỆU
1. **Khi có cập nhật dữ liệu mới (Sản phẩm/Hình ảnh):**
   - Xuất dữ liệu mới ra `mockdata/database_final.sql`.
   - Commit và Push lên GitHub:
     ```bash
     git add mockdata/database_final.sql storage/app/public/
     git commit -m "feat: cap nhat du lieu mau va hinh anh"
     git push origin main
     ```
2. **Khi thành viên khác cập nhật:**
   ```bash
   git pull origin main
   ```
   - Nạp lại `mockdata/database_final.sql` vào `bagisto_perfume`.
   - Chạy lại `.\setup.bat` để cập nhật ảnh sang `public/storage`.

---

## 8. XỬ LÝ SỰ CỐ THƯỜNG GẶP (TROUBLESHOOTING)
* **Lỗi ảnh sản phẩm / banner không hiển thị:**
  - Bật extension `gd` trong cấu hình PHP Laragon.
  - Chạy lại `setup.bat` để sao chép ảnh vào `public/storage/`.
* **Lỗi `ViteManifestNotFoundException`:**
  - Đảm bảo đã import CSDL `mockdata/database_final.sql` và thông tin `DB_DATABASE` trong `.env` đã trùng khớp (`bagisto_perfume`), sau đó chạy `php artisan optimize:clear`.
* **Lỗi không nhận diện lệnh `composer` hoặc `php`:**
  - Khởi động cửa sổ lệnh bằng nút **Terminal** trên giao diện Laragon để nạp đầy đủ biến môi trường.
