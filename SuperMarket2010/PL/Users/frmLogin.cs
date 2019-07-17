using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace SuperMarket2010.PL.Users
{
    public partial class frmLogin : Form
    {
        byte mouseDown = 0;
        Point lastLocation;
        BL.clsUser user = new BL.clsUser();
        public frmLogin()
        {
            InitializeComponent();
        }

        private void frmLogin_MouseDown(object sender, MouseEventArgs e)
        {
            mouseDown = 1;
            lastLocation = e.Location;
        }

        private void frmLogin_MouseMove(object sender, MouseEventArgs e)
        {
            if (mouseDown == 1)
            {
                int newX = (this.Location.X - lastLocation.X) + e.X;
                int newY = (this.Location.Y - lastLocation.Y) + e.Y;
                this.Location = new Point(newX, newY);
            }
        }

        private void frmLogin_MouseUp(object sender, MouseEventArgs e)
        {
            mouseDown = 0;
        }

        private void btnLogin_Click(object sender, EventArgs e)
        {
            if (txtUser.Text == string.Empty || txtPass.Text == string.Empty) return;
            DataTable dt = new DataTable();
            dt = user.Login(txtUser.Text, txtPass.Text);
            if (dt.Rows.Count > 0)
            {
                if(dt.Rows[0][5].ToString() == "مدير عام")
                    MessageBox.Show("مدير");
                else if (dt.Rows[0][5].ToString() == "مشرف")
                    MessageBox.Show("مشرف");
                else if (dt.Rows[0][5].ToString() == "كاشير")
                    MessageBox.Show("كاشير");

                Program.salesMan = dt.Rows[0][3].ToString();
            }
            else
                {
                    MessageBox.Show("wrong ...");
                    return;
                }
        } private void btnClose_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void txtUser_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Enter) txtPass.Focus();
        }

        private void txtPass_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Enter) btnLogin.PerformClick();
        }
    }
}
