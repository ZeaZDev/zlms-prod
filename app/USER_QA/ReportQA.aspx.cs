// Decompiled with JetBrains decompiler
// Type: newweb.USER_QA.ReportQA
// Assembly: newweb, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: A2E847A6-10D0-4271-9D59-55F01CDCC8B0
// Assembly location: C:\data\source-20190227T061536Z-001\source\lms\lms\bin\newweb.dll

using System;
using System.Drawing;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace newweb.USER_QA
{
  public class ReportQA : Page
  {
    protected HtmlGenericControl rpBody;
    protected GridView gvDP;
    protected HtmlGenericControl rpFooter;
    protected SqlDataSource sqlDP;

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
      catch (Exception ex)
      {
        string message = ex.Message;
      }
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
      if (e.Row.RowType != DataControlRowType.DataRow)
        return;
      if (e.Row.Cells[3].Text == "ไม่พบข้อมูล")
        e.Row.Cells[3].ForeColor = Color.Red;
      else
        e.Row.Cells[3].ForeColor = Color.Green;
      if (e.Row.Cells[2].Text == "ไม่พบข้อมูล")
        e.Row.Cells[2].ForeColor = Color.Red;
      else
        e.Row.Cells[2].ForeColor = Color.Green;
    }
  }
}
