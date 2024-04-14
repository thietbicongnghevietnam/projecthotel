<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Phieuthu.aspx.cs" Inherits="WebApplication1.Phieuthu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        .container {
  max-width: 800px;
  margin: 50px auto;
  background-color: #fff;
  padding: 20px;
  border-radius: 8px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h2 {
  text-align: center;
}

.row {
  display: flex;
  justify-content: space-between;
}

.column {
  flex: 1;
  margin-right: 20px;
}

.column:last-child {
  margin-right: 0;
}

.form-group {
  margin-bottom: 20px;
}

label {
  display: block;
  margin-bottom: 5px;
}

input[type="text"],
input[type="number"],
textarea,
select {
  width: 100%;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

button {
  background-color: #4caf50;
  color: #fff;
  padding: 10px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  font-size: 16px;
}

button:hover {
  background-color: #45a049;
}
    </style>



    <div class="container">
    <h2>Phiếu Thu</h2>
 
      <div class="row">
        <div class="column">
          <div class="form-group">
            <label for="recipient">Người tra:</label>
            <input type="text" id="idnguoinhan" name="recipient">
          </div>
          <div class="form-group">
            <label for="amount">Số tiền:</label>
            <input type="number" id="sotienid" name="amount">
          </div>
          <div class="form-group">
            <label for="description">Mô tả:</label>
            <textarea id="motaid" name="description"></textarea>
          </div>
        </div>
        <div class="column">
          <div class="form-group">
            <label for="supplier">Khach hang:</label>
            <asp:DropDownList ID="dr_nhacungcap" runat="server" AppendDataBoundItems="true" 
                            DataTextField="makh" 
                            DataValueField="id" 
                            CssClass="form-control input-sm">
                        </asp:DropDownList>
          </div>
          <div class="form-group">
            <label for="balance" style="padding-top:5px;">Công nợ KH:</label>
            <input type="number" id="congnoid" name="balance">
          </div>
          <div class="form-group">
            <label for="date" style="padding-top:10px;">Ngày chi:</label>
            <input type="date" id="ngaychiid" name="date">
          </div>
        </div>
      </div>
      <div class="row">
        <div class="column">
          <div class="form-group">
            <label for="payment-method">Phương thức thanh toán:</label>
            <select id="phuongthucid" name="payment-method">
              <option value="tienmat">Tiền mặt</option>
              <option value="chuyenkhoan">Chuyển khoản ngân hàng</option>
              <option value="sec">Séc</option>
            </select>
          </div>
        </div>
        <div class="column">
          <div class="form-group">
            <label for="note">Nguoi thu tien:</label>
            <input type="text" id="nguoichitienid" name="amount">
          </div>
        </div>
      </div>
      <button type="submit" id="confirmid">Gửi</button>

  </div>

     <script type="text/javascript">
          $(document).ready(function () {
            //SearchText();            
         });     

        
         $('#MainContent_dr_nhacungcap').on('change', function () {
             var idcongno = $('#MainContent_dr_nhacungcap').val();
             //alert(idcongno);
             var data = { idcongno: idcongno }
             $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "Phieuthu.aspx/NH_getcongno",
                    data: JSON.stringify(data),
                    dataType: "json",
                    success: function (data) {
                        //response(data.d);
                        //var objdata = $.parseJSON(data.d);
                        //alert(data.d);
                        $("#congnoid").val(data.d);                             
                    },
                    error: function () {
                        //alert("No Match");
                    }
             });

         });

         $('#confirmid').click(function () {
             var guoinhan = $("#idnguoinhan").val();
             var nhacc = $("#MainContent_dr_nhacungcap").val();
             var sotien = $("#sotienid").val();
             var conoid = $("#congnoid").val();
             var motaid = $("#motaid").val();
             var ngaychi = $("#ngaychiid").val();
             var phuongthuc = $("#phuongthucid").val();
             var nguoichitienid = $("#nguoichitienid").val();
            
             var data = { guoinhan: guoinhan,nhacc:nhacc,sotien:sotien,conoid:conoid,motaid:motaid,ngaychi:ngaychi,phuongthuc:phuongthuc,nguoichitienid:nguoichitienid };
             //alert(guoinhan);

             if (nhacc == '' || sotien == '' || nguoichitienid == '')
             {
                 alert('Ban chua nhap du thong tin!');
             }
             else
             {
                 $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "Phieuthu.aspx/NH_Phieuthu",
                        data: JSON.stringify(data),
                        dataType: "json",
                        success: function (data) {
                            //response(data.d);
                            //var objdata = $.parseJSON(data.d);
                            alert("Them phieu thu thanh cong!");
                            $("#idnguoinhan").val('');
                            $("#MainContent_dr_nhacungcap").val('==KH==');
                            $("#sotienid").val('');
                            $("#congnoid").val('');
                            $("#motaid").val('');
                            $("#ngaychiid").val('');
                            $("#phuongthucid").val('Tien mat');
                            $("#nguoichitienid").val('');                                    
                        },
                        error: function () {
                            //alert("No Match");
                        }
                 });
             }

             


         });

     </script>
    
      


</asp:Content>
