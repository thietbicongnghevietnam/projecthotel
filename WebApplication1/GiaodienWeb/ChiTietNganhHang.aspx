<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChiTietNganhHang.aspx.cs" Inherits="WebApplication1.GiaodienWeb.ChiTietNganhHang" %>

<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Phần mềm quản lý bán hàng | Sky Eagle Soft</title>
  <meta name="description" content="Sky Eagle Soft - phần mềm quản lý bán hàng, chuỗi cửa hàng: doanh thu, công nợ, hạn sử dụng, xuất nhập tồn, sổ quỹ, cảnh báo tự động. Hotline 0979 479 007.">

  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Be+Vietnam+Pro:wght@400;500;600;700;800&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="../../plugins/fontawesome-free/css/all.min.css">

  <style>
    :root {
      --navy: #12304F;
      --sky: #2D7FD3;
      --sky-50: #EAF3FC;
      --gold: #E7A33E;
      --ink: #1A2433;
      --muted: #5B6778;
      --line: #D9E3EE;
      --bg: #F6F9FC;
      --paper: #FFFFFF;
      --radius-lg: 18px;
      --radius-sm: 10px;
      --font: "Be Vietnam Pro", "Segoe UI", Roboto, Arial, sans-serif;
    }
    *, *::before, *::after { box-sizing: border-box; }
    html { scroll-behavior: smooth; }
    body { margin: 0; font-family: var(--font); font-size: 16px; line-height: 1.6; color: var(--ink); background: var(--bg); -webkit-font-smoothing: antialiased; }
    img { max-width: 100%; display: block; }
    a { color: var(--sky); text-decoration: none; }
    a:hover { text-decoration: underline; }
    :focus-visible { outline: 3px solid var(--gold); outline-offset: 3px; border-radius: 4px; }
    .wrap { width: 100%; max-width: 1180px; margin: 0 auto; padding: 0 24px; }
    h1, h2, h3, h4 { margin: 0; line-height: 1.2; color: var(--navy); }

    .btn { display: inline-flex; align-items: center; gap: 10px; padding: 13px 22px; border-radius: 999px; font-weight: 600; font-size: 15px; font-family: inherit; border: 2px solid transparent; cursor: pointer; transition: background .15s, border-color .15s; }
    .btn:hover { text-decoration: none; }
    .btn-gold { background: var(--gold); color: var(--navy); }
    .btn-gold:hover { background: #F0B455; }
    .btn-line { border-color: rgba(255,255,255,.45); color: #fff; }
    .btn-line:hover { border-color: #fff; background: rgba(255,255,255,.08); }
    .btn-sky { background: var(--sky); color: #fff; }
    .btn-sky:hover { background: #2470BE; }

    /* ---------- Header (giống trang chủ) ---------- */
    .site-header { position: sticky; top: 0; z-index: 50; background: rgba(255,255,255,.96); backdrop-filter: saturate(160%) blur(8px); border-bottom: 1px solid var(--line); }
    .header-row { display: flex; align-items: center; gap: 28px; height: 72px; }
    .brand { display: flex; align-items: center; gap: 12px; color: var(--navy); font-weight: 800; font-size: 19px; }
    .brand:hover { text-decoration: none; }
    .brand img { width: 42px; height: 42px; border-radius: 50%; object-fit: cover; border: 2px solid var(--sky-50); }
    .main-nav { display: flex; align-items: center; gap: 4px; margin-left: auto; }
    .main-nav a { padding: 10px 14px; border-radius: 8px; color: var(--ink); font-weight: 500; font-size: 15px; }
    .main-nav a:hover { background: var(--sky-50); color: var(--navy); text-decoration: none; }
    .header-call { margin-left: 12px; padding: 10px 18px; }
    .nav-toggle { display: none; margin-left: auto; background: none; border: 1px solid var(--line); border-radius: 8px; width: 44px; height: 40px; color: var(--navy); font-size: 18px; cursor: pointer; }

    /* ---------- Hero ---------- */
    .hero { background: var(--navy); color: #fff; position: relative; overflow: hidden; }
    .hero::before { content: ""; position: absolute; inset: 0; background: radial-gradient(560px 360px at 90% 10%, rgba(45,127,211,.45), transparent 70%); pointer-events: none; }
    .hero-grid { position: relative; display: grid; grid-template-columns: 1.25fr .75fr; gap: 48px; align-items: center; padding: 40px 24px 72px; }
    .crumbs { position: relative; padding-top: 28px; font-size: 14px; color: #9DB4CE; }
    .crumbs a { color: #C9D8EA; }
    .crumbs i { font-size: 10px; margin: 0 8px; }
    .hero-title { display: flex; align-items: center; gap: 18px; margin-bottom: 20px; }
    .hero-icon { width: 76px; height: 76px; border-radius: 16px; background: #fff; padding: 10px; flex-shrink: 0; }
    .hero-icon img { width: 100%; height: 100%; object-fit: contain; }
    .hero-icon i { width: 100%; height: 100%; display: flex; align-items: center; justify-content: center; font-size: 32px; color: var(--sky); }
    .hero-title span { display: block; color: var(--gold); font-weight: 600; font-size: 15px; margin-bottom: 4px; }
    .hero h1 { color: #fff; font-size: clamp(28px, 4vw, 46px); font-weight: 800; letter-spacing: -0.02em; }
    .hero-lead { margin: 0 0 14px; font-size: 18px; color: #fff; max-width: 36em; }
    .hero-intro { margin: 0 0 30px; color: #C9D8EA; max-width: 38em; }
    .hero-actions { display: flex; flex-wrap: wrap; gap: 14px; }

    .connect { background: rgba(255,255,255,.07); border: 1px solid rgba(255,255,255,.14); border-radius: var(--radius-lg); padding: 24px; }
    .connect h2 { color: #fff; font-size: 16px; font-weight: 700; margin-bottom: 14px; }
    .connect ul { list-style: none; margin: 0; padding: 0; display: grid; gap: 12px; }
    .connect li { display: flex; align-items: center; gap: 12px; color: #E3ECF6; font-size: 15px; }
    .connect i { width: 36px; height: 36px; border-radius: 10px; background: rgba(231,163,62,.16); color: var(--gold); display: inline-flex; align-items: center; justify-content: center; flex-shrink: 0; }

    /* ---------- Nội dung + mục lục ---------- */
    .layout { display: grid; grid-template-columns: 230px 1fr; gap: 48px; padding: 64px 24px 80px; }
    .toc { position: sticky; top: 96px; align-self: start; }
    .toc h2 { font-size: 14px; color: var(--muted); font-weight: 600; margin-bottom: 10px; }
    .toc ol { list-style: none; margin: 0; padding: 0; border-left: 2px solid var(--line); }
    .toc a { display: block; padding: 8px 0 8px 16px; margin-left: -2px; border-left: 2px solid transparent; color: var(--ink); font-weight: 500; font-size: 15px; }
    .toc a:hover { color: var(--sky); text-decoration: none; }
    .toc a.current { border-left-color: var(--sky); color: var(--sky); font-weight: 700; }
    .toc .toc-call { margin-top: 24px; padding: 16px; background: var(--paper); border: 1px solid var(--line); border-radius: var(--radius-sm); font-size: 14px; color: var(--muted); }
    .toc .toc-call a { padding: 0; margin: 4px 0 0; border: 0; font-size: 20px; font-weight: 800; color: var(--navy); }

    .block { scroll-margin-top: 96px; }
    .block + .block { margin-top: 72px; }
    .block-head { margin-bottom: 28px; max-width: 640px; }
    .block-head h2 { font-size: clamp(24px, 3vw, 32px); font-weight: 800; letter-spacing: -0.01em; }
    .block-head p { margin: 10px 0 0; color: var(--muted); font-size: 16.5px; }

    .groups { display: grid; grid-template-columns: 1fr 1fr; gap: 18px; }
    .group { background: var(--paper); border: 1px solid var(--line); border-radius: var(--radius-lg); padding: 24px 24px 20px; }
    .group.wide { grid-column: 1 / -1; }
    .group-head { display: flex; align-items: center; gap: 12px; margin-bottom: 14px; }
    .group-head i { width: 40px; height: 40px; border-radius: 10px; background: var(--sky-50); color: var(--sky); display: inline-flex; align-items: center; justify-content: center; font-size: 17px; flex-shrink: 0; }
    .group-head h3 { font-size: 18px; font-weight: 700; }
    .checks { list-style: none; margin: 0; padding: 0; display: grid; gap: 6px; }
    .group.wide .checks { grid-template-columns: 1fr 1fr; column-gap: 28px; }
    .checks li { position: relative; padding-left: 26px; font-size: 15px; line-height: 1.5; }
    .checks li::before { content: "\f00c"; font-family: "Font Awesome 5 Free"; font-weight: 900; position: absolute; left: 0; top: 1px; color: var(--sky); font-size: 13px; }

    .pillars { display: grid; grid-template-columns: 1fr 1fr; gap: 0; background: var(--paper); border: 1px solid var(--line); border-radius: var(--radius-lg); overflow: hidden; }
    .pillar { padding: 28px; border-bottom: 1px solid var(--line); }
    .pillar:nth-child(odd) { border-right: 1px solid var(--line); }
    .pillar:nth-last-child(-n+2) { border-bottom: 0; }
    .pillar i { color: var(--gold); font-size: 22px; margin-bottom: 12px; display: block; }
    .pillar h3 { font-size: 19px; font-weight: 700; margin-bottom: 12px; }

    .tech { display: grid; grid-template-columns: repeat(3, 1fr); gap: 18px; }
    .tech .group { background: var(--navy); border-color: var(--navy); }
    .tech .group-head i { background: rgba(255,255,255,.1); color: var(--gold); }
    .tech .group-head h3 { color: #fff; }
    .tech .checks li { color: #D5E2F0; }
    .tech .checks li::before { color: var(--gold); }

    /* ---------- Ngành khác ---------- */
    .others { background: var(--paper); border-top: 1px solid var(--line); padding: 64px 0; }
    .others h2 { font-size: 24px; font-weight: 800; margin-bottom: 20px; }
    .other-list { display: flex; flex-wrap: wrap; gap: 10px; }
    .other-list a { display: inline-flex; align-items: center; gap: 10px; padding: 8px 14px 8px 8px; border: 1px solid var(--line); border-radius: 999px; color: var(--ink); font-size: 14.5px; font-weight: 500; background: var(--bg); }
    .other-list a:hover { border-color: var(--sky); color: var(--navy); text-decoration: none; }
    .other-list img { width: 30px; height: 26px; object-fit: contain; }
    .other-list i { width: 30px; text-align: center; color: var(--sky); font-size: 16px; }

    /* ---------- Liên hệ + footer ---------- */
    .contact-band { background: var(--sky); color: #fff; }
    .contact-grid { display: grid; grid-template-columns: 1.3fr 1fr; gap: 40px; align-items: center; padding: 60px 24px; }
    .contact-band h2 { color: #fff; font-size: clamp(24px, 3vw, 32px); font-weight: 800; }
    .contact-band p { margin: 12px 0 0; color: #E4F0FC; font-size: 17px; }
    .contact-lines { display: grid; gap: 12px; }
    .contact-lines a { display: flex; align-items: center; gap: 14px; padding: 14px 18px; border-radius: 14px; background: rgba(255,255,255,.12); color: #fff; font-weight: 600; }
    .contact-lines a:hover { background: rgba(255,255,255,.2); text-decoration: none; }
    .contact-lines i { width: 20px; text-align: center; color: var(--gold); }
    .contact-lines small { display: block; font-weight: 400; font-size: 13px; color: #D5E6F8; }

    .site-footer { background: var(--navy); color: #B9CAE0; font-size: 14.5px; }
    .site-footer a { color: #B9CAE0; }
    .site-footer a:hover { color: #fff; }
    .footer-bottom { padding: 24px; display: flex; justify-content: space-between; flex-wrap: wrap; gap: 8px; font-size: 13.5px; }

    @media (max-width: 1024px) {
      .header-call { display: none; }
      .tech { grid-template-columns: 1fr 1fr; }
    }
    @media (max-width: 900px) {
      .nav-toggle { display: block; }
      .main-nav { display: none; position: absolute; top: 72px; left: 0; right: 0; flex-direction: column; align-items: stretch; background: #fff; border-bottom: 1px solid var(--line); padding: 12px 24px 20px; }
      .main-nav.open { display: flex; }
      .hero-grid { grid-template-columns: 1fr; }
      .layout { grid-template-columns: 1fr; gap: 0; padding-top: 32px; }
      .toc { position: static; margin-bottom: 40px; }
      .toc ol { display: flex; flex-wrap: wrap; gap: 8px; border: 0; }
      .toc a { border: 1px solid var(--line); border-radius: 999px; padding: 6px 14px; margin: 0; background: var(--paper); }
      .toc a.current { border-color: var(--sky); }
      .toc .toc-call { display: none; }
      .contact-grid { grid-template-columns: 1fr; }
    }
    @media (max-width: 640px) {
      .groups, .pillars, .tech { grid-template-columns: 1fr; }
      .group.wide .checks { grid-template-columns: 1fr; }
      .pillar:nth-child(odd) { border-right: 0; }
      .pillar:nth-last-child(2) { border-bottom: 1px solid var(--line); }
      .hero-icon { width: 60px; height: 60px; }
    }
    @media (prefers-reduced-motion: reduce) { html { scroll-behavior: auto; } }
  </style>
</head>
<body>

  <!-- ================= HEADER ================= -->
  <header class="site-header">
    <div class="wrap header-row">
      <a href="index.aspx" class="brand">
        <img src="../../dist/img/logo_eagle.JPG" alt="Logo Sky Eagle Soft">
        Sky Eagle Soft
      </a>
      <button class="nav-toggle" type="button" aria-label="Mở menu" aria-expanded="false" aria-controls="mainNav"><i class="fas fa-bars"></i></button>
      <nav class="main-nav" id="mainNav">
        <a href="index.aspx">Trang chủ</a>
        <a href="index.aspx#nganh-hang">Ngành hàng</a>
        <a href="index.aspx#thiet-bi">Thiết bị</a>
        <a href="index.aspx#khach-hang">Khách hàng</a>
        <a href="#lien-he">Hỗ trợ</a>
      </nav>
      <a href="tel:0979479007" class="btn btn-sky header-call"><i class="fas fa-phone-alt"></i> 0979 479 007</a>
    </div>
  </header>

  <main>
    <!-- ================= HERO (đổi theo ngành) ================= -->
    <section class="hero">
      <div class="wrap crumbs">
        <a href="index.aspx">Trang chủ</a><i class="fas fa-chevron-right"></i><a href="index.aspx#nganh-hang">Ngành hàng</a><i class="fas fa-chevron-right"></i><span id="crumbName">Phần mềm quản lý bán hàng</span>
      </div>
      <div class="wrap hero-grid">
        <div>
          <div class="hero-title">
            <div class="hero-icon"><img id="nganhIcon" src="./Giaodienphanmem/iconcacnganhkhac.jpg" alt=""></div>
            <div>
              <span>Phần mềm quản lý bán hàng</span>
              <h1 id="nganhName">Sky Eagle Soft</h1>
            </div>
          </div>
          <p class="hero-lead" id="nganhLead">Phần mềm quản lý bán hàng, chuỗi cửa hàng được nhiều khách hàng tin dùng.</p>
          <p class="hero-intro">
            Phần mềm quản lý bán hàng, chuỗi cửa hàng <strong style="color:#fff">Sky Eagle Soft</strong> đã được ứng dụng rộng rãi và được khách hàng tin tưởng.
            Phần mềm tích hợp đầu đọc mã vạch, máy in mã vạch chuyên dụng, in trên giấy Tomi thường, máy kiểm kho tự động,
            xuất nhập dữ liệu hai chiều với Excel cùng nhiều tính năng nổi trội khác.
          </p>
          <div class="hero-actions">
            <a href="tel:0979479007" class="btn btn-gold"><i class="fas fa-phone-alt"></i> Gọi tư vấn: 0979 479 007</a>
            <a href="#quan-ly" class="btn btn-line">Xem tính năng</a>
          </div>
        </div>
        <aside class="connect">
          <h2>Kết nối sẵn với thiết bị</h2>
          <ul>
            <li><i class="fas fa-barcode"></i> Đầu đọc mã vạch</li>
            <li><i class="fas fa-print"></i> Máy in mã vạch chuyên dụng</li>
            <li><i class="fas fa-receipt"></i> In trên giấy Tomi thường</li>
            <li><i class="fas fa-clipboard-check"></i> Máy kiểm kho tự động</li>
            <li><i class="fas fa-file-excel"></i> Xuất, nhập dữ liệu hai chiều với Excel</li>
          </ul>
        </aside>
      </div>
    </section>

    <!-- ================= NỘI DUNG CHUNG ================= -->
    <div class="wrap layout">
      <nav class="toc" aria-label="Mục lục">
        <h2>Trên trang này</h2>
        <ol>
          <li><a href="#quan-ly">Tính năng quản lý</a></li>
          <li><a href="#noi-bat">Tính năng nổi bật</a></li>
          <li><a href="#cong-nghe">Công nghệ</a></li>
        </ol>
        <div class="toc-call">Cần tư vấn thêm?<a href="tel:0979479007">0979 479 007</a></div>
      </nav>

      <div>
        <!-- Tính năng quản lý -->
        <section class="block" id="quan-ly">
          <div class="block-head">
            <h2>Tính năng quản lý</h2>
            <p>Theo dõi toàn bộ hoạt động bán hàng, kho, công nợ và tiền mặt trên một phần mềm.</p>
          </div>
          <div class="groups">
            <article class="group">
              <div class="group-head"><i class="fas fa-chart-line"></i><h3>Quản lý doanh thu</h3></div>
              <ul class="checks">
                <li>Doanh thu theo ngày</li>
                <li>Doanh thu theo khoảng thời gian</li>
                <li>Chi tiết doanh thu</li>
                <li>Tổng hợp doanh thu</li>
                <li>Hàng bán bị trả lại</li>
                <li>Báo cáo doanh số theo nhân viên</li>
              </ul>
            </article>

            <article class="group">
              <div class="group-head"><i class="fas fa-book"></i><h3>Quản lý công nợ</h3></div>
              <ul class="checks">
                <li>Bảng tổng hợp công nợ khách hàng</li>
                <li>Bảng chi tiết công nợ khách hàng</li>
                <li>Bảng tổng hợp công nợ nhà cung cấp</li>
                <li>Bảng chi tiết công nợ nhà cung cấp</li>
                <li>Phiếu báo nợ khách hàng</li>
                <li>Phiếu báo nợ nhà cung cấp</li>
              </ul>
            </article>

            <article class="group">
              <div class="group-head"><i class="fas fa-calendar-check"></i><h3>Quản lý hạn sử dụng</h3></div>
              <ul class="checks">
                <li>Quản lý chi tiết hạn sử dụng của từng lô hàng nhập về</li>
                <li>Cảnh báo trước ngày hết hạn sử dụng</li>
              </ul>
            </article>

            <article class="group">
              <div class="group-head"><i class="fas fa-boxes"></i><h3>Quản lý xuất nhập tồn</h3></div>
              <ul class="checks">
                <li>Chi tiết và tổng hợp nhập hàng</li>
                <li>Chi tiết và tổng hợp xuất hàng</li>
                <li>Báo cáo xuất nhập tồn</li>
                <li>Thẻ kho</li>
              </ul>
            </article>

            <article class="group">
              <div class="group-head"><i class="fas fa-wallet"></i><h3>Quản lý sổ quỹ tiền mặt</h3></div>
              <ul class="checks">
                <li>Tổng hợp chi và chi tiết chi</li>
                <li>Tổng hợp thu và chi tiết thu</li>
                <li>Bảng cân đối thu chi</li>
                <li>Sổ quỹ tiền mặt</li>
              </ul>
            </article>

            <article class="group">
              <div class="group-head"><i class="fas fa-bell"></i><h3>Hệ thống nhắc việc</h3></div>
              <ul class="checks">
                <li>Nhắc đến hạn thanh toán của khách hàng</li>
                <li>Nhắc đến hạn thanh toán cho nhà cung cấp</li>
                <li>Nhắc khách hàng nợ quá giới hạn</li>
                <li>Nhắc sinh nhật khách hàng</li>
              </ul>
            </article>

            <article class="group wide">
              <div class="group-head"><i class="fas fa-exclamation-triangle"></i><h3>Cảnh báo tự động</h3></div>
              <ul class="checks">
                <li>Cảnh báo hàng tồn kho dựa trên giới hạn tồn tối thiểu và tồn tối đa</li>
                <li>Cảnh báo công nợ khách hàng dựa trên giới hạn nợ của từng khách</li>
              </ul>
            </article>
          </div>
        </section>

        <!-- Tính năng nổi bật -->
        <section class="block" id="noi-bat">
          <div class="block-head">
            <h2>Tính năng nổi bật</h2>
            <p>Linh hoạt theo cách bạn kinh doanh, chính xác trong từng con số, an toàn cho dữ liệu.</p>
          </div>
          <div class="pillars">
            <div class="pillar">
              <i class="fas fa-sliders-h"></i>
              <h3>Linh hoạt</h3>
              <ul class="checks">
                <li>Tùy biến hệ thống theo nhu cầu và đặc thù</li>
                <li>Thêm hoặc bớt các thông tin</li>
                <li>Tùy biến các báo cáo đầu ra</li>
                <li>Thuận tiện cho việc nâng cấp và chỉnh sửa</li>
                <li>Giao tiếp hai chiều với Excel và Access</li>
              </ul>
            </div>
            <div class="pillar">
              <i class="fas fa-tachometer-alt"></i>
              <h3>Chính xác và nhanh</h3>
              <ul class="checks">
                <li>Tính toán chính xác dựa trên thông tin đầu vào</li>
                <li>Công nghệ mới giúp xử lý nhanh hơn</li>
                <li>Tiết kiệm tối đa sức lao động</li>
              </ul>
            </div>
            <div class="pillar">
              <i class="fas fa-shield-alt"></i>
              <h3>Bảo mật, an toàn</h3>
              <ul class="checks">
                <li>Tự động sao lưu dữ liệu dự phòng</li>
                <li>Phân quyền người dùng đến từng chức năng</li>
                <li>Lưu lại dấu vết khi xóa, sửa dữ liệu</li>
                <li>Lưu lại thông tin người xem báo cáo</li>
                <li>Cấm toàn bộ hoặc từng phần quyền xem báo cáo kinh doanh</li>
              </ul>
            </div>
            <div class="pillar">
              <i class="fas fa-hand-pointer"></i>
              <h3>Dễ dùng, tiện lợi</h3>
              <ul class="checks">
                <li>Thiết kế theo chuẩn Windows</li>
                <li>Thao tác được thiết kế theo thói quen người dùng</li>
                <li>Giao diện tiếng Việt</li>
                <li>Ngôn ngữ dễ hiểu</li>
              </ul>
            </div>
          </div>
        </section>

        <!-- Công nghệ -->
        <section class="block" id="cong-nghe">
          <div class="block-head">
            <h2>Công nghệ</h2>
            <p>Mã vạch, tổng đài điện thoại và các chương trình trên máy tính hoạt động cùng nhau.</p>
          </div>
          <div class="tech">
            <article class="group">
              <div class="group-head"><i class="fas fa-barcode"></i><h3>Mã vạch đa mã</h3></div>
              <ul class="checks">
                <li>Một mặt hàng có thể đặt nhiều mã</li>
                <li>Mã vạch theo chuẩn Code 128</li>
                <li>Độ dài mã tối đa 15 ký tự</li>
                <li>In mã vạch theo công nghệ mới</li>
              </ul>
            </article>
            <article class="group">
              <div class="group-head"><i class="fas fa-phone-volume"></i><h3>Tích hợp điện thoại</h3></div>
              <ul class="checks">
                <li>Hiển thị số điện thoại khi khách hàng gọi đến</li>
                <li>Hiện thông tin khách hàng trước khi nhấc máy</li>
              </ul>
            </article>
            <article class="group">
              <div class="group-head"><i class="fas fa-network-wired"></i><h3>Kết nối nội bộ</h3></div>
              <ul class="checks">
                <li>Tiết kiệm chi phí điện thoại</li>
                <li>Liên kết động giữa các chương trình trong hệ điều hành</li>
                <li>Mở nhanh bất kỳ chương trình nào trên máy tính ngay từ Sky Eagle Soft</li>
              </ul>
            </article>
          </div>
        </section>
      </div>
    </div>

    <!-- ================= NGÀNH KHÁC ================= -->
    <section class="others">
      <div class="wrap">
        <h2>Xem phần mềm cho ngành hàng khác</h2>
        <div class="other-list" id="otherList"></div>
      </div>
    </section>

    <!-- ================= LIÊN HỆ ================= -->
    <section class="contact-band" id="lien-he">
      <div class="wrap contact-grid">
        <div>
          <h2 id="contactTitle">Cần tư vấn phần mềm cho cửa hàng?</h2>
          <p>Gọi cho chúng tôi, kỹ thuật viên sẽ tư vấn gói phần mềm và thiết bị phù hợp với mô hình kinh doanh của bạn.</p>
        </div>
        <div class="contact-lines">
          <a href="tel:0979479007"><i class="fas fa-phone-alt"></i><span>0979 479 007<small>Tư vấn phần mềm và đặt mua thiết bị</small></span></a>
          <a href="mailto:thietbicongnghevietnam@gmail.com"><i class="fas fa-envelope"></i><span>thietbicongnghevietnam@gmail.com<small>Gửi yêu cầu qua email</small></span></a>
        </div>
      </div>
    </section>
  </main>

  <footer class="site-footer">
    <div class="wrap footer-bottom">
      <span>&copy; 2014–<%= DateTime.Now.Year %> Sky Eagle Soft. 29 Phú Mỹ, Mỹ Đình, Từ Liêm, Hà Nội.</span>
      <span>Hotline: <a href="tel:0979479007">0979 479 007</a></span>
    </div>
  </footer>

  <script>
    (function () {
      // Menu mobile
      var toggle = document.querySelector('.nav-toggle'), nav = document.getElementById('mainNav');
      toggle.addEventListener('click', function () { toggle.setAttribute('aria-expanded', nav.classList.toggle('open')); });

      // Danh sách ngành: key = tham số ?nganh=..., icon = ảnh trong Giaodienphanmem/
      var nganh = {
        thoitrang:      ['Thời trang', 'iconthoitrang.jpg', 'Quản lý hàng theo màu, size, mẫu mã; bán tại quầy và online trên cùng một phần mềm.'],
        mevabe:         ['Mẹ & Bé', 'iconmevabe.jpg', 'Theo dõi hạn sử dụng sữa, bỉm, đồ ăn dặm và chăm sóc khách hàng quay lại đều đặn.'],
        nhahang:        ['Bar - Cafe - Nhà hàng', 'iconnhahang.jpg', 'Sơ đồ bàn trực quan, gọi món nhanh, in phiếu bếp và thanh toán gọn trong một màn hình.'],
        mypham:         ['Mỹ phẩm', 'iconmypham.jpg', 'Quản lý hàng theo lô và hạn dùng, chăm sóc khách hàng và bán hàng đa kênh.'],
        taphoa:         ['Tạp hóa', 'icontaphoa.jpg', 'Bán hàng nhanh bằng máy quét mã vạch, quản lý hàng nghìn mặt hàng mà không cần sổ sách.'],
        sieuthimini:    ['Siêu thị mini', 'iconsieuthi.jpg', 'Nhiều quầy thu ngân cùng lúc, quản lý ca, khuyến mại và tồn kho tập trung.'],
        dienthoai:      ['Điện thoại & Điện máy', 'icondienmay.jpg', 'Quản lý theo IMEI, số serial và bảo hành cho từng máy bán ra.'],
        thucpham:       ['Nông sản & Thực phẩm', 'iconnongsan.jpg', 'Bán hàng theo cân, quản lý hàng tươi sống và hàng có hạn dùng ngắn.'],
        noithat:        ['Nội thất & Gia dụng', 'iconnoithat.jpg', 'Quản lý đơn đặt hàng, giao lắp và công nợ cho các đơn giá trị lớn.'],
        vatlieuxaydung: ['Vật liệu xây dựng', 'iconvatlieuxaydung.jpg', 'Bán theo nhiều đơn vị tính, quản lý công nợ công trình và giao hàng.'],
        phutung:        ['Xe máy & Linh kiện', 'iconxemay.jpg', 'Quản lý hàng nghìn mã phụ tùng và kết hợp dịch vụ sửa chữa, bảo dưỡng.'],
        nhathuoc:       ['Nhà thuốc', 'iconnhathuoc.jpg', 'Quản lý thuốc theo lô, hạn dùng và bán thuốc theo đơn một cách chặt chẽ.'],
        quatang:        ['Hoa & Quà tặng', 'iconhoaquatang.jpg', 'Nhận đặt hàng trước, giao theo giờ hẹn và quản lý combo quà tặng.'],
        hieusach:       ['Sách & Văn phòng phẩm', 'iconnhasach.jpg', 'Quản lý đầu sách theo tác giả, nhà xuất bản và bán văn phòng phẩm cho doanh nghiệp.'],
        massage:        ['Spa - Massage - Bể bơi', 'iconspa.jpg', 'Đặt lịch, quản lý phòng, nhân viên kỹ thuật và thẻ liệu trình.'],
        garaoto:        ['Gara ô tô - Kho phụ tùng', 'icongara.jpg', 'Quản lý lệnh sửa chữa, phụ tùng và lịch sử bảo dưỡng theo biển số xe.'],
        tonthep:        ['Tôn thép - Sắt hộp', 'icontonthep.jpg', 'Bán hàng theo cây, kg, mét; tính trọng lượng quy đổi và công nợ đại lý.'],
        camdo:          ['Cầm đồ - Tài chính - Bát họ', 'iconcamdo.jpg', 'Quản lý hợp đồng cầm cố, lãi suất, kỳ đóng và tài sản đảm bảo.'],
        phongkham:      ['Phòng khám - Kính mắt', 'iconphongkham.jpg', 'Tiếp đón bệnh nhân, lưu hồ sơ khám và bán thuốc, kính trong một phần mềm.'],
        khachsan:       ['Khách sạn', 'fa-hotel', 'Quản lý phòng, đặt phòng, nhận và trả phòng cùng các dịch vụ đi kèm trên một màn hình.'],
        nhanghi:        ['Nhà nghỉ', 'fa-bed', 'Theo dõi phòng trống, tính tiền theo giờ, theo đêm và quản lý khách lưu trú.'],
        karaoke:        ['Karaoke', 'fa-microphone', 'Tính giờ hát tự động, gọi đồ uống theo phòng và thanh toán nhanh.'],
        gasnuoc:        ['Gas, nước', 'fa-fire', 'Quản lý giao hàng tận nơi, vỏ bình, công nợ và lịch sử mua của từng khách.'],
        doanhnghiep:    ['Doanh nghiệp', 'fa-building', 'Quản lý bán hàng, kho và công nợ cho doanh nghiệp có nhiều chi nhánh.'],
        nghanhkhac:     ['Ngành hàng khác', 'iconcacnganhkhac.jpg', 'Sky Eagle Soft có thể cấu hình theo mô hình kinh doanh riêng của bạn.']
      };

      function iconHtml(icon) {
        return icon.indexOf('fa-') === 0
          ? '<i class="fas ' + icon + '" aria-hidden="true"></i>'
          : '<img src="./Giaodienphanmem/' + icon + '" alt="">';
      }

      var key = (new URLSearchParams(location.search).get('nganh') || '').toLowerCase();
      var cur = nganh[key];
      if (cur) {
        document.getElementById('nganhName').textContent = cur[0];
        document.getElementById('crumbName').textContent = cur[0];
        document.getElementById('nganhIcon').parentNode.innerHTML = iconHtml(cur[1]);
        document.getElementById('nganhLead').textContent = cur[2];
        document.getElementById('contactTitle').textContent = 'Cần tư vấn phần mềm cho ngành ' + cur[0] + '?';
        document.title = 'Phần mềm quản lý ' + cur[0] + ' | Sky Eagle Soft';
      }

      // Danh sách ngành khác
      var list = document.getElementById('otherList');
      Object.keys(nganh).forEach(function (k) {
        if (k === key) return;
        var a = document.createElement('a');
        a.href = 'ChiTietNganhHang.aspx?nganh=' + k;
        a.innerHTML = iconHtml(nganh[k][1]);
        a.appendChild(document.createTextNode(nganh[k][0]));
        list.appendChild(a);
      });

      // Tô sáng mục lục theo phần đang xem
      var links = document.querySelectorAll('.toc a');
      if ('IntersectionObserver' in window) {
        var obs = new IntersectionObserver(function (entries) {
          entries.forEach(function (en) {
            if (en.isIntersecting) links.forEach(function (l) { l.classList.toggle('current', l.getAttribute('href') === '#' + en.target.id); });
          });
        }, { rootMargin: '-40% 0px -55% 0px' });
        document.querySelectorAll('.block').forEach(function (b) { obs.observe(b); });
      }
    })();
  </script>
</body>
</html>
