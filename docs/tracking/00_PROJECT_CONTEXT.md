# 00_PROJECT_CONTEXT.md — Bối Cảnh Dự Án, Quy Tắc & Cơ Chế Vận Hành

> **Tài liệu tham chiếu tối cao cho mọi AI Agent và thành viên phát triển.**  
> Bất kỳ AI Agent nào khi bắt đầu phiên làm việc mới **BẮT BUỘC** phải đọc và tuân thủ toàn bộ nguyên tắc trong tài liệu này trước khi thực thi bất kỳ thao tác nào.

---

## 1. Thông Tin Tổng Quan Dự Án

- **Tên dự án:** Cửa Hàng Nước Hoa Cao Cấp (Perfume Store — "Shop Siuu" / Luxury Fragrance Platform).
- **Mục tiêu chuyên đề:** Chuyển đổi toàn diện từ đồ án demo công nghệ sang **Shop Nước Hoa Chuẩn Bản Địa Hóa Tiếng Việt (hỗ trợ Song ngữ Việt – Anh)**.
- **Mục tiêu bảo vệ:** Chạy **100% trên môi trường Localhost (Offline)**, vận hành độc lập, không phụ thuộc kết nối Internet hay dịch vụ đám mây bên ngoài khi trình bày trực tiếp trước Hội đồng chấm Chuyên đề tốt nghiệp.
- **Ngăn xếp công nghệ (Tech Stack):**
  - **Framework / Core:** Bagisto 2.4.x chạy trên nền Laravel 12 (PHP 8.3–8.4).
  - **Cơ sở dữ liệu:** MySQL 8.4 (InnoDB, EAV Architecture, UTF8MB4).
  - **Frontend:** Vue 3, Tailwind CSS 3, Vite 6, Blade Templates.
  - **Môi trường phát triển:** Laragon trên hệ điều hành Windows.

---

## 2. Phân Công Nhân Sự (Nhóm 2 Thành Viên)

| Thành viên | Vai trò | Nhiệm vụ chính & Trách nhiệm báo cáo |
|---|---|---|
| **Nguyễn Duy Hùng** | **Leader / Tech Lead** | - Quản trị kiến trúc hệ thống Bagisto, hạ tầng Windows/Laragon, Git repository.<br>- Chịu trách nhiệm toàn bộ công tác Bản địa hóa (Việt hóa giao diện Core, Shop, Admin, Packages).<br>- Thiết kế, tối ưu hóa CSDL (EAV, Indexing, Transactions, Backup).<br>- Chủ biên cuốn **Báo cáo Chuyên đề 1** (Kiến trúc hệ thống, Bản địa hóa & Cơ sở dữ liệu nâng cao). |
| **Phát** | **QA / Content & Visual** | - Quản trị tiến độ trên bảng Jira Kanban 2 người.<br>- Thiết kế nhận diện thương hiệu, hệ thống banner, hình ảnh nước hoa.<br>- Nhập liệu sản phẩm thực tế, kiểm thử chất lượng chức năng (Black-box Testing).<br>- Chủ biên cuốn **Báo cáo Chuyên đề 2** (Kiểm thử phần mềm chuẩn ISTQB & Đánh giá chất lượng ISO/IEC 25010). |

---

## 3. Bốn (04) Trụ Cột Tự Làm — Trọng Tâm Bảo Vệ Trước Hội Đồng

Để khẳng định khối lượng công việc thực chất tự xây dựng (không chỉ dừng ở việc cài đặt Bagisto mặc định), nhóm tập trung bảo vệ 4 trụ cột chuyên môn sâu:

### Trụ cột 1: Bản Địa Hóa Toàn Diện + Cô Lập Vận Hành Offline + Tự Động Hóa (`setup.bat`)
- Bản địa hóa 100% toàn bộ chuỗi giao diện: **1.319 key** Storefront (`Shop`), **4.496 key** Bảng quản trị (`Admin`), cùng toàn bộ packages phụ trợ (`Product`, `Customer`, `Attribute`, `Core`, `lang/vi/`).
- Cô lập hoàn toàn chế độ Offline: Vô hiệu hóa các dịch vụ bên thứ ba đòi hỏi internet (Google Social Login, Facebook Login, Google reCAPTCHA, PayPal, Stripe), chỉ giữ phương thức thanh toán nội địa (COD, Chuyển khoản ngân hàng).
- Xây dựng file thực thi tự động `setup.bat`: Tự sinh `.env`, đồng bộ tài nguyên hình ảnh từ `storage/app/public/` sang `public/storage/` (khắc phục triệt để lỗi symlink trên Windows), tự làm sạch cache chỉ với 1 click.

### Trụ cột 2: Thực Nghiệm Hiệu Năng Truy Vấn CSDL với `EXPLAIN ANALYZE`
- Xây dựng bài đo lường thực nghiệm khoa học trên bảng benchmark riêng biệt `exp_product_search_bench`, đối chứng hiệu năng tìm kiếm tiếng Việt trên tập dữ liệu sản phẩm:
  $$\text{Query LIKE \%...\%} \quad \text{vs} \quad \text{B-Tree Index} \quad \text{vs} \quad \text{FULLTEXT Index (ngram)}$$
- Khảo sát các trường hợp: tiếng Việt có dấu, không dấu, từ ngắn 2–3 ký tự.
- Sử dụng công cụ `EXPLAIN ANALYZE` của MySQL 8.4 để phân tích chi phí truy vấn (Query Cost), số lượng dòng duyệt qua (Rows Examined) và thời gian thực thi thực tế (Execution Time tính bằng mili-giây).

### Trụ cột 3: Mô Phỏng Giao Dịch Đồng Thời (Concurrency) & Khóa Bi Quan (`SELECT ... FOR UPDATE`)
- Thiết lập kịch bản tranh chấp tài nguyên tồn kho (Race Condition / Overselling) khi nhiều tiến trình/người dùng cùng đặt mua sản phẩm có số lượng tồn kho giới hạn (`qty = 1` và `qty = 5`).
- Xây dựng thực nghiệm đối chứng trên bản sao bảng tồn kho (`exp_product_inventories`), ghi chú rõ đây là mô phỏng tầng CSDL:
  - *Trường hợp 1 (Không khóa):* Dẫn đến sai lệch dữ liệu tồn kho (âm kho).
  - *Trường hợp 2 (Khóa bi quan):* Áp dụng `SELECT ... FOR UPDATE` trong Database Transaction của Laravel $\rightarrow$ dữ liệu toàn vẹn tuyệt đối.
- Thiết lập quy trình sao lưu và phục hồi CSDL tự động bằng `mysqldump` (kèm cờ `--single-transaction --routines --triggers --events`), xác thực tính toàn vẹn dữ liệu trước và sau sao lưu bằng `COUNT(*)` và `CHECKSUM TABLE`.

### Trụ cột 4: Kiểm Thử Hộp Đen Chuẩn ISTQB & Đánh Giá Chất Lượng ISO/IEC 25010
- Áp dụng các kỹ thuật thiết kế ca kiểm thử hộp đen tiêu chuẩn quốc tế: Phân vùng tương đương (Equivalence Partitioning - EP) và Phân tích giá trị biên (Boundary Value Analysis - BVA).
- Xây dựng Ma trận truy xuất nguồn gốc yêu cầu (Requirements Traceability Matrix - RTM) gắn liền với bộ **20 Test Cases chi tiết** được thực thi trực tiếp trên giao diện tiếng Việt.
- Đánh giá mức độ hoàn thiện chất lượng phần mềm theo bộ 8 đặc tính tiêu chuẩn quốc tế **ISO/IEC 25010** (Functional Suitability, Reliability, Performance Efficiency, Usability, Security, Maintainability, Portability, Compatibility).

---

## 4. Các Ràng Buộc Kỹ Thuật Tuyệt Đối (Guardrails)

1. **KHÔNG đập đi xây lại giao diện lõi Vue 3 / Blade của Bagisto:**  
   Mọi tùy biến phải tuân thủ kiến trúc mô-đun của Bagisto, ghi đè qua view component hoặc cấu hình theme; tuyệt đối không can thiệp thô bạo vào core framework gây xung đột khi nâng cấp.
2. **KHÔNG dàn dựng lỗi giả (Fake Bugs):**  
   Tất cả các lỗi ghi nhận trong nhật ký lỗi và báo cáo kiểm thử (BUG-01, BUG-02...) phải là **lỗi kỹ thuật thật** phát sinh trong quá trình dev/test thực tế (như lỗi ký tự quote làm vỡ Vue runtime, lỗi format tiền tệ VND, lỗi junction ảnh Windows...).
3. **KHÔNG sửa Mục 4.5 trong Báo cáo Chuyên đề 1:**  
   Tuyệt đối giữ nguyên hiện trạng mục này cho đến khi có ý kiến và ghi chú chỉ đạo gốc từ GVHD (thầy Nguyễn Hoàng Minh Nhật).
4. **Bảo mật và an toàn thông tin:**  
   Kiểm soát chặt chẽ file `.env` và `.gitignore`, tuyệt đối không commit các mã khóa API (như Cloudinary API keys, Database credentials thực tế) lên GitHub.
5. **Minh bạch bản quyền và học thuật:**  
   Tất cả hình ảnh sản phẩm do AI tạo hoặc dữ liệu sản phẩm thử nghiệm chỉ được sử dụng với mục đích minh họa học thuật phi thương mại, trên nền tảng mã nguồn mở giấy phép MIT của Bagisto.

---

## 5. Quy Tắc Cập Nhật Bắt Buộc Sau Mỗi Lượt Chạy (Mandatory Turn Protocol)

Sau khi hoàn thành bất kỳ tác vụ nào trong quá trình thực thi, Agent **BẮT BUỘC** thực hiện đồng bộ 4 bước sau:
1. Cập nhật tiến độ vào [01_ROADMAP_AND_TODO.md](file:///d:/CD12/bagisto-store/docs/tracking/01_ROADMAP_AND_TODO.md) (chuyển trạng thái `[ ]` sang `[x]`).
2. Ghi nhận nhật ký kỹ thuật, bài học hoặc lỗi thật mới (nếu có) vào [02_TECHNICAL_NOTES_AND_BUGS.md](file:///d:/CD12/bagisto-store/docs/tracking/02_TECHNICAL_NOTES_AND_BUGS.md).
3. Cập nhật phiếu bàn giao phiên làm việc tại [03_SESSION_HANDOFF.md](file:///d:/CD12/bagisto-store/docs/tracking/03_SESSION_HANDOFF.md).
4. In ra **Báo Cáo Tiến Độ 4 Dòng** ở cuối câu trả lời theo đúng định dạng:
   ```text
   - [Giai đoạn] <Tên giai đoạn & Tác vụ vừa hoàn thành>
   - [Trạng thái kỹ thuật] <Nhánh Git / Trạng thái DB / Localhost Server>
   - [Số liệu kiểm chứng] <Bằng chứng số liệu thật, lệnh CLI / kết quả kiểm thử>
   - [Kế hoạch kế tiếp] <Hành động cụ thể cần làm ngay trong bước tiếp theo>
   ```
