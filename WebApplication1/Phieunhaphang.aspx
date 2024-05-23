<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Phieunhaphang.aspx.cs" Inherits="WebApplication1.Phieunhaphang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="wrapper">
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h3 class="m-0"><b>PHIẾU NHẬP HÀNG</b></h3>
                    </div><!-- /.col -->
                </div><!-- /.row -->
            </div><!-- /.container-fluid -->
        </div>

    <table id="dnhaphang" style="padding-bottom: 10px; padding-right: 10px;padding-top: 20px;padding-left: 20px;">

                <tr>
                    <td style="padding-bottom: 10px; padding-right: 10px;">
                        <b>Mã hàng </b><br />
                        Nhập nhanh<input type="checkbox" id="bannhanhid" name="bannhanh">
                    </td>
                <td style="padding-bottom: 10px; padding-right: 10px;">
                    <span id="tenhanghoaid" hidden ></span>
                    <span id="mahanghoa" hidden ></span>
                    <asp:TextBox ID="phieunhaphang" Style="float: left; width: 100%;" class="ajax form-control input-sm" value="" placeholder="Chọn tên hàng" runat="server"></asp:TextBox>
                </td>
                <td style="padding-bottom: 10px; padding-right: 10px;"><b>Số lượng: </b></td>
                <td style="padding-bottom: 10px; padding-right: 10px;">
                <input id="soluongnhaphang" name="soluongnhaphang" class="form-control input-sm" value="" style="width:60px;float:left; margin-right:3px;"/>
                <input id="dvtnhonhat" name="donvitinh" class="form-control input-sm" value="" style="width:60px;float:left;" />
                </td>
                    <td style="padding-bottom: 10px; padding-right: 10px;">                        
                        <asp:DropDownList ID="dr_dvt" runat="server" AppendDataBoundItems="true" 
                            DataTextField="dvtto" 
                            DataValueField="dvtto" 
                            CssClass="form-control input-sm">
                        </asp:DropDownList>
                </td> 

                <td style="padding-bottom: 10px; padding-right: 10px;">               
                        <asp:DropDownList ID="dr_nhacungcap" runat="server" AppendDataBoundItems="true" 
                            DataTextField="mancc" 
                            DataValueField="id" 
                            CssClass="form-control input-sm">
                        </asp:DropDownList>
                     
                   
                

                </td>
                <td>
                    <span class="addphieunhap" style="padding-right: 10px; padding-left:10px;">                
                    <i class="fa fa-plus-square" style="font-size: 24px; padding-left: 20px;"></i>
                    <b class="add_hanghoa" style="color: black; padding-left: 5px;">&nbsp;Thêm</b>
                    </span>
                    <span class="editphieunhap" style="padding-right: 10px; padding-left:10px;">                
                        <i class="fa fa-pencil" style="font-size: 24px; padding-left: 10px;"></i>
                        <b class="editproduct" style="color: black; padding-left: 10px;">Sửa</b>
                    </span>
                    <span class="delnhaphang" style="padding-right: 10px;">                
                        <i class="fa fa-times" style="font-size: 24px; padding-left: 10px;"></i>
                        <b class="delproduct" style="color: black; padding-left: 5px;">&nbsp;Xóa</b>
                    </span>
                 </td>

                    <td>
                        <span class="addKhachhang" style="padding-right: 5px; padding-left:5px;">
                        <i class="fa fa-plus-square" style="font-size: 24px; padding-left: 5px;"></i>
                        <b class="add_Khachhang" style="color: black; padding-left: 5px; float:left">&nbsp;Thêm NCC</b>
                        </span>
                    </td>
                    <td>                       
                        <label for="inhoadon" style="float: left; margin-top: 5px; padding-left:10px;">In hóa đơn</label>
                        <input type="checkbox" id="inHD" name="inHD">                        
                    </td>
                    <td>                       
                        <label for="inhoadon" style="float: left; margin-top: 5px; padding-left:10px;">SHD</label>
                        <input id="soHD" name="soHD" class="form-control input-sm" value="<%=sohoadon %>"" style="width:80px;"/>                 
                    </td>
                
                </tr>
                </table>

               <%-- <div style="padding-bottom: 20px;">
                
                </div>--%>

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
                <input style="width: 180px; float: left;font-size:30px;" id="tongtiennhap" disabled="disabled" name="tongtiennhap" type="text" class="form-control input-sm" value="0"/></span>

                <span style="float: left; padding-right: 10px; padding-top: 20px;"><b style="float: left">Chiết khấu &nbsp;&nbsp;</b>
                    <input style="width: 180px; float: left;font-size:30px; background-color:aqua; color:black;" id="chietkhauid"  name="chietkhauid" type="text" class="form-control input-sm" value="0"/>
                </span>
                
                <span style="float: left; padding-right: 10px; padding-top: 20px;"><b style="float: left">Thanh toán &nbsp;&nbsp;</b>
                    <input style="width: 180px; float: left;font-size:30px; background-color:aqua; color:black;" id="thanhtoanid" name="thanhtoanHD" type="text" class="form-control input-sm" value="0"/>
                </span>

                <span style="float: left; padding-right: 10px; padding-top: 20px;"><b style="float: left">Còn lại &nbsp;&nbsp;</b>
                    <input style="width: 180px; float: left;font-size:30px; background-color:aqua; color:black;" id="conlaiid" name="conlaiHD" type="text" class="form-control input-sm" value="0"/>
                </span>
               
                <span style="float: left; padding-right: 10px; padding-top: 20px; padding-left: 50px;">
                    <input type="submit" value="Ghi hoa don" id="ghilaihoadon"  class="btn btn-success float-right">   
                </span>


                </div>

                <br />
        <br />
         <br />
                <div style="float:left; padding-left:50px;font-size:30px;"><b>Bằng chữ:&nbsp;&nbsp;&nbsp;&nbsp; <span id="bangchuid2" style="font-weight:500; font-size:32px; color:red;padding-left:10px;"></span></b> </div>
                            
                <br />
                <br />

        <div class="modal" id="myModal">
            <div class="modal-dialog" >
                <div class="modal-content">
                    <div class="modal-header">
                        <div class="row">
                            <div>
                                <h4 class="modal-title" id="headerTag" style="float: left">Thêm nhà cung cấp</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="float: right; margin-left: 300px;">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                        </div>
                    </div>


                    <div class="modal-body">
                       
                       <div class="container-fluid" id="printphieunhaphang" style="width:400px;height:auto;">
                                                                             
                           <div class="form-group">
                            <label for="recipient">Mã Nhà cung cấp:</label>
                               <input class="form-control" name="makhachhang" id="idmakh" type="text" placeholder="mancc" /> 
                               <%--<asp:TextBox ID="idmakh" runat="server" class="form-control" />--%>
                          </div>
                            <div class="form-group">
                            <label for="recipient">Tên NCC:</label>
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
                        <button type="button" runat="server" id="Button1"  class="btn btn-primary" onclick="addnewkhachhang()" >Save</button>                                                                                                                                                                     
                    </div>
                </div>
            </div>
        </div>

        <div class="modal" id="myModal6">
            <div class="modal-dialog modal-lg" >
                <div class="modal-content">
                    <div class="modal-header">
                        <div class="row">
                            <div>
                                <h4 class="modal-title" id="headerTag" style="float: left">Phiếu nhập hàng</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="float: right; margin-left: 300px;">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                        </div>
                    </div>


                    <div class="modal-body" id="printableArea" style="height:auto;">
                       
                       <%--<div class="container-fluid"  style="width:400px;height:auto;">--%>
                        <div class="container-fluid"  style="width:700px;height:auto;">  <%--float:left--mau in nho--%>
                         <%--   Hinh thuc: <b id="hinhthucnghi2"></b>
                            &nbsp;&nbsp;&nbsp; tongtienhat: <b id="tongtienhat2"></b><br />
                           Ten phong: <b id="tenphong2"></b>
                           &nbsp;&nbsp;&nbsp; Tong tien hang: <b id="tongtien2"></b>        --%>   
                            <span><i style="font-size:22px; text-align:center;"><%=tendovi %></i></span><br />  
                           <span> Địa chỉ: <%=diachidonvi %></span><br />
                            <span> Số ĐT: <%=sodtdonvi %></span><br />
                           Số HĐ: <b id="sohoadoid"></b> &nbsp;&nbsp;&nbsp; Ngày tạo: <b id="ngaytaoid"></b>

                                <div style="width: 100%; height: auto; float: left;">  
                                    <table class="display table table-bordered dataTable no-footer">
                                        <thead>
                                            <tr>
                                                <th>Mã hàng</th>
                                                <th>Tên Hàng</th>
                                                <th>Số lượng</th>
                                                <th>Chiết khấu</th>
                                                <th>Thành tiền</th>                                                 
                                            </tr>
                                            <tbody id="tbnhaphang_inhoadon">
                                            </tbody>


                                    </table>
                                </div>
                            
                           <br /> 
                           Tổng tiền: <b id="thantoan2"></b> &nbsp;&nbsp;&nbsp;  C/K: <b id="chietkau2"></b> <br />
                           KH thanh toán: <b id="khthanhtoan2"></b> &nbsp;&nbsp;&nbsp; Còn lại: <b id="psno2"></b>     
                           <div>Bằng chữ: <span id="bangchuid" style="font-weight:300; color:red; font-size:20px; padding-left:10px;"></span></div>
                        </div>
                        
                                                                           
                    </div>

                    <div class="modal-footer">
                       <%--<button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fas fa-times"></i>Close</button> --%>
                        <button type="button" runat="server" id="Button2"  class="btn btn-primary" onclick="printDiv_Close()" >Close</button>
                        <button type="button" runat="server" id="Button3"  class="btn btn-primary" onclick="printDiv('printableArea')" > 
                            <i class="fas fa-download"></i>
                            In HĐ
                        </button> 
                    </div>
                </div>
            </div>
        </div>


    </div>
     <script type="text/javascript">
        $(document).ready(function () {
            SearchText();            
         });

        const defaultNumbers =' hai ba bốn năm sáu bảy tám chín';
        const chuHangDonVi = ('1 một' + defaultNumbers).split(' ');
        const chuHangChuc = ('lẻ mười' + defaultNumbers).split(' ');
        const chuHangTram = ('không một' + defaultNumbers).split(' ');

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
                    var tram = chuHangTram[_a[0]] + ' trăm';
                    return tram + ' ' + chuc_dv;
                }
        };

        function convert_block_two(number) {
                var dv = chuHangDonVi[number[1]];
                var chuc = chuHangChuc[number[0]];
                var append = '';

                // Nếu chữ số hàng đơn vị là 5
                if (number[0] > 0 && number[1] == 5) {
                dv = 'lăm'
                }

                // Nếu số hàng chục lớn hơn 1
                if (number[0] > 1) {
                append = ' mươi';
    
                if (number[1] == 1) {
                    dv = ' mốt';
                }
                }

            return chuc + '' + append + ' ' + dv; 
        };

        const dvBlock = '1 nghìn triệu tỷ'.split(' ');

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

         function printDiv_Close()
            {
                //alert('asdfas');
                //setTimeout(function() {
                //    location.reload();
                //    }, 1000);
              $('#tongtiennhap').val('0');
                $('#thanhtoanid').val('0');
                $('#chietkhauid').val('0');                           
                $("#soluongnhaphang").val('0');
                $("#conlaiid").val('0');
             $('#myModal6').modal('hide');
             $("#MainContent_phieunhaphang").select();
            
             $('#bangchuid').text('');
             $('#bangchuid2').text('');
         }

         function printDiv(divId) {              
               try {                                       
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
                                                                                                                                                       
                    setTimeout(function() {
                    location.reload();
                   }, 1000);
    
                 $("#MainContent_phieunhaphang").select();

  
                }
                catch(err) {
                 console.log(err.tostring());
                 alert(err.tostring());
                }                                                
         }

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
                        url: "Phieunhaphang.aspx/Savekhachhang",
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

         $('#bannhanhid').change(function() {
            if($(this).is(":checked")) {
                //var returnVal = confirm("Are you sure?");
                //$(this).attr("checked", returnVal);
                $('#soluongnhaphang').val(1);               
               // alert('scan QR');
            } else {
                $('#soluongnhaphang').val('');
                //alert('ban 2');
            }
            //$('#bannhanhid').val($(this).is(':checked'));        
        });

        $("#MainContent_phieunhaphang").on('keyup', function (e) {
            if ((e.key === 'Enter' || e.keyCode === 13)) {    
                var ckQRcode = document.getElementById("bannhanhid");
                if (ckQRcode.checked == true) {
                    var mahang = $("#MainContent_phieunhaphang").val();
                    var data = { mahang: mahang };
                    //new1
                     $.ajax({
                                type: "POST",
                                contentType: "application/json; charset=utf-8",
                                url: "Phieunhaphang.aspx/laymahang_chuan",                                
                                data: JSON.stringify(data),
                                dataType: "json",
                         success: function (data) {   
                             //alert(data.d);                            
                            if (data.d != "NG") {
                                var chuoihang = data.d.split(',');                                
                                $("#mahanghoa").text(chuoihang[0]);
                                $("#dvtnhonhat").val(chuoihang[1]);    
                                $("#MainContent_dr_dvt").val('==DVT==');
                            } 
                            else 
                            {
                                alert('Khong co trong danh muc hang hoa!');
                            }                            
                        },
                        error: function () {
                            //alert("No Match");
                        }
                    });

                    //alert('Scan QRcode');                    
                    soluong_keyenter();
                }
                else
                {                    
                    // khong scan QRcode
                    var tenhang = $("#MainContent_phieunhaphang").val();
                    var data = { tenhang: tenhang };
                    //new1
                     $.ajax({
                                type: "POST",
                                contentType: "application/json; charset=utf-8",
                                url: "Phieunhaphang.aspx/laymahang",                                
                                data: JSON.stringify(data),
                                dataType: "json",
                         success: function (data) {   
                             //alert(data.d);                            
                            if (data.d != "NG") {
                                var chuoihang = data.d.split(',');                                
                                $("#mahanghoa").text(chuoihang[0]);
                                $("#dvtnhonhat").val(chuoihang[1]);    
                                $("#MainContent_dr_dvt").val('==DVT==');
                            } 
                            else 
                            {
                                alert('Khong co trong danh muc hang hoa!');
                            }                            
                        },
                        error: function () {
                            //alert("No Match");
                        }
                    });

                    $("#soluongnhaphang").val(1);
                    $("#soluongnhaphang").select();
                }
                    //$("#soluongnhaphang").val(1);
                    //$("#soluongnhaphang").select();
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
                        var soluong_dvt = 1;
                        var ktdvt = $('#MainContent_dr_dvt').val();
                        var tongtienhang = parseInt($('#tongtiennhap').val());
                        //==DVT==           
                        if(ktdvt == "==DVT==")
                        {
                            soluong_dvt = 1;
                            handledonvitinh(ktdvt,soluong_dvt,tongtienhang);
                        }
                        else
                        {
                            //lay ra so luong cau thanh don vi tinh
                            var donvinhonhat = $('#dvtnhonhat').val();
                            var kiemtramahang = $('#mahanghoa').text();
                            var donvilonhon = $('#MainContent_dr_dvt').val();
                
                            var data = {donvinhonhat:donvinhonhat, kiemtramahang:kiemtramahang, donvilonhon:donvilonhon}

                            $.ajax({
                                type: "POST",
                                contentType: "application/json; charset=utf-8",
                                url: "Phieunhaphang.aspx/laysoluongdvt",
                                data: JSON.stringify(data),
                                dataType: "json",
                                success: function (data) {
                                    if(data.d == "NG")
                                    {
                                        //alert('mat hang khong co cau thanh don vi tinh');
                                        soluong_dvt = 1;
                                        handledonvitinh(ktdvt,soluong_dvt,tongtienhang);
                                    }
                                    else
                                    {
                                        //alert(data.d);
                                        soluong_dvt = data.d;
                                        handledonvitinh(ktdvt,soluong_dvt,tongtienhang);
                                    }                                                      
                                },
                                error: function ()
                                {
                                    //alert("No Match");
                                }
                            });                
                            //soluong_dvt = 1;
                            //alert(soluong_dvt);
                        }
                        //code rut ngan o day
                        
                    }                                                                         
                });               
         });

         // nut sua hoa don
         $('.editproduct').click(function () {                  
             var ckQRcode = document.getElementById("bannhanhid");

                        var tongtienhang = parseInt($('#tongtiennhap').val());
                        $('.checknhaphang').each(function () {
                            var chk = $(this).is(':checked');
                            if (chk == true) {
                                var tenhangid = $(this).parent().parent().find('td').eq(0).text();
                                var soluong = $(this).parent().parent().find('td').eq(1).text();
                                var price = $(this).parent().parent().find('td').eq(3).text();
                                tongtienhang = tongtienhang - price;
                                $(this).parent().parent().remove();
                                $('#tongtiennhap').val(tongtienhang);
                                $('#thanhtoanid').val(tongtienhang);

                                $('#soluongnhaphang').val(soluong);
                                if (ckQRcode.checked == true) {
                                    //ban bang scan QR code
                                    var data2 = { tenhangid: tenhangid };
                                    $.ajax({
                                            type: "POST",
                                            contentType: "application/json; charset=utf-8",
                                            url: "Phieunhaphang.aspx/laymahangscan",
                                            data: JSON.stringify(data2),
                                            dataType: "json",
                                            success: function (data) {
                                                if(data.d == "NG")
                                                {
                                                    $('#MainContent_phieunhaphang').val(data.d);
                                                }
                                                else
                                                {
                                                   //nothing
                                                }                                                      
                                            },
                                            error: function ()
                                            {
                                                //alert("No Match");
                                            }
                                        });   
                                }
                                else
                                {
                                    var tenhang = $("#MainContent_phieunhaphang").val();
                                    var data = { tenhang: tenhang };
                                    //new1
                                     $.ajax({
                                                type: "POST",
                                                contentType: "application/json; charset=utf-8",
                                                url: "Phieunhaphang.aspx/laymahang",                                
                                                data: JSON.stringify(data),
                                                dataType: "json",
                                         success: function (data) {   
                                             //alert(data.d);                            
                                            if (data.d != "NG") {
                                                var chuoihang = data.d.split(',');                                
                                                $("#mahanghoa").text(chuoihang[0]);
                                                $("#dvtnhonhat").val(chuoihang[1]);    
                                                $("#MainContent_dr_dvt").val('==DVT==');

                                                $('#MainContent_phieunhaphang').val(tenhangid);
                                            } 
                                            else 
                                            {
                                                alert('Khong co trong danh muc hang hoa!');
                                            }                            
                                        },
                                        error: function () {
                                            //alert("No Match");
                                        }
                                    });

                                    //$('#MainContent_phieunhaphang').val(tenhangid);
                                }
                                                                
                                $('#soluongnhaphang').focus();
                                $('#soluongnhaphang').select();
                                
                               const bangchu_hienthi2 = to_vietnamese(tongtienhang);
                               $('#bangchuid2').text(bangchu_hienthi2);
                                

                            }
                        })
                    });

        $("#soluongnhaphang").on('keyup', function (e) {
            if ((e.key === 'Enter' || e.keyCode === 13))
            {
                soluong_keyenter();
            }
         });

         function soluong_keyenter()
         {
            var soluong_dvt = 1;
             var ktdvt = $('#MainContent_dr_dvt').val();
             var tongtienhang = parseInt($('#tongtiennhap').val());  
            
            //==DVT==           
            if(ktdvt == "==DVT==")
            {
                soluong_dvt = 1;
                handledonvitinh(ktdvt, soluong_dvt, tongtienhang);
            }
            else
            {
                //lay ra so luong cau thanh don vi tinh
                var donvinhonhat = $('#dvtnhonhat').val();
                var kiemtramahang = $('#mahanghoa').text();
                var donvilonhon = $('#MainContent_dr_dvt').val();
                
                var data2 = {donvinhonhat:donvinhonhat, kiemtramahang:kiemtramahang, donvilonhon:donvilonhon}

                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "Phieunhaphang.aspx/laysoluongdvt",
                    data: JSON.stringify(data2),
                    dataType: "json",
                    success: function (data) {
                        if(data.d == "NG")
                        {
                            //alert('mat hang khong co cau thanh don vi tinh');
                            soluong_dvt = 1;
                            //alert('vao day 1');
                            handledonvitinh(ktdvt, soluong_dvt, tongtienhang);
                        }
                        else
                        {
                            //alert('vao day 2');
                            soluong_dvt = data.d;
                            //alert(soluong_dvt);
                            handledonvitinh(ktdvt, soluong_dvt, tongtienhang);
                        }                                                      
                    },
                    error: function ()
                    {
                        //alert("No Match");
                    }
                });                
                //soluong_dvt = 1;
                //alert(soluong_dvt);
            }
                                                                                             
         };

         function handledonvitinh(ktdvt,soluong_dvt,tongtienhang)
         {
             //alert(tongtienhang);
                //new2
                var _mahang = "";
                //var _mahang = $("#MainContent_phieunhaphang").val();
                //var _mahang = $("#mahanghoa").text();
                 var ckQRcode = document.getElementById("bannhanhid");
                 if (ckQRcode.checked == true)
                 {
                     var mahang_chuan = $("#MainContent_phieunhaphang").val();
                     //alert(mahang_chuan);
                     var data3 = {mahang_chuan : mahang_chuan}
                     //scan QRcode
                     $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "Phieunhaphang.aspx/laydungtenhang",
                        data: JSON.stringify(data3),
                        dataType: "json",
                        success: function (data) {
                            if (data.d != "NG")
                            {
                                 $('#tenhanghoaid').text(data.d);
                                _mahang = $("#tenhanghoaid").text(); // Gán giá trị trong hàm gọi lại success
                                 handleMahang(_mahang,ktdvt,soluong_dvt,tongtienhang);                   
                            }
                            else
                            {
                                alert('khong ton tai ma hang, kiem tra lai!');
                                //_mahang = "";
                            }                                               
                        },
                        error: function ()
                        {
                            //alert("No Match");
                        }
                    });
                 }
                 else
                 {
                     _mahang = $("#MainContent_phieunhaphang").val();
                     handleMahang(_mahang,ktdvt,soluong_dvt,tongtienhang);
                 }
         }

         // Hàm xử lý giá trị _mahang ngoài phạm vi của hàm gọi AJAX
        function handleMahang(mahang,ktdvt,soluong_dvt,tongtienhang) {
            // Bạn có thể sử dụng giá trị _mahang ở đây
            //alert(mahang);
            var _mahang = mahang;
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
                                url: "Phieunhaphang.aspx/getthongtinmahang",
                                data: JSON.stringify(data),
                                dataType: "json",
                                success: function (data) {
                                    //response(data.d);
                                    var objdata = $.parseJSON(data.d);
                                    //debugger;
                                    var soluong = 1;//parseInt($("#soluongnhaphang").val());
                                    if(ktdvt == "==DVT==")
                                    {
                                        soluong = parseInt($("#soluongnhaphang").val());
                                    }
                                    else
                                    {
                                        soluong = parseInt(soluong_dvt)*parseInt($("#soluongnhaphang").val());
                                    }
                                    //var soluong = parseInt($("#soluongnhaphang").val());
                                    //var dongia = parseInt(objdata['Table'][0][7]);  //gia le
                                    var dongia = parseInt(objdata['Table'][0][6]);    //gia nhap  
                                    var thanhtien = parseInt(soluong) * parseInt(objdata['Table'][0][6]);
                                    //alert(thanhtien);

                                    var newrow = '<tr class="themthucdon">' +
                                        '<td id="tenhang">' + objdata['Table'][0][2] + '</td>' +
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

                                    const bangchu_hienthi2 = to_vietnamese(tongtienhang);
                                    $('#bangchuid2').text(bangchu_hienthi2);

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
                                        url: "Phieunhaphang.aspx/getthongtinmahang",
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
                                                '<td id="tenhang">' + objdata['Table'][0][2] + '</td>' +
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

                                            const bangchu_hienthi2 = to_vietnamese(tongtienhang);
                                            $('#bangchuid2').text(bangchu_hienthi2);

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

                    const bangchu_hienthi2 = to_vietnamese(tongtienhang);
                    $('#bangchuid2').text(bangchu_hienthi2);
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
                var tongtienthanhtoan =(parseFloat(tongtienhang) - parseFloat(tienck)) ; //;$("#thanhtoanid").val();
                $("#thanhtoanid").val(tongtienthanhtoan);  

                const bangchu_hienthi2 = to_vietnamese(tongtienthanhtoan);
                $('#bangchuid2').text(bangchu_hienthi2);
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
                     alert("Ban chua chon nha cung cap!");
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
                        url: "Phieunhaphang.aspx/addthongtinhanghoa_PNH",
                        //data: JSON.stringify(data),
                        data: JSON.stringify(data),
                        dataType: "json",
                        success: function (data) {
                            //alert('Hoa don thêm thành công!');  
                            $('#tbphieunhap tr').remove();
                            //$('#tongtiennhap').val('0');
                            //$('#thanhtoanid').val('0');
                            //$('#chietkhauid').val('0');
                            ////chietkhauid
                            //$("#soluongnhaphang").val('0');
                            //$("#conlaiid").val('0');
                            $("#MainContent_phieunhaphang").select();
                            $('#soHD').val(data.d);
                        },
                        error: function () {
                            //alert("No Match");
                        }
                     });

                         //debugger;
                    //bat thong tin vua luu de in ra hoa don len de in hoa don
                    var today = new Date();
                    var dd = today.getDate();
                    var mm = today.getMonth() + 1; //January is 0!
                     var yyyy = today.getFullYear();

                    var ckinhoadon = document.getElementById("inHD");
                        if(ckinhoadon.checked == true)
                        {
                            //alert('ban dang in hoa don');
                            var idhoadon = $('#soHD').val();                            
                            if (idhoadon == '0')
                            {
                                alert('Đây là hóa đơn dầu tiên, đã được ghi, bạn hãy chọn chức năng in lại!');
                            }
                            else
                            {
                                var data1 = {
                                idhoadon:idhoadon
                            };
                              $.ajax({
                                    type: "POST",
                                    contentType: "application/json; charset=utf-8",
                                    url: "Phieunhaphang.aspx/thongtinhanghoa",
                                    //data: JSON.stringify(data),
                                    data: JSON.stringify(data1),
                                    dataType: "json",
                                    success: function (data) {
                                        const objdata = $.parseJSON(data.d);
                                        //debugger;
                                        var tongtienhang = $('#tongtiennhap').val();
                                        var tongchietkhau = $('#chietkhauid').val();                                
                                        var khachthanhtoan = $('#thanhtoanid').val();
                                        //alert(khachthanhtoan);
                                        var khachno =  $('#conlaiid').val();
                                        var ngaytao = dd + "-" + mm + "-" + yyyy;//;$('#soHD').val();
                                        var sohoadon = $('#soHD').val();
                                        //alert(khachthanhtoan);
                                        //alert(sohoadon);
                                        $('#tbnhaphang_inhoadon tr').remove();   

                                            if (objdata['Table1'] != "")
                                            {                                                                                                                                               
                                                for (var i = 0; i < objdata['Table1'].length - 1; i++) {
                                                    var tenhang = objdata['Table1'][i][0];
                                                    var dongia = objdata['Table1'][i][1];
                                                    var soluong = objdata['Table1'][i][2];
                                                    var chietkhau = "";//objdata['Table1'][i][3];
                                                    var thanhtien = objdata['Table1'][i][4];
                                                    var newrow = '<tr class="thongtinhoadon">' +
                                                        '<td id="_hanghoad">' + tenhang + '</td>' +
                                                        '<td id="_tienhang">' + dongia + '</td>' +
                                                        '<td id="_loaihoadon">' + soluong + '</td>' +
                                                        '<td id="_chietkhau">' + chietkhau + '</td>' +
                                                        '<td id="_sohoadon">' + thanhtien + '</td>' +
                                                        '</tr>';
                                                    $('#tbnhaphang_inhoadon').append(newrow);                                                                                        
                                                }                                        
                                            }
                                            else
                                            {
                                                //$('#tbnhaphang_inhoadon').append(newrow); 
                                            } 
                                        //alert(sohoadon);
                                        $('#ngaytaoid').text(ngaytao);
                                        $('#sohoadoid').text(sohoadon);
                                        $('#thantoan2').text(tongtienhang);
                                        $('#khthanhtoan2').text(khachthanhtoan);
                                        $('#chietkau2').text(tongchietkhau);
                                        $('#psno2').text(khachno);   

                                        const bangchu_hienthi2 = to_vietnamese(tongtienhang);
                                        $('#bangchuid').text(bangchu_hienthi2);

                                    },
                                    error: function () {
                                        //alert("No Match");
                                    }
                                });   
                                $('#myModal6').modal('show');
                            }
                            
                        }
                        else
                        {                         
                            //alert('khong in hoa don');
                            alert('Hóa đơn thêm thành công!');
                            $('#bangchuid2').text('');

                            $('#tongtiennhap').val('0');
                            $('#thanhtoanid').val('0');
                            $('#chietkhauid').val('0');
                            //chietkhauid
                            $("#soluongnhaphang").val('0');
                            $("#conlaiid").val('0');
                        }   

                     var ckQRcode = document.getElementById("bannhanhid");
                     if (ckQRcode.checked == true)
                     {
                         $("#soluongnhaphang").val(1);
                     }

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
                        url: "Phieunhaphang.aspx/addthongtinhanghoa_PNH",
                        //data: JSON.stringify(data),
                        data: JSON.stringify(data),
                        dataType: "json",
                        success: function (data) {
                            //alert('Hoa don thêm thành công!');  
                            $('#tbphieunhap tr').remove();
                            //$('#tongtiennhap').val('0');
                            //$('#thanhtoanid').val('0');
                            //$('#chietkhauid').val('0');
                            ////chietkhauid
                            //$("#soluongnhaphang").val('0');
                            //$("#conlaiid").val('0');
                            $("#MainContent_phieunhaphang").select();
                            $('#soHD').val(data.d);  
                        },
                        error: function () {
                            //alert("No Match");
                        }
                 });

                    //debugger;
                    //bat thong tin vua luu de in ra hoa don len de in hoa don
                 var today = new Date();
                 var dd = today.getDate();
                 var mm = today.getMonth() + 1; //January is 0!
                 var yyyy = today.getFullYear();

                    var ckinhoadon = document.getElementById("inHD");
                        if(ckinhoadon.checked == true)
                        {
                            //alert('ban dang in hoa don');
                            var idhoadon = $('#soHD').val();                          
                             //alert(idhoadon);
                            if (idhoadon == '0')
                            {
                                alert('Đây là hóa đơn dầu tiên, đã được ghi, bạn hãy chọn chức năng in lại!');
                            }
                            else
                            {
                                 var data1 = {
                                idhoadon:idhoadon
                                };

                              $.ajax({
                                type: "POST",
                                contentType: "application/json; charset=utf-8",
                                url: "Phieunhaphang.aspx/thongtinhanghoa",
                                //data: JSON.stringify(data),
                                data: JSON.stringify(data1),
                                dataType: "json",
                                success: function (data) {
                                    const objdata = $.parseJSON(data.d);
                                    //debugger;
                                    var tongtienhang = $('#tongtiennhap').val();
                                    var tongchietkhau = $('#chietkhauid').val();                                
                                    var khachthanhtoan = $('#thanhtoanid').val();
                                    //alert(khachthanhtoan);
                                    var khachno =  $('#conlaiid').val();
                                    var ngaytao = dd + "-" + mm + "-" + yyyy;//;$('#soHD').val();
                                    var sohoadon = $('#soHD').val();
                                    //alert(khachthanhtoan);
                                    //alert(sohoadon);
                                    $('#tbnhaphang_inhoadon tr').remove();   

                                        if (objdata['Table1'] != "")
                                        {                                                                                                                                               
                                            for (var i = 0; i < objdata['Table1'].length - 1; i++) {
                                                var tenhang = objdata['Table1'][i][0];
                                                var dongia = objdata['Table1'][i][1];
                                                var soluong = objdata['Table1'][i][2];
                                                var chietkhau = "";//objdata['Table1'][i][3];
                                                var thanhtien = objdata['Table1'][i][4];
                                                var newrow = '<tr class="thongtinhoadon">' +
                                                    '<td id="_hanghoad">' + tenhang + '</td>' +
                                                    '<td id="_tienhang">' + dongia + '</td>' +
                                                    '<td id="_loaihoadon">' + soluong + '</td>' +
                                                    '<td id="_chietkhau">' + chietkhau + '</td>' +
                                                    '<td id="_sohoadon">' + thanhtien + '</td>' +
                                                    '</tr>';
                                                $('#tbnhaphang_inhoadon').append(newrow);                                                                                        
                                            }                                        
                                        }
                                        else
                                        {
                                            //$('#tbnhaphang_inhoadon').append(newrow); 
                                        } 
                                    //alert(sohoadon);
                                    $('#ngaytaoid').text(ngaytao);
                                    $('#sohoadoid').text(sohoadon);
                                    $('#thantoan2').text(tongtienhang);
                                    $('#khthanhtoan2').text(khachthanhtoan);
                                    $('#chietkau2').text(tongchietkhau);
                                    $('#psno2').text(khachno); 

                                    const bangchu_hienthi2 = to_vietnamese(tongtienhang);
                                    $('#bangchuid').text(bangchu_hienthi2);
                                },
                                error: function () {
                                    //alert("No Match");
                                }
                                }); 
                                
                                $('#myModal6').modal('show');

                            }

                           
                        }
                        else
                        {                         
                            //alert('khong in hoa don');
                            alert('Hóa đơn thêm thành công!');
                            $('#bangchuid2').text('');

                            $('#tongtiennhap').val('0');
                            $('#thanhtoanid').val('0');
                            $('#chietkhauid').val('0');
                            //chietkhauid
                            $("#soluongnhaphang").val('0');
                            $("#conlaiid").val('0');
                 }  

                 var ckQRcode = document.getElementById("bannhanhid");
                     if (ckQRcode.checked == true)
                     {
                         $("#soluongnhaphang").val(1);
                     }

             }
                  
         });

          $("#soHD").on('keyup', function (e) {
             if ((e.key === 'Enter' || e.keyCode === 13))
             {
                 var sohoadon = $("#soHD").val();
                    //alert(sohoadon);
                 var data = { sohoadon: sohoadon };

                 var today = new Date();
                 var dd = today.getDate();
                 var mm = today.getMonth() + 1; //January is 0!
                 var yyyy = today.getFullYear();
                 //debugger;
                 $.ajax({
                            type: "POST",
                            contentType: "application/json; charset=utf-8",
                            url: "Phieunhaphang.aspx/thongtinhanghoa2",
                            data: JSON.stringify(data),
                            dataType: "json",
                            success: function (data) {
                                const objdata = $.parseJSON(data.d); 
                                //Console.log(objdata);
                                var tongtienhang = "";//$('#tongtiennhap').val();
                                var tongchietkhau = "";//$('#chietkhauid').val();                                
                                var khachthanhtoan = "";//$('#thanhtoanid').val();
                                //alert(khachthanhtoan);
                                var khachno =  "";//$('#conlaiid').val();
                                var ngaytao = "";//dd + "-" + mm + "-" + yyyy;//;$('#soHD').val();
                                var sohoadon = $('#soHD').val();
                                //alert(khachthanhtoan);
                                //alert(sohoadon);
                                $('#tbnhaphang_inhoadon tr').remove(); 
                                var biendem = objdata['Table1'].length;
                                //for (var i = 0; i < objdata['Table1'].length - 1; i++) {
                                for (var i = 0; i < objdata['Table1'].length - 1; i++) {
                                    //console.log(objdata['Table1'].length);
                                    var tenhang = objdata['Table1'][i][0];
                                    var dongia = objdata['Table1'][i][1];
                                    var soluong = objdata['Table1'][i][2];
                                    var chietkhau = "";//objdata['Table1'][i][3];
                                    var thanhtien = objdata['Table1'][i][4];
                                    var newrow = '<tr class="thongtinhoadon">' +
                                        '<td id="_hanghoad">' + tenhang + '</td>' +
                                        '<td id="_tienhang">' + dongia + '</td>' +
                                        '<td id="_loaihoadon">' + soluong + '</td>' +
                                        '<td id="_chietkhau">' + chietkhau + '</td>' +
                                        '<td id="_sohoadon">' + thanhtien + '</td>' +
                                        '</tr>';
                                    $('#tbnhaphang_inhoadon').append(newrow); 

                                    if (i == (biendem - 2))
                                    {
                                        tongchietkhau = objdata['Table1'][i][3];
                                        tongtienhang = objdata['Table1'][i][4];
                                        khachthanhtoan = objdata['Table1'][i][5];
                                        khachno = objdata['Table1'][i][6];
                                        ngaytao = objdata['Table1'][i][7];
                                    }
                                }
                                    
                                //alert(sohoadon);
                                $('#ngaytaoid').text(ngaytao);
                                $('#sohoadoid').text(sohoadon);
                                //alert(khachthanhtoan);
                                $('#thantoan2').text(tongtienhang);
                                $('#khthanhtoan2').text(khachthanhtoan);
                                $('#chietkau2').text(tongchietkhau);
                                $('#psno2').text(khachno);   

                                const bangchu_hienthi2 = to_vietnamese(tongtienhang);
                                $('#bangchuid').text(bangchu_hienthi2);

                            },
                            error: function () {
                                //alert("No Match");
                     }

                 });
                 $('#myModal6').modal('show');
             }
         }); 

        function SearchText() {
                //debugger;
                $("#MainContent_phieunhaphang").autocomplete({
                    source: function (request, response) {
                        var _mahang = $("#MainContent_phieunhaphang").val();
                        var data = { _mahang: _mahang };
                        $.ajax({
                            type: "POST",
                            contentType: "application/json; charset=utf-8",
                            url: "Phieunhaphang.aspx/searchmahang",
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
