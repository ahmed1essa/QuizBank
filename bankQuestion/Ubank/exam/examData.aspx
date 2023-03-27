<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="examData.aspx.cs" Inherits="bankQuestion.Ubank.exam.examData" %>

<%@ Register Assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <%--Header--%>
        <div>
            <h1 style="text-align: center;">الامتحانات</h1>
        </div>
        <%--/Header--%>
        <%--Filter--%>
        <div>
            <dx:ASPxComboBox ID="cmbEmployMain" runat="server"
                NullText="حدد الوظيفة الاساسية" DataSourceID="sdsEmployMain"
                TextField="mainEmployName" ValueField="mainEmployID"
                AutoPostBack="true"
                RightToLeft="True">
                <ClearButton DisplayMode="Always" />
            </dx:ASPxComboBox>
            <dx:ASPxComboBox ID="cmbEmployData" runat="server"
                NullText="حدد الوظيفة" DataSourceID="sdsEmployData" AutoPostBack="true"
                TextField="employName" ValueField="employID"
                RightToLeft="True">
                <ClearButton DisplayMode="Always" />

            </dx:ASPxComboBox>
        </div>
        <%--/Filter--%>
        <%--GView--%>
        <div>
            <dx:ASPxGridView ID="gView" runat="server"
                AutoGenerateColumns="False" DataSourceID="sdsData"
                KeyFieldName="examID"
                Width="100%" RightToLeft="True" OnDataBinding="gView_DataBinding" OnCustomButtonCallback="gView_CustomButtonCallback">
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
                        <dx:GridViewColumnLayoutItem ColumnName="examID"
                            ColSpan="1">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="employRef"
                            ColSpan="2">
                        </dx:GridViewColumnLayoutItem>
                        <%-- <dx:EmptyLayoutItem>
                        </dx:EmptyLayoutItem>--%>
                        <dx:GridViewColumnLayoutItem ColumnName="examName"
                            ColSpan="3">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="questionCount">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="time">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="degree">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="description"
                            ColSpan="3" RowSpan="3">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="active">
                        </dx:GridViewColumnLayoutItem>
                        <dx:EditModeCommandLayoutItem ColSpan="3"
                            HorizontalAlign="Left">
                        </dx:EditModeCommandLayoutItem>
                    </Items>
                </EditFormLayoutProperties>

                <Columns>
                    <dx:GridViewCommandColumn ShowDeleteButton="True"
                        ShowEditButton="True" ShowInCustomizationForm="True"
                        ShowNewButtonInHeader="True"
                        VisibleIndex="0">
                    </dx:GridViewCommandColumn>

                    <dx:GridViewDataTextColumn FieldName="examID"
                        ReadOnly="True" VisibleIndex="1" Visible="false">
                        <EditFormSettings Visible="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="examName"
                        VisibleIndex="2" Caption="الامتحان">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataComboBoxColumn FieldName="employRef"
                        VisibleIndex="3" Caption="الوظيفة" ReadOnly="true">
                        <PropertiesComboBox DataSourceID="sdsEmployData2"
                            TextField="employName" ValueField="employID">
                        </PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataTextColumn FieldName="questionCount"
                        VisibleIndex="4" Caption="عدد الاسئلة" ReadOnly="true">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="time"
                        VisibleIndex="5" Caption="الوقت">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="degree"
                        VisibleIndex="6" Caption="الدرجة">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataCheckColumn FieldName="active"
                        VisibleIndex="8" Caption="فعال">
                    </dx:GridViewDataCheckColumn>

                    <dx:GridViewDataMemoColumn Caption="الوصف" FieldName="description" Visible="False" VisibleIndex="7">
                        <EditFormSettings Visible="True" />
                    </dx:GridViewDataMemoColumn>

                    <dx:GridViewCommandColumn VisibleIndex="9"
                        Name="btn1">
                        <CustomButtons>
                            <dx:GridViewCommandColumnCustomButton Text="الميزان النسبي"
                                ID="btn1">
                            </dx:GridViewCommandColumnCustomButton>
                        </CustomButtons>
                    </dx:GridViewCommandColumn>

                </Columns>

            </dx:ASPxGridView>
        </div>
        <%--/GView--%>
    </div>
    <%--SQL--%>
    <asp:SqlDataSource ID="sdsEmployMain" runat="server"
        ConnectionString="<%$ ConnectionStrings:bankQuestionsConnectionString %>"
        SelectCommand="employ_mainddList" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    <asp:SqlDataSource ID="sdsEmployData" runat="server"
        ConnectionString="<%$ ConnectionStrings:bankQuestionsConnectionString %>"
        SelectCommand="employ_dataddList" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="cmbEmployMain"
                Name="mainEmployID"
                PropertyName="Value" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sdsData" runat="server"
        ConnectionString="<%$ ConnectionStrings:bankQuestionsConnectionString %>"
        DeleteCommand="exam_dataDelete" DeleteCommandType="StoredProcedure"
        InsertCommand="exam_dataInsert" InsertCommandType="StoredProcedure"
        SelectCommand="exam_dataSelect" SelectCommandType="StoredProcedure"
        UpdateCommand="exam_dataUpdate" UpdateCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="examID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="examName" Type="String" />
            <asp:ControlParameter Name="employRef"
                ControlID="cmbEmployMain"
                PropertyName="Value"
                Type="Int32" />
            <asp:Parameter Name="questionCount" Type="Int32" DefaultValue="0" />
            <asp:Parameter Name="time" Type="Int32" DefaultValue="120" />
            <asp:Parameter Name="degree" Type="Int32" DefaultValue="100" />
            <asp:Parameter Name="description" Type="String" />
            <asp:Parameter Name="active" Type="Boolean"
                DefaultValue="true" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="cmbEmployData"
                DefaultValue="-1"
                Name="employID"
                PropertyName="Value" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="examID" Type="Int32" />
            <asp:Parameter Name="examName" Type="String" />
            <asp:Parameter Name="employRef" Type="Int32" />
            <asp:Parameter Name="questionCount" Type="Int32" />
            <asp:Parameter Name="time" Type="Int32" />
            <asp:Parameter Name="degree" Type="Int32" />
            <asp:Parameter Name="description" Type="String" />
            <asp:Parameter Name="active" Type="Boolean" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sdsEmployData2" runat="server"
        ConnectionString="<%$ ConnectionStrings:bankQuestionsConnectionString %>"
        SelectCommand="employ_dataddList" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:Parameter Name="mainEmployID" Type="Int32" DefaultValue="-1" />
        </SelectParameters>
    </asp:SqlDataSource>
    <%--/SQL--%>
</asp:Content>
