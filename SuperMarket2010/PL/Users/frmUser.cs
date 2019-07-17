using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace SuperMarket2010.PL.Users
{
    public partial class frmUser : Form
    {
        //SqlConnection con = new SqlConnection(@"Server=.;Initial Catalog=SuperMarket2010;Integrated Security=true;");
        BL.clsUser user = new BL.clsUser();
        int id;

        public frmUser()
        {
            InitializeComponent();
            DataPreview();
            txtUsername.Focus();
            cbxUserType.SelectedIndex = 2;
        }

        void DataPreview()
        {
            try
            {
                gvUsers.DataSource = user.GetAllUsers();
            }
            catch { return; }
            gvUsers.Columns[2].Visible = false;
            DataGridViewColumn column = gvUsers.Columns[0];
            column.AutoSizeMode = DataGridViewAutoSizeColumnMode.AllCells;
            column.Width = 20;
        }

        private void btnNew_Click(object sender, EventArgs e)
        {
            btnAdd.Enabled = true;
            btnNew.Enabled = btnDelete.Enabled = btnUpdate.Enabled = false;
            //txtUsername.Text = txtPassword.Text = txtPassConfim.Text = txtFullName.Text = string.Empty;
            txtUsername.Focus();
            cbxUserType.SelectedIndex = 2;
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            if(txtUsername.Text == string.Empty||txtPassword.Text == string.Empty 
                || txtFullName.Text == string.Empty || cbxUserType.Text == string.Empty)
            {
                MessageBox.Show("اكمل البيانات", "", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }
            try
            {
                id = (Int32)user.GetUserMaxID().Rows[0][0];
                user.AddUser(id, txtUsername.Text,txtPassword.Text,txtFullName.Text, dtPicker.Value, cbxUserType.Text);
                MessageBox.Show("تم إضافة السمتخدم بنجاح","",MessageBoxButtons.OK,MessageBoxIcon.Information);
                DataPreview();
            }
            catch (Exception ex) { MessageBox.Show(ex.Message); }
            btnAdd.Enabled = !btnAdd.Enabled;
            btnNew.Enabled = !btnNew.Enabled;
            txtUsername.Text = txtPassword.Text = txtPassConfim.Text = txtFullName.Text = string.Empty;
            txtUsername.Focus();
            cbxUserType.SelectedIndex = 2;
        }

        private void btnClose_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void frmUser_KeyDown(object sender, KeyEventArgs e)
        {
            if(e.KeyCode == Keys.F11) btnNew.PerformClick();
            else if(e.KeyCode == Keys.F12) btnAdd.PerformClick();
        }

        private void txtPassConfim_Validated(object sender, EventArgs e)
        {
            if(txtPassConfim.Text != txtPassword.Text)
            {
                MessageBox.Show("خطأ");
                txtPassConfim.Focus();
            }
        }

        private void gvUsers_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            txtUsername.Text = gvUsers.CurrentRow.Cells[1].Value+"";
            txtPassword.Text = gvUsers.CurrentRow.Cells[2].Value+"";
            txtPassConfim.Text = gvUsers.CurrentRow.Cells[2].Value+"";
            txtFullName.Text = gvUsers.CurrentRow.Cells[3].Value+"";
            dtPicker.Value = (DateTime)gvUsers.CurrentRow.Cells[4].Value;
            if(gvUsers.CurrentRow.Cells[5].Value.ToString() == "مدير") cbxUserType.SelectedIndex =0;
            else if(gvUsers.CurrentRow.Cells[5].Value.ToString() == "مشرف") cbxUserType.SelectedIndex = 1;
            else cbxUserType.SelectedIndex = 2;

            btnUpdate.Enabled = true;
            btnDelete.Enabled = true;
        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {
            if (txtUsername.Text == string.Empty || txtPassword.Text == string.Empty
                || txtFullName.Text == string.Empty || cbxUserType.Text == string.Empty)
            {
                MessageBox.Show("اكمل البيانات", "", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }
            try
            {
                id = (int)gvUsers.CurrentRow.Cells[0].Value;
                user.UpdateUser(id, txtUsername.Text, txtPassword.Text, txtFullName.Text, dtPicker.Value, cbxUserType.Text);
                MessageBox.Show("تم تحديث بيانات السمتخدم", "", MessageBoxButtons.OK, MessageBoxIcon.Information);
                DataPreview();
            }
            catch (Exception ex) { MessageBox.Show(ex.Message); }
            btnUpdate.Enabled = false;
            btnDelete.Enabled = false;
            txtUsername.Text = txtPassword.Text = txtPassConfim.Text = txtFullName.Text = string.Empty;
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show(" هل تريد حذف " + Environment.NewLine + gvUsers.CurrentRow.Cells[1].Value, "", MessageBoxButtons.YesNo, MessageBoxIcon.Warning) == DialogResult.Yes)
            {
                user.DeleteUser((Int32)gvUsers.CurrentRow.Cells[0].Value);
                DataPreview();
            }
        }

        private void txtSearch_TextChanged(object sender, EventArgs e)
        {
            //SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM UserLogin WHERE convert(nvarchar,UserID) + UserName + FullName + UserType like '%" + txtSearch.Text + "%'", con);
            //DataTable dt = new DataTable();
            //da.Fill(dt);

            gvUsers.DataSource = user.SearchUsers(txtSearch.Text);
        }

        private void cbxPassword_CheckedChanged(object sender, EventArgs e)
        {
            if (gvUsers.Rows.Count >= 1)
                gvUsers.Columns[2].Visible = !gvUsers.Columns[2].Visible;
        }
    }
}
