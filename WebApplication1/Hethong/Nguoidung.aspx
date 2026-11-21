<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Nguoidung.aspx.cs" Inherits="WebApplication1.Hethong.Nguoidung" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<style>
    .nd-table th, .nd-table td { vertical-align: middle !important; }
    .nd-roles label { margin-left: 4px; margin-bottom: 0; }
    .nd-roles td { padding: 2px 8px 2px 0; }
</style>

<div class="container-fluid p-3">
    <h4 class="mb-3"><i class="fas fa-users-cog"></i> QUẢN LÝ NGƯỜI DÙNG</h4>

    <asp:Panel ID="pnlMsg" runat="server" Visible="false" CssClass="alert">
        <asp:Literal ID="litMsg" runat="server" />
    </asp:Panel>
    <div id="jsMsg" class="alert d-none"></div>

    <div class="row">
        <%-- ===== DANH SÁCH ===== --%>
        <div class="col-lg-8">
            <div class="card">
                <div class="card-header bg-dark"><b>Danh sách người dùng</b></div>
                <div class="card-body p-0">
                    <asp:GridView ID="gvUsers" runat="server" AutoGenerateColumns="false" DataKeyNames="U_ID"
                        CssClass="table table-bordered table-hover table-sm mb-0 nd-table" GridLines="None"
                        OnRowCommand="gvUsers_RowCommand" OnRowDataBound="gvUsers_RowDataBound"
                        EmptyDataText="Chưa có người dùng">
                        <HeaderStyle CssClass="thead-light" />
                        <Columns>
                            <asp:BoundField DataField="U_ID" HeaderText="ID" ItemStyle-Width="50px" />
                            <asp:BoundField DataField="U_NAME" HeaderText="Tên đăng nhập" />
                            <asp:BoundField DataField="U_FULLNAME" HeaderText="Họ tên" />
                            <asp:BoundField DataField="ROLES" HeaderText="Nhóm quyền" />
                            <asp:TemplateField HeaderText="Trạng thái" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <span class='badge <%# Eval("U_ACTIVE").ToString() == "Y" ? "badge-success" : "badge-secondary" %>'>
                                        <%# Eval("U_ACTIVE").ToString() == "Y" ? "Hoạt động" : "Đã khóa" %>
                                    </span>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ItemStyle-Width="150px" ItemStyle-CssClass="text-nowrap">
                                <ItemTemplate>
                                    <asp:LinkButton ID="btnEdit" runat="server" CommandName="EditUser"
                                        CommandArgument='<%# Eval("U_ID") %>' CssClass="btn btn-xs btn-outline-primary btn-sm py-0">Sửa</asp:LinkButton>
                                    <asp:LinkButton ID="btnToggle" runat="server" CommandName="ToggleUser"
                                        CommandArgument='<%# Eval("U_ID") %>'
                                        CssClass='<%# "btn btn-sm py-0 " + (Eval("U_ACTIVE").ToString() == "Y" ? "btn-outline-danger" : "btn-outline-success") %>'
                                        OnClientClick="return confirm('Đổi trạng thái khóa/mở của tài khoản này?');">
                                        <%# Eval("U_ACTIVE").ToString() == "Y" ? "Khóa" : "Mở khóa" %>
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>

        <%-- ===== FORM THÊM / SỬA ===== --%>
        <div class="col-lg-4">
            <asp:Panel ID="pnlForm" runat="server" CssClass="card">
                <div class="card-header bg-primary"><b><asp:Label ID="lblFormTitle" runat="server" Text="Thêm người dùng" /></b></div>
                <div class="card-body">
                    <asp:HiddenField ID="hfUserId" runat="server" Value="0" />

                    <div class="form-group">
                        <label class="mb-0">Tên đăng nhập <span class="text-danger">*</span></label>
                        <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control form-control-sm" MaxLength="100" autocomplete="off" />
                    </div>
                    <div class="form-group">
                        <label class="mb-0">Mật khẩu</label>
                        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control form-control-sm" TextMode="Password" MaxLength="200" autocomplete="new-password" />
                    </div>
                    <div class="form-group">
                        <label class="mb-0">Họ tên</label>
                        <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control form-control-sm" MaxLength="200" />
                    </div>
                    <div class="form-group">
                        <label class="mb-0">Email</label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control form-control-sm" MaxLength="200" />
                    </div>
                    <div class="form-group">
                        <label class="mb-0">Nhóm quyền <span class="text-danger">*</span></label>
                        <asp:CheckBoxList ID="cblRoles" runat="server" CssClass="nd-roles" RepeatLayout="Table" RepeatColumns="2" />
                    </div>
                    <div class="form-group">
                        <asp:CheckBox ID="chkActive" runat="server" Text=" Đang hoạt động" Checked="true" />
                    </div>

                    <asp:Button ID="btnSave" runat="server" Text="Lưu" CssClass="btn btn-primary btn-sm"
    UseSubmitBehavior="false" OnClientClick="saveUser(); return false;" />
                    <asp:Button ID="btnNew" runat="server" Text="+ Người dùng mới" CssClass="btn btn-outline-secondary btn-sm"
    UseSubmitBehavior="false" OnClientClick="newUser(); return false;" />
                </div>
            </asp:Panel>
        </div>
    </div>
</div>


    <script>
    function showJsMsg(text, ok) {
        $('#jsMsg').removeClass('d-none alert-success alert-danger')
                   .addClass(ok ? 'alert-success' : 'alert-danger')
                   .text(text);
    }

    function saveUser() {
        var roleIds = [];
        $('#<%= cblRoles.ClientID %> span[data-roleid]').each(function () {
            if ($(this).find('input[type=checkbox]').is(':checked'))
                roleIds.push($(this).attr('data-roleid'));
        });

        var data = {
            id:       parseInt($('#<%= hfUserId.ClientID %>').val(), 10) || 0,
            userName: $.trim($('#<%= txtUserName.ClientID %>').val()),
            password: $('#<%= txtPassword.ClientID %>').val(),
            fullName: $.trim($('#<%= txtFullName.ClientID %>').val()),
            email:    $.trim($('#<%= txtEmail.ClientID %>').val()),
            active:   $('#<%= chkActive.ClientID %>').is(':checked'),
            roleIds:  roleIds.join(',')
        };

        // Kiểm tra nhanh phía client (server vẫn kiểm tra lại)
        if (data.userName === '') { showJsMsg('Vui lòng nhập tên đăng nhập.', false); return; }
        if (data.id === 0 && data.password === '') { showJsMsg('Vui lòng nhập mật khẩu cho người dùng mới.', false); return; }
        if (roleIds.length === 0) { showJsMsg('Vui lòng chọn ít nhất 1 nhóm quyền.', false); return; }

        var $btn = $('#<%= btnSave.ClientID %>').prop('disabled', true).val('Đang lưu...');

        $.ajax({
            type: 'POST',
            url: '<%= ResolveUrl("~/Hethong/Nguoidung.aspx/SaveUser") %>',
            data: JSON.stringify(data),
            contentType: 'application/json; charset=utf-8',
            dataType: 'json'
        }).done(function (res) {
            var r = res.d;
            if (r.ok) {
                window.location.href = '<%= ResolveUrl("~/Hethong/Nguoidung.aspx") %>'
                    + '?id=' + r.id + '&saved=' + (data.id === 0 ? 'add' : 'edit');
            } else {
                showJsMsg(r.msg, false);
                $btn.prop('disabled', false).val('Lưu');
            }
        }).fail(function (xhr) {
            showJsMsg('Lỗi kết nối máy chủ (' + xhr.status + ').', false);
            $btn.prop('disabled', false).val('Lưu');
        });
        }

        var canAdd = <%= CanAdd  ? "true" : "false" %>;
        var canEdit = <%= CanEdit ? "true" : "false" %>;

        // Thêm mới cần quyền ADD, sửa cần quyền EDIT
        function updateSaveButton() {
            var id = parseInt($('#<%= hfUserId.ClientID %>').val(), 10) || 0;
        $('#<%= btnSave.ClientID %>').toggle(id === 0 ? canAdd : canEdit);
        }

        function newUser() {
            $('#<%= hfUserId.ClientID %>').val('0');
        $('#<%= txtUserName.ClientID %>').val('');
        $('#<%= txtPassword.ClientID %>').val('').attr('placeholder', 'Bắt buộc với người dùng mới');
        $('#<%= txtFullName.ClientID %>').val('');
        $('#<%= txtEmail.ClientID %>').val('');

        // Mở lại ô "Đang hoạt động" (bị khóa khi đang sửa chính mình)
        $('#<%= chkActive.ClientID %>').prop('checked', true).prop('disabled', false)
            .closest('span').removeAttr('disabled').removeClass('aspNetDisabled');

        $('#<%= cblRoles.ClientID %> input[type=checkbox]').prop('checked', false);
        $('#<%= lblFormTitle.ClientID %>').text('Thêm người dùng');

        // Ẩn thông báo cũ và bỏ ?id=..&saved=.. trên URL
        $('#jsMsg').addClass('d-none');
        $('#<%= pnlMsg.ClientID %>').hide();
        if (window.history.replaceState) window.history.replaceState(null, '', window.location.pathname);

        updateSaveButton();
            $('#<%= txtUserName.ClientID %>').focus();
        }

        $(function () { updateSaveButton(); });


</script>

</asp:Content>
