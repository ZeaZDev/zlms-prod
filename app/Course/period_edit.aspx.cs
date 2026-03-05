// Decompiled with JetBrains decompiler
// Type: newweb.Course.period_edit
// Assembly: newweb, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: A2E847A6-10D0-4271-9D59-55F01CDCC8B0
// Assembly location: C:\data\source-20190227T061536Z-001\source\lms\lms\bin\newweb.dll

using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace newweb.Course
{
  public class period_edit : Page
  {
    protected HyperLink hyperlink2;
    protected HyperLink hyperlink3;
    protected TextBox Name;
    protected TextBox Desp;
    protected Button Button1;
    protected HyperLink hyperlink1;

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
        this.hyperlink1.NavigateUrl = "Class.aspx?id=" + sqlDataReader.GetValue(4).ToString();
        this.hyperlink3.NavigateUrl = "Class.aspx?id=" + sqlDataReader.GetValue(4).ToString();
        this.hyperlink2.NavigateUrl = "Coursedetail.aspx?id=" + sqlDataReader.GetValue(5).ToString();
      }
      sqlDataReader.Close();
      sqlCommand.Dispose();
      connection.Close();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
      try
      {
        string str = this.Request["ID"].ToString();
        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
        connection.Open();
        string cmdText = "update  [Period] set [PeriodName]=@CourseName,[PeriodDesp]=@CourseDesp where id=@id";
        SqlCommand sqlCommand = new SqlCommand(cmdText, connection);
        sqlCommand.CommandText = cmdText;
        sqlCommand.Parameters.AddWithValue("@id", (object) str);
        sqlCommand.Parameters.AddWithValue("@CourseName", (object) this.Name.Text);
        sqlCommand.Parameters.AddWithValue("@CourseDesp", (object) this.Desp.Text);
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
