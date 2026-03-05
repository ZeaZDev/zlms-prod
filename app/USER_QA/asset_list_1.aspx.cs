// Decompiled with JetBrains decompiler
// Type: newweb.USER_QA.asset_list_1
// Assembly: newweb, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: A2E847A6-10D0-4271-9D59-55F01CDCC8B0
// Assembly location: C:\data\source-20190227T061536Z-001\source\lms\lms\bin\newweb.dll

using System;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace newweb.USER_QA
{
  public class asset_list_1 : Page
  {
    private float total;
    private float total1;
    protected HyperLink hyperlink1;
    protected Label Label3;
    protected Label Label4;
    protected TextBox TextBox2;
    protected Label Label5;
    protected TextBox TextBox1;
    protected Button Button2;
    protected Label Label7;
    protected TextBox TextBox8;
    protected HtmlGenericControl group7_1;
    protected TextBox TextBox3;
    protected Label Label2;
    protected TextBox TextBox5;
    protected TextBox TextBox4;
    protected Button Button5;
    protected HtmlGenericControl group8_1;
    protected TextBox TextBox11;
    protected Label Label9;
    protected TextBox TextBox12;
    protected TextBox TextBox13;
    protected TextBox TextBox14;
    protected Button Button10;
    protected HtmlGenericControl group5_1;
    protected Label Label6;
    protected TextBox TextBox9;
    protected TextBox TextBox10;
    protected Button Button8;
    protected HtmlGenericControl group2;
    protected TextBox TextBox15;
    protected TextBox TextBox16;
    protected TextBox TextBox17;
    protected Button Button11;
    protected GridView GridView6;
    protected SqlDataSource SqlDataSource6;
    protected HtmlGenericControl group4;
    protected TextBox TextBox6;
    protected TextBox TextBox7;
    protected Button Button6;
    protected GridView GridView3;
    protected SqlDataSource SqlDataSource3;
    protected HtmlGenericControl group1;
    protected DropDownList DropDownList2;
    protected HtmlInputText txtNName;
    protected HtmlInputText Text1;
    protected HtmlInputText Text3;
    protected HtmlInputText Text2;
    protected Button Button1;
    protected GridView gvDP;
    protected SqlDataSource sqlDP;
    protected HtmlGenericControl group5;
    protected HtmlInputText Text7;
    protected HtmlInputText Text8;
    protected HtmlInputText Text9;
    protected FileUpload FileUpload7;
    protected FileUpload FileUpload8;
    protected FileUpload FileUpload9;
    protected HtmlInputText Text10;
    protected Button Button7;
    protected GridView GridView4;
    protected SqlDataSource SqlDataSource4;
    protected HtmlGenericControl group9;
    protected DropDownList DropDownList1;
    protected FileUpload FileUpload1;
    protected Label Label1;
    protected HtmlInputText Text6;
    protected Button Button3;
    protected GridView GridView1;
    protected SqlDataSource SqlDataSource1;
    protected HtmlGenericControl group7;
    protected HtmlInputText Text5;
    protected FileUpload FileUpload2;
    protected FileUpload FileUpload3;
    protected FileUpload FileUpload4;
    protected FileUpload FileUpload5;
    protected FileUpload FileUpload6;
    protected HtmlInputText Text4;
    protected Button Button4;
    protected GridView GridView2;
    protected SqlDataSource SqlDataSource2;
    protected HtmlGenericControl group3;
    protected DropDownList DropDownList3;
    protected FileUpload FileUpload10;
    protected FileUpload FileUpload11;
    protected FileUpload FileUpload12;
    protected FileUpload FileUpload13;
    protected FileUpload FileUpload14;
    protected FileUpload FileUpload15;
    protected FileUpload FileUpload16;
    protected HtmlInputText Text12;
    protected Button Button9;
    protected GridView GridView5;
    protected SqlDataSource SqlDataSource5;

    protected void ShowMessage(string Message, asset_list_1.MessageType type)
    {
      ScriptManager.RegisterStartupScript((Page) this, this.GetType(), Guid.NewGuid().ToString(), "ShowMessage('" + Message + "','" + (object) type + "');", true);
    }

    protected void Page_Load(object sender, EventArgs e)
    {
      this.total = 0.0f;
      this.total1 = 0.0f;
      this.Page.Form.Attributes.Add("enctype", "multipart/form-data");
      string text = this.DropDownList1.Text;
      if (this.IsPostBack)
        return;
      try
      {
        string classid = this.Request["ID"].ToString();
        this.group1.Visible = false;
        this.group2.Visible = false;
        this.group9.Visible = false;
        this.group7.Visible = false;
        this.group7_1.Visible = false;
        this.group4.Visible = false;
        this.group5.Visible = false;
        this.group5_1.Visible = false;
        this.group3.Visible = false;
        this.TextBox2.Visible = false;
        this.Label4.Visible = false;
        this.group8_1.Visible = false;
        this.TextBox2.Text = "";
        this.coursename(classid);
        this.coursename1(classid);
        this.ADD_COM_CODE();
        this.ADD_COM_CODE1();
      }
      catch
      {
      }
    }

    private string coursename1(string classid)
    {
      string str = "";
      SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
      connection.Open();
      string cmdText = "select Standard_detail,qi.projectid from [QA_standard_detail] qde  inner join QA_standard qsd on qsd.id=qde.Standardid inner join QA_Indicator qi on qsd.qaindicator=qi.id where qde.id=@id";
      SqlCommand sqlCommand = new SqlCommand(cmdText, connection);
      sqlCommand.CommandText = cmdText;
      sqlCommand.Parameters.AddWithValue("@id", (object) classid);
      SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
      if (sqlDataReader.HasRows)
      {
        sqlDataReader.Read();
        this.Label3.Text = sqlDataReader.GetValue(0).ToString();
        this.hyperlink1.NavigateUrl = "asset_add.aspx?id=" + sqlDataReader.GetValue(1).ToString();
      }
      sqlDataReader.Close();
      sqlCommand.Dispose();
      connection.Close();
      return str;
    }

    private string coursename(string classid)
    {
      string str = "";
      SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
      connection.Open();
      string cmdText = "select [Score] from [QA_result1] where standard_detail_id=@id";
      SqlCommand sqlCommand = new SqlCommand(cmdText, connection);
      sqlCommand.CommandText = cmdText;
      sqlCommand.Parameters.AddWithValue("@id", (object) classid);
      SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
      if (sqlDataReader.HasRows)
      {
        sqlDataReader.Read();
        this.TextBox1.Text = sqlDataReader.GetValue(0).ToString();
      }
      sqlDataReader.Close();
      sqlCommand.Dispose();
      connection.Close();
      return str;
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
      string str = "";
      try
      {
        str = this.Request["ID"].ToString();
        this.checkscore_QA1(str);
      }
      catch
      {
      }
      if (this.checkUser(str) == 0)
        this.addUser(str, this.TextBox1.Text, this.TextBox2.Text, "0");
      else
        this.updateuser(str, this.TextBox1.Text, this.TextBox2.Text, "0");
    }

    private void updateuser(string filename, string scorex1, string scorex2, string dt1)
    {
      CConnect cconnect = new CConnect();
      string s1 = "0";
      string s2 = "0";
      string s3;
      if (this.TextBox2.Text != "" && this.TextBox1.Text != "")
      {
        double num;
        if (double.Parse(this.TextBox1.Text) > 0.1)
        {
          num = double.Parse(scorex1);
          s1 = num.ToString();
        }
        if (double.Parse(this.TextBox2.Text) > 0.1)
        {
          num = double.Parse(scorex2);
          s2 = num.ToString();
        }
        num = (double.Parse(s2) + double.Parse(s1)) / 2.0;
        s3 = num.ToString();
      }
      else
        s3 = !(this.TextBox2.Text != "") ? double.Parse(scorex1).ToString() : double.Parse(scorex2).ToString();
      if (double.Parse(s3) > 5.0)
        s3 = "5";
      string sql = "UPDATE [QA_result1] SET [Score] = '" + s3 + "' WHERE standard_detail_id='" + filename + "'";
      this.TextBox8.Text = s3;
      cconnect.sqlCmd(sql);
    }

    public void delete_course(string id)
    {
      try
      {
        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
        connection.Open();
        string cmdText = "update [QA_main_result] set active='0' where id=@id";
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

    protected void DELETE1_Click(object sender, EventArgs e)
    {
      LinkButton linkButton = (LinkButton) sender;
      if (linkButton.CommandArgument.ToString().Trim().Length <= 0)
        return;
      this.delete_course(linkButton.CommandArgument.ToString().Trim());
      this.SqlDataSource1.DataBind();
      this.GridView1.DataBind();
      this.SqlDataSource2.DataBind();
      this.GridView2.DataBind();
      this.SqlDataSource3.DataBind();
      this.GridView3.DataBind();
      this.SqlDataSource4.DataBind();
      this.GridView4.DataBind();
      this.SqlDataSource5.DataBind();
      this.GridView5.DataBind();
      this.SqlDataSource6.DataBind();
      this.GridView6.DataBind();
    }

    protected void DELETE8_Click(object sender, EventArgs e)
    {
      LinkButton linkButton = (LinkButton) sender;
      if (linkButton.CommandArgument.ToString().Trim().Length <= 0)
        return;
      this.delete_course(linkButton.CommandArgument.ToString().Trim());
      this.SqlDataSource1.DataBind();
      this.GridView1.DataBind();
      this.SqlDataSource2.DataBind();
      this.GridView2.DataBind();
      this.SqlDataSource3.DataBind();
      this.GridView3.DataBind();
      this.SqlDataSource4.DataBind();
      this.GridView4.DataBind();
      this.SqlDataSource5.DataBind();
      this.GridView5.DataBind();
      this.SqlDataSource6.DataBind();
      this.GridView6.DataBind();
    }

    protected void DELETE3_Click(object sender, EventArgs e)
    {
      LinkButton linkButton = (LinkButton) sender;
      if (linkButton.CommandArgument.ToString().Trim().Length <= 0)
        return;
      this.delete_course(linkButton.CommandArgument.ToString().Trim());
      this.SqlDataSource1.DataBind();
      this.GridView1.DataBind();
      this.SqlDataSource2.DataBind();
      this.GridView2.DataBind();
      this.SqlDataSource3.DataBind();
      this.GridView3.DataBind();
      this.SqlDataSource4.DataBind();
      this.GridView4.DataBind();
      this.SqlDataSource5.DataBind();
      this.GridView5.DataBind();
      this.SqlDataSource6.DataBind();
      this.GridView6.DataBind();
    }

    protected void DELETE4_Click(object sender, EventArgs e)
    {
      LinkButton linkButton = (LinkButton) sender;
      if (linkButton.CommandArgument.ToString().Trim().Length <= 0)
        return;
      this.delete_course(linkButton.CommandArgument.ToString().Trim());
      this.SqlDataSource1.DataBind();
      this.GridView1.DataBind();
      this.SqlDataSource2.DataBind();
      this.GridView2.DataBind();
      this.SqlDataSource3.DataBind();
      this.GridView3.DataBind();
      this.SqlDataSource4.DataBind();
      this.GridView4.DataBind();
      this.SqlDataSource5.DataBind();
      this.GridView5.DataBind();
      this.SqlDataSource6.DataBind();
      this.GridView6.DataBind();
    }

    protected void DELETE5_Click(object sender, EventArgs e)
    {
      LinkButton linkButton = (LinkButton) sender;
      if (linkButton.CommandArgument.ToString().Trim().Length <= 0)
        return;
      this.delete_course(linkButton.CommandArgument.ToString().Trim());
      this.SqlDataSource1.DataBind();
      this.GridView1.DataBind();
      this.SqlDataSource2.DataBind();
      this.GridView2.DataBind();
      this.SqlDataSource3.DataBind();
      this.GridView3.DataBind();
      this.SqlDataSource4.DataBind();
      this.GridView4.DataBind();
      this.SqlDataSource5.DataBind();
      this.GridView5.DataBind();
      this.SqlDataSource6.DataBind();
      this.GridView6.DataBind();
    }

    protected void DELETE6_Click(object sender, EventArgs e)
    {
      LinkButton linkButton = (LinkButton) sender;
      if (linkButton.CommandArgument.ToString().Trim().Length <= 0)
        return;
      this.delete_course(linkButton.CommandArgument.ToString().Trim());
      this.SqlDataSource1.DataBind();
      this.GridView1.DataBind();
      this.SqlDataSource2.DataBind();
      this.GridView2.DataBind();
      this.SqlDataSource3.DataBind();
      this.GridView3.DataBind();
      this.SqlDataSource4.DataBind();
      this.GridView4.DataBind();
      this.SqlDataSource5.DataBind();
      this.GridView5.DataBind();
      this.SqlDataSource6.DataBind();
      this.GridView6.DataBind();
    }

    protected void DELETE7_Click(object sender, EventArgs e)
    {
      LinkButton linkButton = (LinkButton) sender;
      if (linkButton.CommandArgument.ToString().Trim().Length <= 0)
        return;
      this.delete_course(linkButton.CommandArgument.ToString().Trim());
      this.SqlDataSource1.DataBind();
      this.GridView1.DataBind();
      this.SqlDataSource2.DataBind();
      this.GridView2.DataBind();
      this.SqlDataSource3.DataBind();
      this.GridView3.DataBind();
      this.SqlDataSource4.DataBind();
      this.GridView4.DataBind();
      this.SqlDataSource5.DataBind();
      this.GridView5.DataBind();
      this.SqlDataSource6.DataBind();
      this.GridView6.DataBind();
    }

    public void delete_course1(string id)
    {
      try
      {
        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
        connection.Open();
        string cmdText = "update [QA_activities] set active='0' where id=@id";
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

    protected void DELETE2_Click(object sender, EventArgs e)
    {
      LinkButton linkButton = (LinkButton) sender;
      if (linkButton.CommandArgument.ToString().Trim().Length <= 0)
        return;
      this.delete_course1(linkButton.CommandArgument.ToString().Trim());
      this.sqlDP.DataBind();
      this.gvDP.DataBind();
    }

    private void addUser(string filename, string scorex1, string scorex2, string dt1)
    {
      CConnect cconnect = new CConnect();
      string s1 = "0";
      string s2 = "0";
      string str;
      if (this.TextBox2.Text != "" && this.TextBox1.Text != "")
      {
        double num;
        if (double.Parse(this.TextBox1.Text) > 0.1)
        {
          num = double.Parse(scorex1);
          s1 = num.ToString();
        }
        if (double.Parse(this.TextBox2.Text) > 0.1)
        {
          num = double.Parse(scorex2);
          s2 = num.ToString();
        }
        num = (double.Parse(s2) + double.Parse(s1)) / 2.0;
        str = num.ToString();
      }
      else
        str = !(this.TextBox2.Text != "") ? double.Parse(scorex1).ToString() : double.Parse(scorex2).ToString();
      this.TextBox8.Text = str;
      string sql = "INSERT INTO QA_result1 ([Projectid],[standard_detail_id],[Score],[Createdate]) VALUES('" + dt1 + "','" + filename + "','" + str + "','" + (object) DateTime.Now + "')";
      cconnect.sqlCmd(sql);
    }

    private int checkUser(string user)
    {
      return int.Parse(new CConnect().sqlCmdReturn("select count(standard_detail_id) from QA_result1 where standard_detail_id='" + user + "'").ToString());
    }

    protected void Button51_Click(object sender, EventArgs e)
    {
      string filex = "";
      string filex2 = "";
      string filex3 = "";
      string str1 = "";
      try
      {
        str1 = this.Request["ID"].ToString();
      }
      catch
      {
      }
      string str2 = HttpContext.Current.Server.MapPath("~/QAFILE/");
      if (str1 != "")
      {
        string path = str2 + str1;
        if (!Directory.Exists(path))
          Directory.CreateDirectory(path);
      }
      if (this.FileUpload7.HasFile)
      {
        try
        {
          this.FileUpload7.SaveAs(str2 + str1 + "\\1_" + this.FileUpload7.FileName);
          filex = "1_" + this.FileUpload7.FileName;
        }
        catch
        {
        }
      }
      if (this.FileUpload8.HasFile)
      {
        try
        {
          this.FileUpload8.SaveAs(str2 + str1 + "\\2_" + this.FileUpload8.FileName);
          filex2 = "2_" + this.FileUpload8.FileName;
        }
        catch
        {
        }
      }
      if (this.FileUpload9.HasFile)
      {
        try
        {
          this.FileUpload9.SaveAs(str2 + str1 + "\\3_" + this.FileUpload9.FileName);
          filex3 = "3_" + this.FileUpload9.FileName;
        }
        catch
        {
        }
      }
      this.insert_qar(this.Text8.Value, this.Text7.Value, this.Text9.Value, filex, this.Text10.Value, filex2, filex3, "", "", "1", "", "", "");
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
      ScriptManager.RegisterStartupScript((Page) this, this.GetType(), "Pop", "openModal();", true);
      if (this.DropDownList2.Text == "อื่นๆ")
      {
        if (this.txtNName.Value == "")
        {
          this.ShowMessage("Activities Name can not be blank", asset_list_1.MessageType.Error);
          return;
        }
        this.addUser(this.txtNName.Value);
      }
      else
        this.addUser(this.DropDownList2.Text);
      this.ShowMessage("Activities is added", asset_list_1.MessageType.Success);
      this.sqlDP.DataBind();
      this.gvDP.DataBind();
      this.clearAddnew();
    }

    private void clearAddnew()
    {
      this.txtNName.Value = "";
      this.Text1.Value = "";
      this.Text2.Value = "";
      this.Text3.Value = "";
    }

    private void addUser(string user)
    {
      CConnect cconnect = new CConnect();
      string str = "";
      try
      {
        str = this.Request["ID"].ToString();
      }
      catch
      {
      }
      string sql = "INSERT INTO [QA_activities] ([projectid],[activities],[Active],[Total],[period],[Createdate],[Score]) VALUES('" + str + "','" + user + "','1','" + this.Text1.Value + "','" + this.Text2.Value + "','" + (object) DateTime.Now + "','" + this.Text3.Value + "')";
      cconnect.sqlCmd(sql);
    }

    protected void checkscore_QA1(string dt1)
    {
      string empty = string.Empty;
      SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
      connection.Open();
      string cmdText = "select sum(convert(int,total)) as totalx,sum(convert(int,score)) as scorex from QA_activities where projectid=@projectid";
      SqlCommand sqlCommand = new SqlCommand(cmdText, connection);
      sqlCommand.CommandText = cmdText;
      sqlCommand.Parameters.AddWithValue("@projectid", (object) dt1);
      SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
      if (sqlDataReader.HasRows)
      {
        sqlDataReader.Read();
        double num1 = double.Parse(sqlDataReader.GetValue(1).ToString());
        double num2 = double.Parse(sqlDataReader.GetValue(0).ToString());
        if (num2 > 0.0)
          this.TextBox2.Text = (num1 / num2 * 5.0).ToString("0.00");
      }
      sqlCommand.Dispose();
      connection.Close();
    }

    private string checkscore_QA7_1(string dt1)
    {
      string str = "";
      string empty = string.Empty;
      SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
      connection.Open();
      string cmdText = "select sum(convert(int,total_project)),sum(convert(int,total_teacher)) from QA_main_Second where Standardid=@projectid";
      SqlCommand sqlCommand = new SqlCommand(cmdText, connection);
      sqlCommand.CommandText = cmdText;
      sqlCommand.Parameters.AddWithValue("@projectid", (object) dt1);
      SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
      if (sqlDataReader.HasRows)
      {
        sqlDataReader.Read();
        this.TextBox5.Text = sqlDataReader.GetValue(1).ToString();
        if (double.Parse(this.TextBox5.Text) > 0.0)
        {
          this.TextBox4.Text = (double.Parse(this.TextBox3.Text) / double.Parse(this.TextBox5.Text) * 100.0).ToString();
          this.TextBox2.Text = (double.Parse(this.TextBox4.Text) * 5.0 / 20.0).ToString();
        }
      }
      sqlCommand.Dispose();
      connection.Close();
      return str;
    }

    protected void checkscore_QA7(string dt1)
    {
      string empty = string.Empty;
      SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
      connection.Open();
      string cmdText = "select count(id) from QA_main_result where Standardid=@projectid and project<>''";
      SqlCommand sqlCommand = new SqlCommand(cmdText, connection);
      sqlCommand.CommandText = cmdText;
      sqlCommand.Parameters.AddWithValue("@projectid", (object) dt1);
      SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
      if (sqlDataReader.HasRows)
      {
        sqlDataReader.Read();
        this.TextBox3.Text = sqlDataReader.GetValue(0).ToString();
      }
      sqlCommand.Dispose();
      connection.Close();
    }

    protected void checkscore_QA8(string dt1)
    {
      string empty = string.Empty;
      SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
      connection.Open();
      string cmdText = "select [total_teacher],[total_admin],[total_support] from QA_main_Second where Standardid=@projectid ";
      SqlCommand sqlCommand = new SqlCommand(cmdText, connection);
      sqlCommand.CommandText = cmdText;
      sqlCommand.Parameters.AddWithValue("@projectid", (object) dt1);
      SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
      if (sqlDataReader.HasRows)
      {
        sqlDataReader.Read();
        this.TextBox11.Text = sqlDataReader.GetValue(0).ToString();
        this.TextBox12.Text = sqlDataReader.GetValue(1).ToString();
        this.TextBox13.Text = sqlDataReader.GetValue(2).ToString();
      }
      sqlCommand.Dispose();
      connection.Close();
      float num1 = 0.0f;
      if (this.TextBox11.Text != "")
      {
        if ((double) float.Parse(this.TextBox11.Text) > 5.0)
          num1 += 5f;
        else
          num1 += float.Parse(this.TextBox11.Text);
      }
      if (this.TextBox12.Text != "")
      {
        if ((double) float.Parse(this.TextBox12.Text) > 5.0)
          num1 += 5f;
        else
          num1 += float.Parse(this.TextBox12.Text);
      }
      if (this.TextBox13.Text != "")
      {
        if ((double) float.Parse(this.TextBox13.Text) > 5.0)
          num1 += 5f;
        else
          num1 += float.Parse(this.TextBox13.Text);
      }
      float num2 = num1 / 3f;
      this.TextBox2.Text = string.Format("{0:0.##}", (object) num2);
      this.TextBox14.Text = string.Format("{0:0.##}", (object) num2);
      this.TextBox2.ReadOnly = true;
    }

    protected void checkscore_QA5(string dt1)
    {
      string empty = string.Empty;
      SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
      connection.Open();
      string cmdText = "select [total_result] from QA_main_result where Standardid=@projectid ";
      SqlCommand sqlCommand = new SqlCommand(cmdText, connection);
      sqlCommand.CommandText = cmdText;
      sqlCommand.Parameters.AddWithValue("@projectid", (object) dt1);
      SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
      if (sqlDataReader.HasRows)
      {
        sqlDataReader.Read();
        this.TextBox9.Text = sqlDataReader.GetValue(0).ToString();
      }
      sqlCommand.Dispose();
      connection.Close();
    }

    public string renderdata()
    {
      string str1 = "";
      try
      {
        string dt1 = this.Request["ID"].ToString();
        try
        {
          string empty = string.Empty;
          SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
          connection.Open();
          string cmdText = "Select [id],[Standard_detail],Weight,[QA_TYPE] from QA_standard_detail_add where Standardid=@Standardid and active='1'";
          SqlCommand sqlCommand = new SqlCommand(cmdText, connection);
          sqlCommand.CommandText = cmdText;
          sqlCommand.Parameters.AddWithValue("@Standardid", (object) dt1);
          SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
          string str2 = "";
          if (sqlDataReader.HasRows)
          {
            while (sqlDataReader.Read())
            {
              if (sqlDataReader.GetValue(3).ToString() == "1")
              {
                this.total = 0.0f;
                this.total1 = 0.0f;
                this.group1.Visible = true;
                str1 += "<tbody> <tr>";
                str1 = str1 + "<td>" + sqlDataReader.GetValue(1).ToString() + " </td>";
                str1 = str1 + "<td> " + sqlDataReader.GetValue(2).ToString() + " </td>";
                str1 += "</tr></tbody> ";
                this.checkscore_QA1(dt1);
                this.TextBox1.Visible = false;
                this.Label5.Visible = false;
                this.TextBox2.ReadOnly = true;
                this.TextBox2.Visible = true;
                this.Label4.Visible = true;
                if (str2 == "")
                {
                  this.sqlDP.SelectParameters[0].DefaultValue = dt1;
                  this.sqlDP.DataBind();
                  try
                  {
                    this.gvDP.DataBind();
                    str2 = "1";
                  }
                  catch
                  {
                  }
                }
              }
              else if (sqlDataReader.GetValue(3).ToString() == "7" || sqlDataReader.GetValue(3).ToString() == "11")
              {
                this.group7.Visible = true;
                this.TextBox2.Visible = true;
                this.group7_1.Visible = true;
                this.Label2.Text = !(sqlDataReader.GetValue(3).ToString() == "11") ? "จำนวนครู/อาจารย์ และครูฝึกทั้งหมด" : "จำนวนบุคลากรของหน่วยทั้งหมด";
                str1 += "<tbody> <tr>";
                str1 = str1 + "<td>" + sqlDataReader.GetValue(1).ToString() + " </td>";
                str1 = str1 + "<td> " + sqlDataReader.GetValue(2).ToString() + " </td>";
                str1 += "</tr></tbody> ";
                this.checkscore_QA7(dt1);
                this.checkscore_QA7_1(dt1);
                this.TextBox2.ReadOnly = true;
                this.TextBox2.Visible = true;
                this.Label4.Visible = true;
                if (str2 == "")
                {
                  this.SqlDataSource2.SelectParameters[0].DefaultValue = dt1;
                  this.SqlDataSource2.DataBind();
                  try
                  {
                    this.GridView2.DataBind();
                    str2 = "1";
                  }
                  catch
                  {
                  }
                }
              }
              else if (sqlDataReader.GetValue(3).ToString() == "2")
              {
                this.group2.Visible = true;
                this.group9.Visible = true;
                str1 += "<tbody> <tr>";
                str1 = str1 + "<td>" + sqlDataReader.GetValue(1).ToString() + " </td>";
                str1 = str1 + "<td> " + sqlDataReader.GetValue(2).ToString() + " </td>";
                str1 += "</tr></tbody> ";
                this.TextBox2.ReadOnly = true;
                this.TextBox2.Visible = true;
                this.Label4.Visible = true;
                if (str2 == "")
                {
                  this.SqlDataSource6.SelectParameters[0].DefaultValue = dt1;
                  this.SqlDataSource6.DataBind();
                  try
                  {
                    this.GridView6.DataBind();
                    str2 = "1";
                  }
                  catch
                  {
                  }
                  this.SqlDataSource1.SelectParameters[0].DefaultValue = dt1;
                  this.SqlDataSource1.DataBind();
                  try
                  {
                    this.GridView1.DataBind();
                    str2 = "1";
                  }
                  catch
                  {
                  }
                }
              }
              else if (sqlDataReader.GetValue(3).ToString() == "3")
              {
                this.group3.Visible = true;
                str1 += "<tbody> <tr>";
                str1 = str1 + "<td>" + sqlDataReader.GetValue(1).ToString() + " </td>";
                str1 = str1 + "<td> " + sqlDataReader.GetValue(2).ToString() + " </td>";
                str1 += "</tr></tbody> ";
                if (str2 == "")
                {
                  this.SqlDataSource5.SelectParameters[0].DefaultValue = dt1;
                  this.SqlDataSource5.DataBind();
                  try
                  {
                    this.GridView5.DataBind();
                    str2 = "1";
                  }
                  catch
                  {
                  }
                }
              }
              else if (sqlDataReader.GetValue(3).ToString() == "8")
              {
                str1 += "<tbody> <tr>";
                str1 = str1 + "<td>" + sqlDataReader.GetValue(1).ToString() + " </td>";
                str1 = str1 + "<td> " + sqlDataReader.GetValue(2).ToString() + " </td>";
                str1 += "</tr></tbody> ";
                this.group9.Visible = true;
                this.group8_1.Visible = true;
                this.checkscore_QA8(dt1);
                if (str2 == "")
                {
                  this.SqlDataSource1.SelectParameters[0].DefaultValue = dt1;
                  this.SqlDataSource1.DataBind();
                  try
                  {
                    this.GridView1.DataBind();
                    str2 = "1";
                  }
                  catch
                  {
                  }
                }
                this.TextBox2.ReadOnly = true;
                this.TextBox2.Visible = true;
                this.Label4.Visible = true;
              }
              else if (sqlDataReader.GetValue(3).ToString() == "5")
              {
                str1 += "<tbody> <tr>";
                str1 = str1 + "<td>" + sqlDataReader.GetValue(1).ToString() + " </td>";
                str1 = str1 + "<td> " + sqlDataReader.GetValue(2).ToString() + " </td>";
                str1 += "</tr></tbody> ";
                this.group5.Visible = true;
                this.group5_1.Visible = true;
                this.checkscore_QA5(dt1);
                if (str2 == "")
                {
                  this.SqlDataSource4.SelectParameters[0].DefaultValue = dt1;
                  this.SqlDataSource4.DataBind();
                  try
                  {
                    this.GridView4.DataBind();
                    str2 = "1";
                  }
                  catch (Exception ex)
                  {
                    str2 = ex.Message;
                  }
                }
                this.TextBox1.Visible = false;
                this.Label5.Visible = false;
                this.TextBox2.ReadOnly = true;
                this.TextBox2.Visible = true;
                this.Label4.Visible = true;
              }
              else if (sqlDataReader.GetValue(3).ToString() == "4")
              {
                str1 += "<tbody> <tr>";
                str1 = str1 + "<td>" + sqlDataReader.GetValue(1).ToString() + " </td>";
                str1 = str1 + "<td> " + sqlDataReader.GetValue(2).ToString() + " </td>";
                str1 += "</tr></tbody> ";
                this.group4.Visible = true;
                if (str2 == "")
                {
                  this.total1 = 0.0f;
                  this.SqlDataSource3.SelectParameters[0].DefaultValue = dt1;
                  this.SqlDataSource3.DataBind();
                  try
                  {
                    this.GridView3.DataBind();
                    str2 = "1";
                  }
                  catch (Exception ex)
                  {
                    str2 = ex.Message;
                  }
                }
                this.TextBox1.Visible = false;
                this.Label5.Visible = false;
                this.TextBox2.ReadOnly = true;
                this.TextBox2.Visible = true;
                this.Label4.Visible = true;
              }
              else if (sqlDataReader.GetValue(3).ToString() == "10")
              {
                str1 += "<tbody> <tr>";
                str1 = str1 + "<td>" + sqlDataReader.GetValue(1).ToString() + " </td>";
                str1 = str1 + "<td> " + sqlDataReader.GetValue(2).ToString() + " </td>";
                str1 += "</tr></tbody> ";
                this.group4.Visible = true;
                if (str2 == "")
                {
                  this.total1 = 0.0f;
                  this.SqlDataSource3.SelectParameters[0].DefaultValue = dt1;
                  this.SqlDataSource3.DataBind();
                  try
                  {
                    this.GridView3.DataBind();
                    str2 = "1";
                  }
                  catch (Exception ex)
                  {
                    str2 = ex.Message;
                  }
                }
                this.TextBox1.Visible = true;
                this.Label5.Visible = true;
                this.TextBox2.ReadOnly = true;
                this.TextBox2.Visible = true;
                this.Label4.Visible = true;
              }
              else
              {
                str1 += "<tbody> <tr>";
                str1 = str1 + "<td>" + sqlDataReader.GetValue(1).ToString() + " </td>";
                str1 = str1 + "<td> " + sqlDataReader.GetValue(2).ToString() + " </td>";
                str1 += "</tr></tbody> ";
                this.group9.Visible = true;
                if (str2 == "")
                {
                  this.SqlDataSource1.SelectParameters[0].DefaultValue = dt1;
                  this.SqlDataSource1.DataBind();
                  try
                  {
                    this.GridView1.DataBind();
                    str2 = "1";
                  }
                  catch
                  {
                  }
                }
              }
            }
          }
          sqlCommand.Dispose();
          connection.Close();
        }
        catch
        {
        }
      }
      catch
      {
      }
      return str1;
    }

    private void insert_qar(
      string project,
      string name,
      string timex,
      string filex,
      string remark,
      string filex2,
      string filex3,
      string filex4,
      string filex5,
      string totalresult,
      string filex6,
      string filex7,
      string totalresult1)
    {
      CConnect cconnect = new CConnect();
      string str = "";
      if (totalresult == "")
      {
        int length = this.DropDownList1.Text.IndexOf(",");
        if (length != -1)
          str = this.DropDownList1.Text.Substring(0, length);
      }
      else
      {
        try
        {
          str = this.Request["ID"].ToString();
        }
        catch
        {
        }
      }
      string sql = "INSERT INTO [QA_main_result]([Standardid],[project],[NAME],[timex],[file1],[remark],[Createdate],[Createby],[ACTIVE],[file2],[file3],[file4],[file5],[total_result],[file6],[file7],[total_result1]) VALUES('" + str + "','" + project + "','" + name + "','" + timex + "','" + filex + "','" + remark + "','" + (object) DateTime.Now + "','1','1','" + filex2 + "','" + filex3 + "','" + filex4 + "','" + filex5 + "','" + totalresult + "','" + filex6 + "','" + filex7 + "','" + totalresult1 + "')";
      cconnect.sqlCmd(sql);
    }

    private void insert_reaul1(
      string project,
      string teacher,
      string admin,
      string filex,
      string support)
    {
      CConnect cconnect = new CConnect();
      string str = "";
      try
      {
        str = this.Request["ID"].ToString();
      }
      catch
      {
      }
      string sql = "INSERT INTO [QA_main_Second]([Standardid],[total_project],[total_teacher],[total_admin],[total_support],[file1],[Createdate],[Createby],[ACTIVE]) VALUES('" + str + "','" + project + "','" + teacher + "','" + admin + "','" + support + "','" + filex + "','" + (object) DateTime.Now + "','1','1')";
      cconnect.sqlCmd(sql);
    }

    protected void Button71_Click(object sender, EventArgs e)
    {
      this.insert_reaul1("", this.TextBox9.Text, "", "", "");
      this.TextBox2.ReadOnly = true;
    }

    private int checkUserQA_main_Second(string user)
    {
      return int.Parse(new CConnect().sqlCmdReturn("select count(Standardid) from QA_main_Second where Standardid='" + user + "'").ToString());
    }

    private void updateQA_main_Second(
      string project,
      string teacher,
      string admin,
      string filex,
      string suppor,
      string dt1)
    {
      new CConnect().sqlCmd("UPDATE [QA_main_Second] SET [total_project]='" + project + "',[total_teacher]='" + teacher + "',[total_admin]='" + admin + "',[total_support]='" + suppor + "',[file1]='" + filex + "' WHERE Standardid='" + dt1 + "'");
    }

    protected void Button81_Click(object sender, EventArgs e)
    {
      string str = "";
      try
      {
        str = this.Request["ID"].ToString();
      }
      catch
      {
      }
      if (this.checkUserQA_main_Second(str) == 0)
        this.insert_reaul1("", this.TextBox11.Text, this.TextBox12.Text, "", this.TextBox13.Text);
      else
        this.updateQA_main_Second("", this.TextBox11.Text, this.TextBox12.Text, "", this.TextBox13.Text, str);
      float num1 = 0.0f;
      if (this.TextBox11.Text != "")
      {
        if ((double) float.Parse(this.TextBox11.Text) > 5.0)
          num1 += 5f;
        else
          num1 += float.Parse(this.TextBox11.Text);
      }
      if (this.TextBox12.Text != "")
      {
        if ((double) float.Parse(this.TextBox12.Text) > 5.0)
          num1 += 5f;
        else
          num1 += float.Parse(this.TextBox12.Text);
      }
      if (this.TextBox13.Text != "")
      {
        if ((double) float.Parse(this.TextBox13.Text) > 5.0)
          num1 += 5f;
        else
          num1 += float.Parse(this.TextBox13.Text);
      }
      float num2 = num1 / 3f;
      this.TextBox2.Text = string.Format("{0:0.##}", (object) num2);
      this.TextBox14.Text = string.Format("{0:0.##}", (object) num2);
      this.TextBox2.ReadOnly = true;
    }

    private int checkUserQA_main_result(string user)
    {
      return int.Parse(new CConnect().sqlCmdReturn("select count(Standardid) from QA_main_result where Standardid='" + user + "'").ToString());
    }

    private void updateQA_main_result(string dt1, string scorex1)
    {
      new CConnect().sqlCmd("UPDATE [QA_main_result] SET [total_result] = '" + scorex1 + "' WHERE Standardid='" + dt1 + "'");
    }

    protected void Button511_Click(object sender, EventArgs e)
    {
      string str = "";
      try
      {
        str = this.Request["ID"].ToString();
      }
      catch
      {
      }
      if (this.checkUserQA_main_result(str) == 0)
        return;
      this.updateQA_main_result(str, this.TextBox9.Text);
    }

    protected void Button_gp7_Click(object sender, EventArgs e)
    {
      string filex = "";
      string filex2 = "";
      string filex3 = "";
      string filex4 = "";
      string filex5 = "";
      string str1 = "";
      try
      {
        str1 = this.Request["ID"].ToString();
      }
      catch
      {
      }
      string str2 = HttpContext.Current.Server.MapPath("~/QAFILE/");
      if (str1 != "")
      {
        string path = str2 + str1;
        if (!Directory.Exists(path))
          Directory.CreateDirectory(path);
      }
      if (this.FileUpload2.HasFile)
      {
        try
        {
          this.FileUpload2.SaveAs(str2 + str1 + "\\1_" + this.FileUpload2.FileName);
          filex = "1_" + this.FileUpload2.FileName;
        }
        catch
        {
        }
      }
      if (this.FileUpload3.HasFile)
      {
        try
        {
          this.FileUpload3.SaveAs(str2 + str1 + "\\2_" + this.FileUpload3.FileName);
          filex2 = "2_" + this.FileUpload3.FileName;
        }
        catch
        {
        }
      }
      if (this.FileUpload4.HasFile)
      {
        try
        {
          this.FileUpload4.SaveAs(str2 + str1 + "\\3_" + this.FileUpload4.FileName);
          filex3 = "3_" + this.FileUpload4.FileName;
        }
        catch
        {
        }
      }
      if (this.FileUpload5.HasFile)
      {
        try
        {
          this.FileUpload5.SaveAs(str2 + str1 + "\\4_" + this.FileUpload5.FileName);
          filex4 = "4_" + this.FileUpload5.FileName;
        }
        catch
        {
        }
      }
      if (this.FileUpload6.HasFile)
      {
        try
        {
          this.FileUpload6.SaveAs(str2 + str1 + "\\5_" + this.FileUpload6.FileName);
          filex5 = "5_" + this.FileUpload6.FileName;
        }
        catch
        {
        }
      }
      this.insert_qar(this.Text5.Value, "", "", filex, this.Text4.Value, filex2, filex3, filex4, filex5, "1", "", "", "");
    }

    protected void Button_gp3_Click(object sender, EventArgs e)
    {
      string filex = "";
      string filex2 = "";
      string filex3 = "";
      string filex4 = "";
      string filex5 = "";
      string filex6 = "";
      string filex7 = "";
      string str1 = "";
      try
      {
        str1 = this.Request["ID"].ToString();
      }
      catch
      {
      }
      string str2 = HttpContext.Current.Server.MapPath("~/QAFILE/");
      if (str1 != "")
      {
        string path = str2 + str1;
        if (!Directory.Exists(path))
          Directory.CreateDirectory(path);
      }
      if (this.FileUpload10.HasFile)
      {
        try
        {
          this.FileUpload10.SaveAs(str2 + str1 + "\\1_" + this.FileUpload10.FileName);
          filex = "1_" + this.FileUpload10.FileName;
        }
        catch
        {
        }
      }
      if (this.FileUpload11.HasFile)
      {
        try
        {
          this.FileUpload11.SaveAs(str2 + str1 + "\\2_" + this.FileUpload11.FileName);
          filex2 = "2_" + this.FileUpload11.FileName;
        }
        catch
        {
        }
      }
      if (this.FileUpload12.HasFile)
      {
        try
        {
          this.FileUpload12.SaveAs(str2 + str1 + "\\3_" + this.FileUpload12.FileName);
          filex3 = "3_" + this.FileUpload12.FileName;
        }
        catch
        {
        }
      }
      if (this.FileUpload13.HasFile)
      {
        try
        {
          this.FileUpload13.SaveAs(str2 + str1 + "\\4_" + this.FileUpload13.FileName);
          filex4 = "4_" + this.FileUpload13.FileName;
        }
        catch
        {
        }
      }
      if (this.FileUpload14.HasFile)
      {
        try
        {
          this.FileUpload14.SaveAs(str2 + str1 + "\\5_" + this.FileUpload14.FileName);
          filex5 = "5_" + this.FileUpload14.FileName;
        }
        catch
        {
        }
      }
      if (this.FileUpload15.HasFile)
      {
        try
        {
          this.FileUpload15.SaveAs(str2 + str1 + "\\6_" + this.FileUpload15.FileName);
          filex6 = "6_" + this.FileUpload15.FileName;
        }
        catch
        {
        }
      }
      if (this.FileUpload16.HasFile)
      {
        try
        {
          this.FileUpload16.SaveAs(str2 + str1 + "\\7_" + this.FileUpload16.FileName);
          filex7 = "7_" + this.FileUpload16.FileName;
        }
        catch
        {
        }
      }
      this.insert_qar(this.DropDownList3.Text, "", "", filex, this.Text12.Value, filex2, filex3, filex4, filex5, "1", filex6, filex7, "");
    }

    protected void Button21_Click(object sender, EventArgs e)
    {
      this.insert_qar(this.TextBox15.Text, "", "", "", "", "", "", "", "", this.TextBox16.Text, "", "", this.TextBox17.Text);
    }

    protected void Button41_Click(object sender, EventArgs e)
    {
      this.insert_qar(this.TextBox6.Text, "", "", "", "", "", "", "", "", this.TextBox7.Text, "", "", "");
    }

    protected void Button_gp9_Click(object sender, EventArgs e)
    {
      string filex = "";
      string str1 = "";
      int length = this.DropDownList1.Text.IndexOf(",");
      if (length != -1)
        str1 = this.DropDownList1.Text.Substring(0, length);
      string str2 = HttpContext.Current.Server.MapPath("~/QAFILE/");
      if (str1 != "")
      {
        string path = str2 + str1;
        if (!Directory.Exists(path))
          Directory.CreateDirectory(path);
      }
      if (this.FileUpload1.HasFile)
      {
        try
        {
          this.FileUpload1.SaveAs(str2 + str1 + "\\" + this.FileUpload1.FileName);
          this.Label1.Text = "File name: " + this.FileUpload1.PostedFile.FileName + "<br>" + (object) this.FileUpload1.PostedFile.ContentLength + " kb<br>Content type: " + this.FileUpload1.PostedFile.ContentType;
          filex = this.FileUpload1.FileName;
        }
        catch (Exception ex)
        {
          this.Label1.Text = "ERROR: " + ex.Message.ToString();
        }
      }
      this.insert_qar("", "", "", filex, this.Text6.Value, "", "", "", "", "", "", "", "");
    }

    public void ADD_COM_CODE1()
    {
      string str = "";
      try
      {
        str = this.Request["ID"].ToString();
      }
      catch
      {
      }
      SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
      connection.Open();
      string cmdText = "SELECT  [id],[course_name] FROM [main_course]";
      SqlCommand sqlCommand = new SqlCommand(cmdText, connection);
      sqlCommand.CommandText = cmdText;
      sqlCommand.Parameters.AddWithValue("@stdid", (object) str);
      SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
      this.DropDownList2.Items.Clear();
      this.DropDownList3.Items.Clear();
      if (sqlDataReader.HasRows)
      {
        while (sqlDataReader.Read())
        {
          this.DropDownList2.Items.Add(sqlDataReader.GetValue(1).ToString());
          this.DropDownList3.Items.Add(sqlDataReader.GetValue(1).ToString());
        }
      }
      this.DropDownList2.Items.Add("อื่นๆ");
      sqlDataReader.Close();
      sqlCommand.Dispose();
      connection.Close();
    }

    public void ADD_COM_CODE()
    {
      string str = "";
      try
      {
        str = this.Request["ID"].ToString();
      }
      catch
      {
      }
      SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
      connection.Open();
      string cmdText = "SELECT  [id],[Standard_detail] FROM [QA_standard_detail_add] where [Standardid]=@stdid";
      SqlCommand sqlCommand = new SqlCommand(cmdText, connection);
      sqlCommand.CommandText = cmdText;
      sqlCommand.Parameters.AddWithValue("@stdid", (object) str);
      SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
      this.DropDownList1.Items.Clear();
      if (sqlDataReader.HasRows)
      {
        while (sqlDataReader.Read())
          this.DropDownList1.Items.Add(sqlDataReader.GetValue(0).ToString() + "," + sqlDataReader.GetValue(1).ToString());
      }
      sqlDataReader.Close();
      sqlCommand.Dispose();
      connection.Close();
    }

    protected void Gv_RowDataBound(object sender, GridViewRowEventArgs e)
    {
      try
      {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
          this.total += (float) Convert.ToInt32(e.Row.Cells[1].Text);
          this.total1 += (float) Convert.ToInt32(e.Row.Cells[2].Text);
        }
        else
        {
          if (e.Row.RowType != DataControlRowType.Footer)
            return;
          e.Row.Cells[0].Text = "รวม";
          e.Row.Cells[1].Text = string.Format("{0:0.##}", (object) this.total);
          e.Row.Cells[2].Text = string.Format("{0:0.##}", (object) this.total1);
          int rowIndex = e.Row.RowIndex;
          int dataItemIndex = e.Row.DataItemIndex;
          int count = this.gvDP.Columns.Count;
          GridViewRow gridViewRow = new GridViewRow(rowIndex, dataItemIndex, DataControlRowType.Footer, DataControlRowState.Normal);
          for (int index = 0; index < count; ++index)
          {
            TableCell cell = new TableCell();
            switch (index)
            {
              case 1:
                cell.Text = "คิดเป็นร้อยละ";
                break;
              case 2:
                cell.Text = ((float) ((double) this.total1 / (double) this.total * 100.0)).ToString("0.00");
                break;
              default:
                cell.Text = "";
                break;
            }
            gridViewRow.Cells.Add(cell);
          }
          this.gvDP.Controls[0].Controls.Add((Control) gridViewRow);
        }
      }
      catch
      {
      }
    }

    protected void Gv_RowDataBound1(object sender, GridViewRowEventArgs e)
    {
      try
      {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
          this.total1 += float.Parse(e.Row.Cells[2].Text);
        }
        else
        {
          if (e.Row.RowType != DataControlRowType.Footer)
            return;
          e.Row.Cells[1].Text = "รวม";
          this.total1 /= (float) this.GridView3.Rows.Count;
          e.Row.Cells[2].Text = string.Format("{0:0.##}", (object) this.total1);
          this.TextBox2.Text = string.Format("{0:0.##}", (object) this.total1);
        }
      }
      catch
      {
      }
    }

    protected void Gv_RowDataBound6(object sender, GridViewRowEventArgs e)
    {
      try
      {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
          this.total += float.Parse(e.Row.Cells[2].Text);
          this.total1 += float.Parse(e.Row.Cells[3].Text);
        }
        else
        {
          if (e.Row.RowType != DataControlRowType.Footer)
            return;
          e.Row.Cells[1].Text = "ค่าเฉลี่ยแต่ละกลุ่มบุคคล";
          this.total /= (float) this.GridView6.Rows.Count;
          this.total1 /= (float) this.GridView6.Rows.Count;
          e.Row.Cells[2].Text = string.Format("{0:0.##}", (object) this.total);
          e.Row.Cells[3].Text = string.Format("{0:0.##}", (object) this.total1);
          int rowIndex = e.Row.RowIndex;
          int dataItemIndex = e.Row.DataItemIndex;
          int count = this.GridView6.Columns.Count;
          GridViewRow gridViewRow = new GridViewRow(rowIndex, dataItemIndex, DataControlRowType.Footer, DataControlRowState.Normal);
          for (int index = 0; index < count; ++index)
          {
            TableCell cell = new TableCell();
            switch (index)
            {
              case 2:
                cell.Text = "คิดเป็นร้อยละ";
                break;
              case 3:
                float num = (float) (((double) this.total + (double) this.total1) / 2.0);
                this.TextBox2.Text = string.Format("{0:0.##}", (object) num);
                cell.Text = string.Format("{0:0.##}", (object) num);
                break;
              default:
                cell.Text = "";
                break;
            }
            gridViewRow.Cells.Add(cell);
          }
          this.GridView6.Controls[0].Controls.Add((Control) gridViewRow);
        }
      }
      catch
      {
      }
    }

    protected void Gv2_RowDataBound(object sender, GridViewRowEventArgs e)
    {
      try
      {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
          ++this.total1;
        }
        else
        {
          if (e.Row.RowType != DataControlRowType.Footer)
            return;
          float num = 0.0f;
          e.Row.Cells[5].Text = "รวมจำนวนครู/อาจารย์ ครูฝึกที่ได้รับการเพิ่มพูนความรู้/ประสบการณ์";
          e.Row.Cells[6].Text = string.Format("{0:0.##}", (object) this.total1);
          if (this.TextBox9.Text != "")
          {
            num = (float) ((double) this.total1 / (double) float.Parse(this.TextBox9.Text) * 100.0);
            this.TextBox10.Text = string.Format("{0:0.##}", (object) num);
            this.TextBox2.Text = string.Format("{0:0.##}", (object) ((double) num * 0.05));
          }
          else
            this.TextBox10.Text = "";
          int rowIndex = e.Row.RowIndex;
          int dataItemIndex = e.Row.DataItemIndex;
          int count = this.GridView4.Columns.Count;
          GridViewRow gridViewRow = new GridViewRow(rowIndex, dataItemIndex, DataControlRowType.Footer, DataControlRowState.Normal);
          for (int index = 0; index < count; ++index)
          {
            TableCell cell = new TableCell();
            switch (index)
            {
              case 5:
                cell.Text = "คิดเป็นร้อยละ";
                break;
              case 6:
                cell.Text = string.Format("{0:0.##}", (object) num);
                break;
              default:
                cell.Text = "";
                break;
            }
            gridViewRow.Cells.Add(cell);
          }
          this.GridView4.Controls[0].Controls.Add((Control) gridViewRow);
        }
      }
      catch
      {
      }
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
