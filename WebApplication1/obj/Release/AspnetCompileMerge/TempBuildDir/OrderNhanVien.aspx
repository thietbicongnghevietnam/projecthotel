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

</head>
<body>
    <form id="form1" runat="server">
        <div>


  <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-1">
            <b>Menu:</b>
          </div>
          <div class="col-sm-11">
            <ol class="breadcrumb float-sm-left">
                <li class="breadcrumb-item active"><a href="/OrderNhanVien.aspx"><b style="color:blue; font-size:20px;"></b> All </a></li>
               <%foreach (System.Data.DataRow rows in dt_nhomhang.Rows)
                                                    {%>
                                                <li class="breadcrumb-item"><a href="/OrderNhanVien.aspx?nhomhangid=<%=rows["id"].ToString() %>"><%=rows["manhomhang"].ToString() %></a></li>
                                                <%} %>  
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

   <section class="content">
      <!-- Default box -->
       <div class="card card-solid">
                                 
           <div class="row">
               <div class="col-6">
                    <%--<b style="float:left; margin-left:10px;">Tên bàn :<i id="tenbanid"></i></b>                    
                   <asp:DropDownList ID="dr_banphong" runat="server" AppendDataBoundItems="true" Class="form-control input-sm" AutoPostBack="true"
                                    DataTextField="tenphong" 
                                    DataValueField="tenphong" 
                                    CssClass="form-control input-sm">
                                </asp:DropDownList>--%>
                   <b style="float:left; margin-left:10px;">Tên Khu vuc :<i id="tenbanid"></i></b> 
                   <select name="khuvucid1" id="khuvucid" Class="form-control input-sm khuvucid" style="float:left; margin-left:10px; width:150px;"></select>      
                    <b style="float:left; margin-left:10px;">Tên bàn :<i id="tenbanid"></i></b> 
                    <select name="tenban123" id="tenban123" Class="form-control input-sm" style="float:left; margin-left:10px;width:150px;"></select>
               </div>
               <div class="col-6">
                   <i class="fa fa-save" style="font-size: 24px;color:black; padding-left: 10px;"></i><b class="saveproduct" style="color: black; padding-left: 5px;">Ghi Thực đơn</b>
               </div>
               
           </div>
          
       </div>
       

       

       <br />
      <div class="card card-solid">
        <div class="card-body pb-0">
          <div class="row d-flex align-items-stretch" style="overflow-y: scroll; height:700px;">
            
               <%foreach (System.Data.DataRow rows1 in dt_listhanghoa.Rows)
                   {%>

              <div class="col-12 col-sm-6 col-md-4 d-flex align-items-stretch">
              <div class="card bg-light">               
                <div class="card-body pt-0">
                  <div class="row">
                    <div class="col-7">
                      <h2 class="ml-4 mb-0 fa-ul text-muted"><b><mh><%=rows1["tenhang"].ToString() %></mh></b></h2>                      
                      <ul class="ml-4 mb-0 fa-ul text-muted">
                        <li class="small"><span class="fa-li"><i class="fas fa-lg fa-building"></i></span><dg><%=rows1["giaban"].ToString() %></dg>  /VNĐ</li>                        
                      </ul>
                    </div>
                    <div class="col-5 text-center">
                      <%--<img src="../../dist/img/user1-128x128.jpg" alt="user-avatar" class="img-circle img-fluid">--%>
                        <img src="<%=rows1["anh"].ToString() %>" alt="user-avatar" class="img-circle img-fluid" style="width:60px;height:50px;" />
                    </div>
                  </div>
                </div>
                <div class="card-footer">
                  <div class="text-right">
                     <input type="number" class="quantity form-control text-center" title="Số lượng" value="1" min="1"  id="quantity" name="quantity" style="width:60px;height:30px;float:left;" />                                                                                                                                                                                  
                                                            
                    <a href="#" class="btn btn-sm btn-primary button_addmenu" id="add_sanpham">
                      <i class="fa fa-plus-square"></i> Add
                    </a>
                  </div>
                </div>
              </div>
            </div>
            
              <%} %>
          </div>
        </div>
        <!-- /.card-body -->
     <%--   <div class="card-footer">
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
        </div>--%>
        <!-- /.card-footer -->
      </div>
      <!-- /.card -->

    </section>

            <div class="row">
                                    <div class="col-2">
                                        <label for="tongtien" style="float: left; margin-top: 5px;">Tiền hàng</label>
                                        <input type="text" id="tongtienid" disabled class="form-control input-sm" name="fname" style="float: left; margin-left: 10px; font-size:22px;" value="0">
                                                     <span style="float: left;padding-left: 20px; padding-top: 10px;">

                                                     </span>
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
                    },
                    error: function () {
                        //alert("No Match");
                    }
                });

            }
            else
            {
            alert('Bạn chưa chọn ban!')
        }

               
            });

 $('.button_addmenu').each(function () {
                $(this).click(function () {                  
                    var _mahang = $(this).parent().parent().parent().find('mh').text();
                    //alert(_mahang);
                    var data = { _mahang: _mahang };
                    var soluong = $(this).parent().find("input[name='quantity']").val();
                    var dongia = $(this).parent().parent().parent().find('dg').text();
                    //alert(_mahang);
                    //alert(soluong);
                    //alert(dongia);

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

                  
                })
            });




$(document).ready(function () {

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
  
$('.khuvucid').change(function() {     
      var selectedOption = $(this).val(); // Lấy giá trị của option được chọn               
        var _tenban123 =    selectedOption;
        var data = {_tenban123 : _tenban123}     
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
                                if (myArr == '0') 
                                    {
                                        //truong hop chua co hang ban
                                        $('#tbnhaphang tr').remove();
                                        $('#tongtienid').val(0);                                                                                                                       
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

                                         $('#tongtienid').val(tienhang);
                                }
 
                                }
                                else
                                {
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

    
    </script>

</body>
</html>
