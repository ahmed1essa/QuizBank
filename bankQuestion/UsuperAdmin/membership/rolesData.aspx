<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="rolesData.aspx.cs" Inherits="bankQuestion.membership.rolesData" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" dir="rtl">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div></div>
            <div>الصلاحيات</div>
            <div>
                <asp:ListBox ID="lstRoles" runat="server" OnSelectedIndexChanged="lstRoles_SelectedIndexChanged" AutoPostBack="True"></asp:ListBox>
            </div>
            <div>
                <asp:TextBox ID="txtRoleName" runat="server"></asp:TextBox>
                <asp:Button ID="btnRoleAdd" runat="server" Text="اضافة صلاحية" OnClick="btnRoleAdd_Click" />
            </div>
            <div>
                <asp:Button ID="btnRoleDelete" runat="server" Text="حذف صلاحية" OnClick="btnRoleDelete_Click" />
            </div>
            <div>
                <h1>الصلاحية المحددة</h1>
                <asp:Label ID="lblRoleName" runat="server" Text="Label"></asp:Label>
            </div>
            <div>

                <asp:Button ID="btnViewUsers" runat="server" Text="عرض المستخدمين" OnClick="btnViewUsers_Click" />
            </div>
            <div>
                <asp:ListBox ID="lstUsers" runat="server" AutoPostBack="True"></asp:ListBox>
            </div>
            <div>
                <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
                <asp:Button ID="btnAddUser" runat="server" Text="اضافة مستخدم" OnClick="btnAddUser_Click" />
            </div>
            <div>
                <asp:Button ID="btnDeleteUser" runat="server" Text="حذف مستخدم" OnClick="btnDeleteUser_Click" />
            </div>
        </div>
    </form>
</body>
</html>
