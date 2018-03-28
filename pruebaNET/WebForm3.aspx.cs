using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pruebaNET
{
    public enum Operacion{
        Suma = 1,
        Resta,
        Multiplicacion
    };

    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        
        protected int? Suma (string numero1, string numero2)
        {
            if (int.TryParse (numero1, out int n1) && int.TryParse (numero2, out int n2))
            {
                return n1 + n2;
            }
            else
            {
                return null;
            }
        }

        protected int? Resta (string numero1, string numero2)
        {
            if (int.TryParse (numero1, out int n1) && int.TryParse (numero2, out int n2))
            {
                return n1 - n2;
            }
            else
            {
                return null;
            }
        }

        protected int? Multiplicacion (string numero1, string numero2)
        {
            if (int.TryParse (numero1, out int n1) && int.TryParse (numero2, out int n2))
            {
                return n1 * n2;
            }
            else
            {
                return null;
            }
        }

        protected void rdBtnLst_SelectedIndexChanged(object sender, EventArgs e)
        {
            var operacion = rdBtnLst.SelectedValue;
            var numero1 = txtNum1.Text;
            var numero2 = txtNum2.Text;
            int? resultado;

            switch (operacion)
            {
                case "suma":
                    resultado = Suma(numero1, numero2);
                    break;
                case "resta":
                    resultado = Resta (numero1, numero2);
                    break;
                case "mult":
                    resultado = Multiplicacion(numero1, numero2);
                    break;
                default:
                    resultado = null;
                    break;
            }

            lblResultado.Text = (resultado.HasValue)
                ? resultado.Value.ToString()
                : "Opción seleccionada incorrecta";
        }
    }
}