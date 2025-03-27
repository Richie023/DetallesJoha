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
    public class CategoriaController : ApiController
    {
        [HttpPost]
        [Route("Categoria/RegistrarCategoria")]
        public Confirmacion RegistrarCategoria(TiposCategoria entidad)
        {


            var respuesta = new Confirmacion();

            try
            {
                using (var db = new DetallesJohaEntities())
                {



                    var resp = db.RegistrarCategoria(entidad.NombreCategoria);



                    if (resp > 0)
                    {
                        respuesta.Codigo = 0;
                        respuesta.Detalle = string.Empty;

                    }
                    else
                    {
                        respuesta.Codigo = -1;
                        respuesta.Detalle = "Su información ya se encuentra registrada";
                    }
                }
            }
            catch (Exception ex)
            {
                respuesta.Codigo = -1;
                respuesta.Detalle = "Se presentó un error en el sistema: " + ex.Message;
            }

            return respuesta;
        }

    }
}
