// Decompiled with JetBrains decompiler
// Type: newweb.Course_user.Course_enroll
// Assembly: newweb, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: A2E847A6-10D0-4271-9D59-55F01CDCC8B0
// Assembly location: C:\data\source-20190227T061536Z-001\source\lms\lms\bin\newweb.dll

using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace newweb.Course_user
{
  public class Course_enroll : Page
  {
    protected GridView gvDP;
    protected SqlDataSource sqlDP;

    protected void Page_Load(object sender, EventArgs e)
    {
      if (this.IsPostBack)
        return;
      try
      {
        this.sqlDP.SelectParameters[0].DefaultValue = this.Session["IDX"].ToString();
        this.sqlDP.DataBind();
        this.gvDP.DataBind();
      }
      catch
      {
      }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
      LinkButton linkButton = (LinkButton) sender;
      if (linkButton.CommandArgument.ToString().Trim().Length <= 0)
        return;
      this.addUser(linkButton.CommandArgument.ToString());
    }

    private void addUser(string courseid)
    {
      new CConnect().sqlCmd("INSERT INTO [Member_course] ([userid],[courseid],[Createdate],[Active]) VALUES('" + this.Session["IDX"].ToString() + "','" + courseid + "','" + (object) DateTime.Now + "','1')");
    }
  }
}
