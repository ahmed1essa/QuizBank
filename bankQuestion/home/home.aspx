<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="bankQuestion.home.home" %>

<%@ Register Assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<h1>المستخدمين</h1>
    <div>
        مرحبا :
        <dx:ASPxLabel ID="txtFullName" runat="server" Text=""></dx:ASPxLabel>
    </div>
</asp:Content>
