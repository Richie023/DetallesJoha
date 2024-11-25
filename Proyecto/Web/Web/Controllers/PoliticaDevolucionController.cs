using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Web.Entidades;
using Web.Models;

namespace Web.Controllers
{
    [FiltroSeguridad]
    [FiltroAdmin]
    [OutputCache(NoStore = true, VaryByParam = "*", Duration = 0)]
    public class PoliticaDevolucionController : Controller
    {

        PoliticaDevolucionModel modelo = new PoliticaDevolucionModel();

        [HttpGet]
        public ActionResult VerPoliticaDevolucion()
        {
            var respuesta = modelo.ConsultarTodos();

            if (respuesta.Codigo == 0)
                return View(respuesta.Datos);
            else
            {
                ViewBag.MsjPantalla = respuesta.Detalle;
                return View(new List<PoliticaDevolucion>());
            }
        }



        [HttpGet]
        public ActionResult Insertar()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Insertar(PoliticaDevolucion entidad)
        {
            if (entidad == null)
            {
                ViewBag.MsjPantalla = "Datos inválidos.";
                return View();
            }

            try
            {
                var respuesta = modelo.Insertar(entidad);

                if (respuesta.Codigo == 0)
                {
                    return RedirectToAction("PoliticaDevolucion", "Informacion");
                }
                else
                {
                    ViewBag.MsjPantalla = respuesta.Detalle;
                }
            }
            catch (Exception ex)
            {
                ViewBag.MsjPantalla = $"Error al insertar: {ex.Message}";
            }

            return View();
        }

        [HttpPost]
        public ActionResult Actualizar(PoliticaDevolucion entidad)
        {
            if (entidad == null)
            {
                ViewBag.MsjPantalla = "Datos inválidos.";
                return View();
            }

            try
            {
                var respuesta = modelo.Actualizar(entidad);

                if (respuesta.Codigo == 0)
                {
                    return RedirectToAction("ConsultaPoliticas", "PoliticaDevolucion");
                }
                else
                {
                    ViewBag.MsjPantalla = respuesta.Detalle;
                }
            }
            catch (Exception ex)
            {
                ViewBag.MsjPantalla = $"Error al actualizar: {ex.Message}";
            }

            return View();
        }




        [HttpGet]
        public ActionResult Eliminar(int id)
        {
            var respuesta = modelo.Eliminar(id);

            if (respuesta.Codigo == 0)
            {
                return RedirectToAction("PoliticaDevolucin", "Informacion");
            }
            else
            {
                ViewBag.MsjPantalla = respuesta.Detalle;
                return View();
            }
        }

    }
}