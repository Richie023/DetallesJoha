using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Web.Entidades;
using Web.Models;

namespace Web.Controllers
{
    public class BuscarController : Controller
    {
        BuscarModel model = new BuscarModel();

        [HttpGet]
        public ActionResult ConsultarProductos(string nombre = null)
        {
            // Llamar al método del modelo que hace la consulta en la API
            var respuesta = model.ConsultarProductos(nombre);

            if (respuesta.Codigo == 0)
            {
                // Si la respuesta es exitosa, se pasan los datos a la vista
                return View(respuesta.Datos);
            }
            else
            {
                // Si no se encuentran productos, mostrar mensaje
                ViewBag.MsjPantalla = respuesta.Detalle;
                return View(new List<Buscar>());
            }
        }
    }
}
