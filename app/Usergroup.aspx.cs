// Decompiled with JetBrains decompiler
// Type: newweb.Usergroup
// Assembly: newweb, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: F91315E7-117D-4389-A770-FCB23990E577
// Assembly location: C:\inetpub\wwwroot\lms\bin\newweb.dll

using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace newweb
{
    public class Usergroup : Page
    {
        protected GridView gvDP;
        protected SqlDataSource sqlDP;
        protected HtmlInputText txtNName, txtEdName;
        protected HtmlInputHidden idUserGroup;
        protected HtmlInputText dtfrom;
        protected HtmlInputText dtto;
        protected Button bnAdduser;
        protected DropDownList DropDownList1, EdDropDownList1;
        protected DropDownList ParentDDL;

        protected void ShowMessage(string Message, Usergroup.MessageType type)
        {
            ScriptManager.RegisterStartupScript((Page)this, this.GetType(), Guid.NewGuid().ToString(), "ShowMessage('" + Message + "','" + (object)type + "');", true);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.IsPostBack)
            {
                //this.DropDownList1.DataBind();
            }
            this.ADD_COM_CODE();
            //Response.Write(sqlDP.SelectCommand.ToString());
        }
       
            public void ADD_COM_CODE()
        {
            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
            connection.Open();
            string cmdText = "SELECT [id],[UserGroupname]  FROM [usergroup] where Active='1' AND ParentId is null";
            SqlCommand sqlCommand = new SqlCommand(cmdText, connection);
            sqlCommand.CommandText = cmdText;
            SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
            //this.DropDownList1.Items.Clear();
            ListItem l = new ListItem("เลือกกลุ่มย่อย", "null", true);
            l.Selected = true;
           // this.DropDownList1.Items.Add(l);
            if (sqlDataReader.HasRows)
            {
                while (sqlDataReader.Read())
                {
                    l = new ListItem( sqlDataReader.GetValue(0).ToString() + "," + sqlDataReader.GetValue(1).ToString(),sqlDataReader.GetValue(0).ToString(), true);
                    l.Selected = false;
                   // this.DropDownList1.Items.Add(l);
                }
                    
            }
            sqlDataReader.Close();
            sqlCommand.Dispose();
           // this.DropDownList1.DataBind();
            connection.Close();
        }
        
      
        
        // public void set
        public void delete_course(string id)
        {
            try
            {
                SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString);
                connection.Open();
                string cmdText = "UPDATE [usergroup] SET ACTIVE='0' where id=@id";
                SqlCommand sqlCommand = new SqlCommand(cmdText, connection);
                sqlCommand.CommandText = cmdText;
                sqlCommand.Parameters.AddWithValue("@id", (object)int.Parse(id));
                sqlCommand.ExecuteNonQuery();
                sqlCommand.Dispose();
                connection.Close();
            }
            catch
            {
            }
        }
        public void Button2Ed_Click(object sender, EventArgs e)
        {
           

        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            LinkButton button = (LinkButton)sender;
            if (button.CommandArgument.ToString().Trim().Length <= 0)
                return;
            this.delete_course(button.CommandArgument.ToString().Trim());
            this.sqlDP.DataBind();
            try
            {
                this.gvDP.DataBind();
            }
            catch
            {
            }
        }

        [WebMethod(EnableSession = true)]
        public static void SetSession(string ssname, string val)
        {
            HttpContext.Current.Session[ssname] = (object)val;
        }

        protected void bnEdituser_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript((Page)this, this.GetType(), "Pop", "openModal();", true);
            if (this.txtEdName.Value == "")
            {
                this.ShowMessage("User group Name can not be blank", Usergroup.MessageType.Error);
            }
            else
            {
                this.updateUser(this.txtEdName.Value, this.EdDropDownList1.SelectedValue, this.idUserGroup.Value);
                this.ShowMessage("User group  Name " + this.txtNName.Value + " is added", Usergroup.MessageType.Success);
                ScriptManager.RegisterStartupScript((Page)this, this.GetType(), "Pop", "openModal();", false);
                this.sqlDP.DataBind();
                this.gvDP.DataBind();
                this.clearAddnew();
            }

        }
            protected void bnAdduser_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript((Page)this, this.GetType(), "Pop", "openModal();", true);
            if (this.txtNName.Value == "")
            {
                this.ShowMessage("User group Name can not be blank", Usergroup.MessageType.Error);
            }
            else
            {

                string str1 = "";
                //int length = this.DropDownList1.Text.IndexOf(",");
                //if (length != -1)
                //    str1 = this.DropDownList1.Text.Substring(0, length);
               // string value = Request.Form["DropDownList1"];
                //Response.Write("PK value: " + value);
                this.addUser(this.txtNName.Value);
                this.ShowMessage("User group  Name " + this.txtNName.Value + " is added", Usergroup.MessageType.Success);
                ScriptManager.RegisterStartupScript((Page)this, this.GetType(), "Pop", "openModal();", false);
                this.sqlDP.DataBind();
                this.gvDP.DataBind();
                this.clearAddnew();
            }
        }

        protected void sqlDP_Selecting(object sender, EventArgs e)
        {
            Response.Write(sqlDP.SelectCommand.ToString());
        }

        private void clearAddnew()
        {
            this.txtNName.Value = "";
        }
        private void updateUser(string userGroupName, string parentId, string idUserGroup)
        {
            CConnect cconnect = new CConnect();

            DateTime dtNow = DateTime.Now;
            string dtNowFormat = "yyyy-MM-dd HH:mm:ss";
            //dtNow.ToString(dtNowFormat)
            //      string sql = "INSERT INTO [usergroup] ([UserGroupname],[Userid],[Createdate],[Active],[Updatedate],[Updateby]) VALUES('" + this.txtNName.Value + "','1','" + (object) DateTime.Now + "','1','" + (object) DateTime.Now + "','1')";
            string sql = "update [usergroup] set [UserGroupname]='"+userGroupName + "' , [ParentId] = "+ parentId + ", [Updatedate] = '"+ dtNow.ToString(dtNowFormat) + "' WHERE [id] = "+idUserGroup;
            cconnect.sqlCmd(sql);
            Response.Write(sql);
            //Response.Write(this.DropDownList1.SelectedValue);
            //this.DropDownList1.DataBind();
        }

        private void addUser(string user)
        {
            CConnect cconnect = new CConnect();
            /*      string str1;
                  try
                  {
                    str1 = DateTime.Parse(this.dtfrom.Value).ToString("yyyy-MM-dd");
                  }
                  catch
                  {
                    str1 = DateTime.Now.ToString("yyyy-MM-dd");
                  }
                  string str2;
                  try
                  {
                    str2 = DateTime.Parse(this.dtto.Value).ToString("yyyy-MM-dd");
                  }
                  catch
                  {
                    str2 = DateTime.Now.AddDays(30.0).ToString("yyyy-MM-dd");
                  }*/

            DateTime dtNow = DateTime.Now;
            string dtNowFormat = "yyyy-MM-dd HH:mm:ss";
            //dtNow.ToString(dtNowFormat)
            //      string sql = "INSERT INTO [usergroup] ([UserGroupname],[Userid],[Createdate],[Active],[Updatedate],[Updateby]) VALUES('" + this.txtNName.Value + "','1','" + (object) DateTime.Now + "','1','" + (object) DateTime.Now + "','1')";
            string sql = "INSERT INTO [usergroup] ([UserGroupname],[Userid],[Createdate],[Active],[Updatedate],[Updateby],[ParentId]) VALUES('" + this.txtNName.Value + "','1','" + dtNow.ToString(dtNowFormat) + "','1','" + dtNow.ToString(dtNowFormat) + "','1'," + this.ParentDDL.SelectedValue + ")";
            cconnect.sqlCmd(sql);
            //Response.Write(sql);
            //Response.Write(this.DropDownList1.SelectedValue);
            //this.DropDownList1.DataBind();
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
