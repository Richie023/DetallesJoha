using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Web.Entidades;
using Web.Models;

namespace Web.Controllers
{
  
  
    [OutputCache(NoStore = true, VaryByParam = "*", Duration = 0)]
    public class AvisoPrivacidadController : Controller
    {
        AvisoPrivacidadModel modelo = new AvisoPrivacidadModel();


        [HttpGet]
        public ActionResult AvisoPrivacidad()
        {
            var respuesta = modelo.ColsultarAvisoPrivacidad();

            if (respuesta != null && respuesta.Codigo == 0)
            {
                return View(respuesta.Datos);
            }
            else
            {
                ViewBag.MsjPantalla = respuesta?.Detalle ?? "No se pudieron cargar los datos del aviso de privacidad.";
                return View(new List<AvisoPrivacidad>());
            }
        }


        [HttpGet]
        public ActionResult AvisoPrivacidadPorId(int id)
        {
            var resultado = modelo.ConsultarAviso(id);

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
        public ActionResult Insertar(AvisoPrivacidad entidad)
        {
            if (entidad == null)
            {
                ViewBag.MsjPantalla = "Datos inválidos.";
                return View();
            }

            try
            {
                // Convertir contenido en HTML con <ul><li>
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

                var respuesta = modelo.InsertarAvisoPrivacidad(entidad);

                if (respuesta?.Codigo == 0)
                {
                    return RedirectToAction("AvisoPrivacidad", "AvisoPrivacidad");
                }
                else
                {
                    ViewBag.MsjPantalla = respuesta?.Detalle ?? "Ocurrió un error al guardar el aviso.";
                }
            }
            catch (Exception ex)
            {
                ViewBag.MsjPantalla = $"Error al insertar: {ex.Message}";
            }

            return View(entidad);
        }


        [HttpGet]
        public ActionResult Editar(int id)
        {
            var resp = modelo.ConsultarAviso(id);

            if (resp?.Dato != null)
            {
                // Convertir el contenido HTML a texto plano para mostrarlo en el textarea
                var contenidoOriginal = resp.Dato.contenido;

                // 1. Eliminar etiquetas HTML y dejar solo el texto
                var textoPlano = System.Text.RegularExpressions.Regex.Replace(contenidoOriginal ?? "", @"</?ul>|</?li>", "");
                textoPlano = textoPlano.Replace("</li>", "\n").Trim();

                resp.Dato.contenido = textoPlano;

                return View(resp.Dato);
            }

            ViewBag.MsjPantalla = "No se encontró el aviso de privacidad solicitado.";
            return RedirectToAction("AvisoPrivacidad");
        }

        [HttpPost]
        public ActionResult Editar(AvisoPrivacidad entidad)
        {
            if (entidad == null)
            {
                ViewBag.MsjPantalla = "Datos inválidos.";
                return View(entidad);
            }

            try
            {
                // Igual que en Insertar: convertir texto en HTML con <ul><li>
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

                var respuesta = modelo.ActualizarAvisoPrivacidad(entidad);

                if (respuesta?.Codigo == 0)
                {
                    return RedirectToAction("AvisoPrivacidad", "AvisoPrivacidad");
                }
                else
                {
                    ViewBag.MsjPantalla = respuesta?.Detalle ?? "Ocurrió un error al actualizar.";
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
            try
            {
                var respuesta = modelo.EliminarAvisoPrivacidad(id);

                if (respuesta != null && respuesta.Codigo == 0)
                {
                    return RedirectToAction("AvisoPrivacidad", "AvisoPrivacidad");
                }
                else
                {
                    ViewBag.MsjPantalla = respuesta.Detalle;
                }
            }
            catch (Exception ex)
            {
                ViewBag.MsjPantalla = $"Error al eliminar: {ex.Message}";
            }

            return RedirectToAction("AvisoPrivacidad");
        }
    }
}