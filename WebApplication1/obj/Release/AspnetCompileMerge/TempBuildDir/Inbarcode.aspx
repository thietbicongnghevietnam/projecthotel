<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Inbarcode.aspx.cs" Inherits="WebApplication1.Inbarcode" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <!-- Theme style -->
    <link rel="stylesheet" href="../../dist/css/adminlte.min.css" />
     <!-- DataTables -->
    <link rel="stylesheet" href="../../plugins/datatables-bs4/css/dataTables.bootstrap4.min.css"/>
    <link rel="stylesheet" href="../../plugins/datatables-responsive/css/responsive.bootstrap4.min.css"/>
    <link rel="stylesheet" href="../../plugins/datatables-buttons/css/buttons.bootstrap4.min.css"/>
     <!-- overlayScrollbars -->
    <link rel="stylesheet" href="../../plugins/overlayScrollbars/css/OverlayScrollbars.min.css"/>
    <!-- Daterange picker -->
    <link rel="stylesheet" href="../../plugins/daterangepicker/daterangepicker.css"/>
    <!-- summernote -->
    <link rel="stylesheet" href="../../plugins/summernote/summernote-bs4.min.css"/>
    <!-- Select2 -->
    <link rel="stylesheet" href="../../plugins/select2/css/select2.min.css"/>
    <link rel="stylesheet" href="../../plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css"/>
    <!-- Bootstrap4 Duallistbox -->
    <link rel="stylesheet" href="../../plugins/bootstrap4-duallistbox/bootstrap-duallistbox.min.css"/>
    <!-- BS Stepper -->
    <link rel="stylesheet" href="../../plugins/bs-stepper/css/bs-stepper.min.css"/>
    <!-- dropzonejs -->
    <link rel="stylesheet" href="../../plugins/dropzone/min/dropzone.min.css"/>
     <!-- Font Awesome -->
    <link rel="stylesheet" href="../../plugins/fontawesome-free/css/all.min.css"/>
    <!-- Tempusdominus Bootstrap 4 -->
    <link rel="stylesheet" href="../../plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css"/>
    <!-- iCheck -->
    <link rel="stylesheet" href="../../plugins/icheck-bootstrap/icheck-bootstrap.min.css"/>
    <!-- JQVMap -->
    <link rel="stylesheet" href="../../plugins/jqvmap/jqvmap.min.css"/>
    <style>
        @media screen {
            header, footer {
                display: none;
            }
        }

        @media print {
            header, footer {
                display: none;
            }

            @page {
                size: A4;
                /* margin: 10px;*/
                /* margin-bottom: 15px;*/
                /* margin-top: 12px;*/
            }

            .page {
                page-break-after: always;
            }

            .noprint {
                display: none;
            }
        }
      
    </style>
</head>
<body margin-top: 2px">
     <form  id="form1" runat="server">
     
        <div>
            <h3 style="text-align:left;padding-top:5px; padding-bottom:5px; padding-left:20px; color:black">In ma vach danh muc hang hoa</h3>
        </div>
        <div class="row">
                      
           <div class="col-sm-1">
                 <asp:Button CssClass="rounded-button" Font-Size="20px"  BorderStyle="None" ForeColor="White" Font-Bold="true" BackColor="SteelBlue" Width="100%" Height="35"  runat="server" Text="Loc data" OnClick="btn_inmavach_Click" />
           </div>


            <div class="col-sm-1" style="margin-right:10px">
                 <button type="button"  style=" height:35px; width:100%; background-color:forestgreen; font-weight:bold; color:white; border:none;border-radius:3px;font-size:20px" onclick="PrintPartcard('ContentPrint')" >Print</button>
            </div>
        </div>


         <div>
            <table id="example" class="table table-striped table-bordered" style="width:100%">
        <thead>
            <tr>
                 <tr role="row">
                                        <th>NO</th>
                                        <th>Ma hang</th>
                                        <th>Ten hang</th>                                                                                                                      
                                        <th>Gia ban</th>                                                                                                                      
                                       
                                    </tr>
            </tr>
        </thead>
        <tbody>
                                <%int i = 0; %>
                                    <%foreach (System.Data.DataRow rows in dt.Rows)
                                        {%>
                                     <%i++;%>
                                    <tr role="row">                                        
                                        <td><%=i %></td>
                                        <td><%=rows["mahang"].ToString()%></td>
                                        <td><%=rows["tenhang"].ToString()%></td>
                                        <td><%=rows["giaban"].ToString()%></td>                                                                                                                      
                                    </tr>
                                    <%} %>
                             </tbody>              

    </table>
        </div>
        
      
    <div style="display:none" id="ContentPrint">
     <div class="row"  style="margin-left: 5px; margin-top: 5px; width:1000px"  runat="server" id="ContentBody">
    </div>
    </div>


     </form>
     <script src="../../plugins/jquery/jquery.min.js"></script>
    <!-- jQuery UI 1.11.4 -->
    <script src="../../plugins/jquery-ui/jquery-ui.min.js"></script>
    <!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
   <%-- <script>
        $.widget.bridge('uibutton', $.ui.button)
    </script>--%>
    <!-- Bootstrap 4 -->
    <script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- JQVMap -->
    <script src="../../plugins/jqvmap/jquery.vmap.min.js"></script>
    <script src="../../plugins/jqvmap/maps/jquery.vmap.usa.js"></script>
    <!-- Summernote -->
    <script src="../../plugins/summernote/summernote-bs4.min.js"></script>
    <!-- overlayScrollbars -->
    <script src="../../plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
    <!-- AdminLTE App -->
    <script src="../../dist/js/adminlte.js"></script>
    <%--<script src="../../dist/js/pages/dashboard.js"></script>--%>
    <!-- ChartJS -->
    <script src="../../plugins/chart.js/Chart.min.js"></script>
    <!-- FLOT CHARTS -->
    <script src="../../plugins/flot/jquery.flot.js"></script>
    <!-- FLOT RESIZE PLUGIN - allows the chart to redraw when the window is resized -->
    <script src="../../plugins/flot/plugins/jquery.flot.resize.js"></script>
    <!-- FLOT PIE PLUGIN - also used to draw donut charts -->
    <!-- Select2 -->
    <script src="../../plugins/select2/js/select2.full.min.js"></script>
    <!-- Bootstrap4 Duallistbox -->
    <script src="../../plugins/bootstrap4-duallistbox/jquery.bootstrap-duallistbox.min.js"></script>
    <!-- InputMask -->
    <script src="../../plugins/moment/moment.min.js"></script>
    <script src="../../plugins/inputmask/jquery.inputmask.min.js"></script>
    <!-- date-range-picker -->
    <script src="../../plugins/daterangepicker/daterangepicker.js"></script>
    <!-- bootstrap color picker -->
    <script src="../../plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.min.js"></script>
    <!-- Tempusdominus Bootstrap 4 -->
    <script src="../../plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
    <!-- BS-Stepper -->
    <script src="../../plugins/bs-stepper/js/bs-stepper.min.js"></script>
    <!-- dropzonejs -->
    <script src="../../plugins/dropzone/min/dropzone.min.js"></script>
    <script src="../../plugins/flot/plugins/jquery.flot.pie.js"></script>
    <!-- DataTables  & Plugins -->
    <script src="../../plugins/datatables/jquery.dataTables.min.js"></script>
    <script src="../../plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
    <script src="../../plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
    <script src="../../plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
    <script src="../../plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
    <script src="../../plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
    <script src="../../plugins/jszip/jszip.min.js"></script>
    <script src="../../plugins/pdfmake/pdfmake.min.js"></script>
    <script src="../../plugins/pdfmake/vfs_fonts.js"></script>
    <script src="../../plugins/datatables-buttons/js/buttons.html5.min.js"></script>
    <script src="../../plugins/datatables-buttons/js/buttons.print.min.js"></script>
    <script src="../../plugins/datatables-buttons/js/buttons.colVis.min.js"></script>
    
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

        function PrintPartcard(divId) {

            var printContents = document.getElementById(divId).innerHTML;
                        document.body.innerHTML = printContents;
                        window.print();
                        location.replace(location.href);
           
        }
        //function getCookie(name) {
        //    const value = `; ${document.cookie}`;
        //    const parts = value.split(`; ${name}=`);
        //    if (parts.length === 2) return parts.pop().split(';').shift();
        //}
        //function UploadMaster(){
        //    var masterck = getCookie('MasterCookie');

        //    if (masterck == '1') {

        //    }
        //}
        //function getCookie(cookieName) {
        //    var name = cookieName + "=";
        //    var decodedCookie = decodeURIComponent(document.cookie);
        //    var cookieArray = decodedCookie.split(';');

        //    for (var i = 0; i < cookieArray.length; i++) {
        //        var cookie = cookieArray[i];
        //        while (cookie.charAt(0) === ' ') {
        //            cookie = cookie.substring(1);
        //        }
        //        if (cookie.indexOf(name) === 0) {
        //            return cookie.substring(name.length, cookie.length);
        //        }
        //    }
        //    return "";
        //}
    </script>
</body>
</html>

