// Decompiled with JetBrains decompiler
// Type: newweb.CConnect
// Assembly: newweb, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: A2E847A6-10D0-4271-9D59-55F01CDCC8B0
// Assembly location: C:\data\source-20190227T061536Z-001\source\lms\lms\bin\newweb.dll

using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;

namespace newweb
{
  public class CConnect
  {
    public string mycon;
    private SqlConnection conn;
    private SqlCommand cmd;
    private SqlDataReader dr;
    private SqlDataAdapter da;
    public DataSet ds;
    private SqlCommandBuilder builder;
    public string ip;

    public CConnect()
    {
      this.mycon = ConfigurationManager.ConnectionStrings["cdas_conn"].ConnectionString;
      this.conn = new SqlConnection(this.mycon);
      this.cmd = new SqlCommand();
      this.cmd = new SqlCommand("SET NAMES utf8", this.conn);
      this.cmd.Connection = this.conn;
      this.da = new SqlDataAdapter();
      this.ds = new DataSet();
    }

    public void connOpen()
    {
      if (this.conn.State == ConnectionState.Open)
        this.conn.Close();
      this.conn.Open();
    }

    public bool checkConn()
    {
      return this.conn.State == ConnectionState.Open;
    }

    public void connClose()
    {
      this.conn.Close();
    }

    public void drClose()
    {
      this.dr.Close();
    }

    public void sqlCmd(string sql)
    {
      try
      {
        this.connOpen();
        this.cmd.CommandText = sql;
        this.cmd.ExecuteNonQuery();
      }
      catch
      {
      }
      finally
      {
        this.connClose();
      }
    }

    public int sqlCmdCheck(string sql)
    {
      try
      {
        this.connOpen();
        this.cmd.CommandText = sql;
        return this.cmd.ExecuteNonQuery();
      }
      catch
      {
      }
      finally
      {
        this.connClose();
      }
      return 0;
    }

    public void sqlCmd()
    {
      try
      {
        this.connOpen();
        this.cmd.ExecuteNonQuery();
      }
      catch
      {
      }
      finally
      {
        this.connClose();
      }
    }

    public void sqlCmdText(string sql)
    {
      this.cmd.CommandText = sql;
    }

    public void sqlCmdAddParam(string pm, object txt)
    {
      this.cmd.Parameters.AddWithValue(pm, txt);
    }

    public object sqlCmdReturn(string sql)
    {
      object obj = (object) null;
      try
      {
        this.connOpen();
        this.cmd.CommandText = sql;
        obj = this.cmd.ExecuteScalar();
      }
      catch
      {
      }
      finally
      {
        this.connClose();
      }
      return obj;
    }

    public void sqlReader(string sql)
    {
      this.connOpen();
      this.cmd.CommandText = sql;
      this.dr = this.cmd.ExecuteReader();
    }

    public void sqlReader()
    {
      this.connOpen();
      this.dr = this.cmd.ExecuteReader();
    }

    public bool rsMoveNext()
    {
      return this.dr.Read();
    }

    public object Recordset(string field)
    {
      return this.dr[field];
    }

    public object Recordset(int field)
    {
      return this.dr[field];
    }

    public int daFill(string sql, string tb)
    {
      int num = 0;
      try
      {
        this.connOpen();
        this.cmd.CommandText = sql;
        this.da.SelectCommand = this.cmd;
        num = this.da.Fill(this.ds, tb);
      }
      catch
      {
      }
      finally
      {
        this.connClose();
      }
      return num;
    }

    public void daDeleteCmd(string sql)
    {
      try
      {
        this.connOpen();
        this.cmd.CommandText = sql;
        this.da.DeleteCommand = this.cmd;
      }
      catch
      {
      }
      finally
      {
        this.connClose();
      }
    }

    public int daFill(string sql, DataSet dts)
    {
      int num = 0;
      try
      {
        this.connOpen();
        this.cmd.CommandText = sql;
        this.da.SelectCommand = this.cmd;
        num = this.da.Fill(dts, "tmp");
      }
      catch
      {
      }
      finally
      {
        this.connClose();
      }
      return num;
    }

    public void daUpdate(DataTable dt)
    {
      this.builder = new SqlCommandBuilder(this.da);
      this.da.Update(dt);
    }

    public int daUpdate()
    {
      this.builder = new SqlCommandBuilder(this.da);
      return this.da.Update(this.ds);
    }

    public int daUpdate(string table)
    {
      this.builder = new SqlCommandBuilder(this.da);
      return this.da.Update(this.ds, table);
    }

    public int daUpdate(short table_id)
    {
      this.builder = new SqlCommandBuilder(this.da);
      return this.da.Update(this.ds.Tables[(int) table_id]);
    }

    public string getMd5Hash(string input)
    {
      byte[] hash = MD5.Create().ComputeHash(Encoding.Default.GetBytes(input));
      StringBuilder stringBuilder = new StringBuilder();
      for (int index = 0; index < hash.Length; ++index)
        stringBuilder.Append(hash[index].ToString("x2"));
      return stringBuilder.ToString();
    }

    public bool verifyMd5Hash(string input, string hash)
    {
      return StringComparer.OrdinalIgnoreCase.Compare(this.getMd5Hash(input), hash) == 0;
    }
  }
}
