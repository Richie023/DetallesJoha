﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Web.Entidades;
using Web.Models;

namespace Web.Controllers
{
    [FiltroSeguridad]
    [OutputCache(NoStore = true, VaryByParam = "*", Duration = 0)]
    public class CarritoController : Controller
    {
        CarritoModel modelo = new CarritoModel();

       

        [HttpPost]
        public ActionResult AgregarCarrito(long idProducto, int cantProducto)
        {
            Carrito entidad = new Carrito();
            entidad.ConsecutivoUsuario = long.Parse(Session["Consecutivo"].ToString());
            entidad.Consecutivo = idProducto;
            entidad.Cantidad = cantProducto;

            var respuesta = modelo.AgregarCarrito(entidad);

            if (respuesta.Codigo == 0)
            {
                ActualizarVariablesCarrito();
                return Json("OK", JsonRequestBehavior.AllowGet);
            }
            else
            {
                return Json(respuesta.Detalle, JsonRequestBehavior.AllowGet);
            }
        }

        [HttpGet]
        public ActionResult ConsultaCarrito()
        {
            var respuesta = modelo.ConsultarCarrito(long.Parse(Session["Consecutivo"].ToString()));

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

        [HttpPost]
        public ActionResult EliminarCarrito(Carrito entidad)
        {
            var respuesta = modelo.EliminarCarrito(entidad.ConsecutivoCarrito);

            if (respuesta.Codigo == 0)
            {
                ActualizarVariablesCarrito();
                return RedirectToAction("ConsultaCarrito", "Carrito");
            }
            else
            {
                ViewBag.MsjPantalla = respuesta.Detalle;
                return View();
            }
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
            var datos = modelo.ConsultarCarrito(long.Parse(Session["Consecutivo"].ToString()));

            if (datos.Codigo == 0)
            {
                Session["Cantidad"] = datos.Datos.AsEnumerable().Sum(x => x.Cantidad);
                Session["SubTotal"] = datos.Datos.AsEnumerable().Sum(x => x.SubTotal);
                Session["Total"] = datos.Datos.AsEnumerable().Sum(x => x.Total);
            }
            else
            {
                Session["Cantidad"] = 0;
                Session["SubTotal"] = 0;
                Session["Total"] = 0;
            }
        }
        [HttpGet]
        public ActionResult ConsultarPedidos()
        {
            var respuesta = modelo.ConsultarPedidos();

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

    }
}