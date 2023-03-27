using DevExpress.Utils.Serializing;
using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace bankQuestion.Ubank.exam
{
    public partial class examBank : System.Web.UI.Page
    {
        #region "Start"
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //hidExamID.Value = Session["pageParameter"].ToString();
                //Session.Remove("pageParameter");
                string strExamID = Session["pageParameter"].ToString();
                int examID = Convert.ToInt32(strExamID);
                lblExamName.Text = viewExamName(examID);
            }
        }
        private string viewExamName(int examID)
        {
            string Res = "";
            //****************************************
            SqlConnection myConnection = new SqlConnection();
            SqlCommand myCommand = new SqlCommand();
            try
            {
                String connectionString = ConfigurationManager.ConnectionStrings["bankQuestionsConnectionString"].ConnectionString.ToString();

                myConnection.ConnectionString = connectionString;
                myConnection.Open();

                myCommand.Connection = myConnection;
                myCommand.CommandType = CommandType.StoredProcedure;

                myCommand.CommandText = "exam_dataGetExamName";
                myCommand.Parameters.Clear();

                myCommand.Parameters.Add(new SqlParameter("@examID", examID));

                ////OutputCacheLocation SQL
                //IDbDataParameter myOutParameter = myCommand.CreateParameter();
                //myOutParameter.Direction = ParameterDirection.ReturnValue;
                //myCommand.Parameters.Add(myOutParameter);

                SqlDataReader myData = myCommand.ExecuteReader();
                if (myData.HasRows)
                {
                    if (myData.Read())
                    {
                        Res = myData["examName"].ToString();
                    }
                }
            }
            catch (Exception e)
            {

            }
            finally
            {
                myCommand.Dispose();
                if (myConnection.State == ConnectionState.Open)
                {
                    myConnection.Close();
                }
            }
            return Res;
        }
    #endregion
    #region "sdsData"
    protected void sdsData_Inserting(object sender, SqlDataSourceCommandEventArgs e)
    {
        //for (int i = 0; i < e.Command.Parameters.Count; i++)
        //{
        //    var x1 = e.Command.Parameters[i].ParameterName;
        //    var x2 = e.Command.Parameters[i].Value;
        //    var x3 = Session["pageParameter"].ToString();
        //}
        //e.Command.Parameters[0].Value = Session["pageParameter"].ToString();
    }
    protected void sdsBankData2_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
        // for (int i = 0; i < e.Command.Parameters.Count; i++)
        //{
        //    var x1 = e.Command.Parameters[i].ParameterName;
        //    var x2 = e.Command.Parameters[i].Value;
        //}
    }
    #endregion
    #region "GView"
    protected void gView_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
    {
        if (e.Column.FieldName == "bankRef")
        {
            e.Editor.ReadOnly = !gView.IsNewRowEditing;
        }
        if (e.Column.FieldName == "activeQuestionCount")
        {
            e.Editor.Visible = !gView.IsNewRowEditing;
        }
    }
    #endregion
    #region "btnReturn"
    protected void btnReturn_Click(object sender, EventArgs e)
    {
        string pName = "~/Ubank/exam/examData.aspx";
        Response.Redirect(pName);
    }
    #endregion
}
}