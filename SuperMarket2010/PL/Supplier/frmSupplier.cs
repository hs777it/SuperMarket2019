using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace SuperMarket2010.PL.Supplier
{
    public partial class frmSupplier : Form
    {
        BL.clsSupplier supplier = new BL.clsSupplier();
        int id;
        public frmSupplier()
        {
            InitializeComponent();
            txtName.Focus();
            txtUser.Text = Program.salesMan;
            DataPreview();
        }
        void DataPreview()
        {
            try
            {
                gvSuppliers.DataSource = supplier.GetAllSuppliers();
            }
            catch { return; }
            gvSuppliers.Columns[2].Visible = false;
            DataGridViewColumn column = gvSuppliers.Columns[0];
            column.AutoSizeMode = DataGridViewAutoSizeColumnMode.AllCells;
            column.Width = 20;
        }

        private void btnNew_Click(object sender, EventArgs e)
        {
            btnAdd.Enabled = true;
            txtName.Focus();
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            if (txtName.Text == string.Empty || txtPhone.Text == string.Empty)
            {
                MessageBox.Show("اكمل البيانات", "", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }
            try
            {
                id = (Int32)supplier.GetSupplierMaxID().Rows[0][0];
                supplier.AddSupplier(id,txtName.Text, txtPhone.Text, txtEmail.Text, txtCompany.Text, txtAddress.Text, dtPicker.Value,txtUser.Text);
                MessageBox.Show("تم إضافة المورد بنجاح", "", MessageBoxButtons.OK, MessageBoxIcon.Information);
                //DataPreview();
            }
            catch (Exception ex) { MessageBox.Show(ex.Message); }
            btnAdd.Enabled = !btnAdd.Enabled;
            btnNew.Enabled = !btnNew.Enabled;
            txtName.Text = txtPhone.Text = txtEmail.Text = txtCompany.Text = txtAddress.Text = string.Empty;
            txtName.Focus();
            DataPreview();
        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {

        }

        private void btnDelete_Click(object sender, EventArgs e)
        {

        }

        private void txtSearch_TextChanged(object sender, EventArgs e)
        {
            gvSuppliers.DataSource = supplier.SearchSuppliers(txtSearch.Text);
        }
        private void btnClose_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void txtName_KeyDown(object sender, KeyEventArgs e)
        {
            // if (e.KeyCode == Keys.Enter) SendKeys.Send("Tap");
        }
    }
}
