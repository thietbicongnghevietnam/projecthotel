<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderNhanVien.aspx.cs" Inherits="WebApplication1.OrderNhanVien" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <link rel="stylesheet" href="../../plugins/fontawesome-free/css/all.min.css">
    <link rel="stylesheet" href="../../plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="../../plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
    <link rel="stylesheet" href="../../dist/css/adminlte.min.css">

    <link rel="stylesheet" href="../plugins/toastr/toastr.css" />
    <link rel="stylesheet" href="../dist/css/adminlte.min.css" />
    <link rel="stylesheet" href="../plugins/jquery-ui/jquery-ui.css" />

    <link rel="stylesheet" href="../content/bootstrap.css" />


    <script src="../../plugins/jquery/jquery.min.js"></script>
    <script src="../plugins/toastr/toastr.js"></script>

    <%--   <script src="../dist/Infra/jquery-3.7.0.js"></script>--%>
    <script src="../../plugins/datatables/jquery.dataTables.min.js"></script>
    <script src="../../plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>

    <style type="text/css">
        .custom-breadcrumb {
            display: flex;
            flex-wrap: wrap;
            gap: 12px;
            background: none;
            padding: 0;
            margin: 0;
            list-style: none;
        }

        .breadcrumb-item + .breadcrumb-item::before {
            content: none !important;
        }

        .custom-breadcrumb .breadcrumb-item {
            background: linear-gradient(135deg, #4e73df, #1cc88a);
            padding: 10px 20px;
            border-radius: 12px;
            transition: 0.3s;
        }

            .custom-breadcrumb .breadcrumb-item a {
                text-decoration: none;
                color: white !important;
                font-weight: 600;
            }

            .custom-breadcrumb .breadcrumb-item:hover {
                transform: translateY(-3px);
                box-shadow: 0 5px 15px rgba(0,0,0,0.2);
            }

        .pos-menu-label {
            display: inline-block;
            padding: 10px 10px;
            background: linear-gradient(135deg, #ff512f, #dd2476);
            color: white;
            font-size: 12px;
            font-weight: 200;
            border-radius: 12px;
            letter-spacing: 1px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.2);
            cursor: default;
            transition: 0.3s;
        }

            .pos-menu-label i {
                margin-right: 8px;
            }

            /* Hiệu ứng hover nhẹ */
            .pos-menu-label:hover {
                transform: translateY(-2px);
                box-shadow: 0 6px 15px rgba(0,0,0,0.3);
            }

        /* nut ghi thuc don => nhỏ hơn */
        .btn-save-pos {
            background: linear-gradient(135deg, #28a745, #20c997);
            color: white;
            font-size: 14px; /* nhỏ hơn */
            font-weight: 600;
            padding: 8px 18px; /* giảm padding */
            border: none;
            border-radius: 8px; /* bo góc vừa phải */
            box-shadow: 0 3px 8px rgba(0,0,0,0.15);
            transition: all 0.2s ease;
            cursor: pointer;
        }

            .btn-save-pos i {
                margin-right: 6px;
            }

            /* Hover nhẹ */
            .btn-save-pos:hover {
                transform: translateY(-2px);
                box-shadow: 0 5px 12px rgba(0,0,0,0.25);
            }

            /* Khi bấm */
            .btn-save-pos:active {
                transform: scale(0.96);
            }

        /* nut thanh toan */
        .btn-pay-pos {
            background: linear-gradient(135deg, #ff9800, #ff5722);
            color: white;
            font-size: 14px;
            font-weight: 600;
            padding: 8px 18px;
            border: none;
            border-radius: 8px;
            box-shadow: 0 3px 8px rgba(0,0,0,0.15);
            transition: all 0.2s ease;
            cursor: pointer;
            margin-left: 10px;
        }

            .btn-pay-pos i {
                margin-right: 6px;
            }

            .btn-pay-pos:hover {
                transform: translateY(-2px);
                box-shadow: 0 5px 12px rgba(0,0,0,0.25);
            }

            .btn-pay-pos:active {
                transform: scale(0.96);
            }


        /* phan body ==> center Container scroll */
        .menu-scroll {
            overflow-y: auto;
            height: 700px;
        }

        /* Card đồng đều */
        .menu-card {
            display: flex;
            flex-direction: column;
            height: 100%;
            border-radius: 12px;
            transition: 0.2s;
        }

            /* Body giãn đều */
            .menu-card .card-body {
                flex: 1;
            }

            /* Footer luôn nằm dưới */
            .menu-card .card-footer {
                background: white;
            }

            /* Ảnh cố định */
            .menu-card img {
                width: 80px;
                height: 70px;
                object-fit: cover;
                border-radius: 8px;
            }

        /* Tên món cố định chiều cao để không lệch */
        .menu-title {
            min-height: 48px;
            font-size: 16px;
            font-weight: 600;
        }

        /* Hover nhẹ */
        .menu-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.15);
        }

        /* ================= phan keo tha menu => show tong tin de nhin ==================== */

        .pos-content-wrapper {
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 3px 10px rgba(0,0,0,0.1);
            margin-bottom: 15px;
        }

        /* Header có nút toggle */
        .pos-toggle-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 12px 20px;
            /*font-weight: 600;*/
            font-size: 14px;
            background: #f4f6f9;
            border-bottom: 1px solid #ddd;
        }

        .toggle-btn {
            border: none;
            background: #007bff;
            color: white;
            width: 35px;
            height: 35px;
            border-radius: 8px;
            cursor: pointer;
            transition: 0.2s;
        }

            .toggle-btn:hover {
                background: #0056b3;
            }

            .toggle-btn i {
                font-size: 14px;
            }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <div>


            <section class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-1">
                            <div class="pos-menu-label">
                                <i class="fas fa-utensils"></i>MENU
                            </div>
                        </div>

                        <div class="col-sm-11">
                            <ol class="breadcrumb custom-breadcrumb">
                                <%--<li class="breadcrumb-item active">
                                    <a href="/OrderNhanVien.aspx"><b style="color: blue; font-size: 20px;"></b>All </a>
                                </li>--%>
                                <li class="breadcrumb-item active">
                                    <a href="#"
                                        class="nhomhang-item"
                                        data-id="">
                                        <b style="color: blue; font-size: 20px;">All</b>
                                    </a>
                                </li>
                                <%foreach (System.Data.DataRow rows in dt_nhomhang.Rows)
                                    {%>
                                <li class="breadcrumb-item">
                                    <%-- <a href="/OrderNhanVien.aspx?nhomhangid=<%=rows["id"].ToString() %>"><%=rows["manhomhang"].ToString() %></a>--%>
                                    <a href="#"
                                        class="nhomhang-item"
                                        data-id="<%=rows["id"].ToString() %>">
                                        <%=rows["manhomhang"].ToString() %>
                                    </a>
                                </li>
                                <%} %>
                            </ol>
                        </div>
                    </div>
                </div>
                <!-- /.container-fluid -->
            </section>

            <div class="pos-content-wrapper">

                <div class="pos-toggle-header">
                    <%--<span>Danh sách món</span>--%>

                    <div style="float: left; width: auto;">
                        <b style="float: left; margin-left: 10px;">Tên Khu Vực :<i id="kvid"></i></b>

                        <select name="khuvucid1" id="khuvucid" class="form-control input-sm khuvucid" style="float: left; margin-left: 10px; width: 150px;"></select>

                        <b style="float: left; margin-left: 10px;">Tên bàn :<i id="tenbanid"></i></b>
                        <select name="tenban123" id="tenban123" class="form-control input-sm" style="float: left; margin-left: 10px; width: 150px;"></select>

                    </div>
                    <div>
                        <button type="button" class="btn-save-pos saveproduct">
                            <i class="fa fa-save"></i>GHI THỰC ĐƠN
                        </button>
                        <button type="button" class="btn-pay-pos thanhtoan">
                            <i class="fa fa-cash-register"></i>THANH TOÁN
                        </button>
                    </div>


                    <button type="button" id="toggleContent" class="toggle-btn">
                        <i class="fa fa-chevron-up"></i>
                    </button>
                </div>



                <section class="content" id="posContent">
                    <!-- Default box -->
                    <br />
                    <div class="card card-solid">
                        <div class="card-body pb-0">
                            <div class="row d-flex align-items-stretch" style="overflow-y: scroll; height: 700px;" id="hanghoa-container">

                                <%--<%foreach (System.Data.DataRow rows1 in dt_listhanghoa.Rows)
                                    {%>

                                <div class="col-6 col-sm-4 col-md-3 mb-3 d-flex">
                                    <div class="card menu-card w-100">
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="col-8">
                                                    <div class="menu-title">
                                                        <mh><%=rows1["tenhang"].ToString() %></mh>
                                                    </div>
                                                    <div class="text-muted">
                                                        <dg><%=rows1["giaban"].ToString() %></dg>
                                                        VNĐ
                                                    </div>
                                                </div>
                                                <div class="col-4 text-center">
                                                    <img src="<%=rows1["anh"].ToString() %>" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="card-footer text-center">

                                            <input type="number" class="quantity form-control text-center" title="Số lượng" value="1" min="1" id="quantity" name="quantity" style="width: 60px; height: 30px; float: left;" />

                                            <a href="#" class="btn btn-sm btn-primary button_addmenu" id="add_sanpham">
                                                <i class="fa fa-plus-square"></i>Add
                                            </a>

                                        </div>
                                    </div>
                                </div>

                                <%} %>--%>
                            </div>
                        </div>


                    </div>
                    <!-- /.card -->

                </section>

            </div>



<%--            <div class="row">
                <div class="col-2">
                    <label for="tongtien" style="float: left; margin-top: 5px;">Tiền hàng</label>
                    <input type="text" id="tongtienid" disabled class="form-control input-sm" name="fname" style="float: left; margin-left: 10px; font-size: 22px;" value="0">
                    <span style="float: left; padding-left: 20px; padding-top: 10px;"></span>
                </div>
            </div>--%>
            <div class="row align-items-center">
                <div class="col-md-12 d-flex align-items-center">

                    <!-- Tiền hàng -->
                    <label class="me-2 mt-1" style="margin-left:15px; margin-right:15px;">Tiền hàng</label>

                    <input type="text" id="tongtienid" disabled class="form-control me-3" style="font-size: 22px; width: 150px;" value="0" />

                    <!-- Ô số lượng chỉnh sửa -->
                    <label class="me-2" style="margin-left:15px; margin-right:15px;">Số lượng</label>

                    <input type="number" id="soluong" name="soluong" class="soluong form-control me-3" value="1" min="1" style="width: 80px;" />

                    <!-- Nút sửa -->
                    <button type="button" class="btn btn-warning btn-sm me-2" id="btnSua" style="margin-left:15px; margin-right:15px;">
                        <i class="fa fa-edit"></i>Sửa
                    </button>

                    <!-- Nút xóa -->
                    <button type="button" class="btn btn-danger btn-sm" id="btnXoa" style="margin-left:15px; margin-right:15px;">
                        <i class="fa fa-trash"></i>Xóa
                    </button>

                </div>
            </div>


            <div style="width: 100%; height: 400px; overflow-y: scroll; float: left;">
                <table class="display table table-bordered dataTable no-footer">
                    <thead>
                        <tr>
                            <th>Tên hàng</th>
                            <th>Số lượng</th>
                            <th>Đơn giá</th>
                            <th>Thành tiền</th>
                            <th>Chon</th>
                        </tr>
                    </thead>
                    <tbody id="tbnhaphang">
                    </tbody>
                </table>
            </div>

        </div>
    </form>

    <script>

        $(document).on("click", ".nhomhang-item", function (e) {
            e.preventDefault();
            var nhomhangid = $(this).data("id") || "";
            loadHangHoa(nhomhangid);
        });

        function loadHangHoa(nhomhangid) {
            $.ajax({
                type: "POST",
                url: "OrderNhanVien.aspx/GetHangHoa",
                data: JSON.stringify({ nhomhangid: nhomhangid }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",

                beforeSend: function () {
                    $("#hanghoa-container").html(
                        "<div class='text-center w-100'>Loading...</div>"
                    );
                },

                success: function (response) {
                    $("#hanghoa-container").html(response.d);
                },

                error: function () {
                    alert("Load thất bại");
                }
            });
        }

        $(document).ready(function () {
            loadHangHoa("");   // load tất cả món
        });

        //thao tac sua so luong neu can sua
        $(document).on("change", ".checkinput", function () {
            if ($(this).is(":checked")) {
                // bỏ check các dòng khác nếu chỉ muốn sửa 1 dòng
                $(".checkinput").not(this).prop("checked", false);
                var soluong = $(this)
                    .closest("tr")
                    .find("td").eq(1)
                    .text();

                $("#soluong").val(soluong);
            }
        });

        $(document).on("click", "#btnSua", function () {
                var soluongmoi = parseInt($("#soluong").val());
                var dongdangchon = $("#tbnhaphang input.checkinput:checked").closest("tr");
                if (dongdangchon.length == 0) {
                    alert("Vui lòng chọn món cần sửa");
                    return;
                }
                var dongia = parseInt(dongdangchon.find("td").eq(2).text());
                var thanhtienmoi = soluongmoi * dongia;
                // cập nhật số lượng
                dongdangchon.find("td").eq(1).text(soluongmoi);
                // cập nhật thành tiền
                dongdangchon.find("td").eq(3).text(thanhtienmoi);
                tinhLaiTongTien();
        });

        $(document).on("click", "#btnXoa", function () {

            var dongduocchon = $("#tbnhaphang input.checkinput:checked");
            if (dongduocchon.length == 0) {
                alert("Vui lòng chọn món cần xóa");
                return;
            }
            if (!confirm("Bạn có chắc muốn xóa món đã chọn?")) {
                return;
            }
            // xóa các dòng được chọn
            dongduocchon.each(function () {
                $(this).closest("tr").remove();
            });
            // cập nhật lại tổng tiền
            tinhLaiTongTien();
        });

        //function tinhLaiTongTien() {
        //    var tong = 0;
        //    $("#tbnhaphang tr").each(function () {
        //        var thanhtien = parseInt($(this).find("td").eq(3).text()) || 0;
        //        tong += thanhtien;
        //    });
        //    $("#tongtienid").val(tong);
        //}
        function tinhLaiTongTien() {
            var tong = 0;
            $("#tbnhaphang tr").each(function () {
                var thanhtien = parseInt($(this).find("td").eq(3).text()) || 0;
                tong += thanhtien;
            });
            $("#tongtienid").val(tong);
        }

    </script>

    <script type="text/javascript">

        $('.saveproduct').click(function () {
            //alert("ádfsa");
            var itemdata = {};
            var tenphong = $('#tenban123').val();
            //var tenphong = $('#dr_banphong').val();
            var tienhang = $('#tongtienid').val();
            var kieunghi = "1";//$('#MainContent_dr_hinhthucnghi').val();
            var userid = '<%=Session["username"].ToString()%>';

            //alert(tenphong);
            //alert(userid);

            if (tenphong != "") {
                $('.themthucdon').each(function () {
                    //var mahang = $(this).find('td').eq(0).text();
                    //var soluong = $(this).find('td').eq(1).text();
                    var mahang = $(this).find('td').eq(0).text() + "," + $(this).find('td').eq(2).text() + "," + $(this).find('td').eq(3).text();
                    var soluong = $(this).find('td').eq(1).text();

                    var element = {}, cart = [];
                    if (mahang != "") {
                        //items.push({'a': chk ? 1 : 0, 'c': content});
                        itemdata[mahang] = parseInt(soluong);
                        //itemdata.mahang = mahang;

                    }
                });
                var hanghoa_new = itemdata;
                var aaa = $('#tongtienid').val();

                var data = {
                    kieunghi: kieunghi,
                    tenphong: tenphong,
                    tienhang: tienhang,
                    items: JSON.stringify(itemdata),
                    userid: userid
                };

                //save hang hoa
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "Map.aspx/addthongtinhanghoa",
                    //data: JSON.stringify(data),
                    data: JSON.stringify(data),
                    dataType: "json",
                    success: function (data) {
                        alert('Hàng hóa đã được thêm thành công!');
                    },
                    error: function () {
                        //alert("No Match");
                    }
                });

            }
            else {
                alert('Bạn chưa chọn bàn!')
            }


        });

        //$('.button_addmenu').each(function () {
        $(document).on('click', '.button_addmenu', function () {
            //$(this).click(function () {

            var _mahang = $(this).parent().parent().parent().find('mh').text();
            //alert(_mahang);
            var data = { _mahang: _mahang };
            //var soluong = $(this).parent().find("input[name='quantity']").val();
            //var dongia = $(this).parent().parent().parent().find('dg').text();
            var soluong = $(this).closest('.card-footer').find("input[name='quantity']").val();

            var dongia = $(this).closest('.menu-card').find('dg').text();
            //alert(_mahang);
            //alert(soluong);
            //alert(dongia);
            //console.log(_mahang, soluong, dongia);

            var tongtienhang = parseInt($('#tongtienid').val());
            //push mahang vao array
            var gettr = [];
            $('#tbnhaphang tr').each(function () {
                var mhold = $(this).find('td').eq(0).text();
                gettr.push(mhold);
            });
            //neu mahang = phan tu trong array thi gan 1 gia tri de so sanh
            var gettr_rs = 'Insert';
            for (var i = 0; i < gettr.length; i++) {
                if (_mahang == gettr[i]) {
                    gettr_rs = 'Remove';
                }
            }
            if (gettr_rs == 'Insert') {
                //debugger;
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "Map.aspx/getthongtinmahang",
                    data: JSON.stringify(data),
                    dataType: "json",
                    success: function (data) {
                        //response(data.d);
                        var objdata = $.parseJSON(data.d);
                        //debugger;
                        //var soluong = parseInt($("#soluong").val());
                        //var dongia = parseInt(objdata['Table'][0][7]);
                        //var thanhtien = parseInt($("#soluong").val()) * parseInt(objdata['Table'][0][7]);
                        var thanhtien = parseInt(soluong) * parseInt(dongia);   //lay gia chi khi add button
                        //alert(thanhtien);
                        //alert(objdata['Table'][0][2]);
                        var newrow = '<tr class="themthucdon">' +
                            '<td id="tenhang">' + objdata['Table'][0][2] + '</td>' +
                            '<td id="soluong">' + soluong + '</td>' +
                            '<td id="giale">' + dongia + '</td>' +
                            '<td id="thanhtien">' + thanhtien + '</td>' +
                            '<td><input name="checkinput" class="checkinput" type="checkbox" value="" /></td>' +
                            '</tr>';
                        $('#tbnhaphang').append(newrow);
                        tongtienhang += thanhtien;
                        //alert(tongtienhang);
                        $('#tongtienid').val(tongtienhang);
                        //$('#thanhtoanid').val(tongtienhang);
                        //$("#MainContent_txt_doc").select();

                        //const bangchu_hienthi2 = to_vietnamese(tongtienhang);
                        //$('#bangchuid2').text(bangchu_hienthi2);
                    },
                    error: function () {
                        //alert("No Match");
                    }
                });
            }

            //neu da co ma hang trog danh sach thi remove cai cu roi insert
            if (gettr_rs == 'Remove') {
                // xoa dong
                //debugger;
                $('#tbnhaphang tr').each(function () {
                    var td = $(this).find('td').eq(0).text();

                    //var soluongmoi = $('#soluong').val();
                    var soluongmoi = soluong;
                    var soluongcu = $(this).find('td').eq(1).text();
                    var tong_soluong = parseInt(soluongmoi) + parseInt(soluongcu);

                    if (td == _mahang) {
                        $('#tbnhaphang tr').each(function () {
                            if ($(this).find('td').eq(0).text() == _mahang) {
                                var tongtiencu = parseFloat($(this).find('td').eq(3).text());
                                //alert(tongtiencu);
                                $(this).remove();
                                tongtienhang = tongtienhang - tongtiencu;
                            }
                        });
                        //alert(tongtienhang);
                        $('#tongtienid').val(tongtienhang);
                        //$('#thanhtoanid').val(tongtienhang);
                        // _$addproduct_(soluong);
                        //debugger;
                        $.ajax({
                            type: "POST",
                            contentType: "application/json; charset=utf-8",
                            url: "Map.aspx/getthongtinmahang",
                            data: JSON.stringify(data),
                            dataType: "json",
                            success: function (data) {
                                //response(data.d);
                                var objdata = $.parseJSON(data.d);
                                //debugger;
                                //var soluong = parseInt($("#soluong").val());
                                //var dongia = parseInt(objdata['Table'][0][7]);
                                //var _soluong = soluong;
                                //var _dongia = dongia;
                                var thanhtien = tong_soluong * dongia;
                                var newrow = '<tr class="themthucdon">' +
                                    '<td id="tenhang">' + objdata['Table'][0][2] + '</td>' +
                                    '<td id="soluong">' + tong_soluong + '</td>' +
                                    '<td id="giale">' + dongia + '</td>' +
                                    '<td id="thanhtien">' + thanhtien + '</td>' +
                                    '<td><input name="checkinput" class="checkinput" type="checkbox" value="" /></td>' +
                                    '</tr>';
                                $('#tbnhaphang').append(newrow);
                                tongtienhang += thanhtien;
                                $('#tongtienid').val(tongtienhang);
                                //$('#thanhtoanid').val(tongtienhang);
                                //$("#MainContent_txt_doc").select();

                                //const bangchu_hienthi2 = to_vietnamese(tongtienhang);
                                //$('#bangchuid2').text(bangchu_hienthi2);
                            },
                            error: function () {
                                //alert("No Match");
                            }
                        });

                    }
                });
            }


        });
        // });


        $('.thanhtoan').click(function () {

            var tenphong = $('#tenban123').val();
            var tongtien = $('#tongtienid').val();
            var khuvuc = $('#khuvucid').val();//Nhà hàng

            if (tenphong == "" || tenphong == "==ChonBan==") {
                alert("Bạn chưa chọn bàn!");
                return;
            }

            if (khuvuc != "Nhà hàng") {
                alert("Hoán đơn có giờ cần thanh toán ở quầy!");
                return;
            }

            if (parseInt(tongtien) <= 0) {
                alert("Chưa có món để thanh toán!");
                return;
            }

            if (confirm("Xác nhận thanh toán bàn " + tenphong + " ?")) {
                thanhtoanhoadon2(tenphong, tongtien);

                //$.ajax({
                //    type: "POST",
                //    contentType: "application/json; charset=utf-8",
                //    url: "Map.aspx/thanhtoanban",
                //    data: JSON.stringify({ tenphong: tenphong }),
                //    dataType: "json",
                //    success: function (data) {
                //        alert("Thanh toán thành công!");

                //        // Reset lại bàn
                //        $('#tbnhaphang').empty();
                //        $('#tongtienid').val(0);
                //    },
                //    error: function () {
                //        alert("Có lỗi xảy ra!");
                //    }
                //});

            }

        });

        function thanhtoanhoadon2(tenphong, tongtien) {
            //debugger;               
            var psco = tongtien;
            var psno = 0;
            var tongtienhang = tongtien;
            var tienck = 0;
            var vat2 = 0;
            var idkhachhang = '';
            //alert(idkhachhang);            
            //var hinhthucnghi = khuvuc;//$('#stylerender').val();

            var tongtienhat = 0;
            var tongtienphong = 0;

            var tenphong = tenphong;

            var itemdata = {};
            $('.themthucdon').each(function () {
                var mahang = $(this).find('td').eq(0).text() + "," + $(this).find('td').eq(2).text() + "," + $(this).find('td').eq(3).text();
                var soluong = $(this).find('td').eq(1).text();
                //bo qua dong co ma hang # (truong hop tinh tien cua karaoke)
                if (mahang != "") {
                    itemdata[mahang] = parseInt(soluong);
                }
            });
            //1b
            var data = {
                idkhachhang: idkhachhang,
                tenphong: tenphong,
                tongtienhang: tongtienhang,
                tongtienhat: tongtienhat,
                tongtienphong: tongtienphong,
                psco: psco,
                tienno: psno,
                tienck: tienck,
                items: JSON.stringify(itemdata),
                vat2: vat2,
                dongiahatphut: 0,
                soluonghatphut: 0
            };

            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "Map.aspx/khthantoan",
                //data: JSON.stringify(data),
                data: JSON.stringify(data),
                dataType: "json",
                success: function (data) {
                    //debugger;
                    if (data.d != "NG") {
                        alert('Hóa đơn thêm thành công!');

                        //lay so hoa don => IN HOA DON
                        var idsohd = data.d.split(',');
                        //var trangthai = idop[0];
                        var idsohdin = idsohd[1];
                        var tieudein = "PHIẾU THANH TOÁN";
                        //in hoa don tinh tien
                        //hoadon_printting(idsohdin, tieudein);   

                        // Reset lại bàn
                        $('#tbnhaphang').empty();
                        $('#tongtienid').val(0);

                    }
                    else {
                        //alert('Phòng/ bàn đang trống!');
                    }
                },
                error: function () {
                    //alert("No Match");
                }
            });
        };



        $(document).ready(function () {

            $('#toggleContent').click(function () {

                $('#posContent').slideToggle(200);

                var icon = $(this).find('i');

                if (icon.hasClass('fa-chevron-up')) {
                    icon.removeClass('fa-chevron-up').addClass('fa-chevron-down');
                } else {
                    icon.removeClass('fa-chevron-down').addClass('fa-chevron-up');
                }

            });


            $.ajax({
                type: "POST",
                url: "OrderNhanVien.aspx/Getdanhsachban",
                contentType: "application/json; charset=utf-8",
                //data: JSON.stringify(data),
                dataType: "json",
                success: function (response) {
                    var data = JSON.parse(response.d);
                    var ddl = document.getElementById("tenban123");
                    // Xóa toàn bộ dữ liệu cũ
                    ddl.innerHTML = "";
                    // Thêm giá trị mặc định
                    var defaultOption = document.createElement("option");
                    defaultOption.text = "==ChonBan==";
                    defaultOption.value = "==ChonBan==";
                    ddl.insertBefore(defaultOption, ddl.firstChild);
                    for (var i = 0; i < data.length; i++) {
                        var option = document.createElement("option");
                        option.text = data[i].tenphong;
                        option.value = data[i].tenphong;

                        if (data[i].trangthai == 1) {
                            //option.style.color = "green";
                            //option.style.fontWeight = "bold"; // nếu muốn đậm hơn
                            option.style.backgroundColor = "#d4edda";
                        }

                        ddl.add(option);
                    }
                },
                error: function (xhr, status, error) {
                    console.error(xhr.responseText);
                }
            });

            $.ajax({
                type: "POST",
                url: "OrderNhanVien.aspx/GetKhuvuc",
                contentType: "application/json; charset=utf-8",
                //data: JSON.stringify(data),
                dataType: "json",
                success: function (response) {
                    var data = JSON.parse(response.d);
                    var ddl = document.getElementById("khuvucid");
                    // Xóa toàn bộ dữ liệu cũ
                    ddl.innerHTML = "";
                    // Thêm giá trị mặc định
                    var defaultOption = document.createElement("option");
                    defaultOption.text = "==KhuVuc==";
                    defaultOption.value = "==KhuVuc==";
                    ddl.insertBefore(defaultOption, ddl.firstChild);
                    for (var i = 0; i < data.length; i++) {
                        var option = document.createElement("option");
                        option.text = data[i].tenkhuvuc;
                        option.value = data[i].tenkhuvuc;

                        ddl.add(option);
                    }
                },
                error: function (xhr, status, error) {
                    console.error(xhr.responseText);
                }
            });

            $('.khuvucid').change(function () {
                var selectedOption = $(this).val(); // Lấy giá trị của option được chọn               
                var _tenban123 = selectedOption;
                var data = { _tenban123: _tenban123 }
                $.ajax({
                    type: "POST",
                    url: "OrderNhanVien.aspx/Gettenbanorder",
                    contentType: "application/json; charset=utf-8",
                    data: JSON.stringify(data),
                    dataType: "json",
                    success: function (response) {
                        var data = JSON.parse(response.d);
                        var ddl = document.getElementById("tenban123");
                        // Xóa toàn bộ dữ liệu cũ
                        ddl.innerHTML = "";
                        // Thêm giá trị mặc định
                        var defaultOption = document.createElement("option");
                        defaultOption.text = "==ChonBan==";
                        defaultOption.value = "==ChonBan==";
                        ddl.insertBefore(defaultOption, ddl.firstChild);

                        for (var i = 0; i < data.length; i++) {
                            var option = document.createElement("option");
                            option.text = data[i].tenphong;
                            option.value = data[i].tenphong;

                            if (data[i].trangthai == 1) {
                                //option.style.color = "green";
                                //option.style.fontWeight = "bold"; // nếu muốn đậm hơn
                                option.style.backgroundColor = "#d4edda";
                            }

                            ddl.add(option);
                        }
                    },
                    error: function (xhr, status, error) {
                        console.error(xhr.responseText);
                    }
                });
            });



            $('#tenban123').change(function () {
                //$('#<dr_banphong.ClientID %>').change(function () {
                var tenphong1 = $(this).val();
                $('#tenbanid').text(tenphong1);
                var tenphong = $('#tenbanid').text();
                //alert(tenphong);
                var data = { tenphong: tenphong };
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "Map.aspx/thongtinhanghoa",
                    //data: JSON.stringify(data),
                    data: JSON.stringify(data),
                    dataType: "json",
                    success: function (data) {
                        //response(data.d);                              
                        const objdata = $.parseJSON(data.d);
                        if (objdata['Table'][0] != "")  //|| objdata ['Table'][0][0] != "0"
                        {
                            $('#tbnhaphang tr').remove();
                            const myArr = JSON.parse(objdata['Table'][0][0]);
                            var tienhang = objdata['Table'][0][1];
                            if (myArr == '0') {
                                //truong hop chua co hang ban
                                $('#tbnhaphang tr').remove();
                                $('#tongtienid').val(0);

                            }
                            else {
                                var blkstr = [];
                                $.each(myArr, function (idx2, val2) {
                                    var str = idx2 + ":" + val2;
                                    blkstr.push(str);
                                });
                                //debugger;

                                //var aaa = blkstr[0];
                                //var bbb = blkstr[1];
                                for (var i = 0; i < blkstr.length; i++) {
                                    const chars = blkstr[i].split(':');
                                    const info_mahang = chars[0].split(',');

                                    var mahang = info_mahang[0];
                                    var dongia = info_mahang[1];
                                    var soluong = chars[1];
                                    var thanhtien = soluong * dongia;//info_mahang[2];


                                    var newrow = '<tr class="themthucdon">' +
                                        '<td id="tenhang">' + mahang + '</td>' +
                                        '<td id="soluong">' + soluong + '</td>' +
                                        '<td id="giale">' + dongia + '</td>' +
                                        '<td id="thanhtien">' + thanhtien + '</td>' +
                                        '<td><input name="checkinput" class="checkinput" type="checkbox" value="" /></td>' +
                                        '</tr>';
                                    $('#tbnhaphang').append(newrow);
                                }

                                $('#tongtienid').val(tienhang);
                            }

                        }
                        else {
                            $('#tbnhaphang tr').remove();
                            $('#tongtienhang').val(0);
                        }
                    },
                    error: function () {
                        //alert("No Match");
                    }
                });
            });


        });

        function doSomethingTimer() {

            $.ajax({
                type: "POST",
                url: "OrderNhanVien.aspx/GetAllTrangThai",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {

                    var data = JSON.parse(response.d);

                    $('#tenban123 option').each(function () {

                        var optionElement = $(this);
                        var value = optionElement.val();

                        var room = data.find(x => x.tenphong === value);

                        if (room && room.trangthai == 1) {
                            optionElement.css("background-color", "#d4edda");
                        } else {
                            optionElement.removeAttr("style");
                        }

                    });
                }
            });
        }

        // 1 giây
        setInterval(doSomethingTimer, 60000);


        // Thực hiện hàm doSomething() sau mỗi 1000ms (1 giây)
        //var intervalId = setInterval(doSomethingTimer, 60000);


    </script>

</body>
</html>
