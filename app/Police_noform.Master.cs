// Decompiled with JetBrains decompiler
// Type: newweb.Police_noform
// Assembly: newweb, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: A2E847A6-10D0-4271-9D59-55F01CDCC8B0
// Assembly location: C:\data\source-20190227T061536Z-001\source\lms\lms\bin\newweb.dll

using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace newweb
{
  public class Police_noform : MasterPage
  {
    protected ContentPlaceHolder head;
    protected ContentPlaceHolder body;

    protected void Page_Load(object sender, EventArgs e)
    {
    }

    public string getuser()
    {
      string str = "";
      if (this.Session["SessionID"] != null)
        str = this.Session["FULLNAME"].ToString();
      return str;
    }
  }
}
