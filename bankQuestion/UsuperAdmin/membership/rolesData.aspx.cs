using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace bankQuestion.membership
{
    public partial class rolesData : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getUsers();
            }
        }
        private void getUsers()
        {
            string[] roles = Roles.GetAllRoles();
            lstRoles.DataSource = roles;
            lstRoles.DataBind();
            lblRoleName.Text = null;
            //for(int i=0;i< roles.Length; i++)
            //lstRoles.Items.Add(roles[i].ToString());

        }
        protected void btnRoleAdd_Click(object sender, EventArgs e)
        {
            string roleName = txtRoleName.Text;
            Roles.CreateRole(roleName);
            getUsers();
        }
        protected void lstRoles_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblRoleName.Text = lstRoles.SelectedItem.ToString();//.Items[lstRoles.SelectedIndex].ToString(); //.SelectedItem.Text;
        }
        protected void btnRoleDelete_Click(object sender, EventArgs e)
        {
            string roleName = lblRoleName.Text;
            Roles.DeleteRole(roleName);
            getUsers();
        }
       protected void btnViewUsers_Click(object sender, EventArgs e)
        {
            viewUsers();
        }
        private  void viewUsers()
        {
            string[] users = Roles.GetUsersInRole(lblRoleName.Text);
            lstUsers.DataSource = users;
            lstUsers.DataBind();
        }
        protected void btnAddUser_Click(object sender, EventArgs e)
        {
            string roleName = lblRoleName.Text;
            string userName = txtUserName.Text;
            Roles.AddUserToRole(userName, roleName);
            viewUsers();
        }

        protected void btnDeleteUser_Click(object sender, EventArgs e)
        {
            string roleName = lblRoleName.Text;
            string userName = lstUsers.SelectedValue;
            Roles.RemoveUserFromRole(userName, roleName);
            viewUsers();
        }
    }
}