using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pruebaNET
{
    public partial class Calendario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Unnamed1_SelectionChanged(object sender, EventArgs e)
        {
            lblFecha.Text = Convert.ToString(calendar.SelectedDate);
        }
    }
}