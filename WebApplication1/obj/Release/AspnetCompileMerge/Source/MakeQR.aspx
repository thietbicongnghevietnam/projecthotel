<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MakeQR.aspx.cs" Inherits="WebApplication1.MakeQR" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Make QR code</title>
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
        <div>
             <div class="container">  
            <h2>Auto generate QR Code</h2>  
            <div class="row">  
                <div class="col-md-4">  
                    <div class="form-group">  
                        <label>Enter Something</label>  
                        <div class="input-group">  
                            <asp:TextBox ID="txtQRCode" runat="server" CssClass="form-control"></asp:TextBox>  
                            <div class="input-group-prepend">  
                                <asp:Button ID="btnGenerate" runat="server" CssClass="btn btn-secondary" Text="Generate" OnClick="btnGenerate_Click" />  
                            </div>  
                        </div> 
                        <label>Width</label>  
                        <div class="input-group">  
                            <asp:TextBox ID="txt_width" runat="server" onkeyup="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')" CssClass="form-control"></asp:TextBox>                              
                        </div>  
                        <label>Height</label>  
                        <div class="input-group">  
                            <asp:TextBox ID="txt_height" runat="server" onkeyup="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')" CssClass="form-control"></asp:TextBox>                             
                        </div>  
                    </div>  
                </div>  
            </div>         
               <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>                        
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

    <script type="text/javascript">       
        $("#MainContent_txt_width").on('keyup', function (e) {
            //debugger;
            if (parseInt((this.value)) > 1000) {
                alert('Please input witdh under 1000');
                $("#MainContent_txt_width").val('');
            }
        });

        $("#MainContent_txt_height").on('keyup', function (e) {
            if (parseInt((this.value)) > 1000) {
                alert('Please input height under 1000');
                $("#MainContent_txt_height").val('');
            }
        });
    </script>


</body>
</html>
