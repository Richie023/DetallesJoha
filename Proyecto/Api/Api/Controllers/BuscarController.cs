using Api.Entidades;
using Api.Models;
using System;
using System.Linq;
using System.Web.Http;
using System.Collections.Generic;

namespace Api.Controllers
{
    public class BuscarController : ApiController
    {
        [HttpGet]
        [Route("Buscar/ConsultarProductos")]
        public ConfirmacionBuscar ConsultarProductos(string nombre = null)
        {
            var respuesta = new ConfirmacionBuscar();

            try
            {
                using (var db = new DetallesJohaEntities())
                {
                    var datos = db.BuscarProductos(nombre).ToList();

                    if (datos.Count > 0)
                    {
                        respuesta.Codigo = 0;
                        respuesta.Detalle = string.Empty;
                        respuesta.Datos = datos;
                    }
                    else
                    {
                        respuesta.Codigo = -1;
                        respuesta.Detalle = "No se encontraron productos o categorías relacionadas.";
                    }
                }
            }
            catch (Exception)
            {
                respuesta.Codigo = -1;
                respuesta.Detalle = "Se presentó un error en el sistema.";
            }

            return respuesta;
        }
    }
}
