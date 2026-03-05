// Decompiled with JetBrains decompiler
// Type: newweb.Certificate.XtraReport1
// Assembly: newweb, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: A2E847A6-10D0-4271-9D59-55F01CDCC8B0
// Assembly location: C:\data\source-20190227T061536Z-001\source\lms\lms\bin\newweb.dll

using DevExpress.XtraReports.UI;
using System.ComponentModel;

namespace newweb.Certificate
{
  public class XtraReport1 : XtraReport
  {
    private IContainer components;
    private DetailBand Detail;
    private TopMarginBand TopMargin;
    private BottomMarginBand BottomMargin;

    public XtraReport1()
    {
      this.InitializeComponent();
    }

    protected new virtual void Dispose(bool disposing)
    {
      if (disposing && this.components != null)
        this.components.Dispose();
      base.Dispose(disposing);
    }

    private void InitializeComponent()
    {
      this.Detail = new DetailBand();
      this.TopMargin = new TopMarginBand();
      this.BottomMargin = new BottomMarginBand();
      this.EndInit();
    }
  }
}
