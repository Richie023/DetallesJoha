using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Api.Entidades
{
    public class PreguntasFrecuentes
    {
        public int id { get; set; }
        public string categoria { get; set; }
        public string pregunta { get; set; }
        public string respuesta { get; set; }
        public DateTime UltimaActualizacion { get; set; }
    }

    public class FaqRespuesta
    {
        public int Codigo { get; set; }
        public string Detalle { get; set; }
        public Object  Datos { get; set; }
        public PreguntasFrecuentes Dato { get; set; }

    }

}