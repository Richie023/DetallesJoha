﻿using Api.Entidades;
using Api.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace Api.Controllers
{
    public class AvisoPrivacidadController : ApiController
    {

        [HttpPost]
        [Route("AvisoPrivacidad/InsertarAvisoPrivacidad")]
        public Confirmacion InsertarAvisoPrivacidad(AvisoPrivacidad entidad)
        {
            var respuesta = new Confirmacion();

            try
            {
                using (var db = new DetallesJohaEntities())
                {
                    db.InsertAvisoPrivacidad(
                        entidad.titulo_seccion,
                        entidad.contenido
                    );

                    respuesta.Codigo = 0;
                    respuesta.Detalle = "Registro insertado exitosamente.";
                }
            }
            catch (Exception ex)
            {
                respuesta.Codigo = -1;
                respuesta.Detalle = $"Se presentó un error en el sistema: {ex.Message}";
            }

            return respuesta;
        }

        [HttpPut]
        [Route("AvisoPrivacidad/ActualizarAvisoPrivacidad")]
        public Confirmacion ActualizarAvisoPrivacidad(AvisoPrivacidad entidad)
        {
            var respuesta = new Confirmacion();

            try
            {
                using (var db = new DetallesJohaEntities())
                {
                    var filasAfectadas = db.UpdateAvisoPrivacidad(
                        entidad.id,
                        entidad.titulo_seccion,
                        entidad.contenido
                    );

                    if (filasAfectadas > 0)
                    {
                        respuesta.Codigo = 0;
                        respuesta.Detalle = "Registro actualizado exitosamente.";
                    }
                    else
                    {
                        respuesta.Codigo = -1;
                        respuesta.Detalle = "No se encontró el registro para actualizar.";
                    }
                }
            }
            catch (Exception ex)
            {
                respuesta.Codigo = -1;
                respuesta.Detalle = $"Se presentó un error en el sistema: {ex.Message}";
            }

            return respuesta;
        }



        [HttpDelete]
        [Route("AvisoPrivacidad/EliminarAvisoPrivacidad")]
        public Confirmacion EliminarAvisoPrivacidad(int id)
        {
            var respuesta = new Confirmacion();

            try
            {
                using (var db = new DetallesJohaEntities())
                {
                    var filasAfectadas = db.DeleteAvisoPrivacidad(id);

                    if (filasAfectadas > 0)
                    {
                        respuesta.Codigo = 0;
                        respuesta.Detalle = "Registro eliminado exitosamente.";
                    }
                    else
                    {
                        respuesta.Codigo = -1;
                        respuesta.Detalle = "No se encontró el registro para eliminar.";
                    }
                }
            }
            catch (Exception ex)
            {
                respuesta.Codigo = -1;
                respuesta.Detalle = $"Se presentó un error en el sistema: {ex.Message}";
            }

            return respuesta;
        }



        [HttpGet]
        [Route("AvisoPrivacidad/ColsultarAvisoPrivacidad")]
        public AvisoPrivacidadRespuesta ColsultarAvisoPrivacidad()
        {
            var respuesta = new AvisoPrivacidadRespuesta();

            try
            {
                using (var db = new DetallesJohaEntities())
                {
                    var datos = db.ColsultarAvisoPrivacidad().ToList();

                    if (datos.Any())
                    {
                        respuesta.Codigo = 0;
                        respuesta.Detalle = "Colsulta exitosa";
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



        [HttpGet]
        [Route("AvisoPrivacidad/ConsultarAviso")]
        public AvisoPrivacidadRespuesta ConsultarAviso(int id)
        {
            var respuesta = new AvisoPrivacidadRespuesta();

            try
            {
                using (var db = new DetallesJohaEntities())
                {
                    var datos = db.ConsultarAvisoPrivacidadPorID(id).FirstOrDefault();

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


    }
}
