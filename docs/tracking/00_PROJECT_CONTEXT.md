# 00_PROJECT_CONTEXT.md — Bối Cảnh Dự Án, Quy Tắc & Cơ Chế Vận Hành

> **Tài liệu tham chiếu tối cao cho mọi AI Agent và thành viên phát triển.**  
> Bất kỳ AI Agent nào khi bắt đầu phiên làm việc mới **BẮT BUỘC** phải đọc và tuân thủ toàn bộ nguyên tắc trong tài liệu này trước khi thực thi bất kỳ thao tác nào.

---

## 1. Thông Tin Tổng Quan Dự Án

- **Tên dự án:** **Maison P&H** — Hệ thống Thương mại Điện tử Nước Hoa Chính Hãng (Song ngữ Việt – Anh).
- **Bối cảnh & Chiến lược (Cập nhật 28/11/2026):**
  - Nhóm 3 thành viên tách ra trước đó đã chuyển sang phát triển một hệ thống web khác hoàn toàn, nên nhóm 2 thành viên (**Nguyễn Duy Hùng & Phát**) không còn rủi ro trùng lặp ý tưởng hay phải né phạm vi.
  - Nhóm **giữ nguyên và nâng cấp toàn bộ nền tảng Bagisto + 2 cuốn báo cáo cũ** (không phải làm lại từ đầu), tận dụng tối đa các tính năng kỹ thuật thực tế đã hoàn thiện trên hệ thống **Maison P&H**.
- **Mốc thời gian bảo vệ:**
  - **Code Freeze:** Từ **28/11/2026** (dừng thêm tính năng mới, dồn 100% thời gian sang xuất DB, chụp minh chứng, kiểm thử & biên tập báo cáo).
  - **Hạn nộp hồ sơ bảo vệ (2 cuốn báo cáo PDF, mã nguồn + DB, video demo):** **08/12/2026**.
  - **Công bố danh sách bảo vệ:** **11/12/2026** | **Bảo vệ trực tiếp:** **14/12 – 23/12/2026**.
- **Mục tiêu vận hành & Demo:**
  - Vận hành đa luồng trên **Laragon Apache (`http://bagisto-store.com`)**, kết hợp demo live **Google OAuth 2.0** và **Cổng thanh toán SePay Sandbox (VietQR & IPN)** khi có Internet, kèm **Video Demo 2,5–3 phút** quay sẵn làm phương án dự phòng.
- **Ngăn xếp công nghệ (Tech Stack):**
  - **Framework / Core:** Bagisto 2.4.x chạy trên nền Laravel 12 (PHP 8.3).
  - **Cơ sở dữ liệu:** MySQL 8.4 (InnoDB, EAV Architecture, UTF8MB4).
  - **Số liệu CSDL khóa cứng cho báo cáo:** **143 sản phẩm** (trong đó **32 sản phẩm** đã đồng bộ đầy đủ hình ảnh từ `picturetemplate/`), **50 đơn hàng** (`28/09/2026` – `28/11/2026`, đủ 7 trạng thái), **12 khách hàng**.
  - **Frontend:** Vue 3, Tailwind CSS 3, Vite 6, Blade Templates (Font `Be Vietnam Pro` & `Playfair Display`).

---

## 2. Phân Công Nhân Sự (Nhóm 2 Thành Viên)

| Thành viên | Vai trò | Nhiệm vụ chính & Trách nhiệm báo cáo |
|---|---|---|
| **Nguyễn Duy Hùng** | **Leader / Tech Lead** | - Quản trị kiến trúc hệ thống Bagisto, hạ tầng Windows/Laragon Apache (`http://bagisto-store.com`), Git repository.<br>- Bản địa hóa, tích hợp Google OAuth 2.0, Cổng thanh toán SePay Sandbox (VietQR & IPN), Admin 7 trạng thái đơn hàng.<br>- Thực nghiệm tối ưu CSDL (EAV, Indexing, `SELECT ... FOR UPDATE`, `mysqldump`).<br>- Chủ biên cuốn **Báo cáo Chuyên đề 1** (Kiến trúc hệ thống, Bản địa hóa & Cơ sở dữ liệu nâng cao). |
| **Phát** | **QA / Content & Visual** | - Quản trị tiến độ trên bảng Jira Kanban 2 người.<br>- Nhận diện thương hiệu **Maison P&H**, hình ảnh sản phẩm/banner, chụp trọn bộ ảnh minh chứng UI.<br>- Kiểm thử hộp đen chuẩn ISTQB (EP/BVA, Ma trận RTM, 25 Test Cases) & Đánh giá ISO/IEC 25010.<br>- Chủ biên cuốn **Báo cáo Chuyên đề 2** (Kiểm thử phần mềm chuẩn ISTQB & Đánh giá chất lượng ISO/IEC 25010). |

---

## 3. Bốn (04) Trụ Cột Tự Làm — Trọng Tâm Bảo Vệ Trước Hội Đồng

1. **Bản địa hóa & Tùy biến thương hiệu Maison P&H (Bagisto 2.4.x):**
   - Việt hóa toàn diện (**1.319 key** Storefront, **4.496 key** Admin), chuẩn hóa font tiếng Việt `Be Vietnam Pro` & `Playfair Display`, đồng bộ logo/favicon cho Storefront & Admin, tối ưu hiệu năng đa luồng trên Laragon Apache (`config:cache`, `route:cache`, `view:cache`).
   - Mở rộng EAV (*Dung tích, Nhóm hương, Nồng độ*), Kim tự tháp 3 tầng hương, Scent Finder Quiz (`/tim-mui-huong`), **Tra cứu đơn hàng (`/order-tracking`)** ở Footer, và **Bộ lọc nhanh + chỉnh sửa trực tiếp 7 trạng thái đơn hàng** trong Admin.
2. **Tích hợp Thanh toán SePay (VietQR & IPN) + Đăng nhập Google OAuth 2.0:**
   - Xây dựng `SepayPaymentService` ký HMAC-SHA256 Base64 chuẩn SDK `sepayvn/sepay-pg-php`, truyền `payment_method=BANK_TRANSFER` nhảy thẳng vào màn hình QR (`choose_payment_method=0`), tự động hủy đơn (`canceled`) khi `cancel_url`, tự động xuất hóa đơn trong `DB::transaction()` + `lockForUpdate()` khi nhận IPN `ORDER_PAID` (`X-Secret-Key`) hoặc `success_url`.
   - Cấu hình Google OAuth 2.0 (`stateless()` callback, đồng bộ `.env` và `core_config`), kèm kiểm thử tự động Pest `SepayWebhookTest.php` (`7/7 passed`, `14 assertions`).
3. **Thực nghiệm tối ưu CSDL MySQL 8.4 (`EXPLAIN ANALYZE`, Khóa bi quan `SELECT ... FOR UPDATE` & `mysqldump`):**
   - Đo hiệu năng tìm kiếm tiếng Việt (`LIKE` vs `B-Tree` vs `FULLTEXT`) trên `exp_product_search_bench` (`10k / 100k / 500k` dòng).
   - Mô phỏng tranh chấp tồn kho (`exp_product_inventories`) đối chứng có/không `SELECT ... FOR UPDATE`, và sao lưu/phục hồi `mysqldump` đối chiếu `COUNT(*)` + `CHECKSUM TABLE`.
4. **Kiểm thử hộp đen chuẩn ISTQB & Đánh giá chất lượng ISO/IEC 25010:**
   - Thiết kế Phân hoạch tương đương (EP), Giá trị biên (BVA), Ma trận truy vết (RTM) và thực thi **25 Test Cases** (20 ca cốt lõi + 5 ca mới cho Google OAuth, SePay QR/Hủy đơn, Tra cứu đơn `/order-tracking`, Lọc 7 trạng thái Admin) kèm nhật ký lỗi thực tế.

---

## 4. Các Ràng Buộc Kỹ Thuật Tuyệt Đối (Guardrails)

1. **Code Freeze từ 28/11/2026:** Không thêm tính năng mới hoặc cài package mới để tránh rủi ro sát ngày nộp **08/12/2026**.
2. **KHÔNG dàn dựng lỗi giả (Fake Bugs):** Tất cả lỗi ghi nhận trong báo cáo kiểm thử phải là **lỗi thật** đã gặp khi phát triển/test (lỗi thiếu `client_id` OAuth, lỗi Cloudflare WAF chặn `127.0.0.1` của SePay, lỗi symlink `public/storage` `403`, lỗi font tiếng Việt...).
3. **Sửa Mục 4.5 (CĐ1) & Mục 4.4 / 5.3 (CĐ2):** Thực hiện chỉnh sửa đúng theo ghi chú gốc của GVHD (thầy Nguyễn Hoàng Minh Nhật) trong giai đoạn biên tập báo cáo.
4. **Bảo mật & An toàn thông tin:** Không commit `.env` hay secret key thật lên GitHub.
5. **Minh bạch học thuật:** Bổ sung Tuyên bố liêm chính học thuật và Tài liệu tham khảo Tiếng Việt – Tiếng Anh đầy đủ ở cả 2 cuốn.

---

## 5. Quy Tắc Cập Nhật Bắt Buộc Sau Mỗi Lượt Chạy (Mandatory Turn Protocol)

Sau khi hoàn thành bất kỳ tác vụ nào trong quá trình thực thi, Agent **BẮT BUỘC** thực hiện đồng bộ:
1. Cập nhật tiến độ vào [01_ROADMAP_AND_TODO.md](file:///d:/CD12/bagisto-store/docs/tracking/01_ROADMAP_AND_TODO.md).
2. Ghi nhận nhật ký kỹ thuật/lỗi thật mới (nếu có) vào [02_TECHNICAL_NOTES_AND_BUGS.md](file:///d:/CD12/bagisto-store/docs/tracking/02_TECHNICAL_NOTES_AND_BUGS.md).
3. Cập nhật phiếu bàn giao phiên làm việc tại [03_SESSION_HANDOFF.md](file:///d:/CD12/bagisto-store/docs/tracking/03_SESSION_HANDOFF.md).
4. In ra **Báo Cáo Tiến Độ 4 Dòng** ở cuối câu trả lời.
