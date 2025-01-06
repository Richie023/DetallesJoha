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
            var respuesta = modelo.InsertarAyuda(entidad);

            if (respuesta != null && respuesta.Codigo == 0)

            {

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
                return View();
            }
        }

       
        [HttpGet]
        public ActionResult Editar(int id)
        {
            var resp = modelo.ConsultarAyudaPorId(id);

            ViewBag.imagen_url = resp?.Dato.imagen_url;
            return View(resp?.Dato);
        }


        [HttpPost]
        public ActionResult Editar(HttpPostedFileBase ImagenAyuda, Ayuda entidad)
        {
            var respuesta = modelo.ActualizarAyuda(entidad);

            if (respuesta != null && respuesta.Codigo == 0)
            {
                if (ImagenAyuda != null)
                {
                    // Eliminar la imagen anterior si existe
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
                return View(entidad);
            }
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