<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication1._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <script src="../plugins/chart.js/Chart.min.js"></script>

    <div class="wrapper">
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0 text-dark">Thống kê dữ liệu</h1>
                    </div>
                    <!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Trang chủ</a></li>
                            <li class="breadcrumb-item active">Biểu đồ</li>
                        </ol>
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </div>
        <!-- /.content-header -->

        <!-- Main content -->
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-header border-0">
                                <div class="d-flex justify-content-between">
                                    <h3 class="card-title">Báo cáo bán hàng theo ngày</h3>
                                    <a href="javascript:void(0);">View Report</a>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="d-flex">
                                    <p class="d-flex flex-column">
                                        <span class="text-bold text-lg">820</span>
                                        <span>Tổng doanh thu ngày hiện tại</span>
                                    </p>
                                    <p class="ml-auto d-flex flex-column text-right">
                                        <span class="text-success">
                                            <i class="fas fa-arrow-up"></i>12.5%
                                        </span>
                                        <span class="text-muted">Since last week</span>
                                    </p>
                                </div>
                                <!-- /.d-flex -->

                                <div class="position-relative mb-4">
                                   <%-- <canvas id="visitors-chart" height="200"></canvas>--%>
                                    <canvas id="myChart1" style="width:100%;max-width:800px"></canvas>

                                </div>

                                <div class="d-flex flex-row justify-content-end">
                                    <span class="mr-2">
                                        <i class="fas fa-square text-primary"></i>This Week
                                    </span>

                                    <span>
                                        <i class="fas fa-square text-gray"></i>Last Week
                                    </span>
                                </div>
                            </div>
                        </div>
                        <!-- /.card -->

                        <div class="card">
                            <div class="card-header border-0">
                                <h3 class="card-title">Products</h3>
                                <div class="card-tools">
                                    <a href="#" class="btn btn-tool btn-sm">
                                        <i class="fas fa-download"></i>
                                    </a>
                                    <a href="#" class="btn btn-tool btn-sm">
                                        <i class="fas fa-bars"></i>
                                    </a>
                                </div>
                            </div>
                            <div class="card-body table-responsive p-0">
                                <table class="table table-striped table-valign-middle">
                                    <thead>
                                        <tr>
                                            <th>Product</th>
                                            <th>Price</th>
                                            <th>Sales</th>
                                            <th>More</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>
                                                <img src="dist/img/default-150x150.png" alt="Product 1" class="img-circle img-size-32 mr-2">
                                                Some Product
                                            </td>
                                            <td>$13 USD</td>
                                            <td>
                                                <small class="text-success mr-1">
                                                    <i class="fas fa-arrow-up"></i>
                                                    12%
                                                </small>
                                                12,000 Sold
                                            </td>
                                            <td>
                                                <a href="#" class="text-muted">
                                                    <i class="fas fa-search"></i>
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <img src="dist/img/default-150x150.png" alt="Product 1" class="img-circle img-size-32 mr-2">
                                                Another Product
                                            </td>
                                            <td>$29 USD</td>
                                            <td>
                                                <small class="text-warning mr-1">
                                                    <i class="fas fa-arrow-down"></i>
                                                    0.5%
                                                </small>
                                                123,234 Sold
                                            </td>
                                            <td>
                                                <a href="#" class="text-muted">
                                                    <i class="fas fa-search"></i>
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <img src="dist/img/default-150x150.png" alt="Product 1" class="img-circle img-size-32 mr-2">
                                                Amazing Product
                                            </td>
                                            <td>$1,230 USD</td>
                                            <td>
                                                <small class="text-danger mr-1">
                                                    <i class="fas fa-arrow-down"></i>
                                                    3%
                                                </small>
                                                198 Sold
                                            </td>
                                            <td>
                                                <a href="#" class="text-muted">
                                                    <i class="fas fa-search"></i>
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <img src="dist/img/default-150x150.png" alt="Product 1" class="img-circle img-size-32 mr-2">
                                                Perfect Item
                      <span class="badge bg-danger">NEW</span>
                                            </td>
                                            <td>$199 USD</td>
                                            <td>
                                                <small class="text-success mr-1">
                                                    <i class="fas fa-arrow-up"></i>
                                                    63%
                                                </small>
                                                87 Sold
                                            </td>
                                            <td>
                                                <a href="#" class="text-muted">
                                                    <i class="fas fa-search"></i>
                                                </a>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <!-- /.card -->
                    </div>
                    <!-- /.col-md-6 -->
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-header border-0">
                                <div class="d-flex justify-content-between">
                                    <h3 class="card-title">Báo cáo bán hàng theo tháng</h3>
                                    <a href="javascript:void(0);">View Report</a>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="d-flex">
                                    <p class="d-flex flex-column">
                                        <span class="text-bold text-lg">$18,230.00</span>
                                        <span>Tổng doanh thu theo quý</span>
                                    </p>
                                    <p class="ml-auto d-flex flex-column text-right">
                                        <span class="text-success">
                                            <i class="fas fa-arrow-up"></i>33.1%
                                        </span>
                                        <span class="text-muted">Since last month</span>
                                    </p>
                                </div>
                                <!-- /.d-flex -->

                                <div class="position-relative mb-4">
                                    <%--<canvas id="sales-chart" height="200"></canvas> minh edit chart 03.09.2024   --%>
                                    <%-- bieu do doanh thu theo thang dat o day
                    thang 7, thang 8--%>
                                    <canvas id="myChart" style="width:100%;max-width:800px"></canvas>

                                </div>

                                <div class="d-flex flex-row justify-content-end">
                                    <span class="mr-2">
                                        <i class="fas fa-square text-primary"></i>This year
                                    </span>

                                    <span>
                                        <i class="fas fa-square text-gray"></i>Last year
                                    </span>
                                </div>
                            </div>
                        </div>
                        <!-- /.card -->

                        <div class="card">
                            <div class="card-header border-0">
                                <h3 class="card-title">Online Store Overview</h3>
                                <div class="card-tools">
                                    <a href="#" class="btn btn-sm btn-tool">
                                        <i class="fas fa-download"></i>
                                    </a>
                                    <a href="#" class="btn btn-sm btn-tool">
                                        <i class="fas fa-bars"></i>
                                    </a>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="d-flex justify-content-between align-items-center border-bottom mb-3">
                                    <p class="text-success text-xl">
                                        <i class="ion ion-ios-refresh-empty"></i>
                                    </p>
                                    <p class="d-flex flex-column text-right">
                                        <span class="font-weight-bold">
                                            <i class="ion ion-android-arrow-up text-success"></i>12%
                                        </span>
                                        <span class="text-muted">CONVERSION RATE</span>
                                    </p>
                                </div>
                                <!-- /.d-flex -->
                                <div class="d-flex justify-content-between align-items-center border-bottom mb-3">
                                    <p class="text-warning text-xl">
                                        <i class="ion ion-ios-cart-outline"></i>
                                    </p>
                                    <p class="d-flex flex-column text-right">
                                        <span class="font-weight-bold">
                                            <i class="ion ion-android-arrow-up text-warning"></i>0.8%
                                        </span>
                                        <span class="text-muted">SALES RATE</span>
                                    </p>
                                </div>
                                <!-- /.d-flex -->
                                <div class="d-flex justify-content-between align-items-center mb-0">
                                    <p class="text-danger text-xl">
                                        <i class="ion ion-ios-people-outline"></i>
                                    </p>
                                    <p class="d-flex flex-column text-right">
                                        <span class="font-weight-bold">
                                            <i class="ion ion-android-arrow-down text-danger"></i>1%
                                        </span>
                                        <span class="text-muted">REGISTRATION RATE</span>
                                    </p>
                                </div>
                                <!-- /.d-flex -->
                            </div>
                        </div>
                    </div>
                    <!-- /.col-md-6 -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </div>
        <!-- /.content -->
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Dữ liệu từ code-behind
            const data = chartData;

            // Xử lý dữ liệu
            const labels = data.map(item => item.DayName);
            const revenue = data.map(item => item.Revenue);

            // Tạo biểu đồ
            new Chart("myChart1", {
                type: "line",
                data: {
                    labels: labels,
                    datasets: [{ 
                        data: revenue,
                        borderColor: "blue",
                        fill: false
                    }]
                },
                options: {
                    //responsive: true,
                    legend: { display: false },
                        title: {
                            display: true,
                            text: 'Doanh số daily thang hien tai'
                        },
                    
                    scales: {
                        x: {
                            title: {
                                display: true,
                                text: 'Date'
                            },
                            ticks: {
                                autoSkip: true,
                                maxTicksLimit: 10
                            }
                        },
                        y: {
                            title: {
                                display: true,
                                text: 'Revenue'
                            }
                        }
                    }
                }
            });
        });
    </script>

    <script>
        //var xValues = ["Thang 1", "Thang 2", "Thang 3", "Thang 4", "Thang 5", "Thang 6","Thang 7","Thang 8","Thang 9","Thang 10","Thang 11","Thang 12"];
        //var yValues = [55, 49, 44, 24, 15, 17, 18, 19, 20, 14, 16, 18];
        //var barColors = ["red", "green", "blue", "orange", "brown","gray","gray","gray","gray","gray","gray","gray"];

        //new Chart("myChart", {
        //    type: "bar",
        //    data: {
        //        labels: xValues,
        //        datasets: [{
        //            backgroundColor: barColors,
        //            data: yValues
        //        }]
        //    },
        //    options: {
        //        legend: { display: false },
        //        title: {
        //            display: true,
        //            text: "Doanh so nam 2024"
        //        }
        //    }
        //});

        window.onload = function () {
            var xValues = <%= GetMonthData() %>;
            var yValues = <%= GetRevenueData() %>;

            // Mảng màu cho từng cột
            var barColors = [
                'rgba(255, 99, 132, 0.2)', // Màu đỏ nhạt
                'rgba(54, 162, 235, 0.2)', // Màu xanh dương nhạt
                'rgba(255, 206, 86, 0.2)', // Màu vàng nhạt
                'rgba(75, 192, 192, 0.2)', // Màu xanh lá nhạt
                'rgba(153, 102, 255, 0.2)', // Màu tím nhạt
                'rgba(255, 159, 64, 0.2)', // Màu cam nhạt
                'rgba(255, 99, 132, 0.2)', // Màu đỏ nhạt
                'rgba(54, 162, 235, 0.2)', // Màu xanh dương nhạt
                'rgba(255, 206, 86, 0.2)', // Màu vàng nhạt
                'rgba(75, 192, 192, 0.2)', // Màu xanh lá nhạt
                'rgba(153, 102, 255, 0.2)', // Màu tím nhạt
                'rgba(255, 159, 64, 0.2)'  // Màu cam nhạt
            ];

            var ctx = document.getElementById('myChart').getContext('2d');
            new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: xValues,
                    datasets: [{
                        backgroundColor: barColors, // Đặt màu cho từng cột
                        borderColor: 'rgba(0, 0, 0, 0.1)', // Màu viền của cột
                        borderWidth: 1, // Độ dày của viền
                        data: yValues
                    }]
                },
                options: {
                   legend: { display: false },
                        title: {
                            display: true,
                            text: 'Doanh số năm 2024'
                        },
                    
                    scales: {
                        x: {
                            title: {
                                display: true,
                                text: 'Tháng'
                            }
                        },
                        y: {
                            title: {
                                display: true,
                                text: 'Doanh thu (VNĐ)'
                            }
                        }
                    }
                }
            });
        }

    </script>


</asp:Content>
