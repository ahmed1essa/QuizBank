using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
//using bankQuestion.AAA;
namespace bankQuestion.page
{
    public partial class createUser : System.Web.UI.Page
    {

        //MessageBox gf = new MessageBox();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnRecord_Click(object sender, EventArgs e)
        {
            bool Res = saveUserToMemberShip2();
            if (Res)
            {
                Res = saveUser();
                if (Res)
                {
                    Response.Redirect("~/login.aspx");
                }
            }
        }
        private bool saveUserToMemberShip2()
        {
            bool Res = true;
            //****************************************
            //try
            //{
                int employID = Convert.ToInt32(cmbEmployData.Items[cmbEmployData.SelectedIndex].Value);

                string userName = txtPhone.Text;
                string password = txtPassword.Text;
                string email = txtEmail.Text;
                int MobilePIN = Convert.ToInt32(txtPhone.Text);
                string fullName = txtFullName.Text;
                Int64 CID = Convert.ToInt64(txtCID.Text);
                //****************************************
                MembershipCreateStatus status;// As MembershipCreateStatus
                MembershipUser newUser = Membership.CreateUser(userName,
                    password,
                    email,
                    "What is your favorite color?",
                    "green",
                    true,
                    out status);
                if (newUser == null)
                {
                    lblMessage.Text = GetErrorMessage(status);
                    Res = false;
                }
                else
                {
                    viewMessage("تم الحفظ");
                    Response.Redirect("~/login.aspx");
                }
            //}
            //catch (Exception e)
            //{
            //    Res = false;
            //    viewMessage(e.Message);
            //}
            //finally
            //{
            //}
            return Res;
        }
        public string GetErrorMessage(MembershipCreateStatus status)
        {
            switch (status)
            {
                case MembershipCreateStatus.DuplicateUserName:
                    return "Username already exists. Please enter a different user name.";

                case MembershipCreateStatus.DuplicateEmail:
                    return "A username for that email address already exists. Please enter a different email address.";

                case MembershipCreateStatus.InvalidPassword:
                    return "The password provided is invalid. Please enter a valid password value.";

                case MembershipCreateStatus.InvalidEmail:
                    return "The email address provided is invalid. Please check the value and try again.";

                case MembershipCreateStatus.InvalidAnswer:
                    return "The password retrieval answer provided is invalid. Please check the value and try again.";

                case MembershipCreateStatus.InvalidQuestion:
                    return "The password retrieval question provided is invalid. Please check the value and try again.";

                case MembershipCreateStatus.InvalidUserName:
                    return "The user name provided is invalid. Please check the value and try again.";

                case MembershipCreateStatus.ProviderError:
                    return "The authentication provider returned an error. Please verify your entry and try again. If the problem persists, please contact your system administrator.";

                case MembershipCreateStatus.UserRejected:
                    return "The user creation request has been canceled. Please verify your entry and try again. If the problem persists, please contact your system administrator.";

                default:
                    return "An unknown error occurred. Please verify your entry and try again. If the problem persists, please contact your system administrator.";
            }
        }

        private bool saveUser()
        {
            bool Res = true;
            int employID = Convert.ToInt32(cmbEmployData.Items[cmbEmployData.SelectedIndex].Value);
            string userName = txtPhone.Text;
            string fullName = txtFullName.Text;
            Int64 CID = Convert.ToInt64(txtCID.Text);
            //****************************************
            SqlConnection myConnection = new SqlConnection();
            SqlCommand myCommand = new SqlCommand();
            //try
            //{
                String connectionString = ConfigurationManager.ConnectionStrings["bankQuestionsConnectionString"].ConnectionString.ToString();

                myConnection.ConnectionString = connectionString;
                myConnection.Open();

                myCommand.Connection = myConnection;
                myCommand.CommandType = CommandType.StoredProcedure;

                myCommand.CommandText = "user_creatUser";
                myCommand.Parameters.Clear();

                myCommand.Parameters.Add(new SqlParameter("@UserName", userName));

                myCommand.Parameters.Add(new SqlParameter("@fullName", fullName));
                myCommand.Parameters.Add(new SqlParameter("@CID", CID));
                myCommand.Parameters.Add(new SqlParameter("@employID", employID));

                //OutputCacheLocation SQL
                IDbDataParameter myOutParameter = myCommand.CreateParameter();
                myOutParameter.Direction = ParameterDirection.ReturnValue;
                myCommand.Parameters.Add(myOutParameter);

                int Res1 = myCommand.ExecuteNonQuery();
                int Res2 = Convert.ToInt16(myOutParameter.Value);
                if (Res2 != 0)
                {
                    viewMessage("هناك مشكلة في الحفظ");
                    Res = false;
                }
                else
                {
                    viewMessage("تم الحفظ");
                    Response.Redirect("~/login.aspx");
                }
            //}
            //catch (Exception e)
            //{
            //    viewMessage(e.Message);
            //    Res = false;
            //}
            //finally
            //{
                myCommand.Dispose();
                if (myConnection.State == ConnectionState.Open)
                {
                    myConnection.Close();
                }
            //}
            return Res;
        }
        #region "viewError"
        private void viewMessage(string msg)
        {
            //MessageBox.Show(this,"هناك مشكلة في الحفظ");  
            lblMessage.Text = msg;
        }
        #endregion
    }
}