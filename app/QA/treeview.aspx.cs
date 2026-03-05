// Decompiled with JetBrains decompiler
// Type: newweb.QA.treeview
// Assembly: newweb, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: A2E847A6-10D0-4271-9D59-55F01CDCC8B0
// Assembly location: C:\data\source-20190227T061536Z-001\source\lms\lms\bin\newweb.dll

using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace newweb.QA
{
  public class treeview : Page
  {
    protected DevExpress.Web.ASPxTreeList.ASPxTreeList treeList;
    protected SqlDataSource sqlDP;

    protected void Page_Load(object sender, EventArgs e)
    {
      if (this.IsPostBack)
        return;
      this.treeList.DataBind();
      this.treeList.ExpandToLevel(1);
    }
  }
}
