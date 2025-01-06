using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Web.Entidades
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
            public List<Roles> Datos { get; set; }
            public Roles Dato { get; set; }
        }
    }
