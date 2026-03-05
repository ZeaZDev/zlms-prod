// Decompiled with JetBrains decompiler
// Type: newweb.Course_user.Default
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
  public class Default : Page
  {
    protected GridView gvDP;
    protected SqlDataSource sqlDP;

    protected void ShowMessage(string Message, Default.MessageType type)
    {
      ScriptManager.RegisterStartupScript((Page) this, this.GetType(), Guid.NewGuid().ToString(), "ShowMessage('" + Message + "','" + (object) type + "');", true);
    }

    protected void Page_Load(object sender, EventArgs e)
    {
      if (this.IsPostBack)
        return;
      this.sqlDP.SelectParameters[0].DefaultValue = "4";
      this.sqlDP.DataBind();
      try
      {
        this.gvDP.DataBind();
      }
      catch
      {
      }
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
      LinkButton linkButton = (LinkButton) sender;
      if (linkButton.CommandArgument.ToString().Trim().Length <= 0)
        return;
      this.Response.Redirect("poll.aspx?id=" + linkButton.CommandArgument.ToString().Trim());
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
      LinkButton linkButton = (LinkButton) sender;
      if (linkButton.CommandArgument.ToString().Trim().Length <= 0)
        return;
      if (this.check_enroll(linkButton.CommandArgument.ToString()) == "")
        this.addUser(linkButton.CommandArgument.ToString());
      else
        this.ShowMessage("Course already enroll", Default.MessageType.Error);
    }

    public string check_enroll(string courseid)
    {
      string str = "";
      SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
      connection.Open();
      string cmdText = "SELECT ID  FROM  [Member_course] where courseid=@courseid and userid=@userid";
      SqlCommand sqlCommand = new SqlCommand(cmdText, connection);
      sqlCommand.CommandText = cmdText;
      sqlCommand.Parameters.AddWithValue("@courseid", (object) courseid);
      sqlCommand.Parameters.AddWithValue("@userid", (object) this.Session["IDX"].ToString());
      SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
      if (sqlDataReader.HasRows)
      {
        sqlDataReader.Read();
        str = sqlDataReader.GetValue(0).ToString();
      }
      sqlDataReader.Close();
      sqlCommand.Dispose();
      connection.Close();
      return str;
    }

    private void addUser(string courseid)
    {
      new CConnect().sqlCmd("INSERT INTO [Member_course] ([userid],[courseid],[Createdate],[Active]) VALUES('" + this.Session["IDX"].ToString() + "','" + courseid + "','" + (object) DateTime.Now + "','1')");
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
