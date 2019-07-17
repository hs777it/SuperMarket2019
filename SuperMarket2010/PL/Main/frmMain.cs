using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace SuperMarket2010.PL.Main
{
    public partial class frmMain : Form
    {
        byte mouseDown = 0;
        Point lastLocation;
        public frmMain()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            Users.frmLogin frm = new Users.frmLogin();
            frm.ShowDialog();
        }
        private void Form1_MouseDown(object sender, MouseEventArgs e)
        {
            mouseDown = 1;
            lastLocation = e.Location;
        }
        private void Form1_MouseMove(object sender, MouseEventArgs e)
        {
            if (mouseDown == 1)
            {
                int newX = (this.Location.X - lastLocation.X) + e.X;
                int newY = (this.Location.Y - lastLocation.Y) + e.Y;
                this.Location = new Point(newX, newY);
            }
        }
        private void Form1_MouseUp(object sender, MouseEventArgs e)
        {
            mouseDown = 0;
        }
        private void pnl_MouseDown(object sender, MouseEventArgs e)
        {
           Form1_MouseDown(sender, e);
        }
        private void pnl_MouseMove(object sender, MouseEventArgs e)
        {
            Form1_MouseMove(sender, e);
        }
        private void pnl_MouseUp(object sender, MouseEventArgs e)
        {
            Form1_MouseUp(sender, e);
        }
        private void pnl_DoubleClick(object sender, EventArgs e)
        {
            if (this.WindowState != FormWindowState.Maximized)
            {
                this.WindowState = FormWindowState.Maximized;
            }
            else
                this.WindowState = FormWindowState.Normal;
        }
        private void menuExit_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void lblMin_Click(object sender, EventArgs e)
        {
            this.WindowState = FormWindowState.Minimized;
        }

        private void lblClose_Click(object sender, EventArgs e)
        {
            this.Close();
        }


        private void menuCategoriesManage_Click(object sender, EventArgs e)
        {
            Store.frmCategory frm = new Store.frmCategory();
            frm.StartPosition = FormStartPosition.CenterParent;
            frm.ShowDialog();
        }
        private void menuUsers_Click(object sender, EventArgs e)
        {
            PL.Users.frmUser frm = new Users.frmUser();
            frm.StartPosition = FormStartPosition.CenterParent;
            frm.ShowDialog();
        }

        private void menuLogin_Click(object sender, EventArgs e)
        {
            Users.frmLogin frm = new Users.frmLogin();
            frm.StartPosition = FormStartPosition.CenterParent;
            frm.ShowDialog();
        }

        private void menuSuppliers_Click(object sender, EventArgs e)
        {
            Supplier.frmSupplier frm = new Supplier.frmSupplier();
            frm.StartPosition = FormStartPosition.CenterParent;
            frm.ShowDialog();
        }
    }
}
