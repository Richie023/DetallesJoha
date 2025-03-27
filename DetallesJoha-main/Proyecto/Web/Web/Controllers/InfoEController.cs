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
    public class InfoEController : Controller
    {
        InforEModel modelo = new InforEModel();
        // GET: InfoE

        [HttpGet]
        public ActionResult RegistraInforE()
        {
            return View();
        }

        [HttpPost]
        public ActionResult RegistraInforE(InforE entidad)
        {

            var respuesta = modelo.AgregarInfoE(entidad);

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
        }
    } 
    
