using System;
using System.Collections.Generic;
using System.Web.Mvc;
using Web.Entidades;
using Web.Models;

namespace Web.Controllers
{
    [FiltroSeguridad] 
    [FiltroAdmin]     
    [OutputCache(NoStore = true, VaryByParam = "*", Duration = 0)]
    public class BlogController : Controller
    {
        BlogModel modelo = new BlogModel();

        // Acción para mostrar la lista de artículos del blog
        [HttpGet]
        public ActionResult Blog()
        {
            var respuesta = modelo.ConsultarTodos();

            if (respuesta != null && respuesta.Codigo == 0)
            {
                return View(respuesta.Datos); 
            }
            else
            {
                ViewBag.MsjPantalla = respuesta?.Detalle ?? "Error al cargar los artículos del blog.";
                return View(new List<BlogArticulo>());
            }
        }

        
        [HttpGet]
        public ActionResult Insertar()
        {
            ViewBag.Title = "Agregar Nuevo Artículo";
            return View();
        }

        [HttpPost]
        public ActionResult Insertar(BlogArticulo entidad)
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
                    return RedirectToAction("Blog");
                }
                else
                {
                    ViewBag.MsjPantalla = respuesta.Detalle;
                }
            }
            catch (Exception ex)
            {
                ViewBag.MsjPantalla = $"Error al insertar el artículo: {ex.Message}";
            }

            return View(entidad);
        }

        
        [HttpGet]
        public ActionResult Editar(int id)
        {
            var respuesta = modelo.ConsultarTodos(); 
            var articulo = respuesta?.Datos?.Find(a => a.Id == id);

            if (articulo != null)
            {
                return View(articulo);
            }
            else
            {
                ViewBag.MsjPantalla = "Artículo no encontrado.";
                return RedirectToAction("Blog");
            }
        }

       
        [HttpPost]
        public ActionResult Editar(BlogArticulo entidad)
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
                    return RedirectToAction("Blog");
                }
                else
                {
                    ViewBag.MsjPantalla = respuesta.Detalle;
                }
            }
            catch (Exception ex)
            {
                ViewBag.MsjPantalla = $"Error al actualizar el artículo: {ex.Message}";
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
                    return RedirectToAction("Blog");
                }
                else
                {
                    ViewBag.MsjPantalla = respuesta.Detalle;
                }
            }
            catch (Exception ex)
            {
                ViewBag.MsjPantalla = $"Error al eliminar el artículo: {ex.Message}";
            }

            return RedirectToAction("Blog");
        }
    }
}
