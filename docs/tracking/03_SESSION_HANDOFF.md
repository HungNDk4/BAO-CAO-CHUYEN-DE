# 03_SESSION_HANDOFF.md — Biên Bản Giao Ca Cho Phiên Làm Việc Kế Tiếp

> **Mục đích:** File ngắn gọn ghi nhận trạng thái bàn giao giữa các phiên làm việc (Chat Sessions). Bất kỳ AI Agent nào bắt đầu phiên mới chỉ cần đọc file này là nắm bắt ngay kết quả phiên trước và bắt tay vào việc tiếp theo ngay lập tức mà không cần hỏi lại người dùng.

---

## 1. Mẫu Chuẩn Giao Ca (Session Handoff Template)

```markdown
### [BÀN GIAO PHIÊN LÀM VIỆC — NGÀY DD/MM/YYYY]

1. **Phiên vừa rồi làm xong gì:**
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

## 2. Trạng Thái Bàn Giao Hiện Tại (Cập Nhật: Ngày 23/11/2026)

### [BÀN GIAO PHIÊN LÀM VIỆC — NGÀY 23/11/2026]

1. **Phiên vừa rồi làm xong gì:**
   - Hoàn thành dịch 100% tiếng Việt cho toàn bộ hệ thống: **1.319 key** Storefront (`Shop`), **4.496 key** Bảng quản trị (`Admin`), `Product` (24 key sort options), `Core`, `Customer`, `Attribute` và `lang/vi/`.
   - Kiểm tra đối chiếu thực tế với 4 ảnh giao diện trước đây: 100% các chuỗi ("Stock Threshold", "Store Stats", "Total Unpaid Invoices", "Notifications", "Marketing", "Orders", "From A-Z", "Expensive First") đều đã dịch sang tiếng Việt và hiển thị chuẩn xác (`app()->getLocale() == 'vi'`).
   - Sửa dứt điểm lỗi Vue compiler `SyntaxError` trên Dashboard và lỗi `UnhandledMatchError` tiền tệ VNĐ.
   - Cập nhật `.gitignore` loại trừ `picturetemplate/`, `mockdata/*.sql`, `mockdata/*.zip`.
   - Chuẩn hóa bộ 4 tài liệu theo dõi trong `docs/tracking/` (`00_PROJECT_CONTEXT.md`, `01_ROADMAP_AND_TODO.md`, `02_TECHNICAL_NOTES_AND_BUGS.md`, `03_SESSION_HANDOFF.md`) với cấu trúc 5 Giai đoạn thực thi chi tiết.

2. **Trạng thái Kỹ thuật & CSDL hiện tại:**
   - **Nhánh Git hiện tại:** `feature/vietnamese-localization` (đang có thay đổi tại `.gitignore` và `docs/tracking/`).
   - **Trạng thái CSDL:** Đang kết nối MySQL 8.4 trên Laragon (`bagisto_db`), đã có bản sao lưu an toàn `mockdata/backup_before_perfume.sql`. File dữ liệu `vietnamese_content.php` và seeder `VietnameseContentSeeder.php` đã sẵn sàng thực thi.
   - **Trạng thái Môi trường:** `.env` đã cấu hình `APP_LOCALE=vi`, `APP_CURRENCY=VND`, `FILESYSTEM_DISK=public`. Server và cache hoạt động ổn định.

3. **Cảnh báo / Lưu ý quan trọng cho phiên sau:**
   - Tuyệt đối **KHÔNG** push trực tiếp lên nhánh `main`.
   - Không được sửa Mục 4.5 của Báo cáo Chuyên đề 1 khi chưa có ghi chú từ GVHD (thầy Nguyễn Hoàng Minh Nhật).
   - Không dàn dựng lỗi giả; mọi bug phát sinh phải ghi nhận trung thực vào `02_TECHNICAL_NOTES_AND_BUGS.md`.
   - Dữ liệu và hình ảnh chỉ dùng minh họa học thuật phi thương mại (MIT License của Bagisto).
   - Sau mỗi lượt chạy phải in **Báo Cáo Tiến Độ 4 Dòng**.

4. **HÀNH ĐỘNG CẦN THỰC HIỆN NGAY Ở PHIÊN TIẾP THEO (Giai đoạn 1 & 2A):**
   - **Bước 1 (Giai đoạn 1):** Cấu hình cô lập môi trường Offline trong Admin (tắt Social Login, reCAPTCHA, các cổng thanh toán online, chỉ giữ COD) và chạy seeder `VietnameseContentSeeder`.
   - **Bước 2 (Giai đoạn 2A):** Tạo 3 Custom Attributes EAV cho nước hoa (*Dung tích*, *Nhóm hương*, *Nồng độ*) gán vào bộ thuộc tính Simple Product.
   - **Bước 3 (Giai đoạn 2A):** Khởi tạo khung thư mục `picturetemplate/` và nạp 15–20 sản phẩm nước hoa thực tế (kèm 1 SP tồn kho 1, 1 SP tồn kho 5).
