using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace bankQuestion
{
    public partial class _default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/login.aspx");
        }

        protected void btnAddUser_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/page/createUser.aspx");
        }
    }
}