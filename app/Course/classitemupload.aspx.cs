// Decompiled with JetBrains decompiler
// Type: newweb.Course.classitemupload
// Assembly: newweb, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: A2E847A6-10D0-4271-9D59-55F01CDCC8B0
// Assembly location: C:\data\source-20190227T061536Z-001\source\lms\lms\bin\newweb.dll

using System;
using System.Collections.Specialized;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace newweb.Course
{
  public class classitemupload : Page
  {
    protected HyperLink hyperlink1;
    protected HyperLink hyperlink2;
    protected HyperLink hyperlink3;

    protected void Page_Load(object sender, EventArgs e)
    {
      string classid = "";
      try
      {
        classid = this.Request["ID"].ToString();
        this.coursename(classid);
      }
      catch
      {
        this.Response.Redirect("default.aspx");
      }
      if (!(HttpContext.Current.Request.HttpMethod == "POST"))
        return;
      foreach (string file1 in (NameObjectCollectionBase) this.Request.Files)
      {
        HttpPostedFile file2 = this.Request.Files[file1];
        int contentLength = file2.ContentLength;
        string fileName = file2.FileName;
        string str1 = "";
        if (!string.IsNullOrEmpty(fileName))
          str1 = Path.GetExtension(fileName);
        string str2 = HttpContext.Current.Server.MapPath("~/Upload/");
        string str3;
        if (classid != "")
        {
          str3 = str2 + classid;
          if (!Directory.Exists(str3))
            Directory.CreateDirectory(str3);
        }
        else
          str3 = str2;
        string filename = fileName;
        string str4 = str3 + "\\" + filename;
        if (File.Exists(str4))
        {
          this.addUser(filename, str3);
        }
        else
        {
          file2.SaveAs(str4);
          this.addUser(filename, str3);
        }
      }
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
      string sql = "INSERT INTO ClassitemFile ([ClassItemID],[FileName],[FilePath],[userid],[CreatedDate],[Updatedate],[Updateby],Active) VALUES('" + str + "','" + filename + "','" + filepath + "','1','" + (object) DateTime.Now + "','" + (object) DateTime.Now + "','1','1')";
      cconnect.sqlCmd(sql);
    }

    public string renderdata()
    {
      string classid = "";
      try
      {
        classid = this.Request["ID"].ToString();
        this.coursename(classid);
      }
      catch
      {
      }
      string str = "";
      try
      {
        string empty = string.Empty;
        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
        connection.Open();
        string cmdText = "Select [id],[FileName],[FilePath] from ClassitemFile where ClassItemID=@ClassItemID and active='1'";
        SqlCommand sqlCommand = new SqlCommand(cmdText, connection);
        sqlCommand.CommandText = cmdText;
        sqlCommand.Parameters.AddWithValue("@ClassItemID", (object) classid);
        SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
        if (sqlDataReader.HasRows)
        {
          while (sqlDataReader.Read())
          {
            str += "<div class='col-md-8'> ";
            str = str + "<div class='col-sm-2'><a href='/Upload/" + classid + "/" + sqlDataReader.GetValue(1).ToString() + "' download><span class='pull-right'>" + sqlDataReader.GetValue(1).ToString() + "</span></a></div>";
            str += "<div class='col-sm-6'>";
            str = str + "<span class='pull-left'><a class='btn btn-circle btn-danger' onclick='ReGen(" + sqlDataReader.GetValue(0).ToString() + ")' )><i class='fa fa-trash'></i></a></span>";
            str += "</div>  <div class='col-sm-4'></div>";
            str += "</div> <div class='col-md-4'></div>";
          }
        }
      }
      catch
      {
      }
      return str;
    }

    public void coursename(string classid)
    {
      SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
      connection.Open();
      string cmdText = "select pr.PeriodName,pr.PeriodDesp,c.CourseName,cl.ClassName,cl.id,c.id from [Period] pr inner join Class cl on cl.id=pr.ClassID inner join Course C on c.id=cl.CourseID where pr.id=@id";
      SqlCommand sqlCommand = new SqlCommand(cmdText, connection);
      sqlCommand.CommandText = cmdText;
      sqlCommand.Parameters.AddWithValue("@id", (object) classid);
      SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
      if (sqlDataReader.HasRows)
      {
        sqlDataReader.Read();
        this.hyperlink1.NavigateUrl = "Coursedetail.aspx?id=" + sqlDataReader.GetValue(5).ToString();
        this.hyperlink2.NavigateUrl = "class.aspx?id=" + sqlDataReader.GetValue(4).ToString();
      }
      sqlDataReader.Close();
      sqlCommand.Dispose();
      connection.Close();
    }

    [WebMethod(EnableSession = true)]
    public static void ReGenToken(string id)
    {
      try
      {
        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
        connection.Open();
        string cmdText = "update [ClassitemFile] set active='0' where id=@id";
        SqlCommand sqlCommand = new SqlCommand(cmdText, connection);
        sqlCommand.CommandText = cmdText;
        sqlCommand.Parameters.AddWithValue("@id", (object) int.Parse(id));
        sqlCommand.ExecuteNonQuery();
        sqlCommand.Dispose();
        connection.Close();
      }
      catch
      {
      }
    }
  }
}
