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
                        <div class="col-sm-6">
                            <h1>Map Location</h1>
                        </div>
                        <div class="col-sm-6">
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
                            <div class="card-header">
                                <h3 class="card-title">Test</h3>

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
                                        <%for (int i = 0; i < 10; i++)
                                            {%>
                                        <%k++;%>
                                        <li class="item" id="nametable_<%=k %>">
                                            <p id="tenphong">P0<%=k %></p> 
                                            <t id="trangthai" hidden>trangthai</t>
                                            <d id="trangthaidatphong" hidden>trangthaidatphong</d>
                                            <dp id="trangthaidonphong" hidden>trang thaidongphong</dp>
                                            <lp id="loaiphong" style="float: left" hidden><label style="width: 100px; display: none;" name="loaiphong">loaiphong</label></lp>
                                            <%--<img src="phongtrong" style="width:80px; height: 80px;">--%>

                                        </li>

                                        <%} %>
                                    </ul>
                                </div>





                            </div>
                            <!-- /.card-body -->
                        </div>
                        <!-- /.card -->
                    </div>



                    <div class="col-md-6">
                        <div class="card card-secondary">
                            <div class="card-header">
                                <h3 class="card-title">Table:<b id="nametable" class="td_menu" style="color:yellow;"></b></h3>

                                <i class="fa fa-pencil" style="font-size: 24px; padding-left: 20px;"></i><b class="editproduct" style="color: yellow; padding-left: 10px;">EDIT</b>

                                <i class="fa fa-times" style="font-size: 24px; padding-left: 20px;"></i><b class="delproduct" style="color: yellow; padding-left: 5px;">DELETE</b>

                                <i class="fa fa-save" style="font-size: 24px; padding-left: 20px;"></i><b class="saveproduct" style="color: yellow; padding-left: 5px;">SAVE BILL</b>

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

                                <%-- <div class="row">
                                    <div class="col-12">
                                        <label for="tongtien">Total:</label>
                                        <input type="text" id="tongtienid" class="form-control input-sm" name="fname" style="width: 50%" value="0">
                                    </div>
                                    <div class="col-12">
                                        <input type="submit" value="Save" id="saveproduct" class="btn btn-success saveproduct float-right">
                                    </div>
                                </div>--%>

                                <div class="row">
                                    <div class="col-3">
                                        <label for="tongtien" style="float: left; margin-top: 5px;">Tong tien:</label>
                                        <input type="text" id="tongtienid" class="form-control input-sm" name="fname" style="float: left; margin-left: 10px;" value="0">
                                    </div>
                                    <div class="col-3">
                                        <label for="tongtien" style="float: left; margin-top: 5px;">chiet khau</label>
                                        <input type="text" id="chietkhauid" class="form-control input-sm" name="fname" style="float: left; margin-left: 10px;" value="0">
                                    </div>
                                    
                                </div>
                                <div class="row">
                                    <div class="col-3">
                                        <label for="tongtien" style="float: left; margin-top: 5px;">thanh toan</label>
                                        <input type="text" id="thanhtoanid" class="form-control input-sm" name="fname" style="float: left; margin-left: 10px;" value="0">
                                    </div>
                                    <div class="col-3">
                                        <label for="tongtien" style="float: left; margin-top: 5px; id="lblconlai" ">Conlai</label>
                                        <input type="text" id="conlaiid" class="form-control input-sm" name="fname" style="float: left; margin-left: 10px;" value="0">
                                    </div>
                                    
                                    <div class="col-3">
                                        <input type="submit" value="Thanh toan" id="khachthanhtoan" class="btn btn-success float-right">  <%--class , id="saveproduct"--%>
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
                                                        <img src="../../dist/img/monan.JPG" alt="user-avatar" class="img-circle img-fluid">

                                                        <div class="text-center" style="margin-bottom: 10px; margin-top: 10px;">
                                                            <mh><%=rows1["mahang"].ToString() %></mh> <br /> <dg><%=rows1["giaban"].ToString() %></dg> /VND
                                                            <input type="number" class="quantity form-control text-center" title="Số lượng" value="1" min="1" size="1" maxlength="2" id="quantity" name="quantity" ">                                                                                                                      
                                                            <a href="#" class="btn btn-sm btn-primary button_addmenu" id="add_sanpham">
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
                                    //debugger; 
                                    if (myArr == '0') {
                                        //truong hop chua co hang ban
                                        $('#tbnhaphang tr').remove();
                                        $('#tongtienid').val(0);                                        
                                        $('#thanhtoanid').val(0);
                                        $('#chietkhauid').val(0);

                                    } else {

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


                                        $('#tongtienid').val(tienhang);
                                        $('#thanhtoanid').val(tienhang);
                                        $('#chietkhauid').val(0);


                                    }




                                }
                                else {
                                    $('#tbnhaphang tr').remove();
                                    $('#tongtienhang').val(0);
                                    $('#thanhtoanid').val(0);
                                    $('#chietkhauid').val(0);
                                    //$('#songuoio').val(ticket);
                                }

                            },
                            error: function () {
                                //alert("No Match");
                            }
                        });


                    });
                });

            });

            $('#khachthanhtoan').click(function () {
                //debugger;
                var psco = $('#thanhtoanid').val();
                var tongtienhang = $('#tongtienid').val();
                var tienck = $('#chietkhauid').val();

                var tienthoi = (parseFloat(psco) - parseFloat(tongtienhang)) 
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
                if (tenphong != "") {
                    $('.themthucdon').each(function () {                        
                        var mahang = $(this).find('td').eq(0).text() + "," + $(this).find('td').eq(2).text() + "," + $(this).find('td').eq(3).text();
                        var soluong = $(this).find('td').eq(1).text();                       
                        if (mahang != "") {                           
                            itemdata[mahang] = parseInt(soluong);                            
                        }
                    });                                       
                    var data = {
                        tenphong: tenphong,
                        tongtienhang: tongtienhang,
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
                                alert('Hàng hóa đã được thêm thành công!');
                                $('#tbnhaphang tr').remove();
                                $('#tongtienid').val(0);                                        
                                $('#thanhtoanid').val(0);
                                $('#chietkhauid').val(0);
                            } else {
                                alert('Phòng/ bàn đang trống!');
                            }
                            

                        },
                        error: function () {
                            //alert("No Match");
                        }
                    });



                } else {
                    alert('Bạn chưa chọn bàn/phòng!')
                }

            });

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
