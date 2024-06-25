﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DMcauthanhDVT.aspx.cs" Inherits="WebApplication1.Danhmuc.DMcauthanhDVT" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Danh mục cấu thành ĐVT</title>
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
 <%--   <script src="../Exportexcel/jquery.table2excel.min.js"></script>--%>
</head>
<body>
    
      <form id="form1" runat="server">
        <div>
            <div class="card">
            <div class="card-header">
                <h1>Danh mục cấu thành ĐVT</h1>
                <br />
                <%--class="card-title"--%>
                <div class="col-sm-12">
                    <div style="float:left;">
                        Từ ngày:
                                    <%--<input type="text" id="datepicker" runat="server">--%>
                                    <input type="date" id="Date1" name="date" runat="server">
                        Đến ngày:                                    
                                    <input type="date" id="ngaychiid" name="date" runat="server">
                                    

                    <%--<input type="checkbox" id="check_partno_search" style="width: 20px; height: 20px;" name="check_partno_search">--%>
                   <%-- Bàn / Phòng:                                    
                                    <input type="text" id="banphongid" runat="server">--%>
                    </div>
                    
                  
                    <span style="padding-left:20px;"></span>
                   <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
                     Thêm mới
                    </button>
                    
                    

                    <%--<button class="btn btn-primary" type="button" runat="server" style="margin-left:20px;"  >
                        Inventory Equipment
                    </button>--%>
                  
                          
                    <button class="btn btn-primary" type="button" runat="server" style="margin-left:20px;" onserverclick="Download_Click" ><i class="fa fa-download"></i>Export</button>

                    <%--<button class="btn btn-success" type="button" runat="server" style="margin-left:50px;" ><i class="fa fa-download"></i><a href="ReportBorrowReturn.aspx" target="_blank" style="color:blue">Report Item</a></button>--%>
                  <%--  <button class="btn btn-success" type="button" runat="server" style="margin-left:50px;" onserverclick="Download_Click2" ><i class="fa fa-download">Report Item</i></button>

                    <input type="text" id="itemid" runat="server">--%>
                   

                </div>


                <div class="col-md-3" style="float: left">
                    <div class="form-group">
                        
                    </div>
                </div>

               
               
            </div>
        </div>


             <div>
            <table id="example" class="table table-striped table-bordered" style="width:100%">
        <thead>
            <tr>
                 <tr role="row">
                                        <th>NO</th>
                                        <th>Ma Hang</th>
                                        <th>DVT T0</th>                                                                                                                      
                                        <th>So luong quy doi</th>  
                                        <th>DVT nho</th>  
                     <th>Giá nhập</th>
                     <th>Giá bán</th>
                     <th>Giá sỉ</th>
                     <th>Giá cấu thành</th>

                                        <th>Action</th>
                                    </tr>
            </tr>
        </thead>
        <tbody>
                                <%int i = 0; %>
                                    <%foreach (System.Data.DataRow rows in dt_dvt.Rows)
                                        {%>
                                     <%i++;%>
                                    <tr role="row">                                        
                                        <td><%=i %></td>
                                        <td><%=rows["mahang"].ToString()%></td>
                                        <td><%=rows["dvtto"].ToString()%></td>
                                        <td><%=rows["soluongqudoi"].ToString()%></td>
                                        <td><%=rows["dvtnho"].ToString()%></td> 
                                        
                                        <td><%=rows["gianhap"].ToString()%></td>
                                        <td><%=rows["giaban"].ToString()%></td>
                                        <td><%=rows["giabuon"].ToString()%></td>
                                        <td><%=rows["giaban2"].ToString()%></td>
                                        
                                        <td>
                                            <a href="#" class="btn btn-info btn-sm" title="delete item" onclick="openEditModal2('<%= rows["id"].ToString() %>',
                                                '<%= rows["mahang"].ToString() %>',
                                                '<%= rows["dvtto"].ToString() %>',
                                                '<%= rows["soluongqudoi"].ToString() %>',
                                                '<%= rows["dvtnho"].ToString() %>',
                                                '<%=rows["gianhap"].ToString()%>',
                                                '<%=rows["giaban"].ToString()%>',
                                                '<%=rows["giabuon"].ToString()%>',
                                                '<%=rows["giaban2"].ToString()%>'
                                                )"><i class="fas fa-pencil-alt"></i>Sửa</a>
                                        </td> 
                                        
                                    </tr>
                                    <%} %>
                             </tbody>              

    </table>
        </div>



        </div>


         <div class="modal" id="myModal2">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <div class="row">
                            <div>
                                <h4 class="modal-title" id="headerTag" style="float: left">Sửa cấu thành đơn vị tính</h4>
                                <%--<h6 class="modal-title" id="headerTag" style="float: left; color:red"><b><i>Chi tiết tồn kho!</i></b></h6>--%>

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
                                        <label for="ID">ID</label>
                                        <span style="color: green; font-size: 11px; font-style: italic;">(Read only)</span>
                                        <asp:TextBox ID="txtid" CssClass="form-control" placeholder="" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                       <label for="exampleInputEmail1">Mã hàng</label>                                        
                                        <asp:TextBox ID="txtmahang" CssClass="form-control" placeholder="" runat="server"></asp:TextBox>                                        
                                    </div>
                                </div>
                            </div>                                                                                   
                        </div>

                         <div class="container-fluid">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="ID">Đơn vị to</label>                                        
                                        <asp:TextBox ID="txtto" CssClass="form-control" placeholder="" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                       <label for="exampleInputEmail1">Số lượng Quy đổi</label>                                        
                                        <asp:TextBox ID="txtquydoi" CssClass="form-control" placeholder="" runat="server"></asp:TextBox>                                        
                                    </div>
                                </div>
                            </div>                                                                                   
                        </div>
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="ID">Đơn vị nhỏ</label>                                        
                                        <asp:TextBox ID="txtnho" CssClass="form-control" placeholder="" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                       
                                    </div>
                                </div>
                            </div>                                                                                   
                        </div>

                         <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="ID">Giá nhập</label>                                        
                                        <asp:TextBox ID="suagianhap" CssClass="form-control" placeholder="0" Text="0" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                            <label for="exampleInputEmail1">Giá sỉ</label>                                       
                                        <asp:TextBox ID="suagiasi" CssClass="form-control" placeholder="0" Text="0" runat="server"></asp:TextBox>                                          
                                    </div>
                                </div>
                            </div>

                    <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="ID">Giá bán</label>                                        
                                        <asp:TextBox ID="suagiaban" CssClass="form-control" placeholder="0" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                            <label for="exampleInputEmail1">Giá đã cấu thành</label>                                       
                                        <asp:TextBox ID="suagiadvto" CssClass="form-control" placeholder="0" runat="server"></asp:TextBox>                                          
                                    </div>
                                </div>
                           </div>


                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fas fa-times"></i>Đóng</button>
                        <button type="button" runat="server" id="btnOrder" onserverclick="updatekhuvuc" class="btn btn-primary">
                            <i class="fas fa-download"></i>
                            Ghi lại
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal -->
<div class="modal" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Thêm mới danh mục cấu thành đơn vị tính</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span>
        </button>
      </div>
      <div class="modal-body">
                         <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="ID">Mã hàng</label>
                                        <span style="color: red; font-size: 11px; font-style: italic;">You must input!(*)</span>
                                        <asp:TextBox ID="mahangid" CssClass="form-control" placeholder="" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                       <label for="exampleInputEmail1">Đơn vị to</label>
                                        <span style="color: red; font-size: 11px; font-style: italic;">You must input!(*)</span>
                                        <asp:TextBox ID="dvtoid" CssClass="form-control" placeholder="" runat="server"></asp:TextBox>                                        
                                    </div>
                                </div>
                            </div>
                         <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="ID">Số lượng quy đổi</label>
                                        <span style="color: red; font-size: 11px; font-style: italic;">You must input!(*)</span>
                                        <asp:TextBox ID="slquydoiid" CssClass="form-control" placeholder="0" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                            <label for="exampleInputEmail1">Đơn vị nhỏ</label>
                                        <span style="color: red; font-size: 11px; font-style: italic;">You must input!(*)</span>
                                        <asp:TextBox ID="dvnhoid" CssClass="form-control" placeholder="" runat="server"></asp:TextBox>                                          
                                    </div>
                                </div>
                            </div>
                        <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="ID">Giá nhập</label>                                        
                                        <asp:TextBox ID="txtgianhap" CssClass="form-control" placeholder="0" Text="0" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                            <label for="exampleInputEmail1">Giá sỉ</label>                                       
                                        <asp:TextBox ID="txtgiasi" CssClass="form-control" placeholder="0" Text="0" runat="server"></asp:TextBox>                                          
                                    </div>
                                </div>
                            </div>

                    <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="ID">Giá bán</label>                                        
                                        <asp:TextBox ID="txtgiaban" CssClass="form-control" placeholder="0" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                            <label for="exampleInputEmail1">Giá đã cấu thành</label>                                       
                                        <asp:TextBox ID="txtgiadonvito" CssClass="form-control" placeholder="0" runat="server"></asp:TextBox>                                          
                                    </div>
                                </div>
                           </div>



      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
        <button type="button" class="btn btn-primary" runat="server" onserverclick="themkhuvuc">Ghi lại</button>
      </div>
    </div>
  </div>
</div>

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
                        $("#example").DataTable({
                            "responsive": true,
                            "autoWidth": true,
                            //"order": [[7, "desc"]],
                            "pageLength": 50
                            //"ordering": true,
                            //"paging": true,
                            //"lengthChange": false,
                            //"searching": false,
                            //"info": true,                    
                        });

         });

         //$('#myModal').modal(options)
         $('#myModal').modal()

    function openEditModal2(id,mahang,dvtto,soluongqudoi,dvtnho,gianhap,giaban,giasi,giacauthanh) {           
        $("#txtid").val(id);
        $("#txtmahang").val(mahang);
        $("#txtto").val(dvtto);
        $("#txtquydoi").val(soluongqudoi);
        $("#txtnho").val(dvtnho);  

        $("#suagianhap").val(gianhap);
        $("#suagiasi").val(giasi);
        $("#suagiaban").val(giaban);
        $("#suagiadvto").val(giacauthanh);
          
        $('#myModal2').modal('show');

        }


         $('#<%= mahangid.ClientID %>').change(function() {
            var mahang = $(this).val();                    
             //alert(newValue);
             $.ajax({
                type: "POST",
                url: "DMcauthanhDVT.aspx/getdongia", // Điều hướng đến phương thức xử lý dữ liệu trên máy chủ
                data: JSON.stringify({ mahang: mahang }), // Truyền dữ liệu cần xử lý
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    // Xử lý kết quả trả về từ máy chủ nếu cần
                    //console.log('Phản hồi từ máy chủ: ' + response.d);
                    $('#txtgiaban').val(data.d);
                    $('#dvtoid').focus();
                },
                error: function (error) {
                    //console.log('Lỗi khi gửi dữ liệu: ' + error);
                }
             });
         });


         //slquydoiid
         $('#<%= slquydoiid.ClientID %>').change(function() {
            var soluong = $(this).val();                    
             //alert(newValue);
             var dongia = $('#txtgiaban').val();
             var dongiacauthanh = soluong * dongia;
             //alert(dongiacauthanh);
             $('#txtgiadonvito').val(dongiacauthanh);
         });
        
    </script>

     <script src="../plugins/jquery-ui/jquery-ui.js"></script>
    <script type="text/javascript">
        $(function () {
            var onlyDate, today = new Date();
            var dateNewFormat = '';

            onlyDate = today.getDate();
            if (onlyDate.toString().length == 2) {

                dateNewFormat = onlyDate;
            }
            else {
                dateNewFormat = '0' + onlyDate;
            }

            dateNewFormat = dateNewFormat + '-';

            if (today.getMonth().length == 2) {

                dateNewFormat += (today.getMonth() + 1);
            }
            else {
                //dateNewFormat += '0' + (today.getMonth() + 1);
                dateNewFormat += (today.getMonth() + 1);
            }

            dateNewFormat = dateNewFormat + '-' + today.getFullYear();
            //dateNewFormat = today.getFullYear() + '-';

            //$('#datepicker').val(dateNewFormat);
           

            //$("#datepicker").datepicker({ dateFormat: 'dd-mm-yy' });
 $("#txtngaymuon").datepicker({ dateFormat: 'dd-mm-yy' });
 $("#txtngaytra").datepicker({ dateFormat: 'dd-mm-yy' });
        });


    </script>

</body>
</html>
