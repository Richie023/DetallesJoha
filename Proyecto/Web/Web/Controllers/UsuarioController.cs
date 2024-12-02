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
            CargarViewBagRoles();
            return View(resp.Dato);
        }

        [HttpGet]
        public ActionResult ActualizaUsuario(long id)
        {
            var resp = modelo.ConsultaUsuario(id);
            CargarViewBagRoles();
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
        }   [HttpPost]
        public ActionResult ActualizaUsuario(Usuario entidad)
        {
            var respuesta = modelo.ActualizaUsuario(entidad);

            if (respuesta.Codigo == 0)
            {
              
                return RedirectToAction("ActualizaUsuario", "Usuario");
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

        private void CargarViewBagRoles()
        {
            var respuesta = modelo.ConsultarRoles();
            var roles = new List<SelectListItem>();

            roles.Add(new SelectListItem { Text = "Seleccione un Rol", Value = "" });
            foreach (var item in respuesta.Datos)
                roles.Add(new SelectListItem { Text = item.NombreRol, Value = item.ConsecutivoRol.ToString() });

            ViewBag.Roles = roles;
        }


    }
}