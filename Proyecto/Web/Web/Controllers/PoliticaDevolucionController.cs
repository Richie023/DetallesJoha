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
    
    
    [OutputCache(NoStore = true, VaryByParam = "*", Duration = 0)]
    public class PoliticaDevolucionController : Controller
    {

        PoliticaDevolucionModel modelo = new PoliticaDevolucionModel();

        [HttpGet]
        public ActionResult PoliticaDevolucion()
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
        public ActionResult PoliticaDevolucionPorId(int id)
        {
            var resultado = modelo.ConsultarPorId(id);

            if (resultado == null || resultado.Dato == null)
            {
                return HttpNotFound();
            }

            return View(resultado.Dato);
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

                if (respuesta != null && respuesta.Codigo == 0)
                {
                    return RedirectToAction("PoliticaDevolucion", "PoliticaDevolucion");
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

        
        [HttpGet]
        public ActionResult Editar(int id)
        {
            var resp = modelo.ConsultarPorId(id);
            return View(resp.Dato);
        }


        [HttpPost]
        public ActionResult Editar(PoliticaDevolucion entidad)
        {
            if (entidad == null)
            {
                ViewBag.MsjPantalla = "Datos inválidos.";
                return View();
            }

            try
            {
                var respuesta = modelo.Actualizar(entidad);

                if (respuesta != null && respuesta.Codigo == 0)
                {
                    return RedirectToAction("PoliticaDevolucion", "PoliticaDevolucion");
                }
                else
                {
                    ViewBag.MsjPantalla = respuesta.Detalle;
                    return View(entidad);
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

            if (respuesta != null && respuesta.Codigo == 0)
            {
                return RedirectToAction("PoliticaDevolucin", "PoliticaDevolucin");
            }
            else
            {
                ViewBag.MsjPantalla = respuesta.Detalle;
                return View();
            }
        }

    }
}