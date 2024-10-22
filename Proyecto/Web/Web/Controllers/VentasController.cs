using System.Collections.Generic;
using System.Reflection;
using System.Web.Mvc;
using Web.Entidades;
using Web.Models;

namespace Web.Controllers
{
    [FiltroSeguridad]
    [FiltroAdmin]
    [OutputCache(NoStore = true, VaryByParam = "*", Duration = 0)]
    public class VentasController : Controller
    {
        VentasModel model = new VentasModel();

        [HttpGet]
        public ActionResult ConsultaVentas()
        {
            var Ventas = model.ConsultarVentas();
            var VentasUsuario = model.ConsultarVentasUsuario();

            ViewBag.Mes = Ventas.Dato.Mes;
            ViewBag.TotalMes = Ventas.Dato.TotalMes.ToString("N2");

            ViewBag.NombreUsuario = VentasUsuario.Dato.NombreUsuario;
            ViewBag.TotalUsuario = VentasUsuario.Dato.TotalUsuario.ToString("N2");

            return View();
        }

        [HttpPost]
        public ActionResult GetChartData()
        {
            var data = model.ConsultarVentasMensuales();
            return Json(data.Datos, @"application/json");
        }

     
    }
}