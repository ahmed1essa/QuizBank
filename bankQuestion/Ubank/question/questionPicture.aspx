<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="questionPicture.aspx.cs" Inherits="bankQuestion.Ubank.question.questionPicture" %>

<%@ Register Assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <%--Header--%>
        <div>
            <h1 style="text-align: center;">رفع صور الاسئلة على الموقع</h1>
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
                RightToLeft="True" AutoPostBack="true" OnSelectedIndexChanged="cmbEmployData_SelectedIndexChanged" Style="height: 26px">
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
                <EditFormLayoutProperties>
                    <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" />
                </EditFormLayoutProperties>

                <Columns>
                    <%--<dx:GridViewCommandColumn ShowDeleteButton="True"
                        ShowEditButton="True" ShowNewButtonInHeader="True"
                        VisibleIndex="0">
                    </dx:GridViewCommandColumn>--%>
                    <dx:GridViewDataTextColumn FieldName="questionID"
                        ReadOnly="True" VisibleIndex="0"
                        Caption="questionID">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="pictureName"
                        VisibleIndex="1"
                        Caption="ملف الصورة">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="pictureNameServer"
                        VisibleIndex="2"
                        Caption="الصورة">
                    </dx:GridViewDataTextColumn>
                    
                </Columns>
            </dx:ASPxGridView>
        </div>
        <%--/GView--%>
        <%--Footer--%>
        <div>
            <asp:Button ID="btCopyPicture" runat="server"
                Text="نسخ ملفات الصور" OnClick="btCopyPicture_Click" />
        </div>
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
    <asp:SqlDataSource ID="sdsData" runat="server"
        ConnectionString="<%$ ConnectionStrings:bankQuestionsConnectionString %>"
        SelectCommand="question_PictureSelect" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter Name="bankID" DefaultValue="-1"
                ControlID="cmbBankData"
                PropertyName="Value" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <%--/SQL--%>
</asp:Content>
