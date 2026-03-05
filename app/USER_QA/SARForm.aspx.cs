// Decompiled with JetBrains decompiler
// Type: newweb.USER_QA.SARForm
// Assembly: newweb, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: A2E847A6-10D0-4271-9D59-55F01CDCC8B0
// Assembly location: C:\data\source-20190227T061536Z-001\source\lms\lms\bin\newweb.dll

using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace newweb.USER_QA
{
  public class SARForm : Page
  {
    protected HtmlForm Form1;
    protected HyperLink hyperlink1;
    protected Label Label3;

    protected void Page_Load(object sender, EventArgs e)
    {
      string str = "";
      try
      {
        str = this.Request["ID"].ToString();
      }
      catch
      {
      }
      int num = this.IsPostBack ? 1 : 0;
    }

    private string coursename(string classid)
    {
      string str = "";
      SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
      connection.Open();
      string cmdText = "select [Score],[Score1] from [QA_result1] where standard_detail_id=@id";
      SqlCommand sqlCommand = new SqlCommand(cmdText, connection);
      sqlCommand.CommandText = cmdText;
      sqlCommand.Parameters.AddWithValue("@id", (object) classid);
      SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
      if (sqlDataReader.HasRows)
      {
        sqlDataReader.Read();
        str = sqlDataReader.GetValue(0).ToString();
      }
      sqlDataReader.Close();
      sqlCommand.Dispose();
      connection.Close();
      return str;
    }

    public string load_remark()
    {
      string str1 = "";
      try
      {
        string str2 = this.Request["ID"].ToString();
        try
        {
          string empty = string.Empty;
          SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
          connection.Open();
          string cmdText = "Select [Result] from QA_result_txt where Standardid=@Standardid ";
          SqlCommand sqlCommand = new SqlCommand(cmdText, connection);
          sqlCommand.CommandText = cmdText;
          sqlCommand.Parameters.AddWithValue("@Standardid", (object) str2);
          SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
          if (sqlDataReader.HasRows)
          {
            sqlDataReader.Read();
            str1 = sqlDataReader.GetValue(0).ToString();
          }
          sqlCommand.Dispose();
          connection.Close();
        }
        catch
        {
        }
      }
      catch
      {
      }
      return str1;
    }

    public string renderdata()
    {
      string str = "";
      try
      {
        string classid = this.Request["ID"].ToString();
        try
        {
          string empty = string.Empty;
          SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
          connection.Open();
          string cmdText = "Select [id],[Standard_detail],Weight,[QA_TYPE] from QA_standard_detail_add where Standardid=@Standardid and active='1'";
          SqlCommand sqlCommand = new SqlCommand(cmdText, connection);
          sqlCommand.CommandText = cmdText;
          sqlCommand.Parameters.AddWithValue("@Standardid", (object) classid);
          SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
          if (sqlDataReader.HasRows && sqlDataReader.Read())
          {
            str += " <tr>";
            str = str + "<td>" + this.load_remark() + " </td>";
            str = str + "<td> " + this.coursename(classid) + " </td>";
            str += "</tr>";
          }
          sqlCommand.Dispose();
          connection.Close();
        }
        catch
        {
        }
      }
      catch
      {
      }
      return str;
    }
  }
}
