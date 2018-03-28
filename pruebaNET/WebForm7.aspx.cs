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
    public partial class WebForm7 : System.Web.UI.Page
    {
        //Declaramos las variables a nivel global
        string id_empleado;
        string mode;
        protected void Page_Load(object sender, EventArgs e)
        {
            //Modo update pasandole solo el ID empleado
            id_empleado = Request.QueryString["id_empleado"];

            //Comprobamos el modo en el q se pasa a la pantalla de los datos 
            mode = Request.QueryString["mode"];

            //Filtramos por el modo update para pasarle los datos 
            if (!IsPostBack)
            {
                if (mode=="update")
                {
                    //Realizamos la conexión con la bbdd
                    string constring = ConfigurationManager.ConnectionStrings["Prueba2"].ConnectionString;
                    using (System.Data.SqlClient.SqlConnection cnn = new SqlConnection(constring))
                    {
                        //Recuperamos el resto de los datos del id_empleado de la bbdd 
                        string query = @"SELECT dni, nombre, apellido, id_departamento " 
                                     + " FROM EMPLEADOS " 
                                     + " WHERE id_empleado=" +id_empleado+ "";

                        SqlCommand cmd = new SqlCommand(query, cnn);

                        //Establecemos un adaptador para ir extrayendo los datos donde corresponda
                        SqlDataAdapter da = new SqlDataAdapter(cmd);

                        //Genero la tabla
                        DataTable dt = new DataTable();
                        
                        //Agregamos las filas
                        da.Fill(dt);

                        //Agregamos cada dato a la caja correspondiente, [fila][columna], al ser la misma fila 
                        //siempre es 0, en la fila siempre ponemos nº, en la columna podemos indicar nº o 
                        //nombre de la columna de la bbdd.
                        txtIdDpto.Text = dt.Rows[0]["id_departamento"].ToString();
                        txtNombre.Text = dt.Rows[0]["nombre"].ToString();
                        txtApellido.Text = dt.Rows[0]["apellido"].ToString();
                        txtDNI.Text = dt.Rows[0]["dni"].ToString();
                    }
                }
            }
        }

        //Tratamos que sea un caso de actualizar datos
        protected void modificarDatos (string id_empleado)
        {
            //Recogemos en variables nuevas los datos
            var nuevoNombre = txtNombre.Text;
            var nuevoApellido = txtApellido.Text;
            var nuevoIdDpto = txtIdDpto.Text;
            var nuevoDNI = txtDNI.Text;

            //Establecemos la conexión con la bbdd
            string constring = ConfigurationManager.ConnectionStrings["Prueba2"].ConnectionString;
            using (System.Data.SqlClient.SqlConnection cnn = new SqlConnection(constring))
            {
                string query = "update Empleados set id_departamento = '" + nuevoIdDpto +
                                "', nombre = '" + nuevoNombre +
                                "', apellido = '" + nuevoApellido +
                                "', dni = '" + nuevoDNI +
                                "' where (id_empleado = " + id_empleado + ")";

                SqlCommand cmd = new SqlCommand(query, cnn);

                cnn.Open();

                cmd.ExecuteNonQuery();

                cnn.Close();

                Response.Redirect("WebForm5.aspx");
                                
            }
            
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (mode.Equals("update"))
            {
                modificarDatos(id_empleado);
            }
            else
            {
                altaUsuario();
            }
        }

        protected void altaUsuario ()
        {
            string constring = ConfigurationManager.ConnectionStrings["Prueba2"].ConnectionString;
            using (System.Data.SqlClient.SqlConnection cnn = new SqlConnection(constring))
            {
                string query = "insert into Empleados (nombre, apellido, id_departamento, dni) " +
                               " values ('" + txtNombre.Text + "', '" + txtApellido.Text + 
                               "', '" + txtIdDpto.Text + "', '" + txtDNI.Text + "')";

                SqlCommand cmd = new SqlCommand(query, cnn);

                cnn.Open();

                cmd.ExecuteNonQuery();

                cnn.Close();

                Response.Redirect("WebForm5.aspx");
            }
        }
    }
}