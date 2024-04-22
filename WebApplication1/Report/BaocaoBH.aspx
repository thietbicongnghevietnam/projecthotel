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

</head>
<body>

    <div class="card">
              <div class="card-header">
                <h3 class="card-title">Báo cáo bán hàng theo hóa đơn</h3>
              </div>
         <div class="form-group">
            <label for="date" style="padding-top:10px;">Ngày:</label>
             <%--<asp:TextBox ID="DateTextBox" runat="server" CssClass="datePicker"></asp:TextBox>--%>
            <input type="date" id="ngaychiid" name="date">
          </div>
        <asp:Button ID="idconfirm" runat="server" Text="Gửi" OnClick="Button1_Click" /> 
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
                      <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1">tienhang</th>
                      <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1">tongtien</th>
                      <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1">chietkhau</th>
                      <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1">tiensauchietkhau</th>
                      <%--<th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1">hinhthucnghi</th>
                      <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1">mohinh</th>--%>
                      <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1">created</th>
                      <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1"></th>
                      

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
                      <td><%=rows["tienhang"].ToString()%></td>
                      <td><%=rows["tongtien"].ToString()%></td>
                      <td><%=rows["chietkhau"].ToString()%></td>
                      <td><%=rows["tiensauchietkhau"].ToString()%></td>
                      <%--<td><%=rows["hinhthucnghi"].ToString()%></td>
                      <td><%=rows["mohinh"].ToString()%></td>--%>
                      <td><%=rows["created"].ToString()%></td>
                    <td></td>
                    
                  </tr>
                      <%} %>
                  

                  </tbody>
                <%--  <tfoot>
                  <tr>
                      <th class="sorting_asc" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Rendering engine: activate to sort column descending">STT</th>
                      <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1">sohd</th>
                      <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1">type</th>
                      <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1">ngaygiothue</th>
                      <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1">ngaygiora</th>
                      <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1">tongthoigianthue</th>
                      <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1">tenphong</th>
                      <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1">tienphong</th>
                      <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1">tiengiohat</th>
                      <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1">tienhang</th>
                      <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1">tongtien</th>
                      <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1">chietkhau</th>
                      <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1">tiensauchietkhau</th>
                      <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1">hinhthucnghi</th>
                      <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1">mohinh</th>
                      <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1">created</th>

                  </tr>
                  </tfoot>--%>
                </table>

                        </div>
                    </div>
                    
             <%-- </div>
              <!-- /.card-body -->
            </div>--%>


        <script src="../../plugins/jquery/jquery.min.js"></script>
    <script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>

    <script src="../../plugins/datatables/jquery.dataTables.min.js"></script>
    <script src="../../plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
    <script src="../../plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
    <script src="../../plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
    <script src="../../dist/js/adminlte.min.js"></script>
    <script src="../../dist/js/demo.js"></script>
    <script>
  $(function () {
      $("#example1").DataTable({
            "paging": true,
          "lengthChange": true,
          "searching": true,
          "ordering": true,
          "info": true,
          "responsive": true,
          "autoWidth": true,
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
</script>


</body>
</html>
