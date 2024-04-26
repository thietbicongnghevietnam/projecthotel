<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Baocaotonghopthuchi.aspx.cs" Inherits="WebApplication1.Report.Baocaotonghopthuchi" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Báo cáo tổng hợp thu chi</title>
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
                <h1>Báo cáo tổng hợp thu chi</h1>
                <br />
                <%--class="card-title"--%>
                <div class="col-sm-12">
                    Từ ngày:
                                    <%--<input type="text" id="datepicker" runat="server">--%>
                                    <input type="date" id="Date1" name="date" runat="server">
                    Đến ngày:                                    
                                    <input type="date" id="ngaychiid" name="date" runat="server">
                                    

                    <input type="checkbox" id="check_partno_search" style="width: 20px; height: 20px;" name="check_partno_search">
                    KH:                                    
                                    <input type="text" id="partno_search" runat="server">

                    <button class="btn btn-primary" type="button" runat="server" onserverclick="Search_Date_Click" >
                        <i class="fa fa-fw fa-lg fa-search"></i>Filter</button>

                    

                    <%--<button class="btn btn-primary" type="button" runat="server" style="margin-left:20px;"  >
                        Inventory Equipment
                    </button>--%>
                  
                          
                    <button class="btn btn-primary" type="button" runat="server" style="margin-left:20px;" onserverclick="Download_Click" ><i class="fa fa-download"></i>Export</button>

                    <%--<button class="btn btn-success" type="button" runat="server" style="margin-left:50px;" ><i class="fa fa-download"></i><a href="ReportBorrowReturn.aspx" target="_blank" style="color:blue">Report Item</a></button>--%>
                  <%--  <button class="btn btn-success" type="button" runat="server" style="margin-left:50px;" onserverclick="Download_Click2" ><i class="fa fa-download">Report Item</i></button>

                    <input type="text" id="itemid" runat="server">--%>
                   

                </div>

               
               
            </div>
        </div>


             <div>
            <table id="example" class="table table-striped table-bordered" style="width:100%">
        <thead>
            <tr>
                 <tr role="row">
                                        <th>NO</th>
                                        <th>typeHD</th>
                                        <th>MaHD</th>
                                        <th>IDketoan</th>
                                        <th>IDnguoinhan</th>
                                        <th>IDkhachhang</th>
                                        <th>IDnhacungcap</th>
                                        <th>psco</th>
                                        <th>psno</th>
                                        <th>Mota</th>
                                        <th>ngaygiaodich</th>
                                        <th>phuongthucTT</th>
                                        <th>Createdate</th>
                                                                               
                                       <%-- <th>Action</th>--%>
                                    </tr>
            </tr>
        </thead>
        <tbody>
                                <%int i = 0; %>
                                    <%foreach (System.Data.DataRow rows in dt_soquy.Rows)
                                        {%>
                                     <%i++;%>
                                    <tr role="row">                                        
                                        <td><%=i %></td>
                                        <td><%=rows["typeHD"].ToString()%></td>
                                        <td><%=rows["MaHD"].ToString()%></td>
                                        <td><%=rows["IDketoan"].ToString()%></td> 
                                        <td><%=rows["IDnguoinhan"].ToString()%></td>
                                         <td><%=rows["IDkhachhang"].ToString()%></td> 
                                         <td><%=rows["IDnhacungcap"].ToString()%></td>
                                        <td><%=rows["psco"].ToString()%></td>
                                        <td><%=rows["psno"].ToString()%></td>
                                        <td><%=rows["Mota"].ToString()%></td>

                                        <%if ((i == dt_soquy.Rows.Count)  && rows["ngaygiaodich"].ToString() != "") { %>
                                            <td></td>
                                        <%} %>                                        
                                        <%else { %>
                                                <td><%=rows["ngaygiaodich"].ToString()%></td>
                                        <%} %>
                                        

                                        <td><%=rows["phuongthucTT"].ToString()%></td>
                                         <%if ((i == dt_soquy.Rows.Count)  && rows["Createdate"].ToString() != "") { %>
                                            <td></td>
                                        <%} %>                                        
                                        <%else { %>
                                                <td><%=rows["Createdate"].ToString()%></td>
                                        <%} %>

                                        
                                        
                                      <%--  <td>
                                            <a href="#" class="btn btn-info btn-sm" title="delete item" onclick="openEditModal2('<%= rows["id"].ToString() %>')"><i class="fas fa-pencil-alt"></i>Lich su</a>
                                            &nbsp;&nbsp;
                                            <a href="#" class="btn btn-info btn-sm" title="delete item" onclick="openEditModal6('<%= rows["id"].ToString() %>')" ><i class="fas fa-pencil-alt"></i>Chi tiet HD</a>
                                        </td> 
                                        --%>
                                    </tr>
                                    <%} %>
                                           

    </table>
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
