// Decompiled with JetBrains decompiler
// Type: newweb.USER_QA.Uploadfile
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
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace newweb.USER_QA
{
  public class Uploadfile : Page
  {
    protected Label Label1;
    protected HtmlForm test;
    protected Button Button77;
    protected HtmlGenericControl group10;

    [WebMethod(EnableSession = true)]
    protected void Page_Load(object sender, EventArgs e)
    {
      string str1 = "0";
      try
      {
        str1 = this.Request["ID"].ToString();
        this.coursename1(str1);
      }
      catch (Exception ex)
      {
        this.Response.Redirect("default.aspx");
      }
      int num = this.IsPostBack ? 1 : 0;
      if (!(HttpContext.Current.Request.HttpMethod == "POST"))
        return;
      foreach (string file1 in (NameObjectCollectionBase) this.Request.Files)
      {
        HttpPostedFile file2 = this.Request.Files[file1];
        int contentLength = file2.ContentLength;
        string fileName = file2.FileName;
        string str2 = "";
        if (!string.IsNullOrEmpty(fileName))
          str2 = Path.GetExtension(fileName);
        string str3 = HttpContext.Current.Server.MapPath("~/QAFILE/") + str1;
        if (!Directory.Exists(str3))
          Directory.CreateDirectory(str3);
        string filename = this.coursename(str1) + "_" + fileName;
        string str4 = str3 + "\\" + filename;
        if (File.Exists(str4))
        {
          this.addUser(filename, str3, str1, "0");
        }
        else
        {
          file2.SaveAs(str4);
          this.addUser(filename, str3, str1, "0");
        }
      }
    }

    private string coursename1(string classid)
    {
      string str = "";
      SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
      connection.Open();
      string cmdText = "select qde.Standard_detail,qi.projectid,qx.Standard_detail as detail from [QA_standard_detail] qde   inner join QA_standard qsd on qsd.id=qde.Standardid inner join QA_Indicator qi on qsd.qaindicator=qi.id inner join QA_standard_detail_add qx on qx.Standardid=qde.id where qx.id=@id";
      SqlCommand sqlCommand = new SqlCommand(cmdText, connection);
      sqlCommand.CommandText = cmdText;
      sqlCommand.Parameters.AddWithValue("@id", (object) classid);
      SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
      if (sqlDataReader.HasRows)
      {
        sqlDataReader.Read();
        this.Label1.Text = "ตัวบ่งชี้ที่ " + sqlDataReader.GetValue(0).ToString() + " ประเด็นการพิจราณา " + sqlDataReader.GetValue(0).ToString();
      }
      sqlDataReader.Close();
      sqlCommand.Dispose();
      connection.Close();
      return str;
    }

    private void addUser(string filename, string filepath, string stdid, string dt1_1)
    {
      new CConnect().sqlCmd("INSERT INTO QA_main_result_file ([Standardid],[file1],[FilePath],[Createdate],[Createby],Active,fileno) VALUES('" + stdid + "','" + filename + "','" + filepath + "','" + (object) DateTime.Now + "','1','1','" + dt1_1 + "')");
    }

    public string coursename(string classid)
    {
      string str = "1";
      SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
      connection.Open();
      string cmdText = "select count(id) from [QA_main_result_file] where Standardid=@id";
      SqlCommand sqlCommand = new SqlCommand(cmdText, connection);
      sqlCommand.CommandText = cmdText;
      sqlCommand.Parameters.AddWithValue("@id", (object) classid);
      SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
      if (sqlDataReader.HasRows)
      {
        sqlDataReader.Read();
        str = (int.Parse(sqlDataReader.GetValue(0).ToString()) + 1).ToString();
      }
      sqlDataReader.Close();
      sqlCommand.Dispose();
      connection.Close();
      return str;
    }
  }
}
