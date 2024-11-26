using System.Collections.Generic;
using System.Linq;
using Web.Models;
using System.Web.Mvc;
using Web.Entidades;


namespace Web.Controllers
{
    [OutputCache(NoStore = true, VaryByParam = "*", Duration = 0)]
    public class InicioController : Controller
    {
        UsuarioModel modelo = new UsuarioModel();
        ProductoModel Modelo = new ProductoModel();

        ProductoModel productoModel = new ProductoModel();
        CarritoModel carritoModel = new CarritoModel();

        [HttpGet]
        public ActionResult IniciarSesion()
        {
            return View();
        }

        [HttpPost]
        public ActionResult IniciarSesion(Usuario entidad)
        {
            var respuesta = modelo.IniciarSesionUsuario(entidad);

            if (respuesta.Codigo == 0)
            {
                Session["Consecutivo"] = respuesta.Dato.Consecutivo;
                Session["NombreUsuario"] = respuesta.Dato.Nombre;
                Session["RolUsuario"] = respuesta.Dato.ConsecutivoRol;
                Session["NombreRol"] = respuesta.Dato.NombreRol;
                return RedirectToAction("PantallaPrincipal", "Inicio");
            }
            else
            {
                ViewBag.MsjPantalla = respuesta.Detalle;
                return View();
            }
        }


        [HttpGet]
        public ActionResult RegistrarUsuario()
        {
            return View();
        }

        [HttpPost]
        public ActionResult RegistrarUsuario(Usuario entidad)
        {
            var respuesta = modelo.RegistrarUsuario(entidad);

            if (respuesta.Codigo == 0)
                return RedirectToAction("IniciarSesion", "Inicio");
            else
            {
                ViewBag.MsjPantalla = respuesta.Detalle;
                return View();
            }
        }


        [HttpGet]
        public ActionResult RecuperarAcceso()
        {
            return View();
        }

        [HttpPost]
        public ActionResult RecuperarAcceso(Usuario entidad)
        {
            var respuesta = modelo.RecuperarAccesoUsuario(entidad);

            if (respuesta.Codigo == 0)
                return RedirectToAction("IniciarSesion", "Inicio");
            else
            {
                ViewBag.MsjPantalla = respuesta.Detalle;
                return View();
            }
        }


  
        [HttpGet]
        public ActionResult PantallaPrincipal()
        {


            if (HttpContext.Session["NombreUsuario"] != null)
            {
                var datos = carritoModel.ConsultarCarrito(long.Parse(Session["Consecutivo"].ToString()));

                ;
                if (datos.Codigo == 0)
                {
                    Session["Cantidad"] = datos.Datos.AsEnumerable().Sum(x => x.Cantidad);
                    Session["SubTotal"] = datos.Datos.AsEnumerable().Sum(x => x.SubTotal);
                    Session["Total"] = datos.Datos.AsEnumerable().Sum(x => x.Total);
                }
            }
            else
            {
                Session["Cantidad"] = "0";
                Session["SubTotal"] = "0";
                Session["Total"] = "0";
            }

            var respuesta = productoModel.ConsultarProductos(false);

            if (respuesta.Codigo == 0)
                return View(respuesta.Datos);
            else
            {
                ViewBag.MsjPantalla = respuesta.Detalle;
                return View(new List<Producto>());
            }
        }

        // Método de acción para filtrar productos por categoría
        [FiltroSeguridad]
        [HttpGet]
        public ActionResult FiltrarPorCategoria(int? IdCategoria)
        {
            var productos = new List<Web.Entidades.Producto>();

            if (IdCategoria.HasValue && IdCategoria > 0)
            {
                // Filtra productos por categoría
                var respuesta = Modelo.FiltrarProductosPorCategoria(IdCategoria.Value);
                productos = respuesta?.Datos as List<Web.Entidades.Producto> ?? new List<Web.Entidades.Producto>();
            }
            else
            {
                // Obtiene todos los productos
                var respuesta = Modelo.ConsultarProductos(true);
                productos = respuesta?.Datos as List<Web.Entidades.Producto> ?? new List<Web.Entidades.Producto>();
            }

            if (productos == null || !productos.Any())
            {
                ViewBag.Mensaje = "No se encontraron productos disponibles.";
            }

            return View(productos);
        }

        public ActionResult FiltrarPorPrecio(decimal? PrecioMinimo, decimal? PrecioMaximo)
        {
            var productos = new List<Web.Entidades.Producto>();

            if (PrecioMinimo.HasValue || PrecioMaximo.HasValue)
            {
                // Llama al modelo para filtrar productos por rango de precios
                var respuesta = Modelo.FiltrarProductosPorRangoPrecio(PrecioMinimo, PrecioMaximo);
                productos = respuesta?.Datos as List<Web.Entidades.Producto> ?? new List<Web.Entidades.Producto>();
            }
            else
            {
                // Llama al modelo para obtener todos los productos
                var respuesta = Modelo.ConsultarProductos(true);
                productos = respuesta?.Datos as List<Web.Entidades.Producto> ?? new List<Web.Entidades.Producto>();
            }

            if (productos == null || !productos.Any())
            {
                ViewBag.Mensaje = "No se encontraron productos disponibles para el rango seleccionado.";
            }

            return RedirectToAction("FiltrarPorCategoria", "Inicio");
        }


        public ActionResult PantallaPorMCT(string Material, string Color, string Tamanio)
        {
            var productos = new List<Web.Entidades.Producto>();

            // Llama al modelo para filtrar productos por las características enviadas
            var respuesta = Modelo.FiltrarProductosPorCaracteristicas(Material, Color, Tamanio);
            productos = respuesta?.Datos as List<Web.Entidades.Producto> ?? new List<Web.Entidades.Producto>();

            if (productos == null || !productos.Any())
            {
                ViewBag.Mensaje = "No se encontraron productos con las características seleccionadas.";
            }

            return RedirectToAction("FiltrarPorCategoria", "Inicio");
        }




        [FiltroSeguridad]
        [HttpGet]
        public ActionResult CerrarSesion()
        {
            Session.Clear();
            return RedirectToAction("PantallaPrincipal", "Inicio");
        }
    }
}