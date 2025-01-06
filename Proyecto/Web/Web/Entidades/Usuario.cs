﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Web.Entidades
{
    public class Usuario
    {
        public long Consecutivo { get; set; }
        public string Identificacion { get; set; }
        public string Contrasenna { get; set; }
        public string Nombre { get; set; }
        public string CorreoElectronico { get; set; }
        public int ConsecutivoRol { get; set; }
        public string NombreRol { get; set; }
        public bool Estado { get; set; }
    }

    public class ConfirmacionUsuario
    {
        public int Codigo { get; set; }
        public string Detalle { get; set; }
        public List<Usuario> Datos { get; set; }
        public Usuario Dato { get; set; }
    }

}