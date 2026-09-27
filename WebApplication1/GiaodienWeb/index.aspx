<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="WebApplication1.GiaodienWeb.index" %>

<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Sky Eagle Soft | Phần mềm quản lý Nhà hàng - Khách sạn - Karaoke - Bán hàng</title>
  <meta name="description" content="Sky Eagle Soft - phần mềm quản lý bán hàng cho cửa hàng bán lẻ, nhà hàng, cafe, karaoke, khách sạn. Đơn giản, dễ dùng, phù hợp hơn 20 ngành hàng.">

  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Be+Vietnam+Pro:wght@400;500;600;700;800&family=Roboto+Mono:wght@400;500;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="../../plugins/fontawesome-free/css/all.min.css">

  <style>
    :root {
      --navy: #12304F;
      --navy-2: #1B416A;
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
      --mono: "Roboto Mono", Consolas, "Courier New", monospace;
    }

    *, *::before, *::after { box-sizing: border-box; }
    html { scroll-behavior: smooth; }
    body {
      margin: 0;
      font-family: var(--font);
      font-size: 16px;
      line-height: 1.6;
      color: var(--ink);
      background: var(--bg);
      -webkit-font-smoothing: antialiased;
    }
    img { max-width: 100%; display: block; }
    a { color: var(--sky); text-decoration: none; }
    a:hover { text-decoration: underline; }
    :focus-visible { outline: 3px solid var(--gold); outline-offset: 3px; border-radius: 4px; }

    .wrap { width: 100%; max-width: 1180px; margin: 0 auto; padding: 0 24px; }

    h1, h2, h3, h4 { margin: 0; line-height: 1.2; color: var(--navy); }
    h2 { font-size: clamp(26px, 3.2vw, 36px); font-weight: 800; letter-spacing: -0.01em; }
    .section { padding: 88px 0; }
    .section-head { max-width: 640px; margin-bottom: 40px; }
    .section-head p { margin: 12px 0 0; color: var(--muted); font-size: 17px; }

    .btn {
      display: inline-flex; align-items: center; gap: 10px;
      padding: 13px 22px; border-radius: 999px;
      font-weight: 600; font-size: 15px; font-family: inherit;
      border: 2px solid transparent; cursor: pointer;
      transition: background .15s, color .15s, border-color .15s;
    }
    .btn:hover { text-decoration: none; }
    .btn-gold { background: var(--gold); color: var(--navy); }
    .btn-gold:hover { background: #F0B455; }
    .btn-line { border-color: rgba(255,255,255,.45); color: #fff; }
    .btn-line:hover { border-color: #fff; background: rgba(255,255,255,.08); }
    .btn-sky { background: var(--sky); color: #fff; }
    .btn-sky:hover { background: #2470BE; }

    /* ---------- Header ---------- */
    .site-header {
      position: sticky; top: 0; z-index: 50;
      background: rgba(255,255,255,.96);
      backdrop-filter: saturate(160%) blur(8px);
      border-bottom: 1px solid var(--line);
    }
    .header-row { display: flex; align-items: center; gap: 28px; height: 72px; }
    .brand { display: flex; align-items: center; gap: 12px; color: var(--navy); font-weight: 800; font-size: 19px; }
    .brand:hover { text-decoration: none; }
    .brand img { width: 42px; height: 42px; border-radius: 50%; object-fit: cover; border: 2px solid var(--sky-50); }

    .main-nav { display: flex; align-items: center; gap: 4px; margin-left: auto; }
    .main-nav > a, .nav-drop > button {
      padding: 10px 14px; border-radius: 8px;
      color: var(--ink); font-weight: 500; font-size: 15px;
      background: none; border: 0; font-family: inherit; cursor: pointer;
    }
    .main-nav > a:hover, .nav-drop > button:hover { background: var(--sky-50); color: var(--navy); text-decoration: none; }
    .nav-drop { position: relative; }
    .nav-drop > button i { font-size: 11px; margin-left: 4px; }
    .drop-menu {
      display: none; position: absolute; top: calc(100% + 8px); left: 0;
      min-width: 280px; padding: 10px;
      background: var(--paper); border: 1px solid var(--line); border-radius: 14px;
      box-shadow: 0 18px 40px -18px rgba(18,48,79,.35);
    }
    .nav-drop.open .drop-menu { display: block; }
    .drop-menu a { display: block; padding: 9px 12px; border-radius: 8px; color: var(--ink); font-size: 15px; }
    .drop-menu a:hover { background: var(--sky-50); text-decoration: none; }
    .drop-menu .group { margin-top: 6px; padding-top: 8px; border-top: 1px solid var(--line); }
    .drop-menu .group span { display: block; padding: 4px 12px; font-size: 13px; color: var(--muted); font-weight: 600; }

    .header-call { margin-left: 12px; padding: 10px 18px; }
    .nav-toggle { display: none; margin-left: auto; background: none; border: 1px solid var(--line); border-radius: 8px; width: 44px; height: 40px; color: var(--navy); font-size: 18px; cursor: pointer; }

    /* ---------- Hero ---------- */
    .hero { background: var(--navy); color: #fff; overflow: hidden; position: relative; }
    .hero::before {
      content: ""; position: absolute; inset: 0;
      background:
        radial-gradient(600px 380px at 85% 20%, rgba(45,127,211,.45), transparent 70%),
        radial-gradient(500px 300px at 10% 110%, rgba(45,127,211,.25), transparent 70%);
      pointer-events: none;
    }
    .hero-grid { position: relative; display: grid; grid-template-columns: 1.05fr .95fr; gap: 48px; align-items: center; padding: 80px 24px 96px; }
    .hero h1 { color: #fff; font-size: clamp(32px, 4.6vw, 54px); font-weight: 800; letter-spacing: -0.02em; line-height: 1.12; }
    .hero-lead { margin: 22px 0 32px; font-size: 18px; color: #C9D8EA; max-width: 34em; }
    .hero-lead strong { color: #fff; font-weight: 600; }
    .hero-actions { display: flex; flex-wrap: wrap; gap: 14px; }
    .hero-models { margin-top: 40px; display: flex; flex-wrap: wrap; gap: 10px; }
    .hero-models a {
      display: inline-flex; align-items: center; gap: 8px;
      padding: 8px 14px; border-radius: 999px;
      background: rgba(255,255,255,.07); border: 1px solid rgba(255,255,255,.14);
      color: #E3ECF6; font-size: 14px;
    }
    .hero-models a:hover { background: rgba(255,255,255,.14); text-decoration: none; }
    .hero-models i { color: var(--gold); }

    /* Receipt: the one memorable thing */
    .hero-visual { position: relative; display: flex; justify-content: center; }
    .printer {
      position: relative; width: 340px; max-width: 100%;
    }
    .printer-head {
      height: 56px; border-radius: 16px 16px 10px 10px;
      background: linear-gradient(#2A4A6E, #203C5C);
      box-shadow: inset 0 1px 0 rgba(255,255,255,.15), 0 20px 40px -20px rgba(0,0,0,.6);
      position: relative; z-index: 2;
      display: flex; align-items: center; justify-content: space-between; padding: 0 18px;
    }
    .printer-head .led { width: 8px; height: 8px; border-radius: 50%; background: #5BE38B; box-shadow: 0 0 8px #5BE38B; }
    .printer-head .model { font-family: var(--mono); font-size: 11px; color: #9DB4CE; }
    .printer-slot { height: 8px; margin: -4px 16px 0; background: #0B1F35; border-radius: 0 0 6px 6px; position: relative; z-index: 3; }
    .receipt-clip { margin: 0 28px; overflow: hidden; }
    .receipt {
      background: #FFFEFA; color: #222;
      font-family: var(--mono); font-size: 13px; line-height: 1.55;
      padding: 22px 22px 34px;
      -webkit-mask: conic-gradient(from -45deg at bottom, #0000, #000 1deg 89deg, #0000 90deg) 50% / 14px 100%;
              mask: conic-gradient(from -45deg at bottom, #0000, #000 1deg 89deg, #0000 90deg) 50% / 14px 100%;
      animation: print 2.2s steps(22, end) .4s both;
    }
    @keyframes print { from { transform: translateY(-100%); } to { transform: translateY(0); } }
    .receipt .r-center { text-align: center; }
    .receipt .r-shop { font-weight: 700; font-size: 15px; letter-spacing: .04em; }
    .receipt .r-meta { color: #666; font-size: 12px; }
    .receipt .r-rule { border: 0; border-top: 1px dashed #999; margin: 10px 0; }
    .receipt .r-line { display: flex; justify-content: space-between; gap: 12px; }
    .receipt .r-line small { display: block; color: #777; font-size: 11.5px; }
    .receipt .r-total { font-weight: 700; font-size: 16px; }
    .receipt .r-bar { height: 34px; margin: 14px auto 4px; width: 80%;
      background: repeating-linear-gradient(90deg, #222 0 2px, transparent 2px 4px, #222 4px 5px, transparent 5px 8px, #222 8px 11px, transparent 11px 12px); }

    /* ---------- Industries ---------- */
    .industry-grid { display: grid; grid-template-columns: repeat(4, 1fr); gap: 12px; }
    .industry {
      display: flex; align-items: center; gap: 14px;
      padding: 14px 16px; background: var(--paper);
      border: 1px solid var(--line); border-radius: var(--radius-sm);
      color: var(--ink); font-weight: 600; font-size: 15px;
      transition: border-color .15s, box-shadow .15s;
    }
    .industry:hover { border-color: var(--sky); box-shadow: 0 0 0 3px var(--sky-50); text-decoration: none; color: var(--navy); }
    .industry img { width: 48px; height: 40px; object-fit: contain; flex-shrink: 0; }
    .industry.other { background: var(--sky-50); border-style: dashed; }
    .industry.active { border-color: var(--sky); background: var(--sky); color: #fff; box-shadow: none; }
    .industry.active img { background: #fff; border-radius: 6px; }

    /* Khung chi tiết ngành hàng: chèn ngay dưới hàng chứa ô được bấm */
    .industry-detail {
      grid-column: 1 / -1;
      scroll-margin-top: 90px;
      background: var(--paper);
      border: 2px solid var(--sky);
      border-radius: var(--radius-lg);
      padding: 32px;
      display: grid; grid-template-columns: .9fr 1.1fr; gap: 36px;
      position: relative;
      animation: detailIn .25s ease-out;
    }
    @keyframes detailIn { from { opacity: 0; transform: translateY(-6px); } to { opacity: 1; transform: none; } }
    .detail-close {
      position: absolute; top: 14px; right: 14px; width: 36px; height: 36px;
      border-radius: 50%; border: 1px solid var(--line); background: #fff; color: var(--navy); cursor: pointer;
    }
    .detail-head { display: flex; align-items: center; gap: 14px; margin-bottom: 14px; }
    .detail-head img { width: 64px; height: 52px; object-fit: contain; background: var(--bg); border-radius: 10px; padding: 6px; }
    .detail-head span { display: block; font-size: 14px; color: var(--muted); font-weight: 500; }
    .detail-head h3 { font-size: 24px; font-weight: 800; }
    .detail-lead { margin: 0 0 18px; color: var(--muted); font-size: 16px; }
    .detail-fits { display: flex; flex-wrap: wrap; gap: 8px; margin-bottom: 24px; }
    .detail-fits li { list-style: none; padding: 5px 12px; border-radius: 999px; background: var(--sky-50); color: var(--navy); font-size: 13.5px; font-weight: 500; }
    .detail-fits { padding: 0; }
    .detail-actions { display: flex; flex-wrap: wrap; gap: 12px; align-items: center; }
    .detail-actions .link { font-weight: 600; font-size: 15px; }
    .detail-features { display: grid; grid-template-columns: 1fr 1fr; gap: 14px; align-content: start; }
    .feature { padding: 16px 18px; border-radius: var(--radius-sm); background: var(--bg); }
    .feature i { color: var(--sky); font-size: 18px; margin-bottom: 8px; display: block; }
    .feature h4 { font-size: 15.5px; font-weight: 700; margin-bottom: 4px; }
    .feature p { margin: 0; font-size: 14px; color: var(--muted); line-height: 1.5; }
    @media (max-width: 860px) {
      .industry-detail { grid-template-columns: 1fr; padding: 28px 22px; gap: 24px; }
    }
    @media (max-width: 600px) {
      .detail-features { grid-template-columns: 1fr; }
      .detail-head h3 { font-size: 20px; }
    }
    @media (prefers-reduced-motion: reduce) { .industry-detail { animation: none; } }

    /* ---------- Devices ---------- */
    .devices { background: var(--paper); border-top: 1px solid var(--line); border-bottom: 1px solid var(--line); }
    .device-grid { display: grid; grid-template-columns: repeat(4, 1fr); gap: 20px; }
    .device {
      display: flex; flex-direction: column;
      border: 1px solid var(--line); border-radius: var(--radius-lg);
      background: var(--paper); overflow: hidden; position: relative;
    }
    .device-img { aspect-ratio: 4 / 3; background: var(--bg); display: flex; align-items: center; justify-content: center; padding: 18px; }
    .device-img img { max-height: 100%; object-fit: contain; mix-blend-mode: multiply; }
    .device-tags { position: absolute; top: 12px; left: 12px; display: flex; flex-wrap: wrap; gap: 6px; }
    .tag { font-size: 12px; font-weight: 600; padding: 3px 10px; border-radius: 999px; }
    .tag-hot { background: var(--gold); color: var(--navy); }
    .tag-gift { background: var(--navy); color: #fff; }
    .device-body { padding: 16px 18px 18px; display: flex; flex-direction: column; flex: 1; }
    .device-body h3 { font-size: 16px; font-weight: 700; line-height: 1.35; min-height: 2.7em; }
    .price { margin-top: 10px; font-size: 20px; font-weight: 800; color: var(--sky); }
    .price small { font-size: 14px; font-weight: 600; }
    .price-old { color: var(--muted); text-decoration: line-through; font-size: 14px; }
    .warranty { margin-top: 6px; font-size: 13.5px; color: var(--muted); }
    .warranty i { color: var(--sky); margin-right: 4px; }
    .device-more {
      margin-top: auto; padding-top: 14px; align-self: flex-start;
      background: none; border: 0; padding-left: 0; font: inherit; font-weight: 600; font-size: 14.5px;
      color: var(--sky); cursor: pointer;
    }
    .device-more:hover { text-decoration: underline; }

    .spec-dialog {
      border: 0; padding: 0; border-radius: var(--radius-lg);
      width: min(720px, calc(100% - 32px));
      box-shadow: 0 40px 80px -30px rgba(18,48,79,.5);
    }
    .spec-dialog::backdrop { background: rgba(18,48,79,.55); }
    .spec-inner { display: grid; grid-template-columns: 220px 1fr; }
    .spec-img { background: var(--bg); display: flex; align-items: center; justify-content: center; padding: 24px; }
    .spec-img img { mix-blend-mode: multiply; }
    .spec-content { padding: 28px 28px 24px; position: relative; }
    .spec-content h3 { font-size: 20px; padding-right: 36px; }
    .spec-content ul { margin: 16px 0; padding-left: 18px; color: var(--ink); }
    .spec-content li { margin: 4px 0; font-size: 15px; }
    .spec-close {
      position: absolute; top: 14px; right: 14px; width: 36px; height: 36px;
      border-radius: 50%; border: 1px solid var(--line); background: #fff; cursor: pointer; color: var(--navy);
    }

    /* ---------- Customers ---------- */
    .customer-row { display: grid; grid-template-columns: repeat(5, 1fr); gap: 16px; }
    .customer {
      background: var(--paper); border: 1px solid var(--line); border-radius: var(--radius-sm);
      padding: 20px 16px; text-align: center;
    }
    .customer img { height: 70px; width: 100%; object-fit: contain; margin: 0 auto 12px; }
    .customer h4 { font-size: 14.5px; font-weight: 600; color: var(--ink); }

    /* ---------- Contact band ---------- */
    .contact-band { background: var(--sky); color: #fff; }
    .contact-grid { display: grid; grid-template-columns: 1.3fr 1fr; gap: 40px; align-items: center; padding: 64px 24px; }
    .contact-band h2 { color: #fff; }
    .contact-band p { margin: 12px 0 0; color: #E4F0FC; font-size: 17px; }
    .contact-lines { display: grid; gap: 12px; }
    .contact-lines a {
      display: flex; align-items: center; gap: 14px;
      padding: 14px 18px; border-radius: 14px;
      background: rgba(255,255,255,.12); color: #fff; font-weight: 600;
    }
    .contact-lines a:hover { background: rgba(255,255,255,.2); text-decoration: none; }
    .contact-lines i { width: 20px; text-align: center; color: var(--gold); }
    .contact-lines small { display: block; font-weight: 400; font-size: 13px; color: #D5E6F8; }

    /* ---------- Footer ---------- */
    .site-footer { background: var(--navy); color: #B9CAE0; font-size: 14.5px; }
    .footer-grid { display: grid; grid-template-columns: 1.4fr 1fr 1fr 1fr 1fr; gap: 32px; padding: 64px 24px 40px; }
    .site-footer h4 { color: #fff; font-size: 15px; margin-bottom: 14px; }
    .site-footer ul { list-style: none; margin: 0; padding: 0; }
    .site-footer li { margin: 7px 0; }
    .site-footer a { color: #B9CAE0; }
    .site-footer a:hover { color: #fff; }
    .footer-brand p { margin: 14px 0 0; max-width: 28em; }
    .footer-bottom { border-top: 1px solid rgba(255,255,255,.1); padding: 20px 24px; display: flex; justify-content: space-between; flex-wrap: wrap; gap: 8px; font-size: 13.5px; }

    /* ---------- Responsive ---------- */
    @media (max-width: 1024px) {
      .industry-grid, .device-grid { grid-template-columns: repeat(3, 1fr); }
      .customer-row { grid-template-columns: repeat(3, 1fr); }
      .footer-grid { grid-template-columns: 1fr 1fr 1fr; }
      .footer-brand { grid-column: 1 / -1; }
      .header-call { display: none; }
    }
    @media (max-width: 860px) {
      .nav-toggle { display: block; }
      .main-nav {
        display: none; position: absolute; top: 72px; left: 0; right: 0;
        flex-direction: column; align-items: stretch; gap: 2px;
        background: #fff; border-bottom: 1px solid var(--line); padding: 12px 24px 20px;
      }
      .main-nav.open { display: flex; }
      .nav-drop > button { width: 100%; text-align: left; }
      .drop-menu { position: static; box-shadow: none; border: 0; padding: 0 0 0 12px; }
      .hero-grid { grid-template-columns: 1fr; padding: 56px 24px 72px; }
      .hero-visual { order: -1; }
      .contact-grid { grid-template-columns: 1fr; }
    }
    @media (max-width: 600px) {
      .section { padding: 64px 0; }
      .industry-grid, .device-grid { grid-template-columns: 1fr 1fr; }
      .customer-row { grid-template-columns: 1fr 1fr; }
      .footer-grid { grid-template-columns: 1fr 1fr; }
      .spec-inner { grid-template-columns: 1fr; }
      .spec-img { max-height: 200px; }
      .industry { flex-direction: column; text-align: center; font-size: 14px; gap: 8px; }
    }
    @media (max-width: 400px) {
      .device-grid { grid-template-columns: 1fr; }
    }
    @media (prefers-reduced-motion: reduce) {
      .receipt { animation: none; }
      html { scroll-behavior: auto; }
    }
  </style>
</head>
<body>

  <!-- ================= HEADER ================= -->
  <header class="site-header">
    <div class="wrap header-row">
      <a href="#" class="brand">
        <img src="../../dist/img/logo_eagle.JPG" alt="Logo Sky Eagle Soft">
        Sky Eagle Soft
      </a>

      <button class="nav-toggle" type="button" aria-label="Mở menu" aria-expanded="false" aria-controls="mainNav">
        <i class="fas fa-bars"></i>
      </button>

      <nav class="main-nav" id="mainNav">
        <a href="#">Trang chủ</a>
        <div class="nav-drop">
          <button type="button" aria-expanded="false">Phần mềm quản lý <i class="fas fa-chevron-down"></i></button>
          <div class="drop-menu">
            <a href="ChiTietNganhHang.aspx?nganh=nhahang">Quản lý nhà hàng</a>
            <a href="ChiTietNganhHang.aspx?nganh=khachsan">Quản lý khách sạn</a>
            <a href="ChiTietNganhHang.aspx?nganh=nhanghi">Quản lý nhà nghỉ</a>
            <a href="ChiTietNganhHang.aspx?nganh=karaoke">Quản lý Karaoke</a>
            <div class="group">
              <span>Quản lý bán hàng</span>
              <a href="ChiTietNganhHang.aspx?nganh=sieuthimini">Siêu thị</a>
              <a href="ChiTietNganhHang.aspx?nganh=nhathuoc">Nhà thuốc</a>
              <a href="ChiTietNganhHang.aspx?nganh=garaoto">Phụ tùng ô tô</a>
              <a href="ChiTietNganhHang.aspx?nganh=gasnuoc">Gas, nước</a>
              <a href="ChiTietNganhHang.aspx?nganh=doanhnghiep">Doanh nghiệp</a>
            </div>
          </div>
        </div>
        <a href="#nganh-hang">Ngành hàng</a>
        <a href="#thiet-bi">Thiết bị</a>
        <a href="#khach-hang">Khách hàng</a>
        <a href="#lien-he">Hỗ trợ</a>
      </nav>

      <a href="tel:0979479007" class="btn btn-sky header-call"><i class="fas fa-phone-alt"></i> 0979 479 007</a>
    </div>
  </header>

  <main>
    <!-- ================= HERO ================= -->
    <section class="hero">
      <div class="wrap hero-grid">
        <div>
          <h1>Bán hàng nhanh, sổ sách rõ ràng, từ quầy thu ngân đến báo cáo cuối ngày</h1>
          <p class="hero-lead">
            <strong>Sky Eagle Soft</strong> là phần mềm quản lý bán hàng cho cửa hàng bán lẻ, nhà hàng, cafe, karaoke và khách sạn.
            Đơn giản, dễ dùng, tiết kiệm chi phí và phù hợp với hơn 20 ngành hàng khác nhau.
          </p>
          <div class="hero-actions">
            <a href="tel:0979479007" class="btn btn-gold"><i class="fas fa-phone-alt"></i> Gọi tư vấn miễn phí</a>
            <a href="#nganh-hang" class="btn btn-line">Chọn ngành hàng của bạn</a>
          </div>
          <div class="hero-models">
            <a href="ChiTietNganhHang.aspx?nganh=nhahang"><i class="fas fa-utensils"></i> Nhà hàng</a>
            <a href="ChiTietNganhHang.aspx?nganh=nhahang"><i class="fas fa-mug-hot"></i> Cafe</a>
            <a href="ChiTietNganhHang.aspx?nganh=karaoke"><i class="fas fa-microphone"></i> Karaoke</a>
            <a href="ChiTietNganhHang.aspx?nganh=khachsan"><i class="fas fa-hotel"></i> Khách sạn</a>
            <a href="ChiTietNganhHang.aspx?nganh=sieuthimini"><i class="fas fa-store"></i> Bán lẻ</a>
          </div>
        </div>

        <div class="hero-visual" aria-hidden="true">
          <div class="printer">
            <div class="printer-head"><span class="led"></span><span class="model">SKY EAGLE POS</span></div>
            <div class="printer-slot"></div>
            <div class="receipt-clip">
              <div class="receipt">
                <div class="r-center">
                  <div class="r-shop">SKY EAGLE CAFE</div>
                  <div class="r-meta">29 Phú Mỹ, Mỹ Đình, Hà Nội</div>
                </div>
                <hr class="r-rule">
                <div class="r-line"><span>Bàn 05</span><span>HĐ #002418</span></div>
                <div class="r-line r-meta"><span>Thu ngân: Lan</span><span>19:42</span></div>
                <hr class="r-rule">
                <div class="r-line"><span>Cà phê sữa đá<small>2 x 29.000</small></span><span>58.000</span></div>
                <div class="r-line"><span>Bạc xỉu<small>1 x 32.000</small></span><span>32.000</span></div>
                <div class="r-line"><span>Trà đào cam sả<small>1 x 45.000</small></span><span>45.000</span></div>
                <hr class="r-rule">
                <div class="r-line r-total"><span>TỔNG</span><span>135.000</span></div>
                <div class="r-line"><span>Khách đưa</span><span>200.000</span></div>
                <div class="r-line"><span>Tiền thừa</span><span>65.000</span></div>
                <div class="r-bar"></div>
                <div class="r-center r-meta">Cảm ơn quý khách, hẹn gặp lại!</div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- ================= INDUSTRIES ================= -->
    <section class="section" id="nganh-hang">
      <div class="wrap">
        <div class="section-head">
          <h2>Phần mềm thiết kế riêng cho từng ngành hàng</h2>
          <p>Chọn ngành hàng của bạn để xem Sky Eagle Soft giúp gì cho việc bán hàng, quản lý kho và báo cáo.</p>
        </div>

        <div class="industry-grid">
          <a class="industry" href="#nganh-thoitrang" data-key="thoitrang" aria-expanded="false"><img src="./Giaodienphanmem/iconthoitrang.jpg" alt="">Thời trang</a>
          <a class="industry" href="#nganh-mevabe" data-key="mevabe" aria-expanded="false"><img src="./Giaodienphanmem/iconmevabe.jpg" alt="">Mẹ &amp; Bé</a>
          <a class="industry" href="#nganh-nhahang" data-key="nhahang" aria-expanded="false"><img src="./Giaodienphanmem/iconnhahang.jpg" alt="">Bar - Cafe - Nhà hàng</a>
          <a class="industry" href="#nganh-mypham" data-key="mypham" aria-expanded="false"><img src="./Giaodienphanmem/iconmypham.jpg" alt="">Mỹ phẩm</a>
          <a class="industry" href="#nganh-taphoa" data-key="taphoa" aria-expanded="false"><img src="./Giaodienphanmem/icontaphoa.jpg" alt="">Tạp hóa</a>
          <a class="industry" href="#nganh-sieuthimini" data-key="sieuthimini" aria-expanded="false"><img src="./Giaodienphanmem/iconsieuthi.jpg" alt="">Siêu thị mini</a>
          <a class="industry" href="#nganh-dienthoai" data-key="dienthoai" aria-expanded="false"><img src="./Giaodienphanmem/icondienmay.jpg" alt="">Điện thoại &amp; Điện máy</a>
          <a class="industry" href="#nganh-thucpham" data-key="thucpham" aria-expanded="false"><img src="./Giaodienphanmem/iconnongsan.jpg" alt="">Nông sản &amp; Thực phẩm</a>
          <a class="industry" href="#nganh-noithat" data-key="noithat" aria-expanded="false"><img src="./Giaodienphanmem/iconnoithat.jpg" alt="">Nội thất &amp; Gia dụng</a>
          <a class="industry" href="#nganh-vatlieuxaydung" data-key="vatlieuxaydung" aria-expanded="false"><img src="./Giaodienphanmem/iconvatlieuxaydung.jpg" alt="">Vật liệu xây dựng</a>
          <a class="industry" href="#nganh-phutung" data-key="phutung" aria-expanded="false"><img src="./Giaodienphanmem/iconxemay.jpg" alt="">Xe máy &amp; Linh kiện</a>
          <a class="industry" href="#nganh-nhathuoc" data-key="nhathuoc" aria-expanded="false"><img src="./Giaodienphanmem/iconnhathuoc.jpg" alt="">Nhà thuốc</a>
          <a class="industry" href="#nganh-quatang" data-key="quatang" aria-expanded="false"><img src="./Giaodienphanmem/iconhoaquatang.jpg" alt="">Hoa &amp; Quà tặng</a>
          <a class="industry" href="#nganh-hieusach" data-key="hieusach" aria-expanded="false"><img src="./Giaodienphanmem/iconnhasach.jpg" alt="">Sách &amp; Văn phòng phẩm</a>
          <a class="industry" href="#nganh-massage" data-key="massage" aria-expanded="false"><img src="./Giaodienphanmem/iconspa.jpg" alt="">Spa - Massage - Bể bơi</a>
          <a class="industry" href="#nganh-garaoto" data-key="garaoto" aria-expanded="false"><img src="./Giaodienphanmem/icongara.jpg" alt="">Gara ô tô - Kho phụ tùng</a>
          <a class="industry" href="#nganh-tonthep" data-key="tonthep" aria-expanded="false"><img src="./Giaodienphanmem/icontonthep.jpg" alt="">Tôn thép - Sắt hộp</a>
          <a class="industry" href="#nganh-camdo" data-key="camdo" aria-expanded="false"><img src="./Giaodienphanmem/iconcamdo.jpg" alt="">Cầm đồ - Tài chính - Bát họ</a>
          <a class="industry" href="#nganh-phongkham" data-key="phongkham" aria-expanded="false"><img src="./Giaodienphanmem/iconphongkham.jpg" alt="">Phòng khám - Kính mắt</a>
          <a class="industry other" href="#nganh-nghanhkhac" data-key="nghanhkhac" aria-expanded="false"><img src="./Giaodienphanmem/iconcacnganhkhac.jpg" alt="">Ngành hàng khác</a>
        </div>
      </div>
    </section>

    <!-- ================= DEVICES ================= -->
    <section class="section devices" id="thiet-bi">
      <div class="wrap">
        <div class="section-head">
          <h2>Thiết bị hỗ trợ bán hàng</h2>
          <p>Máy quét mã vạch, máy in hóa đơn, ngăn kéo đựng tiền đã được cài đặt sẵn với phần mềm. Nhiều thiết bị được tặng kèm khi mua phần mềm.</p>
        </div>

        <div class="device-grid">
          <article class="device">
            <div class="device-tags"><span class="tag tag-hot">Bán chạy</span><span class="tag tag-gift">Tặng kèm</span></div>
            <div class="device-img"><img src="./Giaodienphanmem/ZebexZ3100.jpg" alt="Máy quét mã vạch Zebex Z-3151HS"></div>
            <div class="device-body">
              <h3>Máy quét mã vạch Zebex Z-3151HS</h3>
              <div class="price">1.400.000 <small>đ</small> <span class="price-old">2.000.000 đ</span></div>
              <div class="warranty"><i class="fas fa-shield-alt"></i> Bảo hành 12 tháng</div>
              <button class="device-more" type="button" data-id="product-13874">Xem thông số</button>
            </div>
          </article>

          <article class="device">
            <div class="device-tags"><span class="tag tag-hot">Bán chạy</span></div>
            <div class="device-img"><img src="./Giaodienphanmem/daudocyouje.jpg" alt="Máy quét mã vạch đa tia YOUJIE YJ5900"></div>
            <div class="device-body">
              <h3>Máy quét mã vạch đa tia YOUJIE YJ5900</h3>
              <div class="price">2.720.000 <small>đ</small> <span class="price-old">3.400.000 đ</span></div>
              <div class="warranty"><i class="fas fa-shield-alt"></i> Bảo hành 12 tháng</div>
              <button class="device-more" type="button" data-id="product-14875">Xem thông số</button>
            </div>
          </article>

          <article class="device">
            <div class="device-tags"><span class="tag tag-hot">Bán chạy</span><span class="tag tag-gift">Tặng kèm</span></div>
            <div class="device-img"><img src="./Giaodienphanmem/prp085.jpg" alt="Máy in hóa đơn Birch PRP 085"></div>
            <div class="device-body">
              <h3>Máy in hóa đơn Birch PRP 085</h3>
              <div class="price">1.500.000 <small>đ</small> <span class="price-old">2.000.000 đ</span></div>
              <div class="warranty"><i class="fas fa-shield-alt"></i> Bảo hành 12 tháng</div>
              <button class="device-more" type="button" data-id="product-13866">Xem thông số</button>
            </div>
          </article>

          <article class="device">
            <div class="device-tags"><span class="tag tag-gift">Tặng kèm</span></div>
            <div class="device-img"><img src="./Giaodienphanmem/C2030.jpg" alt="Máy in hóa đơn Birch C230"></div>
            <div class="device-body">
              <h3>Máy in hóa đơn Birch C230</h3>
              <div class="price">1.400.000 <small>đ</small></div>
              <div class="warranty"><i class="fas fa-shield-alt"></i> Bảo hành 12 tháng</div>
              <button class="device-more" type="button" data-id="product-13878">Xem thông số</button>
            </div>
          </article>

          <article class="device">
            <div class="device-tags"><span class="tag tag-hot">Bán chạy</span></div>
            <div class="device-img"><img src="./Giaodienphanmem/Godexg500.jpg" alt="Máy in mã vạch Godex G500"></div>
            <div class="device-body">
              <h3>Máy in mã vạch Godex G500</h3>
              <div class="price">3.990.000 <small>đ</small></div>
              <div class="warranty"><i class="fas fa-shield-alt"></i> Bảo hành 12 tháng</div>
              <button class="device-more" type="button" data-id="product-13886">Xem thông số</button>
            </div>
          </article>

          <article class="device">
            <div class="device-img"><img src="./Giaodienphanmem/CW-1000C.jpg" alt="Cổng an ninh siêu thị CW-1000C"></div>
            <div class="device-body">
              <h3>Cổng an ninh siêu thị CW-1000C</h3>
              <div class="price">Giá liên hệ</div>
              <div class="warranty"><i class="fas fa-shield-alt"></i> Bảo hành 12 tháng</div>
              <button class="device-more" type="button" data-id="product-13876">Xem thông số</button>
            </div>
          </article>

          <article class="device">
            <div class="device-tags"><span class="tag tag-gift">Tặng kèm</span></div>
            <div class="device-img"><img src="./Giaodienphanmem/Giayin.jpg" alt="Giấy in mã vạch, hóa đơn"></div>
            <div class="device-body">
              <h3>Giấy in mã vạch - hóa đơn</h3>
              <div class="price">8.000 <small>đ / cuộn</small></div>
              <div class="warranty"><i class="fas fa-box"></i> Dùng cho máy in K80 &amp; mã vạch</div>
              <button class="device-more" type="button" data-id="product-13881">Xem thông số</button>
            </div>
          </article>

          <article class="device">
            <div class="device-tags"><span class="tag tag-gift">Tặng kèm</span></div>
            <div class="device-img"><img src="./Giaodienphanmem/ketsat.jpg" alt="Ngăn kéo đựng tiền RT-410"></div>
            <div class="device-body">
              <h3>Ngăn kéo đựng tiền RT-410</h3>
              <div class="price">1.100.000 <small>đ</small></div>
              <div class="warranty"><i class="fas fa-shield-alt"></i> Bảo hành 12 tháng</div>
              <button class="device-more" type="button" data-id="product-13883">Xem thông số</button>
            </div>
          </article>
        </div>
      </div>
    </section>

    <!-- Spec dialog (filled by script) -->
    <dialog class="spec-dialog" id="specDialog" aria-labelledby="specTitle">
      <div class="spec-inner">
        <div class="spec-img"><img id="specImg" src="" alt=""></div>
        <div class="spec-content">
          <button class="spec-close" type="button" aria-label="Đóng"><i class="fas fa-times"></i></button>
          <h3 id="specTitle"></h3>
          <ul id="specList"></ul>
          <a href="tel:0979479007" class="btn btn-sky"><i class="fas fa-phone-alt"></i> Đặt mua: 0979 479 007</a>
        </div>
      </div>
    </dialog>

    <!-- ================= CUSTOMERS ================= -->
    <section class="section" id="khach-hang">
      <div class="wrap">
        <div class="section-head">
          <h2>Khách hàng đang dùng Sky Eagle Soft</h2>
          <p>Gần 10.000 cửa hàng đang sử dụng và hơn 500 cửa hàng đăng ký mới mỗi tháng.</p>
        </div>
        <div class="customer-row">
          <div class="customer"><img src="./Giaodienphanmem/ICON.jpg" alt="lioncoffee.com.vn"><h4>lioncoffee.com.vn</h4></div>
          <div class="customer"><img src="./Giaodienphanmem/ALINA.jpg" alt="Thời trang ALINA"><h4>Thời trang ALINA</h4></div>
          <div class="customer"><img src="./Giaodienphanmem/THAILAN.jpg" alt="MadeinThaiLan"><h4>Thế giới hàng Thái Lan MadeinThaiLan</h4></div>
          <div class="customer"><img src="./Giaodienphanmem/SEVENOUMO.jpg" alt="SEVEN.OUMO"><h4>Thời trang cao cấp SEVEN.OUMO</h4></div>
          <div class="customer"><img src="./Giaodienphanmem/HUONGSEN.jpg" alt="Hương Sen Healthcare Center"><h4>Hương Sen Healthcare Center</h4></div>
        </div>
      </div>
    </section>

    <!-- ================= CONTACT ================= -->
    <section class="contact-band" id="lien-he">
      <div class="wrap contact-grid">
        <div>
          <h2>Chưa biết chọn phần mềm nào cho cửa hàng?</h2>
          <p>Gọi cho chúng tôi, kỹ thuật viên sẽ tư vấn gói phần mềm và thiết bị phù hợp với mô hình kinh doanh của bạn.</p>
        </div>
        <div class="contact-lines">
          <a href="tel:0979479007"><i class="fas fa-phone-alt"></i><span>0979 479 007<small>Tư vấn phần mềm và đặt mua thiết bị</small></span></a>
          <a href="mailto:thietbicongnghevietnam@gmail.com"><i class="fas fa-envelope"></i><span>thietbicongnghevietnam@gmail.com<small>Gửi yêu cầu qua email</small></span></a>
        </div>
      </div>
    </section>
  </main>

  <!-- ================= FOOTER ================= -->
  <footer class="site-footer">
    <div class="wrap footer-grid">
      <div class="footer-brand">
        <a href="#" class="brand" style="color:#fff">
          <img src="../../dist/img/logo_eagle.JPG" alt="">
          Sky Eagle Soft
        </a>
        <p>Phần mềm quản lý nhà hàng, khách sạn, karaoke và bán hàng.<br>29 Phú Mỹ, Mỹ Đình, Từ Liêm, Hà Nội</p>
      </div>
      <div>
        <h4>Công ty</h4>
        <ul>
          <li><a href="#" rel="nofollow">Về Sky Eagle Soft</a></li>
          <li><a href="http://tinhocvietnam.com/chitietsanpham/khachhang" rel="nofollow">Khách hàng</a></li>
          <li><a href="http://tinhocvietnam.com/chitietsanpham/dieukhoansudung" rel="nofollow">Điều khoản sử dụng</a></li>
          <li><a href="http://tinhocvietnam.com/chitietsanpham/lienhe/" rel="nofollow">Liên hệ</a></li>
        </ul>
      </div>
      <div>
        <h4>Ngành hàng</h4>
        <ul>
          <li><a href="ChiTietNganhHang.aspx?nganh=thoitrang">Thời trang</a></li>
          <li><a href="ChiTietNganhHang.aspx?nganh=nhahang">Bar - Cafe - Nhà hàng</a></li>
          <li><a href="ChiTietNganhHang.aspx?nganh=dienthoai">Điện thoại &amp; Điện máy</a></li>
          <li><a href="ChiTietNganhHang.aspx?nganh=sieuthimini">Siêu thị mini</a></li>
          <li><a href="ChiTietNganhHang.aspx?nganh=taphoa">Tạp hóa</a></li>
        </ul>
      </div>
      <div>
        <h4>Chuỗi cửa hàng</h4>
        <ul>
          <li><a href="ChiTietNganhHang.aspx?nganh=phutung">Xe máy &amp; Linh kiện</a></li>
          <li><a href="ChiTietNganhHang.aspx?nganh=hieusach">Sách &amp; Văn phòng phẩm</a></li>
          <li><a href="ChiTietNganhHang.aspx?nganh=vatlieuxaydung">Vật liệu xây dựng</a></li>
          <li><a href="ChiTietNganhHang.aspx?nganh=mypham">Mỹ phẩm</a></li>
          <li><a href="ChiTietNganhHang.aspx?nganh=nhathuoc">Nhà thuốc</a></li>
        </ul>
      </div>
      <div>
        <h4>Hỗ trợ</h4>
        <ul>
          <li><a href="#" rel="nofollow">Video hướng dẫn sử dụng</a></li>
          <li><a href="#" rel="nofollow">Câu hỏi thường gặp</a></li>
          <li><a href="#" rel="nofollow">Hướng dẫn sử dụng</a></li>
          <li><a href="#" rel="nofollow">Blog</a></li>
        </ul>
      </div>
    </div>
    <div class="wrap footer-bottom">
      <span>&copy; 2014–<%= DateTime.Now.Year %> Sky Eagle Soft. Phần mềm thu ngân.</span>
      <span>Hotline: <a href="tel:0979479007">0979 479 007</a></span>
    </div>
  </footer>

  <script>
    (function () {
      // Mobile menu
      var toggle = document.querySelector('.nav-toggle');
      var nav = document.getElementById('mainNav');
      toggle.addEventListener('click', function () {
        var open = nav.classList.toggle('open');
        toggle.setAttribute('aria-expanded', open);
      });

      // Dropdown "Phần mềm quản lý"
      var drop = document.querySelector('.nav-drop');
      var dropBtn = drop.querySelector('button');
      dropBtn.addEventListener('click', function (e) {
        e.stopPropagation();
        var open = drop.classList.toggle('open');
        dropBtn.setAttribute('aria-expanded', open);
      });
      document.addEventListener('click', function (e) {
        if (!drop.contains(e.target)) { drop.classList.remove('open'); dropBtn.setAttribute('aria-expanded', false); }
      });

      // ================= Chi tiết phần mềm theo ngành hàng =================
      // Sửa nội dung từng ngành tại đây. icon = tên icon Font Awesome.
      var industries = {
        thoitrang: { name: 'Thời trang', lead: 'Quản lý hàng theo màu, size, mẫu mã; bán tại quầy và online trên cùng một phần mềm.',
          fits: ['Shop quần áo', 'Giày dép, túi xách', 'Chuỗi cửa hàng thời trang'],
          features: [['fa-tshirt', 'Quản lý theo màu và size', 'Một mẫu nhiều biến thể, tồn kho chính xác đến từng size.'],
                     ['fa-barcode', 'In tem mã vạch', 'Tạo và in tem cho từng sản phẩm, quét mã khi bán cho nhanh.'],
                     ['fa-user-tag', 'Khách hàng thân thiết', 'Tích điểm, ưu đãi theo hạng thẻ, lưu lịch sử mua hàng.'],
                     ['fa-exchange-alt', 'Đổi trả dễ dàng', 'Đổi size, trả hàng theo hóa đơn, tồn kho tự cập nhật.']] },
        mevabe: { name: 'Mẹ & Bé', lead: 'Theo dõi hạn sử dụng sữa, bỉm, đồ ăn dặm và chăm sóc khách hàng quay lại đều đặn.',
          fits: ['Cửa hàng mẹ và bé', 'Shop sữa, bỉm', 'Đồ chơi trẻ em'],
          features: [['fa-calendar-check', 'Cảnh báo hạn sử dụng', 'Theo dõi hàng theo lô, nhắc hàng sắp hết hạn.'],
                     ['fa-baby', 'Hồ sơ khách hàng', 'Lưu thông tin mẹ và bé để tư vấn đúng sản phẩm.'],
                     ['fa-gift', 'Khuyến mại linh hoạt', 'Mua kèm, tặng quà, giảm giá theo combo.'],
                     ['fa-boxes', 'Nhập hàng theo định mức', 'Báo hàng bán chạy sắp hết để nhập kịp thời.']] },
        nhahang: { name: 'Bar - Cafe - Nhà hàng', lead: 'Sơ đồ bàn trực quan, gọi món nhanh, in phiếu bếp và thanh toán gọn trong một màn hình.',
          fits: ['Nhà hàng', 'Quán cafe, trà sữa', 'Bar, pub', 'Quán nhậu'],
          features: [['fa-th', 'Sơ đồ bàn', 'Xem bàn trống, bàn có khách; chuyển, gộp, tách bàn.'],
                     ['fa-concierge-bell', 'Phiếu bếp, phiếu bar', 'Món gọi được in thẳng xuống bếp hoặc quầy pha chế.'],
                     ['fa-mortar-pestle', 'Định lượng nguyên liệu', 'Trừ kho nguyên liệu theo công thức từng món.'],
                     ['fa-chart-line', 'Báo cáo cuối ngày', 'Doanh thu, món bán chạy, đối soát tiền theo ca.']] },
        mypham: { name: 'Mỹ phẩm', lead: 'Quản lý hàng theo lô và hạn dùng, chăm sóc khách hàng và bán hàng đa kênh.',
          fits: ['Shop mỹ phẩm', 'Cửa hàng nước hoa', 'Hàng xách tay'],
          features: [['fa-vial', 'Lô và hạn sử dụng', 'Biết lô nào nhập trước, hàng nào sắp hết hạn.'],
                     ['fa-user-tag', 'Tích điểm thành viên', 'Ưu đãi riêng cho khách quen, nhắc khách mua lại.'],
                     ['fa-store', 'Bán online và tại quầy', 'Đơn hàng từ nhiều kênh dùng chung một kho.'],
                     ['fa-percent', 'Chương trình khuyến mại', 'Giảm giá theo sản phẩm, theo hóa đơn, theo thời gian.']] },
        taphoa: { name: 'Tạp hóa', lead: 'Bán hàng nhanh bằng máy quét mã vạch, quản lý hàng nghìn mặt hàng mà không cần sổ sách.',
          fits: ['Cửa hàng tạp hóa', 'Đại lý bán buôn', 'Kiốt chợ'],
          features: [['fa-barcode', 'Quét mã bán nhanh', 'Quét mã vạch, tính tiền và in hóa đơn trong vài giây.'],
                     ['fa-tags', 'Giá bán lẻ và bán buôn', 'Nhiều bảng giá cho khách lẻ, khách sỉ.'],
                     ['fa-book', 'Theo dõi công nợ', 'Ghi nợ khách hàng, nhà cung cấp, nhắc thu nợ.'],
                     ['fa-boxes', 'Kiểm kho', 'Biết hàng còn bao nhiêu, hàng nào cần nhập thêm.']] },
        sieuthimini: { name: 'Siêu thị mini', lead: 'Nhiều quầy thu ngân cùng lúc, quản lý ca, khuyến mại và tồn kho tập trung.',
          fits: ['Siêu thị mini', 'Cửa hàng tiện lợi', 'Chuỗi siêu thị'],
          features: [['fa-cash-register', 'Nhiều quầy thu ngân', 'Các quầy bán song song, dữ liệu về một kho chung.'],
                     ['fa-user-clock', 'Giao ca, chốt tiền', 'Đối soát tiền mặt từng ca, từng nhân viên.'],
                     ['fa-percent', 'Khuyến mại theo chương trình', 'Mua X tặng Y, giảm giá theo khung giờ.'],
                     ['fa-shield-alt', 'Kết nối cổng an ninh', 'Dùng cùng tem từ và cổng chống trộm.']] },
        dienthoai: { name: 'Điện thoại & Điện máy', lead: 'Quản lý theo IMEI, số serial và bảo hành cho từng máy bán ra.',
          fits: ['Cửa hàng điện thoại', 'Điện máy, điện lạnh', 'Linh kiện máy tính'],
          features: [['fa-mobile-alt', 'Quản lý IMEI, serial', 'Biết chính xác máy nào bán cho ai, khi nào.'],
                     ['fa-tools', 'Bảo hành, sửa chữa', 'Tiếp nhận, theo dõi và trả máy bảo hành.'],
                     ['fa-credit-card', 'Trả góp, đặt cọc', 'Ghi nhận thanh toán nhiều lần cho một đơn hàng.'],
                     ['fa-chart-pie', 'Lãi theo từng máy', 'Báo cáo lợi nhuận chính xác theo giá nhập.']] },
        thucpham: { name: 'Nông sản & Thực phẩm', lead: 'Bán hàng theo cân, quản lý hàng tươi sống và hàng có hạn dùng ngắn.',
          fits: ['Cửa hàng thực phẩm sạch', 'Hoa quả, nông sản', 'Đồ khô, đặc sản'],
          features: [['fa-balance-scale', 'Bán hàng theo cân', 'Kết nối cân điện tử, in tem giá theo khối lượng.'],
                     ['fa-calendar-check', 'Hạn sử dụng', 'Theo dõi hàng theo ngày nhập, hạn dùng.'],
                     ['fa-trash-alt', 'Hàng hủy, hao hụt', 'Ghi nhận hàng hỏng để tính đúng lợi nhuận.'],
                     ['fa-truck', 'Nhập hàng từ nhà vườn', 'Quản lý nhà cung cấp và công nợ nhập hàng.']] },
        noithat: { name: 'Nội thất & Gia dụng', lead: 'Quản lý đơn đặt hàng, giao lắp và công nợ cho các đơn giá trị lớn.',
          fits: ['Showroom nội thất', 'Đồ gia dụng', 'Thiết bị vệ sinh'],
          features: [['fa-file-invoice', 'Báo giá, đặt hàng', 'Lập báo giá, chuyển thành đơn hàng khi khách đồng ý.'],
                     ['fa-truck', 'Giao hàng, lắp đặt', 'Theo dõi lịch giao và trạng thái lắp đặt.'],
                     ['fa-hand-holding-usd', 'Đặt cọc, công nợ', 'Thu tiền nhiều đợt, nhắc khách còn nợ.'],
                     ['fa-warehouse', 'Nhiều kho', 'Showroom và kho chính quản lý riêng, chuyển kho dễ.']] },
        vatlieuxaydung: { name: 'Vật liệu xây dựng', lead: 'Bán theo nhiều đơn vị tính, quản lý công nợ công trình và giao hàng.',
          fits: ['Cửa hàng VLXD', 'Đại lý sắt thép, xi măng', 'Gạch ốp lát, sơn'],
          features: [['fa-ruler-combined', 'Nhiều đơn vị tính', 'Bán theo bao, tấn, m², viên; quy đổi tự động.'],
                     ['fa-hard-hat', 'Công nợ theo công trình', 'Theo dõi hàng xuất và tiền thu cho từng công trình.'],
                     ['fa-truck-loading', 'Phiếu giao hàng', 'In phiếu xuất kho, theo dõi xe giao.'],
                     ['fa-tags', 'Giá theo khách hàng', 'Giá riêng cho thầu, đại lý, khách lẻ.']] },
        phutung: { name: 'Xe máy & Linh kiện', lead: 'Quản lý hàng nghìn mã phụ tùng và kết hợp dịch vụ sửa chữa, bảo dưỡng.',
          fits: ['Cửa hàng xe máy', 'Phụ tùng xe máy', 'Tiệm sửa xe'],
          features: [['fa-cogs', 'Tra cứu phụ tùng nhanh', 'Tìm theo mã, tên hoặc dòng xe.'],
                     ['fa-wrench', 'Phiếu sửa chữa', 'Ghi công thợ và phụ tùng thay thế trên cùng hóa đơn.'],
                     ['fa-motorcycle', 'Lịch sử xe khách hàng', 'Tra cứu theo biển số những lần bảo dưỡng trước.'],
                     ['fa-boxes', 'Tồn kho tối thiểu', 'Báo phụ tùng sắp hết để nhập kịp.']] },
        nhathuoc: { name: 'Nhà thuốc', lead: 'Quản lý thuốc theo lô, hạn dùng và bán thuốc theo đơn một cách chặt chẽ.',
          fits: ['Nhà thuốc bán lẻ', 'Quầy thuốc', 'Chuỗi nhà thuốc'],
          features: [['fa-pills', 'Lô và hạn dùng', 'Xuất hàng theo lô, cảnh báo thuốc sắp hết hạn.'],
                     ['fa-prescription', 'Bán theo đơn', 'Lưu đơn thuốc và thông tin người mua.'],
                     ['fa-box-open', 'Bán lẻ theo vỉ, viên', 'Quy đổi hộp, vỉ, viên tự động.'],
                     ['fa-file-alt', 'Báo cáo nhập xuất tồn', 'Số liệu rõ ràng phục vụ kiểm tra định kỳ.']] },
        quatang: { name: 'Hoa & Quà tặng', lead: 'Nhận đặt hàng trước, giao theo giờ hẹn và quản lý combo quà tặng.',
          fits: ['Shop hoa tươi', 'Cửa hàng quà tặng', 'Giỏ quà, hộp quà'],
          features: [['fa-clipboard-list', 'Đơn đặt trước', 'Ghi ngày giờ giao, lời nhắn kèm theo.'],
                     ['fa-layer-group', 'Combo, giỏ quà', 'Tạo sản phẩm ghép từ nhiều món, trừ kho từng món.'],
                     ['fa-shipping-fast', 'Theo dõi giao hàng', 'Biết đơn nào đang giao, đã giao.'],
                     ['fa-calendar-alt', 'Mùa cao điểm', 'Chuẩn bị hàng cho lễ, Tết theo số liệu năm trước.']] },
        hieusach: { name: 'Sách & Văn phòng phẩm', lead: 'Quản lý đầu sách theo tác giả, nhà xuất bản và bán văn phòng phẩm cho doanh nghiệp.',
          fits: ['Hiệu sách', 'Văn phòng phẩm', 'Thiết bị trường học'],
          features: [['fa-book', 'Quản lý đầu sách', 'Tìm theo tên, tác giả, NXB, mã ISBN.'],
                     ['fa-building', 'Khách hàng doanh nghiệp', 'Báo giá, giao hàng định kỳ, công nợ theo tháng.'],
                     ['fa-undo', 'Trả hàng nhà cung cấp', 'Trả sách tồn, đối chiếu công nợ NXB.'],
                     ['fa-school', 'Mùa khai giảng', 'Theo dõi hàng bán chạy để nhập đủ.']] },
        massage: { name: 'Spa - Massage - Bể bơi', lead: 'Đặt lịch, quản lý phòng, nhân viên kỹ thuật và thẻ liệu trình.',
          fits: ['Spa, thẩm mỹ', 'Massage, xông hơi', 'Bể bơi, phòng gym'],
          features: [['fa-calendar-check', 'Đặt lịch hẹn', 'Xem lịch trống theo phòng và kỹ thuật viên.'],
                     ['fa-id-card', 'Thẻ liệu trình, vé tháng', 'Bán gói nhiều buổi, trừ buổi mỗi lần sử dụng.'],
                     ['fa-user-nurse', 'Hoa hồng nhân viên', 'Tính tour, hoa hồng cho từng kỹ thuật viên.'],
                     ['fa-door-open', 'Quản lý phòng', 'Theo dõi phòng đang dùng, thời gian còn lại.']] },
        garaoto: { name: 'Gara ô tô - Kho phụ tùng', lead: 'Quản lý lệnh sửa chữa, phụ tùng và lịch sử bảo dưỡng theo biển số xe.',
          fits: ['Gara sửa chữa', 'Trung tâm bảo dưỡng', 'Kho phụ tùng ô tô'],
          features: [['fa-car', 'Hồ sơ xe', 'Tra cứu theo biển số những lần sửa, thay thế trước.'],
                     ['fa-clipboard-check', 'Lệnh sửa chữa', 'Báo giá, duyệt, theo dõi tiến độ đến khi giao xe.'],
                     ['fa-cogs', 'Kho phụ tùng', 'Xuất phụ tùng theo lệnh, tồn kho luôn khớp.'],
                     ['fa-bell', 'Nhắc lịch bảo dưỡng', 'Nhắc khách quay lại theo số km hoặc thời gian.']] },
        tonthep: { name: 'Tôn thép - Sắt hộp', lead: 'Bán hàng theo cây, kg, mét; tính trọng lượng quy đổi và công nợ đại lý.',
          fits: ['Đại lý tôn thép', 'Cửa hàng sắt hộp', 'Xưởng cắt tôn'],
          features: [['fa-weight-hanging', 'Quy đổi trọng lượng', 'Bán theo cây nhưng tồn kho theo kg, tự quy đổi.'],
                     ['fa-cut', 'Cắt theo yêu cầu', 'Ghi độ dài cắt, tính tiền theo mét.'],
                     ['fa-book', 'Công nợ khách, đại lý', 'Theo dõi nợ theo hóa đơn, hạn thanh toán.'],
                     ['fa-truck-loading', 'Phiếu xuất, giao hàng', 'In phiếu cho xe giao, ký nhận hàng.']] },
        camdo: { name: 'Cầm đồ - Tài chính - Bát họ', lead: 'Quản lý hợp đồng cầm cố, lãi suất, kỳ đóng và tài sản đảm bảo.',
          fits: ['Tiệm cầm đồ', 'Dịch vụ tài chính'],
          features: [['fa-file-contract', 'Hợp đồng cầm cố', 'Lưu thông tin khách, tài sản, ảnh chụp tài sản.'],
                     ['fa-percentage', 'Tính lãi tự động', 'Lãi theo ngày, tuần, tháng; tính đến ngày chuộc.'],
                     ['fa-bell', 'Nhắc hạn đóng lãi', 'Danh sách hợp đồng đến hạn, quá hạn.'],
                     ['fa-lock', 'Quản lý kho tài sản', 'Biết tài sản nào đang giữ, đã chuộc, đã thanh lý.']] },
        phongkham: { name: 'Phòng khám - Kính mắt', lead: 'Tiếp đón bệnh nhân, lưu hồ sơ khám và bán thuốc, kính trong một phần mềm.',
          fits: ['Phòng khám tư', 'Cửa hàng kính mắt', 'Nha khoa'],
          features: [['fa-user-injured', 'Hồ sơ bệnh nhân', 'Lưu thông tin, lịch sử khám và chỉ định.'],
                     ['fa-glasses', 'Đơn kính', 'Lưu độ cận, loạn; gắn gọng và tròng vào đơn hàng.'],
                     ['fa-calendar-check', 'Lịch hẹn tái khám', 'Nhắc bệnh nhân đến đúng hẹn.'],
                     ['fa-file-invoice-dollar', 'Thu phí dịch vụ', 'Tính tiền khám, thuốc, kính trên một hóa đơn.']] },
        nghanhkhac: { name: 'Ngành hàng khác', lead: 'Chưa thấy ngành của bạn? Sky Eagle Soft có thể cấu hình theo mô hình kinh doanh riêng.',
          fits: ['Cửa hàng bán lẻ', 'Đại lý phân phối', 'Doanh nghiệp'],
          features: [['fa-sliders-h', 'Cấu hình theo nhu cầu', 'Chọn các tính năng phù hợp, bỏ những gì không dùng.'],
                     ['fa-boxes', 'Bán hàng và kho', 'Nhập, xuất, tồn kho và hóa đơn cơ bản.'],
                     ['fa-chart-bar', 'Báo cáo kinh doanh', 'Doanh thu, lợi nhuận theo ngày, tháng.'],
                     ['fa-headset', 'Tư vấn triển khai', 'Kỹ thuật viên hỗ trợ cài đặt và hướng dẫn sử dụng.']] }
      };

      var grid = document.querySelector('.industry-grid');
      var tiles = Array.prototype.slice.call(grid.querySelectorAll('.industry'));
      var panel = null, currentKey = null;

      function esc(t) { var d = document.createElement('div'); d.textContent = t; return d.innerHTML; }
      function columns() { return getComputedStyle(grid).gridTemplateColumns.split(' ').length; }

      function placePanel() {
        if (!panel || !currentKey) return;
        var idx = tiles.findIndex(function (t) { return t.getAttribute('data-key') === currentKey; });
        var cols = columns();
        var lastInRow = Math.min(tiles.length - 1, Math.floor(idx / cols) * cols + cols - 1);
        tiles[lastInRow].after(panel);
      }

      function closeDetail(updateHash) {
        if (panel) panel.remove();
        panel = null;
        tiles.forEach(function (t) { t.classList.remove('active'); t.setAttribute('aria-expanded', 'false'); });
        var prev = currentKey; currentKey = null;
        if (updateHash) history.replaceState(null, '', '#nganh-hang');
        if (prev) { var t = grid.querySelector('[data-key="' + prev + '"]'); if (t) t.focus(); }
      }

      function openDetail(key, scroll) {
        var d = industries[key];
        var tile = grid.querySelector('[data-key="' + key + '"]');
        if (!d || !tile) return;
        if (panel) panel.remove();
        tiles.forEach(function (t) { t.classList.remove('active'); t.setAttribute('aria-expanded', 'false'); });
        tile.classList.add('active'); tile.setAttribute('aria-expanded', 'true');
        currentKey = key;

        panel = document.createElement('div');
        panel.className = 'industry-detail';
        panel.id = 'chitiet-nganh';
        panel.setAttribute('role', 'region');
        panel.setAttribute('aria-label', 'Phần mềm cho ngành ' + d.name);
        panel.innerHTML =
          '<button class="detail-close" type="button" aria-label="Đóng"><i class="fas fa-times"></i></button>' +
          '<div>' +
            '<div class="detail-head"><img src="' + tile.querySelector('img').getAttribute('src') + '" alt="">' +
              '<div><span>Phần mềm quản lý</span><h3>' + esc(d.name) + '</h3></div></div>' +
            '<p class="detail-lead">' + esc(d.lead) + '</p>' +
            '<ul class="detail-fits">' + d.fits.map(function (f) { return '<li>' + esc(f) + '</li>'; }).join('') + '</ul>' +
            '<div class="detail-actions">' +
              '<a href="tel:0979479007" class="btn btn-sky"><i class="fas fa-phone-alt"></i> Tư vấn: 0979 479 007</a>' +
              '<a class="link" href="ChiTietNganhHang.aspx?nganh=' + key + '">Xem trang chi tiết</a>' +
            '</div>' +
          '</div>' +
          '<div class="detail-features">' +
            d.features.map(function (f) {
              return '<div class="feature"><i class="fas ' + f[0] + '"></i><h4>' + esc(f[1]) + '</h4><p>' + esc(f[2]) + '</p></div>';
            }).join('') +
          '</div>';
        panel.querySelector('.detail-close').addEventListener('click', function () { closeDetail(true); });
        placePanel();
        history.replaceState(null, '', '#nganh-' + key);
        if (scroll) panel.scrollIntoView({ behavior: matchMedia('(prefers-reduced-motion: reduce)').matches ? 'auto' : 'smooth', block: 'nearest' });
      }

      tiles.forEach(function (t) {
        t.addEventListener('click', function (e) {
          e.preventDefault();
          var key = t.getAttribute('data-key');
          if (key === currentKey) closeDetail(true); else openDetail(key, true);
        });
      });
      document.addEventListener('keydown', function (e) { if (e.key === 'Escape' && panel && !document.querySelector('dialog[open]')) closeDetail(true); });
      var lastCols = columns();
      window.addEventListener('resize', function () { var c = columns(); if (c !== lastCols) { lastCols = c; placePanel(); } });

      // Mở sẵn khi vào bằng link dạng index.aspx#nganh-nhahang
      var m = location.hash.match(/^#nganh-(\w+)$/);
      if (m && industries[m[1]]) {
        openDetail(m[1], false);
        setTimeout(function () { panel && panel.scrollIntoView({ block: 'center' }); }, 50);
      }

      // Thông số thiết bị
      var specs = {
        'product-13874': { name: 'Máy quét mã vạch Zebex Z-3151HS', img: 'ZebexZ3100.jpg',
          items: ['Bảo hành 12 tháng', 'Tốc độ quét: 300 scans/giây', 'Cầm quét tay hoặc tự động', 'Kích thước: 120 x 294 x 180 mm', 'Cổng kết nối: USB, RS232, Keyboard', 'Chuẩn IP42'] },
        'product-14875': { name: 'Máy quét mã vạch đa tia YOUJIE YJ5900', img: 'daudocyouje.jpg',
          items: ['Bảo hành 12 tháng', 'Tốc độ quét: 1650 scans/giây', 'Quét cầm tay hoặc tự động', 'Số tia quét: đa tia', 'Kích thước: 87 x 98 x 170 mm (D x R x C)', 'Cổng kết nối: USB, RS232, Keyboard Wedge', 'Chuẩn IP42'] },
        'product-13866': { name: 'Máy in hóa đơn Birch PRP 085', img: 'prp085.jpg',
          items: ['Bảo hành 12 tháng', 'In nhiệt trực tiếp trên giấy K80, tự động cắt giấy', 'Tốc độ in 220 mm/giây', 'Kích thước 200 (D) x 145 (R) x 145 (C) mm, nặng 2 kg', 'Cổng kết nối USB, kết nối được ngăn kéo đựng tiền', 'Nguồn điện 100–240V AC, 50–60Hz'] },
        'product-13878': { name: 'Máy in hóa đơn Birch C230', img: 'C2030.jpg',
          items: ['Bảo hành 12 tháng', 'In nhiệt trực tiếp trên giấy K80, tự động cắt giấy', 'Tốc độ in 220 mm/giây', 'Kích thước 200 (D) x 145 (R) x 145 (C) mm, nặng 2 kg', 'Cổng kết nối USB, kết nối được ngăn kéo đựng tiền', 'Nguồn điện 100–240V AC, 50–60Hz'] },
        'product-13886': { name: 'Máy in mã vạch Godex G500', img: 'Godexg500.jpg',
          items: ['Bảo hành 12 tháng', 'Độ phân giải: 203 dpi (8 dot/mm)', 'In truyền nhiệt / in nhiệt trực tiếp', 'Ribbon: Wax, Wax/Resin, Resin', 'Tốc độ in tối đa: 5 IPS (127 mm/giây)', 'Bộ nhớ: 8MB Flash, 16MB SDRAM', 'Cổng kết nối: USB 2.0, Parallel, Serial, Ethernet', 'Nguồn tự động 100–240V AC, 50–60Hz'] },
        'product-13876': { name: 'Cổng an ninh siêu thị CW-1000C', img: 'CW-1000C.jpg',
          items: ['Tần số sóng: RF 8.2MHz', 'Khoảng cách tem mềm nhỏ: 1,2 m', 'Khoảng cách tem cứng: loại nhỏ 1,4 m, loại to 1,6 m', 'Chất liệu hợp kim nhôm, màu bạc trắng', 'Gồm 2 thanh (1 thu, 1 phát) và 1 bộ nguồn', 'Điện áp 220/230V, 15W', 'Kích thước: 165 x 32 x 9 cm'] },
        'product-13881': { name: 'Giấy in hóa đơn nhiệt K80 - giấy in mã vạch decal cuộn', img: 'Giayin.jpg',
          items: ['Giấy in mã vạch cuộn đi kèm máy in mã vạch', 'Giấy in hóa đơn cuộn đi kèm máy in bill'] },
        'product-13883': { name: 'Ngăn kéo đựng tiền RT-410', img: 'ketsat.jpg',
          items: ['Bảo hành 12 tháng', 'Thép dày, mạ kẽm, sơn tĩnh điện', '5 ngăn tiền giấy + 4 ngăn tiền giấy kiểu sấp', 'Tương thích mọi hệ thống POS hoặc máy tính tiền', 'Độ bền tối thiểu 1 triệu lần đóng mở', 'Kết nối cổng RJ11, 12V hoặc 24V', 'Mở bằng lệnh hoặc bằng khóa cơ', 'Kích thước: 410 x 420 x 100 mm, nặng 7,8 kg (cả hộp)'] }
      };

      var dlg = document.getElementById('specDialog');
      var hasDialog = typeof dlg.showModal === 'function';
      document.querySelectorAll('.device-more').forEach(function (btn) {
        btn.addEventListener('click', function () {
          var p = specs[btn.getAttribute('data-id')];
          if (!p) return;
          document.getElementById('specTitle').textContent = p.name;
          var img = document.getElementById('specImg');
          img.src = './Giaodienphanmem/' + p.img; img.alt = p.name;
          var list = document.getElementById('specList');
          list.innerHTML = '';
          p.items.forEach(function (t) { var li = document.createElement('li'); li.textContent = t; list.appendChild(li); });
          if (hasDialog) dlg.showModal(); else dlg.setAttribute('open', '');
        });
      });
      dlg.querySelector('.spec-close').addEventListener('click', function () { hasDialog ? dlg.close() : dlg.removeAttribute('open'); });
      dlg.addEventListener('click', function (e) { if (e.target === dlg && hasDialog) dlg.close(); });
    })();
  </script>
</body>
</html>
