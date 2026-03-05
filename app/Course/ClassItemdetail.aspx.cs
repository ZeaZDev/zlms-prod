// Decompiled with JetBrains decompiler
// Type: newweb.Course.ClassItemdetail
// Assembly: newweb, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: A2E847A6-10D0-4271-9D59-55F01CDCC8B0
// Assembly location: C:\data\source-20190227T061536Z-001\source\lms\lms\bin\newweb.dll

using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace newweb.Course
{
  public class ClassItemdetail : Page
  {
    protected HyperLink hyperlink1;
    protected HyperLink hyperlink2;
    protected HyperLink hyperlink3;
    protected Label Name;
    protected Label Desp;
    protected Label Course_name;
    protected Label ClassName;
    protected Label Label1;
    protected Button Button1;

    protected void ShowMessage(string Message, ClassItemdetail.MessageType type)
    {
      ScriptManager.RegisterStartupScript((Page) this, this.GetType(), Guid.NewGuid().ToString(), "ShowMessage('" + Message + "','" + (object) type + "');", true);
    }

    protected void Page_Load(object sender, EventArgs e)
    {
      if (this.IsPostBack)
        return;
      try
      {
        this.coursename(this.Request["ID"].ToString());
      }
      catch
      {
        this.Response.Redirect("default.aspx");
      }
    }

    private string coursename(string classid)
    {
      string str = "";
      SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
      connection.Open();
      string cmdText = " select clt.ClassItemName,clt.ClassItemDesp,pr.PeriodName,c.CourseName,cl.ClassName,cl.id,c.id,clt.PeriodID,clt.QuestionID from [ClassItem] clt inner join [Period] pr on pr.id=clt.PeriodID  inner join Class cl on cl.id=pr.ClassID inner join Course C on c.id=cl.CourseID where clt.id=@id";
      SqlCommand sqlCommand = new SqlCommand(cmdText, connection);
      sqlCommand.CommandText = cmdText;
      sqlCommand.Parameters.AddWithValue("@id", (object) classid);
      SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
      if (sqlDataReader.HasRows)
      {
        sqlDataReader.Read();
        this.Name.Text = sqlDataReader.GetValue(0).ToString();
        this.Desp.Text = sqlDataReader.GetValue(1).ToString();
        this.Course_name.Text = sqlDataReader.GetValue(3).ToString();
        this.ClassName.Text = sqlDataReader.GetValue(4).ToString();
        this.Label1.Text = sqlDataReader.GetValue(2).ToString();
        this.hyperlink1.NavigateUrl = "Coursedetail.aspx?id=" + sqlDataReader.GetValue(6).ToString();
        this.hyperlink2.NavigateUrl = "class.aspx?id=" + sqlDataReader.GetValue(5).ToString();
        this.hyperlink3.NavigateUrl = "period.aspx?id=" + sqlDataReader.GetValue(7).ToString();
        if (sqlDataReader.GetValue(8).ToString() != "")
          str = sqlDataReader.GetValue(8).ToString();
      }
      sqlDataReader.Close();
      sqlCommand.Dispose();
      connection.Close();
      return str;
    }

    public string renderdata()
    {
      string classid = "";
      try
      {
        classid = this.Request["ID"].ToString();
        this.coursename(classid);
      }
      catch
      {
      }
      string str = "";
      try
      {
        string empty = string.Empty;
        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
        connection.Open();
        string cmdText = "Select [id],[FileName],[FilePath] from ClassitemFile where ClassItemID=@ClassItemID and active='1'";
        SqlCommand sqlCommand = new SqlCommand(cmdText, connection);
        sqlCommand.CommandText = cmdText;
        sqlCommand.Parameters.AddWithValue("@ClassItemID", (object) classid);
        SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
        if (sqlDataReader.HasRows)
        {
          sqlDataReader.Read();
          str += "<div class='col-md-8'> ";
          str += "<div class='col-sm-2'><span class='pull-right'>Download file</span></div>";
          str += "<div class='col-sm-6'>";
          str = str + "<a href='/Upload/" + classid + "/" + sqlDataReader.GetValue(1).ToString() + "' download><span >" + sqlDataReader.GetValue(1).ToString() + "</span></a> <span ><a class='btn btn-circle btn-danger' onclick='ReGen(" + sqlDataReader.GetValue(0).ToString() + ")' )><i class='fa fa-trash'></i></a></span>";
          str += "</div>  <div class='col-sm-4'></div>";
          str += "</div> <div class='col-md-4'></div> </div><div class='col-md-12'> ";
          while (sqlDataReader.Read())
          {
            str += "<div class='col-md-8'> ";
            str += "<div class='col-sm-2'></div>";
            str += "<div class='col-sm-6'>";
            str = str + "<a href='/Upload/" + classid + "/" + sqlDataReader.GetValue(1).ToString() + "' download><span >" + sqlDataReader.GetValue(1).ToString() + "</span></a><span ><a class='btn btn-circle btn-danger' onclick='ReGen(" + sqlDataReader.GetValue(0).ToString() + ")' )><i class='fa fa-trash'></i></a></span>";
            str += "</div>  <div class='col-sm-4'></div>";
            str += "</div> <div class='col-md-4'></div></div><div class='col-md-12'> ";
          }
        }
        else
        {
          str += "<div class='col-md-8'> ";
          str += "<div class='col-sm-2'><span class='pull-right'>Download file</span></div>";
          str += "<div class='col-sm-6'>";
          str += "<span class='pull-left'>";
          str += "</div>  <div class='col-sm-4'></div>";
          str += "</div> <div class='col-md-4'></div></div><div class='col-md-12'> ";
        }
      }
      catch
      {
      }
      return str;
    }

    public string renderdata1()
    {
      string str1 = "";
      try
      {
        str1 = this.coursename(this.Request["ID"].ToString());
      }
      catch
      {
      }
      string str2 = "";
      try
      {
        string empty = string.Empty;
        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
        connection.Open();
        string cmdText = "SELECT qd.id,[Question_detail],qdata.Question_data,qdata.id FROM Question_detail qd inner join Question_data qdata on qdata.Question_detail_id=qd.id where [Question_id]=@ID";
        SqlCommand sqlCommand = new SqlCommand(cmdText, connection);
        sqlCommand.CommandText = cmdText;
        sqlCommand.Parameters.AddWithValue("@ID", (object) str1);
        SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
        string str3 = "";
        int num1 = 0;
        int num2 = 1;
        if (sqlDataReader.HasRows)
        {
          while (sqlDataReader.Read())
          {
            if (str3 == "")
            {
              str3 = sqlDataReader.GetValue(0).ToString();
              str2 += "  <div class='form-body'>";
              str2 = str2 + " <div class='col-sm-12  form-control' >" + num2.ToString() + ". " + sqlDataReader.GetValue(1).ToString() + "</div>";
              str2 += " ";
              num1 = 0;
            }
            if (str3 != sqlDataReader.GetValue(0).ToString())
            {
              ++num2;
              if (num1 % 2 != 0)
                str2 += "<div class='col-sm-6'>&nbsp;</div>  ";
              str3 = sqlDataReader.GetValue(0).ToString();
              str2 += " </div><div class='col-md-12'>&nbsp;</div>";
              str2 += " <div class='form-body'>";
              str2 = str2 + " <div class='col-sm-12  form-control'>" + num2.ToString() + ". " + sqlDataReader.GetValue(1).ToString() + "</div>";
              num1 = 0;
            }
            if (sqlDataReader.GetValue(2).ToString() != "")
              str2 = str2 + "<div class='col-sm-6'><input type='radio' name='" + sqlDataReader.GetValue(0).ToString() + "' value='" + sqlDataReader.GetValue(3).ToString() + "'>" + sqlDataReader.GetValue(2).ToString() + "</div>  ";
            ++num1;
          }
          str2 += " </div><div class='col-md-12'>&nbsp;</div>";
        }
      }
      catch
      {
      }
      return str2;
    }

    [WebMethod(EnableSession = true)]
    public static void ReGenToken(string id)
    {
      try
      {
        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
        connection.Open();
        string cmdText = "update [ClassitemFile] set active='0' where id=@id";
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

    private string[] getquestion(string classid)
    {
      string[] array = new string[100];
      SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
      connection.Open();
      string cmdText = " select id from Question_detail where  Question_id=@id";
      SqlCommand sqlCommand = new SqlCommand(cmdText, connection);
      sqlCommand.CommandText = cmdText;
      sqlCommand.Parameters.AddWithValue("@id", (object) classid);
      SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
      int newSize = 0;
      if (sqlDataReader.HasRows)
      {
        while (sqlDataReader.Read())
        {
          array[newSize] = sqlDataReader.GetValue(0).ToString();
          ++newSize;
        }
      }
      Array.Resize<string>(ref array, newSize);
      sqlDataReader.Close();
      sqlCommand.Dispose();
      connection.Close();
      return array;
    }

    protected void checkanswer(string detailid, string answerid)
    {
      SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
      connection.Open();
      string cmdText = "SELECT [Question_weight],qdata.Iscorrect,qd.Question_id  FROM [Question_detail] qd inner join Question_data qdata on qdata.id=@answerid where qd.id=@id";
      SqlCommand sqlCommand = new SqlCommand(cmdText, connection);
      sqlCommand.CommandText = cmdText;
      sqlCommand.Parameters.AddWithValue("@id", (object) detailid);
      sqlCommand.Parameters.AddWithValue("@answerid", (object) answerid);
      SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
      if (sqlDataReader.HasRows)
      {
        sqlDataReader.Read();
        if (sqlDataReader.GetValue(1).ToString() == "1")
          this.addUser(detailid, answerid, sqlDataReader.GetValue(0).ToString(), "1", sqlDataReader.GetValue(2).ToString());
        else
          this.addUser(detailid, answerid, "0", "0", sqlDataReader.GetValue(2).ToString());
      }
      sqlDataReader.Close();
      sqlCommand.Dispose();
      connection.Close();
    }

    private void addUser(
      string detailid,
      string answerid,
      string score,
      string Iscorrect,
      string dt1)
    {
      new CConnect().sqlCmd("INSERT INTO [Member_answer] ([userid],[Question_id],[Questiondetail_id],[Question_answer],[Score],[Createdate],[Iscorrect]) VALUES('4','" + dt1 + "','" + detailid + "','" + answerid + "','" + score + "','" + (object) DateTime.Now + "','" + Iscorrect + "')");
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
      try
      {
        string[] strArray = this.getquestion(this.coursename(this.Request["ID"].ToString()));
        int length = strArray.Length;
        for (int index = 0; index < length; ++index)
        {
          if (string.Format("{0}", (object) this.Request.Form[strArray[index]]) == "")
          {
            this.ShowMessage("Some question is nor answer", ClassItemdetail.MessageType.Error);
            break;
          }
        }
        for (int index = 0; index < length; ++index)
        {
          string answerid = string.Format("{0}", (object) this.Request.Form[strArray[index]]);
          this.checkanswer(strArray[index], answerid);
        }
      }
      catch (Exception ex)
      {
        this.Label1.Text = ex.Message;
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
