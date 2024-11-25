using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Web.Entidades;
using Web.Models;

namespace Web.Controllers
{
    [FiltroSeguridad]
    [FiltroAdmin]
    [OutputCache(NoStore = true, VaryByParam = "*", Duration = 0)]
    public class AyudaController : Controller
    {

        AyudaModel ayudaModel = new AyudaModel();

        public ActionResult ConsultarAyuda()
        {
            var respuesta = ayudaModel.ConsultarAyuda();
            return View(respuesta);
        }

        [HttpPost]
        public ActionResult InsertarAyuda(Ayuda ayuda)
        {
            var respuesta = ayudaModel.InsertarAyuda(ayuda);
            return Json(respuesta);
        }

        [HttpPost]
        public ActionResult ActualizarAyuda(Ayuda ayuda)
        {
            var respuesta = ayudaModel.ActualizarAyuda(ayuda);
            return Json(respuesta);
        }

        [HttpPost]
        public ActionResult EliminarAyuda(int id)
        {
            var respuesta = ayudaModel.EliminarAyuda(id);
            return Json(respuesta);
        }

    }
}