// Decompiled with JetBrains decompiler
// Type: newweb.USER_QA._default
// Assembly: newweb, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: A2E847A6-10D0-4271-9D59-55F01CDCC8B0
// Assembly location: C:\data\source-20190227T061536Z-001\source\lms\lms\bin\newweb.dll

using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace newweb.USER_QA
{
  public class _default : Page
  {
    protected GridView gvDP;
    protected SqlDataSource sqlDP;
    protected SqlDataSource SqlDataSource1;

    protected void ShowMessage(string Message, _default.MessageType type)
    {
      ScriptManager.RegisterStartupScript((Page) this, this.GetType(), Guid.NewGuid().ToString(), "ShowMessage('" + Message + "','" + (object) type + "');", true);
    }

    protected void Page_Load(object sender, EventArgs e)
    {
      if (this.Session["SessionID"] != null)
      {
        if (this.Session["RANK"].ToString() == "1")
        {
          string selectCommand = this.sqlDP.SelectCommand;
          this.sqlDP.SelectCommand = "SELECT  [id] ,[Project] FROM [QA_project] ";
          this.sqlDP.Select(DataSourceSelectArguments.Empty);
          this.sqlDP.DataBind();
          this.gvDP.DataSource = (object) this.SqlDataSource1;
          this.gvDP.DataBind();
        }
        else
        {
          try
          {
            this.sqlDP.SelectParameters[0].DefaultValue = this.Session["group"].ToString();
            this.sqlDP.DataBind();
            try
            {
              this.gvDP.DataSource = (object) this.sqlDP;
              this.gvDP.DataBind();
            }
            catch
            {
            }
          }
          catch (Exception ex)
          {
            string message = ex.Message;
          }
        }
      }
      int num = this.IsPostBack ? 1 : 0;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
      LinkButton linkButton = (LinkButton) sender;
      if (linkButton.CommandArgument.ToString().Trim().Length <= 0)
        return;
      this.Response.Redirect("asset.aspx?id=" + linkButton.CommandArgument.ToString().Trim());
    }

    protected void Button5_Click(object sender, EventArgs e)
    {
      LinkButton linkButton = (LinkButton) sender;
      if (linkButton.CommandArgument.ToString().Trim().Length <= 0)
        return;
      this.Response.Redirect("asset_add.aspx?id=" + linkButton.CommandArgument.ToString().Trim());
    }

    protected void Button6_Click(object sender, EventArgs e)
    {
      LinkButton linkButton = (LinkButton) sender;
      if (linkButton.CommandArgument.ToString().Trim().Length <= 0)
        return;
      this.Response.Redirect("View_detail_report.aspx?id=" + linkButton.CommandArgument.ToString().Trim());
    }

    protected void Button7_Click(object sender, EventArgs e)
    {
      LinkButton linkButton = (LinkButton) sender;
      if (linkButton.CommandArgument.ToString().Trim().Length <= 0)
        return;
      this.Response.Redirect("ReportQA.aspx?id=" + linkButton.CommandArgument.ToString().Trim());
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
