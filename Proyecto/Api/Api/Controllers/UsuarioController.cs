﻿using Api.Models;
using Api.Entidades;
using System;

using System.Linq;

using System.Web.Http;


namespace Api.Controllers
{
    public class UsuarioController : ApiController
    {
        [HttpGet]
        [Route("Usuario/ConsultarUsuario")]
        public ConfirmacionUsuario ConsultarUsuario(long Consecutivo)
        {
            var respuesta = new ConfirmacionUsuario();

            try
            {
                using (var db = new TiendaEntities())
                {
                    var datos = db.ConsultarUsuario(Consecutivo).FirstOrDefault();

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

        [HttpPut]
        [Route("Usuario/ActualizarUsuario")]
        public Confirmacion ActualizarUsuario(Usuario entidad)
        {
            var respuesta = new Confirmacion();

            try
            {
                using (var db = new TiendaEntities())
                {
                    var resp = db.ActualizarUsuario(entidad.Consecutivo, entidad.Contrasenna, entidad.Nombre, entidad.CorreoElectronico);

                    if (resp > 0)
                    {
                        respuesta.Codigo = 0;
                        respuesta.Detalle = string.Empty;
                    }
                    else
                    {
                        respuesta.Codigo = -1;
                        respuesta.Detalle = "El usuario no se pudo actualizar";
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