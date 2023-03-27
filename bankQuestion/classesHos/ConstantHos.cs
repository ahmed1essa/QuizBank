using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace bankQuestion.classesHos
{
    public static class ConstantHos
    {
        public static string XLSDir= "attachment/xls/";
        public static string connectionString = ConfigurationManager.ConnectionStrings["bankQuestionsConnectionString"].ConnectionString.ToString();
    }
}