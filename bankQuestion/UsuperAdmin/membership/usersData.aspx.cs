using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace bankQuestion.membership
{
    public partial class usersView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                viewUsers();

        }

        private void viewUsers()
        {
            MembershipUserCollection users = Membership.GetAllUsers();
            gviewUsers.DataSource = users;
            gviewUsers.DataBind();
        }
        protected void btnUserAdd_Click(object sender, EventArgs e)
        {
            string userName = txtUserName.Text;
            string password = "1234";
            Membership.CreateUser(userName, password);
            viewUsers();

        }

        protected void btnUserRemove_Click(object sender, EventArgs e)
        {
            string userName = txtUserName.Text;
            Membership.DeleteUser(userName);
            viewUsers();
        }
        private void viewRoles()
        {
            string userName = txtUserName.Text;
            string[] roles = Roles.GetRolesForUser(userName);
            lstRoles.DataSource = roles;
            lstRoles.DataBind();
            btnAddRoleSuperAdmin.BackColor = Color.IndianRed;
            btnAddRoleAdmin.BackColor = Color.IndianRed;
            btnAddRoleBank.BackColor = Color.IndianRed;
            btnAddRoleUser.BackColor = Color.IndianRed;
            btnAddRoleGuest.BackColor = Color.IndianRed;
            for (int i = 0; i < roles.Length; i++)
            {
                string role = roles[i];

                switch (role)
                {
                    case "superAdmin":
                        btnAddRoleSuperAdmin.BackColor = Color.LightGreen;
                        break;
                    case "admin":
                        btnAddRoleAdmin.BackColor = Color.LightGreen;
                        break;
                    case "bank":
                        btnAddRoleBank.BackColor = Color.LightGreen;
                        break;
                    case "exam":
                        btnAddRoleUser.BackColor = Color.LightGreen;
                        break;
                    case "guest":
                        btnAddRoleGuest.BackColor = Color.LightGreen;
                        break;
                }
            }
        }
        protected void btnViewRoles_Click(object sender, EventArgs e)
        {
            viewRoles();
        }

        protected void btnAddRoleSuperAdmin_Click(object sender, EventArgs e)
        {
            string userName = txtUserName.Text;
            string roleName = "superAdmin";
            Roles.AddUserToRole(userName, roleName);
            viewRoles();
        }

        protected void btnAddRoleAdmin_Click(object sender, EventArgs e)
        {
            string userName = txtUserName.Text;
            string roleName = "admin";
            Roles.AddUserToRole(userName, roleName);
            viewRoles();
        }

        protected void btnAddRoleBank_Click(object sender, EventArgs e)
        {
            string userName = txtUserName.Text;
            string roleName = "bank";
            Roles.AddUserToRole(userName, roleName);
            viewRoles();
        }

        protected void btnAddRoleUser_Click(object sender, EventArgs e)
        {
            string userName = txtUserName.Text;
            string roleName = "exam";
            Roles.AddUserToRole(userName, roleName);
            viewRoles();
        }

        protected void btnAddRoleGuest_Click(object sender, EventArgs e)
        {
            string userName = txtUserName.Text;
            string roleName = "guest";
            Roles.AddUserToRole(userName, roleName);
            viewRoles();
        }
    }
}