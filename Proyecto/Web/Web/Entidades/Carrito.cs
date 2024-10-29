using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Web.Entidades
{
    public class Carrito
    {
        public long ConsecutivoCarrito { get; set; }
        public long ConsecutivoUsuario { get; set; }
        public long ConsecutivoProducto { get; set; }
        public DateTime Fecha { get; set; }
        public int Cantidad { get; set; }
        public decimal SubTotal { get; set; }
        public decimal Impuesto { get; set; }
        public decimal Total { get; set; }
        public decimal Precio { get; set; }
        public string Nombre { get; set; }
        public string NombreUsuario { get; set; }
        public long ConsecutivoMaestro { get; set; }
        public long ConsecutivoDetalle { get; set; }
        public string Material { get; set; }

        public string Tamanio { get; set; }

        public string ColorBase { get; set; }

    }

    public class ConfirmacionCarrito
    {
        public int Codigo { get; set; }
        public string Detalle { get; set; }
        public List<Carrito> Datos { get; set; }
        public Carrito Dato { get; set; }
    }
}