// Decompiled with JetBrains decompiler
// Type: newweb.Question._default
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

namespace newweb.Question
{
  public class _default : Page
  {
    protected GridView gvDP;
    protected SqlDataSource sqlDP;
    protected HtmlInputText txtNName;
    protected DropDownList DropDownList4;
    protected DropDownList DropDownList3;
    protected DropDownList DropDownList2;
    protected DropDownList DropDownList1;
    protected CheckBox CheckBox1;
    protected CheckBox CheckBox2;
    protected CheckBox CheckBox3;
    protected Button bnAdduser;

    protected void ShowMessage(string Message, _default.MessageType type)
    {
      ScriptManager.RegisterStartupScript((Page) this, this.GetType(), Guid.NewGuid().ToString(), "ShowMessage('" + Message + "','" + (object) type + "');", true);
    }

    protected void Page_Load(object sender, EventArgs e)
    {
      if (this.IsPostBack)
        return;
      this.ADDpercent();
      this.ADD_classtype();
      this.DropDownList2.Items.Clear();
      this.DropDownList2.Items.Add("ปรนัย");
      this.DropDownList2.Items.Add("อัตนัย");
      this.ADD_COM_CODE();
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
      if (e.Row.RowType != DataControlRowType.Header)
        return;
      e.Row.TableSection = TableRowSection.TableHeader;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
      LinkButton linkButton = (LinkButton) sender;
      if (linkButton.CommandArgument.ToString().Trim().Length <= 0)
        return;
      this.Response.Redirect("Question_edit.aspx?id=" + linkButton.CommandArgument.ToString().Trim());
    }

    public void ADD_classtype()
    {
      SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
      connection.Open();
      string cmdText = "SELECT ClassItemType  FROM [ClassItemType] where Active='1'";
      SqlCommand sqlCommand = new SqlCommand(cmdText, connection);
      sqlCommand.CommandText = cmdText;
      SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
      this.DropDownList3.Items.Clear();
      if (sqlDataReader.HasRows)
      {
        while (sqlDataReader.Read())
          this.DropDownList3.Items.Add(sqlDataReader.GetValue(0).ToString());
      }
      sqlDataReader.Close();
      sqlCommand.Dispose();
      connection.Close();
    }

    public void ADDpercent()
    {
      int num = 100;
      this.DropDownList1.Items.Clear();
      for (int index = 0; index < 10; ++index)
      {
        num -= index * 5;
        this.DropDownList1.Items.Add(num.ToString());
      }
    }

    public void ADD_COM_CODE()
    {
      SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
      connection.Open();
      string cmdText = "SELECT [id],[CourseName]  FROM [Course] where Active='1'";
      SqlCommand sqlCommand = new SqlCommand(cmdText, connection);
      sqlCommand.CommandText = cmdText;
      SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
      this.DropDownList4.Items.Clear();
      if (sqlDataReader.HasRows)
      {
        while (sqlDataReader.Read())
          this.DropDownList4.Items.Add(sqlDataReader.GetValue(0).ToString() + "," + sqlDataReader.GetValue(1).ToString());
      }
      sqlDataReader.Close();
      sqlCommand.Dispose();
      connection.Close();
    }

    public void delete_course(string id)
    {
      try
      {
        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
        connection.Open();
        string cmdText = "update [Question] set active='0' where id=@id";
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
      if (this.txtNName.Value == "")
      {
        this.ShowMessage("Quesstion Name  can not be blank", _default.MessageType.Error);
      }
      else
      {
        this.addUser(this.txtNName.Value);
        this.ShowMessage("Quesstion Name  " + this.txtNName.Value + " is added", _default.MessageType.Success);
        this.sqlDP.DataBind();
        this.gvDP.DataBind();
        this.clearAddnew();
      }
    }

    private void clearAddnew()
    {
      this.txtNName.Value = "";
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

    private void addUser(string user)
    {
      CConnect cconnect = new CConnect();
      string str1 = "";
      int length = this.DropDownList4.Text.IndexOf(",");
      if (length != -1)
        str1 = this.DropDownList4.Text.Substring(0, length);
      string str2 = !(this.DropDownList2.Text == "ปรนัย") ? "2" : "1";
      string str3 = "0";
      if (this.CheckBox1.Checked)
        str3 = "1";
      string str4 = "0";
      if (this.CheckBox2.Checked)
        str4 = "1";
      string str5 = "0";
      if (this.CheckBox3.Checked)
        str5 = "1";
      string str6 = this.search_actiontype(this.DropDownList3.Text);
      string sql = "INSERT INTO [Question] ([Courseid],[Periodtype],[Question_type],[Question_name],[QuestionPass],[Active],[Create_date],[Create_by],[Isshuffle],[Isview],[Isresult]) VALUES('" + str1 + "','" + str6 + "','" + str2 + "','" + user + "','" + this.DropDownList1.Text + "','1','" + (object) DateTime.Now + "','1','" + str3 + "','" + str4 + "','" + str5 + "')";
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
