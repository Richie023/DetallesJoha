using Api.Entidades;
using Api.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace Api.Controllers
{
    public class ResenaController : ApiController
    {
        [HttpPost]

        [Route("Resena/AgregarResena")]

        public Confirmacion AgregarResena(Resena entidad)

        {

            var respuesta = new Confirmacion();

            try

            {

                using (var db = new DetallesJohaEntities())

                {

                    var resp = db.RegistrarResenna(entidad.ConsecutivoUsuario, entidad.Calificacion, entidad.Comentario);

                    if (resp > 0)

                    {

                        respuesta.Codigo = 0;

                        respuesta.Detalle = string.Empty;

                    }

                    else

                    {

                        respuesta.Codigo = -1;

                        respuesta.Detalle = "La informacion no se pudo agregar";

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
        [Route("Consulta/ConsultarResenas")]
        public ConfirmacionConsulta ConsultarResenas()
        {
            var respuesta = new ConfirmacionConsulta();

            try
            {
                using (var db = new DetallesJohaEntities())
                {
                    var datos = db.ConsultarResennas().ToList();

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

