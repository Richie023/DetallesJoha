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


        [HttpGet]
        [Route("Blog/ConsultarBlogPorId")]
        public BlogRespuesta ConsultarBlogPorId(int id)
        {
            var respuesta = new BlogRespuesta();

            try
            {
                using (var db = new DetallesJohaEntities())
                {
                    var datos = db.ConsultarBlogPorID(id).FirstOrDefault();

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
        [Route("Blog/Insertar")]
        public Confirmacion Insertar(BlogArticulo entidad)
        {
            var respuesta = new Confirmacion();

            try
            {
                using (var db = new DetallesJohaEntities())
                {
                    db.InsertBlog(
                        entidad.categoria,
                        entidad.titulo,
                        entidad.resumen,
                        entidad.contenido,
                        entidad.imagen_url
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
                    var filasAfectadas = db.UpdateBlog(
                        entidad.id,
                        entidad.categoria,
                        entidad.titulo,
                        entidad.resumen,
                        entidad.contenido,
                        entidad.imagen_url
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




        [HttpPut]
        [Route("Blog/ActualizarImagenBlog")]
        public BlogRespuesta ActualizarImagenBlog(BlogArticulo entidad)
        {
            var respuesta = new BlogRespuesta();

            try
            {
                using (var db = new DetallesJohaEntities())
                {
                    var resp = db.ActualizarImagenBlog(entidad.id, entidad.imagen_url);

                    if (resp > 0)
                    {
                        respuesta.Codigo = 0;
                        respuesta.Detalle = string.Empty;
                    }
                    else
                    {
                        respuesta.Codigo = -1;
                        respuesta.Detalle = "No se pudo actualizar la imagen. Verifique que el blog exista.";
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
