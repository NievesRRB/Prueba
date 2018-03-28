using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pruebaNET
{
	public partial class WebForm4 : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

        protected void btnAlta_Click(object sender, EventArgs e)
        {
            var nombre = txtNombre.Text;
            var apellido1 = txtApellido1.Text;
            var apellido2 = txtApellido2.Text;

            var nuevo_usuario = RellenarDatos(nombre, apellido1, apellido2);
        }

        protected string RellenarDatos (string nombre, string apellido1, string apellido2)
        {
            var Nombre = txtNombre.Text;
            var Apellido1 = txtApellido1.Text;
            var Apellido2 = txtApellido2.Text;

            var aux = Nombre + Apellido1 + Apellido2;

            return aux;
 
    }

        }
    }