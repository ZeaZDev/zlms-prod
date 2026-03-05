// Decompiled with JetBrains decompiler
// Type: newweb.USERREPORT.Reportdetail
// Assembly: newweb, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: A2E847A6-10D0-4271-9D59-55F01CDCC8B0
// Assembly location: C:\data\source-20190227T061536Z-001\source\lms\lms\bin\newweb.dll

using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace newweb.USERREPORT
{
  public class Reportdetail : Page
  {
    protected Label Name;
    protected Label Desp;
    protected Label Coursename;
    protected GridView gvDP;
    protected SqlDataSource sqlDP;

    protected void ShowMessage(string Message, Reportdetail.MessageType type)
    {
      ScriptManager.RegisterStartupScript((Page) this, this.GetType(), Guid.NewGuid().ToString(), "ShowMessage('" + Message + "','" + (object) type + "');", true);
    }

    protected void Page_Load(object sender, EventArgs e)
    {
      if (this.IsPostBack)
        return;
      try
      {
        string courseid = this.Request["ID"].ToString();
        this.sqlDP.SelectParameters[0].DefaultValue = courseid;
        this.sqlDP.DataBind();
        this.coursename(courseid);
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

    public void coursename(string courseid)
    {
      SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
      connection.Open();
      string cmdText = "SELECT CourseName,CourseDesp  FROM [Course] where id=@id";
      SqlCommand sqlCommand = new SqlCommand(cmdText, connection);
      sqlCommand.CommandText = cmdText;
      sqlCommand.Parameters.AddWithValue("@id", (object) courseid);
      SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
      if (sqlDataReader.HasRows)
      {
        sqlDataReader.Read();
        this.Name.Text = sqlDataReader.GetValue(0).ToString();
        this.Desp.Text = sqlDataReader.GetValue(1).ToString();
        this.Coursename.Text = sqlDataReader.GetValue(0).ToString();
      }
      sqlDataReader.Close();
      sqlCommand.Dispose();
      connection.Close();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
      LinkButton linkButton = (LinkButton) sender;
      if (linkButton.CommandArgument.ToString().Trim().Length <= 0)
        return;
      this.Response.Redirect("Viewclassreport.aspx?id=" + linkButton.CommandArgument.ToString().Trim());
    }

    [WebMethod(EnableSession = true)]
    public static void SetSession(string ssname, string val)
    {
      HttpContext.Current.Session[ssname] = (object) val;
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
