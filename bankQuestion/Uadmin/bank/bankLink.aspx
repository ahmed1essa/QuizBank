<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="bankLink.aspx.cs" Inherits="bankQuestion.admin.bankLink" %>

<%@ Register Assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <%--Header--%>
        <div>
            <h1 style="text-align: center;">ربط بنك اسئلة بوظيفة</h1>
        </div>
        <%--/Headert--%>
        <%--Filter--%>
        <div>
            <dx:ASPxComboBox ID="cmbEmployMain" runat="server"
                DataSourceID="sdsDdListEmployMain" AutoPostBack="true"
                TextField="mainEmployName" ValueField="mainEmployID"
                NullText="اختر الوظيفة الرئيسية"
                RightToLeft="True" OnSelectedIndexChanged="cmbEmployMain_SelectedIndexChanged">
                <ItemStyle HorizontalAlign="Right" />
                <ClearButton DisplayMode="Always" />
            </dx:ASPxComboBox>
            <dx:ASPxComboBox ID="cmbEmployData" runat="server"
                DataSourceID="sdsDdListEmployData"
                TextField="employName" ValueField="employID"
                NullText="اختر الوظيفة" EnableSynchronization="True"
                RightToLeft="True" AutoPostBack="true">
                <ItemStyle HorizontalAlign="Right" />
                <ClearButton DisplayMode="Always" />
            </dx:ASPxComboBox>
        </div>
        <%--/Filter--%>
        <%--GView--%>
        <div>
            <dx:ASPxGridView ID="gView" runat="server"
                AutoGenerateColumns="False" DataSourceID="sdsData"
                KeyFieldName="bankID"
                Width="100%" RightToLeft="True" OnCommandButtonInitialize="gView_CommandButtonInitialize">
                <SettingsText CommandCancel="الغاء الأمر"
                    CommandDelete="حذف "
                    CommandEdit="تعديل "
                    CommandNew="جديد "
                    CommandUpdate="حفظ"
                    CommandClearFilter="مسح"
                    ConfirmDelete="هل أنت متأكد من التعديل"
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
                    PopupEditFormWidth="800px">
                </SettingsEditing>
                <SettingsPopup>
                    <EditForm Modal="True"
                        HorizontalAlign="WindowCenter"
                        VerticalAlign="WindowCenter" />
                </SettingsPopup>
                <EditFormLayoutProperties
                    SettingsItemCaptions-Location="Top" ColCount="3">
                    <SettingsItemCaptions Location="Top"></SettingsItemCaptions>
                </EditFormLayoutProperties>

                <Columns>
                    <dx:GridViewCommandColumn ShowDeleteButton="True"
                        VisibleIndex="0">
                    </dx:GridViewCommandColumn>
                    <dx:GridViewDataTextColumn FieldName="bankID"
                        ReadOnly="True" VisibleIndex="1"
                        Caption="bankID" Visible="False">
                        <EditFormSettings CaptionLocation="Top" RowSpan="3" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="bankName"
                        VisibleIndex="2"
                        Caption="الاسم">
                    </dx:GridViewDataTextColumn>

                    <dx:GridViewDataComboBoxColumn FieldName="categoryRef"
                        Caption="التصنيف"
                        VisibleIndex="3">
                        <PropertiesComboBox DataSourceID="sdsDdListCategory"
                            TextField="categoryName"
                            ValueField="categoryID">
                        </PropertiesComboBox>
                        <%--EnableSynchronization="False" 
                            IncrementalFilteringMode="StartsWith"--%>
                    </dx:GridViewDataComboBoxColumn>

                    <dx:GridViewDataMemoColumn FieldName="description"
                        VisibleIndex="4"
                        Caption="الوصف" Visible="false" EditFormSettings-Visible="True">
                        <EditFormSettings Visible="True"></EditFormSettings>
                    </dx:GridViewDataMemoColumn>

                    <dx:GridViewDataCheckColumn FieldName="active"
                        VisibleIndex="5"
                        Caption="فعال">
                    </dx:GridViewDataCheckColumn>
                    <dx:GridViewDataTextColumn FieldName="ID"
                        VisibleIndex="6"
                        Caption="##" ReadOnly="true" Visible="False">
                    </dx:GridViewDataTextColumn>
                </Columns>

            </dx:ASPxGridView>
        </div>
        <%--/GView--%>
    </div>
    <%--SQL--%>
    <asp:SqlDataSource ID="sdsDdListEmployMain" runat="server"
        ConnectionString="<%$ ConnectionStrings:bankQuestionsConnectionString %>"
        SelectCommand="employ_mainddList" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    <asp:SqlDataSource ID="sdsDdListEmployData" runat="server"
        ConnectionString="<%$ ConnectionStrings:bankQuestionsConnectionString %>"
        SelectCommand="employ_dataddList" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter Name="mainEmployID"
                ControlID="cmbEmployMain"
                PropertyName="Value" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sdsData" runat="server"
        ConnectionString="<%$ ConnectionStrings:bankQuestionsConnectionString %>"
        DeleteCommand="bank_LinkAdd" DeleteCommandType="StoredProcedure"
        SelectCommand="bank_linkSelect" SelectCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="bankID" Type="Int32" />
            <asp:ControlParameter Name="employID"
                ControlID="cmbEmployData"
                PropertyName="Value" Type="Int32" />
        </DeleteParameters>
        <SelectParameters>
            <asp:ControlParameter Name="employID"
                ControlID="cmbEmployData"
                PropertyName="Value" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sdsDdListCategory" runat="server"
        ConnectionString="<%$ ConnectionStrings:bankQuestionsConnectionString %>"
        SelectCommand="bank_categoryddList" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    <%--/SQL--%>
</asp:Content>

