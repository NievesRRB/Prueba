using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pruebaNET
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cargarDesplegable();
                CargarDatos();
            }
        }


        protected void CargarDatos()
        {
            string constring = ConfigurationManager.ConnectionStrings["Prueba2"].ConnectionString;
            using (System.Data.SqlClient.SqlConnection cnn = new SqlConnection(constring))
            {
                //Verificamos que la selección sea con la condición del departamento o sin ella
                if (ddlDepartamentos.SelectedValue == "0")
                {
                    //Accedemos a la bbdd haciendo un SELECT de todos los Empleados
                    string cargaEmpleados = "SELECT * FROM Empleados";
                    SqlCommand cmdEmpleados = new SqlCommand(cargaEmpleados, cnn);
                    SqlDataAdapter daEmpleados = new SqlDataAdapter(cmdEmpleados);
                    DataTable dtEmpleados = new DataTable();
                    daEmpleados.Fill(dtEmpleados);

                    gdV.DataSource = dtEmpleados;
                    gdV.DataBind();
                }
                else
                {
                    //Rellenamos tabla
                    string cargaEmpleados = "SELECT * FROM Empleados WHERE (id_departamento = " + ddlDepartamentos.SelectedValue + ")";
                    SqlCommand cmdEmpleados = new SqlCommand(cargaEmpleados, cnn);
                    SqlDataAdapter daEmpleados = new SqlDataAdapter(cmdEmpleados);
                    DataTable dtEmpleados = new DataTable();
                    daEmpleados.Fill(dtEmpleados);

                    gdV.DataSource = dtEmpleados;
                    gdV.DataBind();
                }
            }
        }

        protected void cargarDesplegable ()
        {
            string constring = ConfigurationManager.ConnectionStrings["Prueba2"].ConnectionString;
            using (System.Data.SqlClient.SqlConnection cnn = new SqlConnection(constring))
            {
                //Rellenamos DropDownList
                /*Si quisiera concatenar id_departamento con el nombre, aunq no suele a efectos del usuario
                 * mostrarse el id*/
                /*SELECT concat (id_departamento, '.', nombre) from Departamentos*/
                string cargaddl = "SELECT id_departamento, nombre from Departamentos";
                SqlCommand cmdDdl = new SqlCommand(cargaddl, cnn);

                SqlDataAdapter daDdl = new SqlDataAdapter(cmdDdl);

                DataTable dtDdl = new DataTable();

                daDdl.Fill(dtDdl);
                
                ddlDepartamentos.DataSource = dtDdl;
                ddlDepartamentos.DataBind();
            }

            //Generamos mi opción de Todos en el desplegable.
            ListItem lista = new ListItem();

            //Asignamos valor y texto a la opción que añadimos manualmente
            lista.Value = Convert.ToString("0");
            lista.Text = Convert.ToString("Todos");

            //Indicamos que por defecto nos salga seleccionado "Todos"
            lista.Selected = true;
            
            //Añadimos la nueva opción al desplegable
            ddlDepartamentos.Items.Add(lista);
        }

       protected void btnAlta_Click(object sender, EventArgs e)
       {
           Response.Redirect("WebForm6.aspx?mode=insert");
       }

       protected void btnTrash_Click(object sender, EventArgs e)
       {
           LinkButton buttonBorrar = sender as LinkButton;

           var id_empleado = buttonBorrar.CommandName;

           //string constring = ConfigurationManager.ConnectionStrings["Prueba2"].ConnectionString;
           //using (System.Data.SqlClient.SqlConnection cnn = new SqlConnection(constring))
           //{
           // Para poder llamar a mi clase acceso a bbdd, debo de crear una variable previamente, llamando al objeto
           /*var accesobbdd = new DAL.AccesoDatos();*/
                //Una vez tengo mi variable, donde llamo a mi objeto, le paso la query y la bbdd
                /*accesobbdd.ejecutabbdd(query, "Prueba3");*/

                var accedoBbdd = new DAL.AccesoDatos();
                string query = "DELETE FROM Empleados where id_empleado=('" + id_empleado + "')";
                accedoBbdd.ejecutabbdd(query, "Prueba2");

                //SqlCommand cmd = new SqlCommand(query, cnn);
                
                //Abro la conexión 
                //cnn.Open();

                //Insertamos en la bbdd
                //cmd.ExecuteNonQuery();

                //Cierro la conexión
                //cnn.Close();

                CargarDatos();

            //}
        }

        protected void btnPencil_Click(object sender, EventArgs e)
        {
            //Creamos el boton de tipo Linkbutton, donde le enviaremos luego los atributos
            LinkButton buttonEditar = sender as LinkButton;

            //Al pasarlo en modo update, tenemor que irle pasando cada atributo del boton declaramos en el 
            //Linkbutton de pencil (nombre, apellido, dni, ....)
            Response.Redirect("WebForm6.aspx?mode=update&nombre=" + buttonEditar.Attributes["nombre"] + "&apellido=" + buttonEditar.Attributes["apellido"] + "&dni=" + buttonEditar.Attributes["dni"] + "&id_dpto=" + buttonEditar.Attributes["id_departamento"] + "&id_empleado=" + buttonEditar.Attributes["id_empleado"]);
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            //Creo el botón LinkButton

            LinkButton buttonEdicion = sender as LinkButton;

            //Pasamos únicamente 2 parametros, el modo update y otro mas. 
            Response.Redirect("WebForm7.aspx?mode=update&id_empleado=" + buttonEdicion.CommandName);
        }

        protected void ddlDepartamentos_TextChanged(object sender, EventArgs e)
        {
            CargarDatos();
        }
    }
}