using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace bankQuestion.guest
{
    public partial class activeUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                txtActiveCode.Text = "1234";
        }

        protected void btnActiveUser_Click(object sender, EventArgs e)
        {
            bool Res=activeThisUser();
            if(Res)
                Response.Redirect("~/login.aspx");
        }
        private bool activeThisUser()
        {
            bool Res = true;
            int userOKID = Convert.ToInt32(Session["userOKID"].ToString());
            int activeCode = Convert.ToInt32(txtActiveCode.Text);
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

                myCommand.CommandText = "user_activeUser";
                myCommand.Parameters.Clear();

                myCommand.Parameters.Add(new SqlParameter("@userOKID", userOKID));

                myCommand.Parameters.Add(new SqlParameter("@activCode", activeCode));

                //OutputCacheLocation SQL
                IDbDataParameter myOutParameter = myCommand.CreateParameter();
                myOutParameter.Direction = ParameterDirection.ReturnValue;
                myCommand.Parameters.Add(myOutParameter);

                int Res1 = myCommand.ExecuteNonQuery();
                int Res2 = Convert.ToInt16(myOutParameter.Value);
                if (Res2 != 0)
                {
                    viewMessage("هناك مشكلة في الحفظ");
                }
                else
                {
                    viewMessage("تم الحفظ");
                }
            //}
            //catch (Exception e)
            //{
            //    Res = false;
            //    viewMessage(e.Message);
            //    Response.Redirect("~/login.aspx");/**/
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