<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="examBank.aspx.cs" Inherits="bankQuestion.Ubank.exam.examBank" %>

<%@ Register Assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <%--Header--%>
        <div>
            <h1 style="text-align: center;">الميزان النسبي</h1>
        </div>
        <%--/Headert--%>
        <%--Start--%>
        <div>
            <dx:ASPxLabel ID="lblExamName" runat="server" 
                Text=""></dx:ASPxLabel>
        </div>
        <%--/Start--%>
        <%--GView--%>
        <div>
            <dx:ASPxGridView ID="gView" runat="server"
                AutoGenerateColumns="False" DataSourceID="sdsData"
                KeyFieldName="ID"
                Width="100%" RightToLeft="True"
                OnCellEditorInitialize="gView_CellEditorInitialize">
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
                <EditFormLayoutProperties ColCount="3" SettingsItemCaptions-Location="Top">
                    <Items>
                        <dx:GridViewColumnLayoutItem ColumnName="ID">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="examRef" ColSpan="2">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="bankRef" ColSpan="3">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="questionCount" ColSpan="1">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="activeQuestionCount" ColSpan="1">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="active">
                        </dx:GridViewColumnLayoutItem>
                        <dx:EditModeCommandLayoutItem ColSpan="3" HorizontalAlign="Center">
                        </dx:EditModeCommandLayoutItem>
                    </Items>
                </EditFormLayoutProperties>

                <Columns>
                    <dx:GridViewCommandColumn ShowDeleteButton="True"
                        ShowEditButton="True" ShowInCustomizationForm="True"
                        ShowNewButtonInHeader="True"
                        VisibleIndex="0">
                    </dx:GridViewCommandColumn>
                    <dx:GridViewDataTextColumn FieldName="ID"
                        ReadOnly="True" VisibleIndex="1"
                        Visible="False">
                        <EditFormSettings Visible="True" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="examRef"
                        VisibleIndex="2" Visible="False" ReadOnly="true"
                        Caption="examID">
                        <EditFormSettings Visible="True" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataComboBoxColumn Caption="بنك الاسئلة"
                        FieldName="bankRef" VisibleIndex="3" 
                        ReadOnly="true" >
                        <PropertiesComboBox DataSourceID="sdsBankData2"
                            TextField="bankName" ValueField="bankID">                           
                        </PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataTextColumn FieldName="questionCount"
                        VisibleIndex="4" Caption="عدد الاسئلة">
                    </dx:GridViewDataTextColumn>

                    <dx:GridViewDataTextColumn Caption="عدد الاسئلة المتوفرة"
                        FieldName="activeQuestionCount" VisibleIndex="5" ReadOnly="True">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataCheckColumn FieldName="active"
                        VisibleIndex="6" Caption="فعال">
                    </dx:GridViewDataCheckColumn>
                </Columns>

            </dx:ASPxGridView>
        </div>
        <%--/GView--%>
        <%--Footer--%>
        <div>
            <dx:ASPxButton ID="btnReturn" runat="server" 
                Text="رجوع" OnClick="btnReturn_Click"></dx:ASPxButton>
        </div>
        <%--<asp:HiddenField ID="hidExamID" runat="server" />--%>
        <%--/Footer--%>
    </div>
    <%--SQL--%>
    <asp:SqlDataSource ID="sdsData" runat="server"
        ConnectionString="<%$ ConnectionStrings:bankQuestionsConnectionString %>"
        DeleteCommand="exam_bankDelete" DeleteCommandType="StoredProcedure"
        InsertCommand="exam_bankInsert" InsertCommandType="StoredProcedure"
        SelectCommand="exam_bankSelect" SelectCommandType="StoredProcedure"
        UpdateCommand="exam_bankUpdate" UpdateCommandType="StoredProcedure" OnInserting="sdsData_Inserting">
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:SessionParameter SessionField="pageParameter"
                DefaultValue="-1" Name="examID" Type="Int32" />
            <asp:Parameter Name="bankRef" Type="Int32" />
            <asp:Parameter Name="questionCount" Type="Int32" />
            <asp:Parameter Name="active" Type="Boolean" DefaultValue="true" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter SessionField="pageParameter"
                DefaultValue="-2" Name="examID" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="ID" Type="Int32" />
            <asp:Parameter Name="examRef" Type="Int32" />
            <asp:Parameter Name="bankRef" Type="Int32" />
            <asp:Parameter Name="questionCount" Type="Int32" />
            <asp:Parameter Name="active" Type="Boolean" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sdsBankData2" runat="server"
        ConnectionString="<%$ ConnectionStrings:bankQuestionsConnectionString %>"
        SelectCommand="bank_data4examIDddList" SelectCommandType="StoredProcedure" OnSelecting="sdsBankData2_Selecting">
        <SelectParameters>
            <asp:SessionParameter Name="examID"
                SessionField="pageParameter"
                Type="Int32" DefaultValue="-1" />
        </SelectParameters>
    </asp:SqlDataSource>
    <%--/SQL--%>
</asp:Content>
