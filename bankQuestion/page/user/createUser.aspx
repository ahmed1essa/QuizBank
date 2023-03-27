<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="createUser.aspx.cs" Inherits="bankQuestion.page.createUser" %>

<%@ Register Assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" dir="rtl">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div>
                <h1>صفحة التسجيل </h1>
            </div>
            <div>
                <dx:ASPxTextBox ID="txtFullName" runat="server" Width="170px" NullText="الاسم">
                </dx:ASPxTextBox>
            </div>

            <div>
                <div>الوظيفه المرشح لها</div>
                <dx:ASPxComboBox ID="cmbEmployMain" runat="server"
                    NullText="حدد الوظيفة الاساسية" DataSourceID="sdsEmployMain"
                    TextField="mainEmployName" ValueField="mainEmployID"
                    AutoPostBack="true">
                </dx:ASPxComboBox>

                <dx:ASPxComboBox ID="cmbEmployData" runat="server"
                    NullText="حدد الوظيفة" DataSourceID="sdsEmployData"
                    TextField="employName" ValueField="employID">
                </dx:ASPxComboBox>

            </div>
            <div>
                <div>بيانات الدخول</div>
                <dx:ASPxTextBox ID="txtPhone" runat="server" Width="170px" NullText="رقم الهاتف">
                </dx:ASPxTextBox>
                <dx:ASPxTextBox ID="txtPassword" runat="server" Width="170px" NullText="كلمة المرور">
                </dx:ASPxTextBox>
                <dx:ASPxTextBox ID="txtPassword2" runat="server" Width="170px" NullText="اعادة كلمة المرور">
                </dx:ASPxTextBox>
            </div>
            <div>
                <div>بيانات اخري</div>
                <dx:ASPxTextBox ID="txtEmail" runat="server" Width="170px" NullText="البريد الالكتروني">
                </dx:ASPxTextBox>
                <dx:ASPxTextBox ID="txtCID" runat="server" Width="170px" NullText="الرقم المدني">
                </dx:ASPxTextBox>
            </div>

            <div>
                <asp:Button ID="btnRecord" runat="server" Text="حفظ" OnClick="btnRecord_Click" />
            </div>
            <div>
                <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
            </div>
        </div>


        <asp:SqlDataSource ID="sdsEmployMain" runat="server"
            ConnectionString="<%$ ConnectionStrings:bankQuestionsConnectionString %>"
            SelectCommand="employ_mainddList" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

        <asp:SqlDataSource ID="sdsEmployData" runat="server"
            ConnectionString="<%$ ConnectionStrings:bankQuestionsConnectionString %>"
            SelectCommand="employ_dataddList" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="cmbEmployMain" Name="mainEmployID" PropertyName="Value" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <%--<asp:SqlDataSource ID="sdsEmployData" runat="server" 
            ConnectionString="<%$ ConnectionStrings:bankQuestionsConnectionString %>" 
                    
        </asp:SqlDataSource>--%>
    </form>
</body>
</html>
