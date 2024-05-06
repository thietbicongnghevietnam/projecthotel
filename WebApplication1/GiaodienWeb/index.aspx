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

    <%--<link href="./Giaodienphanmem/owl.carousel.min.css" type="text/css" rel="stylesheet">
    <link href="./Giaodienphanmem/owl.theme.min.css" type="text/css" rel="stylesheet">
    <link href="./Giaodienphanmem/bootstrap.min.css" type="text/css" rel="stylesheet">--%>
    <!--<link href="/static/css/font/css/font-awesome.min.css" type="text/css" rel="stylesheet" />-->
   <%-- <link href="./Giaodienphanmem/style.css" rel="stylesheet">--%>
  <%--  <link href="./Giaodienphanmem/style-kv222.min.css" rel="stylesheet">--%>
    <link rel="stylesheet" type="text/css" href="./Giaodienphanmem/select2.css">
    <link href="./Giaodienphanmem/reponsive.min.css" rel="stylesheet">

    <style type="text/css">


.box-introduces {
    text-align: center
}

    .box-introduces .register {
        margin-top: 30px
    }

    .box-introduces .row {
        margin-right: -40px;
        margin-left: -40px
    }

    .box-introduces h2 {
        padding: 50px 0 35px 0
    }

    .box-introduces .list-introduces {
        padding-right: 40px;
        padding-left: 40px
    }

        .box-introduces .list-introduces i {
            height: 95px
        }

        .box-introduces .list-introduces .text-introduces h3 {
            font-size: 18px;
            padding-bottom: 10px
        }

        .box-introduces .list-introduces .text-introduces p {
            padding-bottom: 10px;
            text-align: justify
        }

.box-industry {
    text-align: center
}

    .box-industry .box-title {
        padding: 50px 0 35px 0
    }

    .box-industry .box-list-industry .list-industry {
        margin-bottom: 20px;
        width: 20%
    }

        .box-industry .box-list-industry .list-industry .list {
            border: 1px solid #c9c9c9;
            -moz-border-radius: 3px;
            -webkit-border-radius: 3px;
            -khtml-border-radius: 3px;
            border-radius: 3px;
            display: block;
            color: #111;
            height: 145px;
            padding-top: 30px
        }

            .box-industry .box-list-industry .list-industry .list i {
                height: 55px
            }

            .box-industry .box-list-industry .list-industry .list img {
                max-width: 100%;
                overflow: hidden
            }

            .box-industry .box-list-industry .list-industry .list:hover {
                border: 1px solid #4c9d2f;
                color: #4c9d2f
            }

            .box-industry .box-list-industry .list-industry .list h3 {
                padding: 15px 0 0 0;
                font-family: font-helveticaNeueRegular;
                font-size: 14px
            }

.box-customer {
    background-color: #eee
}

    .box-customer .list-customer .img-customer {
        border: 1px solid #c9c9c9;
        -moz-border-radius: 3px;
        -webkit-border-radius: 3px;
        -khtml-border-radius: 3px;
        border-radius: 3px;
        display: block;
        color: #111;
        height: 145px;
        overflow: hidden;
        background-color: #fff
    }

        .box-customer .list-customer .img-customer img {
            max-width: 100%
        }

    .box-customer .list-customer .content-customer a {
        padding: 20px 0 0 0;
        color: #666;
        display: block
    }

    .box-customer .list-customer:hover .content-customer a {
        color: #4c9d2f
    }

    .box-customer .list-customer:hover .img-customer {
        border: 1px solid #4c9d2f
    }

    .box-customer .btn {
        margin: 15px 0 50px 0
    }

    .box-customer .box-list-industry .list-industry .list-customer:hover p {
        color: #111
    }

    .box-customer .box-list-industry .list-industry .list-customer .img-customer {
        background-color: #f7f7f7
    }

        .box-customer .box-list-industry .list-industry .list-customer .img-customer img {
            margin-top: 20px
        }

    .box-customer .box-list-industry .list-industry .list-customer .content-customer h4 {
        color: #666;
        padding-bottom: 0;
        margin-top: 15px;
        font-family: font-helveticaNeueRegular;
        font-size: 14px
    }

.box-news h3.title {
    padding: 50px 0 35px 0
}

.box-news .box-list-news {
    width: 80%;
    padding-top: 33px;
    text-align: center
}

    .box-news .box-list-news .list-new {
        height: 170px;
        overflow: hidden;
        margin-bottom: 35px
    }

        .box-news .box-list-news .list-new .img-new {
            float: left;
            width: 170px
        }

            .box-news .box-list-news .list-new .img-new img {
                max-width: 100%;
                overflow: hidden
            }

        .box-news .box-list-news .list-new .content-new {
            overflow: hidden;
            padding-left: 20px;
            padding-right: 50px;
            position: relative;
            height: 100%;
            text-align: left
        }

            .box-news .box-list-news .list-new .content-new h4 {
                font-family: font-helveticaNeueRegular;
                line-height: 18px
            }

                .box-news .box-list-news .list-new .content-new h4 a {
                    color: #111;
                    font-size: 16px
                }

                    .box-news .box-list-news .list-new .content-new h4 a:hover {
                        color: #797979
                    }

            .box-news .box-list-news .list-new .content-new p {
                color: #666;
                font-size: 12px;
                text-align: justify
            }

            .box-news .box-list-news .list-new .content-new .box-social {
                position: absolute;
                bottom: 0;
                left: 20px
            }

    .box-news .box-list-news .list-new-btn-1 {
        text-align: left
    }

        .box-news .box-list-news .list-new-btn-1 .btn {
            margin: 15px 0 50px 0
        }

.box-news .box-write {
    width: 20%;
    text-align: center
}

    .box-news .box-write ul li {
        border: 1px solid #dfdfdf;
        -moz-border-radius: 3px;
        -webkit-border-radius: 3px;
        -khtml-border-radius: 3px;
        border-radius: 3px;
        height: 68px;
        border-top: none
    }

        .box-news .box-write ul li:first-child {
            border-top: 1px solid #dfdfdf
        }

        .box-news .box-write ul li img {
            padding-top: 15px;
            max-width: 100%
        }

        .box-news .box-write ul li:hover {
            background-color: #f3f3f3
        }

.box-kiotviet-1 {
    background-color: #f5f5f5;
    padding-top: 50px
}

    .box-kiotviet-1 .content-box-kiotviet {
        margin-top: -100px;
        background: url(../images/Anh-tap-the.png) no-repeat top center;
        min-height: 644px
    }

.box-kiotviet {
    text-align: center;
    border-top: 5px solid #dfdfdf;
    display: none;
    padding-bottom: 35px
}

    .box-kiotviet .box-title {
        padding: 50px 0 35px 0
    }

        .box-kiotviet .box-title h3 {
            padding-bottom: 15px
        }

        .box-kiotviet .box-title p {
            padding-bottom: 0
        }

    .box-kiotviet .row {
        margin-left: -10px;
        margin-right: -10px
    }

        .box-kiotviet .row .col-lg-3 {
            padding-left: 10px;
            padding-right: 10px
        }

        .box-kiotviet .row .list-kiotviet {
            border: 1px solid #dfdfdf;
            cursor: pointer;
            padding: 10px;
            -webkit-transition: .2s all ease-in-out;
            -moz-transition: .2s all ease-in-out;
            -ms-transition: .2s all ease-in-out;
            -o-transition: .2s all ease-in-out;
            height: 480px;
            overflow: hidden;
            position: relative
        }

            .box-kiotviet .row .list-kiotviet:after {
                content: '';
                position: absolute;
                bottom: 0;
                left: 0;
                right: 0;
                height: 5px;
                background-color: #727272
            }

            .box-kiotviet .row .list-kiotviet:hover {
                -moz-box-shadow: 0 0 10px rgba(0,0,0,.27);
                -webkit-box-shadow: 0 0 10px rgba(0,0,0,.27);
                box-shadow: 0 0 10px rgba(0,0,0,.27)
            }

                .box-kiotviet .row .list-kiotviet:hover h4 {
                    color: #4c9d2f
                }

                .box-kiotviet .row .list-kiotviet:hover:after {
                    background-color: #4c9d2f
                }

            .box-kiotviet .row .list-kiotviet .img-kiotviet {
                overflow: hidden
            }

                .box-kiotviet .row .list-kiotviet .img-kiotviet img {
                    width: 100%;
                    -webkit-filter: grayscale(100%);
                    -moz-filter: grayscale(100%);
                    -webkit-transition: .2s all ease-in-out;
                    -moz-transition: .2s all ease-in-out
                }

            .box-kiotviet .row .list-kiotviet:hover img {
                -webkit-filter: inherit !important;
                -moz-filter: inherit !important;
                filter: inherit !important
            }

        .box-kiotviet .row .content-kiotviet {
            padding: 15px 10px;
            text-align: left
        }

            .box-kiotviet .row .content-kiotviet h4 {
                color: #333;
                text-transform: uppercase;
                font-size: 14px;
                padding-bottom: 0
            }

            .box-kiotviet .row .content-kiotviet span {
                text-transform: uppercase;
                color: #a2a2a2;
                font-size: 12px;
                padding-bottom: 15px;
                display: block
            }

            .box-kiotviet .row .content-kiotviet p {
                padding-bottom: 0;
                text-align: justify
            }

    .box-kiotviet .btn {
        margin-top: 15px
    }


</style>

    <style>
.phi-dich-vu .banner{
margin-top:60px !important;
}
body.single-post .lg-content > span {
margin-top:17px
};
</style>


<style>
.phi-dich-vu .banner{
margin-top:60px !important;
}
body.single-post .lg-content > span {
margin-top:17px
};
</style>

</head>
<body class="hold-transition sidebar-collapse layout-top-nav">
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
          <li class="nav-item">
            <a href="#" class="nav-link">Khách hàng</a>
          </li>
            <li class="nav-item">
            <a href="#" class="nav-link">Khách hàng</a>
          </li>
             <li class="nav-item">
            <a href="#" class="nav-link">Hỗ trợ</a>
          </li>
          <li class="nav-item dropdown">
            <a id="dropdownSubMenu1" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="nav-link dropdown-toggle">Phần Mềm quản lý</a>
            <ul aria-labelledby="dropdownSubMenu1" class="dropdown-menu border-0 shadow">
              <li><a href="#" class="dropdown-item">Phần mềm quản lý nhà hàng</a></li>
              <li><a href="#" class="dropdown-item">Phần mềm quản lý khách sạn</a></li>
                <li><a href="#" class="dropdown-item">Phần mềm quản lý siêu thị</a></li>
                <li><a href="#" class="dropdown-item">Phần mềm quản lý Karaoke</a></li>

              <li class="dropdown-divider"></li>

              <!-- Level two dropdown-->
              <li class="dropdown-submenu dropdown-hover">
                <a id="dropdownSubMenu2" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="dropdown-item dropdown-toggle">Phần mềm quản lý bán hàng</a>
                <ul aria-labelledby="dropdownSubMenu2" class="dropdown-menu border-0 shadow">
                  <li>
                    <a tabindex="-1" href="#" class="dropdown-item">Quản lý bán hàng phụ tùng ô tô</a>
                  </li>

                  <!-- Level three dropdown-->
                  <li class="dropdown-submenu">
                    <a id="dropdownSubMenu3" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="dropdown-item dropdown-toggle">level 2</a>
                    <ul aria-labelledby="dropdownSubMenu3" class="dropdown-menu border-0 shadow">
                      <li><a href="#" class="dropdown-item">3rd level</a></li>
                      <li><a href="#" class="dropdown-item">3rd level</a></li>
                    </ul>
                  </li>
                  <!-- End Level three -->

                  <li><a href="#" class="dropdown-item">level 2</a></li>
                  <li><a href="#" class="dropdown-item">level 2</a></li>
                </ul>
              </li>
              <!-- End Level two -->
            </ul>
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

  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="../../index3.html" class="brand-link">
      <img src="../../dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
      <span class="brand-text font-weight-light">AdminLTE 3</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
          <img src="../../dist/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">
        </div>
        <div class="info">
          <a href="#" class="d-block">Alexander Pierce</a>
        </div>
      </div>

      <!-- SidebarSearch Form -->
      <div class="form-inline">
        <div class="input-group" data-widget="sidebar-search">
          <input class="form-control form-control-sidebar" type="search" placeholder="Search" aria-label="Search">
          <div class="input-group-append">
            <button class="btn btn-sidebar">
              <i class="fas fa-search fa-fw"></i>
            </button>
          </div>
        </div>
      </div>

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>
                Dashboard
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="../../index.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Dashboard v1</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../../index2.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Dashboard v2</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../../index3.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Dashboard v3</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item">
            <a href="../widgets.html" class="nav-link">
              <i class="nav-icon fas fa-th"></i>
              <p>
                Widgets
                <span class="right badge badge-danger">New</span>
              </p>
            </a>
          </li>
          <li class="nav-item menu-open">
            <a href="#" class="nav-link active">
              <i class="nav-icon fas fa-copy"></i>
              <p>
                Layout Options
                <i class="fas fa-angle-left right"></i>
                <span class="badge badge-info right">6</span>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="../layout/top-nav.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Top Navigation</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../layout/top-nav-sidebar.html" class="nav-link active">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Top Navigation + Sidebar</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../layout/boxed.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Boxed</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../layout/fixed-sidebar.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Fixed Sidebar</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../layout/fixed-sidebar-custom.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Fixed Sidebar <small>+ Custom Area</small></p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../layout/fixed-topnav.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Fixed Navbar</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../layout/fixed-footer.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Fixed Footer</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../layout/collapsed-sidebar.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Collapsed Sidebar</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-chart-pie"></i>
              <p>
                Charts
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="../charts/chartjs.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>ChartJS</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../charts/flot.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Flot</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../charts/inline.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Inline</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-tree"></i>
              <p>
                UI Elements
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="../UI/general.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>General</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../UI/icons.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Icons</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../UI/buttons.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Buttons</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../UI/sliders.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Sliders</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../UI/modals.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Modals & Alerts</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../UI/navbar.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Navbar & Tabs</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../UI/timeline.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Timeline</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../UI/ribbons.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Ribbons</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-edit"></i>
              <p>
                Forms
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="../forms/general.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>General Elements</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../forms/advanced.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Advanced Elements</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../forms/editors.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Editors</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../forms/validation.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Validation</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-table"></i>
              <p>
                Tables
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="../tables/simple.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Simple Tables</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../tables/data.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>DataTables</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../tables/jsgrid.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>jsGrid</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-header">EXAMPLES</li>
          <li class="nav-item">
            <a href="../calendar.html" class="nav-link">
              <i class="nav-icon far fa-calendar-alt"></i>
              <p>
                Calendar
                <span class="badge badge-info right">2</span>
              </p>
            </a>
          </li>
          <li class="nav-item">
            <a href="../gallery.html" class="nav-link">
              <i class="nav-icon far fa-image"></i>
              <p>
                Gallery
              </p>
            </a>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon far fa-envelope"></i>
              <p>
                Mailbox
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="../mailbox/mailbox.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Inbox</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../mailbox/compose.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Compose</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../mailbox/read-mail.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Read</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-book"></i>
              <p>
                Pages
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="../examples/invoice.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Invoice</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../examples/profile.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Profile</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../examples/e-commerce.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>E-commerce</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../examples/projects.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Projects</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../examples/project-add.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Project Add</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../examples/project-edit.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Project Edit</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../examples/project-detail.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Project Detail</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../examples/contacts.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Contacts</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon far fa-plus-square"></i>
              <p>
                Extras
                <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="../examples/login.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Login</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../examples/register.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Register</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../examples/forgot-password.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Forgot Password</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../examples/recover-password.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Recover Password</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../examples/lockscreen.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Lockscreen</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../examples/legacy-user-menu.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Legacy User Menu</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../examples/language-menu.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Language Menu</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../examples/404.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Error 404</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../examples/500.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Error 500</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../examples/pace.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Pace</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../examples/blank.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Blank Page</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="../../starter.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Starter Page</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-header">MISCELLANEOUS</li>
          <li class="nav-item">
            <a href="https://adminlte.io/docs/3.0/" class="nav-link">
              <i class="nav-icon fas fa-file"></i>
              <p>Documentation</p>
            </a>
          </li>
          <li class="nav-header">MULTI LEVEL EXAMPLE</li>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="fas fa-circle nav-icon"></i>
              <p>Level 1</p>
            </a>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-circle"></i>
              <p>
                Level 1
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="#" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Level 2</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="#" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>
                    Level 2
                    <i class="right fas fa-angle-left"></i>
                  </p>
                </a>
                <ul class="nav nav-treeview">
                  <li class="nav-item">
                    <a href="#" class="nav-link">
                      <i class="far fa-dot-circle nav-icon"></i>
                      <p>Level 3</p>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a href="#" class="nav-link">
                      <i class="far fa-dot-circle nav-icon"></i>
                      <p>Level 3</p>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a href="#" class="nav-link">
                      <i class="far fa-dot-circle nav-icon"></i>
                      <p>Level 3</p>
                    </a>
                  </li>
                </ul>
              </li>
              <li class="nav-item">
                <a href="#" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Level 2</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="fas fa-circle nav-icon"></i>
              <p>Level 1</p>
            </a>
          </li>
          <li class="nav-header">LABELS</li>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon far fa-circle text-danger"></i>
              <p class="text">Important</p>
            </a>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon far fa-circle text-warning"></i>
              <p>Warning</p>
            </a>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon far fa-circle text-info"></i>
              <p>Informational</p>
            </a>
          </li>
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
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
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <div class="content">
      <div class="container">
        <div class="row">
         
<div class="banner">
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-xs-6 left-banner">

            </div>
            <div class="col-md-6 col-xs-6 right-banner">
                <div class="text-banner">
                  <h1 class="title title-homepage">Phần mềm quản lý bán hàng Sky Eagle Soft</h1>
                    <p>Sky Pro - Phần mềm quản lý bán hàng phổ biến nhất với 50.000 cửa hàng đang sử dụng. Đơn giản, dễ dùng, tiết kiệm chi phí và phù hợp với hơn 20 ngành hàng khác nhau.</p>
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
                <p>Hãy chọn ngành hàng của bạn để xem các tính năng SKY_PRO  giúp bạn như thế nào.</p>
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
                <p>SKY PRO là phần mềm quản lý bán hàng phổ biến nhất hiện nay. Với gần 10.000 cửa hàng đang sử dụng và hơn 500 cửa hàng đăng ký mới mỗi tháng.</p>
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

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
    <div class="p-3">
      <h5>Title</h5>
      <p>Sidebar content</p>
    </div>
  </aside>
  <!-- /.control-sidebar -->

  <!-- Main Footer -->
  <footer class="main-footer">
    <!-- To the right -->
    <div class="float-right d-none d-sm-inline">
      Anything you want
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
