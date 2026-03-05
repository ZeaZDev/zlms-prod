// Decompiled with JetBrains decompiler
// Type: newweb.USERREPORT.GridViewExportUtil
// Assembly: newweb, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: A2E847A6-10D0-4271-9D59-55F01CDCC8B0
// Assembly location: C:\data\source-20190227T061536Z-001\source\lms\lms\bin\newweb.dll

using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace newweb.USERREPORT
{
  public class GridViewExportUtil
  {
    public static void Export1(string fileName, GridView gv)
    {
      HttpContext.Current.Response.Clear();
      HttpContext.Current.Response.AddHeader("content-disposition", string.Format("attachment; filename={0}", (object) fileName));
      HttpContext.Current.Response.ContentType = "application/ms-excel";
      HttpContext.Current.Response.Write("<html xmlns:x=\"urn:schemas-microsoft-com:office:excel\">");
      HttpContext.Current.Response.Write("<head>");
      HttpContext.Current.Response.Write("<META http-equiv=\"Content-Type\" content=\"text/html; charset=utf-     8\">");
      HttpContext.Current.Response.Write("<!--[if gte mso 9]><xml>");
      HttpContext.Current.Response.Write("<x:ExcelWorkbook>");
      HttpContext.Current.Response.Write("<x:ExcelWorksheets>");
      HttpContext.Current.Response.Write("<x:ExcelWorksheet>");
      HttpContext.Current.Response.Write("<x:Name>Report Data</x:Name>");
      HttpContext.Current.Response.Write("<x:WorksheetOptions>");
      HttpContext.Current.Response.Write("<x:Print>");
      HttpContext.Current.Response.Write("<x:ValidPrinterInfo/>");
      HttpContext.Current.Response.Write("</x:Print>");
      HttpContext.Current.Response.Write("</x:WorksheetOptions>");
      HttpContext.Current.Response.Write("</x:ExcelWorksheet>");
      HttpContext.Current.Response.Write("</x:ExcelWorksheets>");
      HttpContext.Current.Response.Write("</x:ExcelWorkbook>");
      HttpContext.Current.Response.Write("</xml>");
      HttpContext.Current.Response.Write("<![endif]--> ");
      using (StringWriter stringWriter = new StringWriter())
      {
        using (HtmlTextWriter writer = new HtmlTextWriter((TextWriter) stringWriter))
        {
          Table table = new Table();
          if (gv.HeaderRow != null)
          {
            GridViewExportUtil.PrepareControlForExport((Control) gv.HeaderRow);
            table.Rows.Add((TableRow) gv.HeaderRow);
          }
          foreach (GridViewRow row in gv.Rows)
          {
            GridViewExportUtil.PrepareControlForExport((Control) row);
            table.Rows.Add((TableRow) row);
          }
          if (gv.FooterRow != null)
          {
            GridViewExportUtil.PrepareControlForExport((Control) gv.FooterRow);
            table.Rows.Add((TableRow) gv.FooterRow);
          }
          writer.Write("\n<body>\n<html>");
          writer.Write("<table width='800' align='center' style='text-align:center'");
          writer.Write("<tr><td colspan='10' align='center'><div align='center' style='text-align:center'>");
          writer.Write("</div></td></tr>");
          writer.Write("<tr><td colspan='10' align='center'><div align='center' style='text-align:center'>");
          table.RenderControl(writer);
          writer.Write("</div></td></tr>");
          writer.Write("<tr><td colspan='10' align='center'><div align='center' style='text-align:center'>");
          new Table() { Rows = { new TableRow() } }.RenderControl(writer);
          writer.Write("</div></td></tr>");
          writer.Write("</table>");
          writer.Write("\n</body>\n</html>");
          HttpContext.Current.Response.Write("<style> .textmode {mso-number-format:General} </style>");
          HttpContext.Current.Response.Write(stringWriter.ToString());
          HttpContext.Current.Response.End();
        }
      }
    }

    private static void PrepareControlForExport(Control control)
    {
      for (int index = 0; index < control.Controls.Count; ++index)
      {
        Control control1 = control.Controls[index];
        if (control1 is LinkButton)
        {
          control.Controls.Remove(control1);
          control.Controls.AddAt(index, (Control) new LiteralControl((control1 as LinkButton).Text));
        }
        else if (control1 is ImageButton)
        {
          control.Controls.Remove(control1);
          control.Controls.AddAt(index, (Control) new LiteralControl((control1 as ImageButton).AlternateText));
        }
        else if (control1 is HyperLink)
        {
          control.Controls.Remove(control1);
          control.Controls.AddAt(index, (Control) new LiteralControl((control1 as HyperLink).Text));
        }
        else if (control1 is DropDownList)
        {
          control.Controls.Remove(control1);
          control.Controls.AddAt(index, (Control) new LiteralControl((control1 as DropDownList).SelectedItem.Text));
        }
        else if (control1 is CheckBox)
        {
          control.Controls.Remove(control1);
          control.Controls.AddAt(index, (Control) new LiteralControl((control1 as CheckBox).Checked ? "True" : "False"));
        }
        if (control1.HasControls())
          GridViewExportUtil.PrepareControlForExport(control1);
      }
    }
  }
}
