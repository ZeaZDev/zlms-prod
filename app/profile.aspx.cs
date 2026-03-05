// Decompiled with JetBrains decompiler
// Type: newweb.profile
// Assembly: newweb, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: F91315E7-117D-4389-A770-FCB23990E577
// Assembly location: C:\inetpub\wwwroot\lms\bin\newweb.dll

using System;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace newweb
{
  public class profile : Page
  {
    protected HtmlInputText name;
    protected HtmlInputText nameeng;
    protected HtmlInputText birdthdate;
    protected HtmlInputText age;
    protected HtmlInputText Tel;
    protected HtmlInputText email;
    protected HtmlInputText Citizenid;
    protected FileUpload FileUpload2;
    protected Label Label2;
    protected HtmlInputText Cardno;
    protected FileUpload FileUpload1;
    protected Label Label1;
    protected FileUpload FileUpload3;
    protected Label Label3;
    protected HtmlInputText address;
    protected HtmlInputText road;
    protected HtmlInputText Subdistrict;
    protected HtmlInputText District;
    protected HtmlInputText Province;
    protected HtmlInputText postcode;
    protected HtmlInputText waddress;
    protected HtmlInputText wroad;
    protected HtmlInputText wSubdistrict;
    protected HtmlInputText wDistrict;
    protected HtmlInputText wProvince;
    protected HtmlInputText wpostcode;
    protected HtmlInputText Text1;
    protected HtmlInputText Text3;
    protected HtmlInputText Text4;
    protected HtmlInputText Text5;
    protected HtmlInputText Text2;
    protected HtmlInputText Text6;
    protected HtmlInputText Text7;
    protected HtmlInputText Text8;
    protected HtmlInputText Text9;
    protected HtmlInputText Text10;
    protected HtmlInputText Text11;
    protected HtmlInputText Text12;
    protected Button bnsubmit;

    protected void ShowMessage(string Message, profile.MessageType type)
    {
      ScriptManager.RegisterStartupScript((Page) this, this.GetType(), Guid.NewGuid().ToString(), "ShowMessage('" + Message + "','" + (object) type + "');", true);
    }

    protected void Page_Load(object sender, EventArgs e)
    {
      if (this.IsPostBack)
        return;
      try
      {
        this.coursename(this.Session["IDX"].ToString());
      }
      catch
      {
      }
    }

    public void coursename(string classid)
    {
      SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
      connection.Open();
      string cmdText = "Select [Name],[Nameeng],[Age],[Tel],[Address],[Road],[Subdistrict],[District],[Province],[Postcode],[email],[Cardno],[Citizenid] from member where id=@id";
      SqlCommand sqlCommand = new SqlCommand(cmdText, connection);
      sqlCommand.CommandText = cmdText;
      sqlCommand.Parameters.AddWithValue("@id", (object) classid);
      SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
      if (sqlDataReader.HasRows)
      {
        sqlDataReader.Read();
        this.road.Value = sqlDataReader.GetValue(5).ToString();
        this.nameeng.Value = sqlDataReader.GetValue(1).ToString();
        this.age.Value = sqlDataReader.GetValue(2).ToString();
        this.Tel.Value = sqlDataReader.GetValue(3).ToString();
        this.name.Value = sqlDataReader.GetValue(0).ToString();
        this.address.Value = sqlDataReader.GetValue(4).ToString();
        this.Subdistrict.Value = sqlDataReader.GetValue(6).ToString();
        this.District.Value = sqlDataReader.GetValue(7).ToString();
        this.Province.Value = sqlDataReader.GetValue(8).ToString();
        this.postcode.Value = sqlDataReader.GetValue(9).ToString();
        this.email.Value = sqlDataReader.GetValue(10).ToString();
        this.Citizenid.Value = sqlDataReader.GetValue(12).ToString();
        this.Cardno.Value = sqlDataReader.GetValue(11).ToString();
      }
      sqlDataReader.Close();
      sqlCommand.Dispose();
      connection.Close();
    }

    private bool IsValidEmail(string email)
    {
      try
      {
        return new MailAddress(email).Address == email;
      }
      catch
      {
        return false;
      }
    }

    protected void updatecizpic(string userid, string filename)
    {
      SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
      connection.Open();
      string cmdText = "UPDATE [Member] SET [Citizenpic] = @Citizenpic WHERE id=@id ";
      SqlCommand sqlCommand = new SqlCommand(cmdText, connection);
      sqlCommand.CommandText = cmdText;
      sqlCommand.Parameters.AddWithValue("@id", (object) userid);
      sqlCommand.Parameters.AddWithValue("@Citizenpic", (object) filename);
      sqlCommand.ExecuteNonQuery();
      sqlCommand.Dispose();
      connection.Close();
    }

    protected void updatecardpic(string userid, string filename)
    {
      SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
      connection.Open();
      string cmdText = "UPDATE [Member] SET [Cardpic] = @Cardpic WHERE id=@id ";
      SqlCommand sqlCommand = new SqlCommand(cmdText, connection);
      sqlCommand.CommandText = cmdText;
      sqlCommand.Parameters.AddWithValue("@id", (object) userid);
      sqlCommand.Parameters.AddWithValue("@Cardpic", (object) filename);
      sqlCommand.ExecuteNonQuery();
      sqlCommand.Dispose();
      connection.Close();
    }

    protected void updateuserpic(string userid, string filename)
    {
      SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
      connection.Open();
      string cmdText = "UPDATE [Member] SET [Userpic] = @Userpic WHERE id=@id ";
      SqlCommand sqlCommand = new SqlCommand(cmdText, connection);
      sqlCommand.CommandText = cmdText;
      sqlCommand.Parameters.AddWithValue("@id", (object) userid);
      sqlCommand.Parameters.AddWithValue("@Userpic", (object) filename);
      sqlCommand.ExecuteNonQuery();
      sqlCommand.Dispose();
      connection.Close();
    }

    protected void bnLogin_Click(object sender, EventArgs e)
    {
      string userid = this.Session["IDX"].ToString();
      string str1 = HttpContext.Current.Server.MapPath("~/userpic/");
      if (userid != "")
      {
        string path = str1 + userid;
        if (!Directory.Exists(path))
          Directory.CreateDirectory(path);
      }
      if (this.FileUpload1.HasFile)
      {
        try
        {
          this.FileUpload1.SaveAs(str1 + userid + "\\card" + this.FileUpload1.FileName);
          this.Label1.Text = "File name: " + this.FileUpload1.PostedFile.FileName + "<br>" + (object) this.FileUpload1.PostedFile.ContentLength + " kb<br>Content type: " + this.FileUpload1.PostedFile.ContentType;
          this.updatecardpic(userid, this.FileUpload2.FileName);
        }
        catch (Exception ex)
        {
          this.Label1.Text = "ERROR: " + ex.Message.ToString();
        }
      }
      else
        this.Label1.Text = "You have not specified a file.";
      if (this.FileUpload2.HasFile)
      {
        try
        {
          this.FileUpload2.SaveAs(str1 + userid + "\\ciz" + this.FileUpload2.FileName);
          this.Label2.Text = "File name: " + this.FileUpload2.PostedFile.FileName + "<br>" + (object) this.FileUpload2.PostedFile.ContentLength + " kb<br>Content type: " + this.FileUpload2.PostedFile.ContentType;
          this.updatecizpic(userid, this.FileUpload2.FileName);
        }
        catch (Exception ex)
        {
          this.Label2.Text = "ERROR: " + ex.Message.ToString();
        }
      }
      else
        this.Label2.Text = "You have not specified a file.";
      if (this.FileUpload3.HasFile)
      {
        try
        {
          this.FileUpload3.SaveAs(str1 + userid + "\\user" + this.FileUpload3.FileName);
          this.Label3.Text = "File name: " + this.FileUpload3.PostedFile.FileName + "<br>" + (object) this.FileUpload3.PostedFile.ContentLength + " kb<br>Content type: " + this.FileUpload3.PostedFile.ContentType;
          this.updateuserpic(userid, this.FileUpload2.FileName);
        }
        catch (Exception ex)
        {
          this.Label3.Text = "ERROR: " + ex.Message.ToString();
        }
      }
      else
        this.Label3.Text = "You have not specified a file.";
      string str2 = this.road.Value;
      string fileName1 = this.FileUpload2.FileName;
      string fileName2 = this.FileUpload3.FileName;
      string fileName3 = this.FileUpload1.FileName;
      string str3 = this.nameeng.Value;
      string str4 = this.age.Value;
      string str5 = this.Tel.Value;
      string str6 = this.name.Value;
      string str7 = this.address.Value;
      string str8 = this.Subdistrict.Value;
      string str9 = this.District.Value;
      string str10 = this.Province.Value;
      string str11 = this.postcode.Value;
      string email = this.email.Value;
      string str12 = this.Citizenid.Value;
      string str13 = this.Cardno.Value;
      if (email != "" && !this.IsValidEmail(email))
      {
        this.ShowMessage("Format email address not correct", profile.MessageType.Error);
      }
      else
      {
        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
        connection.Open();
        string cmdText = "UPDATE [Member] SET [Name] = @Name,[Nameeng] = @Nameeng,[Age] = @Age,[Tel] = @Tel,[Address] = @Address,[Road] = @Road,[Subdistrict] = @Subdistrict,[District] =@District,[Province] = @Province " + " ,[Postcode] = @postcode,[email] =@email,[Cardno] = @cardno,[Citizenid] = @citizenid WHERE id=@id ";
        SqlCommand sqlCommand = new SqlCommand(cmdText, connection);
        sqlCommand.CommandText = cmdText;
        sqlCommand.Parameters.AddWithValue("@id", (object) userid);
        sqlCommand.Parameters.AddWithValue("@Name", (object) str6);
        sqlCommand.Parameters.AddWithValue("@Address", (object) str7);
        sqlCommand.Parameters.AddWithValue("@Subdistrict", (object) str8);
        sqlCommand.Parameters.AddWithValue("@District", (object) str9);
        sqlCommand.Parameters.AddWithValue("@Province", (object) str10);
        sqlCommand.Parameters.AddWithValue("@Postcode", (object) str11);
        sqlCommand.Parameters.AddWithValue("@email", (object) email);
        sqlCommand.Parameters.AddWithValue("@Citizenid", (object) str12);
        sqlCommand.Parameters.AddWithValue("@Cardno", (object) str13);
        sqlCommand.Parameters.AddWithValue("@Road", (object) str2);
        sqlCommand.Parameters.AddWithValue("@Age", (object) str4);
        sqlCommand.Parameters.AddWithValue("@Tel", (object) str5);
        sqlCommand.Parameters.AddWithValue("@Nameeng", (object) str3);
        sqlCommand.ExecuteNonQuery();
        sqlCommand.Dispose();
        connection.Close();
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
