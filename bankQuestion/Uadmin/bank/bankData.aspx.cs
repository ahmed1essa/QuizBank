using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace bankQuestion.admin
{
    public partial class bankData : System.Web.UI.Page
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
        }
        #endregion
        #region "GView"
        protected void gView_CommandButtonInitialize(object sender, DevExpress.Web.ASPxGridViewCommandButtonEventArgs e)
        {
            if (e.ButtonType == ColumnCommandButtonType.New)
            {
                var cellData = cmbEmployData.SelectedItem;
                if (cmbEmployData.SelectedIndex == -1)
                {
                    e.Visible = false;
                }
                else
                {
                    e.Visible = true;
                }
            }

        }
        protected void gView_DataBinding(object sender, EventArgs e)
        {

        }
        #endregion


    }
}