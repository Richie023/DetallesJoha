using Api.Entidades;
using Api.Models;
using System;
using System.IO;
using System.Linq;
using System.Runtime.Remoting.Contexts;
using System.Web.Http;


namespace Api.Controllers
{

    public class CarritoController : ApiController
    {
        UtilitariosModel model = new UtilitariosModel();
        private string contenido;
        private string ruta = AppDomain.CurrentDomain.BaseDirectory + "Notificacion.html";
        [HttpPost]
        [Route("Carrito/AgregarCarrito")]
        public Confirmacion AgregarCarrito(Carrito entidad)
        {
            var respuesta = new Confirmacion();

            try
            {
                using (var db = new DetallesJohaEntities())
                {
                    var resp = db.AgregarCarrito(entidad.ConsecutivoUsuario, entidad.ConsecutivoProducto, entidad.Cantidad);

                    if (resp > 0)
                    {
                       
                        respuesta.Codigo = 0;
                        respuesta.Detalle = string.Empty;
                    }
                    else
                    {
                        respuesta.Codigo = -1;
                        respuesta.Detalle = "No se pudo agregar la información al carrito";
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
        [Route("Carrito/EliminarCarrito")]
        public Confirmacion EliminarCarrito(long ConsecutivoCarrito)
        {
            var respuesta = new Confirmacion();

            try
            {
                using (var db = new DetallesJohaEntities())
                {
                    var resp = db.EliminarCarrito(ConsecutivoCarrito);

                    if (resp > 0)
                    {
                        respuesta.Codigo = 0;
                        respuesta.Detalle = string.Empty;
                    }
                    else
                    {
                        respuesta.Codigo = -1;
                        respuesta.Detalle = "No se pudo eliminar la información del carrito";
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
        [Route("Carrito/ConsultarCarrito")]
        public ConfirmacionCarrito ConsultarCarrito(long ConsecutivoUsuario)
        {
            var respuesta = new ConfirmacionCarrito();

            try
            {
                using (var db = new DetallesJohaEntities())
                {
                    var datos = db.ConsultarCarrito(ConsecutivoUsuario).ToList();

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

        [HttpPost]
        [Route("Carrito/PagarCarrito")]
        public Confirmacion PagarCarrito(Carrito entidad)
        {
            var respuesta = new Confirmacion();

            try
            {
                using (var db = new DetallesJohaEntities())
                {

                    var resp = db.PagarCarrito(entidad.ConsecutivoUsuario);
                    envioPedido(entidad.ConsecutivoMaestro);
                    if (resp > 0)
                    {

                        respuesta.Codigo = 0;
                        respuesta.Detalle = string.Empty;

                    }
                    else
                    {
                        respuesta.Codigo = -1;
                        respuesta.Detalle = "No se pudo realizar su pago, verifique la cantidad disponible de los productos";
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
        [Route("Carrito/ConsultarFacturas")]
        public ConfirmacionCarrito ConsultarFacturas(long ConsecutivoUsuario)
        {
            var respuesta = new ConfirmacionCarrito();

            try
            {
                using (var db = new DetallesJohaEntities())
                {
                    var datos = db.ConsultarFacturas(ConsecutivoUsuario).ToList();

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
        [Route("Carrito/ConsultarDetalleFacturas")]
        public ConfirmacionCarrito ConsultarDetalleFacturas(long ConsecutivoMaestro)
        {
            var respuesta = new ConfirmacionCarrito();

            try
            {
                using (var db = new DetallesJohaEntities())
                {
                    var datos = db.ConsultarDetalleFacturas(ConsecutivoMaestro).ToList();

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
        [Route("Carrito/ConsultarPedidos")]
        public ConfirmacionCarrito ConsultarPedidos()
        {
            var respuesta = new ConfirmacionCarrito();

            try
            {
                using (var db = new DetallesJohaEntities())
                {
                    var datos = db.ConsultarPedidos().ToList();

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

        private void envioPedido(long consecutivo) {

            var data =ConsultarDetalleFacturas(consecutivo);

            Context.GetData();

            contenido = File.ReadAllText(ruta);
            contenido = contenido.Replace("@@Nombre", data.DatosConsultarDetalleFacturas.);
            contenido = contenido.Replace("@@Pedido", entidad.ConsecutivoMaestro.ToString());
            contenido = contenido.Replace("@@Producto", entidad.Nombre);
            contenido = contenido.Replace("@@Cantidad", entidad.Cantidad.ToString());
            contenido = contenido.Replace("@@Material", entidad.Material);
            contenido = contenido.Replace("@@Tamanio", entidad.Tamanio);
            contenido = contenido.Replace("@@Total", entidad.Total.ToString());
            contenido = contenido.Replace("@@Fecha", entidad.Fecha.ToString("dd/MM/yyyy hh:mm:ss tt"));

            model.EnviarCorreo(entidad.Correo, "Pedido" + entidad.ConsecutivoMaestro, contenido);


        }
    }
}
