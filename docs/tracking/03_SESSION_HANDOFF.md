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
   - Chốt danh sách **24 sản phẩm nước hoa tiêu biểu và hoàn chỉnh nhất**, phân bổ cân đối 4 danh mục (6 Nam, 6 Nữ, 6 Unisex, 6 Chiết & Mini).
   - Vô hiệu hóa (`status = 0`, `visible_individually = 0`) toàn bộ sản phẩm dư thừa và các danh mục đồ công nghệ cũ; tái lập chỉ mục xác nhận đúng **24 sản phẩm hoạt động trên Storefront**.
   - Cập nhật nội dung mô tả dài HTML 4 phần chuyên nghiệp và gán đủ 3 thuộc tính lọc EAV (`capacity`, `fragrance_family`, `concentration`).
   - Đảm bảo 2 sản phẩm đặc thù: `PERFUME-0103` (`qty = 1`) và `PERFUME-0153` (`qty = 5`, `Weight = 1.0000`).
   - Tái cấu trúc thư mục `picturetemplate/` gồm đúng **24 thư mục con** dạng `<SKU>__<slug-ten-san-pham>` kèm file `info.txt` và `_branding/README.txt` hướng dẫn kích thước banner/logo.
   - Biên soạn quy chuẩn thông số ảnh (tỉ lệ 1:1, dung lượng 150-800KB, 2-3 ảnh/sản phẩm) và **đã commit + push toàn bộ khung thư mục lên GitHub** nhánh `feature/vietnamese-localization` để Phát chỉ cần pull về là thả ảnh được ngay.

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
