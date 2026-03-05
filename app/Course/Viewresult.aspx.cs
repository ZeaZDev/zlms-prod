// Decompiled with JetBrains decompiler
// Type: newweb.Course.Viewresult
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
  public class Viewresult : Page
  {
    protected HyperLink hyperlink1;
    protected HyperLink hyperlink2;
    protected HyperLink hyperlink3;
    protected GridView gvDP;
    protected SqlDataSource sqlDP;

    protected void ShowMessage(string Message, Viewresult.MessageType type)
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

    private string coursename(string classid)
    {
      string str = "";
      SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
      connection.Open();
      string cmdText = " select clt.ClassItemName,clt.ClassItemDesp,pr.PeriodName,c.CourseName,cl.ClassName,cl.id,c.id,clt.PeriodID,clt.QuestionID from [ClassItem] clt inner join [Period] pr on pr.id=clt.PeriodID  inner join Class cl on cl.id=pr.ClassID inner join Course C on c.id=cl.CourseID where clt.id=@id";
      SqlCommand sqlCommand = new SqlCommand(cmdText, connection);
      sqlCommand.CommandText = cmdText;
      sqlCommand.Parameters.AddWithValue("@id", (object) classid);
      SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
      if (sqlDataReader.HasRows)
      {
        sqlDataReader.Read();
        this.hyperlink1.NavigateUrl = "Coursedetail.aspx?id=" + sqlDataReader.GetValue(6).ToString();
        this.hyperlink2.NavigateUrl = "class.aspx?id=" + sqlDataReader.GetValue(5).ToString();
        this.hyperlink3.NavigateUrl = "period.aspx?id=" + sqlDataReader.GetValue(7).ToString();
        if (sqlDataReader.GetValue(8).ToString() != "")
          str = sqlDataReader.GetValue(8).ToString();
      }
      sqlDataReader.Close();
      sqlCommand.Dispose();
      connection.Close();
      return str;
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
