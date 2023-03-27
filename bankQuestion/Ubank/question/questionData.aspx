<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="questionData.aspx.cs" Inherits="bankQuestion.Ubank.question.questionData" %>

<%@ Register Assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <%--Header--%>
        <div>
            <h1 style="text-align: center;">الاسئلة</h1>
        </div>
        <%--/Header--%>
        <%--Filter--%>
        <div>
            <dx:ASPxComboBox ID="cmbEmployMain" runat="server"
                DataSourceID="sdsDdListEmployMain"
                AutoPostBack="true"
                TextField="mainEmployName" ValueField="mainEmployID"
                NullText="اختر الوظيفة الرئيسية"
                RightToLeft="True" OnSelectedIndexChanged="cmbEmployMain_SelectedIndexChanged" Style="height: 26px">
                <ItemStyle HorizontalAlign="Right" />
                <ClearButton DisplayMode="Always" />
            </dx:ASPxComboBox>
            <dx:ASPxComboBox ID="cmbEmployData" runat="server"
                DataSourceID="sdsDdListEmployData"
                TextField="employName" ValueField="employID"
                NullText="اختر الوظيفة" EnableSynchronization="True"
                RightToLeft="True" AutoPostBack="true" OnSelectedIndexChanged="cmbEmployData_SelectedIndexChanged">
                <ItemStyle HorizontalAlign="Right" />
                <ClearButton DisplayMode="Always" />
            </dx:ASPxComboBox>
            <dx:ASPxComboBox ID="cmbBankData" runat="server"
                DataSourceID="sdsDdListBankData"
                TextField="bankName" ValueField="bankID"
                NullText="اختر البنك" EnableSynchronization="True"
                RightToLeft="True" AutoPostBack="true" OnSelectedIndexChanged="cmbBankData_SelectedIndexChanged">
                <ItemStyle HorizontalAlign="Right" />
                <ClearButton DisplayMode="Always" />
            </dx:ASPxComboBox>
        </div>
        <%--/Filter--%>
        <%--GView--%>
        <div>
            <dx:ASPxGridView ID="gView" runat="server"
                AutoGenerateColumns="False" DataSourceID="sdsData"
                KeyFieldName="questionID"
                Width="100%" RightToLeft="True" OnDataBinding="gView_DataBinding">
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
                        Text="صفحة {0} من {1} ({2})" />
                </SettingsPager>
                <SettingsSearchPanel Visible="True" />

                <SettingsBehavior AllowFocusedRow="True"
                    EnableRowHotTrack="True"
                    ConfirmDelete="True" />

                <SettingsAdaptivity AdaptivityMode="HideDataCells" />

                <SettingsEditing Mode="PopupEditForm"
                    EditFormColumnCount="4"
                    PopupEditFormWidth="500px">
                </SettingsEditing>
                <SettingsPopup>
                    <EditForm Modal="True"
                        HorizontalAlign="WindowCenter"
                        VerticalAlign="WindowCenter" />
                </SettingsPopup>

                <EditFormLayoutProperties ColCount="4" SettingsItemCaptions-Location="Top">
                    <Items>
                        <dx:GridViewColumnLayoutItem ColumnName="questionID">
                        </dx:GridViewColumnLayoutItem>
                        <dx:EmptyLayoutItem ColSpan="3">
                        </dx:EmptyLayoutItem>
                        <dx:GridViewColumnLayoutItem ColSpan="4" ColumnName="question" RowSpan="3">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="choose1" ColSpan="2">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="choose2" ColSpan="2">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="choose3" ColSpan="2">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="choose4" ColSpan="2">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="subjectRef">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="difficultyLevelRef">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="pictureNameServer">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="الصورة">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColSpan="4" ColumnName="help" RowSpan="3">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="active">
                        </dx:GridViewColumnLayoutItem>
                        <dx:EditModeCommandLayoutItem ColSpan="4" HorizontalAlign="Left" Width="100%">
                        </dx:EditModeCommandLayoutItem>
                    </Items>

                    <SettingsItemCaptions Location="Top"></SettingsItemCaptions>
                </EditFormLayoutProperties>

                <Columns>
                    <dx:GridViewCommandColumn ShowDeleteButton="True"
                        ShowEditButton="True" ShowNewButtonInHeader="True"
                        VisibleIndex="0">
                    </dx:GridViewCommandColumn>
                    <dx:GridViewDataTextColumn FieldName="questionID"
                        ReadOnly="True" VisibleIndex="1"
                        Caption="questionID" Visible="False">
                        <EditFormSettings Visible="True" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataMemoColumn FieldName="question"
                        VisibleIndex="2"
                        Caption="السؤال">
                    </dx:GridViewDataMemoColumn>
                    <dx:GridViewDataMemoColumn Caption="الاختيار1" FieldName="choose1" Visible="False" VisibleIndex="3">
                        <EditFormSettings Visible="True" />
                    </dx:GridViewDataMemoColumn>
                    <dx:GridViewDataMemoColumn Caption="الاختيار2" FieldName="choose2" Visible="False" VisibleIndex="4">
                        <EditFormSettings Visible="True" />
                    </dx:GridViewDataMemoColumn>
                    <dx:GridViewDataMemoColumn Caption="الاختيار3" FieldName="choose3" Visible="False" VisibleIndex="5">
                        <EditFormSettings Visible="True" />
                    </dx:GridViewDataMemoColumn>
                    <dx:GridViewDataMemoColumn Caption="الاختيار4" FieldName="choose4" Visible="False" VisibleIndex="6">
                        <EditFormSettings Visible="True" />
                    </dx:GridViewDataMemoColumn>
                    <dx:GridViewDataComboBoxColumn Caption="الموضوع" FieldName="subjectRef" Visible="False" VisibleIndex="7">
                        <PropertiesComboBox DataSourceID="sdsDdListBankSubject" TextField="subjectName" ValueField="subjectID">
                        </PropertiesComboBox>
                        <EditFormSettings Visible="True" />
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataComboBoxColumn Caption="درجة الصعوبة"
                        FieldName="difficultyLevelRef" Visible="False" VisibleIndex="8">
                        <EditFormSettings Visible="True" />
                        <PropertiesComboBox DataSourceID="sdsDdListQuestionDifficultyLevel" TextField="difficultyLevel" ValueField="difficultyLevelID">
                        </PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataTextColumn FieldName="pictureNameServer"
                        VisibleIndex="9"
                        Caption="ملف الصورة" Visible="False">
                        <EditFormSettings Visible="True" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataMemoColumn Caption="مساعدة" FieldName="help" Visible="False" VisibleIndex="11">
                        <EditFormSettings Visible="True" />
                    </dx:GridViewDataMemoColumn>
                    <dx:GridViewDataCheckColumn FieldName="active"
                        VisibleIndex="12"
                        Caption="فعال" Visible="False">
                        <EditFormSettings Visible="True" />
                    </dx:GridViewDataCheckColumn>
                    <dx:GridViewDataImageColumn FieldName="pictureNameServer" VisibleIndex="10" Caption="الصورة" Visible="False">
                        <PropertiesImage ImageUrlFormatString="~/attachment/questions/{0}"
                             NullDisplayText="لايوجد صورة" ImageHeight="50px" ImageWidth="50px">
                        </PropertiesImage>
                        <EditFormSettings Visible="True" />
                    </dx:GridViewDataImageColumn>
                    <%--http://www.t4moe.com--%>
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
    <asp:SqlDataSource ID="sdsDdListBankData" runat="server"
        ConnectionString="<%$ ConnectionStrings:bankQuestionsConnectionString %>"
        SelectCommand="bank_dataddList" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter Name="employID"
                ControlID="cmbEmployData"
                PropertyName="Value" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sdsData" runat="server"
        ConnectionString="<%$ ConnectionStrings:bankQuestionsConnectionString %>"
        DeleteCommand="question_dataDelete" DeleteCommandType="StoredProcedure"
        InsertCommand="question_dataInsert" InsertCommandType="StoredProcedure"
        SelectCommand="question_dataSelect" SelectCommandType="StoredProcedure"
        UpdateCommand="question_dataUpdate" UpdateCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="questionID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="question" Type="String" />
            <asp:Parameter Name="subjectRef" Type="Int32" />
            <asp:Parameter Name="choose1" Type="String" />
            <asp:Parameter Name="choose2" Type="String" />
            <asp:Parameter Name="choose3" Type="String" />
            <asp:Parameter Name="choose4" Type="String" />
            <asp:Parameter Name="pictureNameServer" Type="String" />
            <asp:Parameter Name="difficultyLevelRef" Type="Int32" />
            <asp:Parameter Name="help" Type="String" />
            <asp:Parameter Name="active" Type="Boolean" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter Name="bankID"
                ControlID="cmbBankData"
                PropertyName="Value" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="questionID" Type="Int32" />
            <asp:Parameter Name="question" Type="String" />
            <asp:Parameter Name="subjectRef" Type="Int32" />
            <asp:Parameter Name="choose1" Type="String" />
            <asp:Parameter Name="choose2" Type="String" />
            <asp:Parameter Name="choose3" Type="String" />
            <asp:Parameter Name="choose4" Type="String" />
            <asp:Parameter Name="pictureNameServer" Type="String" />
            <asp:Parameter Name="difficultyLevelRef" Type="Int32" />
            <asp:Parameter Name="help" Type="String" />
            <asp:Parameter Name="active" Type="Boolean" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sdsDdListQuestionDifficultyLevel" runat="server"
        ConnectionString="<%$ ConnectionStrings:bankQuestionsConnectionString %>"
        SelectCommand="question_difficultyLevelddList" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    <asp:SqlDataSource ID="sdsDdListBankSubject" runat="server"
        ConnectionString="<%$ ConnectionStrings:bankQuestionsConnectionString %>"
        SelectCommand="bank_subjectddList" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter Name="bankID"
                ControlID="cmbBankData"
                PropertyName="Value" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <%--/SQL--%>
</asp:Content>
