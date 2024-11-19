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
                        respuesta.Datos = datos.Cast<Ayuda>().ToList();
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

        // Insertar una nueva ayuda
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