<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BaocaoBH.aspx.cs" Inherits="WebApplication1.Report.BaocaoBH" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
                <h3 class="card-title">Báo cáo bán hàng theo hóa đơn</h3>
              </div>
         <div class="col-sm-12">
            <label for="date" style="padding-top:10px;">Ngày:</label>
             <%--<asp:TextBox ID="DateTextBox" runat="server" CssClass="datePicker"></asp:TextBox>--%>
            <input type="date" id="ngaychiid" name="date" runat="server">
             <input type="checkbox" id="check_partno_search" style="width: 20px; height: 20px;" name="check_partno_search">
                    Item:                                    
                                    <input type="text" id="partno_search" runat="server">

             <button class="btn btn-primary" type="button" runat="server" onserverclick="Search_Date_Click2" >
                        <i class="fa fa-fw fa-lg fa-search"></i>Filter</button>
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
                      <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1">tienphong</th>
                      <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1">tiengiohat</th>
                     <%-- <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1">Hanghoa</th>--%>
                      <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1">tienhang</th>
                      <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1">tongtien</th>
                      <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1">chietkhau</th>
                      <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1">tiensauchietkhau</th>
                      <%--<th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1">hinhthucnghi</th>
                      <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1">mohinh</th>--%>
                      <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1">created</th>
                      <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1">Action</th>
                      

                  </thead>
                  <tbody>

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
                      <td><%=rows["tienphong"].ToString()%></td>
                      <td><%=rows["tiengiohat"].ToString()%></td>
                     <%-- <td><%=rows["items"].ToString()%></td>--%>
                      <td><%=rows["tienhang"].ToString()%></td>
                      <td><%=rows["tongtien"].ToString()%></td>
                      <td><%=rows["chietkhau"].ToString()%></td>
                      <td><%=rows["tiensauchietkhau"].ToString()%></td>
                      <%--<td><%=rows["hinhthucnghi"].ToString()%></td>
                      <td><%=rows["mohinh"].ToString()%></td>--%>
                      <td><%=rows["created"].ToString()%></td>
                    <td>
                        <a href="#" class="btn btn-info btn-sm" title="delete item" onclick="openEditModal2('<%= rows["sohd"].ToString() %>')"><i class="fas fa-pencil-alt"></i>View</a>
                    </td>
                    
                  </tr>
                      <%} %>
                  

                  </tbody>
               
                </table>

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

        function openEditModal2(sohoadon) {           
            $("#txtsohoadon").val(sohoadon);

            $('#myModal2').modal('show');
        }

</script>


</body>
</html>
