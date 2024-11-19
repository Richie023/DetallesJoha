using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Web.Controllers
{
    public class InformacionController : Controller
    {
        // GET: Informacion
        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public ActionResult blog()
        {
            return View();
        }

        [HttpGet]
        public ActionResult PoliticaDevolucion()
        {
            return View();
        }

        [HttpGet]
        public ActionResult AvisoPrivacidad()
        {
            return View();
        }

        [HttpGet]
        public ActionResult PreguntasFrecuentes()
        {
            return View();
        }

        [HttpGet]
        public ActionResult Ayuda()
        {
            return View();
        }


    }
}