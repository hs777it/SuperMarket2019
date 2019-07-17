using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace SuperMarket2010.Data
{
    public class DataAccess
    {
        SqlConnection con;
        public DataAccess()
        {
            con = new SqlConnection(@"Server=.;Initial Catalog=SuperMarket2010;Integrated Security=true;");
        }

        public void Open()
        {
            if (con.State != ConnectionState.Open) con.Open();
        }
        public void Close()
        {
            if (con.State == ConnectionState.Open) con.Close();
        }

        public void ExecuteCommand(string Store_Procedure, SqlParameter[] param)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = Store_Procedure;
            cmd.Connection = con;

            if (param != null) cmd.Parameters.AddRange(param);
            cmd.ExecuteNonQuery();
        }

        public DataTable SelectData(string Store_Procedure, SqlParameter[] param)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = Store_Procedure;
            cmd.Connection = con;

            if (param != null)
            {
                for (int i = 0; i < param.Length; i++)
                {
                    cmd.Parameters.Add(param[i]);
                }
            }
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }
    }
}
