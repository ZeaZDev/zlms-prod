// Decompiled with JetBrains decompiler
// Type: newweb.Course.Coursecalenda
// Assembly: newweb, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: A2E847A6-10D0-4271-9D59-55F01CDCC8B0
// Assembly location: C:\data\source-20190227T061536Z-001\source\lms\lms\bin\newweb.dll

using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace newweb.Course
{
  public class Coursecalenda : Page
  {
    protected DevExpress.Web.ASPxScheduler.ASPxScheduler ASPxScheduler1;
    protected SqlDataSource sqlDP;

    protected void Page_Load(object sender, EventArgs e)
    {
      try
      {
        this.sqlDP.SelectParameters[0].DefaultValue = this.Request["ID"].ToString();
        this.sqlDP.DataBind();
      }
      catch
      {
        this.Response.Redirect("default.aspx");
      }
    }

    private void SetupMappings(DevExpress.Web.ASPxScheduler.ASPxScheduler control)
    {
    }
  }
}
