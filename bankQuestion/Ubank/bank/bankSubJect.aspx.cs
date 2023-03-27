using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace bankQuestion.admin
{
    public partial class bankSubJect : System.Web.UI.Page
    {
        #region "Start"
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        #endregion
        #region "CmboBox"
        protected void cmbEmployMain_SelectedIndexChanged(object sender, EventArgs e)
        {
            cmbEmployData.SelectedIndex = -1;
            cmbBankData.SelectedIndex = -1;
        }
        protected void cmbEmployData_SelectedIndexChanged(object sender, EventArgs e)
        {
            cmbBankData.SelectedIndex = -1;
        }
        #endregion
        #region "GView"
        protected void gView_DataBinding(object sender, EventArgs e)
        {
            GridViewCommandColumn col = (GridViewCommandColumn)gView.Columns[0];
            if (cmbEmployMain.SelectedIndex!=-1 &
                cmbEmployData.SelectedIndex != -1 &
                cmbBankData.SelectedIndex != -1)
            {
                col.ShowNewButtonInHeader = true;
            }
            else
            {
                col.ShowNewButtonInHeader = false;
            }
        }
        #endregion
    }
}