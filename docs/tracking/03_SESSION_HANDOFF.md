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

## 2. Trạng Thái Bàn Giao Hiện Tại (Cập Nhật: Ngày 24/11/2026)

### [BÀN GIAO PHIÊN LÀM VIỆC — NGÀY 25/11/2026]

1. **Phiên vừa rồi làm xong gì:**
   - **Giải đáp nguyên nhân kỹ thuật mất ảnh khi ngắt Wifi:** Phân tích cặn kẽ 3 nguyên nhân cốt lõi (Driver Cloudinary/CDN trỏ URL bên thứ ba, DNS Timeout khi ngắt mạng, và lỗi gãy Symlink NTFS trên Windows) $\rightarrow$ Khẳng định giải pháp Self-Hosted Local Storage (`FILESYSTEM_DISK=public` + `setup.bat`) là kiến trúc loại bỏ Single Point of Failure (SPOF) cho buổi bảo vệ đồ án trước Hội đồng.
   - **Xây dựng Script Rải Đơn Hàng Linh Hoạt (`tools/seed_scattered_orders.php`):**
     * Thiết kế script PHP CLI chạy độc lập, tái sử dụng không giới hạn: `php tools/seed_scattered_orders.php [count=30] [end_date=today|YYYY-MM-DD]`.
     * Tự động tạo 5 tài khoản khách hàng Việt Nam (`customers`) và kết hợp 40% khách vãng lai (Guest Checkout) với họ tên, số điện thoại, địa chỉ phân bố khắp các tỉnh thành (Hà Nội, TP.HCM, Đà Nẵng, Cần Thơ, Hải Phòng...).
     * Rải 30 đơn hàng giả lập thực tế với tỷ lệ chuẩn: 16 Hoàn thành (53%), 8 Đang xử lý (27%), 4 Chờ thanh toán (13%), 2 Đã hủy (7%).
     * Đảm bảo toàn vẹn quan hệ trên toàn bộ 8 bảng lõi: `orders`, `order_items`, `addresses` (shipping + billing), `order_payment`, `order_transactions`, `invoices`, `invoice_items`, `shipments`, `shipment_items`.
     * Rải đều đặn 1 ngày 1 đơn trong suốt 30 ngày (26/10/2026 - 25/11/2026) giúp biểu đồ Dashboard hiển thị đầy đủ các cột thay vì dồn vào 1 ngày.
   - **Chụp ảnh kiểm chứng thực tế:**
     * Chụp ảnh danh sách đơn hàng Admin (`step06_admin_scattered_orders.png`).
     * Chụp ảnh biểu đồ Admin Dashboard 30 ngày trải đều (`step06_admin_dashboard_scattered_30days.png`).
   - **Xuất bản CSDL hoàn thiện:**
     * Chạy `mysqldump` xuất file sao lưu `mockdata/database_final.sql` (1.5 MB), hoàn tất toàn bộ Giai đoạn 3 trong Roadmap.

2. **Trạng thái Kỹ thuật & CSDL hiện tại:**
   - **Nhánh Git hiện tại:** `feature/vietnamese-localization`.
   - **Trạng thái CSDL:** 36 đơn hàng tổng cộng (trong đó 30 đơn hàng nước hoa rải đều theo dòng thời gian), 5 tài khoản khách hàng Việt Nam, 103 bản ghi nước hoa tiếng Việt, 2 mã giảm giá hoạt động, 2 phương thức thanh toán.
   - **Trạng thái Môi trường:** `APP_LOCALE=vi`, `APP_CURRENCY=VND`, `FILESYSTEM_DISK=public`. Server và MySQL daemon chạy ổn định 100% offline trên cổng 8000.

3. **Cảnh báo / Lưu ý quan trọng cho phiên sau:**
   - Script `tools/seed_scattered_orders.php` mặc định kích hoạt chế độ `--clean` để thay thế đơn mock cũ (ID > 6), tránh bị phình số lượng đơn khi người dùng chạy lại nhiều lần.
   - Khi chạy trên ngày bảo vệ thực tế vào tháng 12/2026, chỉ cần gõ đúng 1 lệnh: `php tools/seed_scattered_orders.php 30 today` hoặc `php tools/seed_scattered_orders.php 30 2026-12-XX`.
   - Tuyệt đối **KHÔNG** push trực tiếp lên nhánh `main`.
   - Sau mỗi lượt chạy phải in **Báo Cáo Tiến Độ 4 Dòng**.

4. **HÀNH ĐỘNG CẦN THỰC HIỆN NGAY Ở PHIÊN TIẾP THEO:**
   - **Lựa chọn 1 (Giai đoạn 2B):** Khi có bộ ảnh thật từ bạn Phát trong `picturetemplate/`, chạy kịch bản import ảnh vào `storage/app/public/products/<id>/`.
   - **Lựa chọn 2 (Giai đoạn 4):** Triển khai 3 bài thực nghiệm Benchmark CSDL chuyên sâu (Benchmark 1: Fulltext ngram vs B-tree vs LIKE; Benchmark 2: Bi quan Pessimistic Locking chống Race Condition; Benchmark 3: Kiểm tra toàn vẹn và phục hồi dữ liệu mysqldump) để đưa số liệu vào Báo cáo Chuyên đề 1.
