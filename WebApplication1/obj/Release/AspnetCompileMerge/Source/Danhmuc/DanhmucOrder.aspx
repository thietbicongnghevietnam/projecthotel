<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DanhmucOrder.aspx.cs" Inherits="WebApplication1.Danhmuc.DanhmucOrder" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>Danh sách món ăn chờ</title>
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
                <h1>Danh sách món ăn order nhà bếp</h1>
                <br />
                <%--class="card-title"--%>
                <div class="col-sm-12">
                                                                          
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
                                        <th>Ten Hang</th>
                                        <th>So luong</th>
                                        <th>Ban</th>
                                        <th>Thoi gian order</th>
                                        <th>Action</th>
                                    </tr>
            </tr>
        </thead>
        <tbody>
                                <%int i = 0; %>
                                    <%foreach (System.Data.DataRow rows in dt_order.Rows)
                                        {%>
                                     <%i++;%>
                                    <tr role="row">                                        
                                        <td><%=i %></td>
                                        <td><%=rows["tenhang"].ToString()%></td>
                                        <td><%=rows["soluong"].ToString()%></td>
                                        <td><%=rows["banid"].ToString()%></td>
                                        <td><%=rows["createtime"].ToString()%></td>
                                        
                                        <td>
                                            <a href="#" class="btn btn-info btn-sm" title="delete item" onclick="openEditModal2('<%= rows["tenhang"].ToString() %>','<%= rows["banid"].ToString() %>')"><i class="fas fa-pencil-alt"></i>Xoa</a>
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
                                <h4 class="modal-title" id="headerTag" style="float: left">Món ăn đã được chế biến xong? bạn muốn xóa?</h4>
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
                                        <label for="ID">Tên hàng</label>
                                        <span style="color: green; font-size: 11px; font-style: italic;">(Read only)</span>
                                        <asp:TextBox ID="txttenhang" CssClass="form-control" placeholder="" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                       <label for="exampleInputEmail1">Bàn</label>       
                                        <span style="color: green; font-size: 11px; font-style: italic;">(Read only)</span>
                                        <asp:TextBox ID="txttenban" CssClass="form-control" placeholder="" runat="server"></asp:TextBox>                                        
                                    </div>
                                </div>
                            </div>                                                       
                            
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fas fa-times"></i>Đóng</button>
                        <button type="button" runat="server" id="btnOrder" onserverclick="xoaorder" class="btn btn-primary">
                            <i class="fas fa-download"></i>
                            Xóa
                        </button>
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
            $('#txttenhang').prop("readonly", true);
            $('#txttenban').prop("readonly", true);
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

       

    function openEditModal2(tenhang,tenban) {           
        $("#txttenhang").val(tenhang);
        $("#txttenban").val(tenban);
             
        $('#myModal2').modal('show');

        }

        
    </script>

     <script src="../plugins/jquery-ui/jquery-ui.js"></script>
    

</body>
</html>
