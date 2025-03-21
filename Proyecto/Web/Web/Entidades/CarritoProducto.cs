using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Web.Entidades
{
    public class CarritoProducto
    {
    // Propiedades del carrito
    public long ConsecutivoCarrito { get; set; }
    public long ConsecutivoUsuario { get; set; }
    public long Consecutivo { get; set; }
    public DateTime Fecha { get; set; }
    public int Cantidad { get; set; }
    public decimal SubTotal { get; set; }
    public decimal Impuesto { get; set; }
    public decimal Total { get; set; }
    public decimal Precio { get; set; }
    public string Correo { get; set; }
    public string NombreUsuario { get; set; }
    public long ConsecutivoMaestro { get; set; }
    public long ConsecutivoDetalle { get; set; }
    public string Material { get; set; }
    public string Tamanio { get; set; }

    // Propiedades del producto
    public string NombreProducto { get; set; }
    public decimal PrecioMinimo { get; set; }
    public decimal PrecioMaximo { get; set; }
    public int Inventario { get; set; }
    public bool Estado { get; set; }
    public string RutaImagen { get; set; }
    public int IdCategoria { get; set; }
    public string NombreCategoria { get; set; }
    public string ColorBase { get; set; }
    public int? Id_promocion { get; set; }
    public string Descripcion { get; set; }
    public int Id_promociones { get; set; }
    public bool En_promocion { get; set; }
    public int? Porcentaje_descuento { get; set; }
    public DateTime? Fecha_inicio { get; set; }
    public DateTime? Fecha_fin { get; set; }
    public decimal PrecioConDescuento { get; set; }
    public int PromocionActiva { get; set; }

    // Constructor
    public CarritoProducto(long consecutivoUsuario, long consecutivo, int cantidad, Producto producto)
    {
        ConsecutivoUsuario = consecutivoUsuario;
        Consecutivo = consecutivo;
        Cantidad = cantidad;
        Fecha = DateTime.Now;
        SubTotal = cantidad * (producto.En_promocion ? producto.PrecioConDescuento : producto.Precio);
        Impuesto = cantidad * (producto.En_promocion ? producto.PrecioConDescuento : producto.Precio) * 0.13m; // Ejemplo de impuesto
        Total = cantidad * (producto.En_promocion ? producto.PrecioConDescuento : producto.Precio) * 1.13m; // Total con impuesto
        Precio = producto.Precio;
        NombreProducto = producto.NombreProducto;
        RutaImagen = producto.RutaImagen;
        En_promocion = producto.En_promocion;
        PrecioConDescuento = producto.PrecioConDescuento;
        Correo = "example@example.com"; // Placeholder
        NombreUsuario = "Usuario"; // Placeholder
        ConsecutivoMaestro = 1; // Placeholder
        ConsecutivoDetalle = 1; // Placeholder
        Material = producto.Material;
        Tamanio = producto.Tamanio;
        ColorBase = producto.ColorBase;
        IdCategoria = producto.IdCategoria;
        NombreCategoria = producto.NombreCategoria;
        Id_promocion = producto.Id_promocion;
        Descripcion = producto.Descripcion;
        Id_promociones = producto.Id_promociones;
        Porcentaje_descuento = producto.Porcentaje_descuento;
        Fecha_inicio = producto.Fecha_inicio;
        Fecha_fin = producto.Fecha_fin;
        PromocionActiva = producto.PromocionActiva;
    }
}
}
