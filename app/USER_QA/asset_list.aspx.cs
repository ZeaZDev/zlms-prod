// Decompiled with JetBrains decompiler
// Type: newweb.USER_QA.asset_list
// Assembly: newweb, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: A2E847A6-10D0-4271-9D59-55F01CDCC8B0
// Assembly location: C:\data\source-20190227T061536Z-001\source\lms\lms\bin\newweb.dll

using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace newweb.USER_QA
{
  public class asset_list : Page
  {
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
    protected HtmlGenericControl group4;
    protected DropDownList DropDownList4;
    protected HtmlInputText Text141;
    protected TextBox TextBox7;
    protected Button Button6;
    protected HtmlGenericControl group1;
    protected DropDownList DropDownList2;
    protected HtmlInputText txtNName;
    protected HtmlInputText Text1;
    protected HtmlInputText Text3;
    protected HtmlInputText Text2;
    protected Button Button1;
    protected HtmlGenericControl group5;
    protected HtmlInputText Text7;
    protected HtmlInputText Text8;
    protected HtmlInputText Text9;
    protected HtmlInputText Text10;
    protected Button Button7;
    protected HtmlGenericControl group9;
    protected Button Button17;
    protected HtmlGenericControl group7;
    protected HtmlInputText Text5;
    protected HtmlInputText Text11;
    protected HtmlInputText Text4;
    protected Button Button4;
    protected HtmlGenericControl group3;
    protected DropDownList DropDownList3;
    protected HtmlInputText Text14;
    protected HtmlInputText Text12;
    protected Button Button9;
    protected HtmlGenericControl group10;
    protected TextBox Text131;
    protected Button Button12;

    protected void ShowMessage(string Message, asset_list.MessageType type)
    {
      ScriptManager.RegisterStartupScript((Page) this, this.GetType(), Guid.NewGuid().ToString(), "ShowMessage('" + Message + "','" + (object) type + "');", true);
    }

    protected void Page_Load(object sender, EventArgs e)
    {
      string classid = "";
      try
      {
        classid = this.Request["ID"].ToString();
        this.coursename12();
      }
      catch
      {
      }
      if (this.IsPostBack)
        return;
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
      this.coursename(classid);
      this.coursename1(classid);
      this.ADD_COM_CODE();
      this.ADD_COM_CODE1();
      this.load_remark();
    }

    public string load_remark()
    {
      string str1 = "";
      try
      {
        string str2 = this.Request["ID"].ToString();
        try
        {
          string empty = string.Empty;
          SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
          connection.Open();
          string cmdText = "Select [Result] from QA_result_txt where Standardid=@Standardid ";
          SqlCommand sqlCommand = new SqlCommand(cmdText, connection);
          sqlCommand.CommandText = cmdText;
          sqlCommand.Parameters.AddWithValue("@Standardid", (object) str2);
          SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
          if (sqlDataReader.HasRows)
          {
            sqlDataReader.Read();
            this.Text131.Text = sqlDataReader.GetValue(0).ToString();
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

    public string coursename12()
    {
      string str = "";
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
          if (sqlDataReader.HasRows)
          {
            while (sqlDataReader.Read())
            {
              if (sqlDataReader.GetValue(3).ToString() == "1")
                this.checkscore_QA1(dt1);
              else if (sqlDataReader.GetValue(3).ToString() == "7" || sqlDataReader.GetValue(3).ToString() == "11")
              {
                this.checkscore_QA7(dt1);
                this.checkscore_QA7_11(dt1);
              }
              else if (sqlDataReader.GetValue(3).ToString() == "2")
                this.checkscore_QA2(dt1);
              else if (sqlDataReader.GetValue(3).ToString() == "8")
                this.checkscore_QA8(dt1);
              else if (sqlDataReader.GetValue(3).ToString() == "5")
                this.checkscore_QA5_1(dt1);
              else if (sqlDataReader.GetValue(3).ToString() == "4" || sqlDataReader.GetValue(3).ToString() == "10")
                this.checkscore_QA4(dt1);
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
      return str;
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
      string cmdText = "select [Score],[Score1] from [QA_result1] where standard_detail_id=@id";
      SqlCommand sqlCommand = new SqlCommand(cmdText, connection);
      sqlCommand.CommandText = cmdText;
      sqlCommand.Parameters.AddWithValue("@id", (object) classid);
      SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
      if (sqlDataReader.HasRows)
      {
        sqlDataReader.Read();
        this.TextBox1.Text = sqlDataReader.GetValue(1).ToString();
        this.TextBox8.Text = sqlDataReader.GetValue(0).ToString();
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
      }
      catch
      {
      }
      if (this.checkUser(str) == 0)
        this.addUser(str, this.TextBox1.Text, this.TextBox2.Text, "0");
      else
        this.updateuser(str, this.TextBox1.Text, this.TextBox2.Text, "0");
      this.Page.Response.Redirect(this.Page.Request.Url.AbsoluteUri);
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
      string sql = "UPDATE [QA_result1] SET [Score] = '" + s3 + "',[Score1]='" + this.TextBox1.Text + "' WHERE standard_detail_id='" + filename + "'";
      this.TextBox8.Text = s3;
      cconnect.sqlCmd(sql);
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
      string sql = "INSERT INTO QA_result1 ([Projectid],[standard_detail_id],[Score],[Createdate],[Score1]) VALUES('" + dt1 + "','" + filename + "','" + str + "','" + (object) DateTime.Now + "','" + this.TextBox1.Text + "')";
      cconnect.sqlCmd(sql);
    }

    private int checkUser(string user)
    {
      return int.Parse(new CConnect().sqlCmdReturn("select count(standard_detail_id) from QA_result1 where standard_detail_id='" + user + "'").ToString());
    }

    protected void Button51_Click(object sender, EventArgs e)
    {
      string user = "";
      try
      {
        user = this.Request["ID"].ToString();
      }
      catch
      {
      }
      if (this.checkUser_bp7(user, this.Text8.Value, this.Text7.Value) == 0)
        this.insert_qar(this.Text8.Value, this.Text7.Value, this.Text9.Value, "", this.Text10.Value, "", "", "", "", "1", "", "", "");
      this.Page.Response.Redirect(this.Page.Request.Url.AbsoluteUri);
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
      ScriptManager.RegisterStartupScript((Page) this, this.GetType(), "Pop", "openModal();", true);
      if (this.DropDownList2.Text == "อื่นๆ")
      {
        if (this.txtNName.Value == "")
        {
          this.ShowMessage("Activities Name can not be blank", asset_list.MessageType.Error);
          return;
        }
        this.addUser(this.txtNName.Value);
      }
      else
        this.addUser(this.DropDownList2.Text);
      this.clearAddnew();
      this.Page.Response.Redirect(this.Page.Request.Url.AbsoluteUri);
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

    protected void checkscore_QA4(string dt1)
    {
      try
      {
        dt1 = this.Request["ID"].ToString();
        try
        {
          float num1 = 0.0f;
          int num2 = 0;
          string empty = string.Empty;
          SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
          connection.Open();
          string cmdText = "SELECT  ROW_NUMBER() OVER (ORDER BY id) AS No,[project],[total_result],[total_result],[total_result1],ID from QA_main_result where Standardid=@Standardid and active='1' order by Standardid";
          SqlCommand sqlCommand = new SqlCommand(cmdText, connection);
          sqlCommand.CommandText = cmdText;
          sqlCommand.Parameters.AddWithValue("@Standardid", (object) dt1);
          SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
          if (sqlDataReader.HasRows)
          {
            while (sqlDataReader.Read())
            {
              if (sqlDataReader.GetValue(2).ToString() != "")
                num1 += float.Parse(sqlDataReader.GetValue(2).ToString());
              ++num2;
            }
          }
          if (num2 == 0)
            num2 = 1;
          float num3 = num1 / (float) num2;
          if ((double) num3 > 5.0)
            num3 = 5f;
          this.TextBox2.Text = num3.ToString("0.00");
          if (double.Parse(this.TextBox2.Text) > 5.0)
            this.TextBox2.Text = "5";
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
    }

    protected string checkscore_QA5_11(string dt1)
    {
      string str = "";
      string empty = string.Empty;
      SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
      connection.Open();
      string cmdText = "select [total_result] from QA_main_result where Standardid=@projectid and active='1'";
      SqlCommand sqlCommand = new SqlCommand(cmdText, connection);
      sqlCommand.CommandText = cmdText;
      sqlCommand.Parameters.AddWithValue("@projectid", (object) dt1);
      SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
      if (sqlDataReader.HasRows)
      {
        sqlDataReader.Read();
        str = sqlDataReader.GetValue(0).ToString();
      }
      sqlCommand.Dispose();
      connection.Close();
      return str;
    }

    protected void checkscore_QA5_1(string dt1)
    {
      try
      {
        dt1 = this.Request["ID"].ToString();
        try
        {
          string empty = string.Empty;
          SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
          connection.Open();
          string cmdText = "SELECT  ROW_NUMBER() OVER (ORDER BY id) AS No,[project],[NAME],[timex],[file1],[file2],[file3],Standardid as id,ID as IDX from QA_main_result where Standardid=@Standardid and active='1'  order by Standardid";
          SqlCommand sqlCommand = new SqlCommand(cmdText, connection);
          sqlCommand.CommandText = cmdText;
          sqlCommand.Parameters.AddWithValue("@Standardid", (object) dt1);
          SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
          int num1 = 0;
          if (sqlDataReader.HasRows)
          {
            while (sqlDataReader.Read())
              ++num1;
          }
          sqlCommand.Dispose();
          connection.Close();
          string s = this.checkscore_QA5_11(dt1);
          double num2 = (double) (num1 * 100) / double.Parse(s);
          this.TextBox10.Text = num2.ToString("0.00");
          this.TextBox2.Text = (num2 * 5.0 / 100.0).ToString("0.00");
          if (double.Parse(this.TextBox2.Text) <= 5.0)
            return;
          this.TextBox2.Text = "5";
        }
        catch
        {
        }
      }
      catch
      {
      }
    }

    protected void checkscore_QA2(string dt1)
    {
      try
      {
        try
        {
          float num1 = 0.0f;
          float num2 = 0.0f;
          int num3 = 0;
          string empty = string.Empty;
          SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
          connection.Open();
          string cmdText = "SELECT  ROW_NUMBER() OVER (ORDER BY id) AS No,[project],[total_result],[total_result],[total_result1],ID from QA_main_result where Standardid=@Standardid and active='1' order by Standardid";
          SqlCommand sqlCommand = new SqlCommand(cmdText, connection);
          sqlCommand.CommandText = cmdText;
          sqlCommand.Parameters.AddWithValue("@Standardid", (object) dt1);
          SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
          if (sqlDataReader.HasRows)
          {
            while (sqlDataReader.Read())
            {
              if (sqlDataReader.GetValue(2).ToString() != "")
                num1 += float.Parse(sqlDataReader.GetValue(2).ToString());
              if (sqlDataReader.GetValue(4).ToString() != "")
                num2 += float.Parse(sqlDataReader.GetValue(4).ToString());
              ++num3;
            }
          }
          if (num3 == 0)
            num3 = 1;
          this.TextBox2.Text = ((float) (((double) num1 + (double) num2) / (double) num3 / 2.0)).ToString("0.00");
          if (double.Parse(this.TextBox2.Text) > 5.0)
            this.TextBox2.Text = "5";
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
    }

    protected void checkscore_QA1(string dt1)
    {
      string empty = string.Empty;
      SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
      connection.Open();
      string cmdText = "select sum(convert(int,total)) as totalx,sum(convert(int,score)) as scorex from QA_activities where projectid=@projectid and active='1'";
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
        {
          this.TextBox2.Text = (num1 / num2 * 5.0).ToString("0.00");
          if (double.Parse(this.TextBox2.Text) > 5.0)
            this.TextBox2.Text = "5";
        }
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
      string cmdText = "select sum(convert(int,total_project)),sum(convert(int,total_teacher)) from QA_main_Second where Standardid=@projectid and active='1'";
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
          this.TextBox4.Text = (double.Parse(this.TextBox3.Text) / double.Parse(this.TextBox5.Text) * 100.0).ToString("0.00");
          this.TextBox2.Text = (double.Parse(this.TextBox4.Text) * 5.0 / 20.0).ToString("0.00");
        }
      }
      sqlCommand.Dispose();
      connection.Close();
      return str;
    }

    private string checkscore_QA7_11(string dt1)
    {
      string str1 = "";
      string empty = string.Empty;
      SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
      connection.Open();
      string cmdText = "select sum(convert(int,total_project)),sum(convert(int,total_teacher)) from QA_main_Second where Standardid=@projectid and active='1'";
      SqlCommand sqlCommand = new SqlCommand(cmdText, connection);
      sqlCommand.CommandText = cmdText;
      sqlCommand.Parameters.AddWithValue("@projectid", (object) dt1);
      SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
      if (sqlDataReader.HasRows)
      {
        sqlDataReader.Read();
        string s = sqlDataReader.GetValue(1).ToString();
        if (double.Parse(s) > 0.0)
        {
          TextBox textBox4 = this.TextBox4;
          double num = double.Parse(this.TextBox3.Text) / double.Parse(s) * 100.0;
          string str2 = num.ToString("0.00");
          textBox4.Text = str2;
          TextBox textBox2 = this.TextBox2;
          num = double.Parse(this.TextBox4.Text) * 5.0 / 20.0;
          string str3 = num.ToString("0.00");
          textBox2.Text = str3;
          if (double.Parse(this.TextBox2.Text) > 5.0)
            this.TextBox2.Text = "5";
        }
      }
      sqlCommand.Dispose();
      connection.Close();
      return str1;
    }

    protected void checkscore_QA7(string dt1)
    {
      string empty = string.Empty;
      SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
      connection.Open();
      string cmdText = "select count(id) from QA_main_result where Standardid=@projectid and project<>'' and active='1'";
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
      string cmdText = "select [total_teacher],[total_admin],[total_support] from QA_main_Second where Standardid=@projectid and active='1'";
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
      if (double.Parse(this.TextBox2.Text) > 5.0)
        this.TextBox2.Text = "5";
      this.TextBox2.ReadOnly = true;
    }

    protected void checkscore_QA5(string dt1)
    {
      string empty = string.Empty;
      SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
      connection.Open();
      string cmdText = "select [total_result] from QA_main_result where Standardid=@projectid and active='1'";
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
      string str = "";
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
          if (sqlDataReader.HasRows)
          {
            while (sqlDataReader.Read())
            {
              if (sqlDataReader.GetValue(3).ToString() == "1")
              {
                this.group1.Visible = true;
                str += "<tbody> <tr>";
                str = str + "<td>" + sqlDataReader.GetValue(1).ToString() + " </td>";
                str = str + "<td> " + sqlDataReader.GetValue(2).ToString() + " </td>";
                str += "</tr></tbody> ";
                this.TextBox1.Visible = false;
                this.Label5.Visible = false;
                this.TextBox2.ReadOnly = true;
                this.TextBox2.Visible = true;
                this.Label4.Visible = true;
              }
              else if (sqlDataReader.GetValue(3).ToString() == "7" || sqlDataReader.GetValue(3).ToString() == "11")
              {
                this.group7.Visible = true;
                this.TextBox2.Visible = true;
                this.group7_1.Visible = true;
                this.Label2.Text = !(sqlDataReader.GetValue(3).ToString() == "11") ? "จำนวนครู/อาจารย์ และครูฝึกทั้งหมด" : "จำนวนบุคลากรของหน่วยทั้งหมด";
                str += "<tbody> <tr>";
                str = str + "<td>" + sqlDataReader.GetValue(1).ToString() + " </td>";
                str = str + "<td> " + sqlDataReader.GetValue(2).ToString() + " </td>";
                str += "</tr></tbody> ";
                this.checkscore_QA7(dt1);
                this.checkscore_QA7_1(dt1);
                this.TextBox2.ReadOnly = true;
                this.TextBox2.Visible = true;
                this.Label4.Visible = true;
              }
              else if (sqlDataReader.GetValue(3).ToString() == "2")
              {
                this.group2.Visible = true;
                this.group9.Visible = true;
                str += "<tbody> <tr>";
                str = str + "<td>" + sqlDataReader.GetValue(1).ToString() + " </td>";
                str = str + "<td> " + sqlDataReader.GetValue(2).ToString() + " </td>";
                str += "</tr></tbody> ";
                this.TextBox2.ReadOnly = true;
                this.TextBox2.Visible = true;
                this.Label4.Visible = true;
              }
              else if (sqlDataReader.GetValue(3).ToString() == "3")
              {
                this.group3.Visible = true;
                str += "<tbody> <tr>";
                str = str + "<td>" + sqlDataReader.GetValue(1).ToString() + " </td>";
                str = str + "<td> " + sqlDataReader.GetValue(2).ToString() + " </td>";
                str += "</tr></tbody> ";
              }
              else if (sqlDataReader.GetValue(3).ToString() == "8")
              {
                str += "<tbody> <tr>";
                str = str + "<td>" + sqlDataReader.GetValue(1).ToString() + " </td>";
                str = str + "<td> " + sqlDataReader.GetValue(2).ToString() + " </td>";
                str += "</tr></tbody> ";
                this.group9.Visible = true;
                this.group8_1.Visible = true;
                this.checkscore_QA8(dt1);
                this.TextBox2.ReadOnly = true;
                this.TextBox2.Visible = true;
                this.Label4.Visible = true;
              }
              else if (sqlDataReader.GetValue(3).ToString() == "5")
              {
                str += "<tbody> <tr>";
                str = str + "<td>" + sqlDataReader.GetValue(1).ToString() + " </td>";
                str = str + "<td> " + sqlDataReader.GetValue(2).ToString() + " </td>";
                str += "</tr></tbody> ";
                this.group5.Visible = true;
                this.group5_1.Visible = true;
                this.checkscore_QA5(dt1);
                this.TextBox1.Visible = false;
                this.Label5.Visible = false;
                this.TextBox2.ReadOnly = true;
                this.TextBox2.Visible = true;
                this.Label4.Visible = true;
              }
              else if (sqlDataReader.GetValue(3).ToString() == "4")
              {
                str += "<tbody> <tr>";
                str = str + "<td>" + sqlDataReader.GetValue(1).ToString() + " </td>";
                str = str + "<td> " + sqlDataReader.GetValue(2).ToString() + " </td>";
                str += "</tr></tbody> ";
                this.group4.Visible = true;
                this.TextBox1.Visible = false;
                this.Label5.Visible = false;
                this.TextBox2.ReadOnly = true;
                this.TextBox2.Visible = true;
                this.Label4.Visible = true;
              }
              else if (sqlDataReader.GetValue(3).ToString() == "10")
              {
                str += "<tbody> <tr>";
                str = str + "<td>" + sqlDataReader.GetValue(1).ToString() + " </td>";
                str = str + "<td> " + sqlDataReader.GetValue(2).ToString() + " </td>";
                str += "</tr></tbody> ";
                this.group4.Visible = true;
                this.group9.Visible = true;
                this.TextBox1.Visible = true;
                this.Label5.Visible = true;
                this.TextBox2.ReadOnly = true;
                this.TextBox2.Visible = true;
                this.Label4.Visible = true;
              }
              else
              {
                str += "<tbody> <tr>";
                str = str + "<td>" + sqlDataReader.GetValue(1).ToString() + " </td>";
                str = str + "<td> " + sqlDataReader.GetValue(2).ToString() + " </td>";
                str += "</tr></tbody> ";
                this.group9.Visible = true;
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
      return str;
    }

    private string getitem(string itemid, string dt1, string fileno)
    {
      string str = "";
      string empty = string.Empty;
      SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
      connection.Open();
      string cmdText = "SELECT ID,file1,FilePath from QA_main_result_file  where Standardid=@Standardid and active='1' and fileno=@fileno";
      SqlCommand sqlCommand = new SqlCommand(cmdText, connection);
      sqlCommand.CommandText = cmdText;
      sqlCommand.Parameters.AddWithValue("@Standardid", (object) itemid);
      sqlCommand.Parameters.AddWithValue("@fileno", (object) fileno);
      SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
      if (sqlDataReader.HasRows)
      {
        while (sqlDataReader.Read())
          str = str + " <a href='/QAFILE/" + itemid + "/" + sqlDataReader.GetValue(1).ToString() + "' download><span >" + sqlDataReader.GetValue(1).ToString() + "</span></a><span ><a class='btn btn-circle btn-danger'  onclick='ReGen1(" + sqlDataReader.GetValue(0).ToString() + ")' )><i class='fa fa-trash'></i></a>\n\r";
      }
      sqlCommand.Dispose();
      connection.Close();
      return str;
    }

    private string getitem1(string itemid, string dt1, string fileno)
    {
      string str = "";
      string empty = string.Empty;
      SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
      connection.Open();
      string cmdText = "SELECT ID,file1,FilePath from QA_main_result_file1  where Standardid=@Standardid and active='1' and fileno=@fileno";
      SqlCommand sqlCommand = new SqlCommand(cmdText, connection);
      sqlCommand.CommandText = cmdText;
      sqlCommand.Parameters.AddWithValue("@Standardid", (object) itemid);
      sqlCommand.Parameters.AddWithValue("@fileno", (object) fileno);
      SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
      if (sqlDataReader.HasRows)
      {
        while (sqlDataReader.Read())
          str = str + " <a href='/QAFILE1/" + itemid + "/" + sqlDataReader.GetValue(1).ToString() + "' download><span >" + sqlDataReader.GetValue(1).ToString() + "</span></a><span ><a class='btn btn-circle btn-danger'  onclick='ReGen3(" + sqlDataReader.GetValue(0).ToString() + ")' )><i class='fa fa-trash'></i></a>\n\r";
      }
      sqlCommand.Dispose();
      connection.Close();
      return str;
    }

    private void insert_qar1(
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
      string totalresult1,
      string idoper)
    {
      new CConnect().sqlCmd("INSERT INTO [QA_main_result1]([Standardid],[project],[NAME],[timex],[file1],[remark],[Createdate],[Createby],[ACTIVE],[file2],[file3],[file4],[file5],[total_result],[file6],[file7],[total_result1]) VALUES('" + idoper + "','" + project + "','" + name + "','" + timex + "','" + filex + "','" + remark + "','" + (object) DateTime.Now + "','1','1','" + filex2 + "','" + filex3 + "','" + filex4 + "','" + filex5 + "','" + totalresult + "','" + filex6 + "','" + filex7 + "','" + totalresult1 + "')");
    }

    private void update_qar1(
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
      string totalresult1,
      string idoper)
    {
      new CConnect().sqlCmd("UPDATE [QA_main_result1] SET [project]='" + project + "',[NAME]='" + name + "',[timex]='" + timex + "',[remark]='" + remark + "',[total_result1]='" + totalresult1 + "',ACTIVE='1'  where Standardid ='" + idoper + "' ");
    }

    protected void Button17_Click(object sender, EventArgs e)
    {
      try
      {
        int num1 = !(this.Session["cntrow"].ToString() != "") ? 0 : int.Parse(this.Session["cntrow"].ToString());
        int num2;
        if (this.Session["tmpx"].ToString() != "")
        {
          num2 = int.Parse(this.Session["tmpx"].ToString());
          num1 += num2;
        }
        else
          num2 = 0;
        for (int index = num2; index <= num1; ++index)
        {
          string remark = string.Format("{0}", (object) this.Request.Form[index.ToString()]);
          if (this.checkUser_bp9(index.ToString()) == 0)
            this.insert_qar1("", "", "", "", remark, "", "", "", "", "", "", "", "", index.ToString());
          else
            this.update_qar1("", "", "", "", remark, "", "", "", "", "", "", "", "", index.ToString());
        }
      }
      catch
      {
      }
      this.Page.Response.Redirect(this.Page.Request.Url.AbsoluteUri);
    }

    public string renderdata1()
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
          string cmdText = "SELECT  q.[project],q.[NAME],q.[timex],q.[file1],q.[remark],qd.Standard_detail,qd.id,q.id FROM  QA_standard_detail_add qd left join [QA_main_result1] q on qd.id=q.Standardid where qd.Standardid=@Standardid order by qd.id";
          SqlCommand sqlCommand = new SqlCommand(cmdText, connection);
          sqlCommand.CommandText = cmdText;
          sqlCommand.Parameters.AddWithValue("@Standardid", (object) dt1);
          SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
          string str2 = "";
          int num = 0;
          if (sqlDataReader.HasRows)
          {
            while (sqlDataReader.Read())
            {
              if (str2 == "")
              {
                str2 = sqlDataReader.GetValue(6).ToString();
                this.Session["tmpx"] = (object) str2;
              }
              str1 += "<tr>";
              str1 = str1 + "<td>" + sqlDataReader.GetValue(5).ToString() + "</td>";
              str1 = str1 + "<td><a class='btn btn-circle btn-success' target='_blank' href='Uploadfile.aspx?id=" + sqlDataReader.GetValue(6).ToString() + "' )><i class='fa fa-paperclip'></i></a>\r\n" + this.getitem(sqlDataReader.GetValue(6).ToString(), dt1, "0") + "</td>";
              str1 = str1 + "<td><input type='text' name='" + sqlDataReader.GetValue(6).ToString() + "' value='" + sqlDataReader.GetValue(4).ToString() + "'></td>";
              str1 += "</tr>";
              ++num;
            }
          }
          this.Session["cntrow"] = (object) num;
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

    public string renderdata6()
    {
      string str1 = "";
      try
      {
        string str2 = this.Request["ID"].ToString();
        try
        {
          float num1 = 0.0f;
          float num2 = 0.0f;
          int num3 = 0;
          string empty = string.Empty;
          SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
          connection.Open();
          string cmdText = "SELECT  ROW_NUMBER() OVER (ORDER BY id) AS No,[project],[total_result],[total_result],[total_result1],ID from QA_main_result where Standardid=@Standardid and active='1' order by Standardid";
          SqlCommand sqlCommand = new SqlCommand(cmdText, connection);
          sqlCommand.CommandText = cmdText;
          sqlCommand.Parameters.AddWithValue("@Standardid", (object) str2);
          SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
          if (sqlDataReader.HasRows)
          {
            while (sqlDataReader.Read())
            {
              str1 += "<tr>";
              str1 = str1 + "<td>" + sqlDataReader.GetValue(0).ToString() + "</td>";
              str1 = str1 + "<td>" + sqlDataReader.GetValue(1).ToString() + "</td>";
              str1 = str1 + "<td>" + sqlDataReader.GetValue(2).ToString() + "</td>";
              str1 = str1 + "<td>" + sqlDataReader.GetValue(4).ToString() + "</td>";
              if (sqlDataReader.GetValue(2).ToString() != "")
                num1 += float.Parse(sqlDataReader.GetValue(2).ToString());
              if (sqlDataReader.GetValue(4).ToString() != "")
                num2 += float.Parse(sqlDataReader.GetValue(4).ToString());
              str1 = str1 + "<td><span ><a class='btn btn-circle btn-danger'  onclick='ReGen(" + sqlDataReader.GetValue(5).ToString() + ")' )><i class='fa fa-trash'></i></a></td>";
              str1 += "</tr>";
              ++num3;
            }
          }
          if (num3 == 0)
            num3 = 1;
          str1 += "<tr>";
          str1 += "<td colspan='2' align='right'>ค่าเฉลี่ยแต่ละกลุ่มบุคคล</td>";
          string str3 = str1;
          float num4 = num1 / (float) num3;
          string str4 = num4.ToString("0.00");
          str1 = str3 + "<td  >" + str4 + "</td>";
          string str5 = str1;
          num4 = num2 / (float) num3;
          string str6 = num4.ToString("0.00");
          str1 = str5 + "<td >" + str6 + "</td>";
          str1 += "<td></td>";
          str1 += "</tr>";
          float num5 = (float) (((double) num1 + (double) num2) / (double) num3 / 2.0);
          str1 += "<tr>";
          str1 += "<td colspan='2' align='right'>ค่าเฉลี่ยความพึงพอใจในภาพรวม</td>";
          str1 = str1 + "<td colspan='2'>" + num5.ToString("0.00") + "</td>";
          str1 += "<td></td>";
          str1 += "</tr>";
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

    public string renderdata7()
    {
      string str1 = "";
      try
      {
        string str2 = this.Request["ID"].ToString();
        try
        {
          float num1 = 0.0f;
          int num2 = 0;
          string empty = string.Empty;
          SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
          connection.Open();
          string cmdText = "SELECT  ROW_NUMBER() OVER (ORDER BY id) AS No,[project],[total_result],[total_result],[total_result1],ID from QA_main_result where Standardid=@Standardid and active='1' order by Standardid";
          SqlCommand sqlCommand = new SqlCommand(cmdText, connection);
          sqlCommand.CommandText = cmdText;
          sqlCommand.Parameters.AddWithValue("@Standardid", (object) str2);
          SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
          if (sqlDataReader.HasRows)
          {
            while (sqlDataReader.Read())
            {
              str1 += "<tr>";
              str1 = str1 + "<td>" + sqlDataReader.GetValue(0).ToString() + "</td>";
              str1 = str1 + "<td>" + sqlDataReader.GetValue(1).ToString() + "</td>";
              str1 = str1 + "<td>" + sqlDataReader.GetValue(2).ToString() + "</td>";
              if (sqlDataReader.GetValue(2).ToString() != "")
                num1 += float.Parse(sqlDataReader.GetValue(2).ToString());
              str1 = str1 + "<td><span ><a class='btn btn-circle btn-danger'  onclick='ReGen(" + sqlDataReader.GetValue(5).ToString() + ")' )><i class='fa fa-trash'></i></a></td>";
              str1 += "</tr>";
              ++num2;
            }
          }
          if (num2 == 0)
            num2 = 1;
          str1 += "<tr>";
          str1 += "<td colspan='2' align='right'>รวม</td>";
          str1 = str1 + "<td >" + (num1 / (float) num2).ToString("0.00") + "</td>";
          str1 += "<td></td>";
          str1 += "</tr>";
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

    public string renderdata8()
    {
      string str1 = "";
      try
      {
        string str2 = this.Request["ID"].ToString();
        try
        {
          float num1 = 0.0f;
          float num2 = 0.0f;
          int num3 = 0;
          string empty = string.Empty;
          SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
          connection.Open();
          string cmdText = "SELECT  q.[id],[activities] ,[period],[Total],[Score] FROM [QA_activities] q where q.Active='1' and q.[projectid]=@projectid order by projectid";
          SqlCommand sqlCommand = new SqlCommand(cmdText, connection);
          sqlCommand.CommandText = cmdText;
          sqlCommand.Parameters.AddWithValue("@projectid", (object) str2);
          SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
          if (sqlDataReader.HasRows)
          {
            while (sqlDataReader.Read())
            {
              str1 += "<tr>";
              str1 = str1 + "<td>" + sqlDataReader.GetValue(1).ToString() + "</td>";
              str1 = str1 + "<td>" + sqlDataReader.GetValue(3).ToString() + "</td>";
              str1 = str1 + "<td>" + sqlDataReader.GetValue(4).ToString() + "</td>";
              str1 = str1 + "<td>" + sqlDataReader.GetValue(2).ToString() + "</td>";
              if (sqlDataReader.GetValue(3).ToString() != "")
                num1 += float.Parse(sqlDataReader.GetValue(3).ToString());
              if (sqlDataReader.GetValue(4).ToString() != "")
                num2 += float.Parse(sqlDataReader.GetValue(4).ToString());
              str1 = str1 + "<td><span ><a class='btn btn-circle btn-danger'  onclick='ReGen4(" + sqlDataReader.GetValue(0).ToString() + ")' )><i class='fa fa-trash'></i></a></td>";
              str1 += "</tr>";
              ++num3;
            }
          }
          str1 += "<tr>";
          str1 += "<td>รวม</td>";
          str1 = str1 + "<td>" + num1.ToString("0") + "</td>";
          str1 = str1 + "<td>" + num2.ToString("0") + "</td>";
          str1 += "<td></td>";
          str1 += "<td></td>";
          str1 += "</tr>";
          float num4 = (double) num1 == 0.0 ? 0.0f : (float) ((double) num2 / (double) num1 * 100.0);
          str1 += "<tr>";
          str1 += "<td></td>";
          str1 += "<td>คิดเป็นร้อยละ</td>";
          str1 = str1 + "<td>" + num4.ToString("0.00") + "</td>";
          str1 += "<td></td>";
          str1 += "<td></td>";
          str1 += "</tr>";
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

    public string renderdata2()
    {
      string str = "";
      try
      {
        string dt1 = this.Request["ID"].ToString();
        try
        {
          string empty = string.Empty;
          SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
          connection.Open();
          string cmdText = "SELECT  ROW_NUMBER() OVER (ORDER BY id) AS No,[project],[NAME],[timex],[file1],[file2],[file3],Standardid as id,ID as IDX from QA_main_result where Standardid=@Standardid and active='1'  order by Standardid";
          SqlCommand sqlCommand = new SqlCommand(cmdText, connection);
          sqlCommand.CommandText = cmdText;
          sqlCommand.Parameters.AddWithValue("@Standardid", (object) dt1);
          SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
          int num1 = 0;
          if (sqlDataReader.HasRows)
          {
            while (sqlDataReader.Read())
            {
              str += "<tr>";
              str = str + "<td>" + sqlDataReader.GetValue(0).ToString() + "</td>";
              str = str + "<td>" + sqlDataReader.GetValue(2).ToString() + "</td>";
              str = str + "<td>" + sqlDataReader.GetValue(1).ToString() + "</td>";
              str = str + "<td>" + sqlDataReader.GetValue(3).ToString() + "</td>";
              str = str + "<td><a class='btn btn-circle btn-success' target='_blank' href='Uploadfile1.aspx?id=" + sqlDataReader.GetValue(8).ToString() + "&idx=0' )><i class='fa fa-paperclip'></i></a>\r\n" + this.getitem1(sqlDataReader.GetValue(8).ToString(), dt1, "0") + "</td>";
              str = str + "<td><a class='btn btn-circle btn-success' target='_blank' href='Uploadfile1.aspx?id=" + sqlDataReader.GetValue(8).ToString() + "&idx=1' )><i class='fa fa-paperclip'></i></a>\r\n" + this.getitem1(sqlDataReader.GetValue(8).ToString(), dt1, "1") + "</td>";
              str = str + "<td><a class='btn btn-circle btn-success' target='_blank' href='Uploadfile1.aspx?id=" + sqlDataReader.GetValue(8).ToString() + "&idx=2' )><i class='fa fa-paperclip'></i></a>\r\n" + this.getitem1(sqlDataReader.GetValue(8).ToString(), dt1, "2") + "</td>";
              str = str + "<td><span ><a class='btn btn-circle btn-danger'  onclick='ReGen(" + sqlDataReader.GetValue(8).ToString() + ")' )><i class='fa fa-trash'></i></a></td>";
              str += "</tr>";
              ++num1;
            }
          }
          sqlCommand.Dispose();
          connection.Close();
          str += "<tr>";
          str += "<td colspan='6' align='center'>รวมจำนวนครู/อาจารย์ ครูฝึกที่ได้รับการเพิ่มพูนความรู้/ประสบการณ์</td>";
          str = str + "<td colspan='2' align='center'>" + num1.ToString() + "</td>";
          str += "</tr>";
          double num2 = (double) (num1 * 100) / double.Parse(this.TextBox9.Text);
          str += "<tr>";
          str += "<td colspan='6' align='center'>คิดเป็นร้อยละ</td>";
          str = str + "<td colspan='2' align='center'>" + num2.ToString("0.00") + "</td>";
          str += "</tr>";
        }
        catch
        {
        }
      }
      catch
      {
      }
      return str;
    }

    private int cnt_porject(string dt1, string project)
    {
      return int.Parse(new CConnect().sqlCmdReturn("SELECT  count(id) from QA_main_result where Standardid='" + dt1 + "' and active='1' and project='" + project + "' ").ToString());
    }

    public string renderdata4()
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
          string cmdText = "SELECT  ROW_NUMBER() OVER (ORDER BY id) AS No,[project],[NAME],[timex],[file1],[file2],[file3],Standardid as id,ID,remark as IDX from QA_main_result where Standardid=@Standardid and active='1'  order by Standardid";
          SqlCommand sqlCommand = new SqlCommand(cmdText, connection);
          sqlCommand.CommandText = cmdText;
          sqlCommand.Parameters.AddWithValue("@Standardid", (object) dt1);
          SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
          int num = 1;
          string str2 = "";
          if (sqlDataReader.HasRows)
          {
            while (sqlDataReader.Read())
            {
              str1 += "<tr>";
              if (str2 == "")
              {
                str2 = "1";
                num = this.cnt_porject(dt1, sqlDataReader.GetValue(1).ToString());
                str1 = str1 + "<td rowspan='" + (object) num + "'>" + sqlDataReader.GetValue(1).ToString() + "</td>";
              }
              str1 = str1 + "<td>" + sqlDataReader.GetValue(2).ToString() + "</td>";
              str1 = str1 + "<td><a class='btn btn-circle btn-success' target='_blank' href='Uploadfile1.aspx?id=" + sqlDataReader.GetValue(8).ToString() + "&idx=0' )><i class='fa fa-paperclip'></i></a>\r\n" + this.getitem1(sqlDataReader.GetValue(8).ToString(), dt1, "0") + "</td>";
              str1 = str1 + "<td><a class='btn btn-circle btn-success' target='_blank' href='Uploadfile1.aspx?id=" + sqlDataReader.GetValue(8).ToString() + "&idx=1' )><i class='fa fa-paperclip'></i></a>\r\n" + this.getitem1(sqlDataReader.GetValue(8).ToString(), dt1, "1") + "</td>";
              str1 = str1 + "<td><a class='btn btn-circle btn-success' target='_blank' href='Uploadfile1.aspx?id=" + sqlDataReader.GetValue(8).ToString() + "&idx=2' )><i class='fa fa-paperclip'></i></a>\r\n" + this.getitem1(sqlDataReader.GetValue(8).ToString(), dt1, "2") + "</td>";
              str1 = str1 + "<td><a class='btn btn-circle btn-success' target='_blank' href='Uploadfile1.aspx?id=" + sqlDataReader.GetValue(8).ToString() + "&idx=3' )><i class='fa fa-paperclip'></i></a>\r\n" + this.getitem1(sqlDataReader.GetValue(8).ToString(), dt1, "3") + "</td>";
              str1 = str1 + "<td><a class='btn btn-circle btn-success' target='_blank' href='Uploadfile1.aspx?id=" + sqlDataReader.GetValue(8).ToString() + "&idx=4' )><i class='fa fa-paperclip'></i></a>\r\n" + this.getitem1(sqlDataReader.GetValue(8).ToString(), dt1, "4") + "</td>";
              str1 = str1 + "<td>" + sqlDataReader.GetValue(9).ToString() + "</td>";
              str1 = str1 + "<td><span ><a class='btn btn-circle btn-danger'  onclick='ReGen(" + sqlDataReader.GetValue(8).ToString() + ")' )><i class='fa fa-trash'></i></a></td>";
              str1 += "</tr>";
              --num;
              if (num <= 0)
                str2 = "";
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

    public string renderdata5()
    {
      string str = "";
      try
      {
        string dt1 = this.Request["ID"].ToString();
        try
        {
          string empty = string.Empty;
          SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
          connection.Open();
          string cmdText = "SELECT  ROW_NUMBER() OVER (ORDER BY id) AS No,[project],[NAME],[timex],[file1],[file2],[file3],Standardid as id,ID as IDX from QA_main_result where Standardid=@Standardid and active='1'  order by Standardid";
          SqlCommand sqlCommand = new SqlCommand(cmdText, connection);
          sqlCommand.CommandText = cmdText;
          sqlCommand.Parameters.AddWithValue("@Standardid", (object) dt1);
          SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
          if (sqlDataReader.HasRows)
          {
            while (sqlDataReader.Read())
            {
              str += "<tr>";
              str = str + "<td>" + sqlDataReader.GetValue(1).ToString() + "</td>";
              str = str + "<td><a class='btn btn-circle btn-success' target='_blank' href='Uploadfile1.aspx?id=" + sqlDataReader.GetValue(8).ToString() + "&idx=0' )><i class='fa fa-paperclip'></i></a>\r\n" + this.getitem1(sqlDataReader.GetValue(8).ToString(), dt1, "0") + "</td>";
              str = str + "<td><a class='btn btn-circle btn-success' target='_blank' href='Uploadfile1.aspx?id=" + sqlDataReader.GetValue(8).ToString() + "&idx=1' )><i class='fa fa-paperclip'></i></a>\r\n" + this.getitem1(sqlDataReader.GetValue(8).ToString(), dt1, "1") + "</td>";
              str = str + "<td><a class='btn btn-circle btn-success' target='_blank' href='Uploadfile1.aspx?id=" + sqlDataReader.GetValue(8).ToString() + "&idx=2' )><i class='fa fa-paperclip'></i></a>\r\n" + this.getitem1(sqlDataReader.GetValue(8).ToString(), dt1, "2") + "</td>";
              str = str + "<td><a class='btn btn-circle btn-success' target='_blank' href='Uploadfile1.aspx?id=" + sqlDataReader.GetValue(8).ToString() + "&idx=3' )><i class='fa fa-paperclip'></i></a>\r\n" + this.getitem1(sqlDataReader.GetValue(8).ToString(), dt1, "3") + "</td>";
              str = str + "<td><a class='btn btn-circle btn-success' target='_blank' href='Uploadfile1.aspx?id=" + sqlDataReader.GetValue(8).ToString() + "&idx=4' )><i class='fa fa-paperclip'></i></a>\r\n" + this.getitem1(sqlDataReader.GetValue(8).ToString(), dt1, "4") + "</td>";
              str = str + "<td><a class='btn btn-circle btn-success' target='_blank' href='Uploadfile1.aspx?id=" + sqlDataReader.GetValue(8).ToString() + "&idx=5' )><i class='fa fa-paperclip'></i></a>\r\n" + this.getitem1(sqlDataReader.GetValue(8).ToString(), dt1, "5") + "</td>";
              str = str + "<td><a class='btn btn-circle btn-success' target='_blank' href='Uploadfile1.aspx?id=" + sqlDataReader.GetValue(8).ToString() + "&idx=6' )><i class='fa fa-paperclip'></i></a>\r\n" + this.getitem1(sqlDataReader.GetValue(8).ToString(), dt1, "6") + "</td>";
              str = str + "<td><span ><a class='btn btn-circle btn-danger'  onclick='ReGen(" + sqlDataReader.GetValue(8).ToString() + ")' )><i class='fa fa-trash'></i></a></td>";
              str += "</tr>";
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
      return str;
    }

    [WebMethod(EnableSession = true)]
    public static void ReGenToken1(string id)
    {
      try
      {
        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
        connection.Open();
        string cmdText = "update [QA_main_result_file] set active='0' where id=@id";
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

    [WebMethod(EnableSession = true)]
    public static void ReGenToken4(string id)
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

    [WebMethod(EnableSession = true)]
    public static void ReGenToken2(string id)
    {
      try
      {
        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
        connection.Open();
        string cmdText = "update [QA_main_result_file1] set active='0' where id=@id";
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

    [WebMethod(EnableSession = true)]
    public static void ReGenToken(string id)
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
      try
      {
        str = this.Request["ID"].ToString();
      }
      catch
      {
      }
      string sql = "INSERT INTO [QA_main_result]([Standardid],[project],[NAME],[timex],[file1],[remark],[Createdate],[Createby],[ACTIVE],[file2],[file3],[file4],[file5],[total_result],[file6],[file7],[total_result1]) VALUES('" + str + "','" + project + "','" + name + "','" + timex + "','" + filex + "','" + remark + "','" + (object) DateTime.Now + "','1','1','" + filex2 + "','" + filex3 + "','" + filex4 + "','" + filex5 + "','" + totalresult + "','" + filex6 + "','" + filex7 + "','" + totalresult1 + "')";
      cconnect.sqlCmd(sql);
    }

    private void update_qar(
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
      try
      {
        str = this.Request["ID"].ToString();
      }
      catch
      {
      }
      string sql = "UPDATE [QA_main_result] SET [project]=" + project + "',[NAME]='" + name + "',[timex]" + timex + ",[remark]=" + remark + ",[total_result1]" + totalresult1 + ",ACTIVE='1'  where Standardid ='" + str + "' ";
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
      string str = "";
      try
      {
        str = this.Request["ID"].ToString();
      }
      catch
      {
      }
      if (this.Label2.Text == "จำนวนบุคลากรของหน่วยทั้งหมด")
      {
        if (this.checkUserQA_main_Second(str) == 0)
          this.insert_reaul1("", this.TextBox9.Text, "", "", "");
        else
          this.updateQA_main_Second("", this.TextBox9.Text, "", "", "", str);
      }
      else if (this.checkUserQA_main_Second(str) == 0)
        this.insert_reaul1("", this.TextBox5.Text, "", "", "");
      else
        this.updateQA_main_Second("", this.TextBox5.Text, "", "", "", str);
      this.Page.Response.Redirect(this.Page.Request.Url.AbsoluteUri);
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
      if (this.TextBox11.Text != "" && double.Parse(this.TextBox11.Text) > 5.0)
        this.TextBox11.Text = "5";
      if (this.TextBox12.Text != "" && double.Parse(this.TextBox12.Text) > 5.0)
        this.TextBox12.Text = "5";
      if (this.TextBox13.Text != "" && double.Parse(this.TextBox13.Text) > 5.0)
        this.TextBox13.Text = "5";
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
      this.Page.Response.Redirect(this.Page.Request.Url.AbsoluteUri);
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
      if (this.checkUserQA_main_result(str) != 0)
        this.updateQA_main_result(str, this.TextBox9.Text);
      this.Page.Response.Redirect(this.Page.Request.Url.AbsoluteUri);
    }

    private int checkUser_bp7(string user, string project, string name)
    {
      return int.Parse(new CConnect().sqlCmdReturn("select count(Standardid) from QA_main_result where Standardid='" + user + "' and [project]='" + project + "' and [NAME]='" + name + "'").ToString());
    }

    protected void Button_gp7_Click(object sender, EventArgs e)
    {
      string filex = "";
      string filex2 = "";
      string filex3 = "";
      string filex4 = "";
      string filex5 = "";
      string user = "";
      try
      {
        user = this.Request["ID"].ToString();
      }
      catch
      {
      }
      if (this.checkUser_bp7(user, this.Text5.Value, this.Text11.Value) == 0)
        this.insert_qar(this.Text5.Value, this.Text11.Value, "", filex, this.Text4.Value, filex2, filex3, filex4, filex5, "1", "", "", "");
      this.Page.Response.Redirect(this.Page.Request.Url.AbsoluteUri);
    }

    private int checkUser_remark(string user, string project)
    {
      return int.Parse(new CConnect().sqlCmdReturn("select count(id) from QA_result_txt where Standardid='" + user + "'").ToString());
    }

    protected void insert_remark(string dt1, string remark)
    {
      new CConnect().sqlCmd("INSERT INTO [QA_result_txt]([Standardid],[Result],[Createdate],[Createby])  VALUES('" + dt1 + "','" + remark + "','" + (object) DateTime.Now + "','1')");
    }

    protected void update_remark(string dt1, string remark)
    {
      new CConnect().sqlCmd("UPDATE [QA_result_txt] SET [Result]='" + remark + "' where [Standardid]='" + dt1 + "'");
    }

    protected void Button_g103_Click(object sender, EventArgs e)
    {
      string str = "";
      try
      {
        str = this.Request["ID"].ToString();
      }
      catch
      {
      }
      if (this.checkUser_remark(str, "") == 0)
        this.insert_remark(str, this.Text131.Text);
      else
        this.update_remark(str, this.Text131.Text);
      this.Page.Response.Redirect(this.Page.Request.Url.AbsoluteUri);
    }

    private int checkUser_bp3(string user, string project)
    {
      return int.Parse(new CConnect().sqlCmdReturn("select count(Standardid) from QA_main_result where Standardid='" + user + "' and [project]='" + project + "'").ToString());
    }

    protected void Button_gp3_Click(object sender, EventArgs e)
    {
      string text;
      if (this.DropDownList3.Text == "อื่นๆ")
      {
        if (this.txtNName.Value == "")
        {
          this.ShowMessage("Activities Name can not be blank", asset_list.MessageType.Error);
          return;
        }
        text = this.Text14.Value;
      }
      else
        text = this.DropDownList3.Text;
      string user = "";
      try
      {
        user = this.Request["ID"].ToString();
      }
      catch
      {
      }
      if (this.checkUser_bp3(user, text) == 0)
        this.insert_qar(text, "", "", "", this.Text12.Value, "", "", "", "", "1", "", "", "");
      this.Page.Response.Redirect(this.Page.Request.Url.AbsoluteUri);
    }

    protected void Button21_Click(object sender, EventArgs e)
    {
      if (this.TextBox17.Text != "" && double.Parse(this.TextBox17.Text) > 5.0)
        this.TextBox17.Text = "5";
      if (this.TextBox16.Text != "" && double.Parse(this.TextBox16.Text) > 5.0)
        this.TextBox16.Text = "5";
      this.insert_qar(this.TextBox15.Text, "", "", "", "", "", "", "", "", this.TextBox16.Text, "", "", this.TextBox17.Text);
      this.Page.Response.Redirect(this.Page.Request.Url.AbsoluteUri);
    }

    protected void Button41_Click(object sender, EventArgs e)
    {
      string text;
      if (this.DropDownList4.Text == "อื่นๆ")
      {
        if (this.Text141.Value == "")
        {
          this.ShowMessage("Activities Name can not be blank", asset_list.MessageType.Error);
          return;
        }
        text = this.Text141.Value;
      }
      else
        text = this.DropDownList4.Text;
      string str = "";
      try
      {
        str = this.Request["ID"].ToString();
      }
      catch
      {
      }
      if (this.TextBox7.Text != "" && double.Parse(this.TextBox7.Text) > 5.0)
        this.TextBox7.Text = "5";
      this.insert_qar(text, "", "", "", "", "", "", "", "", this.TextBox7.Text, "", "", "");
      this.Page.Response.Redirect(this.Page.Request.Url.AbsoluteUri);
    }

    private int checkUser_bp9(string user)
    {
      return int.Parse(new CConnect().sqlCmdReturn("select count(Standardid) from QA_main_result1 where Standardid='" + user + "'").ToString());
    }

    protected void Button_gp9_Click(object sender, EventArgs e)
    {
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
      this.DropDownList4.Items.Clear();
      if (sqlDataReader.HasRows)
      {
        while (sqlDataReader.Read())
        {
          this.DropDownList2.Items.Add(sqlDataReader.GetValue(1).ToString());
          this.DropDownList3.Items.Add(sqlDataReader.GetValue(1).ToString());
          this.DropDownList4.Items.Add(sqlDataReader.GetValue(1).ToString());
        }
      }
      this.DropDownList2.Items.Add("อื่นๆ");
      this.DropDownList3.Items.Add("อื่นๆ");
      this.DropDownList4.Items.Add("อื่นๆ");
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
      if (sqlDataReader.HasRows)
      {
        while (sqlDataReader.Read())
          ;
      }
      sqlDataReader.Close();
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
