// Decompiled with JetBrains decompiler
// Type: newweb.Course_user._class
// Assembly: newweb, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: A2E847A6-10D0-4271-9D59-55F01CDCC8B0
// Assembly location: C:\data\source-20190227T061536Z-001\source\lms\lms\bin\newweb.dll

using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace newweb.Course_user
{
  public class _class : Page
  {
    protected HyperLink hyperlink1;
    protected Label Name;
    protected Label Desp;
    protected Label Course_name;
    protected Label Coursename;
    protected GridView gvDP;
    protected SqlDataSource sqlDP;

    protected void ShowMessage(string Message, _class.MessageType type)
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
      }
    }

    public void coursename(string classid)
    {
      SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
      connection.Open();
      string cmdText = "select cl.ClassName,cl.ClasssDesp,c.CourseName,c.id from Class cl inner join Course C on c.id=cl.CourseID where cl.id=@id";
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
        this.hyperlink1.NavigateUrl = "Coursedetail.aspx?id=" + sqlDataReader.GetValue(3).ToString();
      }
      sqlDataReader.Close();
      sqlCommand.Dispose();
      connection.Close();
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
