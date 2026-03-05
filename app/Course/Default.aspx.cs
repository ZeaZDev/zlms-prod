// Decompiled with JetBrains decompiler
// Type: newweb.Course.Default
// Assembly: newweb, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: A2E847A6-10D0-4271-9D59-55F01CDCC8B0
// Assembly location: C:\data\source-20190227T061536Z-001\source\lms\lms\bin\newweb.dll

using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace newweb.Course
{
  public class Default : Page
  {
    protected GridView gvDP;
    protected SqlDataSource sqlDP;
    protected HtmlInputText txtNName;
    protected HtmlInputText txtFullname;
    protected HtmlInputText dtfrom;
    protected HtmlInputText dtto;
    protected Button bnAdduser;

    protected void ShowMessage(string Message, Default.MessageType type)
    {
      ScriptManager.RegisterStartupScript((Page) this, this.GetType(), Guid.NewGuid().ToString(), "ShowMessage('" + Message + "','" + (object) type + "');", true);
    }

    protected void Page_Load(object sender, EventArgs e)
    {
      int num = this.IsPostBack ? 1 : 0;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
      LinkButton linkButton = (LinkButton) sender;
      if (linkButton.CommandArgument.ToString().Trim().Length <= 0)
        return;
      this.Response.Redirect("course_edit.aspx?id=" + linkButton.CommandArgument.ToString().Trim());
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
      LinkButton linkButton = (LinkButton) sender;
      if (linkButton.CommandArgument.ToString().Trim().Length <= 0)
        return;
      this.Response.Redirect("Coursecalenda.aspx?id=" + linkButton.CommandArgument.ToString().Trim());
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
      LinkButton linkButton = (LinkButton) sender;
      if (linkButton.CommandArgument.ToString().Trim().Length <= 0)
        return;
      this.Response.Redirect("setusercourse.aspx?id=" + linkButton.CommandArgument.ToString().Trim());
    }

    public void delete_course(string id)
    {
      try
      {
        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
        connection.Open();
        string cmdText = "UPDATE [Course] SET ACTIVE='0' where id=@id";
        SqlCommand sqlCommand = new SqlCommand(cmdText, connection);
        sqlCommand.CommandText = cmdText;
        sqlCommand.Parameters.AddWithValue("@id", (object) int.Parse(id));
        sqlCommand.ExecuteNonQuery();
        sqlCommand.Dispose();
        connection.Close();
      }
      catch
      {
      }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
      LinkButton linkButton = (LinkButton) sender;
      if (linkButton.CommandArgument.ToString().Trim().Length <= 0)
        return;
      this.delete_course(linkButton.CommandArgument.ToString().Trim());
      this.sqlDP.DataBind();
      try
      {
        this.gvDP.DataBind();
      }
      catch
      {
      }
    }

    [WebMethod(EnableSession = true)]
    public static void SetSession(string ssname, string val)
    {
      HttpContext.Current.Session[ssname] = (object) val;
    }

    protected void bnAdduser_Click(object sender, EventArgs e)
    {
      ScriptManager.RegisterStartupScript((Page) this, this.GetType(), "Pop", "openModal();", true);
      if (this.txtNName.Value == "" || this.txtFullname.Value == "")
      {
        this.ShowMessage("Course Name and Course Desption can not be blank", Default.MessageType.Error);
      }
      else
      {
        this.addUser(this.txtNName.Value, this.txtFullname.Value);
        this.ShowMessage("Course Name " + this.txtNName.Value + " is added", Default.MessageType.Success);
        this.sqlDP.DataBind();
        this.gvDP.DataBind();
        this.clearAddnew();
      }
    }

    private void clearAddnew()
    {
      this.txtNName.Value = "";
      this.txtFullname.Value = "";
    }

    private void addUser(string user, string pass)
    {
      CConnect cconnect = new CConnect();
      string str1;
      try
      {
        str1 = DateTime.Parse(this.dtfrom.Value).ToString("yyyy-MM-dd");
      }
      catch
      {
        str1 = DateTime.Now.ToString("yyyy-MM-dd");
      }
      string str2;
      try
      {
        str2 = DateTime.Parse(this.dtto.Value).ToString("yyyy-MM-dd");
      }
      catch
      {
        DateTime dateTime = DateTime.Now;
        dateTime = dateTime.AddDays(30.0);
        str2 = dateTime.ToString("yyyy-MM-dd");
      }
      string sql = "INSERT INTO [Course] ([CourseName],[CourseDesp],[Userid],[Createdate],[Active],[Updatedate],[Updateby],[Startdate],[Stopdate]) VALUES('" + this.txtNName.Value + "','" + this.txtFullname.Value + "','1','" + (object) DateTime.Now + "','1','" + (object) DateTime.Now + "','1','" + str1 + "','" + str2 + "')";
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
