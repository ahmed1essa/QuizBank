<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="usersData.aspx.cs" Inherits="bankQuestion.membership.usersView" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" dir="rtl">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div>
                <asp:Label ID="lblUserName" runat="server" Text="Label"></asp:Label>
                <asp:GridView ID="gviewUsers" runat="server"></asp:GridView>
            </div>
            <div>
                <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
            </div>
            <div>
                <asp:Button ID="btnUserAdd" runat="server" Text="اضافة مستخدم" OnClick="btnUserAdd_Click" />
                <asp:Button ID="btnUserRemove" runat="server" Text="حذف منستخدم" OnClick="btnUserRemove_Click" />
                <asp:Button ID="btnViewRoles" runat="server" Text="عرض الصلاحيات" OnClick="btnViewRoles_Click" />
            </div>
            <div>
                 <asp:Button ID="btnAddRoleSuperAdmin" runat="server" Text="اضافة صلاحية مبرمج" OnClick="btnAddRoleSuperAdmin_Click" />
                <asp:Button ID="btnAddRoleAdmin" runat="server" Text="اضافة صلاحية مشرف" OnClick="btnAddRoleAdmin_Click"/>
                <asp:Button ID="btnAddRoleBank" runat="server" Text="اضافة صلاحية مدخل بيانات" OnClick="btnAddRoleBank_Click"/>
                <asp:Button ID="btnAddRoleUser" runat="server" Text="اضافة صلاحية مستخدم" OnClick="btnAddRoleUser_Click"/>
                <asp:Button ID="btnAddRoleGuest" runat="server" Text="اضافة صلاحية ضيف" OnClick="btnAddRoleGuest_Click"/>
            
            </div>
            <div>
                <asp:ListBox ID="lstRoles" runat="server"></asp:ListBox>
            </div>
        </div>
    </form>
</body>
</html>
