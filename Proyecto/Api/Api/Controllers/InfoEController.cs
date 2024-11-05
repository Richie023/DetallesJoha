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
    public class InfoEController : ApiController
    {

        [HttpPost]

        [Route("InfoE/AgregarInfoE")]

        public Confirmacion AgregarInfoE(InfoE entidad)

        {

            var respuesta = new Confirmacion();

            try

            {

                using (var db = new DetallesJohaEntities())

                {

                    var resp = db.RegistrarInformacionEmpresa(entidad.Telefono, entidad.CorreoElectronico, entidad.Direccion, entidad.AcercaDeNosotros, entidad.Politicas, entidad.Contactanos, entidad.NombreEmpresa, entidad.TerminosCondiciones, entidad.OrdenesDevoluciones);

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

    }

}