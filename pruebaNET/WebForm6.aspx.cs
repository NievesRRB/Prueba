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
    public partial class WebForm6 : System.Web.UI.Page
    {
        string id_empleado;
        string mode;

        protected void Page_Load(object sender, EventArgs e)
        {

            //Modo update pasandole todos los datos
            id_empleado = Request.QueryString["id_empleado"];
            //Comprobamos el modo en el q accedemos mode=insert o mode=update
            mode = Request.QueryString["mode"];

            if (!IsPostBack)
            {
                cargarDesplegableDepartamentos();
                if (!IsPostBack)
                {
                    if (mode == "update")
                    {
                        ddlDepartamentos.SelectedValue = Request.QueryString["id_dpto"];
                        txtNombre.Text = Request.QueryString["nombre"];
                        txtApellido1.Text = Request.QueryString["apellido"];
                        txtDNI.Text = Request.QueryString["dni"];
                    }
                }
            }

        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {

            
            if (mode.Equals("update"))
            {
                actualizarDatos();
            }
            else
            {
                insertarDatos();
            }
           
         }

        protected void actualizarDatos()
        {
            var nombreActualizado = txtNombre.Text;
            var iddptoActualizado = (ddlDepartamentos.SelectedValue).ToString();
            var apellidoActualizado = txtApellido1.Text;
            var dniActualizado = txtDNI.Text;

            if (ddlDepartamentos.SelectedValue.ToString() == "0")
            {
                //RequiredFieldIdDpto.SetFocusOnError = true;
                //RequiredFieldIdDpto.Enabled = true;
                RequiredFieldIdDpto.IsValid = false;
            }
            else
            {
                string constring = ConfigurationManager.ConnectionStrings["Prueba2"].ConnectionString;
                using (System.Data.SqlClient.SqlConnection cnn = new SqlConnection(constring))
                {
                    string query = "update Empleados set id_departamento = " + ddlDepartamentos.SelectedValue +
                                    ", nombre = '" + nombreActualizado +
                                    "', apellido='" + apellidoActualizado +
                                    "', dni='" + dniActualizado +
                                    "' where (id_empleado=" + id_empleado + ")";
                    /*string a = string.Format("update Empleados set id_departamento = {0}, nombre = '{1}', apellido = '{2}', dni = '{3}' where id_empleado = {4}",
                                                iddptoActualizado, nombreActualizado, apellidoActualizado, dniActualizado, id_empleado);*/

                    SqlCommand cmd = new SqlCommand(query, cnn);

                    cnn.Open();

                    cmd.ExecuteNonQuery();

                    cnn.Close();

                    Response.Redirect("WebForm5.aspx");
                }
            }
                
        }

        protected void insertarDatos ()
        {
            if (ddlDepartamentos.SelectedValue.ToString() == "0")
            {
                //RequiredFieldIdDpto.SetFocusOnError = true;
                //RequiredFieldIdDpto.Enabled = true;
                RequiredFieldIdDpto.IsValid = false;
            }
            else
            {
                string constring = ConfigurationManager.ConnectionStrings["Prueba2"].ConnectionString;
                using (System.Data.SqlClient.SqlConnection cnn = new SqlConnection(constring))
                {
                    string query = "insert into Empleados (nombre, apellido, dni, id_departamento) values ('" + txtNombre.Text + "','" + txtApellido1.Text + "','" + txtDNI.Text + "'," + ddlDepartamentos.SelectedValue + ")";

                    SqlCommand cmd = new SqlCommand(query, cnn);

                    //Abro la conexión 
                    cnn.Open();

                    //Insertamos en la bbdd
                    cmd.ExecuteNonQuery();

                    //Cierro la conexión
                    cnn.Close();

                    Response.Redirect("WebForm5.aspx");
                }
           }
                
        }

        protected void cargarDesplegableDepartamentos ()
        {
            string constring = ConfigurationManager.ConnectionStrings["Prueba2"].ConnectionString;
            using (System.Data.SqlClient.SqlConnection cnn = new SqlConnection(constring))
            {
                string cargaDdl = "SELECT id_departamento, nombre from Departamentos";
                SqlCommand cmdDdl = new SqlCommand(cargaDdl, cnn);

                SqlDataAdapter daDdl = new SqlDataAdapter(cmdDdl);

                DataTable dtDdl = new DataTable();

                daDdl.Fill(dtDdl);

                ddlDepartamentos.DataSource = dtDdl;
                ddlDepartamentos.DataBind();

                //Generamos opción en blanco en el desplegable 
                ListItem lista = new ListItem();

                //Asignamos valor y texto a la opción
                lista.Value = Convert.ToString ("0");
                lista.Text = Convert.ToString("Seleccionar...");

                //Por defecto le indicamos que nos salga la opción en blanco en el desplegable
                lista.Selected = true;

                //Añadimos la nueva opción al desplegable
                ddlDepartamentos.Items.Add(lista);

            }
        }
    }
}