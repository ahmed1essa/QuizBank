using bankQuestion.classesHos;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace bankQuestion.Ubank.question
{
    public partial class questionPicture : System.Web.UI.Page
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

        }
        #endregion
        #region "upload picture"
        protected void btCopyPicture_Click(object sender, EventArgs e)
        {
            bool res = readData();
            gView.DataBind();
        }
        private bool readData()
        {
            bool Res = true;
            //****************************************
            SqlConnection myConnection = new SqlConnection();
            SqlCommand myCommand = new SqlCommand();
            try
            {
                myConnection.ConnectionString = ConstantHos.connectionString;
                myConnection.Open();

                myCommand.Connection = myConnection;
                myCommand.CommandType = CommandType.StoredProcedure;

                myCommand.CommandText = "question_PictureSelect";
                myCommand.Parameters.Clear();

                int bankID = cmbBankData.SelectedIndex;
                myCommand.Parameters.Add(new SqlParameter("@bankID", bankID));

                //OutputCacheLocation SQL
                IDbDataParameter myOutParameter = myCommand.CreateParameter();
                myOutParameter.Direction = ParameterDirection.ReturnValue;
                myCommand.Parameters.Add(myOutParameter);

                SqlDataReader myData = myCommand.ExecuteReader();
                int Res2 = Convert.ToInt16(myOutParameter.Value);
                if (Res2 == 0)
                {
                    int N = 0;
                    int NSucc = 0;
                    if (myData.HasRows)
                    {
                        int questionID;
                        string pictureName;
                        string pictureNameServer;
                        bool res;
                        while (myData.Read())
                        {
                            questionID = Convert.ToInt32(myData["questionID"].ToString());
                            pictureName = myData["pictureName"].ToString();
                            pictureNameServer = myData["pictureNameServer"].ToString();
                            N++;
                            res = FtpHos.uploadFile(pictureName, pictureNameServer);
                            if (res)
                            {
                                NSucc++;
                                //تعديل ان الملف تم نسخه
                                bool res2 = updateData(questionID);
                            }
                            else
                            {

                            }
                        }
                    }
                    else
                    {
                        MessageBox.Show(this, "لاتوجد بيانات");
                    }
                }
                else
                {
                    MessageBox.Show(this, "لاتوجد بيانات");
                }
        }
            catch (Exception ex)
            {
                MessageBox.Show(this, ex.Message);
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
        private bool updateData(int questionID)
        {
            bool Res = true;
            //****************************************
            SqlConnection myConnection = new SqlConnection();
            SqlCommand myCommand = new SqlCommand();
            try
            {
                myConnection.ConnectionString = ConstantHos.connectionString;
                myConnection.Open();

                myCommand.Connection = myConnection;
                myCommand.CommandType = CommandType.StoredProcedure;

                myCommand.CommandText = "question_PictureUpdate";
                myCommand.Parameters.Clear();

                int bankID = cmbBankData.SelectedIndex;
                myCommand.Parameters.Add(new SqlParameter("@questionID", questionID));

                //OutputCacheLocation SQL
                IDbDataParameter myOutParameter = myCommand.CreateParameter();
                myOutParameter.Direction = ParameterDirection.ReturnValue;
                myCommand.Parameters.Add(myOutParameter);

                int Res1 = myCommand.ExecuteNonQuery();
                int Res2 = Convert.ToInt16(myOutParameter.Value);
                if (Res2 == 0)
                {

                }
                else
                {
                    
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(this, ex.Message);
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
    }
}