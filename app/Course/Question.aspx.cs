// Decompiled with JetBrains decompiler
// Type: newweb.Course.Question
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
  public class Question : Page
  {
    protected HyperLink hyperlink1;
    protected HyperLink hyperlink2;
    protected HyperLink hyperlink3;
    protected Label Name;
    protected Label Desp;
    protected Label Course_name;
    protected Label ClassName;
    protected Label Label1;
    protected Label Questionxx;
    protected DropDownList DropDownList1;

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
        this.Response.Redirect("default.aspx");
      }
    }

    public void ADD_COM_CODE(string IDx, string periodtype)
    {
      SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
      connection.Open();
      string cmdText = "SELECT [id],[Question_name]  FROM [Question] where Active='1' and Courseid=@Courseid and Periodtype=@Periodtype";
      SqlCommand sqlCommand = new SqlCommand(cmdText, connection);
      sqlCommand.CommandText = cmdText;
      sqlCommand.Parameters.AddWithValue("@Courseid", (object) IDx);
      sqlCommand.Parameters.AddWithValue("@Periodtype", (object) periodtype);
      SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
      this.DropDownList1.Items.Clear();
      if (sqlDataReader.HasRows)
      {
        while (sqlDataReader.Read())
          this.DropDownList1.Items.Add(sqlDataReader.GetValue(0).ToString() + "," + sqlDataReader.GetValue(1).ToString());
      }
      sqlDataReader.Close();
      sqlCommand.Dispose();
      connection.Close();
    }

    private string coursename(string classid)
    {
      string periodtype = "";
      SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
      connection.Open();
      string cmdText = " select clt.ClassItemName,clt.ClassItemDesp,pr.PeriodName,c.CourseName,cl.ClassName,cl.id,c.id,clt.PeriodID,q.Question_name,clt.ClassitemtypeID,c.ID from [ClassItem] clt inner join [Period] pr on pr.id=clt.PeriodID  inner join Class cl on cl.id=pr.ClassID inner join Course C on c.id=cl.CourseID left join Question q on q.id= clt.QuestionID where clt.id=@id";
      SqlCommand sqlCommand = new SqlCommand(cmdText, connection);
      sqlCommand.CommandText = cmdText;
      sqlCommand.Parameters.AddWithValue("@id", (object) classid);
      SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
      if (sqlDataReader.HasRows)
      {
        sqlDataReader.Read();
        this.Name.Text = sqlDataReader.GetValue(0).ToString();
        this.Desp.Text = sqlDataReader.GetValue(1).ToString();
        this.Course_name.Text = sqlDataReader.GetValue(3).ToString();
        this.ClassName.Text = sqlDataReader.GetValue(4).ToString();
        this.Label1.Text = sqlDataReader.GetValue(2).ToString();
        this.Questionxx.Text = sqlDataReader.GetValue(8).ToString();
        this.hyperlink1.NavigateUrl = "Coursedetail.aspx?id=" + sqlDataReader.GetValue(6).ToString();
        this.hyperlink2.NavigateUrl = "class.aspx?id=" + sqlDataReader.GetValue(5).ToString();
        this.hyperlink3.NavigateUrl = "period.aspx?id=" + sqlDataReader.GetValue(7).ToString();
        periodtype = sqlDataReader.GetValue(9).ToString();
        this.ADD_COM_CODE(sqlDataReader.GetValue(10).ToString(), periodtype);
      }
      sqlDataReader.Close();
      sqlCommand.Dispose();
      connection.Close();
      return periodtype;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
      try
      {
        string str = "";
        int length = this.DropDownList1.Text.IndexOf(",");
        if (length != -1)
          str = this.DropDownList1.Text.Substring(0, length);
        string classid = this.Request["ID"].ToString();
        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
        connection.Open();
        string cmdText = "update [ClassItem] set [QuestionID]=@QuestionID where id=@id";
        SqlCommand sqlCommand = new SqlCommand(cmdText, connection);
        sqlCommand.CommandText = cmdText;
        sqlCommand.Parameters.AddWithValue("@id", (object) classid);
        sqlCommand.Parameters.AddWithValue("@QuestionID", (object) str);
        sqlCommand.ExecuteNonQuery();
        sqlCommand.Dispose();
        connection.Close();
        this.coursename(classid);
      }
      catch
      {
      }
    }
  }
}
