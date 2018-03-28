using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pruebaNET
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSuma_Click(object sender, EventArgs e)
        {
            var numero1 = txtNumero1.Text;
            var numero2 = txtNumero2.Text;
            //btnSuma.Text = numero1 + numero2;

            int? valor = Suma(numero1, numero2);

            btnSuma.Text = (valor.HasValue)
                   ? valor.Value.ToString()
                   : "Los datos de entrada eran incorrectos";

            /*
            if (valor.HasValue)
            {
                btnSuma.Text = valor.Value.ToString();
            }
            else
            {
                btnSuma.Text = "Los datos de entrada eran incorrectos";
            }
            */
            
         }

        protected int? Suma (string numero1, string numero2)
        {
            if (int.TryParse(numero1, out int n1) && int.TryParse(numero2, out int n2))
            {
                return n1 + n2;
            }
            else
            {
                return null;
            }

            //int suma = Convert.ToInt32(numero1) + Convert.ToInt32(numero2);

            //return suma;
        }
    }
}