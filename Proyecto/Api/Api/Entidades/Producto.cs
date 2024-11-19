using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Api.Entidades
{
    public class Producto
    {
        public long Consecutivo { get; set; }
        public string NombreProducto { get; set; }
        public decimal Precio { get; set; }
        public int Inventario { get; set; }
        public bool Estado { get; set; }
        public string RutaImagen { get; set; }
        public int IdCategoria { get; set; }
        public string NombreCategoria { get; set; }
        public string Material { get; set; }
        public string Tamanio { get; set; }
        public string ColorBase { get; set; }
        public int? Id_Promocion { get; set; }    

        // Propiedades adicionales para manejar promociones

        public int Id_promociones { get; set; }
            public bool En_promocion { get; set; }
            public int? Porcentaje_descuento { get; set; }
            public DateTime? Fecha_inicio { get; set; }
            public DateTime? Fecha_fin { get; set; }
            public decimal PrecioConDescuento { get; set; }

        // Nueva propiedad para indicar si la promoción está activa
        public int PromocionActiva { get; set; }

    }

    public class ConfirmacionProducto
    {
        public int Codigo { get; set; }
        public string Detalle { get; set; }
        public object Datos { get; set; }
        public object Dato { get; set; }

    }



}