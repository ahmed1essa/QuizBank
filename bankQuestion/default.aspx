<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="bankQuestion._default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server" dir="rtl">
        <div>
            <div>
                <h1>الصفحة الرئيسة</h1>
            </div>
            <div>
                <asp:Button ID="btnLogin" runat="server" Text="تسجيل الدخول" OnClick="btnLogin_Click" />
            </div>
            <div>
                <asp:Button ID="btnAddUser" runat="server" Text="مستخدم جديد" OnClick="btnAddUser_Click" />
            </div>
        </div>
    </form>
</body>
</html>
