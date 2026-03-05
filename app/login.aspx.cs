// Decompiled with JetBrains decompiler
// Type: newweb.login
// Assembly: newweb, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: A2E847A6-10D0-4271-9D59-55F01CDCC8B0
// Assembly location: C:\data\source-20190227T061536Z-001\source\lms\lms\bin\newweb.dll

using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace newweb
{
  public class login : Page
  {
    protected HtmlForm form1;
    protected HtmlInputText txtUsername;
    protected HtmlInputPassword txtPassword;
    protected Button bnLogin;
    protected Label Label1;
    protected HtmlInputText emailc;
    protected Button bnAdduser;

    protected void ShowMessage(string Message, login.MessageType type)
    {
      ScriptManager.RegisterStartupScript((Page) this, this.GetType(), Guid.NewGuid().ToString(), "ShowMessage('" + Message + "','" + (object) type + "');", true);
    }

    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void bnSubmit_Click(object sender, EventArgs e)
    {
      ScriptManager.RegisterStartupScript((Page) this, this.GetType(), "Pop", "openModal();", true);
      string email = this.checkUser(this.emailc.Value);
      if (email != "")
        this.addUser(email);
      this.SendMail(this.getSaltString());
      this.ShowMessage("Email send to the email register", login.MessageType.Success);
    }

    protected void SendMail(string mainbody)
    {
      MailMessage message1 = new MailMessage();
      SmtpClient smtpClient = new SmtpClient();
      try
      {
        message1.Subject = "You password is";
        message1.Body = mainbody;
        message1.From = new MailAddress("pera.nul@gmail.com");
        message1.To.Add("pera.nul@gmail.com");
        message1.IsBodyHtml = true;
        smtpClient.Host = "smtp.gmail.com";
        NetworkCredential networkCredential = new NetworkCredential("pera.nul@gmail.com", "bb212525");
        smtpClient.Port = int.Parse("587");
        smtpClient.EnableSsl = true;
        smtpClient.UseDefaultCredentials = false;
        smtpClient.Credentials = (ICredentialsByHost) networkCredential;
        smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
        smtpClient.Send(message1);
      }
      catch (Exception ex)
      {
        string message2 = ex.Message;
      }
    }

    protected string getSaltString()
    {
      string str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890abcdefghijklmnopqrstuvwxyz";
      StringBuilder stringBuilder = new StringBuilder();
      Random random = new Random();
      while (stringBuilder.Length < 24)
      {
        int index = (int) (random.NextDouble() * (double) str.Length);
        stringBuilder.Append(str[index]);
      }
      return stringBuilder.ToString();
    }

    private string checkUser(string user)
    {
      return new CConnect().sqlCmdReturn("select [id] from Member where email='" + user + "'").ToString();
    }

    private void addUser(string email)
    {
      CConnect cconnect = new CConnect();
      string saltString = this.getSaltString();
      string sql = "INSERT INTO [Forgetpass] ([userid],[Saltcheck],[Active],[Createdate]) VALUES('" + email + "','" + saltString + "','1','" + (object) DateTime.Now + "')";
      cconnect.sqlCmd(sql);
    }

    protected void bnLogin_Click(object sender, EventArgs e)
    {
      this.checkLogin();
    }

    private string checkLogin()
    {
      CConnect cconnect = new CConnect();
      string str1 = this.txtUsername.Value;
      string str2 = this.txtPassword.Value;
      string empty = string.Empty;
      if (str1.Length <= 0 || str2.Length <= 0)
        return "";
      SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
      connection.Open();
      string cmdText = "select [Name],[Rank],[ID],[userinlist] from [Member] where username=@NAME and password=@PASSWORD and active='1'";
      SqlCommand sqlCommand = new SqlCommand(cmdText, connection);
      sqlCommand.Parameters.AddWithValue("@NAME", (object) str1);
      sqlCommand.Parameters.AddWithValue("@PASSWORD", (object) str2);
      sqlCommand.CommandText = cmdText;
      SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
      if (sqlDataReader.HasRows)
      {
        sqlDataReader.Read();
        this.Session["SessionID"] = (object) Guid.NewGuid().ToString();
        this.Session["IDX"] = (object) sqlDataReader.GetValue(2).ToString();
        this.Session["FULLNAME"] = (object) sqlDataReader.GetValue(0).ToString();
        this.Session["RANK"] = (object) sqlDataReader.GetValue(1).ToString();
        this.Session["group"] = (object) sqlDataReader.GetValue(3).ToString();
        this.Response.Redirect("Default.aspx", true);
      }
      sqlDataReader.Close();
      sqlCommand.Dispose();
      connection.Close();
      return "";
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
