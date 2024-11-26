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
    public class PoliticaDevolucionController : ApiController
    {

        [HttpGet]
        [Route("PoliticaDevolucion/ConsultarTodos")]
        public PoliticaDevolucionRespuesta ConsultarTodos()
        {
            var respuesta = new PoliticaDevolucionRespuesta();

            try
            {
                using (var db = new DetallesJohaEntities())
                {
                    var datos = db.ColsultarPoliticaDevolucion().ToList();

                    if (datos.Any())
                    {
                        respuesta.Codigo = 0;
                        respuesta.Detalle = "Consulta exitosa.";
                        respuesta.Datos = datos;
                    }
                    else
                    {
                        respuesta.Codigo = -1;
                        respuesta.Detalle = "No se encontraron resultados.";
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

        // Insertar una nueva sección en la política de devolución
        [HttpPost]
        [Route("PoliticaDevolucion/Insertar")]
        public Confirmacion Insertar(PoliticaDevolucion entidad)
        {
            var respuesta = new Confirmacion();

            try
            {
                using (var db = new DetallesJohaEntities())
                {
                    db.InsertPoliticaDevolucion(
                        entidad.TituloSeccion,
                        entidad.SubtituloSeccion,
                        entidad.Contenido,
                        entidad.Orden
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

        // Actualizar una sección de la política de devolución
        [HttpPut]
        [Route("PoliticaDevolucion/Actualizar")]
        public Confirmacion Actualizar(PoliticaDevolucion entidad)
        {
            var respuesta = new Confirmacion();

            try
            {
                using (var db = new DetallesJohaEntities())
                {
                    var filasAfectadas = db.UpdatePoliticaDevolucion(
                        entidad.Id,
                        entidad.TituloSeccion,
                        entidad.SubtituloSeccion,
                        entidad.Contenido,
                        entidad.Orden
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

        // Eliminar una sección de la política de devolución
        [HttpDelete]
        [Route("PoliticaDevolucion/Eliminar")]
        public Confirmacion Eliminar(int id)
        {
            var respuesta = new Confirmacion();

            try
            {
                using (var db = new DetallesJohaEntities())
                {
                    var filasAfectadas = db.DeletePoliticaDevolucion(id);

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

    }
}
