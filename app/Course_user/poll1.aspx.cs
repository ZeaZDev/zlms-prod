// Decompiled with JetBrains decompiler
// Type: newweb.Course_user.poll1
// Assembly: newweb, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: A2E847A6-10D0-4271-9D59-55F01CDCC8B0
// Assembly location: C:\data\source-20190227T061536Z-001\source\lms\lms\bin\newweb.dll

using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace newweb.Course_user
{
  public class poll1 : Page
  {
    protected HtmlInputText currentname;
    protected HtmlInputText Text1;
    protected HtmlInputText Text2;
    protected HtmlInputText Text3;
    protected HtmlInputText Text4;
    protected HtmlInputText Text10;
    protected HtmlInputText Text11;
    protected HtmlInputText Text5;
    protected HtmlInputText Text8;
    protected HtmlInputText Text9;
    protected HtmlInputText Text6;
    protected Button Button1;

    protected void ShowMessage(string Message, poll1.MessageType type)
    {
      ScriptManager.RegisterStartupScript((Page) this, this.GetType(), Guid.NewGuid().ToString(), "ShowMessage('" + Message + "','" + (object) type + "');", true);
    }

    protected void Page_Load(object sender, EventArgs e)
    {
      int num = this.IsPostBack ? 1 : 0;
    }

    public string renderdata1()
    {
      string str1 = "";
      try
      {
        str1 = this.Request["ID"].ToString();
      }
      catch
      {
      }
      string str2 = "<table class='table table-bordered table-striped table-condensed flip-content'>  <thead class='flip-content'> <tr> <td width='50%' rowspan='2'>ข้อความ</td> <td colspan='5'>ระดับความพึงพอใจ</td></tr> <tr> <td width='10%'>มากที่สุด (5)</td> <td width='10%'>มาก (4)</td> <td width='10%'>ปานกลาง (3)</td> <td width='10%'>น้อย (2)</td> <td width='10%'>น้อยที่สุด (1)</td></tr></thead> <tbody>";
      string empty = string.Empty;
      SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
      connection.Open();
      string cmdText = "SELECT pm.indicator,pd.Standard_detail,pd.id  FROM [QA_Poll_detail] pd   inner join QA_Poll_main pm on pm.id=pd.pollid where pm.[projectid]=@id order by pm.id,pd.id";
      SqlCommand sqlCommand = new SqlCommand(cmdText, connection);
      sqlCommand.CommandText = cmdText;
      sqlCommand.Parameters.AddWithValue("@id", (object) str1);
      SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
      string str3 = "";
      string str4 = "";
      int num1 = 1;
      int num2 = 1;
      if (sqlDataReader.HasRows)
      {
        while (sqlDataReader.Read())
        {
          string str5 = str2 + " <tr>";
          if (str3 == "")
          {
            str3 = sqlDataReader.GetValue(0).ToString();
            str4 = str3;
          }
          if (str3 != sqlDataReader.GetValue(0).ToString())
          {
            num1 = 1;
            str3 = sqlDataReader.GetValue(0).ToString();
            str4 = str3;
            ++num2;
          }
          if (num1 >= 2)
            str4 = "";
          string str6;
          if (str4 != "")
            str6 = str5 + " <td ><b><font size='3'>" + num2.ToString() + ")" + str4 + "</font></b><br/>" + num1.ToString() + ")" + sqlDataReader.GetValue(1).ToString() + "</td>";
          else
            str6 = str5 + " <td >" + num1.ToString() + ")" + sqlDataReader.GetValue(1).ToString() + "</td>";
          str2 = str6 + " <td ><input type='radio' name='" + sqlDataReader.GetValue(2).ToString() + "' value='5' required></td> <td ><input type='radio' name='" + sqlDataReader.GetValue(2).ToString() + "' value='4' required></td> <td ><input type='radio' name='" + sqlDataReader.GetValue(2).ToString() + "' value='3' required></td> <td ><input type='radio' name='" + sqlDataReader.GetValue(2).ToString() + "' value='2' required></td> <td ><input type='radio' name='" + sqlDataReader.GetValue(2).ToString() + "' value='1' required></td> </tr>";
          ++num1;
        }
      }
      connection.Close();
      return str2 + "  </tbody></table>";
    }

    private void addUser(string user, string dt2)
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
      string sql = "INSERT INTO [QA_User_pollans] ([pollid],[polldetail],[userid] ,[answerscore],[Createdate]) VALUES('" + dt2 + "','" + str + "','1','" + user + "','" + (object) DateTime.Now + "')";
      cconnect.sqlCmd(sql);
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
      try
      {
        int num = 27;
        for (int index = 1; index <= num; ++index)
          this.addUser(string.Format("{0}", (object) this.Request.Form[index.ToString()]), index.ToString());
      }
      catch
      {
      }
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
