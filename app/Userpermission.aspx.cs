// Decompiled with JetBrains decompiler
// Type: newweb.Userpermission
// Assembly: newweb, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: F91315E7-117D-4389-A770-FCB23990E577
// Assembly location: C:\inetpub\wwwroot\lms\bin\newweb.dll

using System;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace newweb
{
  public class Userpermission : Page
  {
    protected GridView gvUser;
    protected SqlDataSource sqlUser;
    protected SqlDataSource sqlDetail;
    protected DetailsView dtvUser;
    protected HtmlInputPassword txtNewPass;
    protected Button bnSave;

    protected void ShowMessage(string Message, Userpermission.MessageType type)
    {
      ScriptManager.RegisterStartupScript((Page) this, this.GetType(), Guid.NewGuid().ToString(), "ShowMessage('" + Message + "','" + (object) type + "');", true);
    }

    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
    {
      if (e.Row.RowType != DataControlRowType.DataRow || (e.Row.RowState == (DataControlRowState.Alternate | DataControlRowState.Edit) || e.Row.RowState == DataControlRowState.Edit))
        return;
      Label control = (Label) e.Row.FindControl("LblID");
      control.Text = !(control.Text == "True") ? "Disable" : "Enable";
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
      LinkButton linkButton = (LinkButton) sender;
      if (linkButton.CommandArgument.ToString().Trim().Length <= 0)
        return;
      this.Response.Redirect("selectusergroup.aspx?id=" + linkButton.CommandArgument.ToString().Trim());
    }

    protected void gvUser_SelectedIndexChanged(object sender, EventArgs e)
    {
      this.dtvUser.ChangeMode(DetailsViewMode.ReadOnly);
    }

    protected void dtvUser_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
    {
      this.dtvUser.DataBind();
      this.gvUser.DataBind();
    }

    protected void dtvUser_ItemUpdated1(object sender, DetailsViewDeletedEventArgs e)
    {
      this.dtvUser.DataBind();
      this.gvUser.DataBind();
    }

    protected void bnSave_Click(object sender, EventArgs e)
    {
      if (this.txtNewPass.Value.Length > 0)
      {
        new CConnect().sqlCmd("update Member set PASSWORD='" + this.txtNewPass.Value + "' where username='" + this.Session["mnUser"].ToString() + "'");
        this.Session["mnUser"] = (object) "";
        this.ShowMessage("Password changed", Userpermission.MessageType.Success);
      }
      else
        this.ShowMessage("No password change", Userpermission.MessageType.Warning);
    }

    [WebMethod(EnableSession = true)]
    public static void SetSession(string ssname, string val)
    {
      HttpContext.Current.Session[ssname] = (object) val;
    }

    public enum MessageType
    {
      Success,
      Error,
      Info,
      Warning,
    }
  }
}
