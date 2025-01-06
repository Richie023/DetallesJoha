using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Api.Models;

namespace Api.Entidades
{
    public class Roles
    {
        public int ConsecutivoRol { get; set; }
        public string NombreRol { get; set; }
    }

    public class ConfirmacionRoles
    {
      public int Codigo { get; set; }
        public string Detalle { get; set; }
        public List<ConsultarRoles_Result> Datos { get; set; }
        public ConsultarRoles_Result Dato { get; set; }
    }
}
