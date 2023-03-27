<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="userData.aspx.cs" Inherits="bankQuestion.admin.userData" %>

<%@ Register Assembly="DevExpress.Web.v16.2, Version=16.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <%--Header--%>
        <div>
            <h1 style="text-align: center;">مستخدمين الموقع</h1>
        </div>
        <%--/Headert--%>
         <%--Filter--%>
        <div>
            <dx:ASPxComboBox ID="cmbEmployMain" runat="server"
                NullText="حدد الوظيفة الاساسية" DataSourceID="sdsEmployMain"
                TextField="mainEmployName" ValueField="mainEmployID"
                AutoPostBack="true" ClearButton-DisplayMode="Auto"
                RightToLeft="True" OnSelectedIndexChanged="cmbEmployMain_SelectedIndexChanged">
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
        <%--SQL--%>
        <%--GView--%>
        <div>
            <dx:ASPxGridView ID="gView" runat="server"
                AutoGenerateColumns="False" DataSourceID="sdsData"
                KeyFieldName="userOKID"
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
                <EditFormLayoutProperties ColCount="3">
                    <Items>
                        <dx:GridViewColumnLayoutItem ColumnName="userOKID">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColSpan="2" ColumnName="userName">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColSpan="3" ColumnName="fullName">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="CID">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColSpan="2" ColumnName="employRef">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="active">
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="isSubscriber">
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
                    <dx:GridViewDataTextColumn FieldName="userOKID"
                        ReadOnly="True" VisibleIndex="1"
                        Caption="userID" Visible="False">
                        <EditFormSettings Visible="True" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="fullName"
                        VisibleIndex="3"
                        Caption="الاسم">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="CID"
                        VisibleIndex="4"
                        Caption="الرقم المدني" Visible="False">
                        <EditFormSettings Visible="True" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataCheckColumn FieldName="active"
                        VisibleIndex="6"
                        Caption="فعال">
                    </dx:GridViewDataCheckColumn>
                    <dx:GridViewDataCheckColumn FieldName="isSubscriber"
                        VisibleIndex="7"
                        Caption="مشترك">
                    </dx:GridViewDataCheckColumn>
                    <dx:GridViewDataComboBoxColumn Caption="الوظيفة" 
                        FieldName="employRef" VisibleIndex="5">
                        <PropertiesComboBox DataSourceID="sdsEmployData2" 
                            TextField="employName" ValueField="employID">
                        </PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataTextColumn FieldName="userName"
                        VisibleIndex="2"
                        Caption="رقم الهاتف">
                    </dx:GridViewDataTextColumn>
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
            <asp:ControlParameter ControlID="cmbEmployMain" Name="mainEmployID" PropertyName="Value" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sdsData" runat="server"
        ConnectionString="<%$ ConnectionStrings:bankQuestionsConnectionString %>"
        DeleteCommand="user_dataDelete" DeleteCommandType="StoredProcedure"
        InsertCommand="user_dataInsert" InsertCommandType="StoredProcedure"
        SelectCommand="user_dataSelect" SelectCommandType="StoredProcedure"
        UpdateCommand="user_dataUpdate" UpdateCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="userOKID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="fullName" Type="String" />
            <asp:Parameter Name="CID" Type="Int64" />
            <asp:Parameter Name="userName" Type="String" />
            <asp:Parameter Name="active" Type="Boolean" DefaultValue="true" />
            <asp:Parameter Name="employID" Type="Int32" />
            <asp:Parameter Name="isSubscriber" Type="Boolean" />
        </InsertParameters>
        <SelectParameters>
            <asp:Parameter DefaultValue="2" Name="userTypeID" Type="Int32" />
            <asp:ControlParameter ControlID="cmbEmployData" Name="employID" PropertyName="Value" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="userOKID" Type="Int32" />
            <asp:Parameter Name="fullName" Type="String" />
            <asp:Parameter Name="CID" Type="Int64" />
            <asp:Parameter Name="active" Type="Boolean" />
            <asp:Parameter Name="employRef" Type="Int32" />
            <asp:Parameter Name="isSubscriber" Type="Boolean" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sdsEmployData2" runat="server"
        ConnectionString="<%$ ConnectionStrings:bankQuestionsConnectionString %>"
        SelectCommand="employ_dataddList" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="cmbEmployMain" Name="mainEmployID" PropertyName="Value" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <%--/SQL--%>
</asp:Content>
