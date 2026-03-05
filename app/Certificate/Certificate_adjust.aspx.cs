// Decompiled with JetBrains decompiler
// Type: newweb.Certificate.Certificate_adjust
// Assembly: newweb, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: A2E847A6-10D0-4271-9D59-55F01CDCC8B0
// Assembly location: C:\data\source-20190227T061536Z-001\source\lms\lms\bin\newweb.dll

using DevExpress.Web;
using DevExpress.XtraReports.UI;
using DevExpress.XtraReports.Web;
using System;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;

namespace newweb.Certificate
{
  public class Certificate_adjust : Page
  {
    protected HtmlHead Head1;
    protected HtmlForm form1;
    protected ASPxReportDesigner reportDesigner;
    protected ASPxButton btExportReport;

    protected void Page_Load(object sender, EventArgs e)
    {
      if (this.IsPostBack)
        return;
      try
      {
        string str1 = this.Request["ID"].ToString();
        string str2 = HttpContext.Current.Server.MapPath("~/Cerfile/");
        if (!(str1 != "") || !Directory.Exists(str2 + str1))
          return;
        this.reportDesigner.OpenReport(XtraReport.FromFile(str2 + str1 + "\\DEBIT.repx", true));
      }
      catch (Exception ex)
      {
        string message = ex.Message;
      }
    }

    protected void reportDesigner_SaveReportLayout(object sender, SaveReportLayoutEventArgs e)
    {
    }

    protected void btExportReport_Click(object sender, EventArgs e)
    {
      byte[] numArray = (byte[]) this.Session["ReportStorage"];
      if (numArray == null)
        return;
      this.Session["ReportStorage"] = (object) null;
      string str1 = "";
      try
      {
        str1 = this.Request["ID"].ToString();
      }
      catch
      {
      }
      string str2 = HttpContext.Current.Server.MapPath("~/Cerfile/");
      if (str1 != "")
      {
        string path = str2 + str1;
        if (!Directory.Exists(path))
          Directory.CreateDirectory(path);
      }
      string path1 = str2 + str1 + "\\DEBIT.repx";
      if (File.Exists(path1))
        File.Delete(path1);
      File.WriteAllBytes(path1, numArray);
      this.Response.Clear();
      this.Response.Redirect("Certificatedetail.aspx?id=" + str1);
      this.Response.Buffer = false;
      this.Response.BinaryWrite(numArray);
      this.Response.End();
    }
  }
}
