# 02_TECHNICAL_NOTES_AND_BUGS.md — Nhật Ký Kỹ Thuật & Quản Lý Lỗi Thực Tế

> **Mục đích:** Ghi nhận toàn bộ các lệnh kỹ thuật đã kiểm chứng thành công trên môi trường Windows/Laragon, cùng các bài học kỹ thuật và nhật ký lỗi **thực tế 100%** (không dàn dựng lỗi giả).

---

## 1. Các Lệnh CLI & Artisan Đã Kiểm Chứng Thành Công

| Lệnh thực thi | Mục đích sử dụng | Ghi chú trên môi trường Windows |
|---|---|---|
| `php -l <file>` | Kiểm tra lỗi cú pháp PHP (Linting) | Luôn chạy trước khi lưu hoặc commit file ngôn ngữ/controller. |
| `php artisan optimize:clear` | Xóa toàn bộ bootstrap cache (config, routes, views, events) | **Bắt buộc chạy** sau mỗi lần sửa file ngôn ngữ hoặc config. |
| `php artisan cache:clear` | Xóa bộ nhớ đệm ứng dụng (Application Cache) | Đảm bảo các truy vấn và giao diện động nạp dữ liệu mới nhất. |
| `php artisan bagisto:translations:check` | Quét kiểm tra tính đồng bộ các key bản dịch | Dùng để đối soát key giữa `en` và các ngôn ngữ khác. |
| `php artisan indexer:index --mode=full` | Tái lập toàn bộ chỉ mục Elasticsearch/Database | Cần chạy sau khi thêm/sửa sản phẩm và thuộc tính EAV. |
| `php artisan serve` | Khởi chạy máy chủ phát triển nội bộ | Chạy tại `http://127.0.0.1:8000`. |
| `call setup.bat` | Kịch bản tự động hóa khởi tạo môi trường trên Windows | Tự sao chép ảnh sang `public/storage/` và dọn cache. |

---

## 2. Các Sự Cố Kỹ Thuật Thật Đã Gặp & Cách Khắc Phục (Post-Mortem)

### Sự cố 1: Lỗi `Uncaught SyntaxError: missing ) after argument list` khi truy cập Dashboard Admin
- **Hiện tượng:** Màn hình Dashboard Admin không tải được component Vue, console trình duyệt báo lỗi `Uncaught SyntaxError: missing ) after argument list at new Function`.
- **Nguyên nhân gốc:**  
  Trong component `v-mega-search` tại file view header ([header/index.blade.php](file:///d:/CD12/bagisto-store/packages/Webkul/Admin/src/Resources/views/components/layouts/header/index.blade.php)), Blade chèn chuỗi dịch vào template JS:
  ```blade
  @{{ "@lang('admin::app.components.layouts.header.mega-search.explore-all-matching-products')".replace(':query', searchTerm)... }}
  ```
  Trong bản dịch tiếng Việt trước đó, dấu ngoặc kép ASCII chuẩn (`":query"`) bị đóng mở chuỗi kép của JavaScript trước thời hạn, làm vỡ cú pháp compiler của Vue 3 khi gọi `new Function()`. Bản gốc tiếng Anh sử dụng dấu ngoặc kép cong typographic (`“:query”`).
- **Giải pháp xử lý:**  
  Cập nhật lại các key bản dịch liên quan sang dấu ngoặc kép cong chuẩn `“:query”` (*Xem tất cả sản phẩm khớp với “:query” (:count)*). Đã viết script kiểm thử tự động dịch thử toàn bộ 18 Vue template và xác nhận 18/18 đều PASS.

---

### Sự cố 2: Lỗi hiển thị tiền tệ VNĐ `UnhandledMatchError` trong `CurrencyFormatter.php:86`
- **Hiện tượng:** Khi gọi API lấy danh sách sản phẩm hoặc render trang ngoài Storefront, hệ thống ném ra ngoại lệ lỗi 500 `UnhandledMatchError`.
- **Nguyên nhân gốc:**  
  Trong Bagisto 2.4, cấu hình vị trí ký hiệu tiền tệ của VNĐ ban đầu bị đặt là `after`. Match expression trong mã nguồn core `CurrencyFormatter` không có nhánh xử lý cho `after` đối với locale hiện hành.
- **Giải pháp xử lý:**  
  Điều chỉnh cấu hình vị trí ký hiệu tiền tệ sang giá trị hợp lệ của hệ thống là `right_with_space` (ví dụ: `7.850.000 ₫`).

---

### Sự cố 3: Lỗi Symlink hình ảnh trên môi trường Windows / Laragon
- **Hiện tượng:** Ảnh sản phẩm lưu trong `storage/app/public/` không hiển thị ra ngoài trình duyệt, do lệnh `php artisan storage:link` tạo junction symlink bị lỗi quyền trên Windows.
- **Nguyên nhân gốc:**  
  Cơ chế NTFS symlink của Windows yêu cầu quyền Administrator hoặc bị lỗi đường dẫn tương đối khi chạy qua máy chủ PHP CLI nội bộ.
- **Giải pháp xử lý:**  
  Giải quyết triệt để thông qua file [setup.bat](file:///d:/CD12/bagisto-store/setup.bat). Mỗi khi khởi động hoặc nạp dữ liệu mới, script sử dụng lệnh `xcopy /E /I /Y /Q` sao chép trực tiếp tài nguyên từ `storage\app\public\*` sang `public\storage\`, loại bỏ hoàn toàn rủi ro hỏng symlink khi chạy offline.

---

### Sự cố 4: Cảnh báo tĩnh `Undefined property: Channel::$id` trong file footer
- **Hiện tượng:** PHP Language Server (Intelephense) trong VS Code / IDE báo lỗi tĩnh `Undefined property: Channel::$id` và `Channel::$theme` tại file view [footer/index.blade.php](file:///d:/CD12/bagisto-store/packages/Webkul/Shop/src/Resources/views/components/layouts/footer/index.blade.php).
- **Nguyên nhân gốc:**  
  Hàm `core()->getCurrentChannel()` trả về interface contract `Webkul\Core\Contracts\Channel`. Bộ phân tích tĩnh không đọc được các magic property của Eloquent model nếu không có type hint.
- **Giải pháp xử lý:**  
  Bổ sung khối chú thích kiểu PHPDoc `/** @var \Webkul\Core\Models\Channel $channel */` ngay sau khi lấy biến `$channel`.

---

## 3. Nhật Ký Lỗi Thực Tế Phát Sinh Khi Chạy Seeder / Test Offline / QA

> **Quy tắc:** Chỉ ghi nhận lỗi thật phát sinh trong quá trình nhóm thực hiện các bước tiếp theo. Cập nhật chi tiết, trung thực để làm tư liệu đưa vào phần "Nhật ký kiểm thử & xử lý sự cố" của cuốn Báo cáo Chuyên đề 2.

| Mã Bug | Ngày phát hiện | Mô tả lỗi / Triệu chứng | Môi trường / Màn hình | Nguyên nhân kỹ thuật | Mức độ | Trạng thái | Giải pháp xử lý |
|---|---|---|---|---|---|---|---|
| *BUG-01* | 22/11/2026 | Lỗi Vue SyntaxError khi mở Dashboard Admin | Admin Header (Mega Search) | Dấu ngoặc kép ASCII phá vỡ chuỗi JS trong Vue inline template | High | **Đã sửa (Fixed)** | Đổi sang dấu ngoặc kép cong `“:query”` |
| *BUG-02* | 22/11/2026 | Lỗi 500 UnhandledMatchError khi nạp API sản phẩm | Storefront / Product API | Cấu hình vị trí tiền tệ `after` không hỗ trợ | Medium | **Đã sửa (Fixed)** | Đổi sang `right_with_space` |
| *BUG-03* | 22/11/2026 | Không hiển thị ảnh sản phẩm sau khi clone dự án | Toàn trang (Public Storage) | Windows NTFS symlink không hoạt động với PHP server | High | **Đã sửa (Fixed)** | Dùng lệnh xcopy đồng bộ trực tiếp trong `setup.bat` |
| *BUG-04* | ... | *(Chờ ghi nhận trong quá trình chạy Seeder & QA)* | ... | ... | ... | ... | ... |
| *BUG-05* | ... | *(Chờ ghi nhận trong quá trình chạy Seeder & QA)* | ... | ... | ... | ... | ... |
