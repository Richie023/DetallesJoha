using System;
using System.Collections.Generic;
using System.Data.SqlClient;
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


                long? idUsuario = Session["UsuarioID"] as long?;

                if (idUsuario == null)
                {
                    return AgregarCarritoInvitado(idProducto, cantProducto);
                }

              
                var nuevoCarrito = new Carrito
                {
                    ConsecutivoUsuario = idUsuario.Value,
                    ConsecutivoProducto = idProducto,
                    Cantidad = cantProducto
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
                        Total = (precioFinal * cantProducto) * 1.13M
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


        public ActionResult ConsultaCarrito()
        {
            var carritoTemporal = Session["CarritoInvitado"] as List<CarritoProductoViewModel>
                ?? new List<CarritoProductoViewModel>();

            return View(carritoTemporal);
        }


        [HttpPost]
        public ActionResult EliminarCarrito(long ConsecutivoCarrito)
        {
            long? idUsuario = Session["UsuarioID"] as long?;

            if (idUsuario == null)
            {
                var carritoTemporal = Session["CarritoInvitado"] as List<CarritoProductoViewModel>
                                      ?? new List<CarritoProductoViewModel>();

                carritoTemporal = carritoTemporal
                    .Where(x => x.CarritoItem.ConsecutivoCarrito != ConsecutivoCarrito)
                    .ToList();

                Session["CarritoInvitado"] = carritoTemporal;
                Session["Cantidad"] = carritoTemporal.Sum(x => x.CarritoItem.Cantidad);
                Session["SubTotal"] = carritoTemporal.Sum(x => x.CarritoItem.SubTotal);
                Session["IVA"] = carritoTemporal.Sum(x => x.CarritoItem.Impuesto);
                Session["Total"] = carritoTemporal.Sum(x => x.CarritoItem.Total);
            }
            else
            {
                var respuesta = modelo.EliminarCarrito(ConsecutivoCarrito);
                if (respuesta.Codigo != 0)
                {
                    ViewBag.MsjPantalla = respuesta.Detalle;
                }

                ActualizarVariablesCarrito();
               
            }

            var referrer = Request.UrlReferrer;
            if (referrer != null)
                return Redirect(referrer.ToString());
            else
                return RedirectToAction("ConsultaCarrito");
        }




        [HttpGet]
        public ActionResult ConsultaCarritos()
        {
            try
            {
                if (Session["Consecutivo"] != null)
                {
                    var respuesta = modelo.ConsultarCarrito(long.Parse(Session["Consecutivo"].ToString()));
                    System.Diagnostics.Debug.WriteLine($"Respuesta API: {respuesta?.Codigo}, Items: {respuesta?.Datos?.Count ?? 0}");

                    if (respuesta?.Codigo == 0 && respuesta.Datos != null && respuesta.Datos.Any())
                    {
                        var viewModel = CarritoHelper.ConvertirAViewModel(respuesta.Datos);
                        System.Diagnostics.Debug.WriteLine($"Productos convertidos: {viewModel.Count}");

                        if (viewModel.Any())
                        {
                            Session["CarritoProductos"] = viewModel;
                            Session["Cantidad"] = viewModel.Sum(x => x.CarritoItem.Cantidad);
                            Session["SubTotal"] = viewModel.Sum(x => x.CarritoItem.SubTotal);
                            Session["Total"] = viewModel.Sum(x => x.CarritoItem.Total);
                            return View(viewModel);
                        }
                    }
                }

                return View(new List<CarritoProductoViewModel>());
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error: {ex.Message}");
                return View(new List<CarritoProductoViewModel>());
            }
        }



        [HttpPost]
        public ActionResult EliminarCarritos(long ConsecutivoCarrito)
        {
            long? idUsuario = Session["UsuarioID"] as long?;

            if (idUsuario != null)
            {
                var respuesta = modelo.EliminarCarrito(ConsecutivoCarrito);
                if (respuesta.Codigo == 0)
                {
                    ActualizarVariablesCarrito();

                    return RedirigirAPaginaAnterior();
                }
                else
                {
                    ViewBag.MsjPantalla = respuesta.Detalle;
                    return RedirigirAPaginaAnterior();
                }
            }
            else
            {
                var carritoTemporal = Session["CarritoInvitado"] as List<CarritoProductoViewModel>
                                     ?? new List<CarritoProductoViewModel>();

                carritoTemporal = carritoTemporal
                    .Where(x => x.CarritoItem.ConsecutivoCarrito != ConsecutivoCarrito)
                    .ToList();

                Session["CarritoInvitado"] = carritoTemporal;
                Session["Cantidad"] = carritoTemporal.Sum(x => x.CarritoItem.Cantidad);
                Session["SubTotal"] = carritoTemporal.Sum(x => x.CarritoItem.SubTotal);
                Session["IVA"] = carritoTemporal.Sum(x => x.CarritoItem.Impuesto);
                Session["Total"] = carritoTemporal.Sum(x => x.CarritoItem.Total);

                return RedirigirAPaginaAnterior();
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
                // 1. Verificamos si hay usuario logueado
                long? idUsuario = Session["UsuarioID"] as long?;

                if (idUsuario == null)
                {
                    // Actualización para usuario invitado: se actualiza la lista en sesión
                    var carritoInvitado = Session["CarritoInvitado"] as List<CarritoProductoViewModel>
                                          ?? new List<CarritoProductoViewModel>();

                    // Buscamos el ítem según su consecutivoCarrito (aquí asumimos que éste es el id del producto)
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
                    // 2. Si el usuario está logueado, se llama al mismo método AgregarCarrito
                    // (que en el backend actúa como upsert: inserta si no existe, o actualiza la cantidad)
                    var carritoModel = new CarritoModel();

                    // Construimos la entidad Carrito. Aquí asumimos que "consecutivoCarrito"
                    // representa el identificador del producto (ConsecutivoProducto) para el SP.
                    Carrito carrito = new Carrito
                    {
                        ConsecutivoUsuario = (long)idUsuario,
                        ConsecutivoProducto = consecutivoCarrito,
                        Cantidad = cantidad
                    };

                    // Este método invoca el stored procedure [dbo].[AgregarCarrito] que se encarga
                    // de insertar o actualizar el registro en la base de datos.
                    var respuesta = carritoModel.AgregarCarrito(carrito);

                    // Recalculamos y actualizamos las variables de sesión, si es necesario.
                    ActualizarVariablesCarrito();
                }

                // 3. Devolvemos un JSON indicando éxito
                return Json(new { success = true }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = ex.Message }, JsonRequestBehavior.AllowGet);
            }
        }




    }


}