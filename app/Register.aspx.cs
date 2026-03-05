// Decompiled with JetBrains decompiler
// Type: newweb.Register
// Assembly: newweb, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: F91315E7-117D-4389-A770-FCB23990E577
// Assembly location: C:\data\source-20190227T061536Z-001\newweboct\newweb.dll

using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace newweb
{
  public class Register : Page
  {
    protected HtmlForm form1;
    protected HtmlInputText txtusername;
    protected HtmlInputPassword txtpassword;
    protected HtmlInputPassword txtrpassword;
    protected HtmlInputText name;
    protected HtmlInputText nameeng;
    protected HtmlInputText birdthdate;
    protected HtmlInputText age;
    protected HtmlInputText Tel;
    protected HtmlInputText email;
    protected HtmlInputText Citizenid;
    protected HtmlInputText Cardno;
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

    protected void ShowMessage(string Message, Register.MessageType type)
    {
      ScriptManager.RegisterStartupScript((Page) this, this.GetType(), Guid.NewGuid().ToString(), "ShowMessage('" + Message + "','" + (object) type + "');", true);
    }

    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void bnLogin_Click(object sender, EventArgs e)
    {
      this.insert_user();
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

    private int checkUser(string user)
    {
      return int.Parse(new CConnect().sqlCmdReturn("select count(username) from Member where username='" + user + "'").ToString());
    }

    private void insert_user()
    {
      string user = this.txtusername.Value;
      string str1 = this.txtpassword.Value;
      string str2 = this.txtrpassword.Value;
      if (str1 != str2)
        this.ShowMessage("Password not match", Register.MessageType.Error);
      else if (user == "" || user.Length < 4)
        this.ShowMessage("Username Must have morethan 4 digit", Register.MessageType.Error);
      else if (str1.Length < 4)
      {
        this.ShowMessage("Password Must have morethan 4 digit", Register.MessageType.Error);
      }
      else
      {
        if (this.checkUser(user) != 0)
          return;
        string str3 = this.name.Value;
        string str4 = this.address.Value;
        string str5 = this.Subdistrict.Value;
        string str6 = this.District.Value;
        string str7 = this.Province.Value;
        string str8 = this.postcode.Value;
        string email = this.email.Value;
        string str9 = this.Citizenid.Value;
        string str10 = this.Cardno.Value;
        if (email != "" && !this.IsValidEmail(email))
        {
          this.ShowMessage("Format email address not correct", Register.MessageType.Error);
        }
        else
        {
          SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
          connection.Open();
          string cmdText = "INSERT INTO [dbo].[Member] ([username],[password],[Name],[Address],[Subdistrict],[District],[Province],[Postcode],[email],[Rank],[Cardno],[Citizenid],[Active],[Createdate])VALUES " + "(@username,@password,@Name,@Address,@Subdistrict,@District,@Province,@Postcode,@email,@Rank,@Cardno,@Citizenid,@Active,@Createdate)";
          SqlCommand sqlCommand = new SqlCommand(cmdText, connection);
          sqlCommand.CommandText = cmdText;
          sqlCommand.Parameters.AddWithValue("@username", (object) user);
          sqlCommand.Parameters.AddWithValue("@password", (object) str1);
          sqlCommand.Parameters.AddWithValue("@Name", (object) str3);
          sqlCommand.Parameters.AddWithValue("@Address", (object) str4);
          sqlCommand.Parameters.AddWithValue("@Subdistrict", (object) str5);
          sqlCommand.Parameters.AddWithValue("@District", (object) str6);
          sqlCommand.Parameters.AddWithValue("@Province", (object) str7);
          sqlCommand.Parameters.AddWithValue("@Postcode", (object) str8);
          sqlCommand.Parameters.AddWithValue("@email", (object) email);
          sqlCommand.Parameters.AddWithValue("@Rank", (object) 4);
          sqlCommand.Parameters.AddWithValue("@Citizenid", (object) str9);
          sqlCommand.Parameters.AddWithValue("@Cardno", (object) str10);
          sqlCommand.Parameters.AddWithValue("@Active", (object) 1);
          sqlCommand.Parameters.AddWithValue("@Createdate", (object) DateTime.Now);
          sqlCommand.ExecuteNonQuery();
          sqlCommand.Dispose();
          connection.Close();
          this.ShowMessage("Success user register completed", Register.MessageType.Success);
        }
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
