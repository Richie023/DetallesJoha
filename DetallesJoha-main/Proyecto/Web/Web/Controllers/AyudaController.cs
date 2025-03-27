using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.Mvc;
using Web.Entidades;
using Web.Models;

namespace Web.Controllers
{

    [OutputCache(NoStore = true, VaryByParam = "*", Duration = 0)]
    public class AyudaController : Controller
    {

        AyudaModel modelo = new AyudaModel();


        [HttpGet]
        public ActionResult Ayuda()
        {
            var respuesta = modelo.ConsultarAyuda();

            if (respuesta != null && respuesta.Codigo == 0)
                return View(respuesta.Datos);
            else
            {
                ViewBag.MsjPantalla = respuesta?.Detalle ?? "Error al obtener las ayudas.";
                return View(new List<Ayuda>());
            }
        }

        [HttpGet]
        public ActionResult AyudaPorId(int id)
        {
            var resultado = modelo.ConsultarAyudaPorId(id);

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
        public ActionResult Insertar(HttpPostedFileBase ImagenAyuda, Ayuda entidad)
        {
            try
            {
                // 1. Convertimos el contenido en viñetas HTML
                var lineas = (entidad.contenido ?? "")
                    .Split(new[] { "\r\n", "\n" }, StringSplitOptions.RemoveEmptyEntries);

                var sb = new System.Text.StringBuilder();
                sb.Append("<ul>");
                foreach (var linea in lineas)
                {
                    var lineaCodificada = System.Web.HttpUtility.HtmlEncode(linea.Trim());
                    sb.AppendFormat("<li>{0}</li>", lineaCodificada);
                }
                sb.Append("</ul>");

                entidad.contenido = sb.ToString();

                // 2. Guardamos la ayuda
                var respuesta = modelo.InsertarAyuda(entidad);

                if (respuesta != null && respuesta.Codigo == 0)
                {
                    // 3. Si se subió una imagen
                    if (ImagenAyuda != null && !string.IsNullOrEmpty(ImagenAyuda.FileName))
                    {
                        string extension = Path.GetExtension(Path.GetFileName(ImagenAyuda.FileName));
                        string ruta = AppDomain.CurrentDomain.BaseDirectory + "Imagenes\\" + respuesta.ConsecutivoGeneradoAB + extension;
                        ImagenAyuda.SaveAs(ruta);

                        entidad.id = respuesta.ConsecutivoGeneradoAB;
                        entidad.imagen_url = "/Imagenes/" + respuesta.ConsecutivoGeneradoAB + extension;
                        modelo.ActualizarImagenAyuda(entidad);
                    }

                    return RedirectToAction("Ayuda", "Ayuda");
                }
                else
                {
                    ViewBag.MsjPantalla = respuesta?.Detalle ?? "Error al registrar la ayuda.";
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
            var resp = modelo.ConsultarAyudaPorId(id);

            if (resp?.Dato != null)
            {
                // Convertimos el contenido HTML de vuelta a texto plano para mostrarlo en el textarea
                var contenidoOriginal = resp.Dato.contenido;
                var textoPlano = System.Text.RegularExpressions.Regex.Replace(contenidoOriginal ?? "", @"</?ul>|</?li>", "");
                textoPlano = textoPlano.Replace("</li>", "\n").Trim();

                resp.Dato.contenido = textoPlano;

                ViewBag.imagen_url = resp.Dato.imagen_url;
                return View(resp.Dato);
            }

            ViewBag.MsjPantalla = "No se encontró la ayuda solicitada.";
            return RedirectToAction("Ayuda");
        }

        [HttpPost]
        public ActionResult Editar(HttpPostedFileBase ImagenAyuda, Ayuda entidad)
        {
            try
            {
                // 1. Convertir el contenido en HTML con viñetas
                var lineas = (entidad.contenido ?? "")
                    .Split(new[] { "\r\n", "\n" }, StringSplitOptions.RemoveEmptyEntries);

                var sb = new System.Text.StringBuilder();
                sb.Append("<ul>");
                foreach (var linea in lineas)
                {
                    var lineaCodificada = System.Web.HttpUtility.HtmlEncode(linea.Trim());
                    sb.AppendFormat("<li>{0}</li>", lineaCodificada);
                }
                sb.Append("</ul>");

                entidad.contenido = sb.ToString();

                // 2. Actualizar en BD
                var respuesta = modelo.ActualizarAyuda(entidad);

                if (respuesta != null && respuesta.Codigo == 0)
                {
                    // 3. Si hay imagen nueva
                    if (ImagenAyuda != null)
                    {
                        // Borrar anterior si existe
                        if (!string.IsNullOrEmpty(entidad.imagen_url))
                        {
                            string rutaAnterior = AppDomain.CurrentDomain.BaseDirectory + entidad.imagen_url.Replace("/", "\\");
                            if (System.IO.File.Exists(rutaAnterior))
                            {
                                System.IO.File.Delete(rutaAnterior);
                            }
                        }

                        string extension = Path.GetExtension(Path.GetFileName(ImagenAyuda.FileName));
                        string ruta = AppDomain.CurrentDomain.BaseDirectory + "Imagenes\\" + entidad.id + extension;
                        ImagenAyuda.SaveAs(ruta);

                        entidad.imagen_url = "/Imagenes/" + entidad.id + extension;
                        modelo.ActualizarImagenAyuda(entidad);
                    }

                    return RedirectToAction("Ayuda", "Ayuda");
                }
                else
                {
                    ViewBag.MsjPantalla = respuesta?.Detalle ?? "Error al actualizar la ayuda.";
                }
            }
            catch (Exception ex)
            {
                ViewBag.MsjPantalla = $"Error al actualizar: {ex.Message}";
            }

            return View(entidad);
        }





        [HttpGet]
        public ActionResult Eliminar(int id)
        {
            var respuesta = modelo.EliminarAyuda(id);

            if (respuesta != null && respuesta.Codigo == 0)
            {
                return RedirectToAction("Ayuda", "Ayuda");
            }
            else
            {
                ViewBag.MsjPantalla = respuesta?.Detalle ?? "Error al eliminar la ayuda.";
                return View();
            }
        }


    }
}