using Api.Entidades;
using Api.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;

namespace Api.Controllers
{
    public class AyudaController : ApiController
    {
        [HttpGet]
        [Route("Ayuda/ConsultarAyuda")]
        public AyudaCategoriaRespuesta ConsultarAyuda()
        {
            var respuesta = new AyudaCategoriaRespuesta();

            try
            {
                using (var db = new DetallesJohaEntities())
                {
                    var datos = db.ColsultarAyuda().ToList();

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
                respuesta.Detalle = $"Error al consultar datos: {ex.Message}";
            }

            return respuesta;
        }


        [HttpGet]
        [Route("Ayuda/ConsultarAyudaPorId")]
        public AyudaCategoriaRespuesta ConsultarAyudaPorId(int id)
        {
            var respuesta = new AyudaCategoriaRespuesta();

            try
            {
                using (var db = new DetallesJohaEntities())
                {
                    var datos = db.ConsultarAyudaPorID(id).FirstOrDefault();

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
        [Route("Ayuda/InsertarAyuda")]
        public Confirmacion InsertarAyuda(Ayuda entidad)
        {
            var respuesta = new Confirmacion();

            try
            {
                using (var db = new DetallesJohaEntities())
                {
                    db.InsertAyuda(
                        entidad.categoria,
                        entidad.titulo,
                        entidad.contenido,
                        entidad.imagen_url
                        );

                    db.SaveChanges();
                    respuesta.Codigo = 0;
                    respuesta.Detalle = "Ayuda insertada correctamente.";
                }
            }
            catch (Exception ex)
            {
                respuesta.Codigo = -1;
                respuesta.Detalle = $"Error al insertar ayuda: {ex.Message}";
            }

            return respuesta;
        }




        [HttpPut]
        [Route("Ayuda/ActualizarAyuda")]
        public Confirmacion ActualizarAyuda(Ayuda entidad)
        {
            var respuesta = new Confirmacion();

            try
            {
                using (var db = new DetallesJohaEntities())
                {
                    var filasAfectadas = db.UpdateAyuda(
                        entidad.id,
                        entidad.categoria,
                        entidad.titulo,
                        entidad.contenido,
                        entidad.imagen_url
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



        [HttpPut]
        [Route("Ayuda/ActualizarImagenAyuda")]
        public AyudaCategoriaRespuesta ActualizarImagenAyuda(Ayuda entidad)
        {
            var respuesta = new AyudaCategoriaRespuesta();

            try
            {
                using (var db = new DetallesJohaEntities())
                {
                    var resp = db.ActualizarImagenAyuda(entidad.id, entidad.imagen_url);

                    if (resp != null)
                    {
                        respuesta.Codigo = 0;
                        respuesta.Detalle = string.Empty;
                    }
                    else
                    {
                        respuesta.Codigo = -1;
                        respuesta.Detalle = "No se pudo actualizar la imagen. Verifique que la ayuda exista.";
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



        [HttpDelete]
        [Route("Ayuda/EliminarAyuda")]
        public Confirmacion EliminarAyuda(int id)
        {
            var respuesta = new Confirmacion();

            try
            {
                using (var db = new DetallesJohaEntities())
                {
                    var ayuda = db.DeleteAyuda(id);
                    var valor = ayuda.FirstOrDefault();
                    if (valor > 0)
                    {
                        respuesta.Codigo = 0;
                        respuesta.Detalle = "Ayuda eliminado correctamente.";
                    }
                    else
                    {
                        respuesta.Codigo = -1;
                        respuesta.Detalle = "No se encontró al ayuda para eliminar.";
                    }
                }
            }
            catch (Exception ex)
            {
                respuesta.Codigo = -1;
                respuesta.Detalle = $"Se presentó un error al eliminar: {ex.Message}";
            }

            return respuesta;
        }
    }
}