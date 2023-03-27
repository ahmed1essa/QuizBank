using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;

namespace bankQuestion.classesHos
{
    public static class MessageBox
    {
        public static void Show(this Page Page, string Message)//this
        {
            try
            {
                Page.ClientScript.RegisterStartupScript(
                               Page.GetType(),
                               "MessageBox",
                               "<script language='javascript'>alert('" + Message + "');</script>"
                            );
            }
            catch
            {

            }
        }
    }
}