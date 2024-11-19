using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Api.Entidades
{
    public class BlogArticulo
    {
        public int Id { get; set; }
        public string Categoria { get; set; }
        public string Titulo { get; set; }
        public string Resumen { get; set; }
        public string Contenido { get; set; }
        public string Imagen_url { get; set; }
        public DateTime FechaPublicacion { get; set; }
        public DateTime UltimaActualizacion { get; set; }

    }

    public class BlogRespuesta
    {
        public int Codigo { get; set; } 
        public string Detalle { get; set; } 
        public List<BlogArticulo> Datos { get; set; } 
        public BlogArticulo Dato { get; set; }
    }

}