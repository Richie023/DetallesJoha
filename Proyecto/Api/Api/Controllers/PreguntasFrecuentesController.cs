﻿using Api.Entidades;
using Api.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Http;

namespace Api.Controllers
{
    public class PreguntasFrecuentesController : ApiController
    {

        [HttpGet]
        [Route("PreguntasFrecuentes/ConsultarTodos")]
        public FaqRespuesta ConsultarTodos()
        {
            var respuesta = new FaqRespuesta();

            try
            {
                using (var db = new DetallesJohaEntities())
                {
                    var datos = db.ColsutarPGF().ToList();

                    if (datos.Any())
                    {
                        respuesta.Codigo = 0;
                        respuesta.Detalle = "Consulta exitosa.";
                        respuesta.Datos = datos;
                    }
                    else
                    {
                        respuesta.Codigo = -1;
                        respuesta.Detalle = "No se encontraron artículos.";
                    }
                }
            }
            catch (Exception ex)
            {
                respuesta.Codigo = -1;
                respuesta.Detalle = $"Se presentó un error: {ex.Message}";
            }

            return respuesta;
        }



        [HttpGet]
        [Route("PreguntasFrecuentes/ConsultarPorId")]
        public FaqRespuesta ConsultarPorId(int id)
        {
            var respuesta = new FaqRespuesta();

            try
            {
                using (var db = new DetallesJohaEntities())
                {
                    var datos = db.ConsultarPGFPorId(id).FirstOrDefault();

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





        [HttpPost]
        [Route("PreguntasFrecuentes/Insertar")]
        public Confirmacion Insertar(PreguntasFrecuentes entidad)
        {
            var respuesta = new Confirmacion();

            try
            {
                using (var db = new DetallesJohaEntities())
                {
                    db.InsertPGF(
                       entidad.categoria,
                       entidad.pregunta,
                       entidad.respuesta
                       );

                    db.SaveChanges();

                    respuesta.Codigo = 0;
                    respuesta.Detalle = "Pregunta frecuente insertada correctamente.";
                }
            }
            catch (Exception ex)
            {
                respuesta.Codigo = -1;
                respuesta.Detalle = $"Se presentó un error al insertar: {ex.Message}";
            }

            return respuesta;
        }

        

        [HttpPut]
        [Route("PreguntasFrecuentes/Actualizar")]
        public Confirmacion Actualizar(PreguntasFrecuentes entidad)
        {
            var respuesta = new Confirmacion();

            try
            {
                using (var db = new DetallesJohaEntities())
                {
                    var filasAfectadas = db.UpdatePGF(
                        entidad.id,
                        entidad.categoria,
                        entidad.pregunta,
                        entidad.respuesta
                    );

                        respuesta.Codigo = 0;
                        respuesta.Detalle = "Registro actualizado exitosamente.";
                    
                }
            }
            catch (Exception ex)
            {
                respuesta.Codigo = -1;
                respuesta.Detalle = $"Se presentó un error al actualizar: {ex.Message}";
            }

            return respuesta;
        }



       
        [HttpDelete]
        [Route("PreguntasFrecuentes/Eliminar")]
        public Confirmacion Eliminar(int id)
        {
            var respuesta = new Confirmacion();

            try
            {
                using (var db = new DetallesJohaEntities())
                {
                    var filasAfectadas = db.DeletePGF(id);

                    if (filasAfectadas != null)
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

    }
}
