using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Web.Entidades;

namespace Web.Models
{
    public class CarritoProductoViewModel
    {
        public Carrito CarritoItem { get; set; }
        public Producto ProductoItem { get; set; }
    }

    public static class CarritoHelper
    {
        public static List<CarritoProductoViewModel> ConvertirAViewModel(List<Carrito> carritoItems)
        {
            var productoModel = new ProductoModel();
            var viewModels = new List<CarritoProductoViewModel>();

            foreach (var item in carritoItems)
            {
                Console.WriteLine($"Consecutivo del producto en carrito: {item.ConsecutivoProducto}");
                var productoResponse = productoModel.ConsultarProducto(item.ConsecutivoProducto);
                if (productoResponse != null && productoResponse.Codigo == 0 && productoResponse.Dato != null)
                {
                    var carritoProducto = new CarritoProductoViewModel();

                    // Asignar valores del Carrito
                    carritoProducto.CarritoItem = new Carrito
                    {
                        ConsecutivoCarrito = item.ConsecutivoCarrito,
                        ConsecutivoUsuario = item.ConsecutivoUsuario,
                        ConsecutivoProducto = item.ConsecutivoProducto,
                        Cantidad = item.Cantidad,
                        Fecha = item.Fecha,
                        SubTotal = item.SubTotal,
                        Impuesto = item.Impuesto,
                        Total = item.Total,
                        Precio = item.Precio,
                        Nombre = item.Nombre,
                        Material = item.Material,
                        Tamanio = item.Tamanio,
                        RutaImagen = item.RutaImagen
                    };

                    // Asignar valores del Producto
                    carritoProducto.ProductoItem = new Producto
                    {
                        Consecutivo = productoResponse.Dato.Consecutivo,
                        NombreProducto = productoResponse.Dato.NombreProducto,
                        Precio = productoResponse.Dato.Precio,
                        RutaImagen = productoResponse.Dato.RutaImagen,
                        Material = productoResponse.Dato.Material,
                        Tamanio = productoResponse.Dato.Tamanio,
                        En_promocion = productoResponse.Dato.En_promocion,
                        PrecioConDescuento = productoResponse.Dato.PrecioConDescuento,
                        Estado = productoResponse.Dato.Estado,
                        IdCategoria = productoResponse.Dato.IdCategoria,
                        NombreCategoria = productoResponse.Dato.NombreCategoria
                    };

                    viewModels.Add(carritoProducto);
                }
            }
            return viewModels;
        }
    }
}