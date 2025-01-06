using System;
using System.Collections.Generic;
using System.Dynamic;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.Mvc;
using Web.Entidades;
using Web.Models;

namespace Web.Controllers
{
    public class ResenaController : Controller
    {
        // GET: Resena

        ResenaModel modelo = new ResenaModel();
        ConsultaModel consulta = new ConsultaModel();






        [HttpGet]
        public ActionResult RegistrarResena()
        {


            return View();

        }

        [HttpPost]
        public ActionResult RegistrarResena(Resena entidad)
        {

            //Resena entidad = new Resena();
            entidad.ConsecutivoUsuario = int.Parse(Session["Consecutivo"].ToString());

            var respuesta = modelo.AgregarResena(entidad);

            if (respuesta.Codigo == 0)
            {
                return RedirectToAction("PantallaPrincipal", "Inicio");
            }
            else
            {
                ViewBag.MsjPantalla = respuesta.Detalle;
                return View();
            }
        }




        [HttpGet]
        public ActionResult ConsultarResenas()
        {

            var respuesta = consulta.ConsultarConsultas();

            if (respuesta.Codigo == 0)
                return View(respuesta.Datos);
            else
            {
                ViewBag.MsjPantalla = respuesta.Detalle;
                return View(new List<Consulta>());
            }
        }
    }
}