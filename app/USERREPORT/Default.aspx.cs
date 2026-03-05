// Decompiled with JetBrains decompiler
// Type: newweb.USERREPORT.Default
// Assembly: newweb, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: A2E847A6-10D0-4271-9D59-55F01CDCC8B0
// Assembly location: C:\data\source-20190227T061536Z-001\source\lms\lms\bin\newweb.dll

using System;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace newweb.USERREPORT
{
  public class Default : Page
  {
    protected GridView gvDP;
    protected SqlDataSource sqlDP;

    protected void Page_Load(object sender, EventArgs e)
    {
      int num = this.IsPostBack ? 1 : 0;
    }

    [WebMethod(EnableSession = true)]
    public static void SetSession(string ssname, string val)
    {
      HttpContext.Current.Session[ssname] = (object) val;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
      LinkButton linkButton = (LinkButton) sender;
      if (linkButton.CommandArgument.ToString().Trim().Length <= 0)
        return;
      this.Response.Redirect("Viewcoursereport.aspx?id=" + linkButton.CommandArgument.ToString().Trim());
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
