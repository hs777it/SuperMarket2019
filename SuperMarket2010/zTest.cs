using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace SuperMarket2010
{
    public partial class zTest : Form
    {
        public zTest()
        {
            InitializeComponent();
        }

        byte mouseDown = 0;
        Point lastLocation;
        private void pnl_MouseDown(object sender, MouseEventArgs e)
        {
            zTest_MouseDown(sender, e);
        }

        private void pnl_MouseMove(object sender, MouseEventArgs e)
        {
            zTest_MouseMove(sender, e);
        }

        private void pnl_MouseUp(object sender, MouseEventArgs e)
        {
            zTest_MouseUp(sender, e);
        }

        private void zTest_MouseDown(object sender, MouseEventArgs e)
        {
            mouseDown = 1;
            lastLocation = e.Location;
        }

        private void zTest_MouseMove(object sender, MouseEventArgs e)
        {
            if (mouseDown == 1)
            {
                int newX = (this.Location.X - lastLocation.X) + e.X;
                int newY = (this.Location.Y - lastLocation.Y) + e.Y;
                this.Location = new Point(newX, newY);
            }
        }

        private void zTest_MouseUp(object sender, MouseEventArgs e)
        {
            mouseDown = 0;
        }

        private void zTest_Load(object sender, EventArgs e)
        {

        }
    }
}
