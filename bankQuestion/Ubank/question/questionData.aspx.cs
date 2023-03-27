using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace bankQuestion.Ubank.question
{
    public partial class questionData : System.Web.UI.Page
    {
        #region "Start"
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        #endregion
        #region "Filter"
        protected void cmbEmployMain_SelectedIndexChanged(object sender, EventArgs e)
        {
            cmbEmployData.SelectedIndex = -1;
            cmbBankData.SelectedIndex = -1;
            cmbEmployData.DataBind();
            cmbBankData.DataBind();
        }
        protected void cmbEmployData_SelectedIndexChanged(object sender, EventArgs e)
        {
            cmbBankData.SelectedIndex = -1;
            cmbEmployData.DataBind();
            cmbBankData.DataBind();
        }
        protected void cmbBankData_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }
        #endregion
        #region "GView"
        protected void gView_DataBinding(object sender, EventArgs e)
        {
            GridViewCommandColumn col = (GridViewCommandColumn)gView.Columns[0];
            if (cmbBankData.SelectedIndex == -1)
            {
                 col.ShowNewButtonInHeader = false;
            }
            else
            {
                col.ShowNewButtonInHeader = true;
            }
        }
        #endregion
    }
    }