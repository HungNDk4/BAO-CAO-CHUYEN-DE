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
   - Hoàn thành xuất bản sao lưu CSDL an toàn `mockdata/backup_before_perfume.sql` (2.529.428 bytes, ~2.5 MB) bằng `mysqldump` chuẩn `--single-transaction --routines --triggers --events`.
   - Kiểm tra và cô lập 100% môi trường Offline trong Admin: Social Login = 0, reCAPTCHA = 0, online payment gateways = 0, kích hoạt COD và Chuyển khoản ngân hàng (`moneytransfer = 1`).
   - Chạy thành công `php artisan db:seed --class=VietnameseContentSeeder`, `indexer:index --mode=full`, `optimize:clear` và đồng bộ 188 file ảnh từ `storage/app/public/` sang `public/storage/`. Xác nhận 0 placeholder rác trong DB.
   - Kiểm chứng 3 thuộc tính EAV nước hoa (`capacity`, `fragrance_family`, `concentration`) đã có sẵn tùy chọn song ngữ Việt-Anh, `is_filterable = 1`, thuộc nhóm General của Default Family.
   - Cấu hình chuẩn 2 sản phẩm kiểm thử đặc thù: `PERFUME-0103` (`qty = 1`) và `PERFUME-0153` (`qty = 5`, `Weight = 1.0000`).
   - Tự động tạo khung 103 thư mục con `picturetemplate/<SKU>/` cùng `_branding/` và `README.md` để Phát và Hùng thả ảnh thật. Thư mục đã được bỏ qua trong `.gitignore`.
   - Cập nhật tiến độ `[x]` cho toàn bộ Giai đoạn 1 và Giai đoạn 2A trong `01_ROADMAP_AND_TODO.md`.

2. **Trạng thái Kỹ thuật & CSDL hiện tại:**
   - **Nhánh Git hiện tại:** `feature/vietnamese-localization` (đang có commit mới, working tree sạch).
   - **Trạng thái CSDL:** Đã seed nội dung tiếng Việt chuẩn, 103 sản phẩm nước hoa sẵn sàng, đã có bản backup 2.5 MB an toàn.
   - **Trạng thái Môi trường:** `APP_LOCALE=vi`, `APP_CURRENCY=VND`, `FILESYSTEM_DISK=public`. Server và cache hoạt động trơn tru 100% offline.

3. **Cảnh báo / Lưu ý quan trọng cho phiên sau:**
   - Tuyệt đối **KHÔNG** push trực tiếp lên nhánh `main`.
   - Không được sửa Mục 4.5 của Báo cáo Chuyên đề 1 khi chưa có ghi chú từ GVHD (thầy Nguyễn Hoàng Minh Nhật).
   - Không dàn dựng lỗi giả; mọi bug phát sinh phải ghi nhận trung thực vào `02_TECHNICAL_NOTES_AND_BUGS.md`.
   - Dữ liệu và hình ảnh chỉ dùng minh họa học thuật phi thương mại (MIT License của Bagisto).
   - Sau mỗi lượt chạy phải in **Báo Cáo Tiến Độ 4 Dòng**.

4. **HÀNH ĐỘNG CẦN THỰC HIỆN NGAY Ở PHIÊN TIẾP THEO (Giai đoạn 2B & Giai đoạn 3):**
   - **Bước 1 (Giai đoạn 2B):** Khi người dùng thả ảnh vào `picturetemplate/`, chạy kịch bản quét, chuẩn hóa tên file tiếng Việt không dấu < 40 ký tự, import vào `storage/app/public/products/<id>/` và cập nhật `product_images` / branding.
   - **Bước 2 (Giai đoạn 3):** Tạo 4–5 khách hàng tiếng Việt, sinh 25–30 đơn hàng COD (18–20 đơn đã xuất Invoice/Shipment), chạy script SQL rải đều `created_at` + `updated_at` trong 30 ngày và xuất `mockdata/database_final.sql`.
