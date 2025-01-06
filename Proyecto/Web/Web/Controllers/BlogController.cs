using System;
using System.Collections.Generic;
using System.IO;
using System.Web;
using System.Web.Mvc;
using Web.Entidades;
using Web.Models;

namespace Web.Controllers
{
    
         
    [OutputCache(NoStore = true, VaryByParam = "*", Duration = 0)]
    public class BlogController : Controller
    {
        BlogModel modelo = new BlogModel();

        

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
        public ActionResult VerBlog(int id)
        {
            var resultado = modelo.ConsultarBlogPorId(id);

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
        public ActionResult Insertar(HttpPostedFileBase ImagenBlog, BlogArticulo entidad)
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
                    if (ImagenBlog != null)
                    {
                        string extension = Path.GetExtension(Path.GetFileName(ImagenBlog.FileName));
                        string ruta = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "Imagenes", respuesta.ConsecutivoGeneradoAB + extension);
                        ImagenBlog.SaveAs(ruta);

                        entidad.id = respuesta.ConsecutivoGeneradoAB;
                        entidad.imagen_url = "/Imagenes/" + respuesta.ConsecutivoGeneradoAB + extension;
                        modelo.ActualizarImagenBlog(entidad);
                    }

                    return RedirectToAction("Blog", "Blog");
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
            var resp = modelo.ConsultarBlogPorId(id);

            ViewBag.imagen_url = resp?.Dato.imagen_url;
            return View(resp?.Dato);
        }


        
        [HttpPost]
        public ActionResult Editar(HttpPostedFileBase ImagenBlog, BlogArticulo entidad)
        {
            if (entidad == null)
            {
                ViewBag.MsjPantalla = "Datos inválidos.";
                return View(entidad);
            }

            try
            {
                 var respuesta = modelo.Actualizar(entidad);

                if (respuesta != null && respuesta.Codigo == 0)
                {
                    if (ImagenBlog != null)
                    {
                        if (!string.IsNullOrEmpty(entidad.imagen_url))
                        {
                            string rutaAnterior = AppDomain.CurrentDomain.BaseDirectory + entidad.imagen_url.Replace("/", "\\");
                            if (System.IO.File.Exists(rutaAnterior))
                            {
                                System.IO.File.Delete(rutaAnterior);
                            }
                        }


                        string extension = Path.GetExtension(Path.GetFileName(ImagenBlog.FileName));
                        string ruta = AppDomain.CurrentDomain.BaseDirectory + "Imagenes\\" + entidad.id + extension;
                        ImagenBlog.SaveAs(ruta);
                         
                        entidad.imagen_url = "/Imagenes/" + entidad.id +   extension;
                        modelo.ActualizarImagenBlog(entidad);
                    }

                    return RedirectToAction("Blog", "Blog");
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

                if (respuesta != null && respuesta.Codigo == 0)
                {
                    return RedirectToAction("Blog", "Blog");
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

            return RedirectToAction("Blog", "Blog");
        }



    }
}
