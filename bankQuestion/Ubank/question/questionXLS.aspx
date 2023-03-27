<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="questionXLS.aspx.cs" Inherits="bankQuestion.bank.questionXLS" %>

<%@ Register Assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <%--Header--%>
        <div>
            <h1 style="text-align: center;">رفع الاسئلة من ملف أكسل</h1>
        </div>
        <%--/Header--%>
        <%--Filter--%>
        <div>
            <dx:ASPxComboBox ID="cmbEmployMain" runat="server"
                DataSourceID="sdsDdListEmployMain"
                AutoPostBack="true"
                TextField="mainEmployName" ValueField="mainEmployID"
                NullText="اختر الوظيفة الرئيسية"
                RightToLeft="True" OnSelectedIndexChanged="cmbEmployMain_SelectedIndexChanged" Style="height: 26px"
                OnDataBinding="cmb_DataBinding">
                <ItemStyle HorizontalAlign="Right" />
                <ClearButton DisplayMode="Always" />
            </dx:ASPxComboBox>
            <dx:ASPxComboBox ID="cmbEmployData" runat="server"
                DataSourceID="sdsDdListEmployData"
                TextField="employName" ValueField="employID"
                NullText="اختر الوظيفة" EnableSynchronization="True"
                RightToLeft="True" AutoPostBack="true"
                OnSelectedIndexChanged="cmbEmployData_SelectedIndexChanged"
                OnDataBinding="cmb_DataBinding">
                <ItemStyle HorizontalAlign="Right" />
                <ClearButton DisplayMode="Always" />
            </dx:ASPxComboBox>
            <dx:ASPxComboBox ID="cmbBankData" runat="server"
                DataSourceID="sdsDdListBankData"
                TextField="bankName" ValueField="bankID"
                NullText="اختر البنك" EnableSynchronization="True"
                RightToLeft="True" AutoPostBack="true"
                OnDataBinding="cmb_DataBinding">
                <ItemStyle HorizontalAlign="Right" />
                <ClearButton DisplayMode="Always" />
            </dx:ASPxComboBox>
        </div>
         <%--/Filter--%>
        <%--Tools--%>
        <div>
            <asp:FileUpload ID="FileUploadXLS" runat="server" Visible="false" />
            <dx:ASPxButton ID="btnReadXLS" runat="server"
                Text="عرض ملف الأكسل" Visible="false"
                OnClick="btnReadXLS_Click">
            </dx:ASPxButton>
            <dx:ASPxButton ID="btnUploadXLS" runat="server"
                Text="اضافة الاسئلة لقاعدة البيانات" Visible="false"
                OnClick="btnUploadXLS_Click">
            </dx:ASPxButton>
        </div>
        <%--/Tools--%>
        <%--GView--%>
        <div>
            <dx:ASPxGridView ID="gView" runat="server"
                AutoGenerateColumns="False" KeyFieldName="id"
                Width="100%" RightToLeft="True"
                OnDataBinding="gView_DataBinding">
                <SettingsText CommandCancel="اغلاق"
                    CommandDelete="حذف "
                    CommandEdit="عرض"
                    CommandNew="جديد "
                    CommandUpdate=" "
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
                        <dx:GridViewColumnLayoutItem ColumnName="qNo">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColSpan="4" ColumnName="question" RowSpan="3">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColSpan="2" ColumnName="choose1">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColSpan="2" ColumnName="choose2">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColSpan="2" ColumnName="choose3">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColSpan="2" ColumnName="choose4">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="subjectName">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="pictureName">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="pictureNameServer">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColSpan="4" ColumnName="help" RowSpan="3">
                        </dx:GridViewColumnLayoutItem>
                        <dx:EditModeCommandLayoutItem ColSpan="2" HorizontalAlign="Left">
                        </dx:EditModeCommandLayoutItem>
                    </Items>
                </EditFormLayoutProperties>
                <Columns>
                    <dx:GridViewCommandColumn ShowDeleteButton="false"
                        ShowEditButton="True" ShowNewButtonInHeader="false"
                        VisibleIndex="0">
                    </dx:GridViewCommandColumn>
                    <dx:GridViewDataTextColumn FieldName="id"
                        VisibleIndex="0"
                        Caption="id" Visible="false">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="qNo"
                        VisibleIndex="1"
                        Caption="qNo" Visible="false" ReadOnly="true">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataMemoColumn FieldName="question"
                        VisibleIndex="2"
                        Caption="السؤال" ReadOnly="true">
                    </dx:GridViewDataMemoColumn>
                    <dx:GridViewDataTextColumn FieldName="choose1"
                        VisibleIndex="3" ReadOnly="true"
                        Caption="الاختيار1" Visible="false">
                        <PropertiesTextEdit EncodeHtml="false" />
                        <EditFormSettings Visible="True" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="choose2"
                        VisibleIndex="4" ReadOnly="true"
                        Caption="الاختيار2" Visible="False">
                        <PropertiesTextEdit EncodeHtml="False">
                        </PropertiesTextEdit>
                        <EditFormSettings Visible="True" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="choose3"
                        VisibleIndex="5" ReadOnly="true"
                        Caption="الاختيار3" Visible="false">
                        <PropertiesTextEdit EncodeHtml="false" />
                        <EditFormSettings Visible="True" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="choose4"
                        VisibleIndex="6" ReadOnly="true"
                        Caption="الاختيار4" Visible="false">
                        <PropertiesTextEdit EncodeHtml="false" />
                        <EditFormSettings Visible="True" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataMemoColumn Caption="الموضوع" FieldName="subjectName"
                        Visible="False" VisibleIndex="7" ReadOnly="true">
                        <EditFormSettings Visible="True" />
                    </dx:GridViewDataMemoColumn>
                    <dx:GridViewDataTextColumn FieldName="pictureName"
                        VisibleIndex="8" ReadOnly="true"
                        Caption="الصورة" Visible="false">
                        <EditFormSettings Visible="True" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="pictureNameServer"
                        VisibleIndex="9" ReadOnly="true"
                        Caption="الصورة2" Visible="false">
                        <EditFormSettings Visible="True" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataMemoColumn Caption="مساعدة" FieldName="help"
                        Visible="False" VisibleIndex="10" ReadOnly="true">
                        <EditFormSettings Visible="True" />
                    </dx:GridViewDataMemoColumn>
                </Columns>
            </dx:ASPxGridView>
        </div>
        <%--/GView--%>
        <%--Footer--%>
    <asp:HiddenField ID="hidGViewHaveData000" runat="server" />
        <%--/Footer--%>
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
    <%--/SQL--%>
</asp:Content>
