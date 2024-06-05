<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Map.aspx.cs" Inherits="WebApplication1.Map" %>

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
        .printableArea {
            display: block !important;
           
        }              
    }
    @page {
    size: auto; /* hoặc kích thước khác */
    }

    

    </style>




   <%-- <link rel="stylesheet" href="../dist/contextmenu.css">
    <script src="../dist/contextmenu.js"></script>--%>
   
        <!-- Content Wrapper. Contains page content -->
     <%  string user = Session["username"].ToString(); %>
        <div class="wrapper">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-8">
                            <i style="font-size:16px; padding-top: 5px; color: black;">Chi tiết bàn/phòng : </i> <b style="font-size:22px; padding-top:5px; color:red" class="td_menu"></b> / Time:
                            <%--Day : <b style="font-size: 14px; color: blue" class="songaydung"></b>--%>
                            &nbsp;&nbsp;Gio : <b style="font-size: 14px; color: blue" class="sogiodung"></b>
                            &nbsp;&nbsp;Phut : <b style="font-size: 14px; color: blue" class="sophutdung"></b>
                            <b style="padding-right: 10px; margin-left: 10px; margin-top: 5px;">Giờ vào:</b>
                            <input id="checkinput1" style="width: 150px; margin-top: 10px;" name="checkinput1" value=""/>
                            <b style="padding-right: 10px; margin-left: 10px; margin-top: 5px;">Giờ ra:</b>
                            <input id="checkinput2" style="width: 150px; margin-top: 10px;" name="checkinput2" value=""/>
                            <b style="padding-right: 12px; margin-left: 10px;">Hình thức nghỉ:</b>
                            <input id="stylerender" style="width: 80px; background-color:aqua; " name="stylerender" value="" />
                           
                            

                            <b style="padding-right: 10px; margin-left: 10px;">Loại phòng:</b>
                            <input id="styleroom" style="width: 50px; " name="styleroom" value=""/>
                            <b style="padding-right: 10px; margin-left: 10px;">Ticket:</b>
                            <input  style="width: 80px;margin-left: 30px;" id="ticketid" name="ticket" />

                            <b style="padding-right: 10px; margin-left: 10px;">Gộp/chuyển:</b>
                            <b style="font-size: 14px; color: blue" id="thongbao"></b>

                            <b style="padding-right: 10px; margin-left: 10px;">kieu nghi:</b>
                            <b style="font-size: 14px; color: blue" id="kieunghiid"></b>

                            <div style="width:150px; float:right;">
                            <asp:DropDownList ID="dr_hinhthucnghi" runat="server" AppendDataBoundItems="true" 
                            DataTextField="hinhthucnghi" 
                            DataValueField="id" 
                            CssClass="form-control input-sm">
                            </asp:DropDownList>
                                </div>
                        </div>

                        <div class="col-sm-4">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><a href="#">Home</a></li>
                                <li class="breadcrumb-item active"> <a href="#" onclick="updateItem()">Chuyển bàn</a></li>
                                <li class="breadcrumb-item active"><a href="#" onclick="gopban()">Gộp bàn</a></li>
                                <li class="breadcrumb-item active"><a href="#" onclick="delItem()">Hủy bàn</a></li>
                                <li class="breadcrumb-item active"><a href="Danhmuc/DanhmucOrder.aspx" target="_blank" >Danh sách Order</a></li>
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
                        <!--khu vuc 1-->
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
                                            <ht id="hinhthuephong" hidden><%=rows["nhanghi"].ToString() %></ht>
                                            <ka id="karaokeid" hidden><%=rows["karaoke"].ToString() %></ka>
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

                       <!--khu vuc 2-->
                       <div class="card card-primary">                                                                      
                            <div class="card-header">
                                <h3 class="card-title"><%=tenkhuvuc2 %></h3>
                                <div class="card-tools">
                                    <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                                        <i class="fas fa-minus"></i>
                                    </button>
                                </div>
                            </div>
                            <div class="card-body">
                                
                                <div class="wrapper" id="myList">
                                    <ul>
                                        <%int p = 0; %>
                                        <%foreach (System.Data.DataRow rows in dt_getinfo_phong1.Rows)
                                            {%>
                                        <%p++;%>
                                        <li class="item" id="nametable_<%=p %>">
                                             <img src="/static/images/phongtrong.png" style="float:left; margin-left:3px; margin-top:3px;width:50px; height: 50px;">
                                            <p id="tenphong" style="float:left; margin-left: 5px; margin-top:3px;"><%=rows["tenphong"].ToString() %></p> 
                                            <t id="trangthai" hidden><%=rows["trangthai"].ToString()%></t>
                                            <d id="trangthaidatphong" hidden><%=rows["trangthaidatphong"].ToString() %></d>
                                            <dp id="trangthaidonphong" hidden><%=rows["trangthaidonphong"].ToString() %></dp>
                                            <lp id="loaiphong" style="float: left" hidden><label style="width: 100px; display: none;" name="loaiphong"><%=rows["loaiphongid"].ToString() %></label></lp>                                           
                                            <ht id="hinhthuephong" hidden><%=rows["nhanghi"].ToString() %></ht>
                                             <ka id="karaokeid" hidden><%=rows["karaoke"].ToString() %></ka>
                                            <tc id="tiencoc" style="width: 160px; float: left" hidden> Đặt trước :<label
                                                    style="width: 100px;display: none;" name="tiencoc">.../VNĐ</label>
                                            </tc>
                                        </li>                                           
                                        <%} %>
                                    </ul>
                                </div>
                               
                            </div>
                            <!-- /.card-body -->                         
                        </div>

                        <!--khu vuc 3-->
                        <div class="card card-primary">                                                                       
                            <div class="card-header">
                                <h3 class="card-title"><%=tenkhuvuc3 %></h3>

                                <div class="card-tools">
                                    <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                                        <i class="fas fa-minus"></i>
                                    </button>
                                </div>
                            </div>
                            <div class="card-body">
                                
                                <div class="wrapper" id="myList">
                                    <ul>
                                        <%int h = 0; %>
                                        <%foreach (System.Data.DataRow rows in dt_getinfo_phong3.Rows)
                                            {%>
                                        <%h++;%>
                                        <li class="item" id="nametable_<%=h %>">
                                             <img src="/static/images/phongtrong.png" style="float:left; margin-left:3px; margin-top:3px;width:50px; height: 50px;">
                                            <p id="tenphong" style="float:left; margin-left: 5px; margin-top:3px;"><%=rows["tenphong"].ToString() %></p> 
                                            <t id="trangthai" hidden><%=rows["trangthai"].ToString()%></t>
                                            <d id="trangthaidatphong" hidden><%=rows["trangthaidatphong"].ToString() %></d>
                                            <dp id="trangthaidonphong" hidden><%=rows["trangthaidonphong"].ToString() %></dp>
                                            <lp id="loaiphong" style="float: left" hidden><label style="width: 100px; display: none;" name="loaiphong"><%=rows["loaiphongid"].ToString() %></label></lp>                                           
                                            <ht id="hinhthuephong" hidden><%=rows["nhanghi"].ToString() %></ht>
                                             <ka id="karaokeid" hidden><%=rows["karaoke"].ToString() %></ka>
                                            <tc id="tiencoc" style="width: 160px; float: left" hidden> Đặt trước :<label
                                                    style="width: 100px;display: none;" name="tiencoc">.../VNĐ</label>
                                            </tc>
                                        </li>
                                           
                                        <%} %>
                                    </ul>
                                </div>
                               
                            </div>
                            <!-- /.card-body -->
                          
                        </div>

                        <!--khu vuc 4-->
                        <div class="card card-primary">                                                                       
                            <div class="card-header">
                                <h3 class="card-title"><%=tenkhuvuc4 %></h3>

                                <div class="card-tools">
                                    <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                                        <i class="fas fa-minus"></i>
                                    </button>
                                </div>
                            </div>
                            <div class="card-body">
                                
                                <div class="wrapper" id="myList">
                                    <ul>
                                        <%int f = 0; %>
                                        <%foreach (System.Data.DataRow rows in dt_getinfo_phong4.Rows)
                                            {%>
                                        <%h++;%>
                                        <li class="item" id="nametable_<%=f %>">
                                             <img src="/static/images/phongtrong.png" style="float:left; margin-left:3px; margin-top:3px;width:50px; height: 50px;">
                                            <p id="tenphong" style="float:left; margin-left: 5px; margin-top:3px;"><%=rows["tenphong"].ToString() %></p> 
                                            <t id="trangthai" hidden><%=rows["trangthai"].ToString()%></t>
                                            <d id="trangthaidatphong" hidden><%=rows["trangthaidatphong"].ToString() %></d>
                                            <dp id="trangthaidonphong" hidden><%=rows["trangthaidonphong"].ToString() %></dp>
                                            <lp id="loaiphong" style="float: left" hidden><label style="width: 100px; display: none;" name="loaiphong"><%=rows["loaiphongid"].ToString() %></label></lp>                                           
                                            <ht id="hinhthuephong" hidden><%=rows["nhanghi"].ToString() %></ht>
                                             <ka id="karaokeid" hidden><%=rows["karaoke"].ToString() %></ka>
                                            <tc id="tiencoc" style="width: 160px; float: left" hidden> Đặt trước :<label
                                                    style="width: 100px;display: none;" name="tiencoc">.../VNĐ</label>
                                            </tc>
                                        </li>
                                           
                                        <%} %>
                                    </ul>
                                </div>
                               
                            </div>
                            <!-- /.card-body -->
                          
                        </div>
                    </div>


                    <div class="col-md-6">
                        <div class="card card-secondary">
                            <div class="card-header">
                                <h3 class="card-title">Vị trí:<b id="nametable" class="td_menu" style="color:springgreen; font-size:22px;"></b></h3>

                                <i class="fa fa-plus-square" style="font-size: 24px; padding-left: 15px;"></i><b class="add_hanghoa" style="color: yellow; padding-left: 5px;">Thêm</b>

                                <i class="fa fa-pencil" style="font-size: 24px; padding-left: 15px;"></i><b class="editproduct" style="color: yellow; padding-left: 10px;">Sửa</b>

                                <i class="fa fa-times" style="font-size: 24px; padding-left: 15px;"></i><b class="delproduct" style="color: yellow; padding-left: 5px;">Xóa</b>

                                <i class="fa fa-save" style="font-size: 24px;color:blue; padding-left: 10px;"></i><b class="saveproduct" style="color: yellow; padding-left: 5px;">Ghi Thực đơn</b>
                               
                                <b class="addnew_KH" style="color: yellow; padding-left: 5px;">| Thêm KH</b>

                                <b style="color: yellow; padding-left: 5px;">| Xem lại HĐ</b>
                                <input type="checkbox" id="xemlaiHD" name="xemlaiHD">
                                

                               

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
                                                <span id="mahanghoa" hidden ></span>
                                                <asp:TextBox ID="txt_doc" Style="float: left; width: 100%;" class="ajax form-control input-sm" value="" placeholder="Chọn tên hàng" runat="server"></asp:TextBox>
                                            </td>
                                            <td style="padding-bottom: 10px; padding-right: 5px; padding-left: 5px;"><b style="color: black;">QTY </b></td>
                                            <td style="padding-bottom: 10px; padding-right: 10px;">
                                                <input id="soluong" name="soluong" class="soluong form-control input-sm" value="1" style="width: 50px;">
                                            </td>
                                           <%-- <td style="padding-bottom: 10px; padding-right: 10px; padding-left: 10px;">
                                                <label for="inmauto" style="float: left; margin-top: 5px;">inmauto</label>
                                                   <input type="checkbox" id="inmauto" name="inmauto" >
                                            </td>
                                            <td style="padding-bottom: 10px; padding-right: 10px; padding-left: 10px;">
                                                <label for="inmaunho" style="float: left; margin-top: 5px;">Inmaunho</label>
                                                <input type="checkbox" id="inmaunho" name="inmaunho" checked>
                                            </td>--%>

                                            <td style="padding-bottom: 10px; padding-right: 10px; padding-left: 10px;">                                              
                                                <asp:DropDownList ID="dr_nhacungcap" runat="server" AppendDataBoundItems="true" 
                                                    DataTextField="makh" 
                                                    DataValueField="id" 
                                                    CssClass="form-control input-sm">
                                                </asp:DropDownList>                                                                                                             
                                            </td>

                                            <td style="padding-bottom: 10px; padding-right: 10px; padding-left: 10px;">
                                                <b style="padding-right: 3px; margin-left: 10px;">Số HD:</b>
                                                <input  style="width: 120px;margin-left: 5px;" id="hoadonid" name="sohoadon" disabled />                                              
                                            </td>
                                            <td style="padding-bottom: 10px; padding-right: 10px; padding-left: 10px;">
                                                  <label for="inlaihoadon" style="float: left; margin-top: 5px;">In lại HĐ</label>
                                                <input type="checkbox" id="inlaiHD" name="inlaiHD">
                                            </td>

                                            
                                            <td style="padding-bottom: 10px; padding-right: 10px; padding-left: 10px;">
                                                 <input type="submit" value="Order bếp" id="orderbepid"  class="btn btn-success float-right" style="width:100px;float:left; margin-bottom:5px;">
                                               <%-- <input type="submit" value="Thanh toan" id="khachthanhtoan" class="btn btn-success float-right">  <%--class , id="saveproduct"--%>
                                            </td>
                                   

                                        </tr>
                                    </tbody>
                                </table>


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

                                 

                                <div class="row">
                                    <div class="col-2">
                                        <label for="tongtien" style="float: left; margin-top: 5px;">Tiền hàng</label>
                                        <input type="text" id="tongtienid" disabled class="form-control input-sm" name="fname" style="float: left; margin-left: 10px; font-size:22px;" value="0">
                                                     <span style="float: left;padding-left: 20px; padding-top: 10px;">

                                                     </span>
                                    </div>

                                    <div class="col-2">
                                         <label for="tongtien" style="float: left; margin-top: 5px;">Tiền giờ</label>  
                                        <input type="text" id="tiengioid" disabled class="form-control input-sm" name="fname" style="float: left; margin-left: 10px; font-size:22px;" value="0">                                                                              
                                         <span style="float: left;padding-left: 20px; padding-top: 10px;">
                                    </div>

                                    <div class="col-2">
                                        <label for="tongtien" style="float: left; margin-top: 5px;">Chiết khấu</label>
                                        <input type="text" id="chietkhauid" class="form-control input-sm" name="fname" style="float: left; margin-left: 10px; font-size:22px; background-color:aqua; color:black;" value="0">
                                         <span style="float: left;padding-left: 20px; padding-top: 10px;">      

                                         </span>
                                    </div>   

                                    
                                
                                    <div class="col-2">
                                        <label for="tongtien" style="float: left; margin-top: 5px;">Khách TT</label>
                                        <input type="text" id="thanhtoanid" class="form-control input-sm" name="fname" style="float: left; margin-left: 10px; font-size:22px; background-color:aqua; color:black;" value="0">                                                                              
                                         <span style="float: left;padding-left: 20px; padding-top: 10px;">

                                         </span>                                   
                                    </div>
                                    <div class="col-2">
                                        <label for="tongtien" style="float: left; margin-top: 5px; id="lblconlai" ">Còn lại</label>
                                        <input type="text" id="conlaiid" class="form-control input-sm" name="fname" style="float: left; margin-left: 10px; font-size:22px; background-color:aqua; color:black;" value="0">                                        
                                        <span style="float: left;padding-left: 20px; padding-top: 10px;">           
                                        </span>

                                    </div>

                                     

                                    <div class="col-2">
                                        <br />
                                        <input type="submit" value="Xem HD" id="khachthanhtoan2" class="btn btn-success float-right" style="width:100px;float:left; margin-bottom:5px;"><br />
                                        <input type="submit" value="Thanh toán" id="ghilaihoadon"  class="btn btn-success float-right" style="width:100px;float:left; margin-bottom:5px;">  <br />                                          
                                    </div>
                                                                                                                                                                                            
                                </div>
                                <div><b>Bằng chữ:</b> <span id="bangchuid2" style="font-weight:300; color:red; font-size:25px; padding-left:10px;"></span></div>
                                


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
                                                <li class="breadcrumb-item active"><a href="/Map.aspx"><b style="color:blue; font-size:20px;">Menu :</b> All </a></li>
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
                              
                                    <div class="card-body pb-0" style="overflow-y: scroll; height:550px;">
                                        <div class="row d-flex align-items-stretch">
                                            <%foreach (System.Data.DataRow rows1 in dt_listhanghoa.Rows)
                                                {%>
                                            <div class="col col-lg-2 d-flex align-items-stretch">
                                                <div class="row" style="border: 1px solid grey;">
                                                    <div class="col-12 text-center">
                                                       <%-- <img src="../../dist/img/user1-128x128.jpg" alt="user-avatar" class="img-circle img-fluid">--%>
                                                       <%-- <img src="../../dist/img/monan.JPG" alt="user-avatar" class="img-circle img-fluid" style="width:60px;height:50px;">--%>
                                                        <img src="<%=rows1["anh"].ToString() %>" alt="user-avatar" class="img-circle img-fluid" style="width:60px;height:50px;">

                                                        <div class="text-center" style="margin-bottom: 10px; margin-top: 3px;">
                                                            <mh><%=rows1["tenhang"].ToString() %></mh> <br /> <dg><%=rows1["giaban"].ToString() %></dg> /VNĐ
                                                            <input type="number" class="quantity form-control text-center" title="Số lượng" value="1" min="1"  id="quantity" name="quantity" style="width:60px;height:30px;float:left;" >                                                                                                                                                                                  
                                                            <a href="#" class="button_addmenu" id="add_sanpham" style="float:left;"><i class="fa fa-plus-square" style="font-size: 24px; padding-left: 20px;"></i></a>

                                                        </div>
                                                        

                                                    </div>
                                                </div>


                                            </div>

                                            <%} %>
                                        </div>
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

            <div class="modal" id="myModal">
            <div class="modal-dialog" >
                <div class="modal-content">
                    <div class="modal-header">
                        <div class="row">
                            <div>
                                <h4 class="modal-title" id="headerTag" style="float: left">Thêm mới khách hàng</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="float: right; margin-left: 300px;">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                        </div>
                    </div>


                    <div class="modal-body">
                       
                       <div class="container-fluid" id="printphieunhaphang" style="width:400px;height:auto;">
                                                                             
                           <div class="form-group">
                            <label for="recipient">Mã khách hàng:</label>
                               <input class="form-control" name="makhachhang" id="idmakh" type="text" placeholder="mancc" /> 
                               <%--<asp:TextBox ID="idmakh" runat="server" class="form-control" />--%>
                          </div>
                            <div class="form-group">
                            <label for="recipient">Tên KH:</label>
                                <input class="form-control" name="tenkhachhang" id="idtenkh" type="text" placeholder="tenkh" />  
                               <%-- <asp:TextBox ID="idtenkh" runat="server" class="form-control" />--%>
                          </div>
                           <div class="form-group">
                            <label for="recipient">Công nợ đến:</label>
                            <input class="form-control" type="text" id="idcongnoden" name="recipient" value="0">
                               <%--<asp:TextBox ID="idcongnoden" runat="server" class="form-control" Text="0" />--%>
                          </div>
                           <div class="form-group">
                            <label for="recipient">Công nợ đi:</label>
                            <input class="form-control" type="text" id="idcongnodi" name="recipient" value="0">
                            <%--   <asp:TextBox ID="idcongnodi" runat="server" class="form-control" Text="0" />--%>
                          </div>
                                                       
                        </div>
                                                                           
                    </div>

                    <div class="modal-footer">
                       <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fas fa-times"></i>Close</button>                         
                        <button type="button" runat="server" id="Button4"  class="btn btn-primary" onclick="addnewkhachhang()" >Save</button>                                                                                                                                                                     
                    </div>
                </div>
            </div>
        </div>

            <div class="modal" id="myModal6">
            <div class="modal-dialog modal-lg" >                 
                <div class="modal-content" >
                    <div class="modal-header">
                        <div class="row">
                            <div>
                                <h4 class="modal-title" id="headerTag" style="float: left">HÓA ĐƠN BÁN HÀNG</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="float: right; margin-left: 300px;">
                                    <span aria-hidden="true">&times;</span>
                                </button>                               
                            </div>
                        </div>
                    </div>


                    <div class="modal-body" id="printableArea" style="height:auto;">
                       
                       <%-- <div class="container-fluid"  style="width:400px;height:auto;float:left;">--%>
                       <div class="container-fluid"  style="width:700px;height:auto;">
                           <%--<span style="font-size:30px; text-align:center;color:black;"><%=tendovi %></span><br />   --%>                        
                          <%--<span hidden> Loại hình: </span><b id="hinhthucnghi2" hidden></b> &nbsp;&nbsp;&nbsp; <span hidden>Tổng tiền hát:</span> <b id="tongtienhat2" hidden></b><br />--%>
                           <%--<i style="color:black; font-size:24px;"> Địa chỉ: <%=diachidonvi %></i><b id="hinhthucnghi2" hidden></b> &nbsp;&nbsp;&nbsp; <span hidden>Tổng tiền hát:</span> <b id="tongtienhat2" hidden></b><br />
                           <i style="font-size:24px;">Số ĐT:</i> <span style="color:black; font-size:26px;"><%=sodtdonvi %></span><br />
                           <i style="font-size:24px;">Số HĐ:</i> <span id="sohoadon_" style="color:black; font-size:26px;"></span> &nbsp;&nbsp;&nbsp;<i style="font-size:24px;"> Ngày tạo :</i> <span id="ngaytao_" style="color:black;font-size:26px;"></span><br />                            
                           <i style="font-size:24px;">Tên bàn:</i> <b id="tenphong2" style="color:black; font-size:26px;"></b> &nbsp;&nbsp;&nbsp; <span hidden> tiền hàng:</span> <b id="tongtien2" hidden></b>          --%>                                            

                           <table style="width:686px;">
                                <tr>
                                    <td>
                                         <span style="float:left; margin-left:3px;"> 
                                              <span style="font-size:30px; text-align:center;color:black;"><%=tendovi %></span><br />                           
                                              <%--<span hidden> Loại hình: </span><b id="hinhthucnghi2" hidden></b> &nbsp;&nbsp;&nbsp; <span hidden>Tổng tiền hát:</span> <b id="tongtienhat2" hidden></b><br />--%>
                                               <i style="color:black; font-size:24px;"> Địa chỉ: <%=diachidonvi %></i><b id="hinhthucnghi2" hidden></b> &nbsp;&nbsp;&nbsp; <span hidden>Tổng tiền hát:</span> <b id="tongtienhat2" hidden></b><br />
                                               <i style="font-size:24px;">Số ĐT:</i> <span style="color:black; font-size:26px;"><%=sodtdonvi %></span><br />
                                               <i style="font-size:24px;">Số HĐ:</i> <span id="sohoadon_" style="color:black; font-size:26px;"></span> &nbsp;&nbsp;&nbsp;<i style="font-size:24px;"> Ngày tạo :</i> <span id="ngaytao_" style="color:black;font-size:26px;"></span><br />                            
                                               <i style="font-size:24px;">Tên bàn:</i> <b id="tenphong2" style="color:black; font-size:26px;"></b> &nbsp;&nbsp;&nbsp; <span hidden> tiền hàng:</span> <b id="tongtien2" hidden></b>    
                                         </span>
                                    </td>
                                    <td style="border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt">
                                        <span style="margin-left:25px;">
                                                 <i style="font-size:22px;color:black; text-align:center;">QRcode</i><br /><img id="barcodeImage" src="<%= barcodeData %>" alt="Barcode" style="width:100px;height:100px; margin-left:20px;" />
                                        </span>
                                    </td>                                    
                                </tr>                               
                            </table>
                           <div style="height:10px;"></div>
                                <div style="width: 100%;  float: left; height:auto ">  <%--height: 300px;--%>
                                    <table class="display table table-bordered dataTable no-footer">
                                        <thead>
                                            <tr>
                                                <th>Tên hàng</th>
                                                <th>Số lượng</th>
                                                <th>Đơn giá</th>
                                                <th>Thành tiền</th>                                                
                                            </tr>
                                            <tbody id="tbnhaphang_inhoadon" style="font-size:22px;color:black;">
                                            </tbody>


                                    </table>
                                </div>
                             <br /> 
                           <%--<span style="float:left; margin-left:410px; width:650px; color:black;font-size:26px; border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt">Tổng tiền: <b id="thantoan2" style="margin-left:12px;color:black;font-size:26px;"></b> &nbsp;&nbsp;&nbsp;</span><br /> --%>
                           <%--<span style="float:left; margin-left:445px; width:650px;color:black;font-size:22px;">C/K: <b id="chietkau2" style="margin-left:12px;color:black;font-size:22px;"></b></span> <br />--%>
                           <%--<span style="float:left; margin-left:370px; width:650px;color:black;font-size:22px;">KH thanh toán: <b id="khthanhtoan2" style="margin-left:12px;color:black;font-size:22px;"></b></span>--%>
                            <%--<span style="float:left; margin-left:420px; width:650px;color:black;font-size:22px;">Còn lại: <b id="psno2" style="margin-left:15px;color:black;font-size:22px;"></b>  </span> --%>

                            <table style="width:686px;">
                                <tr>
                                    <td style="border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt">
                                         <span style="float:left; margin-left:250px; color:black;font-size:26px;">Tổng tiền: <br /> </span>
                                    </td>
                                    <td style="border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt">
                                        <b id="thantoan2" style="margin-left:8px;color:black;font-size:26px;"></b> &nbsp;&nbsp;&nbsp;
                                    </td>                                    
                                </tr>
                                <tr>
                                    <td style="border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt">
                                         <span style="float:left; margin-left:250px; color:black;font-size:22px;">C/K: </span>
                                    </td>
                                    <td style="border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt">
                                        <b id="chietkau2" style="margin-left:8px;color:black;font-size:22px;"></b>
                                    </td>                                    
                                </tr>
                                <tr>
                                    <td style="border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt">
                                         <span style="float:left; margin-left:250px; color:black;font-size:22px;">KH thanh toán: </span>
                                    </td>
                                    <td style="border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt">
                                        <b id="khthanhtoan2" style="margin-left:8px;color:black;font-size:22px;"></b>
                                    </td>                                    
                                </tr>
                                <tr>
                                    <td style="border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt">
                                         <span style="float:left; margin-left:250px;color:black;font-size:22px;">Còn lại:</span>
                                    </td>
                                    <td style="border-top-style:solid;border-top-width:1pt;border-left-style:solid;border-left-width:1pt;border-bottom-style:solid;border-bottom-width:1pt;border-right-style:solid;border-right-width:1pt">
                                        <b id="psno2" style="margin-left:8px;color:black;font-size:22px;"></b>
                                    </td>                                    
                                </tr>
                            </table>
                           <div style="height:10px;"></div>
                           <div><i style="font-size:22px;color:black;">Bằng chữ:</i> <span id="bangchuid" style="color:black; font-size:26px; padding-left:10px;"></span></div>
                          <%-- <i style="font-size:22px;color:black;">Thanh toán chuyển khoản :</i><img id="barcodeImage" src="<%= barcodeData %>" alt="Barcode" style="width:100px;height:100px;" />--%>
                        </div>
                        
                        
                                                                           
                    </div>

                    <div class="modal-footer">
                       <%-- <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fas fa-times"></i>Close</button>--%>
                         <button type="button" runat="server" id="Button2"  class="btn btn-primary" onclick="printDiv_Close()" >Đóng</button>
                        <button type="button" runat="server" id="Button1"  class="btn btn-primary" onclick="printDiv_Save()" >Thanh toán</button>
                        <button type="button" runat="server" id="Button3"  class="btn btn-primary" onclick="printDiv('printableArea')" > 
                            <i class="fas fa-download"></i>
                            In hóa đơn
                        </button>                       
                        
                        

                    </div>
                </div>
            </div>
        </div>

        <div id="invoice" style="display: none; height:auto;"> 
          <h2>Phiếu Order bếp</h2>
          <table style="border: 1px solid black;">
            <tr style="border: 1px solid black;">
              <th>Tên Hàng</th>
              <th>Số Lượng</th>
                <th>Tên Bàn</th>
            </tr>
            <tbody id="invoiceItems">
              <!-- Dữ liệu hóa đơn sẽ được thêm vào đây sau khi nhấn nút "In Hóa Đơn" -->
            </tbody>
          </table>
        </div>


        </div>
        <!-- /.content-wrapper -->



        <%--  <script src="../plugins/jquery/jquery.min.js"></script>--%>
       <%-- <script src="../dist/contextmenu.js"></script>--%>
             
        <script>
            //const defaultNumbers =' hai ba bốn năm sáu bảy tám chín';
            const defaultNumbers =' Hai Ba Bốn Năm Sáu Bảy Tám Chín';
            const chuHangDonVi = ('1 Một' + defaultNumbers).split(' ');
            const chuHangChuc = ('Lẻ Mười' + defaultNumbers).split(' ');
            const chuHangTram = ('Không Một' + defaultNumbers).split(' ');

            function convert_block_three(number) {
                  if(number == '000') return '';
                  var _a = number + ''; //Convert biến 'number' thành kiểu string

                  //Kiểm tra độ dài của khối
                  switch (_a.length) {
                    case 0: return '';
                    case 1: return chuHangDonVi[_a];
                    case 2: return convert_block_two(_a);
                    case 3: 
                      var chuc_dv = '';
                      if (_a.slice(1,3) != '00') {
                        chuc_dv = convert_block_two(_a.slice(1,3));
                      }
                      var tram = chuHangTram[_a[0]] + ' Trăm';
                      return tram + ' ' + chuc_dv;
                  }
            };

            function convert_block_two(number) {
                  var dv = chuHangDonVi[number[1]];
                  var chuc = chuHangChuc[number[0]];
                  var append = '';

                  // Nếu chữ số hàng đơn vị là 5
                  if (number[0] > 0 && number[1] == 5) {
                    //dv = 'Lăm'
                    dv = 'Năm'
                  }

                  // Nếu số hàng chục lớn hơn 1
                  if (number[0] > 1) {
                    append = ' Mươi';
    
                    if (number[1] == 1) {
                      dv = ' Mốt';
                    }
                  }

              return chuc + '' + append + ' ' + dv; 
            };

            const dvBlock = '1 Nghìn Triệu Tỷ'.split(' ');

            function to_vietnamese(number) {
              var str = parseInt(number) + '';
              var i = 0;
              var arr = [];
              var index = str.length;
              var result = [];
              var rsString = '';

              if (index == 0 || str == 'NaN') {
                return '';
              }

              // Chia chuỗi số thành một mảng từng khối có 3 chữ số
              while (index >= 0) {
                arr.push(str.substring(index, Math.max(index - 3, 0)));
                index -= 3;
              }

              // Lặp từng khối trong mảng trên và convert từng khối đấy ra chữ Việt Nam
              for (i = arr.length - 1; i >= 0; i--) {
                if (arr[i] != '' && arr[i] != '000') {
                  result.push(convert_block_three(arr[i]));

                  // Thêm đuôi của mỗi khối
                  if (dvBlock[i]) {
                    result.push(dvBlock[i]);
                  }
                }
              }
              // Join mảng kết quả lại thành chuỗi string
              rsString = result.join(' ');

              // Trả về kết quả kèm xóa những ký tự thừa
              return rsString.replace(/[0-9]/g, '').replace(/ /g,' ').replace(/ $/,'');
            }

            function formatMoney(number) {
                return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
            }

            // Hàm để cập nhật số tiền hiển thị
            function updateTotalAmount(amount) {
                var formattedAmount = formatMoney(amount);
                document.getElementById('thantoan2').innerText = formattedAmount;
                document.getElementById('khthanhtoan2').innerText = formattedAmount;
                //document.getElementById('chietkau2').innerText = formattedAmount;
                //document.getElementById('psno2').innerText = formattedAmount;
            }
            
            

            $(document).ready(function () {

                //$('#txtid').prop("readonly", true);
                //$('#txtmaterial').prop("readonly", true);

                //$('#TOOLING_NO_ID').prop("readonly", true);
                //$('#CustomTooling_ID').prop("readonly", true);
                //$('#txt_ID').prop("readonly", true);
                               
                //lay so hoa don lon nhat
               
               //check trang thai ban phong co khach hay khong?
                
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
                        var trangthainhanghi = $(this).find('ht').text();
                        var trangthaikaraoke = $(this).find('ka').text();

                        if (trangthainhanghi == '1')
                        {
                            //alert('hotel');
                            $('#stylerender').val('hotel');  
                        }
                        else if (trangthaikaraoke == '1')
                        {
                            $('#stylerender').val('karaoke');
                        }
                        else
                        {
                            //alert('nhahang');
                            $('#stylerender').val('NH-CF');  
                        }


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
                                    var kieuthuenghi = objdata['Table'][0][7];

                                    var tientheogio = objdata['Table'][0][8];
                                    var tientheodem = objdata['Table'][0][9];
                                    var tientheongay = objdata['Table'][0][10];
                                    var tientheothang = objdata['Table'][0][11];
                                    var tienphutroi = objdata['Table'][0][12];
                                    var tienphutroiphut = objdata['Table'][0][13];
                                    var settingtimephutroi = objdata['Table'][0][14];
                                    //alert(parseInt(kieuthuenghi));
                                    //debugger;
                                   

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

                                    // Tính số mili giây giữa hai ngày
                                   var soMiligiay = date2.getTime() - date1.getTime();
                                    // Chuyển đổi số mili giây thành số giờ
                                    var soGio = soMiligiay / (1000 * 60 * 60);
                                    // In ra kết quả
                                   // console.log("Số giờ giữa hai ngày là: " + soGio);

                                    var diffHrs = Math.round((diffMs % 86400000) / 3600000); // hours   1gio = 3600000 , 1 ngay = 86400000 mililigiay
                                    var diffMins = Math.round(((diffMs % 86400000) % 3600000) / 60000); // minutes
                                    var diffDays = Math.round(diffMs / 86400000);

                                    var diffHrs_check = (diffMs % 86400000) / 3600000
                                    //var diffHrs_check2 =  parseFloat(diffMs % 86400000) / 3600000
                                    //alert(diffHrs_check);
                                    //alert(diffHrs_check2);

                                    //console.log(diffMs);    //so ngay
                                    //console.log(diffHrs);   //so gio
                                    //console.log(diffMins);  //so phut                                           
                                    //alert(diffDays);                                                                    
                                    
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
                                            if(soGio > 24)
                                            {
                                               //ngay lon hon 1 ngay
                                               //alert("vao a"+soGio);                                                
                                                $('.sogiodung').text(parseInt(soGio));
                                                $('.sophutdung').text(diffMins);
                                            }
                                            else
                                            {
                                                //alert("vap b");
                                                $('.sogiodung').text('0');
                                                $('.sophutdung').text(diffMins);
                                            }                                            
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

                                    var sogiodung = $(".sogiodung").text();
                                    var sophutdung = $(".sophutdung").text();
		                            var tongsophutdung = parseInt(sogiodung)*60+parseInt(sophutdung);
                                    //var hinhthucnghi = $('#stylerender').val();
                                    //var giohat = '0';//$('#ticketid').val();
                                    var tienhat1phut = 0;
                                    var tongtienhat = 0;
                                    var tongtiennghi = 0;
                                    var tongtienphutroi = 0;
                                    var phutroitheophut = 0;                                                                        

                                    if (hinhthucnghi == 'hotel') {
                                        //giohat = '0';
                                        if (parseInt(kieuthuenghi) == 1) {
                                            //nghi gio                                       
                                            $('#kieunghiid').text('nghi gio');
                                            //alert('vao1');
                                            if (parseInt(sogiodung) > 1)
                                            {
                                                if (parseInt(sophutdung) >= parseInt(settingtimephutroi))  
                                                {
                                                    phutroitheophut = tienphutroiphut;
                                                }
                                                else
                                                {
                                                    phutroitheophut = 0;
                                                }
                                                tongtienphutroi = (parseInt(sogiodung) - 1) * parseInt(tienphutroi) + parseInt(phutroitheophut);
                                                tongtiennghi = parseInt(tientheogio) + parseInt(tongtienphutroi);
                                                //alert(tongtienphutroi);
                                                //alert(tongtiennghi);
                                                tongtienhat = tongtiennghi;
                                            }
                                            else if (parseInt(sogiodung) == 1)
                                            {
                                                //if (parseInt(sophutdung) >= 30)
                                                if (parseInt(sophutdung) >= parseInt(settingtimephutroi))
                                                {
                                                    phutroitheophut = tienphutroiphut;
                                                }
                                                else
                                                {
                                                    phutroitheophut = 0;
                                                }
                                                tongtienphutroi = parseInt(phutroitheophut);
                                                tongtiennghi = parseInt(tientheogio)+ parseInt(tongtienphutroi);
                                                tongtienhat = tongtiennghi;
                                            }
                                            else
                                            {
                                                //sogiodung < 1 gio
                                                if (parseInt(sophutdung) >= parseInt(settingtimephutroi))
                                                {
                                                    //phutroitheophut = tienphutroiphut;
                                                    tongtiennghi = parseInt(tientheogio);
                                                }
                                                else
                                                {
                                                    //phutroitheophut = 0;
                                                    tongtiennghi = tienphutroiphut;
                                                }
                                                //tongtienphutroi = 0;                                                
                                                tongtienhat = tongtiennghi;
                                            }
                                        
                                        }
                                        else if (parseInt(kieuthuenghi) == 2)
                                        {
                                            //nghi dem                                        
                                            $('#kieunghiid').text('nghi dem');
                                            //alert('vao2');
                                            tongtiennghi = tientheodem;
                                            tongtienhat = tongtiennghi;
                                        }
                                        else if (parseInt(kieuthuenghi) == 3)
                                        {
                                            //nghi ngay                                        
                                            $('#kieunghiid').text('nghi ngay');
                                            //alert('vao3');
                                            if (diffDays == 0)
                                            {
                                                tongtiennghi = parseInt(tientheongay);
                                            }
                                            else
                                            {
                                                //so ngay * tien theo ngay
                                                tongtiennghi = parseInt(tientheongay)* parseInt(diffDays);
                                            }                                            
                                            tongtienhat = tongtiennghi;
                                        }
                                        else if (parseInt(kieuthuenghi) == 4)
                                        {
                                            //nghi thang                                      
                                            $('#kieunghiid').text('nghi thang');
                                            //alert('vao4');
                                             tongtiennghi = tientheothang;
                                            tongtienhat = tongtiennghi;
                                        }
                                        else
                                        {
                                            //nhahaang - cafe
                                            $('#kieunghiid').text('');
                                            //$('#MainContent_dr_hinhthucnghi').text('==kieunghi==');
                                        }                                       
                                    }
                                    else if (hinhthucnghi == 'NH-CF' || hinhthucnghi == 'Nhahang')
                                    {
                                        //alert('aaa');
                                        tongtienhat = 0;
                                        $('#kieunghiid').text('');
                                    }
                                    else
                                    {                                        
                                        //truonghop la karaoke
                                        tienhat1phut = parseInt(giohat)/60;
                                        tongtienhat = Math.round(tongsophutdung * tienhat1phut);   
                                        $('#kieunghiid').text('');
                                    }                                    
                                    //alert(giohat);
                                    //debugger; 
                                    //alert('asdfgadf');

                                    const bangchu_hienthi2 = to_vietnamese(parseInt(tienhang) + parseInt(tongtienhat));

                                    if (myArr == '0') {
                                        //truong hop chua co hang ban
                                        $('#tbnhaphang tr').remove();
                                        $('#tongtienid').val(0);                                        
                                        $('#thanhtoanid').val(0);
                                        $('#chietkhauid').val(0);
                                        $('#ticketid').val(0);
                                        //$('#stylerender').val('NH-CF');    
                                        //tiengioid  //conlaiid
                                        //$('#tiengioid').val(0);
                                        //alert('2'+tongtienhat);
                                        $('#tiengioid').val(0);
                                        $('#conlaiid').val(0);

                                        $('#bangchuid2').text('');

                                        
                                    } 
                                    else 
                                    {
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
                                            var thanhtien = soluong*dongia;//info_mahang[2];
                                            

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

                                        //$('#thanhtoanid').val(tienhang);
                                        $('#thanhtoanid').val(parseInt(tienhang)+parseInt(tongtienhat));

                                        $('#chietkhauid').val(0);
                                        $('#ticketid').val(giohat);
                                        $('#stylerender').val(hinhthucnghi);

                                        $('#tiengioid').val(tongtienhat);
                                        $('#conlaiid').val(0);

                                        $('#bangchuid2').text(bangchu_hienthi2);

                                        
                                    }
                                }
                                else {
                                    $('#tbnhaphang tr').remove();
                                    $('#tongtienhang').val(0);
                                    $('#thanhtoanid').val(0);
                                    $('#chietkhauid').val(0);
                                    $('#ticketid').val(0);
                                    //('#stylerender').val('NH-CF'); //hinhthucnghi_null                                    

                                    //$('#tiengioid').val(0);
                                    //alert(tongtienhat);
                                    $('#tiengioid').val(0);
                                    $('#conlaiid').val(0);

                                     $('#bangchuid2').text('');
                                }

                            },
                            error: function () {
                                //alert("No Match");
                            }
                        });


                    });
                });

            });

            function gopban() {
                //let newroom;
                //debugger;
                var tenphong1 = $("#nametable").text();
                //alert(tenphong1);
                let notice = prompt("Vui lòng nhập bàn cần gộp!");
                if (notice == null || notice == "") {
                    newroom = "Phong/ban null!";
                    alert(newroom);
                }
                else {
                    //newroom = "Phong moi chuyen: " + notice;
                    document.getElementById("thongbao").innerHTML = notice;
                    var newroom = notice;

                    //alert(tenphong1);                
                    if (tenphong1 == "") {
                        alert("Bạn cần chọn bàn cần gộp!");
                    }
                    else {
                        var nameitem = tenphong1;
                        var data = { nameitem: nameitem, newroom: newroom };
                        $.ajax({
                            type: "POST",
                            contentType: "application/json; charset=utf-8",
                            url: "Map.aspx/gopphongban",
                            data: JSON.stringify(data),
                            dataType: "json",
                            success: function (data) {
                                //response(data.d);
                                //alert(data.d);
                                if (data.d != "NG") {
                                    alert('Gộp bàn thành công!');
                                    $("#myList UL LI").each(function () {
                                        var nameroom = $(this).find('#tenphong').text();
                                        if (nameroom == nameitem) {
                                            $(this).find("img").attr('src', '/static/images/cokhach.png');
                                        }
                                        if (nameroom == newroom) {
                                             $(this).find("img").attr('src', '/static/images/phongtrong.png');                                           
                                        }
                                    })
                                }
                                else {
                                    alert('Gộp bàn NG!!!');
                                }
                            },
                            error: function (result) {
                                //alert("No Match");
                            }
                        });
                    }
                }
            }

            function updateItem() {
                //let newroom;
                //debugger;
                var tenphong1 = $("#nametable").text();
                //alert(tenphong1);
                let notice = prompt("Vui long nhap ban/phong can chuyen!");
                if (notice == null || notice == "") {
                    newroom = "Phong/ban null!";
                    alert(newroom);
                }
                else {
                    //newroom = "Phong moi chuyen: " + notice;
                    document.getElementById("thongbao").innerHTML = notice;
                    var newroom = notice;

                    //alert(tenphong1);                
                    if (tenphong1 == "") {
                        alert("ban can chon phong can chuyen!");
                    }
                    else {
                        var nameitem = tenphong1;
                        var data = { nameitem: nameitem, newroom: newroom };
                        $.ajax({
                            type: "POST",
                            contentType: "application/json; charset=utf-8",
                            url: "Map.aspx/chuyenphongban",
                            data: JSON.stringify(data),
                            dataType: "json",
                            success: function (data) {
                                //response(data.d);
                                //alert(data.d);
                                if (data.d != "NG") {
                                    alert('Chuyen ban thành công!');
                                    $("#myList UL LI").each(function () {
                                        var nameroom = $(this).find('#tenphong').text();
                                        if (nameroom == nameitem) {
                                            $(this).find("img").attr('src', '/static/images/phongtrong.png');
                                        }
                                        if (nameroom == newroom) {
                                            $(this).find("img").attr('src', '/static/images/cokhach.png');
                                        }
                                    })
                                }
                                else {
                                    alert('Chuyen ban/phong NG!!!');
                                }
                            },
                            error: function (result) {
                                //alert("No Match");
                            }
                        });
                    }
                }
            }

            function delItem() {
                //menu.del(4);
                //debugger;
                var tenphong1 = $("#nametable").text();
                //alert(tenphong1);
                var nameitem = tenphong1;
                var userid = '<%=Session["username"].ToString()%>';
                var data = { nameitem: nameitem, userid: userid };

                 if(confirm("Bạn có chắc muốn hủy? Bấm OK để tiếp tục!") == true){
                        //document.getElementById("demo").innerHTML = 
                        //"Bạn muốn tiếp tục";
                     //console.log('Bạn muốn tiếp tục');
                        $.ajax({
                            type: "POST",
                            contentType: "application/json; charset=utf-8",
                            url: "Map.aspx/huyphongban",
                            data: JSON.stringify(data),
                            dataType: "json",
                            success: function (data) {
                                //response(data.d);
                                //alert(data.d);
                                if(data.d != "NG")
                                {
                                    alert('Huy ban thành công!');
                                    $("#myList UL LI").each(function () {
                                        var nameroom = $(this).find('#tenphong').text();                                        
                                        if (nameroom == tenphong1) {
                                            //alert(nameroom);
                                            $(this).find("img").attr('src','/static/images/phongtrong.png');
                                        }
                                    })

                                }
                                else
                                {
                                    alert('NG!!!');
                                }
                            },
                            error: function (result) {
                                //alert("No Match");
                            }
                        });                
                 }
                 else
                 {
                        //document.getElementById("demo").innerHTML = 
                        // "Bạn không muốn tiếp tục";
                      console.log('Bạn không muốn tiếp tục');
                    }
            }

            $('#ghilaihoadon').click(function () 
            {
                var checkbox = document.getElementById('xemlaiHD');
                if (checkbox.checked == true)
                {
                        alert('Ban o che do xem lai hoa don!');                      
                }
                else
                {
                    thanhtoanhoadon2();
                }                 
                //printDiv_Save();    //toi lam tiep
            });

            $('#orderbepid').click(function () 
            {
                var checkbox = document.getElementById('xemlaiHD');
                if (checkbox.checked == true)
                {
                        alert('Ban o che do xem lai hoa don!');                      
                }
                else
                {
                    var tenphong = $('#nametable').text();
                    var itemdata = {};

                    $('.themthucdon').each(function () {                        
                        var mahang = $(this).find('td').eq(0).text() + "," + $(this).find('td').eq(2).text() + "," + $(this).find('td').eq(3).text();
                        var soluong = $(this).find('td').eq(1).text();                       
                        if (mahang != "") {                           
                            itemdata[mahang] = parseInt(soluong);                            
                        }
                    });                                       
                    var data = {                       
                        tenphong: tenphong,                       
                        items: JSON.stringify(itemdata)
                    };
                    $.ajax({
                            type: "POST",
                            contentType: "application/json; charset=utf-8",
                            url: "Map.aspx/Ordernhabep",
                            //data: JSON.stringify(data),
                            data: JSON.stringify(data),
                            dataType: "json",
                            success: function (data) {
                                const objdata = $.parseJSON(data.d);    
                                //debugger;                      
                                $('#invoiceItems tr').remove();                                     
                                for (var i = 0; i < objdata['Table'].length - 1; i++) {
                                    //console.log(objdata['Table1'].length);
                                    var tenhang = objdata['Table'][i][0];
                                    var soluong = objdata['Table'][i][1];
                                    var banid = objdata['Table'][i][2];
                                    var solanin = objdata['Table'][i][3];                                                                  
                                    var newrow = '<tr class="thongtinnhabep">' +
                                        '<td id="_hanghoad" style="width:250px; border-top-style:solid;border-top-width:1pt;">' + tenhang + '</td>' +
                                        '<td id="_tienhang" style="border-top-style:solid;border-top-width:1pt;">' + soluong + '</td>' +
                                        '<td id="_loaihoadon" style="border-top-style:solid;border-top-width:1pt;">' + banid + '</td>' +
                                        //'<td id="_loaihoadon" style="border: 1px soild black;">' + solanin + '</td>' +                                                                         
                                        '</tr>';
                                   $('#invoiceItems').append(newrow);                                                                        
                                }
                               
                                //$("#invoice").show();
                                // Gọi hàm để in
                               printElement('invoice');
                            },
                            error: function () {
                                //alert("No Match");
                            }
                         });
                }                 
                //printDiv_Save();    //toi lam tiep
            });

            var printWindow = null; // Biến lưu trữ cửa sổ in
            // Hàm in một phần tử HTML
            function printElement(elementId) {                            
             var divContents = document.getElementById("invoice").innerHTML;                 
                //if (printWindow !== null) {                
                //        if (printWindow.location.href !== window.location.href) {
                //            printWindow.close();
                //        }
                //}               
                //printWindow = window.open('', '', 'height=500, width=1000'); 
                //printWindow.document.write('<html>'); 
                //printWindow.document.write('<body >'); 
                //printWindow.document.write(divContents); 
                //printWindow.document.write('</body></html>'); 
                //printWindow.document.close(); 
                // In
                //printWindow.print(); 
                // Đợi sự kiện in hoàn tất và đóng cửa sổ in
                //printWindow.onafterprint = function() {
                    //printWindow.close();
                //     if (printWindow.location.href !== window.location.href) {
                //            printWindow.close();
                //        }
                //};

//var content = document.getElementById("contentToPrint").innerHTML;
    var printWindow = window.open('','','height=500, width=1000', '_blank');
    printWindow.document.open();
    printWindow.document.write('<html><head><title>Print</title></head><body onload="window.print(); window.close()">' + divContents + '</body></html>');
    printWindow.document.close();
    printWindow.print(); // In trực tiếp từ cửa sổ đã mở
    printWindow.close(); // Đóng cửa sổ in

            }  
               

            $('.addnew_KH').click(function () {
             $('#myModal').modal('show');
            });

             function addnewkhachhang()
             {             
                 var idmakh = $("#idmakh").val();
                 var makhachang = idmakh;
                 var idtenkh = $("#idtenkh").val();
                 var idcongnoden = $("#idcongnoden").val();
                 var idcongnodi = $("#idcongnodi").val();
                 var data = { idmakh: idmakh, idtenkh: idtenkh, idcongnoden: idcongnoden, idcongnodi: idcongnodi };
                 $.ajax({
                            type: "POST",
                            contentType: "application/json; charset=utf-8",
                            url: "Map.aspx/Savekhachhang",
                            //data: JSON.stringify(data),
                            data: JSON.stringify(data),
                            dataType: "json",
                            success: function (data) {
                                 //debugger;
                                //alert('Hoa don thêm thành công!');
                                if (data.d != "NG") {                               
                                    alert('Hoa don thêm thành công!');    
                                    //var newItem = $("<option>").attr("value", data.id).text(data.name);
                                   // debugger;
                                    var idop = data.d.split(',');
                                    var _id = idop[0];
                                    var _name = idop[1];
                                    var newItem = $("<option>").attr("value", _id).text(_name);
                                    $("#MainContent_dr_nhacungcap").append(newItem);

                                    $("#idmakh").val('');
                                    $("#idtenkh").val('');
                                    $("#idcongnoden").val('0');
                                    $("#idcongnodi").val('0');
                                } else {
                                    alert('Kiểm tra lại thông tin!');
                                }
                           
                            },
                            error: function () {
                                //alert("No Match");
                            }
                         });

             }
            

            $('#khachthanhtoan2').click(function () {  
                var checkbox = document.getElementById('xemlaiHD');
                if (checkbox.checked == true) {
                    //che do xem lai hoa don
                    alert('Ban o che do xem lai hoa don!');
                }
                else
                {
                    //save hoa don truoc
                    var itemdata = {};
                    var tenphong = $('#nametable').text();//dj('#name_room').text();
                    var tienhang = $('#tongtienid').val(); 
                    var kieunghi = $('#MainContent_dr_hinhthucnghi').val();

                    var userid = '<%=Session["username"].ToString()%>';

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

                    var tiengiohat = $('#tiengioid').val();
                    var tienck = $('#chietkhauid').val();
                    var khthanhtoan2 = $('#thanhtoanid').val();
                    var tienthoi = $('#conlaiid').val();
                    //alert(tienthoi);

                    const hienthi_bangchu = to_vietnamese(khthanhtoan2);

                    if (tenphong != "") {
                        $('.themthucdon').each(function () {
                            //var dongia = $(this).find('td').eq(2).text();
                            //var thanhtien = $(this).find('td').eq(3).text()
                            //var changedongia = Math.round(parseFloat(dongia.replace(/\./g, '').replace(',', '.')));
                            //var changethanhtien = Math.round(parseFloat(thanhtien.replace(/\./g, '').replace(',', '.')));

                            //var mahang = $(this).find('td').eq(0).text() + "," + changedongia + "," + changethanhtien;
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
                            kieunghi: kieunghi,
                            tenphong: tenphong,
                            tienhang: tienhang,
                            items: JSON.stringify(itemdata),
                            userid: userid
                        };
                        //alert(items);
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
                                        var ngaytao = objdata['Table'][0][15]; 
                                        var _sohoadon = objdata['Table'][0][6]; 
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
                                            //debugger;
                                            //var aaa = blkstr[0];
                                            //var bbb = blkstr[1];
                                            for (var i = 0; i < blkstr.length; i++) {
                                                const chars = blkstr[i].split(':');
                                                const info_mahang = chars[0].split(',');

                                                var mahang = info_mahang[0];
                                                var dongia = info_mahang[1];
                                                var soluong = chars[1];
                                                var thanhtien = soluong*dongia;//info_mahang[2];
                                            

                                                var newrow = '<tr class="themthucdon2">' +
                                                    '<td id="tenhang" style="border: 1px soild black;">' + mahang + '</td>' +
                                                    '<td id="soluong" style="border: 1px soild black;">' + soluong + '</td>' +
                                                    '<td id="giale" style="border: 1px soild black;">' + parseInt(dongia).toLocaleString('vi-VN') + '</td>' +
                                                    '<td id="thanhtien" style="border: 1px soild black;">' + parseInt(thanhtien).toLocaleString('vi-VN') + '</td>' +                                               
                                                    '</tr>';
                                                $('#tbnhaphang_inhoadon').append(newrow);                                                                                           
                                            }
                                            //$('#checkinput1').val(giovao);
                                            //$('#checkinput2').val(giora);                                                                
                                            $("#tenphong2").text(tenphong);

                                            var khachTT = parseInt(tienhang) + parseInt(tongtienhat);
                                            var formattedTienHang = parseInt(tienhang).toLocaleString('vi-VN');
                                            var formattedkhachTT = khachTT.toLocaleString('vi-VN');
                                            var formattedtienck = parseInt(tienck).toLocaleString('vi-VN');

                                            $('#tongtien2').text(formattedTienHang);
                                            $('#thantoan2').text(formattedkhachTT);
                                            $('#chietkau2').text(formattedtienck);                                                                                    
                                            var fkhthanhtoan2 = parseInt(khthanhtoan2).toLocaleString('vi-VN');                                            
                                            var ftienthoi = parseInt(tienthoi).toLocaleString('vi-VN');
                                                                        
                                            $('#khthanhtoan2').text(fkhthanhtoan2);
                                            $('#psno2').text(ftienthoi);

                                             //$('#tongtien2').text(tienhang);
                                            //$('#thantoan2').text(parseInt(tienhang)+parseInt(tongtienhat));
                                            //$('#chietkau2').text(tienck);   

                                            $('#sohoadon_').text(_sohoadon);
                                            $('#ngaytao_').text(ngaytao);
                                        
                                            $('#hinhthucnghi2').text(hinhthucnghi);
                                            $('#tongtienhat2').text(tongtienhat);

                                            //var tongtienhienthi = parseInt(tienhang) + parseInt(tongtienhat);
                                            //updateTotalAmount(tongtienhienthi);
                                            //updateTotalAmount(khthanhtoan2);

                                            //updateTotalAmount(tienck);
                                            //updateTotalAmount(tienthoi);

                                            $('#bangchuid').text(hienthi_bangchu);
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
                }
                
            })            

            function thanhtoanhoadon(tenphong2,tongtien2,chietkau2,thantoan2,conlai2,tienhat,sohoadon,idkhachhang)
            {
                var sohd_goc = sohoadon;//$('#hoadonid').val();
                var unitnohd = sohd_goc.split('_');
                //var sohoadon = parseInt($('#hoadonid').val()) + 1;
                var sohoadon_new = unitnohd[0] + "_" + (parseInt(unitnohd[1]) + 1);

                //debugger;
                //var psco = thantoan2;//$('#thanhtoanid').val();
                //var tongtienhang = tongtien2;//$('#tongtienid').val();
                //var tienck = chietkau2;//$('#chietkhauid').val();
                var tongtienhat = tienhat; 


                var psco = Math.round(parseFloat(thantoan2.replace(/\./g, '').replace(',', '.')));
                var tongtienhang = Math.round(parseFloat(tongtien2.replace(/\./g, '').replace(',', '.')));
                var tienck = Math.round(parseFloat(chietkau2.replace(/\./g, '').replace(',', '.')));
                //alert(psco);
                //alert(tongtienhang);
                //alert(tienck);

                //them tien phong de thanh toan khach san - nha nghi
                var tongtienphong = 0;
                var tiengiock = $('#tiengioid').val();
                if($('#stylerender').val() == 'hotel')
                {
                    tongtienphong = tiengiock;
                }

               
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
                        var dongia = $(this).find('td').eq(2).text();
                        var thanhtien = $(this).find('td').eq(3).text() 

                        var changedongia = Math.round(parseFloat(dongia.replace(/\./g, '').replace(',', '.')));
                        var changethanhtien = Math.round(parseFloat(thanhtien.replace(/\./g, '').replace(',', '.')));    
                    
                        var mahang = $(this).find('td').eq(0).text() + "," + changedongia + "," + changethanhtien;
                        //var mahang = $(this).find('td').eq(0).text() + "," + $(this).find('td').eq(2).text() + "," + $(this).find('td').eq(3).text();
                        var soluong = $(this).find('td').eq(1).text();                       
                        if (mahang != "") {                           
                            itemdata[mahang] = parseInt(soluong);                            
                        }
                });  
                //alert(itemdata);
                    var data = {
                        idkhachhang:idkhachhang,
                        tenphong: tenphong,
                        tongtienhang: tongtienhang,
                        tongtienhat: tongtienhat,
                        tongtienphong:tongtienphong,
                        psco:psco,
                        tienno: psno,
                        tienck:tienck,
                        items: JSON.stringify(itemdata)
                    };

                    if(psno < 0)
                    {
                        //alert("cong no < 0");
                        if(idkhachhang == "")
                        {
                            alert("Ban phai chon KH cong no!");
                        }
                        else
                        {
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
                                            alert('Hoa don them thành công!');
                                            $('#tbnhaphang tr').remove();
                                            $('#tongtienid').val(0);                                        
                                            $('#thanhtoanid').val(0);
                                            $('#chietkhauid').val(0);
                                
                                            $('#stylerender').val('');
                                            $('#ticketid').val(0);
                                
                                            //$('#hoadonid').val(parseInt(sohoadon) + 1);
                                            $('#hoadonid').val(sohoadon_new);

                                            $('#conlaiid').val('0'); 
                                            $('#tiengioid').val('0');

                                            //pending -> doi trang thai khi thanh cong -> khong co kach

                                            $("#myList UL LI").each(function () {
                                                var nameroom = $(this).find('#tenphong').text();
                                                if (nameroom == tenphong) {
                                                    $(this).find("img").attr('src', '/static/images/phongtrong.png');
                                                }
                                            });
                                            $('#bangchuid2').text('');

                                            //load lai trang khi thanh cong
                                            //setTimeout(function() {
                                            //location.reload();
                                            //}, 1000);
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
                    }
                    else
                    {

                        //alert("khong co cong no");
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
                                        alert('Hoa don them thành công!');
                                        $('#tbnhaphang tr').remove();
                                        $('#tongtienid').val(0);                                        
                                        $('#thanhtoanid').val(0);
                                        $('#chietkhauid').val(0);
                                
                                        $('#stylerender').val('');
                                        $('#ticketid').val(0);
                                
                                        //$('#hoadonid').val(parseInt(sohoadon)+1);
                                        $('#hoadonid').val(sohoadon_new);

                                        //pending -> doi trang thai khi thanh cong -> khong co kach
                                         $("#myList UL LI").each(function () {
                                                var nameroom = $(this).find('#tenphong').text();
                                                if (nameroom == tenphong) {
                                                    $(this).find("img").attr('src', '/static/images/phongtrong.png');
                                                }
                                        });

                                        $('#bangchuid2').text('');

                                        //load lai trang khi thanh cong
                                        //setTimeout(function() {
                                        //location.reload();
                                        //}, 1000);
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

                    
            }

            $('#chietkhauid').on('change', function () { 
            var textcheck = $('#chietkhauid').val();
            //var tongtienhang = $("#thanhtoanid").val();
                var tongtienhang = $("#tongtienid").val();
                var tongtiengio = $("#tiengioid").val();
            if (textcheck.includes("%")) {
                //alert("TextBox chứa ký tự phần trăm (%)");
                var removeKytu = $("#chietkhauid").val().replace(/%/g, "");
                //alert(removeKytu);
                if(parseInt(removeKytu) <= 100) // <100%
                {
                    var tienck = parseFloat(removeKytu)*parseFloat(tongtienhang)/100;
                    //alert(tienck);
                    //var tongtienthanhtoan =(parseFloat(tongtienhang) - parseFloat(tienck)) ; //;$("#thanhtoanid").val();
                    var tongtienthanhtoan =(parseFloat(tongtienhang)+parseFloat(tongtiengio) - parseFloat(tienck)) ;
                    $("#chietkhauid").val(tienck);
                    $("#thanhtoanid").val(tongtienthanhtoan);

                    const bangchu_hienthi2 = to_vietnamese(tongtienthanhtoan);
                    $('#bangchuid2').text(bangchu_hienthi2);
                }
                else
                {
                    alert("Gia tri vuot qua 100%");
                }               
            }
            else
            {               
                var tienck = $("#chietkhauid").val();
                //var tongtienthanhtoan =(parseFloat(tongtienhang) - parseFloat(tienck)) ; //;$("#thanhtoanid").val();
                var tongtienthanhtoan =(parseFloat(tongtienhang)+parseFloat(tongtiengio) - parseFloat(tienck)) ; //;$("#thanhtoanid").val();
                $("#thanhtoanid").val(tongtienthanhtoan);  

                const bangchu_hienthi2 = to_vietnamese(tongtienthanhtoan);
                $('#bangchuid2').text(bangchu_hienthi2);

            }
                                   
            });

            $('#thanhtoanid').on('change', function () { 
                var tongtienhang = $("#tongtienid").val();
                var tongtiengio = $("#tiengioid").val();
                var tienck = $("#chietkhauid").val();
             var tongtienthanhtoan = $("#thanhtoanid").val();
             var conlai = (parseFloat(tongtienthanhtoan) - (parseFloat(tongtienhang)+parseFloat(tongtiengio)-parseFloat(tienck))) 
              //var tienthoi = (parseFloat(psco) - parseFloat(tongtienhang)) 
             var psno='';
            if (conlai < 0) {
                        //$('#lblconlai').text("Tiền thiếu :");
                $('#conlaiid').val(conlai);
                psno = conlai;
            }
            else
            {
                        //$('#lblconlai').text("Tiền thừa :");
                $('#conlaiid').val(conlai);
                psno = '0';
             }
             //alert(psno);               
         });

            function thanhtoanhoadon2()
            {
               //debugger;
               
                var psco = $('#thanhtoanid').val();
                var tongtienhang = $('#tongtienid').val();
                var tienck = $('#chietkhauid').val();

                var idkhachhang = $('#MainContent_dr_nhacungcap').val();  
                //alert(idkhachhang); 

                var sogiodung = $(".sogiodung").text();
                var sophutdung = $(".sophutdung").text();
                
                var tongsophutdung = parseInt(sogiodung)*60+parseInt(sophutdung);
                var hinhthucnghi = $('#stylerender').val();
                var giohat = '0';//$('#ticketid').val();
                var tienthoi = '0';
                var tongtienphong = 0;
                if(hinhthucnghi == 'Karaoke')
                {
                    giohat = $('#ticketid').val();
                }
                
                var tienhat1phut = parseInt(giohat)/60;
                var tongtienhat = Math.round(tongsophutdung * tienhat1phut);

                //var tongtienhat =  tienhat;
                var tiengiock = $('#tiengioid').val();
                if(hinhthucnghi == 'hotel')
                {
                    tongtienphong = tiengiock;
                }
                if (tiengiock != '0')
                {                    
                    var tienthoi = (parseFloat(psco) - parseFloat(tongtienhang)) - parseFloat(tiengiock);
                }
                else
                {                   
                    var tienthoi = (parseFloat(psco) - parseFloat(tongtienhang));
                }
                //var tienthoi = (parseFloat(psco) - parseFloat(tongtienhang)) 
               
                if (tienthoi < 0) {
                            $('#lblconlai').text("Tiền thiếu :");
                            $('#conlaiid').val(tienthoi);
                        } else {
                            $('#lblconlai').text("Tiền thừa :");
                            $('#conlaiid').val(tienthoi);
                        }
                var tenphong = $('#nametable').text();
                var psno = $('#conlaiid').val();
                var itemdata = {};
                //BH_113
                var sohd_goc = $('#hoadonid').val();
                var unitnohd = sohd_goc.split('_');
                //var sohoadon = parseInt($('#hoadonid').val()) + 1;
                var sohoadon = unitnohd[0] + "_" + (parseInt(unitnohd[1]) + 1);
                
                //alert(sohoadon);

                $('.themthucdon').each(function () {                        
                        var mahang = $(this).find('td').eq(0).text() + "," + $(this).find('td').eq(2).text() + "," + $(this).find('td').eq(3).text();
                        var soluong = $(this).find('td').eq(1).text();                       
                        if (mahang != "") {                           
                            itemdata[mahang] = parseInt(soluong);                            
                        }
                    });                                       
                var data = {
                        idkhachhang: idkhachhang,
                        tenphong: tenphong,
                        tongtienhang: tongtienhang,
                        tongtienhat: tongtienhat,
                        tongtienphong:tongtienphong,
                        psco:psco,
                        tienno: psno,
                        tienck:tienck,
                        items: JSON.stringify(itemdata)
                    };

                   // setInterval(function () {
               //ajax de load du lieu
            //}, 5000); // Làm mới dữ liệu mỗi 5 giây

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
                                alert('Hoa don them thành công!');
                                $('#tbnhaphang tr').remove();
                                $('#tongtienid').val(0);                                        
                                $('#thanhtoanid').val(0);
                                $('#chietkhauid').val(0);
                                
                                $('#stylerender').val('');
                                $('#ticketid').val(0);

                                $('#conlaiid').val('0'); 
                                $('#tiengioid').val('0');
                                
                                //$('#hoadonid').val(parseInt(sohoadon) + 1);
                                $('#hoadonid').val(sohoadon);
                                

                                //pending -> doi trang thai khi thanh cong -> khong co kach

                                $("#myList UL LI").each(function () {
                                        var nameroom = $(this).find('#tenphong').text();
                                        if (nameroom == tenphong) {
                                            $(this).find("img").attr('src','/static/images/phongtrong.png');
                                        }
                                })
                                $('#bangchuid2').text('');

                                //load lai trang khi thanh cong
                                //setTimeout(function() {
                                //location.reload();
                                //}, 1000);
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
            };

            function doSomethingTimer() {
                // Thực hiện các công việc bạn muốn thực hiện sau mỗi khoảng thời gian
                console.log("Doing something...");
                $("#myList UL LI").each(function () {
                    //var nameroom = $(this).find('#tenphong').text();
                    var currentListItem = $(this); // Lưu lại ngữ cảnh this trong một biến
                    var nameroom = currentListItem.find('#tenphong').text();

                    //lay ra trang thai cua phong / ban de load lai hinh anh co khach hay khong?
                    var data = { nameroom: nameroom };
                     $.ajax({
                            type: "POST",
                            contentType: "application/json; charset=utf-8",
                            url: "Map.aspx/timer_thongtintrangthaiphong",
                            //data: JSON.stringify(data),
                            data: JSON.stringify(data),
                            dataType: "json",
                            success: function (data) {
                                //alert('Hàng hóa đã được thêm thành công!');
                                if (data.d != "NG") {
                                    var idop = data.d.split(',');
                                    var trangthai = idop[0];
                                    var tenphong = idop[1];
                                    
                                    //Console.log(trangthai);
                                    //console.log(tenphong);
                                    if (trangthai == '1' && tenphong == nameroom) {
                                        //alert(tenphong);                                        
                                        //$(this).find("img").attr('src','/static/images/cokhach.png');
                                        currentListItem.find("img").attr('src','/static/images/cokhach.png');
                                    }
                                    else {
                                        //$(this).find("img").attr('src','/static/images/phongtrong.png');
                                        currentListItem.find("img").attr('src','/static/images/phongtrong.png');
                                    }
                                    //co the xu ly cac truong hop chua don phong, dat phong
                                } else {
                                    //nothing
                                    //toan bo ban phong khong co khach
                                }
                                //consolog.log(data.d);
                                 //$('#myList UL LI').find("img").attr('src','/static/images/cokhach.png');
                            },
                            error: function () {
                                //alert("No Match");                                
                            }
                        });
                });

            }

            // Thực hiện hàm doSomething() sau mỗi 1000ms (1 giây)
            var intervalId = setInterval(doSomethingTimer, 60000);
            

            // nut ghi lai danh sach thuc don
            $('.saveproduct').click(function () {
                //alert("ádfsa");
                var itemdata = {};
                var tenphong = $('#nametable').text();//dj('#name_room').text();
                var tienhang = $('#tongtienid').val();
                var kieunghi = $('#MainContent_dr_hinhthucnghi').val();
                var hinhthucnghi = $('#stylerender').val();
                var loaihinhnghi = $('#kieunghiid').text();
               
                var userid = '<%=Session["username"].ToString()%>';
                //alert(loaihinhnghi);
                //alert(hinhthucnghi);
                if (kieunghi == '' && hinhthucnghi == 'hotel')
                {
                    if (loaihinhnghi == '')
                    {
                         alert('ban chua chon mo hinh nghi!');
                    }
                    else
                    {
                        //phong da co khach roi
                        //luu hoa don binh thuong
                         $('.themthucdon').each(function () {                                  
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
                                    kieunghi:kieunghi,
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
                    }
                   
                }
                else
                {
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
                                    kieunghi:kieunghi,
                                    tenphong: tenphong,
                                    tienhang: tienhang,
                                 items: JSON.stringify(itemdata),
                                 userid: userid
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
                         }
                         else
                         {
                            alert('Bạn chưa chọn phòng thuê!')
                        }
                }


               
            });

            // nut sua hoa don
            $('.editproduct').click(function () {
                        var tenphong = $('#name_room').text();
                        //var tongtienhang = parseInt($('#tongtienhang').val());
                        //loi1
                        var tongtienhang = parseInt($('#tongtienid').val());
                        $('.checkinput').each(function () {
                            var chk = $(this).is(':checked');
                            if (chk == true) {
                                var mahangid = $(this).parent().parent().find('td').eq(0).text();
                                var soluong = $(this).parent().parent().find('td').eq(1).text();
                                var price = $(this).parent().parent().find('td').eq(3).text();
                                tongtienhang = tongtienhang - price;
                                $(this).parent().parent().remove();                                
                                //$('#tongtienhang').val(tongtienhang);
                                //loi1
                                $('#tongtienid').val(tongtienhang);
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
                    //var tenhang = $("#MainContent_txt_doc").val();
                    ////alert(_tenhang);
                    //var data = { tenhang: tenhang };
                    ////pending
                    // $.ajax({
                    //            type: "POST",
                    //            contentType: "application/json; charset=utf-8",
                    //            url: "Map.aspx/laymahang",                                
                    //            data: JSON.stringify(data),
                    //            dataType: "json",
                    //     success: function (data) {   
                    //         //alert(data.d);
                    //        if (data.d != "NG") {
                    //            $("#mahanghoa").text(data.d);
                    //        } 
                    //        else 
                    //        {
                    //            alert('Khong co trong danh muc hang hoa!');
                    //        }                            
                    //    },
                    //    error: function () {
                    //        //alert("No Match");
                    //    }
                    //  });

                    $("#soluong").val(1);
                    $("#soluong").select();
                }
            });

            $('#inlaiHD').on('change', function() { 
                // From the other examples
                if (!this.checked) {
                    //var sure = confirm("Are you sure?");
                    //this.checked = !sure;
                    //$('#textbox1').val(sure.toString());
                    //alert('false');
                    $('#hoadonid').attr('disabled', 'disabled');
                    //document.getElementById("textboxId").setAttribute("disabled", "disabled");
                }
                else
                {
                    //alert('true');
                    $('#hoadonid').removeAttr("disabled");
                    //document.getElementById("textboxId").removeAttribute("disabled"); 
                }
            });

            $('#xemlaiHD').on('change', function() {                 
                if (!this.checked) {                  
                    $('#hoadonid').attr('disabled', 'disabled');                    

                    var checkbox = document.getElementById('inlaiHD');
                    if (checkbox) {
                        checkbox.checked = false;                        
                    }
                    $('#tbnhaphang tr').remove();
                    $('#tongtienid').val('0');
                    $('#chietkhauid').val('0');
                    $('#thanhtoanid').val('0');
                    $('#conlaiid').val('0');
                    $('#tiengioid').val('0');
                }
                else
                {
                   // alert('show lai hoa don');
                   var sohoadon = $("#hoadonid").val();
                    //alert(sohoadon);
                    var data = { sohoadon: sohoadon };
                    $.ajax({
                            type: "POST",
                            contentType: "application/json; charset=utf-8",
                            url: "Map.aspx/Xemlaihoadon",
                            data: JSON.stringify(data),
                            dataType: "json",
                            success: function (data) {
                                const objdata = $.parseJSON(data.d);
                                var tongtienhang = "";
                                var tongchietkhau = "";                            
                                var khachthanhtoan = "";
                                var khachno = "";
                                $('#tbnhaphang tr').remove();

                                var biendem = objdata['Table1'].length;
                                for (var i = 0; i < objdata['Table1'].length - 1; i++) {
                                    //console.log(objdata['Table1'].length);
                                    var tenhang = objdata['Table1'][i][0];                                    
                                    var soluong = objdata['Table1'][i][1];
                                    var dongia = objdata['Table1'][i][2];                                   
                                    var thanhtien = objdata['Table1'][i][3];

                                    var newrow = '<tr class="themthucdon">' +
                                                '<td id="tenhang">' + tenhang + '</td>' +
                                                '<td id="soluong">' + soluong + '</td>' +
                                                '<td id="giale">' + dongia + '</td>' +
                                                '<td id="thanhtien">' + thanhtien + '</td>' +
                                                '<td><input name="checkinput" class="checkinput" type="checkbox" value="" /></td>' +
                                                '</tr>';
                                            $('#tbnhaphang').append(newrow);

                                    if (i == (biendem - 2))
                                    {                                        
                                        tongchietkhau = objdata['Table1'][i][4];  
                                        tongtienhang = objdata['Table1'][i][5];  
                                        khachthanhtoan = objdata['Table1'][i][6];
                                        khachno = objdata['Table1'][i][7];                                       
                                    }
                                }

                                $('#tongtienid').val(tongtienhang);
                                $('#chietkhauid').val(tongchietkhau);
                                $('#thanhtoanid').val(khachthanhtoan);
                                $('#conlaiid').val(khachno);



                            },
                            error: function () {
                                //alert("No Match");
                            }
                    });


                }
            });

            $("#hoadonid").on('keyup', function (e) {
                if ((e.key === 'Enter' || e.keyCode === 13)) {
                    //alert('hoadon inlai');
                    var sohoadon = $("#hoadonid").val();
                    //alert(sohoadon);
                    var data = { sohoadon: sohoadon };

                    // lay thong tin hoang hoa
                        $.ajax({
                            type: "POST",
                            contentType: "application/json; charset=utf-8",
                            url: "Map.aspx/thongtinhanghoa_inlai",
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
                                    var tienhang = objdata['Table'][0][1];
                                    var hinhthucnghi = objdata['Table'][0][4];  
                                    var tongtienhat = objdata['Table'][0][5];
                                    var tenphong = objdata['Table'][0][8];

                                    var _sohoadon = objdata['Table'][0][6];
                                    var ngaytao = objdata['Table'][0][9];
                                    var khachthanhtoan = objdata['Table'][0][10];
                                    var khachno = objdata['Table'][0][11];
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
                                        //debugger;
                                        //var aaa = blkstr[0];
                                        //var bbb = blkstr[1];
                                        for (var i = 0; i < blkstr.length; i++) {
                                            const chars = blkstr[i].split(':');
                                            const info_mahang = chars[0].split(',');

                                            var mahang = info_mahang[0];
                                            var dongia = info_mahang[1];
                                            var soluong = chars[1];
                                            var thanhtien = soluong*dongia;//info_mahang[2];
                                            

                                            var newrow = '<tr class="themthucdon2">' +
                                                '<td id="tenhang" style="border: 1px soild black;">' + mahang + '</td>' +
                                                '<td id="soluong" style="border: 1px soild black;">' + soluong + '</td>' +
                                                '<td id="giale" style="border: 1px soild black;">' + parseInt(dongia).toLocaleString('vi-VN') + '</td>' +
                                                '<td id="thanhtien" style="border: 1px soild black;">' + parseInt(thanhtien).toLocaleString('vi-VN') + '</td>' +                                               
                                                '</tr>';
                                            $('#tbnhaphang_inhoadon').append(newrow);
                                        }
                                        //$('#checkinput1').val(giovao);
                                        //$('#checkinput2').val(giora);                                                                
                                        $("#tenphong2").text(tenphong);

                                        $('#tongtien2').text(tienhang.toLocaleString('vi-VN'));
                                        var khachTT = parseInt(tienhang) + parseInt(tongtienhat);
                                        $('#thantoan2').text(khachTT.toLocaleString('vi-VN'));
                                        $('#chietkau2').text(0);

                                        $('#khthanhtoan2').text(khachthanhtoan.toLocaleString('vi-VN'));
                                        $('#psno2').text(khachno.toLocaleString('vi-VN'));



                                        $('#sohoadon_').text(_sohoadon);
                                        $('#ngaytao_').text(ngaytao);

                                        $('#hinhthucnghi2').text(hinhthucnghi);
                                        $('#tongtienhat2').text(tongtienhat);

                                        const bangchu_hienthi2 = to_vietnamese(parseInt(tienhang)+parseInt(tongtienhat));
                                        $('#bangchuid').text(bangchu_hienthi2);

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

                                    $('#bangchuid').text('');
                                }
                            },
                            error: function () {
                                //alert("No Match");
                            }
                        }); 


                        $('#myModal6').modal('show');
                    
                }
            });
      
            $('.button_addmenu').each(function () {
                $(this).click(function () {                  
                    var _mahang = $(this).parent().find('mh').text();
                    //alert(_mahang);
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
                                $('#thanhtoanid').val(tongtienhang);
                                //$("#MainContent_txt_doc").select();

                                const bangchu_hienthi2 = to_vietnamese(tongtienhang);
                                $('#bangchuid2').text(bangchu_hienthi2);
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
                                        $('#thanhtoanid').val(tongtienhang);
                                        //$("#MainContent_txt_doc").select();

                                        const bangchu_hienthi2 = to_vietnamese(tongtienhang);
                                        $('#bangchuid2').text(bangchu_hienthi2);
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
                        //var _mahang = $("#mahanghoa").text();
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
                                                    '<td id="tenhang">' + objdata['Table'][0][2] + '</td>' +
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
                    var tongtiengio = parseInt($('#tiengioid').val());
                    
                    //alert(tongtiengio);
                    var _mahang = $("#MainContent_txt_doc").val();
                    //var _mahang = $("#mahanghoa").text();                    
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
                                //mahang = objdata['Table'][0][1]   , tenhang = objdata['Table'][0][2]
                                var newrow = '<tr class="themthucdon">' +
                                    '<td id="tenhang">' + objdata['Table'][0][2] + '</td>' +
                                    '<td id="soluong">' + soluong + '</td>' +
                                    '<td id="giale">' + dongia + '</td>' +
                                    '<td id="thanhtien">' + thanhtien + '</td>' +
                                    '<td><input name="checkinput" class="checkinput" type="checkbox" value="" /></td>' +
                                    '</tr>';
                                $('#tbnhaphang').append(newrow);
                                tongtienhang += thanhtien;
                                //alert(tongtiengio);
                                var tongtienthanhtoan = parseInt(tongtienhang) + parseInt(tongtiengio);

                                $('#tongtienid').val(tongtienhang);
                                $('#thanhtoanid').val(tongtienthanhtoan);

                                const bangchu_hienthi2 = to_vietnamese(tongtienthanhtoan);
                                $('#bangchuid2').text(bangchu_hienthi2);

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
                                //$('#tongtienid').val(tongtienhang);
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
                                        var soluong = parseInt($("#soluong").val());
                                        var dongia = parseInt(objdata['Table'][0][7]);
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
                                        var tongtienthanhtoan = parseInt(tongtienhang) + parseInt(tongtiengio);
                                        $('#thanhtoanid').val(tongtienthanhtoan);

                                        const bangchu_hienthi2 = to_vietnamese(tongtienthanhtoan);
                                        $('#bangchuid2').text(bangchu_hienthi2);

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

             function printDiv_Close()
            {
                //alert('asdfas');
                setTimeout(function() {
                    location.reload();
                    }, 1000);
                //$('#myModal6').modal('hide');
            }

            function printDiv_Save()
            {
                 var tienhat = $("#MainContent_Button3").parent().parent().parent().find("b").eq(1).text(); 
                var tenphong2 = $("#MainContent_Button3").parent().parent().find("b").eq(2).text(); 
                var tongtien2 = $("#MainContent_Button3").parent().parent().find("b").eq(3).text();
                //var tongtien2 = $("#MainContent_Button3").parent().parent().find("b").eq(4).text();
                var chietkau2 = $("#MainContent_Button3").parent().parent().find("b").eq(5).text();
                var thantoan2 = $("#MainContent_Button3").parent().parent().find("b").eq(6).text();                
                var conlai2 = $("#MainContent_Button3").parent().parent().find("b").eq(7).text(); 

                //alert(conlai2);
                    
                var sohoadon = $("#hoadonid").val();
                //alert(sohoadon);   
                
                 var idkhachhang = $('#MainContent_dr_nhacungcap').val();  
                //alert(idkhachhang);                        

                //alert(tienhat);
                //alert(tenphong2);
                //alert(tongtien2);             
                //alert(thantoan2);
                //alert(chietkau2);
                //alert(conlai2);
                thanhtoanhoadon(tenphong2,tongtien2,chietkau2,thantoan2,conlai2,tienhat,sohoadon,idkhachhang); 
            }

            function printDiv(divId) {
                //debugger;
                //var delayInMilliseconds = 5000; //1000 = 1 second
                //setTimeout(function() {
                //  //your code to be executed after 1 second
                //}, delayInMilliseconds);
               try {                                       
                    //kiem tra xem co phai hoa don in lai khong
                    //debugger;
                    var idkhachhang = $('#MainContent_dr_nhacungcap').val();
                    //alert(idkhachhang);  

                    var checkboxid = document.getElementById("inlaiHD");
                    if(checkboxid.checked == true)
                    {
                       //alert('OK');
                        // truong hop in lai hoa don
                        var printContents = document.getElementById(divId).innerHTML;
                        var originalContents = document.body.innerHTML;
                        document.body.innerHTML = printContents;
                        //window.print();        
                        setTimeout(function() {
                            window.print();
                            // Sau khi in, phục hồi nội dung ban đầu của body
                            document.body.innerHTML = originalContents;
                        }, 1000);   
                    }
                    else
                    {
                        //alert('NG');
                        //truong hop hoa don moi
                        var printContents = document.getElementById(divId).innerHTML;
                        var originalContents = document.body.innerHTML;
                        document.body.innerHTML = printContents;
                        //window.print();      
                        setTimeout(function() {
                            window.print();
                            // Sau khi in, phục hồi nội dung ban đầu của body
                            document.body.innerHTML = originalContents;
                        }, 1000);    
                        //debugger; 
                        thanhtoanhoadon(tenphong2,tongtien2,chietkau2,thantoan2,conlai2,tienhat,sohoadon,idkhachhang);                                                                  
                    }          
                                                                                                                                                       
                    setTimeout(function() {
                    location.reload();
                    }, 1000);
  
                }
                catch(err) {
                 console.log(err.tostring());
                 alert(err.tostring());
                }
                
                
                
            }


        </script>

       

       <%-- <script>
            var str = '';
            var tenphong = '';
            var menu = new Contextmenu({
                name: "menu",
                wrapper: ".wrapper",
                trigger: ".item",
                item: [{
                    "name": "Thông tin phòng",
                    "func": "setText()",
                    "link": null,
                    "disable": false
                },
                {
                    "name": "Dọn Phòng",
                    "link": "#",
                    "disable": false
                },
                {
                    "name": "Đặt Phòng",
                    "disable": false
                },
                {
                    "name": "-"
                },                
                {
                    "name": "Chuyển ban",
                    "func": "updateItem()"
                },                
                {
                    "name": "Ghep ban",
                    "func": "ghepban()"
                },
                {
                    "name": "Hủy Phòng",
                    "func": "delItem()"
                },
                {
                    "name": "-"
                },
                {
                    "name": "Remove Method",
                    "func": "removeMenu()"
                },
                {
                    "name": "Đóng Menu"
                }
                ],
                target: "_blank",
                beforeFunc: function (ele) {
                    str = $(ele).text();
                    //tenphong123 = $("#tenphong").text();               
                }
            });

            function setText() {
                alert(str);
                //var tenphong = $("#tenphong").val();
                //alert(tenphong);
            }

            function ghepban() {
                alert("chuc nang ghep ban!");
                // addItem()
                //menu.add({
                //    index: 0,
                //    name: "New Item",
                //    func: 'alert("New Item")',
                //    link: null,
                //    disable: false
                //});
            }

            function delItem() {
                //menu.del(4);
                //debugger;
                var tenphong1 = $("#nametable").text();
                //alert(tenphong1);
                var nameitem = tenphong1;                            
                var data = { nameitem: nameitem };
                $.ajax({
                            type: "POST",
                            contentType: "application/json; charset=utf-8",
                            url: "Map.aspx/huyphongban",
                            data: JSON.stringify(data),
                            dataType: "json",
                            success: function (data) {
                                //response(data.d);
                                //alert(data.d);
                                if(data.d != "NG")
                                {
                                    alert('Huy ban thành công!');
                                    $("#myList UL LI").each(function () {
                                        var nameroom = $(this).find('#tenphong').text();
                                        if (nameroom == tenphong) {
                                            $(this).find("img").attr('src','/static/images/phongtrong.png');
                                        }
                                    })

                                }
                                else
                                {
                                    alert('NG!!!');
                                }
                            },
                            error: function (result) {
                                //alert("No Match");
                            }
                        });                
            }

            function removeMenu() {
                menu.destroy();
            }

            function updateItem() {
                //let newroom;
                //debugger;
                var tenphong1 = $("#nametable").text();
                //alert(tenphong1);
                let notice = prompt("Vui long nhap ban/phong can chuyen!");
                if (notice == null || notice == "") 
                {
                    newroom = "Phong/ban null!"; 
                    alert(newroom);               
                } 
                else 
                {
                    //newroom = "Phong moi chuyen: " + notice;
                    document.getElementById("thongbao").innerHTML = notice;
                    var newroom = notice;

                    //alert(tenphong1);                
                    if(tenphong1 == "")
                    {
                        alert("ban can chon phong can chuyen!");
                    }
                    else
                    {
                        var nameitem = tenphong1;            
                        var data = { nameitem: nameitem, newroom:newroom };
                        $.ajax({
                                type: "POST",
                                contentType: "application/json; charset=utf-8",
                                url: "Map.aspx/chuyenphongban",
                                data: JSON.stringify(data),
                                dataType: "json",
                                success: function (data) {
                                    //response(data.d);
                                    //alert(data.d);
                                    if(data.d != "NG")
                                    {
                                        alert('Chuyen ban thành công!');
                                        $("#myList UL LI").each(function () {
                                            var nameroom = $(this).find('#tenphong').text();
                                            if (nameroom == nameitem) {
                                                $(this).find("img").attr('src','/static/images/phongtrong.png');
                                            }
                                            if (nameroom == newroom) {
                                                $(this).find("img").attr('src','/static/images/cokhach.png');
                                            }
                                        })                                        
                                    }
                                    else
                                    {
                                        alert('Chuyen ban/phong NG!!!');
                                    }
                                },
                                error: function (result) {
                                    //alert("No Match");
                                }
                          }); 
                    }                   
                }
               
                 
 
                //menu.update({
                //    index: 5,
                //    name: "github",
                //    func: "",
                //    link: "https://www.jqueryscript.net",
                //    disable: false
                //});
            }
</script>--%>
        <%--<script type="text/javascript">

            var _gaq = _gaq || [];
            _gaq.push(['_setAccount', 'UA-36251023-1']);
            _gaq.push(['_setDomainName', 'jqueryscript.net']);
            _gaq.push(['_trackPageview']);

            (function () {
                var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
                ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
                var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
            })();

</script>--%>
</asp:Content>
