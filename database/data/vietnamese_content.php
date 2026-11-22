<?php

/*
|--------------------------------------------------------------------------
| CÁC KHẲNG ĐỊNH THƯƠNG MẠI (Đặt dạng biến để dễ dàng tinh chỉnh nhanh)
|--------------------------------------------------------------------------
| Người dùng có thể nhanh chóng thay đổi 4 giá trị này tùy theo thực tế shop:
*/
$claimAuthentic = '100% Nước Hoa Chính Hãng'; // Khẳng định 1: Cam kết Authentic
$claimSupport   = 'Tư Vấn Mùi Hương Tận Tâm 24/7'; // Khẳng định 2: Hỗ trợ tư vấn
$claimPackaging = 'Đóng gói chống sốc an toàn, giao nhanh mọi miền'; // Khẳng định 3: Quy cách đóng gói
$claimScale     = 'Hơn 100 mẫu nước hoa sẵn sàng cho bạn test mùi và xịt thử trực tiếp lên da. Tư vấn mùi hương chuyên nghiệp, tận tâm và không ép mua.'; // Khẳng định 4: Quy mô mẫu thử

return [
    /*
    |--------------------------------------------------------------------------
    | Theme Section Translations (Bản dịch tùy biến giao diện)
    |--------------------------------------------------------------------------
    | Giữ nguyên toàn bộ cấu trúc CSS, HTML tag, class và đường dẫn ảnh sample.
    | Các khối công khai sử dụng câu chữ trung tính, không chứa số liệu bịa đặt.
    | Section 26 được cấu hình ẩn (status = 0) là nơi DUY NHẤT chứa placeholder.
    */
    'theme_sections' => [
        2 => [
            'type'    => 'static_content',
            'options' => [
                'css'  => ".home-offer h1 {\n  display: block;\n  font-weight: 1000;\n  text-align: center;\n  font-size: 22px;\n  font-family: \"Playfair Display\", \"Times New Roman\", serif;\n  background-color: #e8edfe;\n  padding-top: 20px;\n  padding-bottom: 20px;\n}\n\n@media (max-width: 768px) {\n  .home-offer h1 {\n    font-size: 18px;\n    padding-top: 10px;\n    padding-bottom: 10px;\n  }\n} \n\n@media (max-width: 525px) {\n  .home-offer h1 {\n    font-size: 14px;\n    padding-top: 6px;\n    padding-bottom: 6px;\n  }\n}",
                'html' => "<div class=\"home-offer\"><h1>ƯU ĐÃI ĐẶC BIỆT - THẾ GIỚI NƯỚC HOA CHÍNH HÃNG &amp; ĐẲNG CẤP</h1></div>",
            ],
        ],
        12 => [
            'type'    => 'services_content',
            'options' => [
                'services' => [
                    [
                        'title'        => 'Giao Hàng Toàn Quốc',
                        'description'  => $claimPackaging,
                        'service_icon' => 'icon-truck',
                    ],
                    [
                        'title'        => $claimAuthentic,
                        'description'  => 'Cam kết hàng chính hãng, nguồn gốc rõ ràng và uy tín',
                        'service_icon' => 'icon-product',
                    ],
                    [
                        'title'        => $claimSupport,
                        'description'  => 'Chuyên gia hỗ trợ chọn note hương phù hợp phong cách & thời tiết',
                        'service_icon' => 'icon-support',
                    ],
                ],
            ],
        ],
        16 => [
            'type'    => 'category_carousel',
            'options' => [
                'title'   => 'Danh Mục Nước Hoa',
                'filters' => [],
            ],
        ],
        18 => [
            'type'    => 'product_carousel',
            'options' => [
                'title'   => 'Sản Phẩm Nổi Bật',
                'filters' => [
                    'limit'    => '12',
                    'featured' => '1',
                ],
            ],
        ],
        19 => [
            'type'    => 'image_carousel',
            'options' => [
                'images' => [
                    [
                        'link'  => '/nuoc-hoa-nam',
                        'image' => 'storage/themes/default/sections/19/acrpKL0hcAb66rOjph50MkDSCUY2SC2spx1zWq3K.webp',
                        'title' => 'Bộ Sưu Tập Nước Hoa Nam Đẳng Cấp',
                    ],
                    [
                        'link'  => '/nuoc-hoa-nu',
                        'image' => 'storage/themes/default/sections/19/DPrdA7D9jK9Qxo2iwe46EoEWOx4B39FwcN5y3fbS.webp',
                        'title' => 'Hương Thơm Nữ Tính Quyến Rũ',
                    ],
                    [
                        'link'  => '/nuoc-hoa-chiet-mini',
                        'image' => 'storage/themes/default/sections/19/jI6aLk19UTl7ado1Pu1tg8crvPHLTuLimJkCeYwg.webp',
                        'title' => 'Nước Hoa Chiết & Mini Tiện Lợi',
                    ],
                ],
            ],
        ],
        22 => [
            'type'    => 'static_content',
            'options' => [
                'css'  => "/* Container wrapper */\n.siuu-banner-wrapper {\n  width: 100%;\n  padding: 40px 16px;\n  display: flex;\n  justify-content: center;\n  align-items: center;\n  box-sizing: border-box;\n}\n\n/* Promo banner frame */\n.siuu-promo-banner {\n  display: flex;\n  flex-direction: row;\n  width: 100%;\n  max-width: 1240px;\n  min-height: 420px;\n  border-radius: 16px;\n  overflow: hidden;\n  box-shadow: 0 10px 25px -5px rgba(0, 0, 0, 0.1);\n  background-color: #0b111e;\n}\n\n/* Left image column */\n.siuu-banner-image {\n  flex: 1.1;\n  position: relative;\n  background-color: #f1f5f9;\n  overflow: hidden;\n}\n\n.siuu-banner-image img {\n  width: 100%;\n  height: 100%;\n  object-fit: cover;\n  display: block;\n}\n\n/* Right content column */\n.siuu-banner-content {\n  flex: 0.9;\n  background-color: #0b111e;\n  color: #ffffff;\n  padding: 48px;\n  display: flex;\n  flex-direction: column;\n  justify-content: center;\n  align-items: flex-start;\n  box-sizing: border-box;\n}\n\n.siuu-tagline {\n  font-size: 0.875rem;\n  font-weight: 600;\n  text-transform: uppercase;\n  letter-spacing: 1.5px;\n  color: #94a3b8;\n  margin-bottom: 12px;\n}\n\n.siuu-title {\n  font-size: 2rem;\n  line-height: 1.3;\n  font-weight: 800;\n  color: #ffffff;\n  margin-bottom: 16px;\n}\n\n.siuu-desc {\n  font-size: 0.95rem;\n  line-height: 1.6;\n  color: #cbd5e1;\n  margin-bottom: 28px;\n}\n\n.siuu-btn {\n  display: inline-block;\n  background-color: #2563eb;\n  color: #ffffff !important;\n  font-size: 0.95rem;\n  font-weight: 600;\n  padding: 12px 28px;\n  border-radius: 8px;\n  text-decoration: none;\n  transition: background-color 0.2s ease;\n}\n\n.siuu-btn:hover {\n  background-color: #1d4ed8;\n}\n\n/* Mobile responsive */\n@media (max-width: 768px) {\n  .siuu-promo-banner {\n    flex-direction: column;\n  }\n  .siuu-banner-image {\n    min-height: 240px;\n  }\n  .siuu-banner-content {\n    padding: 28px 20px;\n  }\n  .siuu-title {\n    font-size: 1.5rem;\n  }\n}",
                'html' => "<div class=\"siuu-banner-wrapper\">\r\n  <div class=\"siuu-promo-banner\">\r\n    \r\n    <div class=\"siuu-banner-image\">\r\n      <img src=\"https://images.unsplash.com/photo-1615663245857-ac93bb7c39e7?q=80&amp;w=1000&amp;auto=format&amp;fit=crop\" alt=\"Không gian trải nghiệm nước hoa chính hãng\" />\r\n    </div>\r\n\r\n    \r\n    <div class=\"siuu-banner-content\">\r\n      <span class=\"siuu-tagline\">Showroom Nước Hoa Chính Hãng</span>\r\n      <h2 class=\"siuu-title\">Đừng chỉ nghe kể,<br />hãy tự mình cảm nhận hương thơm</h2>\r\n      <p class=\"siuu-desc\">\r\n        {$claimScale}\r\n      </p>\r\n      <a href=\"/nuoc-hoa-nam\" class=\"siuu-btn\">Khám Phá Ngay</a>\r\n    </div>\r\n  </div>\r\n</div>",
            ],
        ],
        23 => [
            'type'    => 'product_carousel',
            'options' => [
                'title'       => 'Nước Hoa Nam Lịch Lãm',
                'target_slug' => 'nuoc-hoa-nam',
                'filters'     => [
                    'sort' => 'created_at-desc',
                ],
            ],
        ],
        25 => [
            'type'    => 'product_carousel',
            'options' => [
                'title'       => 'Nước Hoa Nữ Quyến Rũ',
                'target_slug' => 'nuoc-hoa-nu',
                'filters'     => [],
            ],
        ],
        26 => [
            'type'    => 'static_content',
            'options' => [
                'css'  => ".siuu-footer-wrapper {\n  width: 100%;\n  background-color: #f8fafc;\n  border-top: 1px solid #e2e8f0;\n  padding: 30px 20px 20px !important; /* Compact padding */\n  margin-bottom: 0 !important;\n  box-sizing: border-box;\n}\n\n.siuu-footer-container {\n  max-width: 1240px;\n  margin: 0 auto;\n  display: flex;\n  justify-content: space-between;\n  flex-wrap: wrap;\n  gap: 20px;\n}\n\n.siuu-footer-col {\n  flex: 1 1 220px;\n}\n\n.siuu-f-title {\n  font-size: 0.95rem;\n  font-weight: 700;\n  color: #0f172a;\n  margin-bottom: 12px;\n  text-transform: uppercase;\n}\n\n.siuu-f-desc, .siuu-f-info {\n  font-size: 0.85rem;\n  line-height: 1.5;\n  color: #64748b;\n  margin-bottom: 8px;\n}\n\n.siuu-f-links {\n  list-style: none;\n  padding: 0;\n  margin: 0;\n}\n\n.siuu-f-links li {\n  margin-bottom: 8px;\n}\n\n.siuu-f-links a {\n  text-decoration: none;\n  color: #475569;\n  font-size: 0.875rem;\n  transition: color 0.2s;\n}\n\n.siuu-f-links a:hover {\n  color: #2563eb;\n}\n\n/* Email subscribe form styling */\n.siuu-f-form {\n  display: flex !important;\n  align-items: center;\n  margin-top: 10px;\n  margin-bottom: 10px;\n  width: 100%;\n  max-width: 280px;\n}\n\n.siuu-f-input {\n  flex: 1 !important;\n  display: block !important;\n  height: 38px !important;\n  padding: 0 12px !important;\n  border: 1px solid #cbd5e1 !important;\n  border-radius: 6px 0 0 6px !important;\n  outline: none !important;\n  background-color: #ffffff !important;\n  color: #0f172a !important;\n  font-size: 0.875rem !important;\n  box-sizing: border-box !important;\n}\n\n.siuu-f-btn {\n  height: 38px !important;\n  background-color: #2563eb !important;\n  color: #ffffff !important;\n  border: none !important;\n  padding: 0 16px !important;\n  border-radius: 0 6px 6px 0 !important;\n  cursor: pointer;\n  font-weight: 600;\n  font-size: 0.875rem !important;\n  box-sizing: border-box !important;\n  white-space: nowrap;\n}\n\n.siuu-f-badge {\n  font-size: 0.8rem;\n  color: #16a34a;\n  font-weight: 600;\n}\n\n@media (max-width: 768px) {\n  .siuu-footer-container {\n    flex-direction: column;\n  }\n}",
                'html' => "<div class=\"siuu-footer-wrapper\">\r\n  <div class=\"siuu-footer-container\">\r\n    \r\n    <div class=\"siuu-footer-col\">\r\n      <h3 class=\"siuu-f-title\">Perfume Store - Thế Giới Nước Hoa</h3>\r\n      <p class=\"siuu-f-desc\">Hệ thống phân phối nước hoa chính hãng, nước hoa chiết và fullbox cao cấp hàng đầu.</p>\r\n      <p class=\"siuu-f-info\"><strong>Địa chỉ:</strong> [Địa chỉ showroom cửa hàng]</p>\r\n      <p class=\"siuu-f-info\"><strong>Hotline:</strong> [Hotline hỗ trợ]</p>\r\n    </div>\r\n\r\n    \r\n    <div class=\"siuu-footer-col\">\r\n      <h3 class=\"siuu-f-title\">Hỗ Trợ Khách Hàng</h3>\r\n      <ul class=\"siuu-f-links\">\r\n        <li><a href=\"/page/ve-chung-toi\">Về Chúng Tôi</a></li>\r\n        <li><a href=\"/page/cham-soc-khach-hang\">Chăm Sóc Khách Hàng</a></li>\r\n        <li><a href=\"/page/dieu-khoan-su-dung\">Điều Khoản Sử Dụng</a></li>\r\n      </ul>\r\n    </div>\r\n\r\n    \r\n    <div class=\"siuu-footer-col\">\r\n      <h3 class=\"siuu-f-title\">Chính Sách Cửa Hàng</h3>\r\n      <ul class=\"siuu-f-links\">\r\n        <li><a href=\"/page/chinh-sach-bao-mat\">Chính Sách Bảo Mật</a></li>\r\n        <li><a href=\"/page/chinh-sach-giao-hang\">Chính Sách Vận Chuyển</a></li>\r\n        <li><a href=\"/page/chinh-sach-doi-tra\">Chính Sách Đổi Trả</a></li>\r\n      </ul>\r\n    </div>\r\n\r\n    \r\n    <div class=\"siuu-footer-col\">\r\n      <h3 class=\"siuu-f-title\">Đăng Ký Nhận Tin</h3>\r\n      <p class=\"siuu-f-desc\">Đăng ký nhận thông tin các bộ sưu tập nước hoa mới và ưu đãi đặc quyền.</p>\r\n      <div class=\"siuu-f-form\">\r\n        <button type=\"button\" class=\"siuu-f-btn\">Đăng Ký</button>\r\n      </div>\r\n      <p class=\"siuu-f-badge\">✓ Cam Kết 100% Authentic</p>\r\n    </div>\r\n  </div>\r\n</div>",
            ],
        ],
        27 => [
            'type'     => 'footer_links',
            'link_map' => [
                'about-us'         => ['url' => '/page/ve-chung-toi', 'title' => 'Về Chúng Tôi'],
                'customer-service' => ['url' => '/page/cham-soc-khach-hang', 'title' => 'Chăm Sóc Khách Hàng'],
                'whats-new'        => ['url' => '/page/xu-huong-moi', 'title' => 'Bộ Sưu Tập Mới'],
                'terms-of-use'     => ['url' => '/page/dieu-khoan-su-dung', 'title' => 'Điều Khoản Sử Dụng'],
                'terms-conditions' => ['url' => '/page/dieu-kien-giao-dich', 'title' => 'Điều Kiện Giao Dịch'],
                'privacy-policy'   => ['url' => '/page/chinh-sach-bao-mat', 'title' => 'Chính Sách Bảo Mật'],
                'payment-policy'   => ['url' => '/page/chinh-sach-thanh-toan', 'title' => 'Chính Sách Thanh Toán'],
                'shipping-policy'  => ['url' => '/page/chinh-sach-giao-hang', 'title' => 'Chính Sách Vận Chuyển'],
                'return-policy'    => ['url' => '/page/chinh-sach-doi-tra', 'title' => 'Chính Sách Đổi Trả'],
                'refund-policy'    => ['url' => '/page/chinh-sach-hoan-tien', 'title' => 'Chính Sách Hoàn Tiền'],
            ],
        ],
    ],

    /*
    |--------------------------------------------------------------------------
    | CMS Page Translations (10 trang CMS tiêu chuẩn tiếng Việt)
    | Tuyệt đối không chứa bất kỳ [Placeholder] nào trên toàn bộ 10 trang CMS.
    |--------------------------------------------------------------------------
    */
    'cms_pages' => [
        1 => [ // about-us
            'page_title'       => 'Về Chúng Tôi',
            'url_key'          => 've-chung-toi',
            'html_content'     => '<div class="static-container"><h2 class="mb-4 text-2xl font-bold">Về Perfume Store</h2><p class="mb-4">Chào mừng bạn đến với <strong>Perfume Store</strong> - điểm đến tin cậy của những tín đồ yêu hương thơm cao cấp tại Việt Nam. Chúng tôi chuyên cung cấp các dòng nước hoa chính hãng từ các thương hiệu danh tiếng.</p><p class="mb-4">Với tôn chỉ <em>"Chất lượng tạo nên uy tín"</em>, mọi sản phẩm tại cửa hàng đều được kiểm định nguồn gốc xuất xứ nghiêm ngặt, cam kết hàng chính hãng chuẩn Authentic.</p><h3 class="mb-2 text-xl font-semibold">Tầm nhìn & Sứ mệnh</h3><p class="mb-4">Mang đến cho khách hàng không gian trải nghiệm mùi hương đẳng cấp, tinh tế và văn minh, giúp mỗi cá nhân định hình phong cách độc bản qua từng nốt hương.</p></div>',
            'meta_title'       => 'Về Chúng Tôi - Perfume Store Nước Hoa Chính Hãng',
            'meta_description' => 'Giới thiệu Perfume Store - Hệ thống phân phối nước hoa chính hãng cao cấp tại Việt Nam.',
            'meta_keywords'    => 'về chúng tôi, nước hoa chính hãng, perfume store, ve chung toi, nuoc hoa chinh hang',
        ],
        2 => [ // return-policy
            'page_title'       => 'Chính Sách Đổi Trả',
            'url_key'          => 'chinh-sach-doi-tra',
            'html_content'     => '<div class="static-container"><h2 class="mb-4 text-2xl font-bold">Chính Sách Đổi Trả Hàng</h2><p class="mb-4">Perfume Store cam kết hỗ trợ đổi trả hàng thuận tiện và nhanh chóng nhằm bảo vệ quyền lợi tối đa của quý khách:</p><ul class="list-disc pl-6 mb-4"><li><strong>Thời hạn đổi trả:</strong> Hỗ trợ đổi trả theo quy định hiện hành của cửa hàng kể từ ngày nhận hàng.</li><li><strong>Điều kiện áp dụng:</strong> Sản phẩm còn nguyên tem niêm phong, hộp và phụ kiện đi kèm, chưa qua sử dụng hoặc có lỗi kỹ thuật từ nhà sản xuất (vòi xịt lỗi, nứt vỡ do vận chuyển).</li><li><strong>Quy trình xử lý:</strong> Liên hệ bộ phận chăm sóc khách hàng hoặc mang trực tiếp đến showroom để được hỗ trợ thẩm định và xử lý đổi mới nhanh chóng.</li></ul></div>',
            'meta_title'       => 'Chính Sách Đổi Trả - Perfume Store',
            'meta_description' => 'Chính sách đổi trả sản phẩm linh hoạt, an tâm tại Perfume Store.',
            'meta_keywords'    => 'chính sách đổi trả, đổi trả nước hoa, chinh sach doi tra, doi tra nuoc hoa',
        ],
        3 => [ // refund-policy
            'page_title'       => 'Chính Sách Hoàn Tiền',
            'url_key'          => 'chinh-sach-hoan-tien',
            'html_content'     => '<div class="static-container"><h2 class="mb-4 text-2xl font-bold">Chính Sách Hoàn Tiền</h2><p class="mb-4">Perfume Store cam kết hoàn tiền minh bạch và đúng cam kết trong các trường hợp sau:</p><ul class="list-disc pl-6 mb-4"><li>Sản phẩm giao không đúng đơn đặt hàng và không còn hàng thay thế.</li><li>Sản phẩm bị lỗi kỹ thuật nặng hoặc hư hại trong quá trình vận chuyển đã được xác nhận.</li><li>Phương thức hoàn tiền: Chuyển khoản ngân hàng trực tiếp sau khi hoàn tất thủ tục nhận lại sản phẩm.</li></ul></div>',
            'meta_title'       => 'Chính Sách Hoàn Tiền - Perfume Store',
            'meta_description' => 'Cam kết hoàn tiền minh bạch và an toàn tại Perfume Store.',
            'meta_keywords'    => 'chính sách hoàn tiền, hoàn tiền, chinh sach hoan tien, hoan tien nuoc hoa',
        ],
        4 => [ // terms-conditions
            'page_title'       => 'Điều Kiện Giao Dịch',
            'url_key'          => 'dieu-kien-giao-dich',
            'html_content'     => '<div class="static-container"><h2 class="mb-4 text-2xl font-bold">Điều Kiện Giao Dịch Chung</h2><p class="mb-4">Khi thực hiện đặt hàng trên hệ thống Perfume Store, quý khách đồng ý tuân thủ các điều kiện giao dịch sau:</p><ul class="list-disc pl-6 mb-4"><li>Mọi thông tin giá cả và khuyến mãi trên website áp dụng tại thời điểm đặt hàng thành công.</li><li>Đơn hàng được xác nhận thông qua thông báo điện tử hoặc liên hệ từ nhân viên chăm sóc khách hàng.</li><li>Perfume Store có quyền từ chối các đơn hàng có dấu hiệu gian lận hoặc thông tin giao nhận không rõ ràng.</li></ul></div>',
            'meta_title'       => 'Điều Kiện Giao Dịch - Perfume Store',
            'meta_description' => 'Quy định và điều kiện giao dịch thương mại tại Perfume Store.',
            'meta_keywords'    => 'điều kiện giao dịch, mua bán nước hoa, dieu kien giao dich, hop dong mua ban',
        ],
        5 => [ // terms-of-use
            'page_title'       => 'Điều Khoản Sử Dụng',
            'url_key'          => 'dieu-khoan-su-dung',
            'html_content'     => '<div class="static-container"><h2 class="mb-4 text-2xl font-bold">Điều Khoản Sử Dụng Website</h2><p class="mb-4">Chào mừng quý khách đến với website của Perfume Store. Việc truy cập và sử dụng dịch vụ đồng nghĩa với việc quý khách chấp nhận các điều khoản quy định dưới đây:</p><p class="mb-4">Nghiêm cấm mọi hành vi sao chép nội dung, can thiệp mã nguồn hoặc sử dụng hình ảnh sản phẩm cho mục đích thương mại trái phép khi chưa có sự đồng ý.</p></div>',
            'meta_title'       => 'Điều Khoản Sử Dụng - Perfume Store',
            'meta_description' => 'Các điều khoản sử dụng nền tảng mua sắm trực tuyến Perfume Store.',
            'meta_keywords'    => 'điều khoản sử dụng, quy chế hoạt động, dieu khoan su dung, quy che hoat dong',
        ],
        6 => [ // customer-service
            'page_title'       => 'Chăm Sóc Khách Hàng',
            'url_key'          => 'cham-soc-khach-hang',
            'html_content'     => '<div class="static-container"><h2 class="mb-4 text-2xl font-bold">Trung Tâm Chăm Sóc Khách Hàng</h2><p class="mb-4">Chúng tôi luôn lắng nghe và sẵn sàng giải đáp mọi thắc mắc của quý khách về sản phẩm và dịch vụ:</p><ul class="list-disc pl-6 mb-4"><li><strong>Hỗ trợ trực tuyến:</strong> Đội ngũ tư vấn viên am hiểu sâu về các tầng hương luôn sẵn sàng hỗ trợ quý khách qua các kênh liên hệ chính thức của cửa hàng.</li><li><strong>Tư vấn chọn mùi hương:</strong> Hỗ trợ gợi ý các dòng nước hoa phù hợp theo mùa, độ tuổi, phong cách và môi trường làm việc.</li><li><strong>Xử lý đơn hàng:</strong> Tiếp nhận và hỗ trợ thông tin đơn hàng, bảo hành đổi trả nhanh chóng và thuận tiện.</li></ul></div>',
            'meta_title'       => 'Chăm Sóc Khách Hàng - Perfume Store',
            'meta_description' => 'Kênh liên hệ chăm sóc và hỗ trợ khách hàng của Perfume Store.',
            'meta_keywords'    => 'chăm sóc khách hàng, hỗ trợ nước hoa, cham soc khach hang, ho tro nuoc hoa',
        ],
        7 => [ // whats-new
            'page_title'       => 'Bộ Sưu Tập Mới',
            'url_key'          => 'xu-huong-moi',
            'html_content'     => '<div class="static-container"><h2 class="mb-4 text-2xl font-bold">Xu Hướng Mùi Hương Mới</h2><p class="mb-4">Cập nhật liên tục những sáng tạo mùi hương mới nhất từ các nhà mốt danh tiếng trên thế giới.</p><p class="mb-4">Khám phá các nốt hương gỗ phương Đông ấm áp, hương hoa cỏ nhẹ nhàng thanh khiết hay hương da thuộc lịch lãm độc bản.</p></div>',
            'meta_title'       => 'Bộ Sưu Tập Nước Hoa Mới Nhất - Perfume Store',
            'meta_description' => 'Khám phá các dòng nước hoa mới cập nhật tại Perfume Store.',
            'meta_keywords'    => 'xu hướng mới, bộ sưu tập nước hoa, xu huong moi, bo suu tap nuoc hoa',
        ],
        8 => [ // payment-policy
            'page_title'       => 'Chính Sách Thanh Toán',
            'url_key'          => 'chinh-sach-thanh-toan',
            'html_content'     => '<div class="static-container"><h2 class="mb-4 text-2xl font-bold">Chính Sách Thanh Toán</h2><p class="mb-4">Nhằm mang lại trải nghiệm mua sắm an tâm và tiện lợi nhất, Perfume Store hỗ trợ hình thức:</p><ul class="list-disc pl-6 mb-4"><li><strong>Thanh toán khi nhận hàng (COD):</strong> Quý khách nhận hàng, kiểm tra ngoại quan gói hàng và thanh toán tiền mặt trực tiếp cho nhân viên giao hàng.</li><li><strong>Chuyển khoản trực tiếp:</strong> Hỗ trợ thanh toán nhanh qua tài khoản ngân hàng nội địa với cú pháp mã đơn hàng.</li></ul></div>',
            'meta_title'       => 'Chính Sách Thanh Toán - Perfume Store',
            'meta_description' => 'Các phương thức thanh toán an toàn, linh hoạt tại Perfume Store.',
            'meta_keywords'    => 'chính sách thanh toán, thanh toán cod, chinh sach thanh toan, cod',
        ],
        9 => [ // shipping-policy
            'page_title'       => 'Chính Sách Vận Chuyển',
            'url_key'          => 'chinh-sach-giao-hang',
            'html_content'     => '<div class="static-container"><h2 class="mb-4 text-2xl font-bold">Chính Sách Vận Chuyển & Giao Nhận</h2><p class="mb-4">Quy chuẩn đóng gói và thời gian giao hàng tại Perfume Store:</p><ul class="list-disc pl-6 mb-4"><li><strong>Đóng gói chuyên biệt:</strong> Chai nước hoa được bọc bóng khí chống va đập đa lớp và đặt trong hộp carton bảo vệ.</li><li><strong>Thời gian giao hàng tiêu chuẩn:</strong> Giao hàng nhanh nội thành và toàn quốc theo lộ trình của đơn vị vận chuyển uy tín.</li><li><strong>Đồng kiểm khi nhận:</strong> Quý khách được kiểm tra ngoại quan kiện hàng trước khi thanh toán.</li></ul></div>',
            'meta_title'       => 'Chính Sách Vận Chuyển - Perfume Store',
            'meta_description' => 'Quy định vận chuyển và giao nhận hàng hóa an toàn tại Perfume Store.',
            'meta_keywords'    => 'chính sách vận chuyển, giao hàng nước hoa, chinh sach van chuyen, giao hang',
        ],
        10 => [ // privacy-policy
            'page_title'       => 'Chính Sách Bảo Mật',
            'url_key'          => 'chinh-sach-bao-mat',
            'html_content'     => '<div class="static-container"><h2 class="mb-4 text-2xl font-bold">Chính Sách Bảo Mật Thông Tin</h2><p class="mb-4">Perfume Store cam kết tôn trọng và bảo vệ tuyệt đối thông tin cá nhân của quý khách:</p><ul class="list-disc pl-6 mb-4"><li>Thông tin thu thập (họ tên, số điện thoại, địa chỉ) chỉ phục vụ cho việc xử lý đơn hàng và giao nhận.</li><li>Chúng tôi tuyệt đối không chia sẻ hoặc cung cấp thông tin khách hàng cho bên thứ ba vì mục đích thương mại.</li><li>Hệ thống lưu trữ nội bộ được bảo mật an toàn theo tiêu chuẩn.</li></ul></div>',
            'meta_title'       => 'Chính Sách Bảo Mật Thông Tin - Perfume Store',
            'meta_description' => 'Cam kết bảo mật dữ liệu khách hàng tuyệt đối tại Perfume Store.',
            'meta_keywords'    => 'chính sách bảo mật, bảo vệ thông tin, chinh sach bao mat, bao ve thong tin',
        ],
    ],

    /*
    |--------------------------------------------------------------------------
    | Channel Translations (Cấu hình kênh bán hàng)
    |--------------------------------------------------------------------------
    */
    'channel' => [
        'name'              => 'Cửa Hàng Nước Hoa Chính Hãng',
        'home_seo'          => [
            'meta_title'       => 'Perfume Store - Thế Giới Nước Hoa Chính Hãng Cao Cấp',
            'meta_keywords'    => 'nước hoa, nước hoa nam, nước hoa nữ, nước hoa unisex, nước hoa chính hãng, nuoc hoa, nuoc hoa nam, nuoc hoa nu, perfume store',
            'meta_description' => 'Cửa hàng nước hoa cao cấp, phân phối nước hoa niche & designer chuẩn Authentic với giá tốt nhất.',
        ],
    ],

    /*
    |--------------------------------------------------------------------------
    | Core Config (Cấu hình hệ thống phương thức thanh toán / vận chuyển)
    |--------------------------------------------------------------------------
    */
    'core_config' => [
        [
            'code'  => 'sales.payment_methods.cashondelivery.title',
            'value' => 'Thanh toán khi nhận hàng (COD)',
        ],
        [
            'code'  => 'sales.payment_methods.cashondelivery.description',
            'value' => 'Thanh toán tiền mặt trực tiếp cho nhân viên giao hàng khi nhận và kiểm tra kiện hàng nước hoa.',
        ],
        [
            'code'  => 'sales.payment_methods.moneytransfer.title',
            'value' => 'Chuyển khoản ngân hàng',
        ],
        [
            'code'  => 'sales.payment_methods.moneytransfer.description',
            'value' => 'Chuyển khoản trực tiếp qua tài khoản ngân hàng nội địa với cú pháp mã đơn hàng.',
        ],
        [
            'code'  => 'sales.carriers.flatrate.title',
            'value' => 'Giao hàng tiêu chuẩn',
        ],
        [
            'code'  => 'sales.carriers.flatrate.description',
            'value' => 'Giao hàng nhanh toàn quốc, đóng gói bóng khí bảo vệ chai lọ chống va đập.',
        ],
    ],

    /*
    |--------------------------------------------------------------------------
    | Attribute Translations (25 Core Attributes + 3 Perfume Attributes)
    | Bỏ đơn vị (cm), (kg) khỏi tên length và weight.
    |--------------------------------------------------------------------------
    */
    'attributes' => [
        'sku'                  => 'Mã sản phẩm (SKU)',
        'name'                 => 'Tên sản phẩm',
        'url_key'              => 'Đường dẫn (URL Key)',
        'tax_category_id'      => 'Nhóm thuế',
        'new'                  => 'Sản phẩm mới',
        'featured'             => 'Sản phẩm nổi bật',
        'visible_individually' => 'Hiển thị độc lập',
        'status'               => 'Trạng thái kinh doanh',
        'short_description'    => 'Mô tả ngắn',
        'description'          => 'Mô tả chi tiết',
        'price'                => 'Giá bán',
        'cost'                 => 'Giá vốn',
        'special_price'        => 'Giá khuyến mãi',
        'special_price_from'   => 'Khuyến mãi từ ngày',
        'special_price_to'     => 'Khuyến mãi đến ngày',
        'meta_title'           => 'Tiêu đề SEO',
        'meta_keywords'        => 'Từ khóa SEO',
        'meta_description'     => 'Mô tả SEO',
        'length'               => 'Chiều dài',
        'weight'               => 'Trọng lượng',
        'guest_checkout'       => 'Mua hàng không cần đăng nhập',
        'product_number'       => 'Số hiệu sản phẩm',
        'manage_stock'         => 'Quản lý kho hàng',
        'allow_rma'            => 'Cho phép đổi trả',
        'rma_rule_id'          => 'Quy tắc đổi trả',
        'capacity'             => 'Dung tích',
        'fragrance_family'     => 'Nhóm hương',
        'concentration'        => 'Nồng độ',
    ],
];
