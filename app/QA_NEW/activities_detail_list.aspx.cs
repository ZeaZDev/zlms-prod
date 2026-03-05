// Decompiled with JetBrains decompiler
// Type: newweb.QA_NEW.activities_detail_list
// Assembly: newweb, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: A2E847A6-10D0-4271-9D59-55F01CDCC8B0
// Assembly location: C:\data\source-20190227T061536Z-001\source\lms\lms\bin\newweb.dll

using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace newweb.QA_NEW
{
  public class activities_detail_list : Page
  {
    protected Label Name;
    protected Label Desp;
    protected Label Course_name;

    protected void ShowMessage(string Message, activities_detail_list.MessageType type)
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
      string cmdText = "select p.Project,A.activities,ad.Activitiesdetail from QA_activities_detail ad inner join QA_activities a on a.id=ad.Activities inner join QA_project p on p.id=a.projectid where ad.id=@id";
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
        string cmdText = "Select [id],[FileName],[FilePath] from QA_activities_file where ActivitiesID=@ClassItemID and active='1'";
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

    public enum MessageType
    {
      Success,
      Error,
      Info,
      Warning,
    }
  }
}
