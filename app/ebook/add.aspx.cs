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
        private static readonly string[] AllowedPdfExtensions = { ".pdf" };
        private static readonly string[] AllowedImageExtensions = { ".jpg", ".jpeg", ".png" };
        private const int MaxPdfBytes = 20 * 1024 * 1024;
        private const int MaxCoverBytes = 5 * 1024 * 1024;
        private const string EbookUploadPath = "C:\\inetpub\\wwwroot\\ebook_assets\\";

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
            string savedPdfFileName = string.Empty;
            string savedCoverFileName = string.Empty;

            if (PdfUploadControl.HasFile)
            {
                try
                {
                    string extension = Path.GetExtension(PdfUploadControl.FileName);
                    if (!AllowedPdfExtensions.Contains((extension ?? string.Empty).ToLowerInvariant()))
                    {
                        StatusLabel.Text = "Upload status: Only PDF files are accepted!";
                        return;
                    }

                    if (PdfUploadControl.PostedFile.ContentLength <= 0 || PdfUploadControl.PostedFile.ContentLength > MaxPdfBytes)
                    {
                        StatusLabel.Text = "Upload status: Invalid PDF file size.";
                        return;
                    }

                    savedPdfFileName = Guid.NewGuid().ToString("N") + extension.ToLowerInvariant();
                    PdfUploadControl.SaveAs(Path.Combine(EbookUploadPath, savedPdfFileName));
                    StatusLabel.Text = "Upload status: File uploaded!";
                }
                catch (Exception ex)
                {
                    StatusLabel.Text = "Upload status: The file could not be uploaded. The following error occurred: " + ex.Message;
                    return;
                }
            }

            if (CoverUploadControl.HasFile)
            {
                try
                {
                    string extension = Path.GetExtension(CoverUploadControl.FileName);
                    if (!AllowedImageExtensions.Contains((extension ?? string.Empty).ToLowerInvariant()))
                    {
                        StatusLabel.Text = "Upload status: Cover must be a JPG or PNG file.";
                        return;
                    }

                    if (CoverUploadControl.PostedFile.ContentLength <= 0 || CoverUploadControl.PostedFile.ContentLength > MaxCoverBytes)
                    {
                        StatusLabel.Text = "Upload status: Invalid cover file size.";
                        return;
                    }

                    savedCoverFileName = Guid.NewGuid().ToString("N") + extension.ToLowerInvariant();
                    CoverUploadControl.SaveAs(Path.Combine(EbookUploadPath, savedCoverFileName));
                }
                catch (Exception ex)
                {
                    StatusLabel.Text = "Upload status: Cover upload failed. " + ex.Message;
                    return;
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
            sqlCommand.Parameters.AddWithValue("@thumbnail", (object)savedCoverFileName);
            sqlCommand.Parameters.AddWithValue("@filename", (object)savedPdfFileName);
            sqlCommand.Parameters.AddWithValue("@published_date", (object)DateTime.Now);
            sqlCommand.ExecuteNonQuery();
            sqlCommand.Dispose();
            connection.Close();
            Response.Redirect("~/ebook/");
            //end rapid insert

        }


    }
}
