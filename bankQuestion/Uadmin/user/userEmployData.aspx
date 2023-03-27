<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="userEmployData.aspx.cs" Inherits="bankQuestion.admin.userEmployData" %>

<%@ Register Assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <%--Header--%>
        <div>
            <h1 style="text-align: center;">مشرفين الموقع</h1>
        </div>
        <%--/Headert--%>
        <%--GView--%>
        <div>
            <dx:ASPxGridView ID="gView" runat="server"
                AutoGenerateColumns="False" DataSourceID="sdsData"
                KeyFieldName="userOKID"
                Width="100%" RightToLeft="True">
                <SettingsText CommandCancel="الغاء الأمر"
                    CommandDelete="حذف "
                    CommandEdit="تعديل "
                    CommandNew="جديد "
                    CommandUpdate="حفظ"
                    CommandClearFilter="مسح"
                    ConfirmDelete="هل أنت متأكد من حذف العنصر"
                    PopupEditFormCaption="البيانات"
                    SearchPanelEditorNullText="اكتب النص للبحث عنه ..." />

                <SettingsPager Mode="ShowPager" PageSize="15">
                    <Summary AllPagesText="الصفحات: {0} - {1} ({2} )"
                        EmptyText="لاتوجد بيانات"
                        Text="صفحة {0} من {1} ({2} )" />
                </SettingsPager>
                <SettingsSearchPanel Visible="True" />

                <SettingsBehavior AllowFocusedRow="True"
                    EnableRowHotTrack="True"
                    ConfirmDelete="True" />

                <SettingsAdaptivity AdaptivityMode="HideDataCells" />

                <SettingsEditing Mode="PopupEditForm" EditFormColumnCount="3"
                    PopupEditFormWidth="500px">
                </SettingsEditing>
                <SettingsPopup>
                    <EditForm Modal="True"
                        HorizontalAlign="WindowCenter"
                        VerticalAlign="WindowCenter" />
                </SettingsPopup>
                <EditFormLayoutProperties ColCount="3">
                    <Items>
                        <dx:GridViewColumnLayoutItem ColumnName="userOKID">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColSpan="3" ColumnName="fullName">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColSpan="2" ColumnName="CID">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="active">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="userName" ColSpan="3">
                        </dx:GridViewColumnLayoutItem>
                        <dx:EditModeCommandLayoutItem ColSpan="3" HorizontalAlign="Left">
                        </dx:EditModeCommandLayoutItem>
                    </Items>
                </EditFormLayoutProperties>

                <Columns>
                    <dx:GridViewCommandColumn ShowDeleteButton="True"
                        ShowEditButton="True" ShowNewButtonInHeader="True"
                        VisibleIndex="0">
                    </dx:GridViewCommandColumn>
                    <dx:GridViewDataTextColumn FieldName="userOKID"
                        ReadOnly="True" VisibleIndex="1"
                        Caption="userID" Visible="False">
                        <EditFormSettings Visible="True" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="fullName"
                        VisibleIndex="2"
                        Caption="الاسم">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="CID"
                        VisibleIndex="3"
                        Caption="الرقم المدني" Visible="True">
                        <EditFormSettings Visible="True" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="userName"
                        VisibleIndex="4"
                        Caption="هوية الدخول (الهاتف)">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataCheckColumn FieldName="active"
                        VisibleIndex="5"
                        Caption="فعال">
                    </dx:GridViewDataCheckColumn>
                </Columns>

            </dx:ASPxGridView>
        </div>
        <%--/GView--%>
    </div>
    <%--SQL--%>
    <asp:SqlDataSource ID="sdsData" runat="server"
        ConnectionString="<%$ ConnectionStrings:bankQuestionsConnectionString %>"
        DeleteCommand="user_employDataDelete" DeleteCommandType="StoredProcedure"
        InsertCommand="user_employDataInsert" InsertCommandType="StoredProcedure"
        SelectCommand="user_employDataSelect" SelectCommandType="StoredProcedure"
        UpdateCommand="user_employDataUpdate" UpdateCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="userOKID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="fullName" Type="String" />
            <asp:Parameter Name="CID" Type="Int64" />
            <asp:Parameter Name="userName" Type="String" />
            <asp:Parameter Name="active" Type="Boolean" DefaultValue="true" />
        </InsertParameters>
        <SelectParameters>
            <asp:Parameter DefaultValue="1" Name="userTypeID" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="userOKID" Type="Int32" />
            <asp:Parameter Name="fullName" Type="String" />
            <asp:Parameter Name="CID" Type="Int64" />
            <asp:Parameter Name="active" Type="Boolean" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <%--/SQL--%>
</asp:Content>
