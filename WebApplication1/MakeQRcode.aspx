<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MakeQRcode.aspx.cs" Inherits="WebApplication1.MakeQRcode" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

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

</asp:Content>
