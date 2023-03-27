using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using bankQuestion;
using bankQuestion.classesHos;

namespace bankQuestion.bank
{
    public partial class questionXLS : System.Web.UI.Page
    {
        #region "start"       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //hidGViewHaveData.Value = "false";
                try
                {
                    gView.DataBind();
                }
                catch
                {
                }
            }
            var ff = gView.GetRow(0);
            if (ff == null)
            {
                btnUploadXLS.Visible = false;
            }
            else
            {
                btnUploadXLS.Visible = true;
            }
            //cmbEmployMain.SelectedIndex != -1 &
            // cmbEmployData.SelectedIndex != -1 &
            if (cmbBankData.SelectedIndex != -1)
            {
                FileUploadXLS.Visible = true;
                btnReadXLS.Visible = true;
                //if (FileUploadXLS.FileName != "")
                //    btnReadXLS.Visible = true;
                //else
                //    btnReadXLS.Visible = false;
                //btnUploadXLS.Visible = true;
            }
            else
            {
                //FileUploadXLS.Visible = false;
                btnReadXLS.Visible = false;
                btnUploadXLS.Visible = false;
                Session["data"] = new DataTable();

                gView.DataBind();

            }

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
        protected void cmb_DataBinding(object sender, EventArgs e)
        {
        }
        #endregion
        //***********************************************
        #region "readXLS"
        protected void btnReadXLS_Click(object sender, EventArgs e)
        {
            //hidGViewHaveData.Value = "false";
            if (cmbBankData.SelectedIndex == -1)
            {
                MessageBox.Show(this, "حدد بنك الاسئلة");
                return;
            }
            string saveFilename = null;
            if (FileUploadXLS.FileName.Trim() == "")
            {
                MessageBox.Show(this, "لم يتم تحديد ملف الأكسل");
                return;
            }
            bool Res = saveFile(ref saveFilename);
            if (!Res)
            {
                MessageBox.Show(this, "لايمكن حفظ الملف على السيرفر");
                return;
            }
            string XLSconnectionString = getXLSConnectionString(saveFilename);
            if (!Res)
            {
                MessageBox.Show(this, "هناك مشكلة غي الاتصال بملف الأكسل");
                return;
            }
            Res = readQuestion(XLSconnectionString);
            if (!Res)
            {
                MessageBox.Show(this, "لايمكن قراءة الاسئلة");
                return;
            }
            btnUploadXLS.Visible = true;
            //hidGViewHaveData.Value = "true";
        }
        private bool saveFile(ref string saveFilename)
        {
            bool Res = true;
            string OpenfileName = FileUploadXLS.FileName.Trim();
            if (OpenfileName == "")
            {
                //MessageBox.Show(this, "هناك مشكلة غي الاتصال بملف الأكسل");
                return false;
            }

            saveFilename = "~/" + ConstantHos.XLSDir + DateTime.Now.Ticks + OpenfileName;
            try
            {
                saveFilename = Server.MapPath(saveFilename);
                FileUploadXLS.SaveAs(saveFilename);
            }
            catch (Exception e)
            {
                MessageBox.Show(this, e.Message);
                Res = false;
            }
            return Res;
        }
        private string getXLSConnectionString(string saveFilename)
        {
            string sConnectionString = "Provider=Microsoft.ACE.OLEDB.12.0;"
                           + "Data Source=" + saveFilename
                           + ";" + "Extended Properties=Excel 12.0;";
            return sConnectionString;
        }
        #endregion
        //***********************************************
        #region "viewXLS"
        private bool readQuestion(string sConnectionString)
        {
            bool Res = true;
            OleDbConnection objConn = new OleDbConnection(sConnectionString);
            try
            {

                objConn.Open();
                string slct;
                slct = "SELECT * FROM [" + "question" + "$]";
                OleDbCommand objCmdSelect = new OleDbCommand(slct, objConn);
                OleDbDataReader objdatareader = null;

                objdatareader = objCmdSelect.ExecuteReader();
                int No = -1;
                //Create Data Table
                DataTable dataTable1 = new DataTable("DataTable1");
                dataTable1.Columns.Add("id", typeof(Int32));
                dataTable1.Columns.Add("qNo", typeof(Int32));

                dataTable1.Columns.Add("question", typeof(string));
                dataTable1.Columns.Add("bankRef", typeof(Int32));
                dataTable1.Columns.Add("subjectRef", typeof(Int32));
                dataTable1.Columns.Add("subjectName", typeof(string));
                dataTable1.Columns.Add("choose1", typeof(string));
                dataTable1.Columns.Add("choose2", typeof(string));
                dataTable1.Columns.Add("choose3", typeof(string));
                dataTable1.Columns.Add("choose4", typeof(string));
                dataTable1.Columns.Add("pictureName", typeof(string));
                dataTable1.Columns.Add("pictureNameServer", typeof(string));
                dataTable1.Columns.Add("help", typeof(string));
                dataTable1.PrimaryKey = new DataColumn[] { dataTable1.Columns[0] };

                bool flag = false;
                string id, qNo;//***//
                int bankRef;
                string question, subjectName;
                string choose1, choose2, choose3, choose4;
                string pictureName = null, pictureNameServer = null, help = null;
                while (objdatareader.Read())
                {
                    //read Data
                    id = objdatareader["id"].ToString().Trim();
                    qNo = objdatareader["qNo"].ToString().Trim();
                    question = objdatareader["Question"].ToString().Trim();
                    subjectName = objdatareader["subject"].ToString().Trim();
                    choose1 = objdatareader["choose1"].ToString().Trim();
                    choose2 = objdatareader["choose2"].ToString().Trim();
                    choose3 = objdatareader["choose3"].ToString().Trim();
                    choose4 = objdatareader["choose4"].ToString().Trim();
                    pictureName = objdatareader["pictureName"].ToString().Trim();
                    pictureNameServer = null;
                    help = objdatareader["help"].ToString().Trim();
                    bankRef = Convert.ToInt32(cmbBankData.Value);
                    if (pictureName == "")
                    {
                        pictureName = null;
                    }
                    else
                    {
                        string[] pn = pictureName.Split('.');
                        if (pn.Count() > 1)
                            pictureNameServer = pn[0] + "-" + DateTime.Now.Ticks + '.' + pn[1];
                    }

                    //Adjust Row in Data Table
                    if (id == "") { if (flag) break; flag = true; }

                    //Adjust Ebd Read
                    if (qNo != "")
                    {
                        //new
                        No++;
                        //adjust subject
                        if (subjectName == "")
                        {
                            subjectName = "موضوع غير محدد";
                        }
                        //add data To Data Table
                        dataTable1.Rows.Add(id, qNo,
                        question,
                        bankRef, null, subjectName,
                        choose1, choose2,
                        choose3, choose4,
                        pictureName, pictureNameServer, help);
                    }
                    else
                    {
                        //old
                        //update data Table                    
                        if (question != "")
                            dataTable1.Rows[No]["question"] += System.Environment.NewLine + question;
                        if (choose1 != "")
                            dataTable1.Rows[No]["choose1"] += System.Environment.NewLine + choose1;
                        if (choose2 != "")
                            dataTable1.Rows[No]["choose2"] += System.Environment.NewLine + choose2;
                        if (choose3 != "")
                            dataTable1.Rows[No]["choose3"] += System.Environment.NewLine + choose3;
                        if (choose4 != "")
                            dataTable1.Rows[No]["choose4"] += System.Environment.NewLine + choose4;
                    }
                }
                Session["data"] = dataTable1;
            }
            catch (Exception ex)
            {
                MessageBox.Show(this, ex.Message);
                Res = false;
            }
            finally
            {
                objConn.Close();
                //********
                //DataTable dt = new DataTable();
                //dt.Load(objdatareader);
                //Session["data"] = dt;
                //********
            }
            gView.DataBind();
            return Res;
        }
        protected void gView_DataBinding(object sender, EventArgs e)
        {
            // (sender as ASPxGridView).DataSource 
            //btnUploadXLS.Visible = false;
            //if (Session["data"].ToString() != "")
            //{
            //    btnUploadXLS.Visible = true;
            //}
            gView.DataSource = (DataTable)Session["data"]; //CustomDataSource;

        }
        #endregion
        //***********************************************
        #region "saveXLS"
        protected void btnUploadXLS_Click(object sender, EventArgs e)
        {
            var ff=gView.GetRow(0);

            if (ff==null)
            {
                MessageBox.Show(this, "لايوجد اسئلة تم  عرضها"); //لن تحدث
            }
            else
            {
                bool Res = saveXLSToDatabase();
                if (Res)
                {
                    MessageBox.Show(this, "تم اضافة الاسئلة لقاعدة البيانات");
                    //hidGViewHaveData.Value = "false";
                    Session["data"] = null;
                    gView.DataBind();
                    btnUploadXLS.Visible = false;
                }
            }
        }
        private bool saveXLSToDatabase()
        {
            bool Res = true;
            //****************************************
            SqlConnection myConnection = new SqlConnection();
            SqlCommand myCommand = new SqlCommand();
            try
            {
                String connectionString = ConstantHos.connectionString;

                myConnection.ConnectionString = connectionString;
                myConnection.Open();

                myCommand.Connection = myConnection;
                myCommand.CommandType = CommandType.StoredProcedure;

                myCommand.CommandText = "sp_question_dataType";
                myCommand.Parameters.Clear();

                //myCommand.Parameters.Add(new SqlParameter("@userIDOK", objdatareader.));

                //Return parameter SQL
                IDbDataParameter myReturnParameter = myCommand.CreateParameter();
                myReturnParameter.Direction = ParameterDirection.ReturnValue;
                myCommand.Parameters.Add(myReturnParameter);

                DataTable myDataTable = new DataTable();
                myDataTable = (DataTable)Session["data"];
                //Structured parameter SQL
                SqlParameter tvpParam = myCommand.Parameters.AddWithValue("@TVP", myDataTable);
                tvpParam.SqlDbType = SqlDbType.Structured;
                tvpParam.TypeName = "dbo.question_dataType"; //اسم الجدول

                int Res1 = myCommand.ExecuteNonQuery();
                int Res2 = Convert.ToInt16(myReturnParameter.Value);
                if (Res2 != 0)
                {
                    MessageBox.Show(this, "هناك مشكلة في الحفظ");
                }
                else
                {
                    MessageBox.Show(this, "تم الحفظ");
                }
            }
            catch (Exception e)
            {
                MessageBox.Show(this, e.Message);
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