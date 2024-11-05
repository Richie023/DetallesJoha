using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Web.Entidades
{
    public class InforE
    {

        public int ConsecutivoInformacion { get; set; }
        public string NombreEmpresa { get; set; }
        public string Telefono { get; set; }
        public string CorreoElectronico { get; set; }
        public string Direccion { get; set; }
        public string AcercaDeNosotros { get; set; }
        public string Contactanos { get; set; }
        public string Politicas { get; set; }
        public string OrdenesDevoluciones { get; set; }
        public string TerminosCondiciones { get; set; }

        public class ConfirmacionInfoE
        {
            public int Codigo { get; set; }
            public string Detalle { get; set; }
            public object Datos { get; set; }
            public object Dato { get; set; }
        }

    }
}
