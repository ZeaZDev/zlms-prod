// Decompiled with JetBrains decompiler
// Type: newweb.QA.compareresult
// Assembly: newweb, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: A2E847A6-10D0-4271-9D59-55F01CDCC8B0
// Assembly location: C:\data\source-20190227T061536Z-001\source\lms\lms\bin\newweb.dll

using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.DataVisualization.Charting;
using System.Web.UI.WebControls;

namespace newweb.QA
{
  public class compareresult : Page
  {
    protected DropDownList DropDownList1;
    protected Button Button1;
    protected Chart Chart1;

    protected void Page_Load(object sender, EventArgs e)
    {
      this.coursename();
    }

    public void coursename()
    {
      SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
      connection.Open();
      string cmdText = "select id,[indicator] from [QA_Indicator]";
      SqlCommand sqlCommand = new SqlCommand(cmdText, connection);
      sqlCommand.CommandText = cmdText;
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

    public void getdata()
    {
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
      string str = "";
      int length = this.DropDownList1.Text.IndexOf(",");
      if (length != -1)
        str = this.DropDownList1.Text.Substring(0, length);
      SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
      connection.Open();
      string cmdText = "SELECT  qr.Projectid,qd.Standard_detail,qd.Weight*qr.Score as multiple FROM [QA_result] qr  left join QA_standard_detail qd on qr.standard_detail_id=qd.id left join QA_standard qsd on qsd.id=qd.Standardid left join QA_Indicator qi on qi.id=qsd.qaindicator left join QA_project qp on qp.id=qr.projectid where qi.id='1'";
      SqlCommand sqlCommand = new SqlCommand(cmdText, connection);
      sqlCommand.CommandText = cmdText;
      sqlCommand.Parameters.AddWithValue("@id", (object) str);
      SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
      this.Chart1.Series[0].Name = "ศูนย์ฝึกอบรมตำรวจภูธรภาค1";
      this.Chart1.Series[1].Name = "กองบังคับการฝึกอบรมตำรวจกลาง";
      if (sqlDataReader.HasRows)
      {
        while (sqlDataReader.Read())
        {
          if (sqlDataReader.GetValue(0).ToString() == "1")
            this.Chart1.Series[0].Points.AddXY((object) sqlDataReader.GetValue(1).ToString(), (object) sqlDataReader.GetValue(2).ToString());
          else
            this.Chart1.Series[1].Points.AddXY((object) sqlDataReader.GetValue(1).ToString(), (object) sqlDataReader.GetValue(2).ToString());
        }
      }
      this.Chart1.Series[0].IsValueShownAsLabel = true;
      this.Chart1.Series[1].IsValueShownAsLabel = true;
      this.Chart1.ChartAreas[0].AxisX.IsLabelAutoFit = true;
      sqlDataReader.Close();
      sqlCommand.Dispose();
      connection.Close();
    }
  }
}
