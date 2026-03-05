// Decompiled with JetBrains decompiler
// Type: newweb.USER_QA.asset_detail_add
// Assembly: newweb, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: A2E847A6-10D0-4271-9D59-55F01CDCC8B0
// Assembly location: C:\data\source-20190227T061536Z-001\source\lms\lms\bin\newweb.dll

using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace newweb.USER_QA
{
  public class asset_detail_add : Page
  {
    protected Label Name;
    protected Label Desp;
    protected Label Course_name;
    protected Label Label1;
    protected TextBox TextBox1;
    protected Button Button1;
    protected Button Button2;

    protected void ShowMessage(string Message, asset_detail_add.MessageType type)
    {
      ScriptManager.RegisterStartupScript((Page) this, this.GetType(), Guid.NewGuid().ToString(), "ShowMessage('" + Message + "','" + (object) type + "');", true);
    }

    protected void Page_Load(object sender, EventArgs e)
    {
      if (this.IsPostBack)
        return;
      try
      {
        string classid = this.Request["ID"].ToString();
        this.coursename(classid);
        this.coursename1(classid);
        this.Button2.Attributes.Add("onclick", "history.back();return false");
      }
      catch
      {
        this.Response.Redirect("default.aspx");
      }
    }

    private string coursename1(string classid)
    {
      string str = "";
      SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
      connection.Open();
      string cmdText = "SELECT detail  FROM [QA_result_detail] where id=@id";
      SqlCommand sqlCommand = new SqlCommand(cmdText, connection);
      sqlCommand.CommandText = cmdText;
      sqlCommand.Parameters.AddWithValue("@id", (object) classid);
      SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
      if (sqlDataReader.HasRows)
      {
        sqlDataReader.Read();
        this.TextBox1.Text = sqlDataReader.GetValue(0).ToString();
      }
      sqlDataReader.Close();
      sqlCommand.Dispose();
      connection.Close();
      return str;
    }

    private string coursename(string classid)
    {
      string str = "";
      SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
      connection.Open();
      string cmdText = "SELECT qi.indicator,qs.qa_standard,qd.Standard_detail,qx.Standard_detail as detail  FROM [QA_standard_detail_add] qx inner join QA_standard_detail qd on qd.id=qx.Standardid inner join QA_standard qs on qs.id=qd.Standardid inner join QA_Indicator qi on qi.id=qs.qaindicator where qx.id=@id";
      SqlCommand sqlCommand = new SqlCommand(cmdText, connection);
      sqlCommand.CommandText = cmdText;
      sqlCommand.Parameters.AddWithValue("@id", (object) classid);
      SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
      if (sqlDataReader.HasRows)
      {
        sqlDataReader.Read();
        this.Name.Text = sqlDataReader.GetValue(0).ToString();
        this.Desp.Text = sqlDataReader.GetValue(1).ToString();
        this.Course_name.Text = sqlDataReader.GetValue(2).ToString();
        this.Label1.Text = sqlDataReader.GetValue(3).ToString();
      }
      sqlDataReader.Close();
      sqlCommand.Dispose();
      connection.Close();
      return str;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
      string user = "";
      try
      {
        user = this.Request["ID"].ToString();
      }
      catch
      {
      }
      if (this.checkUser(user) == 0)
        this.addUser(this.TextBox1.Text);
      else
        this.addUser1(this.TextBox1.Text);
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
    }

    private int checkUser(string user)
    {
      return int.Parse(new CConnect().sqlCmdReturn("select count(id) from QA_result_detail where standard_detail_id='" + user + "'").ToString());
    }

    private void addUser(string user)
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
      string sql = "INSERT INTO [QA_result_detail] ([[detail] ,[standard_detail_id],[projectid],[Createdate]) VALUES('" + user + "','" + str + "','1','" + (object) DateTime.Now + "')";
      cconnect.sqlCmd(sql);
    }

    private void addUser1(string user)
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
      string sql = "UPDATE [QA_result_detail] set detail='" + user + "' where standard_detail_id='" + str + "'";
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
