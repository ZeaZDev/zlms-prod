// Decompiled with JetBrains decompiler
// Type: newweb.Course_user.period
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
  public class period : Page
  {
    protected HyperLink hyperlink1;
    protected HyperLink hyperlink2;
    protected Label Name;
    protected Label Desp;
    protected Label Course_name;
    protected Label ClassName;
    protected Label Label1;
    protected HtmlInputText rating;
    protected Button Button1;
    protected Label Coursename;
    protected GridView gvDP;
    protected SqlDataSource sqlDP;

    protected void ShowMessage(string Message, period.MessageType type)
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
        this.checkpoll(classid);
        this.sqlDP.SelectParameters[0].DefaultValue = classid;
        this.sqlDP.DataBind();
        this.coursename(classid);
        try
        {
          this.gvDP.DataBind();
        }
        catch
        {
        }
      }
      catch
      {
        this.Response.Redirect("default.aspx");
      }
    }

    private string checkpoll(string classid)
    {
      string str = "";
      SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
      connection.Open();
      string cmdText = "select * from  Period_poll where userid=@id and classid=@classid";
      SqlCommand sqlCommand = new SqlCommand(cmdText, connection);
      sqlCommand.CommandText = cmdText;
      sqlCommand.Parameters.AddWithValue("@id", (object) this.Session["IDX"].ToString());
      sqlCommand.Parameters.AddWithValue("@classid", (object) classid);
      SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
      if (sqlDataReader.HasRows)
      {
        this.Button1.Visible = false;
        this.rating.Visible = false;
        this.Label1.Text = "Thank you for voting";
      }
      sqlDataReader.Close();
      sqlCommand.Dispose();
      connection.Close();
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
        this.Name.Text = sqlDataReader.GetValue(0).ToString();
        this.Desp.Text = sqlDataReader.GetValue(1).ToString();
        this.Course_name.Text = sqlDataReader.GetValue(2).ToString();
        this.Coursename.Text = sqlDataReader.GetValue(0).ToString();
        this.ClassName.Text = sqlDataReader.GetValue(3).ToString();
        this.hyperlink1.NavigateUrl = "Coursedetail.aspx?id=" + sqlDataReader.GetValue(5).ToString();
        this.hyperlink2.NavigateUrl = "class.aspx?id=" + sqlDataReader.GetValue(4).ToString();
      }
      sqlDataReader.Close();
      sqlCommand.Dispose();
      connection.Close();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
      string pollresult = this.rating.Value;
      string classid = this.Request["ID"].ToString();
      this.addPoll(classid, pollresult);
      this.checkpoll(classid);
    }

    private void addPoll(string classid, string pollresult)
    {
      new CConnect().sqlCmd("INSERT INTO [Period_poll] ([classid],[userid],[scorex],[createdate]) VALUES('" + classid + "','" + this.Session["IDX"].ToString() + "','" + pollresult + "','" + (object) DateTime.Now + "')");
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
