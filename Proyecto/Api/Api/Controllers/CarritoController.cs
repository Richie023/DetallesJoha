using Api.Entidades;
using Api.Models;
using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Runtime.Remoting.Contexts;
using System.Threading;
using System.Web.Http;
using System.Web.SessionState;
using System.Web.UI.WebControls;
using System.Windows.Documents;
using System.Xml.Schema;


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
                    var resp = db.AgregarCarrito(entidad.ConsecutivoUsuario, entidad.Consecutivo, entidad.Cantidad);

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
                   
                    if (resp > 0)
                    {
                    




 envioPedido(entidad.ConsecutivoUsuario,entidad.Correo,entidad.NombreUsuario,entidad.Fecha);
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

        private void envioPedido(long consecutivo, String correo, String nombreUsuario,DateTime fecha) {




            using (var db = new DetallesJohaEntities())
            {

        var datos = db.ConsultarPedido().ToList();

  decimal Total = 0;
                string producto = null;
                string des = null;
                String cant = null;
                string precio = null;
                string total = null;
                if (datos.Count > 0)
                {
                     

                    foreach (var dato in datos)
                    {
                                              
                        contenido = File.ReadAllText(ruta);
                                             
                            contenido = contenido.Replace("@@Pedido", dato.ConsecutivoMaestro.ToString());

                            contenido = contenido.Replace("@@Nombre", dato.NombreUsuario);
                         
                          
                            contenido = contenido.Replace("@@Fecha", dato.Fecha.ToString("dd/MM/yyyy hh:mm:ss tt"));

                            producto +=   dato.Nombre.ToString() + "<br><br>";
                        des += "Tamaño: " + dato.Tamanio.ToString() + "<br> Material:" + dato.Material.ToString() + "<br>";
                        cant += dato.Cantidad.ToString() + "<br><br>";
                        precio += dato.Precio.ToString("N0") + "<br><br>";
                        total += dato.Total.ToString("N0") + "<br><br>";
                        Total += dato.Total;


                        
                    


                    }
contenido = contenido.Replace("@@Producto", producto); 
                    contenido = contenido.Replace("@@Cantidad", cant.ToString());
                    contenido = contenido.Replace("@@Descripion", des.ToString());
                    contenido = contenido.Replace("@@Precio", precio);
                    contenido = contenido.Replace("@@total", total.ToString());
                    contenido = contenido.Replace("@@Total",Total.ToString("N0"));
                    model.EnviarCorreo(correo, "Tu Pedido" + "en Detalles JOHA", contenido);

                }


            }
              

            

         

        }
    }
}
