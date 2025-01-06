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
    public class CategoriaController : Controller
    {
        CategoriaModel modelo = new CategoriaModel();

        // GET: Categoria
        [HttpGet]
        public ActionResult RegistrarCategoria()
        {
            return View();
        }


        [HttpPost]
        public ActionResult RegistrarCategoria(TiposCategoria entidad)
        {
            var respuesta = modelo.RegistrarCategoria(entidad);

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
    }
}