using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace SuperMarket2010.BL
{
    class clsSupplier
    {
        Data.DataAccess db = new Data.DataAccess();
        DataTable dt = new DataTable();

        public DataTable GetSupplierMaxID()
        {
            return dt = db.SelectData("spSupplierMaxID", null);
        }

        public void AddSupplier(int supplierID, string supplierName, 
            string supPhone, string supEmail,string supCompany,string supAddress, DateTime supDateAdd,string supUserAdd)
        {
            db.Open();
            SqlParameter[] param = new SqlParameter[8];
            param[0] = new SqlParameter("@supID", supplierID);
            param[1] = new SqlParameter("@supName", supplierName);
            param[2] = new SqlParameter("@supPhone", supPhone);
            param[3] = new SqlParameter("@supEmail", supEmail);
            param[4] = new SqlParameter("@supCompany", supCompany);
            param[5] = new SqlParameter("@supAddress", supAddress);
            param[6] = new SqlParameter("@supDateAdd", supDateAdd);
            param[7] = new SqlParameter("@supUserAdd", supUserAdd);
            db.ExecuteCommand("spSupplierAdd", param);
            db.Close();
        }

        public void UpdateSupplier(int supplierID, string supplierName,
            string supPhone, string supEmail, string supCompany, string supAddress, DateTime supDateAdd, string supUserAdd)
        {
            db.Open();
            SqlParameter[] param = new SqlParameter[8];
            param[0] = new SqlParameter("@supID", supplierID);
            param[1] = new SqlParameter("@supName", supplierName);
            param[2] = new SqlParameter("@supPhone", supPhone);
            param[3] = new SqlParameter("@supEmail", supEmail);
            param[4] = new SqlParameter("@supCompany", supCompany);
            param[5] = new SqlParameter("@supAddress", supAddress);
            param[6] = new SqlParameter("@supDateAdd", supDateAdd);
            param[7] = new SqlParameter("@supUserAdd", supUserAdd);
            db.ExecuteCommand("spSupplierUpdate", param);
            db.Close();
        }

        public DataTable GetAllSuppliers()
        {
            return dt = db.SelectData("spSupplierAll", null);
        }

        public void DeleteSupplier(int Id)
        {
            db.Open();
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@ID", Id);
            db.ExecuteCommand("spSupplierDelete",param);
            db.Close();
        }

        public DataTable SearchSuppliers(string value)
        {
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@value", value);
            return dt = db.SelectData("spSupplierSearch",param);
        }

    }
}
