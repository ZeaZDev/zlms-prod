// Decompiled with JetBrains decompiler
// Type: newweb.USERREPORT.Viewclassreport
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
  public class Viewclassreport : Page
  {
    protected Button bnExport;
    protected GridView gvDP;
    protected SqlDataSource sqlDP;

    protected void ShowMessage(string Message, Viewclassreport.MessageType type)
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
      }
      catch
      {
        this.Response.Redirect("default.aspx");
      }
    }

    [WebMethod(EnableSession = true)]
    public static void SetSession(string ssname, string val)
    {
      HttpContext.Current.Session[ssname] = (object) val;
    }

    protected void bnExport_Click1(object sender, EventArgs e)
    {
      GridViewExportUtil.Export1("Classreport_" + DateTime.Now.ToString("yyyyMMddHHmm") + ".xls", this.gvDP);
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
