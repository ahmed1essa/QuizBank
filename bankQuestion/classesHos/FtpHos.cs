using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;

namespace bankQuestion.classesHos
{
    public static class FtpHos
    {
        private static string host = "ftp://67.219.146.10";
        private static string userId = "t4moe.co_6353ylkgxur";
        private static string password = "fHM2uc^bQi4o!o5o";
        private static string rootDir = "/httpdocs/";

        //
        private static string sourceFolder = "C:/_root/bankQuestion/Image/";
        private static string ftpFolder = rootDir + "attachment/questions/";

        public static bool createFolder(string folder)
        {
            bool IsCreated = true;
            folder = host + rootDir + folder;
            try
            {

                WebRequest request = WebRequest.Create(folder);
                request.Method = WebRequestMethods.Ftp.MakeDirectory;
                request.Credentials = new NetworkCredential(userId, password);
                using (var resp = (FtpWebResponse)request.GetResponse())
                {
                    Console.WriteLine(resp.StatusCode);
                }
            }
            catch (Exception ex)
            {
                IsCreated = false;
            }
            return IsCreated;
        }
        public static bool deleteFTPFolder(string folder)
        {
            bool res = true;
            folder = host + rootDir + folder;
            try
            {
                FtpWebRequest request = (FtpWebRequest)WebRequest.Create(folder);
                request.Method = WebRequestMethods.Ftp.RemoveDirectory;
                request.Credentials = new System.Net.NetworkCredential(userId, password); ;
                request.GetResponse().Close();
            }
            catch
            {
                res = false;
            }
            return res;
        }
        public static bool doesFtpDirectoryExist(string folder)
        {
            bool isexist = false;
            folder = host + rootDir + folder;
            try
            {
                FtpWebRequest request = (FtpWebRequest)WebRequest.Create(folder);
                request.Credentials = new NetworkCredential(userId, password);
                request.Method = WebRequestMethods.Ftp.ListDirectory;
                using (FtpWebResponse response = (FtpWebResponse)request.GetResponse())
                {
                    isexist = true;
                }
            }
            catch (WebException ex)
            {
                if (ex.Response != null)
                {
                    FtpWebResponse response = (FtpWebResponse)ex.Response;
                    if (response.StatusCode == FtpStatusCode.ActionNotTakenFileUnavailable)
                    {
                        return false;
                    }
                }
            }
            return isexist;
        }
        public static bool uploadFile(string sourceFile, string ftpFile)
        {
            //string From = @"F:\Kaushik\Test.xlsx";
            //string To = "ftp: //192.168.1.103:24/directory/Test.xlsx";
            bool res = true;
            string From = sourceFolder + sourceFile;
            string To = host + ftpFolder + ftpFile;
            try
            {
                using (WebClient client = new WebClient())
                {
                    client.Credentials = new NetworkCredential(userId, password);
                    client.UploadFile(To, WebRequestMethods.Ftp.UploadFile, From);
                }
            }
            catch
            {
                res = false;
            }
            return res;
        }
        public static List<string> GetAllFtpFiles(string folder)
        {
            string ParentFolderpath = host + rootDir + folder;
            try
            {
                FtpWebRequest ftpRequest = (FtpWebRequest)WebRequest.Create(ParentFolderpath);
                ftpRequest.Credentials = new NetworkCredential(userId, password);
                ftpRequest.Method = WebRequestMethods.Ftp.ListDirectory;
                FtpWebResponse response = (FtpWebResponse)ftpRequest.GetResponse();
                StreamReader streamReader = new StreamReader(response.GetResponseStream());

                List<string> directories = new List<string>();

                string line = streamReader.ReadLine();
                while (!string.IsNullOrEmpty(line))
                {
                    var lineArr = line.Split('/');
                    line = lineArr[lineArr.Count() - 1];
                    directories.Add(line);
                    line = streamReader.ReadLine();
                }

                streamReader.Close();

                return directories;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

    }
}