// Decompiled with JetBrains decompiler
// Type: newweb.Multimedia._default
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

namespace newweb.Multimedia
{
  public class _default : Page
  {
    protected GridView gvDP;
    protected SqlDataSource sqlDP;
    protected HtmlInputText txtNName;
    protected HtmlInputText txtlink;
    protected Button bnAdduser;

    protected void ShowMessage(string Message, _default.MessageType type)
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
      this.Response.Redirect("live_edit.aspx?id=" + linkButton.CommandArgument.ToString().Trim());
    }

    public void delete_course(string id)
    {
      try
      {
        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
        connection.Open();
        string cmdText = "UPDATE [Video] SET ACTIVE='0' where id=@id";
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
      if (this.txtNName.Value == "")
      {
        this.ShowMessage("Video Name acan not be blank", _default.MessageType.Error);
      }
      else
      {
        this.addUser(this.txtNName.Value);
        this.ShowMessage("Video Name " + this.txtNName.Value + " is added", _default.MessageType.Success);
        this.sqlDP.DataBind();
        this.gvDP.DataBind();
        this.clearAddnew();
      }
    }

    private void clearAddnew()
    {
      this.txtNName.Value = "";
    }

    private void addUser(string user)
    {
      new CConnect().sqlCmd("INSERT INTO [Video] ([Viedeoname],[Videolink],[Active],[Createdate],[Createby]) VALUES('" + this.txtNName.Value + "','" + this.txtlink.Value + "','1','" + (object) DateTime.Now + "','1')");
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
