using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace pruebaNET.DAL
{
    //Creo clase para pasar cadena de conexión a bbdd y poder ejecutarlo con cada consulta 
    public class AccesoDatos
    {
        public void ejecutabbdd (string query,string bbdd)
        {
            string constring = ConfigurationManager.ConnectionStrings[bbdd].ConnectionString;
            using (System.Data.SqlClient.SqlConnection cnn = new SqlConnection(constring))
            {
                SqlCommand cmd = new SqlCommand(query, cnn);

                cnn.Open();

                cmd.ExecuteNonQuery();

                cnn.Close();

            }
        }
    }


}