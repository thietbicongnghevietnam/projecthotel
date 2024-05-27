<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BaocaotonghopBH.aspx.cs" Inherits="WebApplication1.Report.BaocaotonghopBH" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Báo cáo tổng hợp bán hàng</title>
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
                <h1>Báo cáo tổng hợp bán hàng</h1>
                <br />
                <%--class="card-title"--%>
                <div class="col-sm-12">
                    Tu ngay:
                                    <%--<input type="text" id="datepicker" runat="server">--%>
                                    <input type="date" id="Date1" name="date" runat="server">
                    Den ngay:                                    
                                    <input type="date" id="ngaychiid" name="date" runat="server">                                                        

                    <button class="btn btn-primary" type="button" runat="server" onserverclick="Search_Date_Click" >
                        <i class="fa fa-fw fa-lg fa-search"></i>Filter</button>
                  
                    <button class="btn btn-primary" type="button" style="margin-left:20px;" id="exportBtn">Export to Excel</button>
                   

                </div>


            </div>
        </div>


             <div>
            <table id="example" class="table table-striped table-bordered" style="width:100%">
        <thead>
            <tr>
                 <tr role="row">
                                        <th>NO</th>                                       
                                        <th>Tenhang</th>                                       
                                        <th>so luong</th> 
                                        <th>don gia</th> 
                                         <th>thanhtien</th>                                                                                                                        
                                        <th>Action</th>
                                    </tr>
            </tr>
        </thead>
        <tbody>
                                <%int i = 0; %>
                                    <%foreach (System.Data.DataRow rows in dt_banhang.Rows)
                                        {%>
                                     <%i++;%>
                                    <tr role="row">                                        
                                        <td><%=i %></td>                                      
                                        <td><%=rows["tenhang"].ToString()%></td>
                                        <td><%=rows["sloluong"].ToString()%></td>
                                         <td><%=rows["dongia"].ToString()%></td>
                                        <td><%=String.Format("{0:N0}", Int32.Parse(rows["thanhtien"].ToString()))%></td>                                                                                                                   
                                        <td>
                                            <a href="#" class="btn btn-info btn-sm" title="delete item" onclick="openEditModal2('<%= rows["tenhang"].ToString() %>')"><i class="fas fa-pencil-alt"></i>Chi tiết</a>
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
                                <h4 class="modal-title" id="headerTag" style="float: left">Thông tin thẻ kho</h4>
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
                                
                                 <div style="width: 100%; height: 350px; overflow-y: scroll; float: left;">
                                    <table class="display table table-bordered dataTable no-footer">
                                        <thead>
                                            <tr>
                                                <th>Số HĐ</th>
                                                <th>Hang Hóa</th>  
                                                <th>So luong</th>  
                                                <th>Ngày tạo</th>
                                                <th>Loai HD</th>
                                            </tr>
                                        </thead>
                                            <tbody id="tblthekho">
                                            </tbody>
                                    </table>
                                </div>

                            </div>
                                                        
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fas fa-times"></i>Close</button>
                       <%-- <button type="button" runat="server" id="btnOrder" onserverclick="BtnOrderItem" class="btn btn-primary">
                            <i class="fas fa-download"></i>
                            Save
                        </button>--%>
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

     <%-- thu vien xuat excel --%>
    <script src="../../dist/js/xlsx.full.min.js"></script>
    <script src="../../dist/js/sweetalert2@11.js"></script>
    <%--<script src="#"></script>  https//cdn.jsdelivr.net/npm/sweetalert2@11--%>
   <%-- <script src="#"></script>  https//cdnjs.cloudflare.com/ajax/libs/xlsx/0.18.0/xlsx.full.min.js--%>


   

     <script>
         $(document).ready(function () {
             //$('#txtdevice').prop("readonly", true);
             if ($.fn.DataTable.isDataTable('#example')) {
                 table.destroy();
             }
             var table = $('#example').DataTable({
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

             $('#exportBtn').on('click', function() {
                // Hiển thị hộp thoại cảnh báo trước khi xuất Excel
                Swal.fire({
                    title: 'Export to Excel?',
                    text: 'Are you sure you want to export this table to Excel?',
                    icon: 'info',
                    showCancelButton: true,
                    confirmButtonText: 'Export',
                    cancelButtonText: 'Cancel'
                }).then((result) => {
                    if (result.isConfirmed) {
                        // Nếu người dùng xác nhận, thực hiện xuất Excel
                        var data = table.data().toArray();
                        var ws = XLSX.utils.aoa_to_sheet(data);
                        var wb = XLSX.utils.book_new();
                        XLSX.utils.book_append_sheet(wb, ws, "Sheet1");
                        XLSX.writeFile(wb, 'data.xlsx');
                    }
                });
            });

       //$('#exportBtn').on('click', function() {
       //         var data = table.data().toArray();
       //         var ws = XLSX.utils.aoa_to_sheet(data);
       //         var wb = XLSX.utils.book_new();
       //         XLSX.utils.book_append_sheet(wb, ws, "Sheet1");
       //         XLSX.writeFile(wb, 'data.xlsx');
       //});

        });

            //$(function () {
            //            $("#example").DataTable({
            //                "responsive": true,
            //                "autoWidth": true,
            //                //"order": [[7, "desc"]],
            //                "pageLength": 50
            //                //"ordering": true,
            //                //"paging": true,
            //                //"lengthChange": false,
            //                //"searching": false,
            //                //"info": true,                    
            //            });

            //        });

         function openEditModal2(mahang) {   
             //alert(mahang);
            //$("#txtmahang").val(mahang);
            var fromdate  = $("#Date1").val();
            var todate  = $("#ngaychiid").val();
            
            //alert(fromdate);
            //alert(todate);
            var data = {
                        mahang: mahang,
                        fromdate: fromdate,
                        todate: todate
                    };

            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "BaocaotonghopBH.aspx/thongtinthekho",
                //data: JSON.stringify(data),
                data: JSON.stringify(data),
                dataType: "json",
                success: function (data) {
                debugger;
                    //alert('Hàng hóa đã được thêm thành công!');
                    //var objdata = $.parseJSON(data.d);
                    const objdata = $.parseJSON(data.d);
                     $('#tblthekho tr').remove();
                     for (var i = 0; i < objdata['Table1'].length - 1; i++) 
                    {
                        var sohoadon = objdata['Table1'][i][0];
                        var danhsachhanghoa = objdata['Table1'][i][1];
                        var soluong = objdata['Table1'][i][2];
                        var ngaytao =  objdata['Table1'][i][3];
                        var loaihoadon = objdata['Table1'][i][4];
                        var newrow = '<tr class="danhsachthekho">' +
                                                '<td id="sohoadon_">' + sohoadon + '</td>' +
                                                '<td id="danhsachhanghoa_">' + danhsachhanghoa + '</td>' +
                                                '<td id="soluong_">' + soluong + '</td>' +
                                                '<td id="ngaytao_">' + ngaytao + '</td>' +   
                                                '<td id="loaiHD_">' + loaihoadon + '</td>' +                                                                                          
                                                '</tr>';
                                            $('#tblthekho').append(newrow);   
                    }
                    
                    $('#myModal2').modal('show');                                                       
                },
                error: function () {
                    //alert("No Match");
                }
            });

            //$('#myModal2').modal('show');
        }

        
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
