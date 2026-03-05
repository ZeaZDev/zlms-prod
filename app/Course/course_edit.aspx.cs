// Decompiled with JetBrains decompiler
// Type: newweb.Course.course_edit
// Assembly: newweb, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: A2E847A6-10D0-4271-9D59-55F01CDCC8B0
// Assembly location: C:\data\source-20190227T061536Z-001\source\lms\lms\bin\newweb.dll

using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace newweb.Course
{
  public class course_edit : Page
  {
    protected TextBox Name;
    protected TextBox Desp;
    protected HtmlInputText dtfrom;
    protected HtmlInputText dtto;
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
      string cmdText = "select [CourseName],[CourseDesp],[Startdate],[Stopdate] from [Course] where id=@id";
      SqlCommand sqlCommand = new SqlCommand(cmdText, connection);
      sqlCommand.CommandText = cmdText;
      sqlCommand.Parameters.AddWithValue("@id", (object) classid);
      SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
      if (sqlDataReader.HasRows)
      {
        sqlDataReader.Read();
        this.Name.Text = sqlDataReader.GetValue(0).ToString();
        this.Desp.Text = sqlDataReader.GetValue(1).ToString();
        this.dtfrom.Value = sqlDataReader.GetValue(2).ToString();
        this.dtto.Value = sqlDataReader.GetValue(3).ToString();
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
        string cmdText = "update [Course] set [CourseName]=@CourseName,[CourseDesp]=@CourseDesp,Startdate=@Startdate,Stopdate=@Stopdate where id=@id";
        SqlCommand sqlCommand = new SqlCommand(cmdText, connection);
        sqlCommand.CommandText = cmdText;
        sqlCommand.Parameters.AddWithValue("@id", (object) str);
        sqlCommand.Parameters.AddWithValue("@CourseName", (object) this.Name.Text);
        sqlCommand.Parameters.AddWithValue("@CourseDesp", (object) this.Desp.Text);
        sqlCommand.Parameters.AddWithValue("@Startdate", (object) this.dtfrom.Value);
        sqlCommand.Parameters.AddWithValue("@Stopdate", (object) this.dtto.Value);
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
