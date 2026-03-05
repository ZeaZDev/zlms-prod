// Decompiled with JetBrains decompiler
// Type: newweb.USER_QA.resultupload
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

namespace newweb.USER_QA
{
  public class resultupload : Page
  {
    protected HyperLink hyperlink3;

    private string coursename1(string classid)
    {
      string str = "";
      SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
      connection.Open();
      string cmdText = "SELECT Standardid  FROM [QA_standard_detail_add] where id=@id";
      SqlCommand sqlCommand = new SqlCommand(cmdText, connection);
      sqlCommand.CommandText = cmdText;
      sqlCommand.Parameters.AddWithValue("@id", (object) classid);
      SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
      if (sqlDataReader.HasRows)
      {
        sqlDataReader.Read();
        this.hyperlink3.NavigateUrl = "asset_list.aspx?ID=" + sqlDataReader.GetValue(0).ToString();
      }
      sqlDataReader.Close();
      sqlCommand.Dispose();
      connection.Close();
      return str;
    }

    protected void Page_Load(object sender, EventArgs e)
    {
      string classid = "";
      try
      {
        classid = this.Request["ID"].ToString();
        try
        {
          this.coursename1(classid);
        }
        catch
        {
        }
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
        string str2 = HttpContext.Current.Server.MapPath("~/Results/");
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
      string sql = "INSERT INTO QA_result_file ([resultID],[FileName],[FilePath],[userid],[CreatedDate],[Updatedate],[Updateby],Active) VALUES('" + str + "','" + filename + "','" + filepath + "','1','" + (object) DateTime.Now + "','" + (object) DateTime.Now + "','1','1')";
      cconnect.sqlCmd(sql);
    }

    public string renderdata()
    {
      string str1 = "";
      try
      {
        str1 = this.Request["ID"].ToString();
      }
      catch
      {
      }
      string str2 = "";
      try
      {
        string empty = string.Empty;
        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
        connection.Open();
        string cmdText = "Select [id],[FileName],[FilePath] from QA_result_file where resultID=@ClassItemID and active='1'";
        SqlCommand sqlCommand = new SqlCommand(cmdText, connection);
        sqlCommand.CommandText = cmdText;
        sqlCommand.Parameters.AddWithValue("@ClassItemID", (object) str1);
        SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
        if (sqlDataReader.HasRows)
        {
          while (sqlDataReader.Read())
          {
            str2 += "<div class='col-md-8'> ";
            str2 = str2 + "<div class='col-sm-2'><a href='/Upload/" + str1 + "/" + sqlDataReader.GetValue(1).ToString() + "' download><span class='pull-right'>" + sqlDataReader.GetValue(1).ToString() + "</span></a></div>";
            str2 += "<div class='col-sm-6'>";
            str2 = str2 + "<span class='pull-left'><a class='btn btn-circle btn-danger' onclick='ReGen(" + sqlDataReader.GetValue(0).ToString() + ")' )><i class='fa fa-trash'></i></a></span>";
            str2 += "</div>  <div class='col-sm-4'></div>";
            str2 += "</div> <div class='col-md-4'></div>";
          }
        }
      }
      catch
      {
      }
      return str2;
    }

    [WebMethod(EnableSession = true)]
    public static void ReGenToken(string id)
    {
      try
      {
        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
        connection.Open();
        string cmdText = "update [QA_result_file] set active='0' where id=@id";
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
