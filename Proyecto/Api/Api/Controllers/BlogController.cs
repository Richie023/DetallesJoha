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
    public class BlogController : ApiController
    {
        [HttpGet]
        [Route("Blog/ConsultarTodos")]
        public BlogRespuesta ConsultarTodos()
        {
            var respuesta = new BlogRespuesta();

            try
            {
                using (var db = new DetallesJohaEntities())
                {
                    var datos = db.ColsultarBlogs().ToList();

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



        // Insertar un nuevo artículo
        [HttpPost]
        [Route("Blog/Insertar")]
        public Confirmacion Insertar(BlogArticulo entidad)
        {
            var respuesta = new Confirmacion();

            try
            {
                using (var db = new DetallesJohaEntities())
                {
                    db.InsertBlog(
                        entidad.Categoria,
                        entidad.Titulo,
                        entidad.Resumen,
                        entidad.Contenido,
                        entidad.Imagen_url
                    );

                    db.SaveChanges();
                    respuesta.Codigo = 0;
                    respuesta.Detalle = "Artículo insertado correctamente.";
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
        [Route("Blog/Actualizar")]
        public Confirmacion Actualizar(BlogArticulo entidad)
        {
            var respuesta = new Confirmacion();

            try
            {
                using (var db = new DetallesJohaEntities())
                {
                    // Llamada al procedimiento almacenado para actualizar
                    var filasAfectadas = db.UpdateBlog(
                        entidad.Id,
                        entidad.Categoria,
                        entidad.Titulo,
                        entidad.Resumen,
                        entidad.Contenido,
                        entidad.Imagen_url
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
                respuesta.Detalle = $"Se presentó un error al actualizar: {ex.Message}";
            }

            return respuesta;
        }

        // Eliminar un artículo por ID
        [HttpDelete]
        [Route("Blog/Eliminar")]
        public Confirmacion Eliminar(int id)
        {
            var respuesta = new Confirmacion();

            try
            {
                using (var db = new DetallesJohaEntities())
                {
                    var articulo = db.DeleteBlog(id);

                    if (articulo > 0)
                    {
                        respuesta.Codigo = 0;
                        respuesta.Detalle = "Artículo eliminado correctamente.";
                    }
                    else
                    {
                        respuesta.Codigo = -1;
                        respuesta.Detalle = "No se encontró el artículo para eliminar.";
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
