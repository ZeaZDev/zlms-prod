// Decompiled with JetBrains decompiler
// Type: newweb.Course.setusercourse
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

namespace newweb.Course
{
  public class setusercourse : Page
  {
    protected DropDownList DropDownList1;
    protected Button Button1;
    protected GridView gvDP;
    protected SqlDataSource sqlDP;

    protected void ShowMessage(string Message, setusercourse.MessageType type)
    {
      ScriptManager.RegisterStartupScript((Page) this, this.GetType(), Guid.NewGuid().ToString(), "ShowMessage('" + Message + "','" + (object) type + "');", true);
    }

    protected void Page_Load(object sender, EventArgs e)
    {
      if (this.IsPostBack)
        return;
      try
      {
        this.sqlDP.SelectParameters[0].DefaultValue = this.Request["ID"].ToString();
        this.sqlDP.DataBind();
        try
        {
          this.gvDP.DataBind();
        }
        catch
        {
        }
        this.ADD_COM_CODE();
      }
      catch
      {
      }
    }

    public void ADD_COM_CODE()
    {
      SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
      connection.Open();
      string cmdText = "SELECT [id],[UserGroupname]  FROM [usergroup] where Active='1'";
      SqlCommand sqlCommand = new SqlCommand(cmdText, connection);
      sqlCommand.CommandText = cmdText;
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

    protected void Button1_Click(object sender, EventArgs e)
    {
      CConnect cconnect = new CConnect();
      string str1 = "";
      int length = this.DropDownList1.Text.IndexOf(",");
      if (length != -1)
        str1 = this.DropDownList1.Text.Substring(0, length);
      string str2 = this.Request["ID"].ToString();
      string sql = "insert into [Coursepermission] ([CourseID],[usergroupID],[Createdate],[Active])  VALUES ('" + str2 + "','" + str1 + "','" + (object) DateTime.Now + "','1')";
      cconnect.sqlCmd(sql);
      this.sqlDP.SelectParameters[0].DefaultValue = str2;
      this.sqlDP.DataBind();
      try
      {
        this.gvDP.DataBind();
      }
      catch
      {
      }
    }

    public void delete_course(string id)
    {
      try
      {
        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
        connection.Open();
        string cmdText = "update [Coursepermission] set active='0' where id=@id";
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

    public enum MessageType
    {
      Success,
      Error,
      Info,
      Warning,
    }
  }
}
