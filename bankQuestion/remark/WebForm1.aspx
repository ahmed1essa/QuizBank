<%@ Page Language="C#" AutoEventWireup="true" 
    CodeBehind="WebForm1.aspx.cs" 
    Inherits="bankQuestion.remark.WebForm1" 
    StylesheetTheme="Skin1" %>

<%@ Register Assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%--<%@ Page Theme="Skin1" %>
<%@ Page StyleSheetTheme="Skin1" %>--%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
    <div>
        <dx:ASPxGridView ID="ASPxGridView1" 
            runat="server" AutoGenerateColumns="False"
            DataSourceID="SqlDataSource1" 
            KeyFieldName="bankID">

            <Columns>
                <dx:GridViewDataTextColumn FieldName="bankID" ReadOnly="True" VisibleIndex="0">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="bankName" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="categoryRef" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="description" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataCheckColumn FieldName="active" VisibleIndex="4">
                </dx:GridViewDataCheckColumn>
                <dx:GridViewDataTextColumn FieldName="subjectCount" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="questionCount" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="questionActiveCount" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
            </Columns>
            <Styles CssPostfix="MyDefault" CssFilePath="~/App_Themes/MyDefault/{0}/styles.css" />  
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:bankQuestionsConnectionString %>" DeleteCommand="DELETE FROM [bank_data] WHERE [bankID] = @bankID" InsertCommand="INSERT INTO [bank_data] ([bankName], [categoryRef], [description], [active], [subjectCount], [questionCount], [questionActiveCount]) VALUES (@bankName, @categoryRef, @description, @active, @subjectCount, @questionCount, @questionActiveCount)" SelectCommand="SELECT * FROM [bank_data]" UpdateCommand="UPDATE [bank_data] SET [bankName] = @bankName, [categoryRef] = @categoryRef, [description] = @description, [active] = @active, [subjectCount] = @subjectCount, [questionCount] = @questionCount, [questionActiveCount] = @questionActiveCount WHERE [bankID] = @bankID">
            <DeleteParameters>
                <asp:Parameter Name="bankID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="bankName" Type="String" />
                <asp:Parameter Name="categoryRef" Type="Int32" />
                <asp:Parameter Name="description" Type="String" />
                <asp:Parameter Name="active" Type="Boolean" />
                <asp:Parameter Name="subjectCount" Type="Int32" />
                <asp:Parameter Name="questionCount" Type="Int32" />
                <asp:Parameter Name="questionActiveCount" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="bankName" Type="String" />
                <asp:Parameter Name="categoryRef" Type="Int32" />
                <asp:Parameter Name="description" Type="String" />
                <asp:Parameter Name="active" Type="Boolean" />
                <asp:Parameter Name="subjectCount" Type="Int32" />
                <asp:Parameter Name="questionCount" Type="Int32" />
                <asp:Parameter Name="questionActiveCount" Type="Int32" />
                <asp:Parameter Name="bankID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
        <div>
            <asp:label runat="server" text="Label"></asp:label>

        </div>
    </form>
</body>
</html>
