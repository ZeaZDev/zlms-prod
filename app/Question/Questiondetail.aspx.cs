// Decompiled with JetBrains decompiler
// Type: newweb.Question.Questiondetail
// Assembly: newweb, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: A2E847A6-10D0-4271-9D59-55F01CDCC8B0
// Assembly location: C:\data\source-20190227T061536Z-001\source\lms\lms\bin\newweb.dll

using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Globalization;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace newweb.Question
{
  public class Questiondetail : Page
  {
    protected GridView GridView1;
    protected SqlDataSource SqlDataSource1;
    protected GridView gvDP;
    protected SqlDataSource sqlDP;
    protected HtmlTextArea txtNName;
    protected DropDownList DropDownList4;
    protected DropDownList DropDownList1;
    protected DropDownList DropDownList2;
    protected DropDownList DropDownList3;
    protected Button bnAdduser;
    protected HtmlInputText Text1;
    protected Button Button1;

    protected void ShowMessage(string Message, Questiondetail.MessageType type)
    {
      string str = HttpUtility.JavaScriptStringEncode(Message ?? string.Empty);
      ScriptManager.RegisterStartupScript((Page) this, this.GetType(), Guid.NewGuid().ToString(), "ShowMessage('" + str + "','" + (object) type + "');", true);
    }

    private static int ParseRequiredInt(string value, string paramName)
    {
      int result;
      if (!int.TryParse(value, NumberStyles.Integer, CultureInfo.InvariantCulture, out result))
        throw new ArgumentException("Invalid integer value", paramName);
      return result;
    }

    protected void Page_Load(object sender, EventArgs e)
    {
      if (this.IsPostBack)
        return;
      try
      {
        string id = this.Request["ID"].ToString();
        this.sqlDP.SelectParameters[0].DefaultValue = id;
        this.sqlDP.DataBind();
        this.SqlDataSource1.SelectParameters[0].DefaultValue = id;
        this.SqlDataSource1.DataBind();
        this.ADD_COM_CODE(id);
        this.ADDpercent();
        this.ADDscore();
        this.ADD_questiontypename();
        try
        {
          this.gvDP.DataBind();
          this.GridView1.DataBind();
        }
        catch (Exception ex)
        {
          string message = ex.Message;
        }
      }
      catch
      {
      }
    }

    public void ADDpercent()
    {
      this.DropDownList1.Items.Clear();
      for (int index = 0; index < 9; ++index)
        this.DropDownList1.Items.Add((10 - index).ToString());
    }

    public void ADDscore()
    {
      this.DropDownList3.Items.Clear();
      for (int index = 1; index < 10; ++index)
        this.DropDownList3.Items.Add(index.ToString());
    }

    public void ADD_questiontypename()
    {
      SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
      connection.Open();
      string cmdText = "SELECT [id],[questiontypename]  FROM [QuestionType]";
      SqlCommand sqlCommand = new SqlCommand(cmdText, connection);
      sqlCommand.CommandText = cmdText;
      SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
      this.DropDownList2.Items.Clear();
      if (sqlDataReader.HasRows)
      {
        while (sqlDataReader.Read())
          this.DropDownList2.Items.Add(sqlDataReader.GetValue(0).ToString() + "," + sqlDataReader.GetValue(1).ToString());
      }
      sqlDataReader.Close();
      sqlCommand.Dispose();
      connection.Close();
    }

    public void ADD_COM_CODE(string id)
    {
      SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
      connection.Open();
      string cmdText = "SELECT [id],[QuestiongroupName]  FROM [Questiongroup] where Active='1' and Questionid=@Questionid ";
      SqlCommand sqlCommand = new SqlCommand(cmdText, connection);
      sqlCommand.CommandText = cmdText;
      sqlCommand.Parameters.AddWithValue("@Questionid", (object) int.Parse(id));
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

    public void delete_questiongroup(string id)
    {
      try
      {
        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
        connection.Open();
        string cmdText = "update [Questiongroup] set active='0' where id=@id";
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

    protected void Button1_Click(object sender, EventArgs e)
    {
      LinkButton linkButton = (LinkButton) sender;
      if (linkButton.CommandArgument.ToString().Trim().Length <= 0)
        return;
      this.Response.Redirect("Questiongroup_edit.aspx?id=" + linkButton.CommandArgument.ToString().Trim());
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
      string id = "";
      try
      {
        id = this.Request["ID"].ToString();
      }
      catch
      {
      }
      LinkButton linkButton = (LinkButton) sender;
      if (linkButton.CommandArgument.ToString().Trim().Length <= 0)
        return;
      this.delete_questiongroup(linkButton.CommandArgument.ToString().Trim());
      this.SqlDataSource1.DataBind();
      try
      {
        this.GridView1.DataBind();
        this.ADD_COM_CODE(id);
      }
      catch
      {
      }
    }

    public void delete_course(string id)
    {
      try
      {
        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
        connection.Open();
        string cmdText = "update [Question_detail] set Active='0' where id=@id";
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

    protected void bnAddgroup_Click(object sender, EventArgs e)
    {
      ScriptManager.RegisterStartupScript((Page) this, this.GetType(), "Pop", "openModal();", true);
      if (this.Text1.Value == "")
      {
        this.ShowMessage("Quesstion Group can not be blank", Questiondetail.MessageType.Error);
      }
      else
      {
        this.addGroup(this.Text1.Value);
        this.ShowMessage("Quesstion Group  " + this.Text1.Value + " is added", Questiondetail.MessageType.Success);
        this.Text1.Value = "";
      }
    }

    private void addGroup(string user)
    {
      string id = "";
      try
      {
        id = this.Request["ID"].ToString();
      }
      catch
      {
      }
      int requiredInt = Questiondetail.ParseRequiredInt(id, "ID");
      SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
      connection.Open();
      string cmdText = "INSERT INTO [Questiongroup] ([Questionid],[QuestiongroupName],[Active],[Createdate],[Createby]) VALUES(@Questionid,@QuestiongroupName,'1',@Createdate,'1')";
      SqlCommand sqlCommand = new SqlCommand(cmdText, connection);
      sqlCommand.CommandText = cmdText;
      sqlCommand.Parameters.AddWithValue("@Questionid", (object) requiredInt);
      sqlCommand.Parameters.AddWithValue("@QuestiongroupName", (object) user);
      sqlCommand.Parameters.AddWithValue("@Createdate", (object) DateTime.Now);
      sqlCommand.ExecuteNonQuery();
      sqlCommand.Dispose();
      connection.Close();
      this.SqlDataSource1.DataBind();
      try
      {
        this.GridView1.DataBind();
        this.ADD_COM_CODE(id);
      }
      catch
      {
      }
    }

    protected void bnAdduser_Click(object sender, EventArgs e)
    {
      ScriptManager.RegisterStartupScript((Page) this, this.GetType(), "Pop", "openModal();", true);
      if (this.txtNName.Value == "")
      {
        this.ShowMessage("Quesstion Name  can not be blank", Questiondetail.MessageType.Error);
      }
      else
      {
        this.addUser(this.txtNName.Value);
        this.ShowMessage("Quesstion Name  " + this.txtNName.Value + " is added", Questiondetail.MessageType.Success);
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
      string str1 = "";
      string str2 = "";
      string str3 = "1";
      int length1 = this.DropDownList4.Text.IndexOf(",");
      if (length1 != -1)
        str1 = this.DropDownList4.Text.Substring(0, length1);
      int length2 = this.DropDownList2.Text.IndexOf(",");
      if (length2 != -1)
        str2 = this.DropDownList2.Text.Substring(0, length2);
      string str4 = "";
      try
      {
        str4 = this.Request["ID"].ToString();
      }
      catch
      {
      }
      str3 = this.search_actiontype(this.DropDownList3.Text);
      int requiredInt1 = Questiondetail.ParseRequiredInt(str4, "ID");
      int requiredInt2 = Questiondetail.ParseRequiredInt(str2, "QuestionType");
      int requiredInt3 = Questiondetail.ParseRequiredInt(str1, "QuestionGroup");
      int requiredInt4 = Questiondetail.ParseRequiredInt(this.DropDownList1.Text, "QuestionDiff");
      int requiredInt5 = Questiondetail.ParseRequiredInt(this.DropDownList3.Text, "QuestionWeight");
      SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
      connection.Open();
      string cmdText = "INSERT INTO [Question_detail] ([Question_id],[Question_detail],[Question_type],[Question_group],[Question_diff],[Question_weight]) VALUES(@QuestionId,@QuestionDetail,@QuestionType,@QuestionGroup,@QuestionDiff,@QuestionWeight)";
      SqlCommand sqlCommand = new SqlCommand(cmdText, connection);
      sqlCommand.CommandText = cmdText;
      sqlCommand.Parameters.AddWithValue("@QuestionId", (object) requiredInt1);
      sqlCommand.Parameters.AddWithValue("@QuestionDetail", (object) user);
      sqlCommand.Parameters.AddWithValue("@QuestionType", (object) requiredInt2);
      sqlCommand.Parameters.AddWithValue("@QuestionGroup", (object) requiredInt3);
      sqlCommand.Parameters.AddWithValue("@QuestionDiff", (object) requiredInt4);
      sqlCommand.Parameters.AddWithValue("@QuestionWeight", (object) requiredInt5);
      sqlCommand.ExecuteNonQuery();
      sqlCommand.Dispose();
      connection.Close();
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
