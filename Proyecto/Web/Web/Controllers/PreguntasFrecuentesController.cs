using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using Web.Entidades;
using Web.Models;

namespace Web.Controllers
{
    [FiltroSeguridad] 
    [FiltroAdmin]     
    [OutputCache(NoStore = true, VaryByParam = "*", Duration = 0)]
    public class PreguntasFrecuentesController : Controller
    {
        PreguntasFrecuentesModel modelo = new PreguntasFrecuentesModel();

        
        [HttpGet]
        public ActionResult PreguntasFrecuentes()
        {
            var respuesta = modelo.ConsultarTodos();

            if (respuesta != null && respuesta.Codigo == 0)
            {
                return View(respuesta.Datos);
            }
            else
            {
                ViewBag.MsjPantalla = respuesta?.Detalle ?? "No se pudieron cargar las preguntas frecuentes.";
                return View(new List<PreguntasFrecuentes>());
            }
        }

        
        [HttpGet]
        public ActionResult Insertar()
        {
            ViewBag.Title = "Agregar Nueva Pregunta Frecuente";
            return View();
        }

        
        [HttpPost]
        public ActionResult Insertar(PreguntasFrecuentes entidad)
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
                    return RedirectToAction("PreguntasFrecuentes");
                }
                else
                {
                    ViewBag.MsjPantalla = respuesta.Detalle;
                }
            }
            catch (Exception ex)
            {
                ViewBag.MsjPantalla = $"Error al insertar la pregunta frecuente: {ex.Message}";
            }

            return View(entidad);
        }

        // Mostrar la vista para editar una pregunta frecuente existente
        [HttpGet]
        public ActionResult Editar(int id)
        {
            return View();
        }

            // Procesar la actualización de una pregunta frecuente existente
            [HttpPost]
        public ActionResult Editar(PreguntasFrecuentes entidad)
        {
            if (entidad == null)
            {
                ViewBag.MsjPantalla = "Datos inválidos.";
                return View(entidad);
            }

            try
            {
                var respuesta = modelo.Actualizar(entidad);

                if (respuesta.Codigo == 0)
                {
                    return RedirectToAction("PreguntasFrecuentes");
                }
                else
                {
                    ViewBag.MsjPantalla = respuesta.Detalle;
                }
            }
            catch (Exception ex)
            {
                ViewBag.MsjPantalla = $"Error al actualizar la pregunta frecuente: {ex.Message}";
            }

            return View(entidad);
        }

        

        [HttpGet]
        public ActionResult Eliminar(int id)
        {
            try
            {
                var respuesta = modelo.Eliminar(id);

                if (respuesta.Codigo == 0)
                {
                    return RedirectToAction("VerPreguntasFrecuentes");
                }
                else
                {
                    ViewBag.MsjPantalla = respuesta.Detalle;
                }
            }
            catch (Exception ex)
            {
                ViewBag.MsjPantalla = $"Error al eliminar la pregunta frecuente: {ex.Message}";
            }

            return RedirectToAction("VerPreguntasFrecuentes");
        }
    }
}
