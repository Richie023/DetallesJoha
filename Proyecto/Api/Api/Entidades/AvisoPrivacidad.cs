﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Api.Entidades
{
    public class AvisoPrivacidad
    {
        public int Id { get; set; }
        public string TituloSeccion { get; set; }
        public string SubtituloSeccion { get; set; }
        public string Contenido { get; set; }
        public int Orden { get; set; }
        public DateTime UltimaActualizacion { get; set; }

    }
    public class AvisoPrivacidadRespuesta
    {
        public int Codigo { get; set; } 
        public string Detalle { get; set; } 
        public List<AvisoPrivacidad> Datos { get; set; } 
        public AvisoPrivacidad Dato { get; set; }

    }

}