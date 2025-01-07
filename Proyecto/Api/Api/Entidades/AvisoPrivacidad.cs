using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Api.Entidades
{
    public class AvisoPrivacidad
    {
        public int id { get; set; }
        public string titulo_seccion { get; set; }
        public string contenido { get; set; }
        public DateTime ultima_actualizacion { get; set; }

    }
    public class AvisoPrivacidadRespuesta
    {
        public int Codigo { get; set; } 
        public string Detalle { get; set; }
        public Object Datos { get; set; } 
        public Object Dato { get; set; }

    }

}