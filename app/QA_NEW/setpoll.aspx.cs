// Decompiled with JetBrains decompiler
// Type: newweb.QA_NEW.setpoll
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

namespace newweb.QA_NEW
{
  public class setpoll : Page
  {
    protected TextBox Text131;
    protected Button Button12;
    protected GridView GridView1;
    protected SqlDataSource SqlDataSource1;
    protected GridView gvDP;
    protected SqlDataSource sqlDP;
    protected HtmlInputText txtNName;
    protected Button bnAdduser;
    protected HtmlInputText Text2;
    protected DropDownList DropDownList1;
    protected Button Button1;

    protected void ShowMessage(string Message, setpoll.MessageType type)
    {
      ScriptManager.RegisterStartupScript((Page) this, this.GetType(), Guid.NewGuid().ToString(), "ShowMessage('" + Message + "','" + (object) type + "');", true);
    }

    protected void Page_Load(object sender, EventArgs e)
    {
      if (this.IsPostBack)
        return;
      try
      {
        this.DropDownList1.Items.Add("Text");
        this.DropDownList1.Items.Add("Checkbox");
        this.DropDownList1.Items.Add("Radio");
        this.DropDownList1.Text = "Text";
        this.load_remark();
        string str = this.Request["ID"].ToString();
        this.sqlDP.SelectParameters[0].DefaultValue = str;
        this.sqlDP.DataBind();
        this.SqlDataSource1.SelectParameters[0].DefaultValue = str;
        this.SqlDataSource1.DataBind();
        try
        {
          this.gvDP.DataBind();
          this.GridView1.DataBind();
        }
        catch
        {
        }
      }
      catch
      {
      }
    }

    public string load_remark()
    {
      string str1 = "";
      try
      {
        string str2 = this.Request["ID"].ToString();
        try
        {
          string empty = string.Empty;
          SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
          connection.Open();
          string cmdText = "Select [Result] from POLL_result_txt where Poll_ID=@Standardid ";
          SqlCommand sqlCommand = new SqlCommand(cmdText, connection);
          sqlCommand.CommandText = cmdText;
          sqlCommand.Parameters.AddWithValue("@Standardid", (object) str2);
          SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
          if (sqlDataReader.HasRows)
          {
            sqlDataReader.Read();
            this.Text131.Text = sqlDataReader.GetValue(0).ToString();
          }
          sqlCommand.Dispose();
          connection.Close();
        }
        catch
        {
        }
      }
      catch
      {
      }
      return str1;
    }

    private int checkUser_remark(string user, string project)
    {
      return int.Parse(new CConnect().sqlCmdReturn("select count(id) from POLL_result_txt where Poll_ID='" + user + "'").ToString());
    }

    protected void insert_remark(string dt1, string remark)
    {
      new CConnect().sqlCmd("INSERT INTO [POLL_result_txt]([Poll_ID],[Result],[Createdate],[Createby])  VALUES('" + dt1 + "','" + remark + "','" + (object) DateTime.Now + "','1')");
    }

    protected void update_remark(string dt1, string remark)
    {
      new CConnect().sqlCmd("UPDATE [POLL_result_txt] SET [Result]='" + remark + "' where [Poll_ID]='" + dt1 + "'");
    }

    protected void Button_g103_Click(object sender, EventArgs e)
    {
      string str = "";
      try
      {
        str = this.Request["ID"].ToString();
      }
      catch
      {
      }
      if (this.checkUser_remark(str, "") == 0)
        this.insert_remark(str, this.Text131.Text);
      else
        this.update_remark(str, this.Text131.Text);
      this.Page.Response.Redirect(this.Page.Request.Url.AbsoluteUri);
    }

    public void delete_course(string id)
    {
      try
      {
        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
        connection.Open();
        string cmdText = "UPDATE [QA_Poll_main] SET ACTIVE='0' where id=@id";
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

    public void delete_course1(string id)
    {
      try
      {
        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
        connection.Open();
        string cmdText = "UPDATE [QA_Poll_main1] SET ACTIVE='0' where id=@id";
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
      if (linkButton.CommandArgument.ToString().Trim().Length > 0)
      {
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
      this.Page.Response.Redirect(this.Page.Request.Url.AbsoluteUri);
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
      LinkButton linkButton = (LinkButton) sender;
      if (linkButton.CommandArgument.ToString().Trim().Length > 0)
      {
        this.delete_course1(linkButton.CommandArgument.ToString().Trim());
        this.SqlDataSource1.DataBind();
        try
        {
          this.GridView1.DataBind();
        }
        catch
        {
        }
      }
      this.Page.Response.Redirect(this.Page.Request.Url.AbsoluteUri);
    }

    [WebMethod(EnableSession = true)]
    public static void SetSession(string ssname, string val)
    {
      HttpContext.Current.Session[ssname] = (object) val;
    }

    protected void bnAdduser_Click(object sender, EventArgs e)
    {
      ScriptManager.RegisterStartupScript((Page) this, this.GetType(), "Pop", "openModal();", true);
      if (this.txtNName.Value == "")
      {
        this.ShowMessage("Poll header can not be blank", setpoll.MessageType.Error);
      }
      else
      {
        this.addUser(this.txtNName.Value);
        this.ShowMessage("Poll header  " + this.txtNName.Value + " is added", setpoll.MessageType.Success);
        this.sqlDP.DataBind();
        this.gvDP.DataBind();
        this.clearAddnew();
        this.Page.Response.Redirect(this.Page.Request.Url.AbsoluteUri);
      }
    }

    private void clearAddnew()
    {
      this.txtNName.Value = "";
    }

    private void addUser(string user)
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
      string sql = "INSERT INTO [QA_Poll_main] ([indicator],[projectid] ,[Active],[Createdate]) VALUES('" + this.txtNName.Value + "','" + str + "','1','" + (object) DateTime.Now + "')";
      cconnect.sqlCmd(sql);
    }

    protected void bnAdduser1_Click(object sender, EventArgs e)
    {
      ScriptManager.RegisterStartupScript((Page) this, this.GetType(), "Pop", "openModal();", true);
      if (this.Text2.Value == "")
      {
        this.ShowMessage("Measure name can not be blank", setpoll.MessageType.Error);
      }
      else
      {
        this.addUser1(this.txtNName.Value);
        this.ShowMessage("Measure name  " + this.txtNName.Value + " is added", setpoll.MessageType.Success);
        this.SqlDataSource1.DataBind();
        this.GridView1.DataBind();
        this.clearAddnew1();
        this.Page.Response.Redirect(this.Page.Request.Url.AbsoluteUri);
      }
    }

    private void clearAddnew1()
    {
      this.Text2.Value = "";
    }

    private void addUser1(string user)
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
      string sql = "INSERT INTO [QA_Poll_main1] ([indicator],[projectid] ,[Active],[Createdate],[Type1]) VALUES('" + this.Text2.Value + "','" + str + "','1','" + (object) DateTime.Now + "','" + this.DropDownList1.Text + "')";
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
