<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Phieunhaphang.aspx.cs" Inherits="WebApplication1.Phieunhaphang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="wrapper">
    <table id="dnhaphang" style="padding-bottom: 10px; padding-right: 10px;padding-top: 20px;padding-left: 20px;">

                <tr>
                    <td style="padding-bottom: 10px; padding-right: 10px;"><b>Ma hang </b></td>
                <td style="padding-bottom: 10px; padding-right: 10px;">                               
                    <asp:TextBox ID="phieunhaphang" Style="float: left; width: 100%;" class="ajax form-control input-sm" value="" placeholder="Chọn tên hàng" runat="server"></asp:TextBox>
                </td>
                <td style="padding-bottom: 10px; padding-right: 10px;"><b>Số lượng: </b></td>
                <td style="padding-bottom: 10px; padding-right: 10px;">
                <input id="soluongnhaphang" name="soluongnhaphang" class="form-control input-sm" value="" />
                </td>
                
                </tr>
                </table>

                <div style="padding-bottom: 20px;">
                <span class="addphieunhap" style="padding-right: 30px; padding-left:450px;">
                <i class="fa fa-plus-square" style="font-size:25px"></i>&nbsp;Thêm</span>
                <span class="delnhaphang" style="padding-right: 30px;">
                <i class="fa fa-times" style="font-size:25px"></i>Xóa</span>
                </div>

                <div style="height: 300px; overflow-y: scroll">
                <table id="tbphieunhap" class="display table table-bordered dataTable no-footer">
                <tr>
                <td>Tên hàng</td><td>Số lượng</td><td>Đơn giá</td><td>Thành tiền</td><td>Del</td>
                </tr>
                </table>
                </div>

                <div><span style="float: left; padding-right: 10px; padding-top: 20px;"><b style="float: left">Tổng tiền hàng :</b>
                <input style="width: 140px; float: left" id="tongtiennhap" disabled="disabled" name="tongtiennhap" type="text" class="form-control input-sm" value=""/></span>
                </div>

                <br />
               <br />
                <br />
    </div>
     <script type="text/javascript">
        $(document).ready(function () {
            SearchText();            
        });

        $("#MainContent_phieunhaphang").on('keyup', function (e) {
                if ((e.key === 'Enter' || e.keyCode === 13)) {
                    $("#soluongnhaphang").val(1);
                    $("#soluongnhaphang").select();
                }
        });

$("#soluongnhaphang").on('keyup', function (e) {
if ((e.key === 'Enter' || e.keyCode === 13))
{
    var tongtienhang = parseInt($('#tongtiennhap').val());
    var _mahang = $("#MainContent_phieunhaphang").val();
    var data = { _mahang: _mahang };
    //push mahang vao array
    var gettr = [];
    
    $('#tbphieunhap tr').each(function () {
            var mhold = $(this).find('td').eq(0).text();
            gettr.push(mhold);
       });
        //neu mahang = phan tu trong array thi gan 1 gia tri de so sanh
        var gettr_rs = 'Insert';
        for (var i = 0; i < gettr.length; i++) {
            if (_mahang == gettr[i]) {
                gettr_rs = 'Remove';
            }
        }


}

});

        function SearchText() {
                //debugger;
                $("#MainContent_phieunhaphang").autocomplete({
                    source: function (request, response) {
                        var _mahang = $("#MainContent_phieunhaphang").val();
                        var data = { _mahang: _mahang };
                        $.ajax({
                            type: "POST",
                            contentType: "application/json; charset=utf-8",
                            url: "Map.aspx/searchmahang",
                            data: JSON.stringify(data),
                            dataType: "json",
                            success: function (data) {
                                response(data.d);
                            },
                            error: function (result) {
                                //alert("No Match");
                            }
                        });
                    }
                });
            }



    </script>



</asp:Content>
