using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace SuperMarket2010.BL
{
    public class clsCategory
    {
        Data.DataAccess db = new Data.DataAccess();
        DataTable dt = new DataTable();

        public DataTable CatMaxID()
        {
            return dt = db.SelectData("spCategoryMaxID",null);
        }

        public void AddCategory(int CatID, string CatName)
        {
            db.Open();

            SqlParameter[] param = new SqlParameter[2];
            param[0] = new SqlParameter("@CatID", SqlDbType.Int);
            param[0].Value = CatID;
            param[1] = new SqlParameter("@CatName", SqlDbType.NVarChar,50);
            param[1].Value = CatName;

            db.ExecuteCommand("spCategoryAdd", param);
            db.Close();
        }

        public DataTable GetAllCategories()
        {
            return dt = db.SelectData("spCategoryAll", null);
        }

        public void UpdateCategory(int CatID, string CatName)
        {
            db.Open();
            SqlParameter[] param = new SqlParameter[2];
            param[0] = new SqlParameter("@CatID", CatID);
            param[1] = new SqlParameter("@CatName", CatName);
            db.ExecuteCommand("spCategoryUpdate", param);
            db.Close();
        }

        public void DeleteCategory(int CatID)
        {
            db.Open();
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@CatID", CatID);
            db.ExecuteCommand("spCategoryDelete", param);
            db.Close();
        }

    }
}
