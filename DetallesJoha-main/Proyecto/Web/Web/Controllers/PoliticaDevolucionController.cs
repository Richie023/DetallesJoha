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
                // 1) Separamos el contenido en líneas (por saltos de línea)
                var lineas = (entidad.contenido ?? "")
                    .Split(new[] { "\r\n", "\n" }, StringSplitOptions.RemoveEmptyEntries);

                // 2) Construimos un <ul> con <li> por cada línea
                var sb = new System.Text.StringBuilder();
                sb.Append("<ul>");
                foreach (var linea in lineas)
                {
                    // Codificamos la línea para evitar inyección de HTML
                    var lineaCodificada = System.Web.HttpUtility.HtmlEncode(linea.Trim());
                    sb.AppendFormat("<li>{0}</li>", lineaCodificada);
                }
                sb.Append("</ul>");

                // 3) Sobrescribimos la propiedad 'contenido' con el HTML resultante
                entidad.contenido = sb.ToString();

                // 4) Guardamos la entidad en la base de datos
                var respuesta = modelo.Insertar(entidad);

                if (respuesta != null && respuesta.Codigo == 0)
                {
                    // Si se guardó correctamente, redirigimos al listado
                    return RedirectToAction("PoliticaDevolucion", "PoliticaDevolucion");
                }
                else
                {
                    // Si hubo algún problema, mostramos el mensaje de detalle
                    ViewBag.MsjPantalla = respuesta?.Detalle ?? "Ocurrió un error desconocido.";
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

            if (resp?.Dato != null)
            {
                // Convertimos el HTML de vuelta a texto plano para el textarea
                var contenidoOriginal = resp.Dato.contenido;

                // Remover las etiquetas <ul>, <li> y convertirlas en texto por línea
                var textoPlano = System.Text.RegularExpressions.Regex.Replace(contenidoOriginal ?? "", @"</?ul>|</?li>", "");
                textoPlano = textoPlano.Replace("</li>", "\n").Trim();

                resp.Dato.contenido = textoPlano;
            }

            return View(resp?.Dato);
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
                // Convertimos el contenido en HTML (igual que en Insertar)
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

                var respuesta = modelo.Actualizar(entidad);

                if (respuesta != null && respuesta.Codigo == 0)
                {
                    return RedirectToAction("PoliticaDevolucion", "PoliticaDevolucion");
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