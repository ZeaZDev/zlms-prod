// Decompiled with JetBrains decompiler
// Type: newweb.Checkservice
// Assembly: newweb, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: A2E847A6-10D0-4271-9D59-55F01CDCC8B0
// Assembly location: C:\data\source-20190227T061536Z-001\source\lms\lms\bin\newweb.dll

using newweb.Police_service;
using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace newweb
{
  public class Checkservice : Page
  {
    protected TextBox TextBox1;
    protected Button Button1;
    protected Label Label1;
    protected Label Label2;
    protected Label Label3;

    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
      Police_webClient policeWebClient = new Police_webClient();
      GET_NAME getName1 = new GET_NAME();
      GET_NAME getName2 = policeWebClient.Check_user(this.TextBox1.Text);
      this.Label1.Text = getName2.NAME;
      this.Label2.Text = getName2.RANK;
      this.Label3.Text = getName2.WORKPLACE;
    }
  }
}
