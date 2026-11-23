# THƯ MỤC ẢNH SẢN PHẨM NƯỚC HOA (PICTURETEMPLATE)

> **Mục đích:** Thư mục trung gian phục vụ bạn (Hùng) và Phát thu thập, thả ảnh thật trước khi import tự động vào hệ sinh thái Bagisto.  
> Sau khi kéo code từ GitHub về, Phát chỉ cần mở thư mục này và thả ảnh vào từng thư mục tương ứng.

---

## 1. QUY CHUẨN & THÔNG SỐ KỸ THUẬT ẢNH (DÀNH CHO PHÁT)

### A. Ảnh Sản Phẩm Nước Hoa (Trong 24 Thư Mục `<SKU>__<slug>`)
- **Tỉ lệ khung hình (Khuyên dùng):** Tỉ lệ vuông chuẩn **`1:1`** (kích thước lý tưởng: **`800x800 px`** hoặc **`1000x1000 px`**). Tỉ lệ này giúp khung lưới sản phẩm trên Storefront hiển thị thẳng hàng, không bị co giãn hay méo ảnh.
- **Số lượng ảnh mỗi chai:** Khuyên dùng **2 đến 3 ảnh** cho mỗi sản phẩm (tối thiểu 1 ảnh):
  - *Ảnh 1 (Ảnh đại diện - Thumbnail):* Ảnh chụp chính diện chai nước hoa kèm vỏ hộp đứng cạnh (khuyên dùng nền trắng hoặc nền studio sạch).
  - *Ảnh 2 (Chi tiết):* Ảnh cận cảnh chai nước hoa, vòi xịt hoặc nắp chai sang trọng.
  - *Ảnh 3 (Lifestyle / Nghệ thuật - Tùy chọn):* Ảnh chụp bối cảnh thực tế hoặc góc nghiêng nghệ thuật.
- **Định dạng file chấp nhận:** `JPG`, `JPEG`, `PNG`, hoặc `WEBP`.
- **Dung lượng file tối ưu:** Từ **`150 KB – 800 KB`** mỗi ảnh (tránh tải ảnh gốc quá nặng > 5MB để web load mượt mà).
- **Quy tắc đặt tên file:** Bạn có thể đặt tên file tùy ý (ví dụ: `anh1.jpg`, `box.png`, `creed.jpg`...). Hệ thống script tự động (Giai đoạn 2B) sẽ tự chuẩn hóa tên file tiếng Việt không dấu, viết thường, gạch ngang và nạp thẳng vào CSDL.

### B. Ảnh Thương Hiệu & Banner Trang Chủ (Trong Thư Mục `_branding/`)
1. **`logo.png` (Logo cửa hàng):**
   - Tỉ lệ: Dạng ngang $3:1$ hoặc $4:1$ (kích thước lý tưởng: **`300x80 px`** hoặc **`400x100 px`**).
   - Định dạng: Bắt buộc **PNG nền trong suốt (transparent)** để không bị lộ viền trắng khi đổi giao diện sáng/tối.
2. **`banner-1.jpg`, `banner-2.jpg`, `banner-3.jpg` (Banner Slider trang chủ):**
   - Tỉ lệ: Banner ngang rộng (kích thước chuẩn: **`1920x650 px`** hoặc tối thiểu **`1200x500 px`**).
   - Nội dung gợi ý:
     - *Banner 1:* Bộ sưu tập Nước hoa Nam đẳng cấp (Dior, Chanel, Creed).
     - *Banner 2:* Thiên đường Nước hoa Nữ quyến rũ (Miss Dior, YSL Libre, Coco Mademoiselle).
     - *Banner 3:* Tuyệt tác Nước hoa Niche & Chiết chính hãng (Le Labo, Tom Ford, Baccarat Rouge 540).

---

## 2. DANH SÁCH 24 THƯ MỤC & TỪ KHÓA TÌM ẢNH NHANH

| STT | Tên thư mục trong `picturetemplate/` | Tên đầy đủ chai nước hoa | Từ khóa gợi ý tìm ảnh chuẩn |
|:---:|:---|:---|:---|
| **I** | **NHÓM 1: NƯỚC HOA NAM (6 Chai)** | | |
| 1 | `PERFUME-0101__dior-sauvage-edp-100ml` | Nước Hoa Dior Sauvage EDP 100ml | `Dior Sauvage EDP 100ml bottle with box` |
| 2 | `PERFUME-0102__chanel-bleu-de-chanel-parfum-100ml` | Nước Hoa Chanel Bleu de Chanel Parfum 100ml | `Bleu de Chanel Parfum 100ml bottle and box` |
| 3 | `PERFUME-0103__creed-aventus-edp-100ml` | Nước Hoa Creed Aventus EDP 100ml Hoàng Gia | `Creed Aventus 100ml bottle with box luxury` |
| 4 | `PERFUME-0104__giorgio-armani-acqua-di-gio-profondo-100ml` | Nước Hoa Giorgio Armani Acqua Di Gio Profondo 100ml | `Acqua Di Gio Profondo 100ml bottle with box` |
| 5 | `PERFUME-0106__tom-ford-ombre-leather-edp-100ml` | Nước Hoa Tom Ford Ombre Leather EDP 100ml | `Tom Ford Ombre Leather EDP 100ml bottle with box` |
| 6 | `PERFUME-0107__ysl-y-eau-de-parfum-100ml` | Nước Hoa YSL Y Eau De Parfum 100ml | `YSL Y EDP 100ml bottle with packaging box` |
| **II** | **NHÓM 2: NƯỚC HOA NỮ (6 Chai)** | | |
| 7 | `PERFUME-0127__chanel-coco-mademoiselle-edp-100ml` | Nước Hoa Chanel Coco Mademoiselle EDP 100ml | `Chanel Coco Mademoiselle EDP 100ml bottle and box` |
| 8 | `PERFUME-0128__dior-miss-dior-edp-100ml` | Nước Hoa Dior Miss Dior EDP 100ml | `Miss Dior Eau de Parfum 100ml bottle with bow and box` |
| 9 | `PERFUME-0129__ysl-libre-eau-de-parfum-90ml` | Nước Hoa YSL Libre Eau De Parfum 90ml | `YSL Libre EDP 90ml bottle with box` |
| 10 | `PERFUME-0130__lancome-la-vie-est-belle-edp-100ml` | Nước Hoa Lancome La Vie Est Belle EDP 100ml | `Lancome La Vie Est Belle 100ml bottle with box` |
| 11 | `PERFUME-0131__narciso-rodriguez-musc-noir-rose-100ml` | Nước Hoa Narciso Rodriguez Musc Noir Rose 100ml | `Narciso Rodriguez Musc Noir Rose 100ml bottle and box` |
| 12 | `PERFUME-0134__kilian-good-girl-gone-bad-edp-50ml` | Nước Hoa Kilian Good Girl Gone Bad EDP 50ml | `Kilian Good Girl Gone Bad 50ml bottle with clutch box` |
| **III** | **NHÓM 3: NƯỚC HOA UNISEX (6 Chai)** | | |
| 13 | `PERFUME-0153__le-labo-santal-33-edp-50ml` | Nước Hoa Le Labo Santal 33 EDP 50ml | `Le Labo Santal 33 50ml bottle with box packaging` |
| 14 | `PERFUME-0154__le-labo-another-13-edp-50ml` | Nước Hoa Le Labo Another 13 EDP 50ml | `Le Labo Another 13 50ml bottle and box` |
| 15 | `PERFUME-0155__tom-ford-tobacco-vanille-edp-50ml` | Nước Hoa Tom Ford Tobacco Vanille EDP 50ml | `Tom Ford Tobacco Vanille 50ml bottle with box` |
| 16 | `PERFUME-0156__replica-by-the-fireplace-100ml` | Nước Hoa Replica By the Fireplace 100ml | `Maison Margiela Replica By the Fireplace 100ml bottle with box` |
| 17 | `PERFUME-0158__byredo-mojave-ghost-edp-100ml` | Nước Hoa Byredo Mojave Ghost EDP 100ml | `Byredo Mojave Ghost 100ml bottle and white box` |
| 18 | `PERFUME-0163__tom-ford-lost-cherry-edp-50ml` | Nước Hoa Tom Ford Lost Cherry EDP 50ml | `Tom Ford Lost Cherry 50ml red bottle with box` |
| **IV** | **NHÓM 4: NƯỚC HOA CHIẾT & MINI (6 Chai)** | | |
| 19 | `PERFUME-0181__chiet-creed-aventus-edp-10ml` | Nước Hoa Chiết Creed Aventus EDP 10ml | `Creed Aventus 10ml travel decant spray bottle` |
| 20 | `PERFUME-0182__chiet-le-labo-santal-33-edp-10ml` | Nước Hoa Chiết Le Labo Santal 33 EDP 10ml | `Le Labo Santal 33 10ml travel decant bottle` |
| 21 | `PERFUME-0184__chiet-baccarat-rouge-540-edp-10ml` | Nước Hoa Chiết Baccarat Rouge 540 EDP 10ml | `Baccarat Rouge 540 10ml decant spray bottle` |
| 22 | `PERFUME-0185__chiet-ysl-libre-edp-10ml` | Nước Hoa Chiết YSL Libre EDP 10ml | `YSL Libre EDP 10ml decant spray glass bottle` |
| 23 | `PERFUME-0199__mini-chanel-chance-eau-tendre-20ml` | Nước Hoa Mini Chanel Chance Eau Tendre 20ml | `Chanel Chance Eau Tendre 20ml twist and spray with box` |
| 24 | `PERFUME-0200__mini-dior-sauvage-travel-spray-20ml` | Nước Hoa Mini Dior Sauvage Travel Spray 20ml | `Dior Sauvage travel spray 20ml with box` |

---
*Sau khi thả ảnh xong, chỉ cần thông báo cho AI Agent để chạy lệnh tự động import toàn bộ vào hệ thống Bagisto!*
