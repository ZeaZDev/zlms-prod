// Decompiled with JetBrains decompiler
// Type: newweb.Certificate.Certificatedetail_user
// Assembly: newweb, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: A2E847A6-10D0-4271-9D59-55F01CDCC8B0
// Assembly location: C:\data\source-20190227T061536Z-001\source\lms\lms\bin\newweb.dll

using DevExpress.XtraReports.UI;
using DevExpress.XtraReports.Web;
using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;

namespace newweb.Certificate
{
  public class Certificatedetail_user : Page
  {
    protected ASPxDocumentViewer ASPxDocumentViewer1;

    protected void Page_Load(object sender, EventArgs e)
    {
      try
      {
        this.coursename(this.Request["ID"].ToString(), this.Request["courseid"].ToString());
      }
      catch (Exception ex)
      {
        string message = ex.Message;
      }
    }

    private string mapmonth(string mapm)
    {
      switch (mapm)
      {
        case "1":
          return "มกราคม";
        case "10":
          return "ตุลาคม";
        case "11":
          return "พฤศจิกายน";
        case "12":
          return "ธันวาคม";
        case "2":
          return "กุมภาพันธ์";
        case "3":
          return "มีนาคม";
        case "4":
          return "เมษายน";
        case "5":
          return "พฤษภาคม";
        case "6":
          return "มิถุนายน";
        case "7":
          return "กรกฎาคม";
        case "8":
          return "สิงหาคม";
        case "9":
          return "กันยายน";
        default:
          return "JAN";
      }
    }

    private XtraReport GetReportByName(string userid, string courseid, string filex)
    {
      XtraReport xtraReport = (XtraReport) new XtraReport1();
      string str1 = HttpContext.Current.Server.MapPath("~/Cerfile/");
      SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
      connection.Open();
      string cmdText = "SELECT cx.id,c.CourseName,c.Roundx,DAY(c.Stopdate) as datex,MONTH(c.Stopdate) as monthx,YEAR(c.Stopdate) as yearx,M.name,cc.COMMISSIONER_genneral,cc.COMMISSIONER_Education,cc.COMMANDER_Education FROM [POLICE_LMS].[dbo].[Course] c inner join Certificate cx on cx.id=c.Certificate_id inner join Member_course mc on mc.courseid=c.id and mc.userid=@userid inner join Member m on mc.userid=m.id inner join Certificate_common cc on cc.id='1' where c.id=@id";
      SqlCommand sqlCommand = new SqlCommand(cmdText, connection);
      sqlCommand.CommandText = cmdText;
      sqlCommand.Parameters.AddWithValue("@id", (object) courseid);
      sqlCommand.Parameters.AddWithValue("@userid", (object) userid);
      SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
      if (sqlDataReader.HasRows)
      {
        sqlDataReader.Read();
        string str2 = sqlDataReader.GetValue(0).ToString();
        string str3 = str1 + str2 + "\\" + filex;
      }
      sqlDataReader.Close();
      sqlCommand.Dispose();
      connection.Close();
      return xtraReport;
    }

    public void coursename(string userid, string classid)
    {
    }
  }
}
