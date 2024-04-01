﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Map.aspx.cs" Inherits="WebApplication1.Map" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        * {
            margin: 0;
            padding: 0;
            -moz-box-sizing: border-box;
            -webkit-box-sizing: border-box;
            -o-box-sizing: border-box;
            -ms-box-sizing: border-box;
            box-sizing: border-box;
        }

        body {
            font-family: 'Roboto';
        }
        /*.wrapper{
		width: 100%;
		height: 100vh;
		background-color: #333;
		overflow: auto;
	}*/
        .wrapper > ul {
            margin: 0;
            padding: 0;
            width: 100%;
            height: 100%;
            display: flex;
            display: -webkit-flex;
            display: -ms-flex;
            display: -moz-flex;
            display: -o-flex;
            flex-wrap: wrap;
        }

        .item {
            display: block;
            width: 18%;
            /*height: 16vw;*/
            height: 8vw;
            /*line-height: 16vw;*/
            line-height: 8vw;
            text-align: center;
            background-color: #46CFB0;
            margin: 1%;
            list-style: none;
            padding: 0;
            font-size: 1em;
        }

        /* CSS để điều chỉnh kiểu in */
    @media print {
        /* Ẩn các phần tử không muốn in */
        body * {
            visibility: hidden;
        }
        /* Hiển thị lại phần tử div mà bạn muốn in */
        #printableArea, #printableArea * {
            visibility: visible;
        }
        /* Đảm bảo rằng nội dung divToPrint vẫn nằm trong giới hạn in */
        #printableArea {
            position: absolute;
            left: 0;
            top: 0;
        }
    }

    

    </style>




    <link rel="stylesheet" href="../dist/contextmenu.css">


    <script src="../dist/contextmenu.js"></script>



    <div class="wrapper">


        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-8">
                            <i style="font-size:16px; padding-top: 5px; color: black;">Chi tiết bàn/phòng : </i> <b style="font-size:14px; padding-top:5px; color:red" class="td_menu"></b> / Time:
                            <%--Day : <b style="font-size: 14px; color: blue" class="songaydung"></b>--%>
                            &nbsp;&nbsp;Gio : <b style="font-size: 14px; color: blue" class="sogiodung"></b>
                            &nbsp;&nbsp;Phut : <b style="font-size: 14px; color: blue" class="sophutdung"></b>
                            <b style="padding-right: 10px; margin-left: 10px; margin-top: 5px;">Giờ vào:</b>
                            <input id="checkinput1" style="width: 150px; margin-top: 10px;" name="checkinput1" value=""/>
                            <b style="padding-right: 10px; margin-left: 10px; margin-top: 5px;">Giờ ra:</b>
                            <input id="checkinput2" style="width: 150px; margin-top: 10px;" name="checkinput2" value=""/>
                            <b style="padding-right: 12px; margin-left: 10px;">Hình thức nghỉ:</b>
                            <input id="stylerender" style="width: 80px; " name="stylerender" value="" />
                            <b style="padding-right: 10px; margin-left: 10px;">Loại phòng:</b>
                            <input id="styleroom" style="width: 50px; " name="styleroom" value=""/>
                            <b style="padding-right: 10px; margin-left: 10px;">Ticket:</b>
                            <input  style="width: 80px;margin-left: 30px;" id="ticketid" name="ticket" />
                        </div>

                        <div class="col-sm-4">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><a href="#">Home</a></li>
                                <li class="breadcrumb-item active">Project Add</li>
                            </ol>
                        </div>
                    </div>
                </div>
                <!-- /.container-fluid -->
            </section>

            <!-- Main content -->
            <section class="content">
                <div class="row">
                    <div class="col-md-6">
                        <div class="card card-primary">
                            <%int i = 0; %>
                                            <%foreach (System.Data.DataRow rows1 in dt_get_khuvuc0.Rows)
                                                {%>   
                            <div class="card-header">
                                <h3 class="card-title"><%=rows1["tenkhuvuc"].ToString() %></h3>

                                <div class="card-tools">
                                    <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                                        <i class="fas fa-minus"></i>
                                    </button>
                                </div>
                            </div>
                            <div class="card-body">
                                
                                <div class="wrapper" id="myList">
                                    <ul>
                                        <%int k = 0; %>
                                        <%foreach (System.Data.DataRow rows in dt_getinfo_phong.Rows)
                                            {%>
                                        <%k++;%>
                                        <li class="item" id="nametable_<%=k %>">
                                             <img src="/static/images/phongtrong.png" style="float:left; margin-left:3px; margin-top:3px;width:50px; height: 50px;">
                                            <p id="tenphong" style="float:left; margin-left: 5px; margin-top:3px;"><%=rows["tenphong"].ToString() %></p> 
                                            <t id="trangthai" hidden><%=rows["trangthai"].ToString()%></t>
                                            <d id="trangthaidatphong" hidden><%=rows["trangthaidatphong"].ToString() %></d>
                                            <dp id="trangthaidonphong" hidden><%=rows["trangthaidonphong"].ToString() %></dp>
                                            <lp id="loaiphong" style="float: left" hidden><label style="width: 100px; display: none;" name="loaiphong"><%=rows["loaiphongid"].ToString() %></label></lp>                                           
                                            
                                            <tc id="tiencoc" style="width: 160px; float: left" hidden> Đặt trước :<label
                                                    style="width: 100px;display: none;" name="tiencoc">.../VNĐ</label>
                                            </tc>
                                        </li>
                                           

                                        <%} %>
                                    </ul>
                                </div>
                               
                            </div>
                            <!-- /.card-body -->
                            <%} %>
                        </div>
                        <!-- /.card -->
                    </div>



                    <div class="col-md-6">
                        <div class="card card-secondary">
                            <div class="card-header">
                                <h3 class="card-title">Table:<b id="nametable" class="td_menu" style="color:yellow;"></b></h3>

                                <i class="fa fa-pencil" style="font-size: 24px; padding-left: 20px;"></i><b class="editproduct" style="color: yellow; padding-left: 10px;">EDIT</b>

                                <i class="fa fa-times" style="font-size: 24px; padding-left: 20px;"></i><b class="delproduct" style="color: yellow; padding-left: 5px;">DELETE</b>

                                <i class="fa fa-save" style="font-size: 24px;color:blue; padding-left: 20px;"></i><b class="saveproduct" style="color: yellow; padding-left: 5px;">SAVE BILL</b>

                                <i class="fa fa-plus-square" style="font-size: 24px; padding-left: 20px;"></i><b class="add_hanghoa" style="color: yellow; padding-left: 5px;">Add More</b>

                                

                               

                                <div class="card-tools">
                                    <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                                        <i class="fas fa-minus"></i>
                                    </button>
                                </div>
                            </div>
                            <div class="card-body">

                                <table id="add_menu">
                                    <tbody>
                                        <tr>

                                            <td style="padding-bottom: 10px; padding-right: 10px; padding-top: 10px;">
                                                <%--<input type="text" placeholder="Chọn tên hàng " id="ajax"
                                                    style="float: left; width: 100%;" class="ajax form-control input-sm" value="" />--%>
                                                <asp:TextBox ID="txt_doc" Style="float: left; width: 100%;" class="ajax form-control input-sm" value="" placeholder="Chọn tên hàng" runat="server"></asp:TextBox>
                                            </td>
                                            <td style="padding-bottom: 10px; padding-right: 5px; padding-left: 5px;"><b style="color: black;">QTY </b></td>
                                            <td style="padding-bottom: 10px; padding-right: 10px;">
                                                <input id="soluong" name="soluong" class="soluong form-control input-sm" value="1" style="width: 50px;">
                                            </td>
                                            <td style="padding-bottom: 10px; padding-right: 10px; padding-left: 10px;">
                                                <label for="inmauto" style="float: left; margin-top: 5px;">inmauto</label>
                                                   <input type="checkbox" id="inmauto" name="inmauto" >
                                            </td>
                                            <td style="padding-bottom: 10px; padding-right: 10px; padding-left: 10px;">
                                                <label for="inmaunho" style="float: left; margin-top: 5px;">Inmaunho</label>
                                                <input type="checkbox" id="inmaunho" name="inmaunho" checked>
                                            </td>
                                            <td style="padding-bottom: 10px; padding-right: 10px; padding-left: 10px;">
                                                <b style="padding-right: 3px; margin-left: 10px;">So HD:</b>
                                                <input  style="width: 80px;margin-left: 5px;" id="hoadonid" name="sohoadon" />
                                            </td>
                                            
                                            <%--<td style="padding-bottom: 10px; padding-right: 10px; padding-left: 10px;">
                                                <input type="submit" value="Thanh toan" id="khachthanhtoan" class="btn btn-success float-right">  <%--class , id="saveproduct"
                                            </td>--%>
                                    

                                        </tr>
                                    </tbody>
                                </table>


                                <div style="width: 100%; height: 250px; overflow-y: scroll; float: left;">
                                    <table class="display table table-bordered dataTable no-footer">
                                        <thead>
                                            <tr>
                                                <th>Tên hàng</th>
                                                <th>Số lượng</th>
                                                <th>Đơn giá</th>
                                                <th>Thành tiền</th>
                                                <th>Chon</th>
                                            </tr>
                                            <tbody id="tbnhaphang">
                                            </tbody>
                                    </table>
                                </div>

                                 

                                <div class="row">
                                    <div class="col-2">
                                        <label for="tongtien" style="float: left; margin-top: 5px;">Tong tien:</label>
                                        <input type="text" id="tongtienid" class="form-control input-sm" name="fname" style="float: left; margin-left: 10px;" value="0">
                                                     <span style="float: left;padding-left: 20px; padding-top: 10px;">
            <img src="/static/images/phongtrong.png" style="width:40px;height:30px;float: left;padding-right: 10px;">
            <b style="font-size: 14px;">Bàn/Phòng trống</b>

        </span>
                                    </div>
                                    <div class="col-2">
                                        <label for="tongtien" style="float: left; margin-top: 5px;">chiet khau</label>
                                        <input type="text" id="chietkhauid" class="form-control input-sm" name="fname" style="float: left; margin-left: 10px;" value="0">
                                         <span style="float: left;padding-left: 20px; padding-top: 10px;">
            <img src="/static/images/cokhach.png" style="width:40px;height:30px;float: left;padding-right: 10px;">
            <b style="font-size: 14px;">B/P có khách</b>
        </span>
                                    </div>                                                                    
                                
                                    <div class="col-2">
                                        <label for="tongtien" style="float: left; margin-top: 5px;">thanh toan</label>
                                        <input type="text" id="thanhtoanid" class="form-control input-sm" name="fname" style="float: left; margin-left: 10px;" value="0">                                                                              
                                         <span style="float: left;padding-left: 20px; padding-top: 10px;">
            <img src="/static/images/phongdattruoc.png" style="width:40px;height:30px;float: left;padding-right: 10px;">
            <b style="font-size: 14px;">B/P đặt trước</b>
        </span>                                   
                                    </div>
                                    <div class="col-2">
                                        <label for="tongtien" style="float: left; margin-top: 5px; id="lblconlai" ">Conlai</label>
                                        <input type="text" id="conlaiid" class="form-control input-sm" name="fname" style="float: left; margin-left: 10px;" value="0">                                        
        <span style="float: left;padding-left: 20px; padding-top: 10px;">
            <img src="/static/images/chuadonphong.png" style="width:40px;height:30px;float: left;padding-right: 10px;">
            <b style="font-size: 14px;">Chưa dọn B/P</b>
        </span>

                                    </div>
                                     
                                    <div class="col-2">
                                        <input type="submit" value="Thanh toan" id="khachthanhtoan2" class="btn btn-success float-right">  <%--class , id="saveproduct"--%>                                                                                                                      
                                    </div>
                                           
                                    <div class="col-2">
                                        <input type="submit" value="In lai hoa don" id="inlaihoadon" class="btn btn-success float-right">  <%--class , id="saveproduct"--%>
                                    </div>
                                     
                                </div>
                                


    </div>



                            <!-- /.card-body -->
                        </div>
                        <!-- /.card -->


                        <div class="card card-secondary">
                            <%--<div class="card-body">                                
                                <div class="card card-info card-outline">
                                    <div class="card-header">
                                        <h3 class="card-title">
                                            <i class="fas fa-edit"></i>
                                            Group Name
                                        </h3>
                                    </div>
                                    <div class="card-body">
                                        <%for (int j = 0; j < 10; j++)
                                            {%>
                                        <button type="button" class="btn btn-default toastsDefaultDefault">
                                            Test
                                        </button>
                                        <%} %>
                                    </div>
                                </div>                               
                            </div>--%>

                            <section class="content-header">
                                <div class="container-fluid">
                                    <div class="row mb-2">

                                        <div class="col-sm-12">
                                            <ol class="breadcrumb float-sm-left">
                                                <li class="breadcrumb-item active"><a href="/Map.aspx">All group</a></li>
                                                <%foreach (System.Data.DataRow rows in dt_nhomhang.Rows)
                                                    {%>
                                                <li class="breadcrumb-item"><a href="/Map.aspx?nhomhangid=<%=rows["id"].ToString() %>"><%=rows["manhomhang"].ToString() %></a></li>
                                                <%} %>
                                            </ol>
                                        </div>
                                    </div>
                                </div>
                                <!-- /.container-fluid -->
                            </section>

                            <section class="content">

                                <!-- Default box -->
                                <div class="card card-solid">
                                    <div class="card-body pb-0">
                                        <div class="row d-flex align-items-stretch">
                                            <%foreach (System.Data.DataRow rows1 in dt_listhanghoa.Rows)
                                                {%>


                                            <div class="col col-lg-2 d-flex align-items-stretch">
                                                <div class="row" style="border: 1px solid grey;">
                                                    <div class="col-12 text-center">
                                                        <%--<img src="../../dist/img/user1-128x128.jpg" alt="user-avatar" class="img-circle img-fluid">--%>
                                                     <%--   <img src="../../dist/img/monan.JPG" alt="user-avatar" class="img-circle img-fluid">--%>

                                                        <div class="text-center" style="margin-bottom: 10px; margin-top: 10px;">
                                                            <mh><%=rows1["mahang"].ToString() %></mh> <br /> <dg><%=rows1["giaban"].ToString() %></dg> /VND
                                                            <input type="number" class="quantity form-control text-center" title="Số lượng" value="1" min="1" size="1" maxlength="2" id="quantity" name="quantity" ">                                                                                                                      
                                                            <a href="#" class="button_addmenu btn btn-sm btn-primary" id="add_sanpham">
                                                                Add
                                                            </a>

                                                        </div>
                                                        

                                                    </div>
                                                </div>


                                            </div>

                                            <%} %>
                                        </div>
                                    </div>
                                    <!-- /.card-body -->
                                    <div class="card-footer">
                                        <nav aria-label="Contacts Page Navigation">
                                            <ul class="pagination justify-content-center m-0">
                                                <li class="page-item active"><a class="page-link" href="#">1</a></li>
                                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                                <li class="page-item"><a class="page-link" href="#">4</a></li>
                                                <li class="page-item"><a class="page-link" href="#">5</a></li>
                                                <li class="page-item"><a class="page-link" href="#">6</a></li>
                                                <li class="page-item"><a class="page-link" href="#">7</a></li>
                                                <li class="page-item"><a class="page-link" href="#">8</a></li>
                                            </ul>
                                        </nav>
                                    </div>
                                    <!-- /.card-footer -->
                                </div>
                                <!-- /.card -->

                            </section>






                        </div>



                    </div>
                </div>
                <%-- <div class="row">
                    <div class="col-12">
                        <a href="#" class="btn btn-secondary">Button</a>
                        <input type="submit" value="Save" class="btn btn-success float-right">
                    </div>
                </div>--%>
            </section>
            <!-- /.content -->

            <div class="modal" id="myModal6">
            <div class="modal-dialog" >
                <div class="modal-content">
                    <div class="modal-header">
                        <div class="row">
                            <div>
                                <h4 class="modal-title" id="headerTag" style="float: left">THONG TIN HOA DON</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="float: right; margin-left: 300px;">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                        </div>
                    </div>


                    <div class="modal-body">
                        <div class="container-fluid" id="printableArea">
                            Hinh thuc: <b id="hinhthucnghi2"></b>
                            &nbsp;&nbsp;&nbsp; tongtienhat: <b id="tongtienhat2"></b><br />
                           Ten phong: <b id="tenphong2"></b>
                           &nbsp;&nbsp;&nbsp; Tong tien hang: <b id="tongtien2"></b>                                                      


                                <div style="width: 100%; height: 250px; overflow-y: scroll; float: left;">
                                    <table class="display table table-bordered dataTable no-footer">
                                        <thead>
                                            <tr>
                                                <th>Tên hàng</th>
                                                <th>Số lượng</th>
                                                <th>Đơn giá</th>
                                                <th>Thành tiền</th>                                                
                                            </tr>
                                            <tbody id="tbnhaphang_inhoadon">
                                            </tbody>


                                    </table>
                                </div>
                            
                           <br /> 
                           Thanh toan: <b id="thantoan2"></b> &nbsp;&nbsp;&nbsp;  C/K: <b id="chietkau2"></b> <br />
                           Con lai: <b id="conlai2"></b>
                            
                        </div>
                    </div>


                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fas fa-times"></i>Close</button>
                        <button type="button" runat="server" id="Button3"  class="btn btn-primary" onclick="printDiv('printableArea')" > <%-- value="print a div!"   onserverclick="test"--%>
                            <i class="fas fa-download"></i>
                            In & luu hoa don
                        </button>
                    </div>
                </div>
            </div>
        </div>




        </div>
        <!-- /.content-wrapper -->



        <%--  <script src="../plugins/jquery/jquery.min.js"></script>--%>
        <script src="../dist/contextmenu.js"></script>

        <script>
            $(document).ready(function () {
                //$('#txtid').prop("readonly", true);
                //$('#txtmaterial').prop("readonly", true);

                //$('#TOOLING_NO_ID').prop("readonly", true);
                //$('#CustomTooling_ID').prop("readonly", true);
                //$('#txt_ID').prop("readonly", true);
                
                //lay so hoa don lon nhat
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "Map.aspx/getsohoadon",
                    //data: JSON.stringify(data),
                    dataType: "json",
                    success: function (data) {
                        //response(data.d);
                        //alert(data.d);
                        $("#hoadonid").val(data.d);
                    },
                    error: function (result) {
                        //alert("No Match");
                    }
                 });
                

                // phan render giao dien cac phong co khach va khong co khach
                $("#myList UL LI").each(function () {
                    //phong co khach
                    if ($(this).find('#trangthai').text() == 1) {
                        $(this).find("img").attr('src','/static/images/cokhach.png');
                        //khoa chuc nang thue phong  **** xem lai chuc nang khoa
                        //$('#myMenu').disableContextMenuItems('#thuephong');
                    }
                    // Trang thai dat phong
                    if ($(this).find('#trangthai').text() == 0 && $(this).find('#trangthaidatphong').text() == 1) {
                        $(this).find("img").attr('src','/static/images/phongdattruoc.png');
                    }
                    // Trang thai chua don phong
                    if ($(this).find('#trangthaidonphong').text() == 1) {
                        $(this).find("img").attr('src','/static/images/chuadonphong.png');
                    }
                });

                SearchText();

                $("#myList UL LI").each(function () {
                    $(this).click(function () {
                        var tenphong = $(this).find('p').text();
                        $('#MainContent_txt_doc').val('');
                        $('#MainContent_txt_doc').select();
                        //alert(tenphong);                        
                        $('.td_menu').text(tenphong);

                        //check trang thai ban phong co khach hay khong?
                        var data = { tenphong: tenphong };
                        $.ajax({
                            type: "POST",
                            contentType: "application/json; charset=utf-8",
                            url: "Map.aspx/searchmahang",
                            data: JSON.stringify(data),
                            dataType: "json",
                            success: function (data) {
                                response(data.d);
                            },
                            error: function (result) {
                                //alert("No Match");
                            }
                        });

                        var tong = 0;

                        // khi click cac phong de chon thuc don va kiem tra da chon thuc don chua? 
                        // lay thong tin hoang hoa
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

                                //var giaphong = objdata['Table'][2]; 

                                //debugger;
                                if (objdata['Table'][0] != "")  //|| objdata ['Table'][0][0] != "0"
                                {
                                    $('#tbnhaphang tr').remove();
                                    const myArr = JSON.parse(objdata['Table'][0][0]);
                                    var tienhang = objdata['Table'][0][1];
                                    var giovao = objdata['Table'][0][3];
                                    var hinhthucnghi = objdata['Table'][0][4];
                                    var giohat = objdata['Table'][0][5];

                                    //var sohoadon = objdata['Table'][0][6];
                                    //id stylerender

                                    var today = new Date();
                                    var dd = today.getDate();
                                    var mm = today.getMonth() + 1; //January is 0!
                                    var yyyy = today.getFullYear();
                                    var hour = today.getHours();
                                    var minute = today.getMinutes();
                                    var second = today.getSeconds();
                                    if (hour.toString().length == 1) {
                                        var hour = '0' + hour;
                                    }
                                    if (minute.toString().length == 1) {
                                        var minute = '0' + minute;
                                    }
                                    if (second.toString().length == 1) {
                                        var second = '0' + second;
                                    }
                                    if (dd < 10) {
                                        dd = '0' + dd
                                    }
                                    if (mm < 10) {
                                        mm = '0' + mm
                                    }
                                    
                                    var giora = mm + '/' + dd + '/' + yyyy + ' ' + hour + ':' + minute + ':' + second;
                                    var date1 = new Date(giovao);
                                    var date2 = new Date(giora);

                                    var diffMs = (date2 - date1); // milliseconds between now & date1   1giay = 1000 millisecnds 
                                    var diffHrs = Math.round((diffMs % 86400000) / 3600000); // hours   1gio = 3600000 , 1 ngay = 86400000 mililigiay
                                    var diffMins = Math.round(((diffMs % 86400000) % 3600000) / 60000); // minutes
                                    //var diffDays = Math.round(diffMs / 86400000);

                                    var diffHrs_check = (diffMs % 86400000) / 3600000
                                    //var diffHrs_check2 =  parseFloat(diffMs % 86400000) / 3600000
                                    //alert(diffHrs_check);
                                    //alert(diffHrs_check2);

                                    //console.log(diffMs);    //so ngay
                                    //console.log(diffHrs);   //so gio
                                    //console.log(diffMins);  //so phut                                                                      
                                    
                                    if(diffMs.toString() == 'NaN')
                                    {
                                        //$('#songaydung').val(diffMs);
                                        $('.sogiodung').text('0');
                                        $('.sophutdung').text('0');
                                    }
                                    else
                                    {
                                        //$('#songaydung').val(diffMs);  //nho hon 1h
                                        if(diffHrs_check < 1)
                                        {
                                            $('.sogiodung').text('0');
                                            $('.sophutdung').text(diffMins);
                                        }
                                        else
                                        {
                                            $('.sogiodung').text(diffHrs);
                                            $('.sophutdung').text(diffMins);
                                        }
                                        
                                    }
                                   
                                    var diffDays = 0;
                                    if (diffHrs > 12 && diffHrs < 24) {
                                        diffDays = 0;
                                    } else {
                                        diffDays = Math.round(diffMs / 86400000); // days
                                    }

                                    //debugger; 
                                    if (myArr == '0') {
                                        //truong hop chua co hang ban
                                        $('#tbnhaphang tr').remove();
                                        $('#tongtienid').val(0);                                        
                                        $('#thanhtoanid').val(0);
                                        $('#chietkhauid').val(0);

                                        $('#ticketid').val(0);
                                        $('#stylerender').val('NH-CF');
                                        
                                        
                                        

                                    } 
                                    else 
                                    {
                                        var blkstr = [];
                                        $.each(myArr, function (idx2, val2) {
                                            var str = idx2 + ":" + val2;
                                            blkstr.push(str);
                                        });
                                        debugger;

                                        //var aaa = blkstr[0];
                                        //var bbb = blkstr[1];
                                        for (var i = 0; i < blkstr.length; i++) {
                                            const chars = blkstr[i].split(':');
                                            const info_mahang = chars[0].split(',');

                                            var mahang = info_mahang[0];
                                            var dongia = info_mahang[1];
                                            var thanhtien = info_mahang[2];
                                            var soluong = chars[1];

                                            var newrow = '<tr class="themthucdon">' +
                                                '<td id="tenhang">' + mahang + '</td>' +
                                                '<td id="soluong">' + soluong + '</td>' +
                                                '<td id="giale">' + dongia + '</td>' +
                                                '<td id="thanhtien">' + thanhtien + '</td>' +
                                                '<td><input name="checkinput" class="checkinput" type="checkbox" value="" /></td>' +
                                                '</tr>';
                                            $('#tbnhaphang').append(newrow);
                                        }

                                        $('#checkinput1').val(giovao);
                                        $('#checkinput2').val(giora);
                        
                                        
                                        
                                        $('#tongtienid').val(tienhang);
                                        $('#thanhtoanid').val(tienhang);
                                        $('#chietkhauid').val(0);

                                        $('#ticketid').val(giohat);
                                        $('#stylerender').val(hinhthucnghi);
                                    }
                                }
                                else {
                                    $('#tbnhaphang tr').remove();
                                    $('#tongtienhang').val(0);
                                    $('#thanhtoanid').val(0);
                                    $('#chietkhauid').val(0);

                                    $('#ticketid').val(0);
                                    $('#stylerender').val('NH-CF');
                                }

                            },
                            error: function () {
                                //alert("No Match");
                            }
                        });


                    });
                });

            });

            $('#khachthanhtoan2').click(function () {                                       
                //save hoa don truoc
                var itemdata = {};
                var tenphong = $('#nametable').text();//dj('#name_room').text();
                var tienhang = $('#tongtienid').val();                                 

                var sogiodung = $(".sogiodung").text();
                var sophutdung = $(".sophutdung").text();
                
                var tongsophutdung = parseInt(sogiodung)*60+parseInt(sophutdung);
                var hinhthucnghi = $('#stylerender').val();
                var giohat = '0';//$('#ticketid').val();
                if(hinhthucnghi == 'Karaoke')
                {
                    giohat = $('#ticketid').val();
                }
                var tienhat1phut = parseInt(giohat)/60;
                var tongtienhat = Math.round(tongsophutdung * tienhat1phut);
                //console.log(tongsophutdung)    
                //console.log(tongsophutdung)

                //alert(tienhat1phut);
                //alert(tongtienhat);
                                 
                //alert(tongsophutdung);

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
                        }
                    });
                    var hanghoa_new = itemdata;
                    var aaa = $('#tongtienid').val();
                    var data = {
                        tenphong: tenphong,
                        tienhang: tienhang,
                        items: JSON.stringify(itemdata)
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
                            //alert('Hàng hóa đã được thêm thành công!');                                                       
                        },
                        error: function () {
                            //alert("No Match");
                        }
                    });
                        // nha du lieu len thong tin hoa don
                        // lay thong tin hoang hoa
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
                                //var giaphong = objdata['Table'][2]; 
                                //debugger;
                                if (objdata['Table'][0] != "")  //|| objdata ['Table'][0][0] != "0"
                                {
                                    $('#tbnhaphang_inhoadon tr').remove();
                                    const myArr = JSON.parse(objdata['Table'][0][0]);
                                    //var tienhang = objdata['Table'][0][1];
                                    //var giovao = objdata['Table'][0][3];                                  
                                    //debugger; 
                                    if (myArr == '0') {
                                        //truong hop chua co hang ban
                                        $('#tbnhaphang_inhoadon tr').remove();
                                        $("#tenphong2").text(tenphong);
                                        $('#tongtien2').text(0);                                        
                                        $('#thantoan2').text(0);
                                        $('#chietkau2').text(0);

                                        $('#hinhthucnghi2').text('');
                                        $('#tongtienhat2').text(tongtienhat);
                                    } 
                                    else 
                                    {
                                        var blkstr = [];
                                        $.each(myArr, function (idx2, val2) {
                                            var str = idx2 + ":" + val2;
                                            blkstr.push(str);
                                        });
                                        debugger;
                                        //var aaa = blkstr[0];
                                        //var bbb = blkstr[1];
                                        for (var i = 0; i < blkstr.length; i++) {
                                            const chars = blkstr[i].split(':');
                                            const info_mahang = chars[0].split(',');

                                            var mahang = info_mahang[0];
                                            var dongia = info_mahang[1];
                                            var thanhtien = info_mahang[2];
                                            var soluong = chars[1];

                                            var newrow = '<tr class="themthucdon2">' +
                                                '<td id="tenhang">' + mahang + '</td>' +
                                                '<td id="soluong">' + soluong + '</td>' +
                                                '<td id="giale">' + dongia + '</td>' +
                                                '<td id="thanhtien">' + thanhtien + '</td>' +                                               
                                                '</tr>';
                                            $('#tbnhaphang_inhoadon').append(newrow);
                                        }
                                        //$('#checkinput1').val(giovao);
                                        //$('#checkinput2').val(giora);                                                                
                                        $("#tenphong2").text(tenphong);
                                        $('#tongtien2').text(tienhang);
                                        $('#thantoan2').text(parseInt(tienhang)+parseInt(tongtienhat));
                                        $('#chietkau2').text(0);

                                        $('#hinhthucnghi2').text(hinhthucnghi);
                                        $('#tongtienhat2').text(tongtienhat);
                                    }
                                }
                                else {
                                    $('#tbnhaphang_inhoadon tr').remove();
                                     $("#tenphong2").text(tenphong);
                                        $('#tongtien2').text(0);                                        
                                        $('#thantoan2').text(0);
                                        $('#chietkau2').text(0);

                                        $('#hinhthucnghi2').text('');
                                        $('#tongtienhat2').text(tongtienhat);
                                }
                            },
                            error: function () {
                                //alert("No Match");
                            }
                        });            
                }
                else
                {
                        alert('Bạn chưa chọn phòng thuê!')
                }
                  $('#myModal6').modal('show');
            })            

            function thanhtoanhoadon(tenphong2,tongtien2,chietkau2,thantoan2,conlai2,tienhat,sohoadon)
            {
                debugger;
                var psco = thantoan2;//$('#thanhtoanid').val();
                var tongtienhang = tongtien2;//$('#tongtienid').val();
                var tienck = chietkau2;//$('#chietkhauid').val();
                var tongtienhat =  tienhat;               
                //var tienthoi = (parseFloat(psco) - parseFloat(tongtienhang)) 
                //if (tienthoi < 0) {
                //            $('#lblconlai').text("Tiền thiếu :");
                //            $('#conlaiid').val(tienthoi);
                //        } else {
                //            $('#lblconlai').text("Tiền thừa :");
               //             $('#conlaiid').val(tienthoi);
                //        }
                var tenphong = tenphong2;//$('#nametable').text();
                var psno = conlai2;//$('#conlaiid').val();
                var itemdata = {};

                $('.themthucdon2').each(function () {                        
                        var mahang = $(this).find('td').eq(0).text() + "," + $(this).find('td').eq(2).text() + "," + $(this).find('td').eq(3).text();
                        var soluong = $(this).find('td').eq(1).text();                       
                        if (mahang != "") {                           
                            itemdata[mahang] = parseInt(soluong);                            
                        }
                    });                                       
                    var data = {
                        tenphong: tenphong,
                        tongtienhang: tongtienhang,
                        tongtienhat:tongtienhat,
                        psco:psco,
                        tienno: psno,
                        tienck:tienck,
                        items: JSON.stringify(itemdata)
                    };
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "Map.aspx/khthantoan",
                        //data: JSON.stringify(data),
                        data: JSON.stringify(data),
                        dataType: "json",
                        success: function (data) {
                            debugger;
                            if (data.d != "NG") {
                                alert('Hoa don them thành công!');
                                $('#tbnhaphang tr').remove();
                                $('#tongtienid').val(0);                                        
                                $('#thanhtoanid').val(0);
                                $('#chietkhauid').val(0);
                                
                                $('#stylerender').val('');
                                $('#ticketid').val(0);
                                
                                $('#hoadonid').val(parseInt(sohoadon)+1);
                            } 
                            else 
                            {
                                //alert('Phòng/ bàn đang trống!');
                            }
                            

                        },
                        error: function () {
                            //alert("No Match");
                        }
                    });
            }
            

            // nut ghi lai danh sach thuc don
            $('.saveproduct').click(function () {
                //alert("ádfsa");
                var itemdata = {};
                var tenphong = $('#nametable').text();//dj('#name_room').text();
                var tienhang = $('#tongtienid').val();
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

                            //itemdata.soluong = soluong;
                            //cart.push({ itemdata: itemdata });
                            //JSON.stringify([{a: 1}, {a: 2}]) 
                            //==> "[{"a":1},{"a":2}]" 
                        }
                    });
                    var hanghoa_new = itemdata;
                    var aaa = $('#tongtienid').val();
                    //djLog(itemdata);  //Object {bimbim: 1}
                    //var data = {
                    //    'tenphong': tenphong,
                    //    'tienhang': tienhang,
                    //    'items': JSON.stringify(itemdata)
                    //};

                    var data = {
                        tenphong: tenphong,
                        tienhang: tienhang,
                        items: JSON.stringify(itemdata)
                    };
                    //djLog(data);  //Object {tenphong: "P.101", tienhang: "10000", items: "{"ngocay":1}"}
                    //console.log(data);

                    // var data_new = { tenphong: tenphong, tienhang: tienhang };
                    //var data_new = { tenphong: tenphong, tienhang: tienhang };

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
                            $("#myList UL LI").each(function () {
                                    var nameroom = $(this).find('#tenphong').text();
                                    if (nameroom == tenphong) {
                                        $(this).find("img").attr('src','/static/images/cokhach.png');
                                    }
                                })
                        },
                        error: function () {
                            //alert("No Match");
                        }
                    });


                    // kiem tra xem phong + ban da co khach chua ?
                    //dj.getJSON('/modules/hotel/testtrangthaiphong', { 'tenphong': tenphong }, function (rs) {
                    //    //djLog(rs.trangthai);
                    //    if (rs.trangthai === 0) {
                    //        //dWin.alert('ban chua chon phong de thue aaa');
                    //        var action = 'thuephong';

                    //        //*** chua ra tien hang de cap nhat vao so cai

                    //        // djLog(tienhang); vao den day
                    //        dhotel.thuephong(action, rs, tenphong, hanghoa_new, aaa);
                    //    } else {
                    //        // neu da thue phong cap nhat them hang hoa vao chung tu
                    //        // cap nhat thong tin menu
                    //        dj.getJSON('/modules/hotel/testcapnhathanghoa', data, function (rs) {
                    //            if (rs.err === 0) {
                    //                dWin.alert('Hàng hóa đã được thêm thành công!');
                    //            }
                    //        });
                    //    }
                    //});
                } else {
                    alert('Bạn chưa chọn phòng thuê!')
                }
            });

            // nut sua hoa don
            $('.editproduct').click(function () {
                        var tenphong = $('#name_room').text();
                        var tongtienhang = parseInt($('#tongtienhang').val());
                        $('.checkinput').each(function () {
                            var chk = $(this).is(':checked');
                            if (chk == true) {
                                var mahangid = $(this).parent().parent().find('td').eq(0).text();
                                var soluong = $(this).parent().parent().find('td').eq(1).text();
                                var price = $(this).parent().parent().find('td').eq(3).text();
                                tongtienhang = tongtienhang - price;
                                $(this).parent().parent().remove();
                                $('#tongtienhang').val(tongtienhang);
                                $('#thanhtoanid').val(tongtienhang);

                                $('#soluong').val(soluong);
                                $('.ajax').val(mahangid);
                                
                                $('#soluong').focus();
                                $('#soluong').select();

                                //dj.getJSON('/modules/hotel/xulysuathucdon', {'tenphong': tenphong, 'mahang': mahangid, 'giaban': price}, function (rs) {
                                //    if (rs.err === 0) {
                                //        dj('#tongtienhang').val(rs.tienhang);
                                //        dj('#soluong').val(soluong);
                                //        dj('#ajax').val(mahangid);
                                //   }
                                //});
                            }
                        })
                    });


            $("#MainContent_txt_doc").on('keyup', function (e) {
                if ((e.key === 'Enter' || e.keyCode === 13)) {
                    $("#soluong").val(1);
                    $("#soluong").select();
                }
            });

           

            $('.button_addmenu').each(function () {
                $(this).click(function () {                  
                    var _mahang = $(this).parent().find('mh').text();
                    var data = { _mahang: _mahang };
                    var soluong = $(this).parent().find("input[name='quantity']").val();
                    var dongia = $(this).parent().find('dg').text();

                    var tongtienhang = parseInt($('#tongtienid').val());
                    //var thanhtien = parseInt(soluong) * parseInt(dongia);
                    //var data = {
                    //    'mahang': mahang,
                    //    'soluong': soluong,
                    //    'giaban': dongia,
                    //    'thanhtien': thanhtien
                    //};
                    //alert(mahang);
                    //alert(soluong);

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
                        debugger;
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

                                var newrow = '<tr class="themthucdon">' +
                                    '<td id="tenhang">' + objdata['Table'][0][1] + '</td>' +
                                    '<td id="soluong">' + soluong + '</td>' +
                                    '<td id="giale">' + dongia + '</td>' +
                                    '<td id="thanhtien">' + thanhtien + '</td>' +
                                    '<td><input name="checkinput" class="checkinput" type="checkbox" value="" /></td>' +
                                    '</tr>';
                                $('#tbnhaphang').append(newrow);
                                tongtienhang += thanhtien;
                                //alert(tongtienhang);
                                $('#tongtienid').val(tongtienhang);
                                $('#thanhtoanid').val(tongtienhang);
                                //$("#MainContent_txt_doc").select();
                            },
                            error: function () {
                                //alert("No Match");
                            }
                        });
                    }

                    //neu da co ma hang trog danh sach thi remove cai cu roi insert
                    if (gettr_rs == 'Remove') {
                        // xoa dong
                        debugger;
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
                                $('#thanhtoanid').val(tongtienhang);
                                // _$addproduct_(soluong);
                                debugger;
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
                                            '<td id="tenhang">' + objdata['Table'][0][1] + '</td>' +
                                            '<td id="soluong">' + tong_soluong + '</td>' +
                                            '<td id="giale">' + dongia + '</td>' +
                                            '<td id="thanhtien">' + thanhtien + '</td>' +
                                            '<td><input name="checkinput" class="checkinput" type="checkbox" value="" /></td>' +
                                            '</tr>';
                                        $('#tbnhaphang').append(newrow);
                                        tongtienhang += thanhtien;
                                        $('#tongtienid').val(tongtienhang);
                                        $('#thanhtoanid').val(tongtienhang);
                                        //$("#MainContent_txt_doc").select();
                                    },
                                    error: function () {
                                        //alert("No Match");
                                    }
                                });

                            }
                        });
                    }

                  
                })
            });


            $('.add_hanghoa').each(function () {
                $(this).click(function () {                     
                    if($("#MainContent_txt_doc").val() == '')
                    {                       
                          alert('ban chua nhap ma hang!');
                          $("#MainContent_txt_doc").focus();
                    }
                    else
                    {
                        var _mahang = $("#MainContent_txt_doc").val();                    
                        var soluong = $("#soluong").val(); 
                        var data = { _mahang: _mahang };
                    
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
                                        var soluong = parseInt($("#soluong").val());
                                        var dongia = parseInt(objdata['Table'][0][7]);
                                        var thanhtien = parseInt($("#soluong").val()) * parseInt(objdata['Table'][0][7]);
                                        //alert(thanhtien);

                                        var newrow = '<tr class="themthucdon">' +
                                            '<td id="tenhang">' + objdata['Table'][0][1] + '</td>' +
                                            '<td id="soluong">' + soluong + '</td>' +
                                            '<td id="giale">' + dongia + '</td>' +
                                            '<td id="thanhtien">' + thanhtien + '</td>' +
                                            '<td><input name="checkinput" class="checkinput" type="checkbox" value="" /></td>' +
                                            '</tr>';
                                        $('#tbnhaphang').append(newrow);
                                        tongtienhang += thanhtien;

                                        //alert(tongtienhang);
                                        $('#tongtienid').val(tongtienhang);
                                        $('#thanhtoanid').val(tongtienhang);

                                        $("#MainContent_txt_doc").select();
                                    },
                                    error: function () {
                                        //alert("No Match");
                                    }
                                });
                            }

                            //neu da co ma hang trog danh sach thi remove cai cu roi insert
                            if (gettr_rs == 'Remove') {
                                // xoa dong
                                $('#tbnhaphang tr').each(function () {
                                    var td = $(this).find('td').eq(0).text();

                                    var soluongmoi = $('#soluong').val();
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
                                        $('#thanhtoanid').val(tongtienhang);
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
                                                var soluong = parseInt($("#soluong").val());
                                                var dongia = parseInt(objdata['Table'][0][7]);
                                                var thanhtien = tong_soluong * dongia;
                                                var newrow = '<tr class="themthucdon">' +
                                                    '<td id="tenhang">' + objdata['Table'][0][1] + '</td>' +
                                                    '<td id="soluong">' + tong_soluong + '</td>' +
                                                    '<td id="giale">' + dongia + '</td>' +
                                                    '<td id="thanhtien">' + thanhtien + '</td>' +
                                                    '<td><input name="checkinput" class="checkinput" type="checkbox" value="" /></td>' +
                                                    '</tr>';
                                                $('#tbnhaphang').append(newrow);
                                                tongtienhang += thanhtien;
                                                $('#tongtienid').val(tongtienhang);
                                                $('#thanhtoanid').val(tongtienhang);

                                                $("#MainContent_txt_doc").select();
                                            },
                                            error: function () {
                                                //alert("No Match");
                                            }
                                        });

                                        //***

                                    }
                                });
                            }


                        
                    }
                                                     
                    
                });               
            });

           

            $("#soluong").on('keyup', function (e) {
                if ((e.key === 'Enter' || e.keyCode === 13)) {
                    var tongtienhang = parseInt($('#tongtienid').val());
                    var _mahang = $("#MainContent_txt_doc").val();
                    var data = { _mahang: _mahang };
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
                                var soluong = parseInt($("#soluong").val());
                                var dongia = parseInt(objdata['Table'][0][7]);
                                var thanhtien = parseInt($("#soluong").val()) * parseInt(objdata['Table'][0][7]);
                                //alert(thanhtien);

                                var newrow = '<tr class="themthucdon">' +
                                    '<td id="tenhang">' + objdata['Table'][0][1] + '</td>' +
                                    '<td id="soluong">' + soluong + '</td>' +
                                    '<td id="giale">' + dongia + '</td>' +
                                    '<td id="thanhtien">' + thanhtien + '</td>' +
                                    '<td><input name="checkinput" class="checkinput" type="checkbox" value="" /></td>' +
                                    '</tr>';
                                $('#tbnhaphang').append(newrow);
                                tongtienhang += thanhtien;
                                //alert(tongtienhang);
                                $('#tongtienid').val(tongtienhang);
                                $('#thanhtoanid').val(tongtienhang);

                                $("#MainContent_txt_doc").select();
                            },
                            error: function () {
                                //alert("No Match");
                            }
                        });
                    }

                    //neu da co ma hang trog danh sach thi remove cai cu roi insert
                    if (gettr_rs == 'Remove') {
                        // xoa dong
                        $('#tbnhaphang tr').each(function () {
                            var td = $(this).find('td').eq(0).text();

                            var soluongmoi = $('#soluong').val();
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
                                $('#thanhtoanid').val(tongtienhang);
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
                                        var soluong = parseInt($("#soluong").val());
                                        var dongia = parseInt(objdata['Table'][0][7]);
                                        var thanhtien = tong_soluong * dongia;
                                        var newrow = '<tr class="themthucdon">' +
                                            '<td id="tenhang">' + objdata['Table'][0][1] + '</td>' +
                                            '<td id="soluong">' + tong_soluong + '</td>' +
                                            '<td id="giale">' + dongia + '</td>' +
                                            '<td id="thanhtien">' + thanhtien + '</td>' +
                                            '<td><input name="checkinput" class="checkinput" type="checkbox" value="" /></td>' +
                                            '</tr>';
                                        $('#tbnhaphang').append(newrow);
                                        tongtienhang += thanhtien;
                                        $('#tongtienid').val(tongtienhang);
                                        $('#thanhtoanid').val(tongtienhang);

                                        $("#MainContent_txt_doc").select();
                                    },
                                    error: function () {
                                        //alert("No Match");
                                    }
                                });

                                //***

                            }
                        });
                    }




                }
            });

            // nut xoa san pham
        $('.delproduct').click(function () {
            //var tenphong = dj('#name_room').text();
            //var tongtienhang = parseInt($('#tongtienhang').val());
            var tongtienhang = parseInt($('#tongtienid').val());
            $('.checkinput').each(function () {
                var chk = $(this).is(':checked');
                if (chk == true) {
                    var delid = $(this).parent().parent().find('td').eq(0).text();
                    var price = parseInt($(this).parent().parent().find('td').eq(3).text());
                    tongtienhang = tongtienhang - price;
                    //djLog(tongtienhang);
                    $(this).parent().parent().remove();
                    $('#tongtienid').val(tongtienhang);
                    $('#thanhtoanid').val(tongtienhang);
                    // *** -> se xu ly bang cach nguoi dung nhap sua xoa -> click 2 nut (luu ban /phong) + tra phong -> save all   (xu ly sau ***** cap nhat ngay lap tuc)
                    //dj.getJSON('/modules/hotel/xulyxoathucdon', {'tenphong': tenphong, 'mahang': delid, 'giaban': price}, function (rs) {
                    //    if (rs.err === 0) {
                    //        dWin.alert("Bạn xóa thành công!");
                    //        dj('#tongtienhang').val(rs.tienhang);
                    //    }
                    //});
                }
            })
        });



            function SearchText() {
                //debugger;
                $("#MainContent_txt_doc").autocomplete({
                    source: function (request, response) {
                        var _mahang = $("#MainContent_txt_doc").val();
                        var data = { _mahang: _mahang };
                        $.ajax({
                            type: "POST",
                            contentType: "application/json; charset=utf-8",
                            url: "Map.aspx/searchmahang",
                            data: JSON.stringify(data),
                            dataType: "json",
                            success: function (data) {
                                response(data.d);
                            },
                            error: function (result) {
                                //alert("No Match");
                            }
                        });




                    }
                });
            }

            $("#dr_nhomhang").change(function () {
                alert("adfas");
            });

            function printDiv(divId) {
                //debugger;
                //var delayInMilliseconds = 5000; //1000 = 1 second
                //setTimeout(function() {
                //  //your code to be executed after 1 second
                //}, delayInMilliseconds);
               try {
                    var tienhat = $("#MainContent_Button3").parent().parent().parent().find("b").eq(1).text(); 
                    var tenphong2 = $("#MainContent_Button3").parent().parent().find("b").eq(2).text(); 
                    var tongtien2 = $("#MainContent_Button3").parent().parent().find("b").eq(3).text();
                
                    var thantoan2 = $("#MainContent_Button3").parent().parent().find("b").eq(4).text();
                    var chietkau2 = $("#MainContent_Button3").parent().parent().find("b").eq(5).text();
                    var conlai2 = $("#MainContent_Button3").parent().parent().find("b").eq(6).text();  
                    
                    var sohoadon = $("#hoadonid").val();
                    //alert(sohoadon);                

                    //alert(tienhat);
                    //alert(tenphong2);
                    //alert(tongtien2);             
                    //alert(thantoan2);
                    //alert(chietkau2);
                    //alert(conlai2);
             
                    
                    //var printContents = document.getElementById(divId).innerHTML;
                    //var originalContents = document.body.innerHTML;

                    //document.body.innerHTML = printContents;

                    //window.print();    

                    //thanhtoanhoadon(tenphong2,tongtien2,chietkau2,thantoan2,conlai2,tienhat,sohoadon);

                    //document.body.innerHTML = originalContents;

                    // Mở một cửa sổ in mới
                    var printWindow = window.open('', '', 'height=400,width=400');
                    printWindow.document.write('<html><head><title>Print</title></head><body>');
                    // Lấy nội dung của div và ghi vào cửa sổ in
                    printWindow.document.write(document.getElementById(divId).innerHTML);
                    printWindow.document.write('</body></html>');
                    printWindow.document.close();
                    // Chờ cho cửa sổ in được load hoàn tất trước khi in
                    printWindow.onload = function() {
                        //printWindow.print();
                        window.print();  
                    };

                    //setTimeout(function() {
                    //location.reload();
                    //}, 1000);
  
                }
                catch(err) {
                 console.log(err.tostring());
                 alert(err.tostring());
                }
                
                
                
            }


        </script>

       

        <script>
            var str = '';
            var menu = new Contextmenu({
                name: "menu",
                wrapper: ".wrapper",
                trigger: ".item",
                item: [{
                    "name": "Click Event",
                    "func": "setText()",
                    "link": null,
                    "disable": false
                },
                {
                    "name": "External Link",
                    "link": "https://www.jqueryscript.net",
                    "disable": false
                },
                {
                    "name": "Disabled Item",
                    "disable": true
                },
                {
                    "name": "-"
                },
                {
                    "name": "Delete Method",
                    "func": "delItem()"
                },
                {
                    "name": "Update Method",
                    "func": "updateItem()"
                },
                {
                    "name": "Add Method",
                    "func": "addItem()"
                },
                {
                    "name": "-"
                },
                {
                    "name": "Remove Method",
                    "func": "removeMenu()"
                },
                {
                    "name": "Close The Menu"
                }
                ],
                target: "_blank",
                beforeFunc: function (ele) {
                    str = $(ele).text();
                }
            });

            function setText() {
                alert(str);
            }

            function addItem() {
                menu.add({
                    index: 0,
                    name: "New Item",
                    func: 'alert("New Item")',
                    link: null,
                    disable: false
                });
            }

            function delItem() {
                menu.del(4);
            }

            function removeMenu() {
                menu.destroy();
            }

            function updateItem() {
                menu.update({
                    index: 5,
                    name: "github",
                    func: "",
                    link: "https://www.jqueryscript.net",
                    disable: false
                });
            }
</script>
        <script type="text/javascript">

            var _gaq = _gaq || [];
            _gaq.push(['_setAccount', 'UA-36251023-1']);
            _gaq.push(['_setDomainName', 'jqueryscript.net']);
            _gaq.push(['_trackPageview']);

            (function () {
                var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
                ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
                var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
            })();

</script>
</asp:Content>
