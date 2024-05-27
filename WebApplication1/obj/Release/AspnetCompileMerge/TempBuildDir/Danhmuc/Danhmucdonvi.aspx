<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Danhmucdonvi.aspx.cs" Inherits="WebApplication1.Danhmuc.Danhmucdonvi" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Danh mục đơn vị</title>
    <link rel="stylesheet" href="../../plugins/fontawesome-free/css/all.min.css">
    <link rel="stylesheet" href="../../plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="../../plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
    <link rel="stylesheet" href="../../dist/css/adminlte.min.css">

    <link rel="stylesheet" href="../plugins/toastr/toastr.css" />
    <link rel="stylesheet" href="../dist/css/adminlte.min.css" />
        <link rel="stylesheet" href="../plugins/jquery-ui/jquery-ui.css" />

    <link rel="stylesheet" href="../content/bootstrap.css" />


 <%--   <link rel="stylesheet" href="https://cdn.datatables.net/2.0.6/css/dataTables.bootstrap4.css" />
    <link rel="stylesheet" href="https://cdn.datatables.net/buttons/3.0.2/css/buttons.bootstrap4.css" />--%>
  

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
                <h1>Danh mục đơn vị</h1>
                <br />
                <p>
                    <asp:Label ID="lblConfirm" Text="" runat="server"></asp:Label>
                </p>
                <%--class="card-title"--%>
                <div class="col-sm-12">
                                                        
                    <span style="padding-left:20px;"></span>
                   <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
                     Thêm mới
                    </button>
                                                          
                </div>
                                                      
                </div>



               
               
            </div>
        </div>


             <div>
            <table id="example" class="table table-striped table-bordered" style="width:100%">
        <thead>
           
                 <tr role="row">
                                        <th>NO</th>
                                        <th>Tendoanhnghiep</th>
                                        <th>Nguoiquanly</th>
                                        <th>Masothue</th>
                                        <th>Fax</th> 
                                        <th>Diachi1</th> 
                                        <th>Diachi2</th> 
                                        <th>Tel1</th>
                                        <th>Tel2</th>
                                        <th>Ghichu</th>
                                                                                                                     
                                        <th>Action</th>
                                    </tr>
         
        </thead>
        <tbody>
                                <%int i = 0; %>
                                    <%foreach (System.Data.DataRow rows in dt_donvi.Rows)
                                        {%>
                                     <%i++;%>
                                    <tr role="row">                                        
                                        <td><%=i %></td>
                                        <td><%=rows["Tendoanhnghiep"].ToString()%></td>
                                        <td><%=rows["NguoiQuanly"].ToString()%></td>
                                        <td><%=rows["Masothue"].ToString()%></td>
                                        <td><%=rows["Fax"].ToString()%></td>
                                        <td><%=rows["Diachi1"].ToString()%></td>
                                        <td><%=rows["Diachi2"].ToString()%></td>
                                        <td><%=rows["Sodt1"].ToString()%></td>
                                        <td><%=rows["Sodt2"].ToString()%></td>
                                        <td><%=rows["Ghichu"].ToString()%></td>                                                                                                                     
                                        <td>
                                            <a href="#" class="btn btn-info btn-sm" title="delete item" onclick="openEditModal2('<%= rows["id"].ToString() %>','<%= rows["Tendoanhnghiep"].ToString() %>','<%= rows["NguoiQuanly"].ToString() %>','<%= rows["Masothue"].ToString() %>','<%= rows["Fax"].ToString() %>','<%= rows["Diachi1"].ToString() %>','<%=rows["Diachi2"].ToString()%>','<%=rows["Sodt1"].ToString()%>','<%=rows["Sodt2"].ToString()%>','<%=rows["Ghichu"].ToString()%>')"><i class="fas fa-pencil-alt"></i>Sửa</a>
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
                                <h4 class="modal-title" id="headerTag" style="float: left">Sửa thông tin doanh nghiệp</h4>
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
                                        <label for="ID">Tendoanhnghiep</label>                                      
                                        <asp:TextBox ID="txtdoanhnghiep" CssClass="form-control" placeholder="" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                       <label for="exampleInputEmail1">NguoiQuanly</label>                                        
                                        <asp:TextBox ID="txtquanly" CssClass="form-control" placeholder="" runat="server"></asp:TextBox>                                        
                                    </div>
                                </div>
                            </div> 
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="ID">Masothue</label>                                        
                                        <asp:TextBox ID="txtmasothue" CssClass="form-control" placeholder="" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                       <label for="exampleInputEmail1">Fax</label>                                       
                                        <asp:TextBox ID="txtFax" CssClass="form-control" placeholder="0" runat="server"></asp:TextBox>                                        
                                    </div>
                                </div>
                            </div> 
                        <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="ID">Diachi1</label>                                       
                                        <asp:TextBox ID="txtdiachi1" CssClass="form-control" placeholder="0" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                       <label for="exampleInputEmail1">Diachi2</label>
                                            <asp:TextBox ID="txtdiachi2" CssClass="form-control" placeholder="0" runat="server"></asp:TextBox>                    
                                    </div>
                                </div>
                            </div> 
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="ID">Sodt1</label>                                       
                                        <asp:TextBox ID="txtsodt1" CssClass="form-control" placeholder="0" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                       <label for="exampleInputEmail1">Sodt2</label>
                                            <asp:TextBox ID="txtsodt2" CssClass="form-control" placeholder="0" runat="server"></asp:TextBox>                    
                                    </div>
                                </div>
                            </div> 
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="ID">Ghi chu</label>                                       
                                        <asp:TextBox ID="txtghichu" CssClass="form-control" placeholder="0" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                               <label for="ID">ID</label>                                       
                                        <asp:TextBox ID="txtid" CssClass="form-control" placeholder="0" runat="server"></asp:TextBox>         
                                    </div>
                                </div>
                            </div> 
                          
                            
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fas fa-times"></i>Đóng</button>
                        <button type="button" runat="server" id="btnOrder" onserverclick="updatehanghoa" class="btn btn-primary">
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
        <h5 class="modal-title" id="exampleModalLabel">Thêm mới thông tin doanh nghiệp</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span>
        </button>
      </div>
      <div class="modal-body">
                    <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="ID">Tendoanhnghiep</label>                                      
                                        <asp:TextBox ID="tenid" CssClass="form-control" placeholder="" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                       <label for="exampleInputEmail1">NguoiQuanly</label>                                        
                                        <asp:TextBox ID="quanlyid" CssClass="form-control" placeholder="" runat="server"></asp:TextBox>                                        
                                    </div>
                                </div>
                            </div> 
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="ID">Masothue</label>                                        
                                        <asp:TextBox ID="masothueid" CssClass="form-control" placeholder="" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                       <label for="exampleInputEmail1">Fax</label>                                       
                                        <asp:TextBox ID="faxid" CssClass="form-control" placeholder="0" runat="server"></asp:TextBox>                                        
                                    </div>
                                </div>
                            </div> 
                        <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="ID">Diachi1</label>                                       
                                        <asp:TextBox ID="diachi1id" CssClass="form-control" placeholder="0" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                       <label for="exampleInputEmail1">Diachi2</label>
                                            <asp:TextBox ID="diachi2id" CssClass="form-control" placeholder="0" runat="server"></asp:TextBox>                    
                                    </div>
                                </div>
                            </div> 
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="ID">Sodt1</label>                                       
                                        <asp:TextBox ID="dienthoai1id" CssClass="form-control" placeholder="0" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                       <label for="exampleInputEmail1">Sodt2</label>
                                            <asp:TextBox ID="dienthoai2id" CssClass="form-control" placeholder="0" runat="server"></asp:TextBox>                    
                                    </div>
                                </div>
                            </div> 
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="ID">Ghi chu</label>                                       
                                        <asp:TextBox ID="ghichuid" CssClass="form-control" placeholder="0" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                                
                                    </div>
                                </div>
                            </div> 

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
        <button type="button" class="btn btn-primary" runat="server" onserverclick="themhanghoa">Ghi lại</button>
      </div>
    </div>
  </div>
</div>

    </form>

       <script src="../../plugins/jquery/jquery.min.js"></script>
    <script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>

    <script src="../../plugins/datatables/jquery.dataTables.js"></script>
    <script src="../../plugins\datatables-buttons\js\dataTables.buttons.js"></script>
    
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
                    "pageLength": 50,
                            "buttons": ['copy', 'csv', 'excel'],
                            //"ordering": true,
                            //"paging": true,
                            //"lengthChange": false,
                            //"searching": false,
                            //"info": true,                    
                });
                

         });

         //$('#myModal').modal()

         function openEditModal2(id, Tendoanhnghiep, NguoiQuanly, Masothue, Fax, Diachi1, Diachi2, Sodt1, Sodt2, Ghichu) {   
            $("#txtid").val(id);
            $("#txtdoanhnghiep").val(Tendoanhnghiep);
            $("#txtquanly").val(NguoiQuanly);
            $("#txtmasothue").val(Masothue);
            $("#txtFax").val(Fax);
            $("#txtdiachi1").val(Diachi1);
            $("#txtdiachi2").val(Diachi2);
            $("#txtsodt1").val(Sodt1);
            $("#txtsodt2").val(Sodt2);
            $("#txtghichu").val(Ghichu);
       
            $('#myModal2').modal('show');

        }

       
    </script>

     <script src="../plugins/jquery-ui/jquery-ui.js"></script>
    <script type="text/javascript">

    </script>
</body>
</html>
