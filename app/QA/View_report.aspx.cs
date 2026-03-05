// Decompiled with JetBrains decompiler
// Type: newweb.QA.View_report
// Assembly: newweb, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: A2E847A6-10D0-4271-9D59-55F01CDCC8B0
// Assembly location: C:\data\source-20190227T061536Z-001\source\lms\lms\bin\newweb.dll

using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace newweb.QA
{
  public class View_report : Page
  {
    protected GridView gvDP;
    protected SqlDataSource sqlDP;

    protected void ShowMessage(string Message, View_report.MessageType type)
    {
      ScriptManager.RegisterStartupScript((Page) this, this.GetType(), Guid.NewGuid().ToString(), "ShowMessage('" + Message + "','" + (object) type + "');", true);
    }

    protected void Page_Load(object sender, EventArgs e)
    {
      int num = this.IsPostBack ? 1 : 0;
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
      LinkButton linkButton = (LinkButton) sender;
      if (linkButton.CommandArgument.ToString().Trim().Length <= 0)
        return;
      this.Response.Redirect("asset.aspx?id=" + linkButton.CommandArgument.ToString().Trim());
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
      LinkButton linkButton = (LinkButton) sender;
      if (linkButton.CommandArgument.ToString().Trim().Length <= 0)
        return;
      this.Response.Redirect("View_detail_report.aspx?id=" + linkButton.CommandArgument.ToString().Trim());
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
