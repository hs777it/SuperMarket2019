using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace SuperMarket2010.PL.Store
{
    public partial class frmCategory : Form
    {
        BL.clsCategory cat = new BL.clsCategory();
        int id;
        public frmCategory()
        {
            InitializeComponent();
            DataPreview();
        }

        private void btnClose_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnNew_Click(object sender, EventArgs e)
        {
            btnAdd.Enabled = true;
            btnNew.Enabled = btnDelete.Enabled = btnUpdate.Enabled = false;
            txtName.Clear();
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                id = (Int32)cat.CatMaxID().Rows[0][0];
                cat.AddCategory(id, txtName.Text);
               // MessageBox.Show("تم الحفظ بنجاح","",MessageBoxButtons.OK,MessageBoxIcon.Information);
                DataPreview();
            }
            catch { return; }
            btnAdd.Enabled = !btnAdd.Enabled;
            btnNew.Enabled = !btnNew.Enabled;
            txtName.Clear();
        }


        void DataPreview()
        {
            try
            {
                gvCats.DataSource = cat.GetAllCategories();
            }
            catch { return;  }
            DataGridViewColumn column = gvCats.Columns[0];
            column.AutoSizeMode = DataGridViewAutoSizeColumnMode.AllCells;
            column.Width = 20;
        }

        private void gvCats_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            txtName.Text = gvCats.CurrentRow.Cells[1].Value.ToString();
        }

        private void txtName_TextChanged(object sender, EventArgs e)
        {
            if (txtName.Text != string.Empty)
                btnDelete.Enabled = btnUpdate.Enabled = true;
            else
                btnDelete.Enabled = btnUpdate.Enabled = false;
        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(gvCats.CurrentRow.Cells[0].Value);
            cat.UpdateCategory(id, txtName.Text);
            DataPreview();
            txtName.Clear();
            btnUpdate.Enabled = false;
            gvCats.FirstDisplayedScrollingRowIndex = id-1;
            gvCats.Rows[id-1].Selected = true;
            lbl.Text = "done";
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("dd","ff",MessageBoxButtons.YesNo,MessageBoxIcon.Question) == DialogResult.Yes)
            {
                int id = Convert.ToInt32(gvCats.CurrentRow.Cells[0].Value);
                cat.DeleteCategory(id);
                DataPreview();
                txtName.Clear();
                btnDelete.Enabled = false;
                lbl.Text = "delete";
            }
        }
    }
}
