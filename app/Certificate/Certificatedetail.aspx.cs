// Decompiled with JetBrains decompiler
// Type: newweb.Certificate.Certificatedetail
// Assembly: newweb, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: A2E847A6-10D0-4271-9D59-55F01CDCC8B0
// Assembly location: C:\data\source-20190227T061536Z-001\source\lms\lms\bin\newweb.dll

using DevExpress.XtraReports.Web;
using System;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace newweb.Certificate
{
  public class Certificatedetail : Page
  {
    protected HyperLink HyperLink1;
    protected ASPxDocumentViewer ASPxDocumentViewer1;

    protected void Page_Load(object sender, EventArgs e)
    {
      string message;
      try
      {
        message = this.Request["ID"].ToString();
        string str = HttpContext.Current.Server.MapPath("~/Cerfile/");
        if (message != "")
        {
          string path = str + message;
          if (!Directory.Exists(path))
          {
            Directory.CreateDirectory(path);
            File.Copy(str + "DEBIT.repx", str + message + "\\DEBIT.repx");
          }
        }
      }
      catch (Exception ex)
      {
        message = ex.Message;
      }
      this.HyperLink1.NavigateUrl = "Certificate_adjust.aspx?id=" + message;
    }
  }
}
