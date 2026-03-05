// Decompiled with JetBrains decompiler
// Type: newweb.Certificate.Issue
// Assembly: newweb, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: A2E847A6-10D0-4271-9D59-55F01CDCC8B0
// Assembly location: C:\data\source-20190227T061536Z-001\source\lms\lms\bin\newweb.dll

using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace newweb.Certificate
{
  public class Issue : Page
  {
    protected GridView gvDP;
    protected SqlDataSource sqlDP;
    protected DropDownList DropDownList1;
    protected DropDownList DropDownList2;
    protected Button bnAdduser;

    protected void Page_Load(object sender, EventArgs e)
    {
      if (this.IsPostBack)
        return;
      this.ADD_COM_CODE();
      this.ADD_COM_CODE1();
    }

    public void ADD_COM_CODE()
    {
      SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
      connection.Open();
      string cmdText = "SELECT [id],[CourseName]  FROM [Course] where Active='1'";
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

    public void ADD_COM_CODE1()
    {
      SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
      connection.Open();
      string cmdText = "SELECT [id],[Certificatename]  FROM [Certificate] where Active='1'";
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

    [WebMethod(EnableSession = true)]
    public static void SetSession(string ssname, string val)
    {
      HttpContext.Current.Session[ssname] = (object) val;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
      LinkButton linkButton = (LinkButton) sender;
      if (linkButton.CommandArgument.ToString().Trim().Length <= 0)
        return;
      this.Response.Redirect("ViewCertificate.aspx?id=" + linkButton.CommandArgument.ToString().Trim());
    }

    protected void bnAdduser_Click(object sender, EventArgs e)
    {
      ScriptManager.RegisterStartupScript((Page) this, this.GetType(), "Pop", "openModal();", true);
      this.addUser();
      this.sqlDP.DataBind();
      this.gvDP.DataBind();
    }

    private void addUser()
    {
      CConnect cconnect = new CConnect();
      string str1 = "";
      int length = this.DropDownList1.Text.IndexOf(",");
      if (length != -1)
        str1 = this.DropDownList1.Text.Substring(0, length);
      string str2 = "";
      if (this.DropDownList2.Text.IndexOf(",") != -1)
        str2 = this.DropDownList2.Text.Substring(0, length);
      string sql = "UPDATE Course set Certificate_id='" + str2 + "' where [id]='" + str1 + "'";
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
