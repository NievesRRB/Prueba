using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pruebaNET
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            lblfecha.Text = DateTime.Now.ToString();
        }

       
        protected void btnvalidar_Click(object sender, EventArgs e)
        {
            btnvalidar.Text = TextBox1.Text + " " + TextBox2.Text;
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            int valor;
            datos.Text = DropDownList1.SelectedItem + " " + DropDownList2.SelectedItem;
      
            valor = sumarNombreApellido(DropDownList1.SelectedValue, DropDownList2.SelectedValue);
            lblvalor.Text = valor.ToString();
        }

        protected int sumarNombreApellido (string Nombre, string Apellido)
        {
            int aux;

            aux = Convert.ToInt32(Nombre)+Convert.ToInt32(Apellido);

            return aux;
   
        }
    }
}