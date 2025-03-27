using Api.Models;
using Api.Entidades;
using System;
using System.Linq;
using System.Web.Http;


namespace Api.Controllers
{
    public class VentasController : ApiController
    {
        [HttpGet]
        [Route("Ventas/ConsultarVentas")]
        public ConfirmacionVentas ConsultarVentas()
        {
            var respuesta = new ConfirmacionVentas();

            try
            {
                using (var db = new DetallesJohaEntities())
                {
                    var datos = db.ConsultarVentas().FirstOrDefault();

                    if (datos != null)
                    {
                        respuesta.Codigo = 0;
                        respuesta.Detalle = string.Empty;
                        respuesta.Dato = datos;
                    }
                    else
                    {
                        respuesta.Codigo = -1;
                        respuesta.Detalle = "No se encontraron resultados";
                    }
                }
            }
            catch (Exception)
            {
                respuesta.Codigo = -1;
                respuesta.Detalle = "Se presentó un error en el sistema";
            }

            return respuesta;
        }

        [HttpGet]
        [Route("Ventas/ConsultarVentasUsuario")]
        public ConfirmacionVentas ConsultarVentasUsuario()
        {
            var respuesta = new ConfirmacionVentas();

            try
            {
                using (var db = new DetallesJohaEntities())
                {
                    var datos = db.ConsultarVentasUsuario().FirstOrDefault();

                    if (datos != null)
                    {
                        respuesta.Codigo = 0;
                        respuesta.Detalle = string.Empty;
                        respuesta.Dato = datos;
                    }
                    else
                    {
                        respuesta.Codigo = -1;
                        respuesta.Detalle = "No se encontraron resultados";
                    }
                }
            }
            catch (Exception)
            {
                respuesta.Codigo = -1;
                respuesta.Detalle = "Se presentó un error en el sistema";
            }

            return respuesta;
        }

        [HttpGet]
        [Route("Ventas/ConsultarVentasMensuales")]
        public ConfirmacionVentas ConsultarVentasMensuales()
        {
            var respuesta = new ConfirmacionVentas();

            try
            {
                using (var db = new DetallesJohaEntities())
                {
                    var datos = db.ConsultarVentasMensuales().ToList();

                    if (datos.Count > 0)
                    {
                        respuesta.Codigo = 0;
                        respuesta.Detalle = string.Empty;
                        respuesta.Datos = datos;
                    }
                    else
                    {
                        respuesta.Codigo = -1;
                        respuesta.Detalle = "No se encontraron resultados";
                    }
                }
            }
            catch (Exception)
            {
                respuesta.Codigo = -1;
                respuesta.Detalle = "Se presentó un error en el sistema";
            }

            return respuesta;
        }

    }
}