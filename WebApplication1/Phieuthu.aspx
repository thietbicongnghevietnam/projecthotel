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
    <h2>Phiếu Chi</h2>
    
      <div class="row">
        <div class="column">
          <div class="form-group">
            <label for="recipient">Người nhận:</label>
            <input type="text" id="recipient" name="recipient">
          </div>
          <div class="form-group">
            <label for="amount">Số tiền:</label>
            <input type="number" id="amount" name="amount">
          </div>
          <div class="form-group">
            <label for="description">Mô tả:</label>
            <textarea id="description" name="description"></textarea>
          </div>
        </div>
        <div class="column">
          <div class="form-group">
            <label for="supplier">Nhà cung cấp:</label>
            <select id="supplier" name="supplier">
              <option value="supplier1">Nhà cung cấp 1</option>
              <option value="supplier2">Nhà cung cấp 2</option>
              <option value="supplier3">Nhà cung cấp 3</option>
            </select>
          </div>
          <div class="form-group">
            <label for="balance">Công nợ nhà cung cấp:</label>
            <input type="number" id="balance" name="balance">
          </div>
          <div class="form-group">
            <label for="date">Ngày chi:</label>
            <input type="date" id="date" name="date">
          </div>
        </div>
      </div>
      <div class="row">
        <div class="column">
          <div class="form-group">
            <label for="payment-method">Phương thức thanh toán:</label>
            <select id="payment-method" name="payment-method">
              <option value="cash">Tiền mặt</option>
              <option value="bank-transfer">Chuyển khoản ngân hàng</option>
              <option value="check">Séc</option>
            </select>
          </div>
        </div>
        <div class="column">
          <div class="form-group">
            <label for="note">Ghi chú:</label>
            <textarea id="note" name="note"></textarea>
          </div>
        </div>
      </div>
      <button type="submit">Gửi</button>
 
  </div>


</asp:Content>
