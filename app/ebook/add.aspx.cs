using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace lms.ebook
{
    public partial class _add : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {

        }

        protected void UploadButton_Click(object sender, EventArgs e)
        {
            if (PdfUploadControl.HasFile)
            {
                try
                {
//                    if (PdfUploadControl.PostedFile.ContentType == "application/pdf")
//                    {
                        if (PdfUploadControl.PostedFile.ContentLength > 1024)
                        {
                            string filename = Path.GetFileName(PdfUploadControl.FileName);
                            //PdfUploadControl.SaveAs(Server.MapPath("~/") + filename);
                            PdfUploadControl.SaveAs("C:\\inetpub\\wwwroot\\ebook_assets\\" + filename);
                            StatusLabel.Text = "Upload status: File uploaded!";
                        }
                        else
                            StatusLabel.Text = "Upload status: The file small";
  //                  }
  //                  else
  //                      StatusLabel.Text = "Upload status: Only PDF files are accepted!";
                }
                catch (Exception ex)
                {
                    StatusLabel.Text = "Upload status: The file could not be uploaded. The following error occurred: " + ex.Message;
                }
            }

            if (CoverUploadControl.HasFile)
            {
                try
                {
//                    if (CoverUploadControl.PostedFile.ContentType == "image/jpeg")
//                    {
                        if (CoverUploadControl.PostedFile.ContentLength > 10)
                        {
                            string filename = Path.GetFileName(CoverUploadControl.FileName);
                            //PdfUploadControl.SaveAs(Server.MapPath("~/") + filename);
                            CoverUploadControl.SaveAs("C:\\inetpub\\wwwroot\\ebook_assets\\" + filename);
                            //StatusLabel.Text = "Upload status: File uploaded!";
                        }
                        //else
                            //StatusLabel.Text = "Upload status: The file small";
//                    }
                    //else
                        //StatusLabel.Text = "Upload status: Only PDF files are accepted!";
                }
                catch (Exception ex)
                {
                    //StatusLabel.Text = "Upload status: The file could not be uploaded. The following error occurred: " + ex.Message;
                }
            }

            //rapid insert
            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
            connection.Open();
            string cmdText = "INSERT INTO [dbo].[ebook] ([title],[author],[isbn],[thumbnail],[filename],[published_date])VALUES " + "(@title,@author,@isbn,@thumbnail,@filename,@published_date)";
            SqlCommand sqlCommand = new SqlCommand(cmdText, connection);
            sqlCommand.CommandText = cmdText;
            sqlCommand.Parameters.AddWithValue("@title", (object)txttitle.Value);
            sqlCommand.Parameters.AddWithValue("@author", (object)txtauthor.Value);
            sqlCommand.Parameters.AddWithValue("@isbn", (object)"");
            sqlCommand.Parameters.AddWithValue("@thumbnail", (object)CoverUploadControl.FileName);
            sqlCommand.Parameters.AddWithValue("@filename", (object)PdfUploadControl.FileName);
            sqlCommand.Parameters.AddWithValue("@published_date", (object)DateTime.Now);
            sqlCommand.ExecuteNonQuery();
            sqlCommand.Dispose();
            connection.Close();
            Response.Redirect("~/ebook/");
            //end rapid insert

        }


    }
}