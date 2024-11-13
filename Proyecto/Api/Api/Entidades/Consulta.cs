using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Api.Entidades
{
    public class Consulta
    {
        public long IdResena { get; set; }
        public string Nombre { get; set; }
        public string Comentario { get; set; }
        public int Calificacion { get; set; }
        public DateTime Fecha { get; set; }
        public string Correo { get; set; }

    }



    public class ConfirmacionConsulta
    {
        public int Codigo { get; set; }
        public string Detalle { get; set; }
        public object Datos { get; set; }
        public object Dato { get; set; }
    }
}