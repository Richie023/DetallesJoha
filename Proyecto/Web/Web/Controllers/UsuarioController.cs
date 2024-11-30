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
    [OutputCache(NoStore = true, VaryByParam = "*", Duration = 0)]
    public class UsuarioController : Controller
    {
        UsuarioModel modelo = new UsuarioModel();

        [HttpGet]
        public ActionResult ActualizarUsuario()
        {
            var resp = modelo.ConsultarUsuario();
            return View(resp.Dato);
        }

        [HttpPost]
        public ActionResult ActualizarUsuario(Usuario entidad)
        {
            var respuesta = modelo.ActualizarUsuario(entidad);

            if (respuesta.Codigo == 0)
            {
                Session["NombreUsuario"] = entidad.Nombre;
                return RedirectToAction("ActualizarUsuario", "Usuario");
            }
            else
            {
                ViewBag.MsjPantalla = respuesta.Detalle;
                return View();
            }
        }

        [HttpGet]
        public ActionResult ConsultarUsuarios()
        {
            var resp = modelo.ConsultaUsuarios();
            return View(resp.Datos);
        }

        [HttpGet]
        public ActionResult InactivaUsuario(long id)
        {
            var respuesta = modelo.InactivaUsuario(id);

            if (respuesta.Codigo == 0)
            {
                return RedirectToAction("ConsultarUsuarios", "Usuario");
            }
            else
            {
                ViewBag.MsjPantalla = respuesta.Detalle;
                return View();
            }
        }

    }
}