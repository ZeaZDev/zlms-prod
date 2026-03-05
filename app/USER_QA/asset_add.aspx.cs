// Decompiled with JetBrains decompiler
// Type: newweb.USER_QA.asset_add
// Assembly: newweb, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: A2E847A6-10D0-4271-9D59-55F01CDCC8B0
// Assembly location: C:\data\source-20190227T061536Z-001\source\lms\lms\bin\newweb.dll

using System;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace newweb.USER_QA
{
  public class asset_add : Page
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

    protected void Button4_Click(object sender, EventArgs e)
    {
      LinkButton linkButton = (LinkButton) sender;
      if (linkButton.CommandArgument.ToString().Trim().Length <= 0)
        return;
      this.Response.Redirect("asset_detail_add.aspx?id=" + linkButton.CommandArgument.ToString().Trim());
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
      LinkButton linkButton = (LinkButton) sender;
      if (linkButton.CommandArgument.ToString().Trim().Length <= 0)
        return;
      this.Response.Redirect("resultupload.aspx?id=" + linkButton.CommandArgument.ToString().Trim());
    }

    protected void gv1_PreRender(object sender, EventArgs e)
    {
      this.MergeGridviewRows(this.gvDP);
    }

    private void MergeGridviewRows(GridView gridView)
    {
      for (int index = gridView.Rows.Count - 2; index >= 0; --index)
      {
        GridViewRow row1 = gridView.Rows[index];
        GridViewRow row2 = gridView.Rows[index + 1];
        if (row1.Cells[0].Text == row2.Cells[0].Text)
        {
          row1.Cells[0].RowSpan = row2.Cells[0].RowSpan < 2 ? 2 : row2.Cells[0].RowSpan + 1;
          row2.Cells[0].Visible = false;
        }
        if (row1.Cells[1].Text == row2.Cells[1].Text)
        {
          row1.Cells[1].RowSpan = row2.Cells[1].RowSpan < 2 ? 2 : row2.Cells[1].RowSpan + 1;
          row2.Cells[1].Visible = false;
        }
        if (row1.Cells[2].Text == row2.Cells[2].Text)
        {
          row1.Cells[2].RowSpan = row2.Cells[2].RowSpan < 2 ? 2 : row2.Cells[2].RowSpan + 1;
          row2.Cells[2].Visible = false;
        }
      }
    }
  }
}
