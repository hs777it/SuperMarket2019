using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace SuperMarket2010.BL
{
    class clsUser
    {
        Data.DataAccess db = new Data.DataAccess();
        DataTable dt = new DataTable();
        public DataTable GetUserMaxID()
        {
            return dt = db.SelectData("spUserMaxID", null);
        }

        public void AddUser(int userID, string userName, 
            string userPass, string fullName, DateTime userRegDate, string userType)
        {
            db.Open();
            SqlParameter[] param = new SqlParameter[6];
            param[0] = new SqlParameter("@UserID", userID);
            param[1] = new SqlParameter("@UserName", userName);
            param[2] = new SqlParameter("@UserPass", userPass);
            param[3] = new SqlParameter("@FullName", fullName);
            param[4] = new SqlParameter("@UserRegDate", userRegDate);
            param[5] = new SqlParameter("@UserType", userType);
            db.ExecuteCommand("spUserAdd", param);
            db.Close();
        }

        public void UpdateUser(int userID, string userName,
            string userPass, string fullName, DateTime userRegDate, string userType)
        {
            db.Open();
            SqlParameter[] param = new SqlParameter[6];
            param[0] = new SqlParameter("@userID", userID);
            param[1] = new SqlParameter("@userName", userName);
            param[2] = new SqlParameter("@userPass", userPass);
            param[3] = new SqlParameter("@fullName", fullName);
            param[4] = new SqlParameter("@userRegDate", userRegDate);
            param[5] = new SqlParameter("@userType", userType);
            db.ExecuteCommand("spUserUpdate", param);
            db.Close();
        }

        public DataTable GetAllUsers()
        {
            return dt = db.SelectData("spUserAll", null);
        }

        public void DeleteUser(int Id)
        {
            db.Open();
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@ID", Id);
            db.ExecuteCommand("spUserDelete",param);
            db.Close();
        }

        public DataTable SearchUsers(string value)
        {
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@value", value);
            return dt = db.SelectData("spUserSearch",param);
        }

        public DataTable Login(string username,string password)
        {
            SqlParameter[] param = new SqlParameter[2];
            param[0] = new SqlParameter("@username", username);
            param[1] = new SqlParameter("@password", password);

            return dt = db.SelectData("spUserLogin", param);
        }
    }
}
