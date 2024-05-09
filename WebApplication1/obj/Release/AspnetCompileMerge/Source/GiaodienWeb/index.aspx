<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="WebApplication1.GiaodienWeb.index" %>

<!DOCTYPE html>

<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Sky Eagle Soft | Phần mềm quản lý Nhà hàng - Khách sạn - Karaoke - Bán hàng</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="../../plugins/fontawesome-free/css/all.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="../../dist/css/adminlte.min.css">

<link href="./Giaodienphanmem/style-kv222.min.css" rel="stylesheet">
 
  <%--  
    <style>
        .wrapper {
    margin-left: 100px;
}
    </style>--%>

</head>
<body class="hold-transition sidebar-collapse layout-top-nav" >
<div class="wrapper">

  <!-- Navbar -->
  <nav class="main-header navbar navbar-expand-md navbar-light navbar-white">
    <div class="container">
      <a href="#" class="navbar-brand">
        <img src="../../dist/img/logo_eagle.JPG" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
        <span class="brand-text font-weight-light">Sky Eagle Soft</span>
      </a>

      <button class="navbar-toggler order-1" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse order-3" id="navbarCollapse">
        <!-- Left navbar links -->
        <ul class="navbar-nav">
          <li class="nav-item">
            <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
          </li>
          <li class="nav-item">
            <a href="index3.html" class="nav-link">Trang chủ</a>
          </li>
            <li class="nav-item dropdown">
            <a id="dropdownSubMenu1" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="nav-link dropdown-toggle">Phần Mềm quản lý</a>
            <ul aria-labelledby="dropdownSubMenu1" class="dropdown-menu border-0 shadow">
              <li><a href="#" class="dropdown-item">Phần mềm quản lý nhà hàng</a></li>
              <li><a href="#" class="dropdown-item">Phần mềm quản lý khách sạn</a></li>
                <li><a href="#" class="dropdown-item">Phần mềm quản lý nhà nghỉ</a></li>
                <li><a href="#" class="dropdown-item">Phần mềm quản lý Karaoke</a></li>

              <li class="dropdown-divider"></li>

              <!-- Level two dropdown-->
              <li class="dropdown-submenu dropdown-hover">
                <a id="dropdownSubMenu2" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="dropdown-item dropdown-toggle">Phần mềm quản lý bán hàng</a>
                <ul aria-labelledby="dropdownSubMenu2" class="dropdown-menu border-0 shadow">
                  <li>
                    <a tabindex="-1" href="#" class="dropdown-item">Quản lý bán hàng siêu thị</a>
                    <a tabindex="-1" href="#" class="dropdown-item">Quản lý bán hàng nhà thuốc</a>
                    <a tabindex="-1" href="#" class="dropdown-item">Quản lý bán hàng phụ tùng ô tô</a>
                    <a tabindex="-1" href="#" class="dropdown-item">Quản lý bán hàng phụ ga, nước</a>
                    <a tabindex="-1" href="#" class="dropdown-item">Quản lý bán hàng doanh nghiệp</a>
                  </li>                                   
                </ul>
              </li>
              <!-- End Level two -->
            </ul>
          </li>

          <li class="nav-item">
            <a href="#" class="nav-link">Thiết bị</a>
          </li>
            <li class="nav-item">
            <a href="#" class="nav-link">Tư vấn</a>
          </li>
             <li class="nav-item">
            <a href="#" class="nav-link">Khách hàng</a>
          </li>
             <li class="nav-item">
            <a href="#" class="nav-link">Hỗ trợ</a>
          </li>
          
        </ul>

        <!-- SEARCH FORM -->
        <form class="form-inline ml-0 ml-md-3">
          <div class="input-group input-group-sm">
            <input class="form-control form-control-navbar" type="search" placeholder="Search" aria-label="Search">
            <div class="input-group-append">
              <button class="btn btn-navbar" type="submit">
                <i class="fas fa-search"></i>
              </button>
            </div>
          </div>
        </form>
      </div>

      <!-- Right navbar links -->
      <ul class="order-1 order-md-3 navbar-nav navbar-no-expand ml-auto">
        <!-- Messages Dropdown Menu -->
        <li class="nav-item dropdown">
          <a class="nav-link" data-toggle="dropdown" href="#">
            <i class="fas fa-comments"></i>
            <span class="badge badge-danger navbar-badge">3</span>
          </a>
          <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
            <a href="#" class="dropdown-item">
              <!-- Message Start -->
              <div class="media">
                <img src="../../dist/img/user1-128x128.jpg" alt="User Avatar" class="img-size-50 mr-3 img-circle">
                <div class="media-body">
                  <h3 class="dropdown-item-title">
                    Brad Diesel
                    <span class="float-right text-sm text-danger"><i class="fas fa-star"></i></span>
                  </h3>
                  <p class="text-sm">Call me whenever you can...</p>
                  <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p>
                </div>
              </div>
              <!-- Message End -->
            </a>
            <div class="dropdown-divider"></div>
            <a href="#" class="dropdown-item">
              <!-- Message Start -->
              <div class="media">
                <img src="../../dist/img/user8-128x128.jpg" alt="User Avatar" class="img-size-50 img-circle mr-3">
                <div class="media-body">
                  <h3 class="dropdown-item-title">
                    John Pierce
                    <span class="float-right text-sm text-muted"><i class="fas fa-star"></i></span>
                  </h3>
                  <p class="text-sm">I got your message bro</p>
                  <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p>
                </div>
              </div>
              <!-- Message End -->
            </a>
            <div class="dropdown-divider"></div>
            <a href="#" class="dropdown-item">
              <!-- Message Start -->
              <div class="media">
                <img src="../../dist/img/user3-128x128.jpg" alt="User Avatar" class="img-size-50 img-circle mr-3">
                <div class="media-body">
                  <h3 class="dropdown-item-title">
                    Nora Silvester
                    <span class="float-right text-sm text-warning"><i class="fas fa-star"></i></span>
                  </h3>
                  <p class="text-sm">The subject goes here</p>
                  <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p>
                </div>
              </div>
              <!-- Message End -->
            </a>
            <div class="dropdown-divider"></div>
            <a href="#" class="dropdown-item dropdown-footer">See All Messages</a>
          </div>
        </li>
        <!-- Notifications Dropdown Menu -->
        <li class="nav-item dropdown">
          <a class="nav-link" data-toggle="dropdown" href="#">
            <i class="far fa-bell"></i>
            <span class="badge badge-warning navbar-badge">15</span>
          </a>
          <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
            <span class="dropdown-header">15 Notifications</span>
            <div class="dropdown-divider"></div>
            <a href="#" class="dropdown-item">
              <i class="fas fa-envelope mr-2"></i> 4 new messages
              <span class="float-right text-muted text-sm">3 mins</span>
            </a>
            <div class="dropdown-divider"></div>
            <a href="#" class="dropdown-item">
              <i class="fas fa-users mr-2"></i> 8 friend requests
              <span class="float-right text-muted text-sm">12 hours</span>
            </a>
            <div class="dropdown-divider"></div>
            <a href="#" class="dropdown-item">
              <i class="fas fa-file mr-2"></i> 3 new reports
              <span class="float-right text-muted text-sm">2 days</span>
            </a>
            <div class="dropdown-divider"></div>
            <a href="#" class="dropdown-item dropdown-footer">See All Notifications</a>
          </div>
        </li>
        <li class="nav-item">
          <a class="nav-link" data-widget="control-sidebar" data-slide="true" href="#" role="button">
            <i class="fas fa-th-large"></i>
          </a>
        </li>
      </ul>
    </div>
  </nav>
  <!-- /.navbar -->

 

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
  <%--  <div class="content-header">
      <div class="container">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark"> Top Navigation <small>Example 3.0</small></h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item"><a href="#">Layout</a></li>
              <li class="breadcrumb-item active">Top Navigation</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>--%>
    <!-- /.content-header -->

    <!-- Main content -->
    <div class="content">
      <div class="container">
        <div class="row">
         
<div class="banner">
    <div class="container">
        <div class="row">
            <div class="col-md-6 text-center aos-init aos-animate" data-aos="fade-left">
                    <img src="../../dist/img/bannerOK2.jpg" class="lazy thumb pt-md-5" alt="header thumbnail">
           </div>
            <div class="col-md-6 col-xs-6 right-banner">
                <div class="text-banner">
                  <h1 class="title title-homepage">Phần mềm quản lý bán hàng tốt nhất cho cửa hàng bán lẻ</h1>
                    <p><b>Sky Eagle Soft - Phần mềm quản lý bán hàng</b> phổ biến nhất với 50.000 cửa hàng đang sử dụng. Đơn giản, dễ dùng, tiết kiệm chi phí và phù hợp với hơn 20 ngành hàng khác nhau.</p>
                </div>
            </div>
        </div>
    </div>
</div>

            <!--box-introduce-->
    <div class="box-industry">
        <div class="container">
            <div class="box-title">
                <h2 class="title">Chúng tôi thiết kế phần mềm chuyên biệt cho từng ngành hàng.</h2>
                <p>Hãy chọn ngành hàng của bạn để xem các tính năng Sky Eagle Soft  giúp bạn như thế nào.</p>
            </div>
            <div class="row box-list-industry">
                <div class="col-md-4 col-xs-12 list-industry">
                                <a href="http://tinhocvietnam.com/chitietsanpham/thoitrang" title="Thời trang" class="list">
                                    <img src="./Giaodienphanmem/iconthoitrang.jpg" style="width: 76px; height: 61px;">

                                    <h3>Thời trang</h3>
                                </a>
                            </div>
                                 <div class="col-md-4 col-xs-12 list-industry">
                                <a href="http://tinhocvietnam.com/chitietsanpham/mevabe" title="Mẹ &amp; Bé" class="list">
                                    <img src="./Giaodienphanmem/iconmevabe.jpg" style="width: 76px; height: 61px;">
                                    <h3>Mẹ &amp; Bé</h3>
                                </a>
                            </div>
                                <div class="col-md-4 col-xs-12 list-industry">
                                <a href="http://tinhocvietnam.com/chitietsanpham/nhahang" title="Bar - Cafe - Nhà hàng" class="list">
                                   <img src="./Giaodienphanmem/iconnhahang.jpg" style="width: 76px; height: 61px;">
                                    <h3>Bar - Cafe - Nhà hàng</h3>
                                </a>
                            </div>
                                 <div class="col-md-4 col-xs-12 list-industry">
                                <a href="http://tinhocvietnam.com/chitietsanpham/mypham" title="Mỹ phẩm" class="list">
                                 <img src="./Giaodienphanmem/iconmypham.jpg" style="width: 76px; height: 61px;">
                                    <h3>Mỹ phẩm</h3>
                                </a>
                            </div>
                                <div class="col-md-4 col-xs-12 list-industry">
                                <a href="http://tinhocvietnam.com/chitietsanpham/taphoa" title="Tạp hóa" class="list">
                                       <img src="./Giaodienphanmem/icontaphoa.jpg" style="width: 76px; height: 61px;">
                                    <h3>Tạp hóa</h3>
                                </a>
                            </div>
                                 <div class="col-md-4 col-xs-12 list-industry">
                                <a href="http://tinhocvietnam.com/chitietsanpham/sieuthimini" title="Siêu thị mini" class="list">
                                    <img src="./Giaodienphanmem/iconsieuthi.jpg" style="width: 76px; height: 61px;">
                                    <h3>Siêu thị mini</h3>
                                </a>
                            </div>
                                 <div class="col-md-4 col-xs-12 list-industry">
                                <a href="http://tinhocvietnam.com/chitietsanpham/dienthoai" title="Điện thoại &amp; Điện máy" class="list">
                                  <img src="./Giaodienphanmem/icondienmay.jpg" style="width: 76px; height: 61px;">
                                    <h3>Điện thoại &amp; Điện máy</h3>
                                </a>
                            </div>
                                 <div class="col-md-4 col-xs-12 list-industry">
                                <a href="http://tinhocvietnam.com/chitietsanpham/thucpham" title="Nông sản &amp; Thực phẩm" class="list">
                                    <img src="./Giaodienphanmem/iconnongsan.jpg" style="width: 76px; height: 61px;">
                                    <h3>Nông sản &amp; Thực phẩm</h3>
                                </a>
                            </div>
                                 <div class="col-md-4 col-xs-12 list-industry">
                                <a href="http://tinhocvietnam.com/chitietsanpham/noithat" title="Nội thất &amp; Gia dụng" class="list">
                                  <img src="./Giaodienphanmem/iconnoithat.jpg" style="width: 76px; height: 61px;">
                                    <h3>Nội thất &amp; Gia dụng</h3>
                                </a>
                            </div>
                                <div class="col-md-4 col-xs-12 list-industry">
                                <a href="http://tinhocvietnam.com/chitietsanpham/vatlieuxaydung" title="Vật liệu xây dựng" class="list">
                                  <img src="./Giaodienphanmem/iconvatlieuxaydung.jpg" style="width: 76px; height: 61px;">
                                    <h3>Vật liệu xây dựng</h3>
                                </a>
                            </div>
                                 <div class="col-md-4 col-xs-12 list-industry">
                                <a href="http://tinhocvietnam.com/chitietsanpham/phutung" title="Xe Máy &amp; Linh Kiện" class="list">
                                 <img src="./Giaodienphanmem/iconxemay.jpg" style="width: 76px; height: 61px;">
                                    <h3>Xe Máy &amp; Linh Kiện</h3>
                                </a>
                            </div>
                                 <div class="col-md-4 col-xs-12 list-industry">
                                <a href="http://tinhocvietnam.com/chitietsanpham/nhathuoc" title="Nhà thuốc" class="list">
                                 <img src="./Giaodienphanmem/iconnhathuoc.jpg" style="width: 76px; height: 61px;">
                                    <h3>Nhà thuốc</h3>
                                </a>
                            </div>
                                 <div class="col-md-4 col-xs-12 list-industry">
                                <a href="http://tinhocvietnam.com/chitietsanpham/quatang" title="Hoa &amp; Quà tặng" class="list">
                                   <img src="./Giaodienphanmem/iconhoaquatang.jpg" style="width: 50px; height: 50px;">
                                    <h3>Hoa &amp; Quà tặng</h3>
                                </a>
                            </div>
                                <div class="col-md-4 col-xs-12 list-industry">
                                <a href="http://tinhocvietnam.com/chitietsanpham/hieusach" title="Sách &amp; Văn phòng phẩm" class="list">
                                     <img src="./Giaodienphanmem/iconnhasach.jpg" style="width: 76px; height: 61px;">
                                    <h3>Sách &amp; Văn phòng phẩm</h3>
                                </a>
                            </div>
                                 <div class="col-md-4 col-xs-12 list-industry">
                                <a href="http://tinhocvietnam.com/chitietsanpham/nghanhkhac" title="Ngành hàng khác" class="list">
                                      <img src="./Giaodienphanmem/iconcacnganhkhac.jpg" style="width: 76px; height: 61px;">
                                    <h3>Ngành hàng khác</h3>
                                </a>
                            </div>

            </div>

            <div class="row box-list-industry">
                <div class="col-md-4 col-xs-12 list-industry">
                                <a href="http://tinhocvietnam.com/chitietsanpham/massage" title="Spa - massage - bể bơi" class="list">
                                    <img src="./Giaodienphanmem/iconspa.jpg" style="width: 76px; height: 61px;">
                                    <h3>Spa - massage - bể bơi</h3>
                                </a>
                            </div>
                                 <div class="col-md-4 col-xs-12 list-industry">
                                <a href="http://tinhocvietnam.com/chitietsanpham/garaoto" title="Gara oto - kho phu tung" class="list">
                                    <img src="./Giaodienphanmem/icongara.jpg" style="width: 76px; height: 61px;">
                                    <h3>Gara Ô tô - Kho phụ tùng</h3>
                                </a>
                            </div>
                                 <div class="col-md-4 col-xs-12 list-industry">
                                <a href="http://tinhocvietnam.com/chitietsanpham/tonthep" title="Ton thep - sat hop" class="list">
                                   <img src="./Giaodienphanmem/icontonthep.jpg" style="width: 76px; height: 61px;">
                                    <h3>Tôn thép - Sắt hộp</h3>
                                </a>
                            </div>
                                <div class="col-md-4 col-xs-12 list-industry">
                                <a href="http://tinhocvietnam.com/chitietsanpham/camdo" title="Cam do - bat ho - tai chinh" class="list">
                                   <img src="./Giaodienphanmem/iconcamdo.jpg" style="width: 76px; height: 61px;">
                                    <h3>Cầm đồ - Tài chính - Bát họ</h3>
                                </a>
                            </div>
                               <div class="col-md-4 col-xs-12 list-industry">
                                <a href="http://tinhocvietnam.com/chitietsanpham/phongkham" title="Phong kham - benh vien" class="list">
                                   <img src="./Giaodienphanmem/iconphongkham.jpg" style="width: 76px; height: 61px;">
                                    <h3>Phóng khám - Kính mắt</h3>
                                </a>
                            </div>
                            <div class="col-md-4 col-xs-12 list-industry">

                            <div class="col-md-4 col-xs-12 list-industry">


            </div>

            <!--<div class="box-register">-->
                <!--<h3 class="title"></h3>-->
                <!--<button class="register box-popup-register"><span class="icon-caret"><i class="fa fa-external-link-square"></i></span>Dùng thử miễn phí</button>-->
            <!--</div>-->
        </div>
    </div>
    <!--industry-->
    <div class="box-customer box-industry">
        <div class="container">
            <div class="box-title">
                <h3 class="title">Khách hàng của chúng tôi</h3>
                <p>Sky Eagle Soft là phần mềm quản lý bán hàng phổ biến nhất hiện nay. Với gần 10.000 cửa hàng đang sử dụng và hơn 500 cửa hàng đăng ký mới mỗi tháng.</p>
            </div>
            <div class="row box-list-industry">
                <div class="col-md-4 col-xs-12 list-industry">
                    <div class="list-customer">
                        <div class="img-customer">
                            <img src="./Giaodienphanmem/ICON.jpg" width="" height="" alt="lioncoffee.com.vn">
                        </div>
                        <div class="content-customer">
                            <h4>lioncoffee.com.vn</h4>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-xs-12 list-industry">
                    <div class="list-customer">
                        <div class="img-customer">
                            <img src="./Giaodienphanmem/ALINA.jpg" width="" height="" alt="Thời trang ALINA">
                        </div>
                        <div class="content-customer">
                            <h4>Thời trang ALINA</h4>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-xs-12 list-industry">
                    <div class="list-customer">
                        <div class="img-customer">
                            <img src="./Giaodienphanmem/THAILAN.jpg" width="" height="" alt="Thế giới hàng thái lan MadeinThaiLan">
                        </div>
                        <div class="content-customer">
                            <h4>Thế giới hàng thái lan MadeinThaiLan</h4>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-xs-12 list-industry">
                    <div class="list-customer">
                        <div class="img-customer">
                            <img src="./Giaodienphanmem/SEVENOUMO.jpg" width="" height="" alt="SEVEN.OUMO">
                        </div>
                        <div class="content-customer">
                            <h4>Thời trang cao cấp SEVEN.OUMO</h4>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-xs-12 list-industry">
                    <div class="list-customer">
                        <div class="img-customer">
                            <img src="./Giaodienphanmem/HUONGSEN.jpg" width="" height="" alt="Hương Sen HEALTHCARE CENTERn">
                        </div>
                        <div class="content-customer">
                            <h4>Hương Sen HEALTHCARE CENTER</h4>
                        </div>
                    </div>
                </div>
            </div><!--End-col-->
            </div>
            <!--End-row-->
            <a href="#" class="btn" rel="nofollow">Xem thêm</a>
        </div>

            <div class="box-product-price">
           <h3 style="line-height: 35px;">Thiết bị hỗ trợ bán hàng</h3>
            <div class="row">
                                <div class="col-xs-3">
                    <div class="product-price">
                        <div class="img-product-price">
                            <img src="./Giaodienphanmem/ZebexZ3100.jpg" align="center" alt="" width="" height="">
                            <a href="javascript:void(0)" data-id="product-13874">Xem chi tiết</a>
                        </div>
                        <div class="info-product-price">
                            <a href="http://tinhocvietnam.com/#" class="name-product-price">Máy quét mã vạch Zebex Z-3151HS</a>
                                                                                                <p class="code">1.400.000 <span style="font-size: 16px">VNĐ (Tặng Kèm Khi Mua Phần Mềm) </span></p>
                                    <p class="code-old">
                                        2.000.000
                                                                                    <span class="colde-sale">20%</span>
                                                                            </p>
                                                                                        <p>Bảo hành 12 tháng</p>
                        </div>
                    </div>
                                        <p class="img"><img src="./Giaodienphanmem/banchay.png"></p>
                                    </div>

                                <div class="col-xs-3">
                    <div class="product-price">
                        <div class="img-product-price">
                            <img src="./Giaodienphanmem/daudocyouje.jpg" align="center" alt="" width="" height="">
                            <a href="javascript:void(0)" data-id="product-14875">Xem chi tiết</a>
                        </div>
                        <div class="info-product-price">
                            <a href="http://tinhocvietnam.com/#" class="name-product-price">Máy quét mã vạch đa tia YOUJIE YJ5900</a>
                                                                                                <p class="code">2.720.000 <span>đ</span></p>
                                    <p class="code-old">
                                        3.400.000                                        <span>đ</span>
                                                                                    <span class="colde-sale">20%</span>
                                                                            </p>
                                                                                        <p>Bảo hành 12 tháng</p>
                        </div>
                    </div>
                                        <p class="img"><img src="./Giaodienphanmem/banchay.png"></p>
                                    </div>

                                <div class="col-xs-3">
                    <div class="product-price">
                        <div class="img-product-price">
                            <img src="./Giaodienphanmem/prp085.jpg" align="center" alt="" width="" height="">
                            <a href="javascript:void(0)" data-id="product-13866">Xem chi tiết</a>
                        </div>
                        <div class="info-product-price">
                            <a href="http://tinhocvietnam.com/#" class="name-product-price">Máy in hóa đơn Birch PRP 085</a>
                                                                                                <p class="code">1.500.000  <span style="font-size: 16px">VNĐ (Tặng Kèm Khi Mua Phần Mềm) </span></p>
                                    <p class="code-old">
                                       2.000.000
                                                                                    <span class="colde-sale">20%</span>
                                                                            </p>
                                                                                        <p>Bảo hành 12 tháng</p>
                        </div>
                    </div>
                                        <p class="img"><img src="./Giaodienphanmem/banchay.png"></p>
                                    </div>

                                <div class="col-xs-3">
                    <div class="product-price">
                        <div class="img-product-price">
                            <img src="./Giaodienphanmem/C2030.jpg" align="center" alt="" width="" height="">
                            <a href="javascript:void(0)" data-id="product-13878">Xem chi tiết</a>
                        </div>
                        <div class="info-product-price">
                            <a href="http://tinhocvietnam.com/#" class="name-product-price">Máy in hóa đơn Birch C230</a>
                                                                                                <p class="code">1.400.000  <span style="font-size: 16px"> VNĐ (Tặng Kèm Khi Mua Phần Mềm)</span></p>
                                                                                        <p>Bảo hành 12 tháng</p>
                        </div>
                    </div>
                                    </div>

                                <div class="col-xs-3">
                    <div class="product-price">
                        <div class="img-product-price">
                            <img src="./Giaodienphanmem/Godexg500.jpg" align="center" alt="" width="" height="">
                            <a href="javascript:void(0)" data-id="product-13886">Xem chi tiết</a>
                        </div>
                        <div class="info-product-price">
                            <a href="http://tinhocvietnam.com/#" class="name-product-price">Máy in mã vạch Godex G500</a>
                                                                                                <p class="code">3.990.000 <span>đ</span></p>
                                                                                        <p>Bảo hành 12 tháng</p>
                        </div>
                    </div>
                                        <p class="img"><img src="./Giaodienphanmem/banchay.png"></p>
                                    </div>

                                <div class="col-xs-3">
                    <div class="product-price">
                        <div class="img-product-price">
                            <img src="./Giaodienphanmem/CW-1000C.jpg" align="center" alt="" width="" height="">
                            <a href="javascript:void(0)" data-id="product-13876">Xem chi tiết</a>
                        </div>
                        <div class="info-product-price">
                            <a href="http://tinhocvietnam.com/#" class="name-product-price"> Cổng an ninh siêu thị: CW-1000C </a>
                                                            <p class="code">Giá liên hệ</p>
                                                        <p>Bảo hành  12 tháng</p>
                        </div>
                    </div>
                                    </div>

                                <div class="col-xs-3">
                    <div class="product-price">
                        <div class="img-product-price">
                            <img src="./Giaodienphanmem/Giayin.jpg" align="center" alt="" width="" height="">
                            <a href="javascript:void(0)" data-id="product-13881">Xem chi tiết</a>
                        </div>
                        <div class="info-product-price">
                            <a href="http://tinhocvietnam.com/#" class="name-product-price">Giấy in mã vạch - hóa đơn  </a>
                                                                                                <p class="code">8.000 đ/ cuộn <span style="font-size: 16px">(Tặng Kèm Khi Mua Phần Mềm)</span></p>
                                                                                        <p>Bảo hành </p>
                        </div>
                    </div>
                                    </div>

                                <div class="col-xs-3">
                    <div class="product-price">
                        <div class="img-product-price">
                            <img src="./Giaodienphanmem/ketsat.jpg" align="center" alt="" width="" height="">
                            <a href="javascript:void(0)" data-id="product-13883">Xem chi tiết</a>
                        </div>
                        <div class="info-product-price">
                            <a href="http://tinhocvietnam.com/#" class="name-product-price">Ngăn kéo đựng tiền RT-410</a>
                                                                                                <p class="code">1.100.000 <span style="font-size: 16px">VNĐ (Tặng Kèm Khi Mua Phần Mềm) </span></p>
                                                                                        <p>Bảo hành 12 tháng</p>
                        </div>
                    </div>
                                    </div>

                            </div>
                        <div class="intro-product" id="product-13874">
                <div class="container">
                    <div class="content-intro-product">
                        <div class="before"></div>
                        <div class="after"></div>
                        <div class="row" style="position: relative">
                            <i class="fa fa-times" aria-hidden="true"></i>
                            <div class="col-xs-3">
                                <img src="./Giaodienphanmem/ZebexZ3100.jpg" align="center" alt="" width="" height="">
                            </div>
                            <div class="col-xs-9">
                                <h3>Máy quét mã vạch Zebex Z-3151HS</h3>
                                                                    <p>1.800.000 <span>đ</span></p>
                                                                        <p class="code-old">
                                        2.000.000                                        <span>đ</span>
                                                                                    <span class="colde-sale">20%</span>
                                                                            </p>
                                                                                                    <ul class="">
                                    <li><p> Bảo hành 12 tháng</p></li>
                                                                            <li><p> Tốc độ quét: 300 scans/second</p></li>
                                                                            <li><p> Cầm quét tay hoặc tự động</p></li>
                                                                            <li><p> Kích thước: 120x294x180mm</p></li>
                                                                            <li><p> Kết nối cổng: USB, RS232, Keyboard</p></li>
                                                                            <li><p> IP 42</p></li>
                                                                    </ul>
                                <p class="contact">
                                    									<span class="contactTxt">Liên hệ: 0978 384 842</span>
								</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
                        <div class="intro-product" id="product-14875">
                <div class="container">
                    <div class="content-intro-product">
                        <div class="before"></div>
                        <div class="after"></div>
                        <div class="row" style="position: relative">
                            <i class="fa fa-times" aria-hidden="true"></i>
                            <div class="col-xs-3">
                                <img src="./Giaodienphanmem/daudocyouje.jpg" align="center" alt="" width="" height="">
                            </div>
                            <div class="col-xs-9">
                                <h3>Máy quét mã vạch đa tia YOUJIE YJ5900</h3>
                                                                    <p>2.720.000 <span>đ</span></p>
                                                                        <p class="code-old">
                                        3.400.000                                        <span>đ</span>
                                                                                    <span class="colde-sale">20%</span>
                                                                            </p>
                                                                                                    <ul class="">
                                    <li><p> Bảo hành 24 tháng</p></li>
                                                                            <li><p> Tốc độ quét: 1650 scans/second</p></li>
                                                                            <li><p> Quét cầm tay hoặc tự động</p></li>
                                                                            <li><p> Số tia quét: Đa tia</p></li>
                                                                            <li><p> Kích thước: 87 mm x 98mm x 170mm (L x W x H)</p></li>
                                                                            <li><p> Cổng kết nối: USB , RS232 ,Keyboard Wedge</p></li>
                                                                            <li><p> IP: 42</p></li>
                                                                    </ul>
                                <p class="contact">
                                    									<span class="contactTxt">Liên hệ: 0978 384 842</span>
								</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
                        <div class="intro-product" id="product-13866">
                <div class="container">
                    <div class="content-intro-product">
                        <div class="before"></div>
                        <div class="after"></div>
                        <div class="row" style="position: relative">
                            <i class="fa fa-times" aria-hidden="true"></i>
                            <div class="col-xs-3">
                                <img src="./Giaodienphanmem/prp085.jpg" align="center" alt="" width="" height="">
                            </div>
                            <div class="col-xs-9">
                                <h3>Máy in hóa đơn Birch PRP 085</h3>
                                                                    <p>1.600.000 <span>đ</span></p>
                                                                        <p class="code-old">
                                        2.000.000                                        <span>đ</span>
                                                                                    <span class="colde-sale">15%</span>
                                                                            </p>
                                                                                                    <ul class="">
                                    <li><p> Bảo hành 12 tháng</p></li>
                                                                            <li><p> 145 (W) 145mm (H) Trọng lượng 2K</p></li>
                                                                            <li><p> Tự động cắt giấy. In trên giấy nhiệt K80 cổng kết nối USB</p></li>
                                                                            <li><p> Phương pháp in nhệt trực tiếp</p></li>
                                                                            <li><p> Nguồn điện cung cấp đầu vào 100V AC-240V AC, 50-60Hz</p></li>
                                                                            <li><p> Có thể kết nối với két đựng tiền</p></li>
                                                                            <li><p> Tốc độ in 220mm/s Kích thước 200 (L) </p></li>
                                                                    </ul>
                                <p class="contact">
                                    									<span class="contactTxt">Liên hệ: 0978 384 842</span>
								</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
                        <div class="intro-product" id="product-13878">
                <div class="container">
                    <div class="content-intro-product">
                        <div class="before"></div>
                        <div class="after"></div>
                        <div class="row" style="position: relative">
                            <i class="fa fa-times" aria-hidden="true"></i>
                            <div class="col-xs-3">
                                <img src="./Giaodienphanmem/C2030.jpg" align="center" alt="" width="" height="">
                            </div>
                            <div class="col-xs-9">
                                <h3>Máy in hóa đơn Birch C230</h3>
                                                                    <p>
                                                                            </p><p>
                                            1.700.000                                            <span>đ</span>
                                        </p>
                                                                        <p></p>
                                                                <ul class="">
                                    <li><p> Bảo hành 12 tháng</p></li>
                                                                            <li><p> 145 (W) 145mm (H) Trọng lượng 2K</p></li>
                                                                            <li><p> Tự động cắt giấy. In trên giấy nhiệt K80 cổng kết nối USB</p></li>
                                                                            <li><p> Phương pháp in nhệt trực tiếp</p></li>
                                                                            <li><p> Nguồn điện cung cấp đầu vào 100V AC-240V AC, 50-60Hz</p></li>
                                                                            <li><p> Có thể kết nối với két đựng tiền</p></li>
                                                                            <li><p> Tốc độ in 220mm/s Kích thước 200 (L) </p></li>
                                              </ul>
                                <p class="contact">
                                    									<span class="contactTxt">Liên hệ: 0978 384 842 </span>
								</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
                        <div class="intro-product" id="product-13886">
                <div class="container">
                    <div class="content-intro-product">
                        <div class="before"></div>
                        <div class="after"></div>
                        <div class="row" style="position: relative">
                            <i class="fa fa-times" aria-hidden="true"></i>
                            <div class="col-xs-3">
                                <img src="./Giaodienphanmem/Godexg500.jpg" align="center" alt="" width="" height="">
                            </div>
                            <div class="col-xs-9">
                                <h3>Máy in mã vạch Godex G500</h3>
                                                                    <p>
                                                                            </p><p>
                                           3.990.000                                            <span>đ</span>
                                        </p>
                                                                        <p></p>
                                                                <ul class="">
                                    <li><p> Bảo hành 12 tháng</p></li>
                                                                            <li><p> Độ phân giải: 203 dpi (8 dot/mm)</p></li>
                                                                            <li><p> Phương pháp in: In truyền nhiệt/ in truyền nhiệt trực tiếp  </p></li>
                                                                            <li><p> Mực in sử dụng: Ribbon: Wax, wax/resin, resin</p></li>
                                                                            <li><p> Tốc độ in tối đa: 5 IPS (127 mm) /second</p></li>
                                                                            <li><p> Bộ nhớ: 8MB Flash, SDRAM 16MB</p></li>
                                                                            <li><p> Cổng kết nối hệ thống: usb2.0, Parallel; usb2.0, serial và Ethernet</p></li>
                                                                            <li><p> Điện năng yêu cầu: Auto Switching 100-240VAC, 50-60Hz.</p></li>
                                                                    </ul>
                                <p class="contact">
                                    									<span class="contactTxt">Liên hệ: 0978 384 842</span>
								</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
                        <div class="intro-product" id="product-13876">
                <div class="container">
                    <div class="content-intro-product">
                        <div class="before"></div>
                        <div class="after"></div>
                        <div class="row" style="position: relative">
                            <i class="fa fa-times" aria-hidden="true"></i>
                            <div class="col-xs-3">
                                <img src="./Giaodienphanmem/CW-1000C.jpg" align="center" alt="" width="" height="">
                            </div>
                            <div class="col-xs-9">
                                <h3>Cổng an ninh siêu thị: CW-1000C</h3>
                                                                    <p>
                                                                            Giá liên hệ
                                                                        </p>
                                                                <ul class="">
                                    <li><p> Bảo hành </p></li>
                                                                            <li><p> Model: CW -1000C </p></li>
                                                                            <li><p> Tần số sóng: RF 8.2MHz </p></li>
                                                                            <li><p> Khoảng cách tem mềm: Tem mềm nhỏ: 1.2m</p></li>
                                                                            <li><p> Khoảng cách tem cứng: Tem cứng loại nhỏ: 1.4m - loại to 1.6m</p></li>
                                                                            <li><p> Chất liệu: Hợp kim nhôm</p></li>
                                                                            <li><p> Thiết bị gồm :02 thanh, một thanh thu và  một thanh phát , 01 bộ nguồn </p></li>
                                                                            <li><p> Màu sắc: Bạc trắng </p></li>
                                                                            <li><p> Điện áp sử dụng: 220/230V, 15W </p></li>
                                                                            <li><p> Kích thước vật lý: 165 x 32 x 9 (cm)</p></li>

                                                                    </ul>
                                <p class="contact">
                                    									<span class="contactTxt">Liên hệ: 0978 384 842</span>
								</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
                        <div class="intro-product" id="product-13881">
                <div class="container">
                    <div class="content-intro-product">
                        <div class="before"></div>
                        <div class="after"></div>
                        <div class="row" style="position: relative">
                            <i class="fa fa-times" aria-hidden="true"></i>
                            <div class="col-xs-3">
                                <img src="./Giaodienphanmem/Giayin.jpg" align="center" alt="" width="" height="">
                            </div>
                            <div class="col-xs-9">
                                <h3>Giấy in hóa đơn nhiệt k80 - in mã vạch decanl cuộn</h3>
                                                                    <p>
                                                                            </p><p>
                                            8000                                            <span>đ</span>
                                        </p>
                                                                        <p></p>
                                                                <ul class="">
                                    <li><p> Bảo hành </p></li>
                                                                            <li><p> Giấy in mã vạch cuộn đi kèm máy in mã vạch</p></li>
                                                                            <li><p> Giấy in hóa đơn cuộn đi kèm máy in bill</p></li>
                                                                    </ul>
                                <p class="contact">
                                    									<span class="contactTxt">Liên hệ: 0978 384 842</span>
								</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
                        <div class="intro-product" id="product-13883">
                <div class="container">
                    <div class="content-intro-product">
                        <div class="before"></div>
                        <div class="after"></div>
                        <div class="row" style="position: relative">
                            <i class="fa fa-times" aria-hidden="true"></i>
                            <div class="col-xs-3">
                                <img src="./Giaodienphanmem/ketsat.jpg" align="center" alt="" width="" height="">
                            </div>
                            <div class="col-xs-9">
                                <h3>Ngăn kéo đựng tiền RT-410</h3>
                                                                    <p>
                                                                            </p><p>
                                            1.490.000                                            <span>đ</span>
                                        </p>
                                                                        <p></p>
                                                                <ul class="">
                                    <li><p> Bảo hành 12 tháng</p></li>
                                                                            <li><p> Chất liệu từ thép dày, mạ kẽm, sơn tĩnh điện</p></li>
                                                                            <li><p> 5 ngăn tiền giấy + 4 ngăn tiền giấy kiểu sấp</p></li>
                                                                            <li><p> Tương thích : Kết nối bất kỳ hệ thống POS hoặc máy tính tiền</p></li>
                                                                            <li><p> Độ bền: Tối thiểu 1 triệu lần đóng mở</p></li>
                                                                            <li><p> Hỗ trợ in cổng RJ11, 12v hoặc 24v</p></li>
                                                                            <li><p> Hoạt động : Mở bằng lệnh hoặc bằng khóa cơ</p></li>
                                                                            <li><p> Kích thước (mm): 410(ngang) x 420(sâu) x 100(cao) (chưa bao gồm chân đế)</p></li>
                                                                            <li><p> Trọng lượng: 7.8 kg (cả hộp)</p></li>
                                                                    </ul>
                                <p class="contact">
                                    									<span class="contactTxt">Liên hệ: 0978 384 842</span>
								</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
                    </div>


   
  <div class="bottomBox">
    <div class="container">
        <div class="row">
            <div class="col-xs-12 col-md-2 column-footer footer_company">
                <h4><span>Công ty</span></h4>
                <ul>
                    <li><a href="" title="Về Sky Eagle Soft" rel="nofollow">Về Tin Học Việt Nam</a></li>
                    <li><a href="http://tinhocvietnam.com/chitietsanpham/khachhang" title="Khách hàng" rel="nofollow">Khách hàng</a></li>
                    <li><a href="http://tinhocvietnam.com/chitietsanpham/dieukhoansudung" title="Điều khoản sử dụng" rel="nofollow">Điều khoản sử dụng</a></li>
                    <li><a href="http://tinhocvietnam.com/chitietsanpham/lienhe/" title="Liên hệ" rel="nofollow">Liên hệ</a></li>
                </ul>
            </div>
            <div class="col-xs-12 col-md-2 column-footer column-footer-1">
                <h4>Ngành hàng</h4>
                <ul class="ul-1">
                    <li><a href="http://tinhocvietnam.com/chitietsanpham/thoitrang" title="Thời trang">Thời trang</a></li>
                    <li><a href="http://tinhocvietnam.com/chitietsanpham/nhahang" title="Bar - Cafe - Nhà hàng">Bar - Cafe - Nhà hàng</a></li>
                    <li><a href="http://tinhocvietnam.com/chitietsanpham/dienthoai" title="Điện thoại &amp; Điện máy">Điện thoại &amp; Điện máy</a></li>
                    <li><a href="http://tinhocvietnam.com/chitietsanpham/sieuthimini" title="Siêu thị mini">Siêu thị mini</a></li>
                    <li><a href="http://tinhocvietnam.com/chitietsanpham/quatang" title="Hoa &amp; Quà tặng">Hoa &amp; Quà tặng</a></li>
                    <li><a href="http://tinhocvietnam.com/chitietsanpham/taphoa" title="Tạp hóa">Tạp hóa</a></li>
                    <li><a href="http://tinhocvietnam.com/chitietsanpham/noithat" title="Nội thất">Nội thất</a></li>
                </ul>
            </div>
            <div class="col-xs-12 col-md-2 column-footer column-footer-2">
                <h4>Chuỗi cửa hàng</h4>
                <ul class="ul-2">
                    <li><a href="http://tinhocvietnam.com/chitietsanpham/phutung" title="Xe, Máy &amp; Linh Kiện">Xe máy &amp; Linh Kiện</a></li>
                    <li><a href="http://tinhocvietnam.com/chitietsanpham/hieusach" title="Sách &amp; Văn phòng phẩm">Sách &amp; Văn phòng phẩm</a></li>
                    <li><a href="http://tinhocvietnam.com/chitietsanpham/vatlieuxaydung" title="Vật liệu xây dựng">Vật liệu xây dựng</a></li>
                    <li><a href="http://tinhocvietnam.com/chitietsanpham/mypham" title="Mỹ phẩm">Mỹ phẩm</a></li>
                    <li><a href="http://tinhocvietnam.com/chitietsanpham/thucpham" title="Nông sản &amp; Thực phẩm">Nông sản &amp; Thực phẩm</a></li>
                    <li><a href="http://tinhocvietnam.com/chitietsanpham/mevabe" title="Mẹ &amp; Bé">Mẹ &amp; Bé</a></li>
                    <li><a href="http://tinhocvietnam.com/chitietsanpham/nhathuoc" title="Nhà thuốc">Nhà thuốc</a></li>
                </ul>
            </div>
            <div class="col-xs-12 col-md-2 column-footer footer_support">
                <h4>Hỗ trợ</h4>
                <ul>
                    <li><a href="#" rel="nofollow">Video hướng dẫn sử dụng</a></li>
                    <li><a href="#" rel="nofollow">Câu hỏi thường gặp</a></li>
                    <li><a href="#" rel="nofollow">Wiki Tin Học Việt Nam</a></li>
                    <li><a href="#" rel="nofollow">Hướng dẫn sử dụng</a></li>
                    <li><a href="#" rel="nofollow">Blog</a></li>
                </ul>
            </div>
            <div class="col-xs-12 col-md-2 column-footer">
                <h4>Liên hệ</h4>
                <ul>
                    <li>Hotline: <span>0979 479 007</span></li>
                    <li>Email: <a class="active" href="mailto:thietbicongnghevietnam@gmail.com">thietbicongnghevietnam@gmail.com</a></li>
                    <p>Địa chỉ:</p>
                    <p class="address-footer"><span>Hà Nội</span>: 29 Phú Mỹ - Mỹ Đình - Từ Liêm - Hà Nội</p>

                </ul>
            </div>
            <div class="col-xs-12 col-md-2 column-footer box-social">
               <%-- <h4>Mạng xã hội</h4>
                <ul class="social">
                    <li><a rel="nofollow" class="fb" title="Facebook" href="#" target="_blank"><i class="fa fa-facebook"></i></a></li>
                    <li><a rel="nofollow" class="twt" title="Twitter" href="#" target="_blank"><i class="fa fa-twitter"></i></a></li>
                    <li><a rel="nofollow" class="gl" title="Google Plus" href="#" target="_blank"><i class="fa fa-google-plus"></i></a></li>
                    <li><a rel="nofollow" class="pi" title="Youtube" href="#" target="_blank"><i class="fa fa-youtube"></i></a></li>
                </ul>
                <p>© Copyright 2018 Tin Học Việt Nam.</p>--%>
            </div>
        </div>
    </div><!--End-containner-->
</div>






</div>
<!--main-page-->






<!--Start of Zopim Live Chat Script-->

<!--End of Zopim Live Chat Script-->

</div><!--End-wrapper-p-->




        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->


  <!-- /.control-sidebar -->

  <!-- Main Footer -->
  <footer class="main-footer">
    <!-- To the right -->
    <div class="float-right d-none d-sm-inline">
      Phần mềm quản lý
    </div>
    <!-- Default to the left -->
    <strong>Copyright &copy; 2014-2020 <a href="#">Phần mềm thu ngân</a>.</strong> Sky Eagle Soft.
  </footer>
</div>
<!-- ./wrapper -->

<!-- REQUIRED SCRIPTS -->

<!-- jQuery -->
<script src="../../plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="../../dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="../../dist/js/demo.js"></script>
</body>
</html>
