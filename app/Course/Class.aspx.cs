// Decompiled with JetBrains decompiler
// Type: newweb.Course.Class
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
  public class Class : Page
  {
    protected HyperLink hyperlink1;
    protected Label Name;
    protected Label Desp;
    protected Label Course_name;
    protected Label Coursename;
    protected GridView gvDP;
    protected SqlDataSource sqlDP;
    protected HtmlInputText txtNName;
    protected HtmlInputText txtFullname;
    protected Button bnAdduser;

    protected void ShowMessage(string Message, Class.MessageType type)
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

    protected void Button1_Click(object sender, EventArgs e)
    {
      LinkButton linkButton = (LinkButton) sender;
      if (linkButton.CommandArgument.ToString().Trim().Length <= 0)
        return;
      this.Response.Redirect("period_edit.aspx?id=" + linkButton.CommandArgument.ToString().Trim());
    }

    public void delete_course(string id)
    {
      try
      {
        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
        connection.Open();
        string cmdText = "update [Period] set active='0' where id=@id";
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
        this.ShowMessage("Period Name and Period Desption can not be blank", Class.MessageType.Error);
      }
      else
      {
        this.addUser(this.txtNName.Value, this.txtFullname.Value);
        this.ShowMessage("Period Name " + this.txtNName.Value + " is added", Class.MessageType.Success);
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
      string str = "";
      try
      {
        str = this.Request["ID"].ToString();
      }
      catch
      {
      }
      string sql = "INSERT INTO [Period] ([ClassID],[PeriodName],[PeriodDesp],[userid],[CreatedDate],[Active],[UpdateDate],[Updateby]) VALUES('" + str + "','" + this.txtNName.Value + "','" + this.txtFullname.Value + "','1','" + (object) DateTime.Now + "','1','" + (object) DateTime.Now + "','1')";
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
