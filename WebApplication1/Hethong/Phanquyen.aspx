<%@ Page Title="Phân quyền" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Phanquyen.aspx.cs" Inherits="WebApplication1.Hethong.Phanquyen" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<style>
    .pq-table th, .pq-table td { vertical-align: middle !important; text-align: center; padding: .35rem .5rem; }
    .pq-table td.ten { text-align: left; }
    .pq-table thead th { position: sticky; top: 0; background: #343a40; color: #fff; z-index: 2; }
    .pq-table tr.pq-group td { background: #e9ecef; font-weight: bold; text-align: left; color: #495057; }
    .pq-table input[type=checkbox] { width: 17px; height: 17px; cursor: pointer; }
    .pq-scroll { max-height: 70vh; overflow-y: auto; }
    .role-list .list-group-item { cursor: pointer; }
    .role-list .list-group-item.inactive { opacity: .55; }
</style>

<div class="container-fluid p-3">
    <h4 class="mb-3"><i class="fas fa-user-shield"></i> PHÂN QUYỀN THEO NHÓM</h4>

    <asp:Panel ID="pnlMsg" runat="server" Visible="false" CssClass="alert">
        <asp:Literal ID="litMsg" runat="server" />
    </asp:Panel>

    <div class="row">
        <%-- ===== CỘT TRÁI: DANH SÁCH NHÓM ===== --%>
        <div class="col-lg-3 col-md-4">
            <div class="card">
                <div class="card-header bg-dark"><b>Nhóm quyền</b></div>
                <div class="list-group list-group-flush role-list">
                    <asp:Repeater ID="rptRoles" runat="server" OnItemCommand="rptRoles_ItemCommand">
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkRole" runat="server" CommandName="Select"
                                CommandArgument='<%# Eval("ROLE_ID") %>'
                                CssClass='<%# "list-group-item list-group-item-action d-flex justify-content-between align-items-center"
                                              + (Convert.ToInt32(Eval("ROLE_ID")) == SelectedRoleId ? " active" : "")
                                              + (Convert.ToBoolean(Eval("IS_ACTIVE")) ? "" : " inactive") %>'>
                                <span>
                                    <%#: Eval("ROLE_NAME") %><br />
                                    <small><%#: Eval("ROLE_CODE") %><%# Convert.ToBoolean(Eval("IS_ACTIVE")) ? "" : " · ngừng" %></small>
                                </span>
                                <span class="text-right">
                                    <span class="badge badge-info"><%# Eval("SO_USER") %> user</span><br />
                                    <span class="badge badge-secondary"><%# Eval("SO_QUYEN") %> quyền</span>
                                </span>
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>

                <%-- Form thêm / sửa nhóm --%>
                <asp:Panel ID="pnlRoleForm" runat="server" CssClass="card-footer">
                    <b><asp:Label ID="lblRoleFormTitle" runat="server" Text="Sửa nhóm" /></b>
                    <asp:HiddenField ID="hfRoleEditId" runat="server" Value="0" />
                    <div class="form-group mt-2 mb-2">
                        <label class="mb-0 small">Mã nhóm (A-Z, 0-9, _)</label>
                        <asp:TextBox ID="txtRoleCode" runat="server" CssClass="form-control form-control-sm" MaxLength="50" />
                    </div>
                    <div class="form-group mb-2">
                        <label class="mb-0 small">Tên nhóm</label>
                        <asp:TextBox ID="txtRoleName" runat="server" CssClass="form-control form-control-sm" MaxLength="100" />
                    </div>
                    <div class="form-check mb-2">
                        <asp:CheckBox ID="chkRoleActive" runat="server" Text=" Đang hoạt động" Checked="true" />
                    </div>
                    <asp:Button ID="btnRoleSave" runat="server" Text="Lưu nhóm" CssClass="btn btn-primary btn-sm" OnClick="btnRoleSave_Click" />
                    <asp:Button ID="btnRoleNew" runat="server" Text="+ Nhóm mới" CssClass="btn btn-outline-secondary btn-sm" OnClick="btnRoleNew_Click" CausesValidation="false" />
                    <asp:Button ID="btnRoleDelete" runat="server" Text="Xóa" CssClass="btn btn-outline-danger btn-sm float-right" OnClick="btnRoleDelete_Click"
                        OnClientClick="return confirm('Xóa nhóm này? Chỉ xóa được khi không còn user nào thuộc nhóm.');" />
                </asp:Panel>
            </div>
        </div>

        <%-- ===== CỘT PHẢI: LƯỚI QUYỀN ===== --%>
        <div class="col-lg-9 col-md-8">
            <asp:Panel ID="pnlMatrix" runat="server" CssClass="card">
                <div class="card-header d-flex justify-content-between align-items-center">
                    <span>Quyền của nhóm: <b class="text-primary"><asp:Literal ID="litRoleTitle" runat="server" /></b></span>
                    <span>
                        <label class="mb-0 mr-3"><input type="checkbox" id="chkAllMatrix" <%= CanEdit ? "" : "disabled" %> /> Chọn tất cả</label>
                        <asp:Button ID="btnSave" runat="server" Text="💾 Lưu phân quyền" CssClass="btn btn-success btn-sm" OnClick="btnSave_Click" />
                    </span>
                </div>
                <div class="card-body p-0 pq-scroll">
                    <table class="table table-bordered table-hover table-sm mb-0 pq-table">
                        <thead>
                            <tr>
                                <th style="text-align:left; min-width:220px;">Chức năng</th>
                                <th style="width:60px;">Cả dòng</th>
                                <th><label class="mb-0">Xem<br /><input type="checkbox" class="col-all" data-col="VIEW" /></label></th>
                                <th><label class="mb-0">Thêm<br /><input type="checkbox" class="col-all" data-col="ADD" /></label></th>
                                <th><label class="mb-0">Sửa<br /><input type="checkbox" class="col-all" data-col="EDIT" /></label></th>
                                <th><label class="mb-0">Xóa<br /><input type="checkbox" class="col-all" data-col="DELETE" /></label></th>
                                <th><label class="mb-0">In<br /><input type="checkbox" class="col-all" data-col="PRINT" /></label></th>
                                <th><label class="mb-0">Xuất Excel<br /><input type="checkbox" class="col-all" data-col="EXPORT" /></label></th>
                                <th><label class="mb-0">Duyệt<br /><input type="checkbox" class="col-all" data-col="APPROVE" /></label></th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="rptMatrix" runat="server" OnItemDataBound="rptMatrix_ItemDataBound">
                                <ItemTemplate>
                                    <asp:Literal ID="litGroup" runat="server" />
                                    <tr class="pq-row">
                                        <td class="ten">
                                            <%#: Eval("MODULE_NAME") %>
                                            <small class="text-muted d-block"><%#: Eval("MODULE_CODE") %></small>
                                        </td>
                                        <td><input type="checkbox" class="row-all" <%# CanEdit ? "" : "disabled" %> /></td>
                                        <td><asp:CheckBox ID="chkVIEW" runat="server" /><asp:HiddenField ID="hfVIEW" runat="server" /></td>
                                        <td><asp:CheckBox ID="chkADD" runat="server" /><asp:HiddenField ID="hfADD" runat="server" /></td>
                                        <td><asp:CheckBox ID="chkEDIT" runat="server" /><asp:HiddenField ID="hfEDIT" runat="server" /></td>
                                        <td><asp:CheckBox ID="chkDELETE" runat="server" /><asp:HiddenField ID="hfDELETE" runat="server" /></td>
                                        <td><asp:CheckBox ID="chkPRINT" runat="server" /><asp:HiddenField ID="hfPRINT" runat="server" /></td>
                                        <td><asp:CheckBox ID="chkEXPORT" runat="server" /><asp:HiddenField ID="hfEXPORT" runat="server" /></td>
                                        <td><asp:CheckBox ID="chkAPPROVE" runat="server" /><asp:HiddenField ID="hfAPPROVE" runat="server" /></td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>
                    </table>
                </div>
                <div class="card-footer small text-muted">
                    Tick một quyền bất kỳ sẽ tự tick quyền <b>Xem</b> của dòng đó; bỏ <b>Xem</b> sẽ bỏ cả dòng.
                    Ô trống nghĩa là chức năng không có hành động đó.
                    Người dùng phải <b>đăng nhập lại</b> để nhận quyền mới.
                </div>
            </asp:Panel>
        </div>
    </div>
</div>

<script>
    $(function () {
        var $chk = function () { return $('.pq-chk:enabled'); };

        // Chọn tất cả
        $('#chkAllMatrix').on('change', function () {
            $chk().prop('checked', this.checked);
            $('.row-all:enabled, .col-all').prop('checked', this.checked);
        });

        // Chọn cả cột
        $('.col-all').on('change', function () {
            var col = $(this).data('col');
            $('.pq-chk:enabled[data-col="' + col + '"]').prop('checked', this.checked).trigger('pq:changed');
        });

        // Chọn cả dòng
        $('.row-all').on('change', function () {
            $(this).closest('tr').find('.pq-chk:enabled').prop('checked', this.checked);
        });

        // Tick quyền khác thì tự tick Xem; bỏ Xem thì bỏ cả dòng
        $(document).on('change pq:changed', '.pq-chk', function () {
            var $tr = $(this).closest('tr');
            if ($(this).data('col') === 'VIEW') {
                if (!this.checked) $tr.find('.pq-chk:enabled').prop('checked', false);
            } else if (this.checked) {
                $tr.find('.pq-chk[data-col="VIEW"]:enabled').prop('checked', true);
            }
        });

        // Trạng thái ô "Cả dòng" ban đầu
        $('tr.pq-row').each(function () {
            var $c = $(this).find('.pq-chk');
            $(this).find('.row-all').prop('checked', $c.length > 0 && $c.filter(':checked').length === $c.length);
        });

        if (!<%= CanEdit ? "true" : "false" %>) { $('.col-all').prop('disabled', true); }
    });
</script>
</asp:Content>