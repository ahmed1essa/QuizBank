<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="bankData.aspx.cs" Inherits="bankQuestion.admin.bankData" %>

<%@ Register Assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <%--Header--%>
        <div>
            <h1 style="text-align: center;">بنوك الاسئلة</h1>
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
                Width="100%" RightToLeft="True" OnCommandButtonInitialize="gView_CommandButtonInitialize" OnDataBinding="gView_DataBinding">
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
                    PopupEditFormWidth="800px">
                </SettingsEditing>
                <SettingsPopup>
                    <EditForm Modal="True"
                        HorizontalAlign="WindowCenter"
                        VerticalAlign="WindowCenter" />
                </SettingsPopup>
                <EditFormLayoutProperties
                    SettingsItemCaptions-Location="Top" ColCount="3">
                    <Items>
                        <dx:GridViewColumnLayoutItem ColumnName="bankID">
                            <CaptionSettings Location="Top" />
                        </dx:GridViewColumnLayoutItem>
                        <dx:EmptyLayoutItem>
                        </dx:EmptyLayoutItem>
                        <dx:GridViewColumnLayoutItem ColSpan="2" ColumnName="bankName">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="categoryRef">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColSpan="2" ColumnName="description" Width="100%">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="active">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="subjectCount">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="questionCount">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="questionActiveCount">
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
                    <dx:GridViewDataTextColumn FieldName="bankID"
                        ReadOnly="True" VisibleIndex="1"
                        Caption="bankID" Visible="false">
                        <EditFormSettings CaptionLocation="Top" RowSpan="3" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="bankName"
                        VisibleIndex="2"
                        Caption="العنوان">
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
                    </dx:GridViewDataMemoColumn>

                    <dx:GridViewDataCheckColumn FieldName="active"
                        VisibleIndex="5"
                        Caption="فعال">
                    </dx:GridViewDataCheckColumn>
                    <dx:GridViewDataTextColumn FieldName="subjectCount"
                        VisibleIndex="6"
                        Caption="عدد المواضيع" ReadOnly="true">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="questionCount"
                        VisibleIndex="7"
                        Caption="عدد الاسئلة" ReadOnly="true">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="questionActiveCount"
                        VisibleIndex="8"
                        Caption="عدد الاسئلة الفعالة" ReadOnly="true">
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
        DeleteCommand="bank_dataDelete" DeleteCommandType="StoredProcedure"
        InsertCommand="bank_dataInsert" InsertCommandType="StoredProcedure"
        SelectCommand="bank_dataSelect" SelectCommandType="StoredProcedure"
        UpdateCommand="bank_dataUpdate" UpdateCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="employID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter Name="employID"
                ControlID="cmbEmployData"
                PropertyName="Value" Type="Int32" />
            <asp:Parameter Name="bankName" Type="String" />
            <asp:Parameter Name="categoryRef" Type="Int32" />
            <asp:Parameter Name="description" Type="String" />
            <asp:Parameter Name="active" Type="Boolean" />

        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter Name="employID"
                ControlID="cmbEmployData"
                PropertyName="Value" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="bankID" Type="Int32" />
            <asp:Parameter Name="bankName" Type="String" />
            <asp:Parameter Name="categoryRef" Type="Int32" />
            <asp:Parameter Name="description" Type="String" />
            <asp:Parameter Name="active" Type="Boolean" DefaultValue="true" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sdsDdListCategory" runat="server"
        ConnectionString="<%$ ConnectionStrings:bankQuestionsConnectionString %>"
        SelectCommand="bank_categoryddList" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    <%--/SQL--%>
</asp:Content>
