<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="employMainData.aspx.cs" Inherits="bankQuestion.admin.employMainData" %>

<%@ Register Assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <%--Header--%>
        <div>
            <h1 style="text-align: center;">الوظائف الاساسية</h1>
        </div>
        <%--/Headert--%>
        <%--GView--%>
        <div>
            <dx:ASPxGridView ID="gView" runat="server"
                AutoGenerateColumns="False" DataSourceID="sdsData"
                KeyFieldName="mainEmployID"
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
                        <dx:GridViewColumnLayoutItem ColumnName="mainEmployID">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColSpan="2" ColumnName="mainEmployName">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColSpan="3" ColumnName="description" RowSpan="3">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="active">
                        </dx:GridViewColumnLayoutItem>
                        <dx:EditModeCommandLayoutItem ColSpan="3" HorizontalAlign="Left" Width="100%">
                        </dx:EditModeCommandLayoutItem>
                    </Items>
                </EditFormLayoutProperties>

                <Columns>
                    <dx:GridViewCommandColumn ShowDeleteButton="True"
                        ShowEditButton="True" ShowNewButtonInHeader="True"
                        VisibleIndex="0">
                    </dx:GridViewCommandColumn>
                    <dx:GridViewDataTextColumn FieldName="mainEmployID"
                        ReadOnly="True" VisibleIndex="1"
                        Caption="mainEmployID" Visible="False">
                        <EditFormSettings Visible="True" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="mainEmployName"
                        VisibleIndex="2"
                        Caption="الوظيفة">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="description"
                        VisibleIndex="3"
                        Caption="الوصف" Visible="False">
                        <EditFormSettings Visible="True" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataCheckColumn FieldName="active"
                        VisibleIndex="4"
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
        DeleteCommand="employ_mainDelete" DeleteCommandType="StoredProcedure"
        InsertCommand="employ_mainInsert" InsertCommandType="StoredProcedure"
        SelectCommand="employ_mainSelect" SelectCommandType="StoredProcedure"
        UpdateCommand="employ_mainUpdate" UpdateCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="mainEmployID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="mainEmployName" Type="String" />
            <asp:Parameter Name="description" Type="String" />
            <asp:Parameter Name="active" Type="Boolean" />
        </InsertParameters>
        <%--<SelectParameters>
            <asp:Parameter DefaultValue="2" Name="userTypeID" Type="Int32" />
        </SelectParameters>--%>
        <UpdateParameters>
            <asp:Parameter Name="mainEmployID" Type="Int32" />
            <asp:Parameter Name="mainEmployName" Type="String" />
            <asp:Parameter Name="description" Type="Int64" />
            <asp:Parameter Name="active" Type="Boolean" />
        </UpdateParameters>
    </asp:SqlDataSource>
     <%--/SQL--%>
</asp:Content>

