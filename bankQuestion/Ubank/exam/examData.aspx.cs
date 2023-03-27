using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace bankQuestion.Ubank.exam
{
    public partial class examData : System.Web.UI.Page
    {
        #region "Start"
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        #endregion
        #region "GView"
        protected void gView_DataBinding(object sender, EventArgs e)
        {
            GridViewCommandColumn col = (GridViewCommandColumn)gView.Columns[0];
            if (cmbEmployData.SelectedIndex == -1)
            {
                col.ShowNewButtonInHeader = false;
            }
            else
            {
                col.ShowNewButtonInHeader = true;
            }
        }
        protected void gView_CustomButtonCallback(object sender, ASPxGridViewCustomButtonCallbackEventArgs e)
        {
            ASPxGridView grid = (ASPxGridView)sender;
            string keyValue = grid.GetRowValues(e.VisibleIndex, "examID").ToString();
            if (e.ButtonID == "btn1")
            {
                string pName = "~/Ubank/exam/examBank.aspx";

                Session["pageParameter"] = keyValue;
                Response.RedirectLocation = Page.ResolveUrl(pName);
            }
        }
        #endregion
    }
}