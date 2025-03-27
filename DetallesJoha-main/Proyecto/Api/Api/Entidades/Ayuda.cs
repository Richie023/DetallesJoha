using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Api.Entidades
{
    public class Ayuda
    {
        public int id { get; set; }
        public string categoria { get; set; }
        public string titulo { get; set; }
        public string contenido { get; set; }
        public string imagen_url { get; set; }
        public DateTime ultima_actualizacion { get; set; }
    }

    public class AyudaCategoriaRespuesta
    {
        public int Codigo { get; set; }
        public string Detalle { get; set; } 
        public Object Datos { get; set; } 
        public Object Dato { get; set; }

    }

}