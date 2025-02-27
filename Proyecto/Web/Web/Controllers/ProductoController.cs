﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Web;
using System.Web.Mvc;
using Web.Entidades;
using Web.Models;

namespace Web.Controllers
{
    //[FiltroSeguridad]
    // [FiltroAdmin]
    [OutputCache(NoStore = true, VaryByParam = "*", Duration = 0)]
    public class ProductoController : Controller
    {
        ProductoModel modelo = new ProductoModel();




        [HttpGet]
        public ActionResult ConsultaProductos()
        {
            var respuesta = modelo.ConsultarProductos(true);

            if (respuesta.Codigo == 0)
                return View(respuesta.Datos);
            else
            {
                ViewBag.MsjPantalla = respuesta.Detalle;
                return View(new List<Producto>());
            }
        }


        [HttpGet]
        public ActionResult VerProducto(long id)
        {
            var resultado = modelo.ConsultarProducto(id);

            if (resultado == null || resultado.Dato == null)
            {
                return HttpNotFound();
            }

            return View(resultado.Dato);
        }


        // Método de acción para filtrar productos por categoría
        public ActionResult FiltrarPorCategoria(int IdCategoria)
        {
            var respuesta = modelo.FiltrarProductosPorCategoria(IdCategoria);

            if (respuesta != null && respuesta.Codigo == 0)
            {
                return View("FiltrarPorCategoria", respuesta.Datos);
            }
            else
            {
                ViewBag.Error = respuesta?.Detalle ?? "Error al obtener los productos";
                return View("Error");
            }
        }
        [FiltroAdmin]
        [HttpGet]
        public ActionResult RegistrarProducto()
        {
            CargarViewBagCategorias();
            return View();
        }
        [FiltroAdmin]
        [HttpPost]
        public ActionResult RegistrarProducto(HttpPostedFileBase Imagenes, Producto entidad)
        {
            var respuesta = modelo.RegistrarProducto(entidad);

            if (respuesta.Codigo == 0)
            {
                string extension = Path.GetExtension(Path.GetFileName(Imagenes.FileName));
                string ruta = AppDomain.CurrentDomain.BaseDirectory + "Imagenes\\" + respuesta.ConsecutivoGenerado + extension;
                Imagenes.SaveAs(ruta);

                entidad.Consecutivo = respuesta.ConsecutivoGenerado;
                entidad.RutaImagen = "/Imagenes/" + respuesta.ConsecutivoGenerado + extension;
                modelo.ActualizarImagenProducto(entidad);

                return RedirectToAction("ConsultaProductos", "Producto");
            }
            else
            {
                CargarViewBagCategorias();
                ViewBag.MsjPantalla = respuesta.Detalle;
                return View();
            }
        }
        [FiltroAdmin]
        [HttpGet]
        public ActionResult ActualizarProducto(long id)
        {
            var resp = modelo.ConsultarProducto(id);
            CargarViewBagCategorias();
            ViewBag.urlImagen = resp.Dato.RutaImagen;
            return View(resp.Dato);
        }
        [FiltroAdmin]
        [HttpPost]
        public ActionResult ActualizarProducto(HttpPostedFileBase ImagenProducto, Producto entidad)
        {
            var respuesta = modelo.ActualizarProducto(entidad);

            if (respuesta.Codigo == 0)
            {
                if (ImagenProducto != null)
                {
                    System.IO.File.Delete(AppDomain.CurrentDomain.BaseDirectory + entidad.RutaImagen);

                    string extension = Path.GetExtension(Path.GetFileName(ImagenProducto.FileName));
                    string ruta = AppDomain.CurrentDomain.BaseDirectory + "Imagenes\\" + entidad.Consecutivo + extension;
                    ImagenProducto.SaveAs(ruta);

                    entidad.RutaImagen = "/Imagenes/" + entidad.Consecutivo + extension;
                    modelo.ActualizarImagenProducto(entidad);
                }

                return RedirectToAction("ConsultaProductos", "Producto");
            }
            else
            {
                CargarViewBagCategorias();
                ViewBag.MsjPantalla = respuesta.Detalle;
                return View();
            }
        }

        [HttpGet]
        public ActionResult EliminarProducto(long id)
        {
            var respuesta = modelo.EliminarProducto(id);

            if (respuesta.Codigo == 0)
            {
                return RedirectToAction("ConsultaProductos", "Producto");
            }
            else
            {
                ViewBag.MsjPantalla = respuesta.Detalle;
                return View();
            }
        }

        private void CargarViewBagCategorias()
        {
            var respuesta = modelo.ConsultarTiposCategoria();
            var tiposCategoria = new List<SelectListItem>();

            tiposCategoria.Add(new SelectListItem { Text = "Seleccione una categoría", Value = "" });
            foreach (var item in respuesta.Datos)
                tiposCategoria.Add(new SelectListItem { Text = item.NombreCategoria, Value = item.IdCategoria.ToString() });

            ViewBag.TiposCategoria = tiposCategoria;
        }

        [HttpGet]
        public ActionResult Disenno(long id) {

            var resp = modelo.ConsultarProducto(id);
          
            ViewBag.urlImagen = resp.Dato.RutaImagen;

            return View(resp.Dato);
        }

        [HttpGet]
        public ActionResult DisenoProducto(long id)
        {
            var resultado = modelo.ConsultarProducto(id);

            if (resultado == null || resultado.Dato == null)
            {
                return HttpNotFound();
            }

            return View(resultado.Dato);
        }



    }
}