using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Web.Entidades
{
    public class AvisoPrivacidad
    {
        public int id { get; set; }
        public string titulo_seccion { get; set; }
        public string contenido { get; set; }
        public DateTime? ultima_actualizacion { get; set; }

    }
    public class AvisoPrivacidadRespuesta
    {
        public int Codigo { get; set; }
        public string Detalle { get; set; }
        public List<AvisoPrivacidad> Datos { get; set; }
        public AvisoPrivacidad Dato { get; set; }

    }

}