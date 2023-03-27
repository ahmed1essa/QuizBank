<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="employData.aspx.cs" Inherits="bankQuestion.admin.employData" %>

<%@ Register Assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <%--Header--%>
        <div>
            <h1 style="text-align: center;">الوظائف</h1>
        </div>
        <%--/Headert--%>
        <%--GView--%>
        <div>
            <dx:ASPxGridView ID="gView" runat="server"
                AutoGenerateColumns="False" DataSourceID="sdsData"
                KeyFieldName="employID"
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
                        <dx:GridViewColumnLayoutItem ColumnName="employID">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColSpan="2" ColumnName="employName">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColSpan="2" ColumnName="mainEmployRef">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColSpan="3" ColumnName="description" RowSpan="3">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="active">
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
                    <dx:GridViewDataTextColumn FieldName="employID"
                        ReadOnly="True" VisibleIndex="1"
                        Caption="employID" Visible="False">
                        <EditFormSettings Visible="True" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="employName"
                        VisibleIndex="2"
                        Caption="الوظيفة">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataCheckColumn FieldName="active"
                        VisibleIndex="5"
                        Caption="فعال">
                    </dx:GridViewDataCheckColumn>
                    <dx:GridViewDataMemoColumn Caption="الوصف" FieldName="description" Visible="False" VisibleIndex="4">
                        <EditFormSettings Visible="True" />
                    </dx:GridViewDataMemoColumn>
                    <dx:GridViewDataComboBoxColumn Caption="الوظيفة الرئيسة" FieldName="mainEmployRef" VisibleIndex="3">
                        <PropertiesComboBox DataSourceID="sdsDdListEmployMain" TextField="mainEmployName" ValueField="mainEmployID">
                        </PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>
                </Columns>

            </dx:ASPxGridView>
        </div>
        <%--/GView--%>
    </div>
    <%--SQL--%>
    <asp:SqlDataSource ID="sdsData" runat="server"
        ConnectionString="<%$ ConnectionStrings:bankQuestionsConnectionString %>"
        DeleteCommand="employ_dataDelete" DeleteCommandType="StoredProcedure"
        InsertCommand="employ_dataInsert" InsertCommandType="StoredProcedure"
        SelectCommand="employ_dataSelect" SelectCommandType="StoredProcedure"
        UpdateCommand="employ_dataUpdate" UpdateCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="employID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="employName" Type="String" />
            <asp:Parameter Name="mainEmployRef" Type="Int32" />
            <asp:Parameter Name="description" Type="String" />
            <asp:Parameter Name="active" Type="Boolean" DefaultValue="true" />
        </InsertParameters>
        <%--<SelectParameters>
            <asp:Parameter DefaultValue="2" Name="userTypeID" Type="Int32" />
        </SelectParameters>--%>
        <UpdateParameters>
            <asp:Parameter Name="employID" Type="Int32" />
            <asp:Parameter Name="employName" Type="String" />
            <asp:Parameter Name="description" Type="Int32" />
            <asp:Parameter Name="active" Type="Boolean" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sdsDdListEmployMain" runat="server"
        ConnectionString="<%$ ConnectionStrings:bankQuestionsConnectionString %>"
        SelectCommand="employ_mainddList" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    <%--/SQL--%>
</asp:Content>

