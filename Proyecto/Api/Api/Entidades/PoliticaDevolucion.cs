using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Api.Entidades
{
    public class PoliticaDevolucion
    {
        public int Id { get; set; }
        public string TituloSeccion { get; set; }
        public string SubtituloSeccion { get; set; }
        public string Contenido { get; set; }
        public int Orden { get; set; }
        public DateTime UltimaActualizacion { get; set; }

    }
    public class PoliticaDevolucionRespuesta
    {
        public int Codigo { get; set; } 
        public string Detalle { get; set; } 
        public Object Datos { get; set; }
        public PoliticaDevolucion Dato { get; set; }
    }

}