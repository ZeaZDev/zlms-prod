// Decompiled with JetBrains decompiler
// Type: newweb.Course_user.classitemdetail
// Assembly: newweb, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: A2E847A6-10D0-4271-9D59-55F01CDCC8B0
// Assembly location: C:\data\source-20190227T061536Z-001\source\lms\lms\bin\newweb.dll

using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace newweb.Course_user
{
  public class classitemdetail : Page
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

    protected void ShowMessage(string Message, classitemdetail.MessageType type)
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

    private string checkquestion(string dt1)
    {
      string str = "";
      SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
      connection.Open();
      string cmdText = "SELECT cit.QuestionID,mq.Questionid  FROM [ClassItem] cit left join Member_Question mq on mq.[Questionid]=cit.QuestionID and mq.userid=@userid where cit.ID=@id";
      SqlCommand sqlCommand = new SqlCommand(cmdText, connection);
      sqlCommand.CommandText = cmdText;
      sqlCommand.Parameters.AddWithValue("@id", (object) dt1);
      sqlCommand.Parameters.AddWithValue("@userid", (object) this.Session["IDX"].ToString());
      SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
      if (sqlDataReader.HasRows)
      {
        sqlDataReader.Read();
        if (sqlDataReader.GetValue(0).ToString() == sqlDataReader.GetValue(1).ToString())
          str = "A";
        else if (sqlDataReader.GetValue(0).ToString() == "")
          str = "N";
        else if (sqlDataReader.GetValue(0).ToString() == "")
          str = "S";
      }
      sqlDataReader.Close();
      sqlCommand.Dispose();
      connection.Close();
      return str;
    }

    private classitemdetail.Simplequestion checkispass(string dt1)
    {
      classitemdetail.Simplequestion simplequestion = new classitemdetail.Simplequestion();
      SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
      connection.Open();
      string cmdText = "SELECT [Isview],[Isshuffle],[Isresult] from Question where id=@id";
      SqlCommand sqlCommand = new SqlCommand(cmdText, connection);
      sqlCommand.CommandText = cmdText;
      sqlCommand.Parameters.AddWithValue("@id", (object) dt1);
      SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
      if (sqlDataReader.HasRows)
      {
        sqlDataReader.Read();
        simplequestion.Isview = sqlDataReader.GetValue(0).ToString();
        simplequestion.Isshuffle = sqlDataReader.GetValue(1).ToString();
        simplequestion.Isresult = sqlDataReader.GetValue(2).ToString();
      }
      sqlDataReader.Close();
      sqlCommand.Dispose();
      connection.Close();
      return simplequestion;
    }

    private string showrdetailresult(string dt1, string answer)
    {
      string str1 = "";
      SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
      connection.Open();
      string cmdText = "SELECT ma.Question_answer,qd.Question_detail,qdata.Question_data,qdata.Iscorrect, qd.Question_weight,q.QuestionPass   FROM [Member_answer] ma inner join Question_data qdata on qdata.id=ma.Question_answer inner join Question_detail qd on qd.id=ma.Questiondetail_id  inner join Question q on q.id=ma.Question_id where ma.userid=@id";
      SqlCommand sqlCommand = new SqlCommand(cmdText, connection);
      sqlCommand.CommandText = cmdText;
      sqlCommand.Parameters.AddWithValue("@id", (object) this.Session["IDX"].ToString());
      SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
      float num1 = 0.0f;
      float num2 = 0.0f;
      float num3 = 0.0f;
      float num4 = 0.0f;
      float num5 = 0.0f;
      if (answer == "0")
        str1 += "<div class='form-body'><div class='col-sm-12 '><p>Your answer is:</p>";
      if (sqlDataReader.HasRows)
      {
        while (sqlDataReader.Read())
        {
          if (sqlDataReader.GetValue(3).ToString() == "True")
          {
            num2 += float.Parse(sqlDataReader.GetValue(4).ToString());
            ++num3;
          }
          num5 = float.Parse(sqlDataReader.GetValue(5).ToString());
          num1 += float.Parse(sqlDataReader.GetValue(4).ToString());
          ++num4;
          if (answer == "0")
            str1 = str1 + "<p>Question : " + sqlDataReader.GetValue(1).ToString() + "</p><p>Your answer " + sqlDataReader.GetValue(2).ToString() + "</p><br>";
        }
      }
      if (answer == "0")
        str1 += "</div></div><br>";
      sqlDataReader.Close();
      sqlCommand.Dispose();
      connection.Close();
      float num6 = (float) ((double) num2 / (double) num1 * 100.0);
      string str2 = str1 + "<div class='form-body'><div class='col-sm-12 '>";
      return ((double) num6 < (double) num5 ? str2 + "<p><font size='3' color='red'>You are not pass the test</font></p>" : str2 + "<p><font size='5' color='green'>You are pass the test</font></p>") + "<p>The result of this test is:</p><p>Correct " + num3.ToString("0") + " out of " + num4.ToString("0") + "</p><p>Score " + num2.ToString("0") + " out of " + num1.ToString("0") + "</p><p>Require pass this question " + num5.ToString("0.00") + "%</p><p>Total % of this question " + num6.ToString("0.00") + "%</p></div></div>";
    }

    private string showrdansresult(string dt1)
    {
      string str1 = "";
      SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
      connection.Open();
      string cmdText = "select qd.Question_detail,qdata.Question_data,qdata.Detail_answer from Question q inner join Question_detail qd on qd.Question_id=q.id inner join Question_data qdata on qdata.Question_detail_id=qd.id and qdata.Iscorrect='1' where q.id=@id group by qd.Question_detail,qdata.Question_data,qdata.Detail_answer";
      SqlCommand sqlCommand = new SqlCommand(cmdText, connection);
      sqlCommand.CommandText = cmdText;
      sqlCommand.Parameters.AddWithValue("@id", (object) dt1);
      SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
      string str2 = str1 + "<div class='form-body'><div class='col-sm-12 '><p>The detail answer of this test is:</p>";
      if (sqlDataReader.HasRows)
      {
        while (sqlDataReader.Read())
          str2 = str2 + "<p>Question : " + sqlDataReader.GetValue(0).ToString() + "</p><p>Correct answer " + sqlDataReader.GetValue(1).ToString() + "</p><p>detail Answer " + sqlDataReader.GetValue(2).ToString() + "</p><br>";
      }
      string str3 = str2 + "</div></div>";
      sqlDataReader.Close();
      sqlCommand.Dispose();
      connection.Close();
      return str3;
    }

    public string renderdata1()
    {
      string dt1 = "";
      string str1 = "";
      classitemdetail.Simplequestion simplequestion = new classitemdetail.Simplequestion();
      try
      {
        string str2 = this.Request["ID"].ToString();
        dt1 = this.coursename(str2);
        str1 = this.checkquestion(str2);
        simplequestion = this.checkispass(dt1);
      }
      catch
      {
      }
      string str3 = "";
      if (str1 == "A")
      {
        str3 = !(simplequestion.Isview == "True") ? str3 + "  <div class='form-body'> <div class='col-sm-12  form-control' >You already done this test</div> </div>" : (!(simplequestion.Isresult == "True") ? this.showrdetailresult(dt1, "1") : str3 + this.showrdetailresult(dt1, "0") + "<br>" + this.showrdansresult(dt1));
        this.Button1.Visible = false;
      }
      else if (str1 == "N")
      {
        str3 += "  <div class='form-body'> <div class='col-sm-12  form-control' >No Question in this test</div> </div>";
        this.Button1.Visible = false;
      }
      else
      {
        try
        {
          string empty = string.Empty;
          SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
          connection.Open();
          string cmdText = !(simplequestion.Isshuffle == "True") ? "SELECT qd.id,[Question_detail],qdata.Question_data,qdata.id FROM Question_detail qd inner join Question_data qdata on qdata.Question_detail_id=qd.id where [Question_id]=@ID" : "SELECT qd.id,[Question_detail],qdata.Question_data,qdata.id FROM Question_detail qd inner join Question_data qdata on qdata.Question_detail_id=qd.id where [Question_id]=@ID ORDER BY NEWID()";
          SqlCommand sqlCommand = new SqlCommand(cmdText, connection);
          sqlCommand.CommandText = cmdText;
          sqlCommand.Parameters.AddWithValue("@ID", (object) dt1);
          SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
          string str2 = "";
          int num1 = 0;
          int num2 = 1;
          if (sqlDataReader.HasRows)
          {
            while (sqlDataReader.Read())
            {
              if (str2 == "")
              {
                str2 = sqlDataReader.GetValue(0).ToString();
                str3 += "  <div class='form-body'>";
                str3 = str3 + " <div class='col-sm-12  form-control' >" + num2.ToString() + ". " + sqlDataReader.GetValue(1).ToString() + "</div>";
                str3 += " ";
                num1 = 0;
              }
              if (str2 != sqlDataReader.GetValue(0).ToString())
              {
                ++num2;
                if (num1 % 2 != 0)
                  str3 += "<div class='col-sm-6'>&nbsp;</div>  ";
                str2 = sqlDataReader.GetValue(0).ToString();
                str3 += " </div><div class='col-md-12'>&nbsp;</div>";
                str3 += " <div class='form-body'>";
                str3 = str3 + " <div class='col-sm-12  form-control'>" + num2.ToString() + ". " + sqlDataReader.GetValue(1).ToString() + "</div>";
                num1 = 0;
              }
              if (sqlDataReader.GetValue(2).ToString() != "")
                str3 = str3 + "<div class='col-sm-6'><input type='radio' name='" + sqlDataReader.GetValue(0).ToString() + "' value='" + sqlDataReader.GetValue(3).ToString() + "'>" + sqlDataReader.GetValue(2).ToString() + "</div>  ";
              ++num1;
            }
            str3 += " </div><div class='col-md-12'>&nbsp;</div>";
          }
        }
        catch
        {
        }
      }
      return str3;
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

    private classitemdetail.Simpleanswer checkanswer(
      string detailid,
      string answerid)
    {
      classitemdetail.Simpleanswer simpleanswer = new classitemdetail.Simpleanswer();
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
        if (sqlDataReader.GetValue(1).ToString() == "True")
        {
          this.addUser1(detailid, answerid, sqlDataReader.GetValue(0).ToString(), "1", sqlDataReader.GetValue(2).ToString());
          simpleanswer.correct = "1";
        }
        else
        {
          this.addUser1(detailid, answerid, "0", "0", sqlDataReader.GetValue(2).ToString());
          simpleanswer.correct = "0";
        }
        if (sqlDataReader.GetValue(0).ToString() != "")
          simpleanswer.score = sqlDataReader.GetValue(0).ToString();
      }
      sqlDataReader.Close();
      sqlCommand.Dispose();
      connection.Close();
      return simpleanswer;
    }

    private void addUser(string dt1, float score, float totalpass)
    {
      new CConnect().sqlCmd("INSERT INTO [Member_Question] ([userid],[Questionid],[Createdate],TotalScore,Score) VALUES('" + this.Session["IDX"].ToString() + "','" + dt1 + "','" + (object) DateTime.Now + "','" + (object) score + "','" + (object) totalpass + "')");
    }

    private void addUser1(
      string detailid,
      string answerid,
      string score,
      string Iscorrect,
      string dt1)
    {
      new CConnect().sqlCmd("INSERT INTO [Member_answer] ([userid],[Question_id],[Questiondetail_id],[Question_answer],[Score],[Createdate],[Iscorrect]) VALUES('" + this.Session["IDX"].ToString() + "','" + dt1 + "','" + detailid + "','" + answerid + "','" + score + "','" + (object) DateTime.Now + "','" + Iscorrect + "')");
    }

    protected void fillquestion(string detailid, string answerid, float score, float totalpass)
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
        this.addUser(sqlDataReader.GetValue(2).ToString(), score, totalpass);
      }
      sqlDataReader.Close();
      sqlCommand.Dispose();
      connection.Close();
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
            this.ShowMessage("Some question is nor answer", classitemdetail.MessageType.Error);
            break;
          }
        }
        float score = 0.0f;
        float totalpass = 0.0f;
        classitemdetail.Simpleanswer simpleanswer1 = new classitemdetail.Simpleanswer();
        for (int index = 0; index < length; ++index)
        {
          string answerid = string.Format("{0}", (object) this.Request.Form[strArray[index]]);
          classitemdetail.Simpleanswer simpleanswer2 = this.checkanswer(strArray[index], answerid);
          score += float.Parse(simpleanswer2.score);
          if (simpleanswer2.correct == "1")
            ++totalpass;
        }
        if (length <= 0)
          return;
        string answerid1 = string.Format("{0}", (object) this.Request.Form[strArray[0]]);
        this.fillquestion(strArray[0], answerid1, score, totalpass);
      }
      catch (Exception ex)
      {
        this.Label1.Text = ex.Message;
      }
    }

    private struct Simplequestion
    {
      public string Isresult;
      public string Isview;
      public string Isshuffle;
    }

    private struct Simpleanswer
    {
      public string correct;
      public string score;
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
