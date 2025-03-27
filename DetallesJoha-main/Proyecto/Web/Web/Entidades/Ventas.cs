using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Web.Entidades
{
    public class Ventas
    {
        public string Mes { get; set; }
        public decimal TotalMes { get; set; }
        public string NombreUsuario { get; set; }
        public decimal TotalUsuario { get; set; }
    }

    public class ConfirmacionVentas
    {
        public int Codigo { get; set; }
        public string Detalle { get; set; }
        public List<Ventas> Datos { get; set; }
        public Ventas Dato { get; set; }
    }
}