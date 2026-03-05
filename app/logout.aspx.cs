// Decompiled with JetBrains decompiler
// Type: newweb.logout
// Assembly: newweb, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: A2E847A6-10D0-4271-9D59-55F01CDCC8B0
// Assembly location: C:\data\source-20190227T061536Z-001\source\lms\lms\bin\newweb.dll

using System;
using System.Web.UI;

namespace newweb
{
  public class logout : Page
  {
    private void initSession()
    {
      this.Session.Clear();
      this.Session.Abandon();
      this.Response.Redirect("default.aspx");
    }

    protected void Page_Load(object sender, EventArgs e)
    {
      this.initSession();
      this.Response.Redirect("Login.aspx");
    }
  }
}
