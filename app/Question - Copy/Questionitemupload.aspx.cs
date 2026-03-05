// Decompiled with JetBrains decompiler
// Type: newweb.Question.Questionitemupload
// Assembly: newweb, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: A2E847A6-10D0-4271-9D59-55F01CDCC8B0
// Assembly location: C:\data\source-20190227T061536Z-001\source\lms\lms\bin\newweb.dll

using System;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace newweb.Question
{
  public class Questionitemupload : Page
  {
    protected Label Questioncourse;
    protected Label Questionname;
    protected Label Questiongroup;
    protected Label Questionchoice;
    protected FileUpload FileUpload1;
    protected Label Label1;
    protected Button Button1;

    protected void ShowMessage(string Message, Questionitemupload.MessageType type)
    {
      ScriptManager.RegisterStartupScript((Page) this, this.GetType(), Guid.NewGuid().ToString(), "ShowMessage('" + Message + "','" + (object) type + "');", true);
    }

    protected void Page_Load(object sender, EventArgs e)
    {
      if (this.IsPostBack)
        return;
      try
      {
        this.coursename(this.Request["ID"].ToString());
      }
      catch
      {
      }
    }

    public void coursename(string classid)
    {
      SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
      connection.Open();
      string cmdText = "select q.Question_name,qd.Question_detail,qg.QuestiongroupName,qdata.Question_data from Question_detail qd inner join Questiongroup qg on qg.id=qd.Question_group inner join Question q on q.id=qd.Question_id inner join Question_data qdata on qdata.Question_detail_id=qd.id and qdata.id=@id";
      SqlCommand sqlCommand = new SqlCommand(cmdText, connection);
      sqlCommand.CommandText = cmdText;
      sqlCommand.Parameters.AddWithValue("@id", (object) classid);
      SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
      if (sqlDataReader.HasRows)
      {
        sqlDataReader.Read();
        this.Questioncourse.Text = sqlDataReader.GetValue(0).ToString();
        this.Questionname.Text = sqlDataReader.GetValue(1).ToString();
        this.Questiongroup.Text = sqlDataReader.GetValue(2).ToString();
        this.Questionchoice.Text = sqlDataReader.GetValue(3).ToString();
      }
      sqlDataReader.Close();
      sqlCommand.Dispose();
      connection.Close();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
      string str1 = "";
      try
      {
        str1 = this.Request["ID"].ToString();
      }
      catch
      {
      }
      string str2 = HttpContext.Current.Server.MapPath("~/Questionpic/");
      if (str1 != "")
      {
        string path = str2 + str1;
        if (!Directory.Exists(path))
          Directory.CreateDirectory(path);
      }
      if (this.FileUpload1.HasFile)
      {
        try
        {
          this.FileUpload1.SaveAs(str2 + str1 + "\\" + this.FileUpload1.FileName);
          this.Label1.Text = "File name: " + this.FileUpload1.PostedFile.FileName + "<br>" + (object) this.FileUpload1.PostedFile.ContentLength + " kb<br>Content type: " + this.FileUpload1.PostedFile.ContentType;
          this.addUser(this.FileUpload1.FileName, str2 + str1 + "\\" + this.FileUpload1.FileName);
        }
        catch (Exception ex)
        {
          this.Label1.Text = "ERROR: " + ex.Message.ToString();
        }
      }
      else
        this.Label1.Text = "You have not specified a file.";
    }

    private void addUser(string filename, string filepath)
    {
      CConnect cconnect = new CConnect();
      string str = "";
      try
      {
        str = this.Request["ID"].ToString();
      }
      catch
      {
      }
      string sql = "update Question_data set ispic='1',piclocation='" + filepath + "',filename='" + filename + "' where id='" + str + "'";
      cconnect.sqlCmd(sql);
    }

    public enum MessageType
    {
      Success,
      Error,
      Info,
      Warning,
    }
  }
}
