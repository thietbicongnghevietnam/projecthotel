<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BaocaoBH.aspx.cs" Inherits="WebApplication1.Report.BaocaoBH" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>BÁO CÁO BÁN HÀNG THEO HÓA ĐƠN</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&amp;display=fallback">
    <link rel="stylesheet" href="../../plugins/fontawesome-free/css/all.min.css">
    <link rel="stylesheet" href="../../plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="../../plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
    <link rel="stylesheet" href="../../dist/css/adminlte.min.css">

    <link rel="stylesheet" href="../plugins/toastr/toastr.css" />

    <script src="../../plugins/jquery/jquery.min.js"></script>
    <script src="../plugins/toastr/toastr.js"></script>



</head>
<body>
     <form id="form1" runat="server">
    <div class="card">
              <div class="card-header">
                <h1>Báo cáo bán hàng theo hóa đơn</h1>
              </div>
         <div class="col-sm-12">  
             <span style="width:800PX; float:left;">
                  Từ ngày:                                   
                     <input type="date" id="Date2" name="date" runat="server">
             Đến ngày:   
                    <input type="date" id="ngaychiid" name="date" runat="server">

             <input type="checkbox" id="check_partno_search" style="width: 20px; height: 20px;" name="check_partno_search">
                    Item:                                    
                                    <input type="text" id="partno_search" runat="server">
            
             <button class="btn btn-primary" type="button" runat="server" onserverclick="Search_Date_Click2" >                 

                        <i class="fa fa-fw fa-lg fa-search"></i>Lọc</button>
             </span>
             
             
             <span style="width:120PX; float:left;"> 
                  <asp:DropDownList ID="dr_nhanvien" runat="server" AppendDataBoundItems="true" OnSelectedIndexChanged="dr_nhanvien_SelectedIndexChanged" AutoPostBack="true"
                                                    DataTextField="U_NAME" 
                                                    DataValueField="U_NAME" 
                                                    CssClass="form-control input-sm">
                                                </asp:DropDownList> 
             </span>
             

              <%--<button class="btn btn-primary" type="button" runat="server">
                        <i class="fa fa-download"></i><a href="../TemplateReport/banhangtheongayhd.aspx" target="_blank" style="color:white">Print</a></button>--%>

             <button class="btn btn-success" type="button" runat="server" style="margin-left:50px;" onserverclick="Download_Click2" ><i class="fa fa-download">In bao cao</i></button>

             <button class="btn btn-primary" type="button" runat="server" style="margin-left:20px;" onserverclick="Download_Click" ><i class="fa fa-download"></i>Export</button>
          </div>


       

        

        <br />
              <!-- /.card-header -->
              <%--<div class="card-body">
                <div id="example1_wrapper" class="dataTables_wrapper dt-bootstrap4">--%>
                    
                    <div class="row">
                        <div class="col-sm-12">
                <table id="example1" class="table table-bordered table-striped dataTable dtr-inline" role="grid" aria-describedby="example1_info">
                  <thead>
                  <tr role="row">
                      <th class="sorting_asc" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Rendering engine: activate to sort column descending">STT</th>
                      <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1">sohd</th>
                      <%--<th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1">type</th>--%>
                     <%-- <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1">ngaygiothue</th>
                      <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1">ngaygiora</th>--%>
                     <%-- <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1">tongthoigianthue</th>--%>
                      <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1">tenphong</th>
                    <%--  <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1">tienphong</th>
                      <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1">tiengiohat</th>--%>
                     <%-- <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1">Hanghoa</th>--%>
                      <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1">tienhang</th>
                      <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1">tongtien</th>
                      <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1">chietkhau</th>
                      <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1">VAT</th>
                      <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1">tiensauchietkhau</th>
                       <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1">Congno</th>
                      <%--<th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1">hinhthucnghi</th>
                      <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1">mohinh</th>--%>
                      <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1">created</th>                      
                      <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1">Action</th>
                      

                  </thead>
                  <tbody>

               <%--       <%
    int ParseIntSafe(object value)
    {
        if (value == DBNull.Value || value == null)
            return 0;

        int result;
        return Int32.TryParse(value.ToString(), out result) ? result : 0;
    }
%>--%>

                       <%int i = 0; %>
                                            <%foreach (System.Data.DataRow rows in dtbaocaobanhang.Rows)
                                                {%>   
                        <%i++;%>
                  <tr role="row" class="odd">
                    <td class="sorting_1 dtr-control"><%=i %></td>
                    <td><%=rows["sohd"].ToString()%></td>
                    <%--  <td><%=rows["type"].ToString()%></td>--%>
                     <%-- <td><%=rows["ngaygiothue"].ToString()%></td>
                      <td><%=rows["ngaygiora"].ToString()%></td>--%>
                    <%--  <td><%=rows["tongthoigianthue"].ToString()%></td>--%>
                      <td><%=rows["tenphong"].ToString()%></td>
                     <%-- <td><%=rows["tienphong"].ToString()%></td>
                      <td><%=rows["tiengiohat"].ToString()%></td>--%>
                     <%-- <td><%=rows["items"].ToString()%></td>--%>
                      <td><%=String.Format("{0:N0}", Int32.Parse(rows["tienhang"].ToString()))%></td>
                      <td><%=String.Format("{0:N0}", Int32.Parse(rows["tongtien"].ToString()))%></td>
                      <td><%=String.Format("{0:N0}", Int32.Parse(rows["chietkhau"].ToString()))%></td>
                      <td>
                        <%=rows["VAT"].ToString()%>
                      </td>
                      <td><%=String.Format("{0:N0}", Int32.Parse(rows["tiensauchietkhau"].ToString()))%></td>
                      <td><%=rows["psco"].ToString()%></td>
                      <%--<td><%=rows["hinhthucnghi"].ToString()%></td>
                      <td><%=rows["mohinh"].ToString()%></td>--%>

                    <%if ((i == dtbaocaobanhang.Rows.Count)  && rows["created"].ToString() != "") { %>
                        <td></td>
                    <%} %>                                        
                    <%else { %>
                            <td><%=rows["created"].ToString()%></td>
                    <%} %>

                       

                    <td>
                       <%-- <a href="#" class="btn btn-info btn-sm" title="delete item" onclick="openEditModal2('<%= rows["sohd"].ToString() %>')"><i class="fas fa-pencil-alt"></i>View</a>
                        &nbsp;&nbsp;--%>
                        <a href="#" class="btn btn-info btn-sm" title="delete item" onclick="openEditModal6('<%= rows["id"].ToString() %>')" ><i class="fas fa-pencil-alt"></i>Chi tiet HD</a>
                    </td>
                    
                  </tr>
                      <%} %>
                  

                  </tbody>
               
                </table>

                        </div>
                    </div>
   </div>

         <div class="modal" id="myModal6">
            <div class="modal-dialog modal-lg" >
                <div class="modal-content">
                    <div class="modal-header">
                        <div class="row">
                            <div>
                                <h4 class="modal-title" id="headerTag" style="float: left">THÔNG TIN HÓA ĐƠN BÁN HÀNG</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="float: right; margin-left: 300px;">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                        </div>
                    </div>


                    <div class="modal-body">
                       <div class="container-fluid"  style="width:700px;height:auto;">
                       <%--<div class="container-fluid" id="printableArea" style="width:400px;height:auto; float:left">--%>
                            Loại hình: <b id="hinhthucnghi2"></b>
                            &nbsp;&nbsp;&nbsp; tổng tiền hát: <b id="tongtienhat2"></b><br />
                           Tên phòng: <b id="tenphong2"></b>
                           &nbsp;&nbsp;&nbsp; SHD:  <b id="hoadon2"></b> <%--Tổng tiền hàng:--%> <%--<b id="tongtien2"></b>      --%>                                                


                                <div style="width: 100%; height: 300px; float: left;">  
                                    <table class="display table table-bordered dataTable no-footer">
                                        <thead>
                                            <tr>
                                                <th>Mã hàng</th>
                                                <th>Tên Hàng</th>
                                                <th>Số lượng</th>
                                                <th>Chiết khấu</th>
                                                <th>Thành tiền</th>                                             
                                            </tr>
                                            </thead>
                                            <tbody id="tbnhaphang_inhoadon">
                                            </tbody>


                                    </table>
                                </div>
                            
                           <br /> 
                           Tổng tiền: <b id="thantoan2"></b> &nbsp;&nbsp;&nbsp;  C/K: <b id="chietkau2"></b> <br />
                           KH thanh toán: <b id="khthanhtoan2"></b> &nbsp;&nbsp;&nbsp; Còn lại: <b id="psno2"></b>     
                           <div>Bằng chữ: <span id="bangchuid" style="font-weight:200; color:red;"></span></div>
                        </div>
                        
                                                                           
                    </div>

                    <div class="modal-footer">
                       <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fas fa-times"></i>Close</button>                                                                                            
                    </div>
                </div>
            </div>
        </div>

        <div class="modal" id="myModal2">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <div class="row">
                            <div>
                                <h4 class="modal-title" id="headerTag" style="float: left">Chi tiết hóa đơn bán hàng</h4>
                                <h6 class="modal-title" id="headerTag" style="float: left; color:red"><b><i>Báo cáo bán hàng</i></b></h6>

                                <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="float: right; margin-left: 300px;">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>

                        </div>
                    </div>

                    <%-- Modal footer --%>
                    <div class="modal-body">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="ID">Số HĐ</label>
                                        <span style="color: green; font-size: 11px; font-style: italic;">(Read only)</span>
                                        <asp:TextBox ID="txtsohoadon" CssClass="form-control" placeholder="" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                       <label for="exampleInputEmail1">Người bán</label>
                                        <span style="color: red; font-size: 11px; font-style: italic;">You must input!(*)</span>
                                        <asp:TextBox ID="txtuserid" CssClass="form-control" placeholder="" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div> 

                             <%--<div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">                                          
                                        <label id="lbl_machine" for="dr_machine">Reason</label>
                                        <asp:DropDownList ID="dr_lydo" runat="server"
                                            AppendDataBoundItems="true"
                                            DataTextField="Title"
                                            DataValueField="Title"
                                            CssClass="custom-select custom-select-sm form-control form-control-sm">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group" >
                                       <label for="ID">Department</label>
                                        <asp:DropDownList ID="dr_phongban" runat="server"
                                            AppendDataBoundItems="true"
                                            DataTextField="Maphongban"
                                            DataValueField="Maphongban"
                                            CssClass="custom-select custom-select-sm form-control form-control-sm">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>--%>

                             <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="QtyNG">Date borrow</label>                                       
                                        <input type="text" id="txtngaymuon" runat="server">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Date Return</label>                                                                               
                                        <input type="text" id="txtngaytra" runat="server">
                                    </div>
                                </div>
                            </div>
                            
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fas fa-times"></i>Close</button>
                        <button type="button" runat="server" id="btnOrder" class="btn btn-primary" onserverclick="BtnOrderItem">
                            <i class="fas fa-download"></i>
                            Save 
                        </button>
                    </div>
                </div>
            </div>
        </div>
                    
             <%-- </div>
              <!-- /.card-body -->
            </div>--%>
    </form>

        <script src="../../plugins/jquery/jquery.min.js"></script>
    <script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>

    <script src="../../plugins/datatables/jquery.dataTables.min.js"></script>
    <script src="../../plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
    <script src="../../plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
    <script src="../../plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
    <script src="../../dist/js/adminlte.min.js"></script>
    <script src="../../dist/js/demo.js"></script>
    <script>
         $(document).ready(function () {            
            //$('#txtdevice').prop("readonly", true);
        });

          $(function () {
              $("#example1").DataTable({
                    "paging": true,
                  "lengthChange": true,
                  "searching": true,
                  "ordering": true,
                  "info": true,
                  "responsive": true,
                  "autoWidth": true,
                   "pageLength": 50,
                });
                //$('#example2').DataTable({
                //  "paging": true,
                //  "lengthChange": false,
                //  "searching": false,
                //  "ordering": true,
                //  "info": true,
                //  "autoWidth": false,
                //  "responsive": true,
                //});
        });

        //function openEditModal2(sohoadon) {           
        //    $("#txtsohoadon").val(sohoadon);
        //    $('#myModal2').modal('show');
        //}

        function openEditModal6(idhoadon)
        {
             var _fromdate  = $("#Date2").val();
             var _todate  = $("#ngaychiid").val();
             var data = {
                                idhoadon: idhoadon,
                                _fromdate: _fromdate,
                                _todate: _todate
                            };

               $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "BaocaoBH.aspx/thongtinhoadon",
                        //data: JSON.stringify(data),
                        data: JSON.stringify(data),
                        dataType: "json",
                        success: function (data) {
                        debugger;
                            const objdata = $.parseJSON(data.d);
                            $('#tbnhaphang_inhoadon tr').remove();
                             var tongtienhang = "";//$('#tongtiennhap').val();
                                var tongchietkhau = "";//$('#chietkhauid').val();                                
                                var khachthanhtoan = "";//$('#thanhtoanid').val();                             
                                var khachno =  "";//$('#conlaiid').val();
                                var ngaytao = "";//dd + "-" + mm + "-" + yyyy;//;$('#soHD').val();
                            var sohoadon = "";$('#soHD').val();                               
                            var biendem = objdata['Table1'].length;
                            //debugger;
                            for (var i = 0; i < objdata['Table1'].length - 1; i++) {
                                    //console.log(objdata['Table1'].length);
                                    var tenhang = objdata['Table1'][i][0];
                                    var dongia = objdata['Table1'][i][1];
                                    var soluong = objdata['Table1'][i][2];
                                    var chietkhau = "";//objdata['Table1'][i][3];
                                var thanhtien = objdata['Table1'][i][4];
                                sohoadon = objdata['Table1'][i][8];
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

                            $('#thantoan2').text(tongtienhang);
                            $('#hoadon2').text(sohoadon);
                                                            
                                                                               
                        },
                        error: function () {
                            //alert("No Match");
                            alert('kiem tra la trang thai hoa don!');
                        }
            });
            $('#myModal6').modal('show');    

        }


</script>


</body>
</html>
