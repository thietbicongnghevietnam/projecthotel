<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Phieubanhang.aspx.cs" Inherits="WebApplication1.Phieubanhang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="wrapper">

        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h3 class="m-0">PHIEU BAN HANG</h3>
                    </div><!-- /.col -->
                </div><!-- /.row -->
            </div><!-- /.container-fluid -->
        </div>

    <table id="dnhaphang" style="padding-bottom: 10px; padding-right: 10px;padding-top: 20px;padding-left: 20px;">

                <tr>
                    <td style="padding-bottom: 10px; padding-right: 10px;"><b>Ma hang </b></td>
                <td style="padding-bottom: 10px; padding-right: 10px;">                               
                    <asp:TextBox ID="phieunhaphang" Style="float: left; width: 100%;" class="ajax form-control input-sm" value="" placeholder="Chọn tên hàng" runat="server"></asp:TextBox>
                </td>
                <td style="padding-bottom: 10px; padding-right: 10px;"><b>Số lượng: </b></td>
                <td style="padding-bottom: 10px; padding-right: 10px;">
                <input id="soluongnhaphang" name="soluongnhaphang" class="form-control input-sm" value="" />
                </td>
                <td style="padding-bottom: 10px; padding-right: 10px;">
                   <%-- <input id="nhaccid" name="nhacungcap" class="form-control input-sm" value="NCC" />--%>

                  
                   
                        <%--<label for="Group">NCC</label>--%>
                        <asp:DropDownList ID="dr_nhacungcap" runat="server" AppendDataBoundItems="true" 
                            DataTextField="makh" 
                            DataValueField="id" 
                            CssClass="form-control input-sm">
                        </asp:DropDownList>
                     
                   
                

                </td>                   

                <td>
                    <span class="addphieunhap" style="padding-right: 30px; padding-left:50px;">                
                    <i class="fa fa-plus-square" style="font-size: 24px; padding-left: 20px;"></i>
                    <b class="add_hanghoa" style="color: black; padding-left: 5px;">&nbsp;Them</b>
                    </span>
                    <span class="editphieunhap" style="padding-right: 30px; padding-left:20px;">                
                        <i class="fa fa-pencil" style="font-size: 24px; padding-left: 20px;"></i>
                        <b class="editproduct" style="color: black; padding-left: 10px;">Sua</b>
                    </span>
                    <span class="delnhaphang" style="padding-right: 30px;">                
                        <i class="fa fa-times" style="font-size: 24px; padding-left: 20px;"></i>
                        <b class="delproduct" style="color: black; padding-left: 5px;">&nbsp;Xoa</b>
                    </span>
                 </td>

                     <td>
                        <span class="addKhachhang" style="padding-right: 10px; padding-left:10px;">
                        <i class="fa fa-plus-square" style="font-size: 24px; padding-left: 20px;"></i>
                        <b class="add_Khachhang" style="color: black; padding-left: 5px; float:left">&nbsp;Them KH</b>
                        </span>
                    </td>
                    <td>
                       
                        <label for="inhoadon" style="float: left; margin-top: 5px;">In hoa don</label>
                        <input type="checkbox" id="inHD" name="inHD">
                        
                    </td>
                
                </tr>
                </table>

                <div style="padding-bottom: 20px;">
                
                </div>

                <div style="height: 300px; overflow-y: scroll">
                <table  class="display table table-bordered dataTable no-footer">
                    <thead>
                                            <tr>
                                                <th>Tên hàng</th>
                                                <th>Số lượng</th>
                                                <th>Đơn giá</th>
                                                <th>Thành tiền</th>
                                                <th>Del</th>
                                            </tr>
                                        </thead>
                    <tbody id="tbphieunhap">
                    </tbody>

                <%--<tr>
                <td>Tên hàng</td><td>Số lượng</td><td>Đơn giá</td><td>Thành tiền</td><td>Del</td>
                </tr>--%>
                </table>
                </div>

                <div>
                <span style="float: left; padding-right: 10px; padding-top: 20px;"><b style="float: left">Tổng tiền hàng &nbsp;&nbsp;</b>
                <input style="width: 140px; float: left" id="tongtiennhap" disabled="disabled" name="tongtiennhap" type="text" class="form-control input-sm" value="0"/></span>

                <span style="float: left; padding-right: 10px; padding-top: 20px;"><b style="float: left">Chiet Khau &nbsp;&nbsp;</b>
                    <input style="width: 140px; float: left" id="chietkhauid"  name="chietkhauid" type="text" class="form-control input-sm" value="0"/>
                </span>
                
                <span style="float: left; padding-right: 10px; padding-top: 20px;"><b style="float: left">Thanh toan &nbsp;&nbsp;</b>
                    <input style="width: 140px; float: left" id="thanhtoanid" name="thanhtoanHD" type="text" class="form-control input-sm" value="0"/>
                </span>

                <span style="float: left; padding-right: 10px; padding-top: 20px;"><b style="float: left">Con lai &nbsp;&nbsp;</b>
                    <input style="width: 140px; float: left" id="conlaiid" name="conlaiHD" type="text" class="form-control input-sm" value="0"/>
                </span>
               
                <span style="float: left; padding-right: 10px; padding-top: 20px; padding-left: 50px;">
                    <input type="submit" value="Ghi hoa don" id="ghilaihoadon"  class="btn btn-success float-right">   
                </span>


                </div>

                <br />
                <br />
                <br />
                <br />

        <div class="modal" id="myModal">
            <div class="modal-dialog" >
                <div class="modal-content">
                    <div class="modal-header">
                        <div class="row">
                            <div>
                                <h4 class="modal-title" id="headerTag" style="float: left">Them khach hang</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="float: right; margin-left: 300px;">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                        </div>
                    </div>


                    <div class="modal-body">
                       
                       <div class="container-fluid" id="printableArea" style="width:400px;height:auto;">
                                                                             
                           testsss
                                                       
                        </div>
                                                                           
                    </div>

                    <div class="modal-footer">
                       <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fas fa-times"></i>Close</button>                         
                        <button type="button" runat="server" id="Button1"  class="btn btn-primary" >Save</button>                                                                                                                                                                     
                    </div>
                </div>
            </div>
        </div>


    </div>
     <script type="text/javascript">
        $(document).ready(function () {
            SearchText();            
        });

        $("#MainContent_phieunhaphang").on('keyup', function (e) {
                if ((e.key === 'Enter' || e.keyCode === 13)) {
                    $("#soluongnhaphang").val(1);
                    $("#soluongnhaphang").select();
                }
         });
         $('.addKhachhang').click(function () {
             $('#myModal').modal('show');
         });

         $('.add_hanghoa').each(function () {
                $(this).click(function () {                     
                    if($("#MainContent_phieunhaphang").val() == '')
                    {                       
                          //alert('ban chua nhap ma hang!');
                          $("#MainContent_phieunhaphang").focus();
                    }
                    else
                    {
                        var _mahang = $("#MainContent_phieunhaphang").val();                    
                        //var soluong = $("#soluong").val(); 
                        var data = { _mahang: _mahang };
                    
                        var tongtienhang = parseInt($('#tongtiennhap').val());

                        //push mahang vao array
                        var gettr = [];

                       $('#tbphieunhap tr').each(function () {
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
                                    url: "Phieubanhang.aspx/getthongtinmahang",
                                    data: JSON.stringify(data),
                                    dataType: "json",
                                    success: function (data) {
                                        //response(data.d);
                                        var objdata = $.parseJSON(data.d);
                                        //debugger;
                                        var soluong = parseInt($("#soluongnhaphang").val());
                                        //var dongia = parseInt(objdata['Table'][0][7]);
                                        var dongia = parseInt(objdata['Table'][0][6]);  //gianhap
                                        var thanhtien = parseInt($("#soluongnhaphang").val()) * parseInt(objdata['Table'][0][6]);
                                        //alert(thanhtien);

                                        var newrow = '<tr class="themthucdon">' +
                                            '<td id="tenhang">' + objdata['Table'][0][1] + '</td>' +
                                            '<td id="soluong">' + soluong + '</td>' +
                                            '<td id="giale">' + dongia + '</td>' +
                                            '<td id="thanhtien">' + thanhtien + '</td>' +
                                            '<td><input name="checknhaphang" class="checknhaphang" type="checkbox" value="" /></td>' +
                                            '</tr>';
                                        $('#tbphieunhap').append(newrow);
                                        tongtienhang += thanhtien;

                                        //alert(tongtienhang);
                                        $('#tongtiennhap').val(tongtienhang);
                                        $('#thanhtoanid').val(tongtienhang);

                                        $("#MainContent_phieunhaphang").select();
                                    },
                                    error: function () {
                                        //alert("No Match");
                                    }
                                });
                            }

                            //neu da co ma hang trog danh sach thi remove cai cu roi insert
                            if (gettr_rs == 'Remove') {
                                // xoa dong
                                $('#tbphieunhap tr').each(function () {
                                    var td = $(this).find('td').eq(0).text();

                                    var soluongmoi = $('#soluongnhaphang').val();
                                    var soluongcu = $(this).find('td').eq(1).text();
                                    var tong_soluong = parseInt(soluongmoi) + parseInt(soluongcu);

                                    if (td == _mahang) {
                                        $('#tbphieunhap tr').each(function () {
                                            if ($(this).find('td').eq(0).text() == _mahang) {
                                                var tongtiencu = parseFloat($(this).find('td').eq(3).text());
                                                //alert(tongtiencu);
                                                $(this).remove();
                                                tongtienhang = tongtienhang - tongtiencu;
                                            }
                                        });
                                        //alert(tongtienhang);
                                        //$('#tongtiennhap').val(tongtienhang);
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
                                                var soluong = parseInt($("#soluongnhaphang").val());
                                                var dongia = parseInt(objdata['Table'][0][6]);
                                                var thanhtien = tong_soluong * dongia;
                                                var newrow = '<tr class="themthucdon">' +
                                                    '<td id="tenhang">' + objdata['Table'][0][1] + '</td>' +
                                                    '<td id="soluong">' + tong_soluong + '</td>' +
                                                    '<td id="giale">' + dongia + '</td>' +
                                                    '<td id="thanhtien">' + thanhtien + '</td>' +
                                                    '<td><input name="checknhaphang" class="checknhaphang" type="checkbox" value="" /></td>' +
                                                    '</tr>';
                                                $('#tbphieunhap').append(newrow);
                                                tongtienhang += thanhtien;
                                                $('#tongtiennhap').val(tongtienhang);
                                                $('#thanhtoanid').val(tongtienhang);

                                                $("#MainContent_phieunhaphang").select();
                                            },
                                            error: function () {
                                                //alert("No Match");
                                            }
                                        });
                                    }
                                });
                            }
                    }                                                                         
                });               
         });

         // nut sua hoa don
            $('.editproduct').click(function () {                        
                        var tongtienhang = parseInt($('#tongtiennhap').val());
                        $('.checknhaphang').each(function () {
                            var chk = $(this).is(':checked');
                            if (chk == true) {
                                var mahangid = $(this).parent().parent().find('td').eq(0).text();
                                var soluong = $(this).parent().parent().find('td').eq(1).text();
                                var price = $(this).parent().parent().find('td').eq(3).text();
                                tongtienhang = tongtienhang - price;
                                $(this).parent().parent().remove();
                                $('#tongtiennhap').val(tongtienhang);
                                $('#thanhtoanid').val(tongtienhang);

                                $('#soluongnhaphang').val(soluong);
                                $('#MainContent_phieunhaphang').val(mahangid);
                                
                                $('#soluongnhaphang').focus();
                                $('#soluongnhaphang').select();
                            }
                        })
                    });

        $("#soluongnhaphang").on('keyup', function (e) {
            if ((e.key === 'Enter' || e.keyCode === 13))
            {
                var tongtienhang = parseInt($('#tongtiennhap').val());                
                //alert(tongtienhang);

                var _mahang = $("#MainContent_phieunhaphang").val();
                var data = { _mahang: _mahang };
                //push mahang vao array
                var gettr = [];
    
                $('#tbphieunhap tr').each(function () {
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
                                    var soluong = parseInt($("#soluongnhaphang").val());
                                    //var dongia = parseInt(objdata['Table'][0][7]);  //gia le
                                    var dongia = parseInt(objdata['Table'][0][6]);    //gia nhap  
                                    var thanhtien = parseInt($("#soluongnhaphang").val()) * parseInt(objdata['Table'][0][6]);
                                    //alert(thanhtien);

                                    var newrow = '<tr class="themthucdon">' +
                                        '<td id="tenhang">' + objdata['Table'][0][1] + '</td>' +
                                        '<td id="soluong">' + soluong + '</td>' +
                                        '<td id="giale">' + dongia + '</td>' +
                                        '<td id="thanhtien">' + thanhtien + '</td>' +
                                        '<td><input name="checknhaphang" class="checknhaphang" type="checkbox" value="" /></td>' +
                                        '</tr>';
                                    $('#tbphieunhap').append(newrow);
                                    tongtienhang += thanhtien;
                                    //alert(tongtienhang);
                                    $('#tongtiennhap').val(tongtienhang);
                                    $('#thanhtoanid').val(tongtienhang);

                                    $("#MainContent_phieunhaphang").select();
                                },
                                error: function () {
                                    //alert("No Match");
                                }
                            });
                }

                if (gettr_rs == 'Remove') {
                            // xoa dong
                            $('#tbphieunhap tr').each(function () {
                                var td = $(this).find('td').eq(0).text();

                                var soluongmoi = $('#soluongnhaphang').val();
                                var soluongcu = $(this).find('td').eq(1).text();
                                var tong_soluong = parseInt(soluongmoi) + parseInt(soluongcu);

                                if (td == _mahang) {
                                    $('#tbphieunhap tr').each(function () {
                                        if ($(this).find('td').eq(0).text() == _mahang) {
                                            var tongtiencu = parseFloat($(this).find('td').eq(3).text());
                                            //alert(tongtiencu);
                                            $(this).remove();
                                            tongtienhang = tongtienhang - tongtiencu;
                                        }
                                    });
                                    //alert('cong don:'+tongtienhang);
                                    //$('#tongtiennhap').val(tongtienhang);
                                    //$('#thanhtoanid').val(tongtienhang);
                                    // _$addproduct_(soluong);
                                    //debugger;
                                    $.ajax({
                                        type: "POST",
                                        contentType: "application/json; charset=utf-8",
                                        url: "Phieubanhang.aspx/getthongtinmahang",
                                        data: JSON.stringify(data),
                                        dataType: "json",
                                        success: function (data) {
                                            //response(data.d);
                                            var objdata = $.parseJSON(data.d);
                                            //debugger;
                                            var soluong = parseInt($("#soluongnhaphang").val());
                                            //var dongia = parseInt(objdata['Table'][0][7]);
                                            var dongia = parseInt(objdata['Table'][0][6]);  //gia nhap
                                            var thanhtien = tong_soluong * dongia;
                                            var newrow = '<tr class="themthucdon">' +
                                                '<td id="tenhang">' + objdata['Table'][0][1] + '</td>' +
                                                '<td id="soluong">' + tong_soluong + '</td>' +
                                                '<td id="giale">' + dongia + '</td>' +
                                                '<td id="thanhtien">' + thanhtien + '</td>' +
                                                '<td><input name="checknhaphang" class="checknhaphang" type="checkbox" value="" /></td></td>' +
                                                '</tr>';
                                            $('#tbphieunhap').append(newrow);
                                            tongtienhang += thanhtien;
                                            //alert(tongtienhang);
                                            $('#tongtiennhap').val(tongtienhang);
                                            $('#thanhtoanid').val(tongtienhang);

                                            $("#MainContent_phieunhaphang").select();
                                        },
                                        error: function () {
                                            //alert("No Match");
                                        }
                                    });
                                }
                            });
                }

            }

         });

         $('.delproduct').click(function () {
            //var tenphong = dj('#name_room').text();
            //var tongtienhang = parseInt($('#tongtienhang').val());
            var tongtienhang = parseInt($('#tongtiennhap').val());
            $('.checknhaphang').each(function () {
                var chk = $(this).is(':checked');
                if (chk == true) {
                    var delid = $(this).parent().parent().find('td').eq(0).text();
                    var price = parseInt($(this).parent().parent().find('td').eq(3).text());
                    tongtienhang = tongtienhang - price;
                    //djLog(tongtienhang);
                    $(this).parent().parent().remove();
                    $('#tongtiennhap').val(tongtienhang);
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

         $('#thanhtoanid').on('change', function () { 
             var tongtienhang = $("#tongtiennhap").val();
             var tongtienthanhtoan = $("#thanhtoanid").val();
             var conlai = (parseFloat(tongtienthanhtoan) - parseFloat(tongtienhang)) 
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

        $('#chietkhauid').on('change', function () { 
            var textcheck = $('#chietkhauid').val();
            var tongtienhang = $("#tongtiennhap").val();
            if (textcheck.includes("%")) {
                //alert("TextBox chứa ký tự phần trăm (%)");
                var removeKytu = $("#chietkhauid").val().replace(/%/g, "");
                //alert(removeKytu);
                if(parseInt(removeKytu) <= 100) // <100%
                {
                    var tienck = parseFloat(removeKytu)*parseFloat(tongtienhang)/100;
                    //alert(tienck);
                    var tongtienthanhtoan =(parseFloat(tongtienhang) - parseFloat(tienck)) ; //;$("#thanhtoanid").val();
                    $("#chietkhauid").val(tienck);
                    $("#thanhtoanid").val(tongtienthanhtoan);
                }
                else
                {
                    alert("Gia tri vuot qua 100%");
                }               
            }
            else
            {               
                var tienck = $("#chietkhauid").val();
                var tongtienthanhtoan =(parseFloat(tongtienhang) - parseFloat(tienck)) ; //;$("#thanhtoanid").val();
                $("#thanhtoanid").val(tongtienthanhtoan);   
            }                                   
         });

         $('#ghilaihoadon').click(function () 
         {             
             var itemdata = {};
             var tienhang = $('#tongtiennhap').val(); 
             var nhacungcap = $('#MainContent_dr_nhacungcap').val();
             //alert(nhacungcap);
             //var nhacungcap = $('#nhaccid').val(); 
             var chieukhau = $('#chietkhauid').val();
             var thanhtoantien = $('#thanhtoanid').val();

             var checkcongno = $('#conlaiid').val();
             var psno = '';
             //var namencc = $('#MainContent_dr_nhacungcap').text();
             var ddl = document.getElementById("MainContent_dr_nhacungcap");
             var namencc = ddl.options[0].innerText;
             var namencc1 = $('#MainContent_dr_nhacungcap').val();
             //console.log(namencc);
             //alert(namencc1);
                       
             $('.themthucdon').each(function () {
                        //var mahang = $(this).find('td').eq(0).text();
                        //var soluong = $(this).find('td').eq(1).text();
                        var mahang = $(this).find('td').eq(0).text() + "," + $(this).find('td').eq(2).text() + "," + $(this).find('td').eq(3).text();
                        var soluong = $(this).find('td').eq(1).text();
                        //var element = {}, cart = [];
                        if (mahang != "") {
                            //items.push({'a': chk ? 1 : 0, 'c': content});
                            itemdata[mahang] = parseInt(soluong);                            
                        }
             });
             //alert(itemdata);
                    //var hanghoa_new = itemdata;
                    //var aaa = $('#tongtienid').val();            
             if (checkcongno < 0) {
                 //$('#lblconlai').text("Tiền thiếu :");                   
                 psno = checkcongno;
                 if (namencc1 == '') {
                     alert("Ban chua chon ten khach hang!");
                 }
                 else
                 {
                     var data = {
                        thanhtoantien:thanhtoantien,
                        psno:psno,
                        chieukhau: chieukhau,
                        nhacungcap: nhacungcap,
                        tienhang: tienhang,
                        items: JSON.stringify(itemdata)
                    };
                     //save hang hoa
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "Phieubanhang.aspx/addthongtinhanghoa_PBH",
                        //data: JSON.stringify(data),
                        data: JSON.stringify(data),
                        dataType: "json",
                        success: function (data) {
                            alert('Hoa don thêm thành công!');  
                            $('#tbphieunhap tr').remove();
                            $('#tongtiennhap').val('0');
                            $('#thanhtoanid').val('0');
                            $('#chietkhauid').val('0');
                            //chietkhauid
                            $("#soluongnhaphang").val('0');
                            $("#conlaiid").val('0');
                            $("#MainContent_phieunhaphang").select();
                        },
                        error: function () {
                            //alert("No Match");
                        }
                  });
                 }                  
             }
             else
             {                                  
                 psno = '0';
                 var data = {
                        thanhtoantien:thanhtoantien,
                        psno:psno,
                        chieukhau: chieukhau,
                        nhacungcap: nhacungcap,
                        tienhang: tienhang,
                        items: JSON.stringify(itemdata)
                    };
                  //save hang hoa
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "Phieubanhang.aspx/addthongtinhanghoa_PBH",
                        //data: JSON.stringify(data),
                        data: JSON.stringify(data),
                        dataType: "json",
                        success: function (data) {
                            //alert('Hoa don thêm thành công!');  
                            $('#tbphieunhap tr').remove();
                            $('#tongtiennhap').val('0');
                            $('#thanhtoanid').val('0');
                            $('#chietkhauid').val('0');
                            //chietkhauid
                            $("#soluongnhaphang").val('0');
                            $("#conlaiid").val('0');
                            $("#MainContent_phieunhaphang").select();                                                    
                        },
                        error: function () {
                            //alert("No Match");
                        }
                  });
                      debugger;
                    //bat thong tin vua luu de in ra hoa don len de in hoa don
                    var ckinhoadon = document.getElementById("inHD");
                        if(ckinhoadon.checked == true)
                        {
                            alert('ban dang in hoa don');
                            saveAndPrint();
                        }
                        else
                        {
                            alert('khong in hoa don');
                        }
              

             }
                  
            });

            function saveAndPrint() {
            // Lưu hóa đơn và sau đó in nó
            // Gọi hàm để tạo hóa đơn HTML
            var invoiceHTML = generateInvoiceHTML();

            // In hóa đơn
            printInvoice(invoiceHTML);
        }

        function generateInvoiceHTML() {
            //lay so hoa don bang javascript o day
var idhoadon = "10";
            var data = {
                        idhoadon: idhoadon                       
                    };

             $.ajax({
                            type: "POST",
                            contentType: "application/json; charset=utf-8",
                            url: "Phieubanhang.aspx/thongtinhanghoa",
                            //data: JSON.stringify(data),
                            data: JSON.stringify(data),
                            dataType: "json",
                            success: function (data) {
                                const objdata = $.parseJSON(data.d);
                                    if (objdata['Table'] != "")
                                    {
                                        for (var i = 0; i < objdata['Table'].length - 1; i++)
                                        {
                                        var hanghoa = objdata['Table'][i][0];
                                        var tienhang = objdata['Table'][i][1];
                                        var loaihoadon = objdata['Table'][i][4];
                                        var sohoadon = objdata['Table'][i][6];
                                        var newrow = '<tr class="thongtinhoadon">' +
                                                                '<td id="_hanghoad">' + hanghoa + '</td>' +
                                                                '<td id="_tienhang">' + tienhang + '</td>' +
                                                                '<td id="_loaihoadon">' + loaihoadon + '</td>' +
                                                                '<td id="_sohoadon">' + sohoadon + '</td>' +                                                    
                                                                '</tr>';
                                                            $('#tbnhaphang_inhoadon').append(newrow); 
                                        }

                                        var invoiceHTML2 = "<table class='display table table-bordered dataTable no-footer'>"+
                                        "<thead>"+
                                            "<tr>"+
                                                "<th>Hanghoa</th>"+
                                                "<th>tienhang</th>"+
                                                "<th>statusKaraoke</th>"+
                                                "<th>sohoadon</th>"+                                                 
                                            "</tr>"+
                                            "<tbody id='tbnhaphang_inhoadon'>"+
                                            "</tbody>"+
                                    "</table>";  
                                    }
                                    else
                                    {
                                        //$('#tbnhaphang_inhoadon').append(newrow); 
                                    }
                        
                            },
                            error: function () {
                                //alert("No Match");
                            }
                        });            

           
            //var customerName = "ban dang in thu";//document.getElementById("customerName").value;           
            //var invoiceHTML = "<h2>Invoice</h2>" +"<p>Customer Name: " + customerName + "</p>";   
            


      
            //return invoiceHTML;
            return invoiceHTML2;
        }

        function printInvoice(invoiceHTML) {
            // Tạo một cửa sổ mới để in hóa đơn
            var printWindow = window.open('', '_blank');
            //var printWindow = window.open();
            //printWindow.document.open();
            printWindow.document.open();
            // Thêm hóa đơn HTML vào cửa sổ in
            printWindow.document.write(invoiceHTML);
            printWindow.document.close();
            // Gọi hàm in
            printWindow.print();
        }

        function SearchText() {
                //debugger;
                $("#MainContent_phieunhaphang").autocomplete({
                    source: function (request, response) {
                        var _mahang = $("#MainContent_phieunhaphang").val();
                        var data = { _mahang: _mahang };
                        $.ajax({
                            type: "POST",
                            contentType: "application/json; charset=utf-8",
                            url: "Phieubanhang.aspx/searchmahang",
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



    </script>
</asp:Content>
