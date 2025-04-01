using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Web.Entidades;
using Web.Models;

namespace Web.Controllers
{
    
    [OutputCache(NoStore = true, VaryByParam = "*", Duration = 0)]
    public class CarritoController : Controller
    {
        CarritoModel modelo = new CarritoModel();


        [HttpPost]
        public ActionResult AgregarCarrito(long idProducto, int cantProducto)
        {
            try
            {
                if (cantProducto <= 0)
                {
                    return Json("Error: Debe ingresar una cantidad mayor que 0.", JsonRequestBehavior.AllowGet);
                }

                
                var productoModelLocal = new ProductoModel();
                var productoResponse = productoModelLocal.ConsultarProducto(idProducto);

              
                if (productoResponse == null || productoResponse.Codigo != 0)
                {
                    return Json("Error: Producto no encontrado.", JsonRequestBehavior.AllowGet);
                }

       
                var inventarioDisponible = productoResponse.Dato.Inventario;
                if (cantProducto > inventarioDisponible)
                {
                    return Json("Error: Cantidad excede el inventario disponible.", JsonRequestBehavior.AllowGet);
                }


                long? idUsuario = Session["Consecutivo"] as long?;

                if (idUsuario == null)
                {
                    return AgregarCarritoInvitado(idProducto, cantProducto);
                }

              
                var nuevoCarrito = new Carrito
                {
                    ConsecutivoUsuario = idUsuario.Value,
                    ConsecutivoProducto = idProducto,
                    Cantidad = cantProducto,
                    RutaDiseno = Session["UltimoDiseno"] as string
                };

                var respuesta = modelo.AgregarCarrito(nuevoCarrito);

                if (respuesta != null && respuesta.Codigo == 0)
                {
                    return Json("OK", JsonRequestBehavior.AllowGet);
                }

                return Json("Error al agregar el producto", JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json("Error: " + ex.Message, JsonRequestBehavior.AllowGet);
            }
        }

        
        [HttpPost]
        public ActionResult AgregarCarritoInvitado(long idProducto, int cantProducto)
        {
            try
            {
                if (cantProducto <= 0)
                {
                    return Json("Error: Debe ingresar una cantidad mayor que 0.", JsonRequestBehavior.AllowGet);
                }

                
                var productoModelLocal = new ProductoModel();
                var productoResponse = productoModelLocal.ConsultarProducto(idProducto);

                if (productoResponse == null || productoResponse.Codigo != 0)
                {
                    return Json("Error: Producto no encontrado.", JsonRequestBehavior.AllowGet);
                }

                var inventarioDisponible = productoResponse.Dato.Inventario; 
                if (cantProducto > inventarioDisponible)
                {
                    return Json("Error: Cantidad excede el inventario disponible.", JsonRequestBehavior.AllowGet);
                }

                var carritoTemporal = Session["CarritoInvitado"] as List<CarritoProductoViewModel> ?? new List<CarritoProductoViewModel>();

                decimal precioFinal = productoResponse.Dato.En_promocion
                    ? productoResponse.Dato.PrecioConDescuento
                    : productoResponse.Dato.Precio;

               
                var productoExistente = carritoTemporal.FirstOrDefault(x => x.CarritoItem.ConsecutivoProducto == idProducto);

                if (productoExistente != null)
                {
                    productoExistente.CarritoItem.Cantidad += cantProducto;
                    productoExistente.CarritoItem.SubTotal = productoExistente.CarritoItem.Precio * productoExistente.CarritoItem.Cantidad;
                    productoExistente.CarritoItem.Impuesto = productoExistente.CarritoItem.SubTotal * 0.13M;
                    productoExistente.CarritoItem.Total = productoExistente.CarritoItem.SubTotal * 1.13M;
                }
                else
                {
                    var nuevoCarrito = new Carrito
                    {
                        ConsecutivoCarrito = carritoTemporal.Count + 1,
                        ConsecutivoProducto = idProducto,
                        Cantidad = cantProducto,
                        Precio = precioFinal,
                        SubTotal = precioFinal * cantProducto,
                        Impuesto = (precioFinal * cantProducto) * 0.13M,
                        Total = (precioFinal * cantProducto) * 1.13M,
                        RutaDiseno = Session["UltimoDiseno"] as string
                    };

                    carritoTemporal.Add(new CarritoProductoViewModel
                    {
                        CarritoItem = nuevoCarrito,
                        ProductoItem = productoResponse.Dato
                    });
                }

                Session["CarritoInvitado"] = carritoTemporal;
                Session["Cantidad"] = carritoTemporal.Sum(x => x.CarritoItem.Cantidad);
                Session["SubTotal"] = carritoTemporal.Sum(x => x.CarritoItem.SubTotal);
                Session["IVA"] = carritoTemporal.Sum(x => x.CarritoItem.Impuesto);
                Session["Total"] = carritoTemporal.Sum(x => x.CarritoItem.Total);
                Session["UltimoDiseno"] = null;
                Session.Timeout = 30;

                return Json("OK", JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json("Error: " + ex.Message, JsonRequestBehavior.AllowGet);
            }
        }





        [HttpGet]
        public ActionResult ObtenerCantidadCarrito()
        {
            var cantidad = Session["Cantidad"] ?? 0;
            return Json(cantidad, JsonRequestBehavior.AllowGet);
        }


        [HttpPost]
        public ActionResult EliminarCarrito(long ConsecutivoCarrito)
        {
            try
            {
                // Detectar usuario logueado mediante sesión
                long? idUsuario = Session["Consecutivo"] as long?;

                if (idUsuario.HasValue)
                {
                    // Usuario logueado - eliminar desde base de datos
                    var respuesta = modelo.EliminarCarrito(ConsecutivoCarrito);
                    if (respuesta.Codigo != 0)
                    {
                        ViewBag.MsjPantalla = respuesta.Detalle;
                    }

                    // Actualiza variables de sesión desde base de datos
                    ActualizarVariablesCarrito();
                }
                else
                {
                    // Usuario no logueado - eliminar desde sesión local
                    var carritoTemporal = Session["CarritoInvitado"] as List<CarritoProductoViewModel>
                                          ?? new List<CarritoProductoViewModel>();

                    carritoTemporal = carritoTemporal
                        .Where(x => x.CarritoItem.ConsecutivoCarrito != ConsecutivoCarrito)
                        .ToList();

                    Session["CarritoInvitado"] = carritoTemporal;

                    // Actualizar variables generales de sesión
                    Session["Cantidad"] = carritoTemporal.Sum(x => x.CarritoItem.Cantidad);
                    Session["SubTotal"] = carritoTemporal.Sum(x => x.CarritoItem.SubTotal);
                    Session["IVA"] = carritoTemporal.Sum(x => x.CarritoItem.Impuesto);
                    Session["Total"] = carritoTemporal.Sum(x => x.CarritoItem.Total);
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error al eliminar producto del carrito: {ex.Message}");
                ViewBag.MsjPantalla = "Error al eliminar producto del carrito.";
            }

            // Redirige siempre a la página anterior o por defecto a "ConsultaCarrito"
            var referrer = Request.UrlReferrer;
            if (referrer != null)
                return Redirect(referrer.ToString());

            return RedirectToAction("ConsultaCarrito");

        }
        


        [HttpGet]
        public ActionResult ConsultaCarrito()
        {
            try
            {
                List<CarritoProductoViewModel> carritoProductos;

                if (Session["Consecutivo"] != null)
                {
                    // Usuario logueado: consulta desde la base de datos usando el consecutivo.
                    var respuesta = modelo.ConsultarCarrito(long.Parse(Session["Consecutivo"].ToString()));

                    if (respuesta?.Codigo == 0 && respuesta.Datos != null && respuesta.Datos.Any())
                    {
                        carritoProductos = CarritoHelper.ConvertirAViewModel(respuesta.Datos);
                        Session["CarritoProductos"] = carritoProductos;
                    }
                    else
                    {
                        carritoProductos = new List<CarritoProductoViewModel>();
                    }
                }
                else
                {
                    // Usuario no logueado: recupera desde sesión local.
                    carritoProductos = Session["CarritoInvitado"] as List<CarritoProductoViewModel>
                        ?? new List<CarritoProductoViewModel>();
                }

                // Actualiza variables de sesión generales (Cantidad, SubTotal y Total).
                Session["Cantidad"] = carritoProductos.Sum(x => x.CarritoItem.Cantidad);
                Session["SubTotal"] = carritoProductos.Sum(x => x.CarritoItem.SubTotal);
                Session["Total"] = carritoProductos.Sum(x => x.CarritoItem.Total);

                return View(carritoProductos);
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error en ConsultaCarrito: {ex.Message}");
                return View(new List<CarritoProductoViewModel>());
            }
        }





       
        private ActionResult RedirigirAPaginaAnterior()
        {
            var referrer = Request.UrlReferrer;
            if (referrer != null)
                return Redirect(referrer.ToString());
            else
                return RedirectToAction("ConsultaCarrito", "Carrito");
        }




        [HttpPost]
        public ActionResult PagarCarrito(Carrito entidad)
        {
            entidad.ConsecutivoUsuario = long.Parse(Session["Consecutivo"].ToString());

            entidad.Correo = Session["CorreoElectronico"].ToString();
            var respuesta = modelo.PagarCarrito(entidad);

            if (respuesta.Codigo == 0)
            {
                ActualizarVariablesCarrito();
                return RedirectToAction("PantallaPrincipal", "Inicio");
            }
            else
            {
                ViewBag.MsjPantalla = respuesta.Detalle;

                var items = modelo.ConsultarCarrito(long.Parse(Session["Consecutivo"].ToString()));
                return View("ConsultaCarrito", items.Datos);
            }
        }



        [HttpGet]
        public ActionResult ConsultarFacturas()
        {
            var respuesta = modelo.ConsultarFacturas(long.Parse(Session["Consecutivo"].ToString()));

            if (Session["RolUsuario"] != null && Session["RolUsuario"].ToString() == "1")
            {

                respuesta = modelo.ConsultarFacturas(0);
            }


            if (respuesta.Codigo == 0)
            {
                return View(respuesta.Datos);
            }
            else
            {
                ViewBag.MsjPantalla = respuesta.Detalle;
                return View(new List<Carrito>());
            }
        }



        [HttpGet]
        public ActionResult ConsultarDetalleFacturas(long id)
        {
            var respuesta = modelo.ConsultarDetalleFacturas(id);

            if (respuesta.Codigo == 0)
            {
                return View(respuesta.Datos);
            }
            else
            {
                ViewBag.MsjPantalla = respuesta.Detalle;
                return View(new List<Carrito>());
            }
        }



        [HttpGet]
        public ActionResult RefacturaFactura(long id, long Cant)
        {
            var respuesta = modelo.RefacturaFactura(id);

            if (respuesta.Codigo == 0)
            {
                return View(respuesta.Datos);
            }
            else
            {
                ViewBag.MsjPantalla = respuesta.Detalle;
                return View(new List<Carrito>());
            }
        }

        private void ActualizarVariablesCarrito()
        {
            if (Session["Consecutivo"] != null)
            {
                var datos = modelo.ConsultarCarrito(long.Parse(Session["Consecutivo"].ToString()));

                if (datos != null && datos.Codigo == 0 && datos.Datos != null)
                {
                    var productoModel = new ProductoModel();
                    var carritoProductos = new List<CarritoProductoViewModel>();

                    decimal subtotal = 0;
                    decimal iva = 0;
                    decimal total = 0;

                    foreach (var item in datos.Datos)
                    {
                        var productoResponse = productoModel.ConsultarProducto(item.ConsecutivoProducto);
                        if (productoResponse != null && productoResponse.Codigo == 0)
                        {
                            // Calcular subtotal por item
                            decimal precioUnitario = productoResponse.Dato.En_promocion ?
                                productoResponse.Dato.PrecioConDescuento : productoResponse.Dato.Precio;

                            decimal itemSubtotal = item.Cantidad * precioUnitario;
                            decimal itemIva = itemSubtotal * 0.13M;
                            decimal itemTotal = itemSubtotal + itemIva;

                            // Actualizar los valores del item
                            item.SubTotal = itemSubtotal;
                            item.Impuesto = itemIva;
                            item.Total = itemTotal;

                            // Acumular totales
                            subtotal += itemSubtotal;
                            iva += itemIva;
                            total += itemTotal;

                            carritoProductos.Add(new CarritoProductoViewModel
                            {
                                CarritoItem = item,
                                ProductoItem = productoResponse.Dato
                            });
                        }
                    }

                    // Actualizar variables de sesión
                    Session["CarritoProductos"] = carritoProductos;
                    Session["Cantidad"] = datos.Datos.Sum(x => x.Cantidad);
                    Session["SubTotal"] = subtotal;
                    Session["IVA"] = iva;
                    Session["Total"] = total;

                    // Para debug
                    System.Diagnostics.Debug.WriteLine($"Subtotal: {subtotal}");
                    System.Diagnostics.Debug.WriteLine($"IVA: {iva}");
                    System.Diagnostics.Debug.WriteLine($"Total: {total}");
                }
                else
                {
                    LimpiarVariablesCarrito();
                }
            }
        }

        private void LimpiarVariablesCarrito()
        {
            Session["CarritoProductos"] = new List<CarritoProductoViewModel>();
            Session["Cantidad"] = 0;
            Session["SubTotal"] = 0;
            Session["IVA"] = 0;
            Session["Total"] = 0;
        }



        [HttpGet]
        public ActionResult ConsultarPedidos()
        {
            try
            {
                var respuesta = modelo.ConsultarPedidos();

                if (respuesta.Codigo == 0 && respuesta.Datos != null)
                {
                    // Convertir la lista de Carrito a CarritoProductoViewModel
                    var pedidosConProductos = CarritoHelper.ConvertirAViewModel(respuesta.Datos);
                    // Log para depuración
                    System.Diagnostics.Debug.WriteLine($"Pedidos encontrados: {pedidosConProductos.Count}");
                    return View(pedidosConProductos);
                }
                else
                {
                    ViewBag.MsjPantalla = respuesta.Detalle;
                    return View(new List<CarritoProductoViewModel>());
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error en ConsultarPedidos: {ex.Message}");
                ViewBag.MsjPantalla = "Error al consultar los pedidos";
                return View(new List<CarritoProductoViewModel>());
            }
        }


        [HttpPost]
        public JsonResult ActualizarCantidad(long consecutivoCarrito, int cantidad)
        {
            try
            {
                long? idUsuario = Session["UsuarioID"] as long?;

                if (idUsuario == null)
                {
                    var carritoInvitado = Session["CarritoInvitado"] as List<CarritoProductoViewModel>
                                          ?? new List<CarritoProductoViewModel>();

                    var item = carritoInvitado.FirstOrDefault(x =>
                        x.CarritoItem.ConsecutivoCarrito == consecutivoCarrito);

                    if (item != null)
                    {
                        // Actualizamos la cantidad y recalculamos valores
                        item.CarritoItem.Cantidad = cantidad;
                        item.CarritoItem.SubTotal = item.CarritoItem.Precio * cantidad;
                        item.CarritoItem.Impuesto = item.CarritoItem.SubTotal * 0.13M;
                        item.CarritoItem.Total = item.CarritoItem.SubTotal + item.CarritoItem.Impuesto;
                    }

                    // Recalcular totales globales
                    Session["Cantidad"] = carritoInvitado.Sum(x => x.CarritoItem.Cantidad);
                    Session["SubTotal"] = carritoInvitado.Sum(x => x.CarritoItem.SubTotal);
                    Session["IVA"] = carritoInvitado.Sum(x => x.CarritoItem.Impuesto);
                    Session["Total"] = carritoInvitado.Sum(x => x.CarritoItem.Total);

                    Session["CarritoInvitado"] = carritoInvitado;
                }
                else
                {
                    var carritoModel = new CarritoModel();

                    Carrito carrito = new Carrito
                    {
                        ConsecutivoUsuario = (long)idUsuario,
                        ConsecutivoProducto = consecutivoCarrito,
                        Cantidad = cantidad
                    };

                    var respuesta = carritoModel.AgregarCarrito(carrito);

                    ActualizarVariablesCarrito();
                }

                return Json(new { success = true }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = ex.Message }, JsonRequestBehavior.AllowGet);
            }
        }




        [HttpPost]
        public ActionResult AgregarCarritoConDiseno(CarritoDisenoDto model)
        {
            try
            {
                if (model.CantProducto <= 0)
                    return Json("Error: Debe ingresar una cantidad mayor que 0.", JsonRequestBehavior.AllowGet);

                string rutaArchivo = null;
                if (!string.IsNullOrEmpty(model.DesignBase64))
                {
                    var base64 = model.DesignBase64.Replace("data:image/png;base64,", "");
                    byte[] imageBytes = Convert.FromBase64String(base64);

                    var fileName = $"diseno_{Guid.NewGuid()}.png";
                    var path = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "Imagenes", fileName);
                    System.IO.File.WriteAllBytes(path, imageBytes);

                    rutaArchivo = "/Imagenes/" + fileName;
                }

                Session["UltimoDiseno"] = rutaArchivo;

                return AgregarCarrito(model.IdProducto, model.CantProducto);
            }
            catch (Exception ex)
            {
                return Json("Error: " + ex.Message, JsonRequestBehavior.AllowGet);
            }
        }






    }
}