using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Web.Entidades
{
    public class Consulta
    {
        public long IdResenna { get; set; }    // Cambiar IdResena
        public string NombreUsuario { get; set; }  // Cambiar Nombre
        public string CorreoElectronico { get; set; } // Cambiar Correo
        public int Calificacion { get; set; }
        public string Comentario { get; set; }
        public DateTime FechaResenna { get; set; }  // Cambiar Fecha


    }



    public class ConfirmacionConsulta
    {
        public int Codigo { get; set; }
        public string Detalle { get; set; }

        public List<Consulta> Datos { get; set; }
        public object Dato { get; set; }
    }
}