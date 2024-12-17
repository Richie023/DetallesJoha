using Api.Entidades;
using Api.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Http;


namespace Api.Controllers
{
    public class ProductoController : ApiController
    {
        [HttpGet]
        [Route("Producto/ConsultarProductos")]
        public ConfirmacionProducto ConsultarProductos(bool MostrarTodos)
        {
            var respuesta = new ConfirmacionProducto();

            try
            {
                using (var db = new DetallesJohaEntities())
                {
                    var datos = db.ConsultarProductos(MostrarTodos).ToList();

                    foreach (var producto in datos)
                    {
                        producto.En_promocion = producto.En_promocion ?? false;
                    }

                    if (datos.Count > 0)
                    {
                        respuesta.Codigo = 0;
                        respuesta.Detalle = string.Empty;
                        respuesta.Datos = datos;
                    }
                    else
                    {
                        respuesta.Codigo = -1;
                        respuesta.Detalle = "No se encontraron resultados";
                    }
                }
            }
            catch (Exception ex)
            {
                respuesta.Codigo = -1;
                respuesta.Detalle = "Se presentó un error en el sistema";
                Console.WriteLine($"Error: {ex.Message}");
            }

            return respuesta;
        }


        [HttpGet]
        [Route("Producto/ConsultarProducto")]
        public ConfirmacionProducto ConsultarProducto(long Consecutivo)
        {
            var respuesta = new ConfirmacionProducto();

            try
            {
                using (var db = new DetallesJohaEntities())
                {
                    var datos = db.ConsultarProducto(Consecutivo).FirstOrDefault();

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
        [Route("Producto/RegistrarProducto")]
        public Confirmacion RegistrarProducto(Producto entidad)
        {
            var respuesta = new Confirmacion();

            try
            {
                using (var db = new DetallesJohaEntities())
                {
                    // Convertimos el valor booleano a int: 1 para true y 0 para false
                    int enPromocion = entidad.En_promocion ? 1 : 0;

                    // Llama al procedimiento almacenado, pasando el valor convertido a int (1 o 0)
                    var resp = db.RegistrarProducto(
                        entidad.NombreProducto,
                        entidad.Precio,
                        entidad.Inventario,
                        entidad.IdCategoria,
                        entidad.Material,
                        entidad.Tamanio,
                        entidad.ColorBase,
                        entidad.Porcentaje_descuento,  // Asegúrate de que `Porcentaje_descuento` esté presente en el modelo y se envíe
                        entidad.Fecha_inicio,          // Fecha de inicio de la promoción
                        entidad.Fecha_fin   ,           // Fecha de fin de la promoción
                        entidad.Descripcion
                    ).FirstOrDefault(); 

                    if (resp.Consecutivo > 0)
                    {
                        respuesta.Codigo = 0;
                        respuesta.Detalle = string.Empty;
                        respuesta.ConsecutivoGenerado = (long)resp.Consecutivo;
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



        [HttpPut]
        [Route("Producto/ActualizarImagenProducto")]
        public Confirmacion ActualizarImagenProducto(Producto entidad)
        {
            var respuesta = new Confirmacion();

            try
            {
                using (var db = new DetallesJohaEntities())
                {
                    var resp = db.ActualizarImagenProducto(entidad.Consecutivo, entidad.RutaImagen);

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
            catch (Exception)
            {
                respuesta.Codigo = -1;
                respuesta.Detalle = "Se presentó un error en el sistema";
            }

            return respuesta;
        }

        [HttpGet]
        [Route("Producto/ConsultarTiposCategoria")]
        public ConfirmacionTiposCategoria ConsultarTiposCategoria()
        {
            var respuesta = new ConfirmacionTiposCategoria();

            try
            {
                using (var db = new DetallesJohaEntities())
                {
                    var datos = db.ConsultarTiposCategoria().ToList();

                    if (datos.Count > 0)
                    {
                        respuesta.Codigo = 0;
                        respuesta.Detalle = string.Empty;
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
        [Route("Producto/FiltrarProductosPorCategoria")]
        public ConfirmacionProductoPorCategorias FiltrarProductosPorCategoria(int IdCategoria)
        {
            var respuesta = new ConfirmacionProductoPorCategorias();

            try
            {
                using (var db = new DetallesJohaEntities())
                {
                    var datos = db.FiltrarProductosPorCategoria(IdCategoria).ToList();

                    if (datos.Count > 0)
                    {
                        respuesta.Codigo = 0;
                        respuesta.Detalle = "Colsulta exitoso";
                        respuesta.Datos = datos;
                    }
                    else
                    {
                        respuesta.Codigo = -1;
                        respuesta.Detalle = "No se encontraron productos para la categoría especificada";
                    }
                }
            }
            catch (Exception ex)
            {
                respuesta.Codigo = -1;
                respuesta.Detalle = "Se presentó un error en el sistema: " + ex.Message;
                Console.WriteLine(ex);
            }

            return respuesta;
        }

        [HttpGet]
        [Route("Producto/FiltrarProductosPorRangoPrecio")]
        public ConfirmacionProductoPorCategorias FiltrarProductosPorRangoPrecio(decimal? PrecioMinimo, decimal? PrecioMaximo)
        {
            var respuesta = new ConfirmacionProductoPorCategorias();

            try
            {
                using (var db = new DetallesJohaEntities())
                {
                    var datos = db.ConsultarProductosPorRangoPrecio(PrecioMinimo, PrecioMaximo).ToList();

                    if (datos.Count > 0)
                    {
                        respuesta.Codigo = 0;
                        respuesta.Detalle = "Consulta exitosa";
                        respuesta.Datos = datos;
                    }
                    else
                    {
                        respuesta.Codigo = -1;
                        respuesta.Detalle = "No se encontraron productos en el rango de precios especificado";
                    }
                }
            }
            catch (Exception ex)
            {
                respuesta.Codigo = -1;
                respuesta.Detalle = "Se presentó un error en el sistema: " + ex.Message;
                Console.WriteLine(ex);
            }

            return respuesta;
        }


        [HttpGet]
        [Route("Producto/FiltrarProductosPorCaracteristicas")]
        public ConfirmacionProductoPorCategorias FiltrarProductosPorCaracteristicas(string Material, string Color, string Tamanio)
        {
            var respuesta = new ConfirmacionProductoPorCategorias();

            try
            {
                using (var db = new DetallesJohaEntities())
                {
                    var datos = db.FiltrarProductosPorCaracteristicas(Material, Color, Tamanio).ToList();

                    if (datos.Count > 0)
                    {
                        respuesta.Codigo = 0;
                        respuesta.Detalle = "Consulta exitosa";
                        respuesta.Datos = datos;
                    }
                    else
                    {
                        respuesta.Codigo = -1;
                        respuesta.Detalle = "No se encontraron productos con las características seleccionadas";
                    }
                }
            }
            catch (Exception ex)
            {
                respuesta.Codigo = -1;
                respuesta.Detalle = "Se presentó un error en el sistema: " + ex.Message;
                Console.WriteLine(ex);
            }

            return respuesta;
        }



        [HttpPut]
        [Route("Producto/ActualizarProducto")]
        public Confirmacion ActualizarProducto(Producto entidad)
        {
            var respuesta = new Confirmacion();

            try
            {
                using (var db = new DetallesJohaEntities())
                {
                    var resp = db.ActualizarProducto(entidad.Consecutivo, entidad.NombreProducto, entidad.Precio, entidad.Inventario, entidad.IdCategoria,entidad.Material,entidad.Tamanio,entidad.ColorBase,entidad.Id_Promocion,entidad.Descripcion);

                    if (resp > 0)
                    {
                        respuesta.Codigo = 0;
                        respuesta.Detalle = string.Empty;
                    }
                    else
                    {
                        respuesta.Codigo = -1;
                        respuesta.Detalle = "El producto no se pudo actualizar";
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
        [Route("Producto/EliminarProducto")]
        public Confirmacion EliminarProducto(long Consecutivo)
        {
            var respuesta = new Confirmacion();

            try
            {
                using (var db = new DetallesJohaEntities())
                {
                    var resp = db.EliminarProducto(Consecutivo);

                    if (resp > 0)
                    {
                        respuesta.Codigo = 0;
                        respuesta.Detalle = string.Empty;
                    }
                    else
                    {
                        respuesta.Codigo = -1;
                        respuesta.Detalle = "El producto no se pudo eliminar";
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