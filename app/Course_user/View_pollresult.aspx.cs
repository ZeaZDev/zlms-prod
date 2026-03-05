// Decompiled with JetBrains decompiler
// Type: newweb.Course_user.View_pollresult
// Assembly: newweb, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: A2E847A6-10D0-4271-9D59-55F01CDCC8B0
// Assembly location: C:\data\source-20190227T061536Z-001\source\lms\lms\bin\newweb.dll

using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace newweb.Course_user
{
  public class View_pollresult : Page
  {
    protected void ShowMessage(string Message, View_pollresult.MessageType type)
    {
      ScriptManager.RegisterStartupScript((Page) this, this.GetType(), Guid.NewGuid().ToString(), "ShowMessage('" + Message + "','" + (object) type + "');", true);
    }

    protected void Page_Load(object sender, EventArgs e)
    {
      int num = this.IsPostBack ? 1 : 0;
    }

    public string renderdata1()
    {
      string str1 = "<table class='table table-bordered table-striped table-condensed flip-content'>  <thead class='flip-content'> <tr> <td width='70%' rowspan='2'>ข้อความ</td> <td colspan='5'>ระดับความพึงพอใจ</td></tr> <tr> <td width='30%'>ผลการประเมิณ</td></tr></thead> <tbody>";
      string empty = string.Empty;
      SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
      connection.Open();
      string cmdText = "SELECT pm.indicator,pd.Standard_detail,pd.id,avg(qp.answerscore)  FROM [QA_Poll_detail] pd   inner join QA_Poll_main pm on pm.id=pd.pollid left join QA_User_pollans qp on qp.pollid=pd.id group by pm.id,pm.indicator,pd.Standard_detail,pd.id order by pm.id,pd.id";
      SqlCommand sqlCommand = new SqlCommand(cmdText, connection);
      sqlCommand.CommandText = cmdText;
      SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
      string str2 = "";
      string str3 = "";
      int num1 = 1;
      int num2 = 1;
      if (sqlDataReader.HasRows)
      {
        while (sqlDataReader.Read())
        {
          string str4 = str1 + " <tr>";
          if (str2 == "")
          {
            str2 = sqlDataReader.GetValue(0).ToString();
            str3 = str2;
          }
          if (str2 != sqlDataReader.GetValue(0).ToString())
          {
            num1 = 1;
            str2 = sqlDataReader.GetValue(0).ToString();
            str3 = str2;
            ++num2;
          }
          if (num1 >= 2)
            str3 = "";
          string str5;
          if (str3 != "")
            str5 = str4 + " <td ><b><font size='3'>" + num2.ToString() + ")" + str3 + "</font></b><br/>" + num1.ToString() + ")" + sqlDataReader.GetValue(1).ToString() + "</td>";
          else
            str5 = str4 + " <td >" + num1.ToString() + ")" + sqlDataReader.GetValue(1).ToString() + "</td>";
          str1 = str5 + " <td >" + sqlDataReader.GetValue(3).ToString() + "</td> </tr>";
          ++num1;
        }
      }
      connection.Close();
      return str1 + "  </tbody></table>";
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
