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

namespace bankQuestion.home
{
    public partial class home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bool Res = getUserData();

                //temp <start>
                //Session["userOKID"] = "9";
                //Session["fullName"] = "admin";
                //Session["isSubscriber"] = "";
                //Session["employID"] = "";
                //temp <end>

                if (!Res)
                    Response.Redirect("~/login.aspx");
            }

        }
        private bool getUserData()
        {
            bool Res = true;
            MembershipUser currentuser = Membership.GetUser();
            Guid userID = (Guid)currentuser.ProviderUserKey;
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

            myCommand.CommandText = "user_getSession";
            myCommand.Parameters.Clear();

            myCommand.Parameters.Add(new SqlParameter("@userID", userID));

            //OutputCacheLocation SQL
            IDbDataParameter myOutParameter = myCommand.CreateParameter();
            myOutParameter.Direction = ParameterDirection.ReturnValue;
            myCommand.Parameters.Add(myOutParameter);

            SqlDataReader myData = myCommand.ExecuteReader();
            int Res2 = Convert.ToInt16(myOutParameter.Value);
            if (Res2 == 0)
            {
                if (myData.HasRows)
                {
                    if (myData.Read())
                    {
                        Session["userOKID"] = myData["userOKID"].ToString();
                        Session["fullName"] = myData["fullName"].ToString();
                        Session["isSubscriber"] = myData["isSubscriber"].ToString();
                        Session["employID"] = myData["employRef"].ToString();
                        txtFullName.Text = Session["fullName"].ToString();
                    }
                }
                else
                {
                    Res = false;
                    viewMessage("");
                }

            }
            else
            {
                Res = false;
                viewMessage("");
            }
            //}
            //catch (Exception e)
            //{
            //    Res = false;
            //    viewMessage(e.Message);
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

        }
        #endregion
    }
}