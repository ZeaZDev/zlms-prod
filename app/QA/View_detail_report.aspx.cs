// Decompiled with JetBrains decompiler
// Type: newweb.QA.View_detail_report
// Assembly: newweb, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: A2E847A6-10D0-4271-9D59-55F01CDCC8B0
// Assembly location: C:\data\source-20190227T061536Z-001\source\lms\lms\bin\newweb.dll

using System;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace newweb.QA
{
  public class View_detail_report : Page
  {
    private float total;
    private float total1;
    private float total2;
    protected HtmlGenericControl rpBody;
    protected GridView gvDP;
    protected HtmlGenericControl rpFooter;
    protected SqlDataSource sqlDP;

    protected void Page_Load(object sender, EventArgs e)
    {
      if (this.IsPostBack)
        return;
      this.total = 0.0f;
      this.total1 = 0.0f;
      this.total2 = 0.0f;
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

    protected void Gv_RowDataBound(object sender, GridViewRowEventArgs e)
    {
      try
      {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
          this.total += (float) Convert.ToInt32(e.Row.Cells[4].Text);
          this.total1 += (float) Convert.ToInt32(e.Row.Cells[5].Text);
          this.total2 += (float) Convert.ToInt32(e.Row.Cells[6].Text);
        }
        else
        {
          if (e.Row.RowType != DataControlRowType.Footer)
            return;
          e.Row.Cells[3].Text = "รวมน้ำหนักทั้ง 15 ตัวบ่งชี้";
          e.Row.Cells[4].Text = string.Format("{0:0.##}", (object) this.total);
          e.Row.Cells[5].Text = string.Format("{0:0.##}", (object) this.total1);
          e.Row.Cells[6].Text = string.Format("{0:0.##}", (object) this.total2);
        }
      }
      catch
      {
      }
    }
  }
}
