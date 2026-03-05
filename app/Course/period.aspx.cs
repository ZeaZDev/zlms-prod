// Decompiled with JetBrains decompiler
// Type: newweb.Course.period
// Assembly: newweb, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: A2E847A6-10D0-4271-9D59-55F01CDCC8B0
// Assembly location: C:\data\source-20190227T061536Z-001\source\lms\lms\bin\newweb.dll

using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace newweb.Course
{
  public class period : Page
  {
    protected HyperLink hyperlink1;
    protected HyperLink hyperlink2;
    protected Label Name;
    protected Label Desp;
    protected Label Course_name;
    protected Label ClassName;
    protected Label Coursename;
    protected GridView gvDP;
    protected SqlDataSource sqlDP;
    protected DropDownList Action_type;
    protected HtmlInputText txtNName;
    protected HtmlInputText txtFullname;
    protected HtmlInputText Text1;
    protected Button bnAdduser;

    protected void ShowMessage(string Message, period.MessageType type)
    {
      ScriptManager.RegisterStartupScript((Page) this, this.GetType(), Guid.NewGuid().ToString(), "ShowMessage('" + Message + "','" + (object) type + "');", true);
    }

    protected void Page_Load(object sender, EventArgs e)
    {
      if (this.IsPostBack)
        return;
      this.ADD_COM_CODE();
      try
      {
        string classid = this.Request["ID"].ToString();
        this.sqlDP.SelectParameters[0].DefaultValue = classid;
        this.sqlDP.DataBind();
        this.coursename(classid);
        try
        {
          this.gvDP.DataBind();
        }
        catch
        {
        }
      }
      catch
      {
        this.Response.Redirect("default.aspx");
      }
    }

    public void ADD_COM_CODE()
    {
      SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
      connection.Open();
      string cmdText = "SELECT ClassItemType  FROM [ClassItemType] where Active='1'";
      SqlCommand sqlCommand = new SqlCommand(cmdText, connection);
      sqlCommand.CommandText = cmdText;
      SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
      this.Action_type.Items.Clear();
      if (sqlDataReader.HasRows)
      {
        while (sqlDataReader.Read())
          this.Action_type.Items.Add(sqlDataReader.GetValue(0).ToString());
      }
      sqlDataReader.Close();
      sqlCommand.Dispose();
      connection.Close();
    }

    protected void Button5_Click(object sender, EventArgs e)
    {
      LinkButton linkButton = (LinkButton) sender;
      if (linkButton.CommandArgument.ToString().Trim().Length <= 0)
        return;
      this.Response.Redirect("Viewresult.aspx?id=" + linkButton.CommandArgument.ToString().Trim());
    }

    public void coursename(string classid)
    {
      SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
      connection.Open();
      string cmdText = "select pr.PeriodName,pr.PeriodDesp,c.CourseName,cl.ClassName,cl.id,c.id from [Period] pr inner join Class cl on cl.id=pr.ClassID inner join Course C on c.id=cl.CourseID where pr.id=@id";
      SqlCommand sqlCommand = new SqlCommand(cmdText, connection);
      sqlCommand.CommandText = cmdText;
      sqlCommand.Parameters.AddWithValue("@id", (object) classid);
      SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
      if (sqlDataReader.HasRows)
      {
        sqlDataReader.Read();
        this.Name.Text = sqlDataReader.GetValue(0).ToString();
        this.Desp.Text = sqlDataReader.GetValue(1).ToString();
        this.Course_name.Text = sqlDataReader.GetValue(2).ToString();
        this.Coursename.Text = sqlDataReader.GetValue(0).ToString();
        this.ClassName.Text = sqlDataReader.GetValue(3).ToString();
        this.hyperlink1.NavigateUrl = "Coursedetail.aspx?id=" + sqlDataReader.GetValue(5).ToString();
        this.hyperlink2.NavigateUrl = "class.aspx?id=" + sqlDataReader.GetValue(4).ToString();
      }
      sqlDataReader.Close();
      sqlCommand.Dispose();
      connection.Close();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
      LinkButton linkButton = (LinkButton) sender;
      if (linkButton.CommandArgument.ToString().Trim().Length <= 0)
        return;
      this.Response.Redirect("classitem_edit.aspx?id=" + linkButton.CommandArgument.ToString().Trim());
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
      LinkButton linkButton = (LinkButton) sender;
      if (linkButton.CommandArgument.ToString().Trim().Length <= 0)
        return;
      this.Response.Redirect("classitemupload.aspx?id=" + linkButton.CommandArgument.ToString().Trim());
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
      LinkButton linkButton = (LinkButton) sender;
      if (linkButton.CommandArgument.ToString().Trim().Length <= 0)
        return;
      this.Response.Redirect("Question.aspx?id=" + linkButton.CommandArgument.ToString().Trim());
    }

    protected void gvDP_RowDataBound(object sender, GridViewRowEventArgs e)
    {
      if (e.Row.RowType != DataControlRowType.DataRow)
        return;
      if (this.Server.HtmlDecode(e.Row.Cells[2].Text.Trim()).Equals("Pretest") || this.Server.HtmlDecode(e.Row.Cells[2].Text.Trim()).Equals("Posttest") || this.Server.HtmlDecode(e.Row.Cells[2].Text.Trim()).Equals("Exam"))
        e.Row.FindControl("QUESTION").Visible = true;
      if (!this.Server.HtmlDecode(e.Row.Cells[2].Text.Trim()).Equals("Video"))
        return;
      e.Row.FindControl("Youtube").Visible = true;
    }

    public void delete_course(string id)
    {
      try
      {
        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
        connection.Open();
        string cmdText = "update ClassItem set active='0' where id=@id";
        SqlCommand sqlCommand = new SqlCommand(cmdText, connection);
        sqlCommand.CommandText = cmdText;
        sqlCommand.Parameters.AddWithValue("@id", (object) int.Parse(id));
        sqlCommand.ExecuteNonQuery();
        sqlCommand.Dispose();
        connection.Close();
      }
      catch
      {
      }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
      LinkButton linkButton = (LinkButton) sender;
      if (linkButton.CommandArgument.ToString().Trim().Length <= 0)
        return;
      this.delete_course(linkButton.CommandArgument.ToString().Trim());
      this.sqlDP.DataBind();
      try
      {
        this.gvDP.DataBind();
      }
      catch
      {
      }
    }

    [WebMethod(EnableSession = true)]
    public static void SetSession(string ssname, string val)
    {
      HttpContext.Current.Session[ssname] = (object) val;
    }

    protected void bnAdduser_Click(object sender, EventArgs e)
    {
      ScriptManager.RegisterStartupScript((Page) this, this.GetType(), "Pop", "openModal();", true);
      if (this.txtNName.Value == "" || this.txtFullname.Value == "")
      {
        this.ShowMessage("Class Item Name and Class Item Desption can not be blank", period.MessageType.Error);
      }
      else
      {
        this.addUser(this.txtNName.Value, this.txtFullname.Value);
        this.ShowMessage("Class Item Name " + this.txtNName.Value + " is added", period.MessageType.Success);
        this.sqlDP.DataBind();
        this.gvDP.DataBind();
        this.clearAddnew();
      }
    }

    private void clearAddnew()
    {
      this.txtNName.Value = "";
      this.txtFullname.Value = "";
    }

    public string search_actiontype(string actiontype)
    {
      string str = "";
      SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
      connection.Open();
      string cmdText = "SELECT ID  FROM ClassItemType where ClassItemType=@actiontype";
      SqlCommand sqlCommand = new SqlCommand(cmdText, connection);
      sqlCommand.CommandText = cmdText;
      sqlCommand.Parameters.AddWithValue("@actiontype", (object) actiontype);
      SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
      if (sqlDataReader.HasRows)
      {
        sqlDataReader.Read();
        str = sqlDataReader.GetValue(0).ToString();
      }
      sqlDataReader.Close();
      sqlCommand.Dispose();
      connection.Close();
      return str;
    }

    private void addUser(string user, string pass)
    {
      CConnect cconnect = new CConnect();
      string str1 = "";
      try
      {
        str1 = this.Request["ID"].ToString();
      }
      catch
      {
      }
      string str2 = this.search_actiontype(this.Action_type.Text);
      string sql = "INSERT INTO ClassItem ([PeriodID],[ClassItemName],[ClassItemDesp],[userid],[CreateDate],[Active],[UpdateDate],[Updateby],[ClassitemtypeID],Totalduaration) VALUES('" + str1 + "','" + this.txtNName.Value + "','" + this.txtFullname.Value + "','1','" + (object) DateTime.Now + "','1','" + (object) DateTime.Now + "','1','" + str2 + "','" + this.Text1.Value + "')";
      cconnect.sqlCmd(sql);
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
