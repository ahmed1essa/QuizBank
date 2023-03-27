<%@ Page Title="" Language="C#"
    MasterPageFile="~/Site1.Master"
    AutoEventWireup="true"
    CodeBehind="activeUser.aspx.cs"
    Inherits="bankQuestion.guest.activeUser" %>

<%@ Register Assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>شاشة التفعيل</h1>
    <dx:ASPxTextBox ID="txtActiveCode" runat="server"
        Width="170px" NullText="ادخل كود التفعيل">
    </dx:ASPxTextBox>
    <dx:ASPxButton ID="btnActiveUser" runat="server" Text="تفعيل" OnClick="btnActiveUser_Click"></dx:ASPxButton>
    <div>
       <%-- <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>--%>
        <dx:ASPxLabel ID="lblMessage" runat="server" Text=""></dx:ASPxLabel>
    </div>
</asp:Content>
