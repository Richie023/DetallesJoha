using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Api.Entidades
{
    public class PreguntasFrecuentes
    {
        public int Id { get; set; }
        public string Categoria { get; set; }
        public string Pregunta { get; set; }
        public string Respuesta { get; set; }
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