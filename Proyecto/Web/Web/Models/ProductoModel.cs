﻿using System.Configuration;
using System.Net.Http;
using Web.Entidades;

using System.Net.Http.Json;


namespace Web.Models
{

    




    public class ProductoModel
    {
        public ConfirmacionProducto ConsultarProductos(bool MostrarTodos)
        {
            using (var client = new HttpClient())
            {
                string url = ConfigurationManager.AppSettings["urlWebApi"] + "Producto/ConsultarProductos?MostrarTodos=" + MostrarTodos;
                var respuesta = client.GetAsync(url).Result;

                if (respuesta.IsSuccessStatusCode)
                    return respuesta.Content.ReadFromJsonAsync<ConfirmacionProducto>().Result;
                else
                    return null;
            }
        }

        public ConfirmacionProducto ConsultarProducto(long Consecutivo)
        {
            using (var client = new HttpClient())
            {
                string url = ConfigurationManager.AppSettings["urlWebApi"] + "Producto/ConsultarProducto?Consecutivo=" + Consecutivo;
                var respuesta = client.GetAsync(url).Result;

                if (respuesta.IsSuccessStatusCode)
                    return respuesta.Content.ReadFromJsonAsync<ConfirmacionProducto>().Result;
                else
                    return null;
            }
        }

        public Confirmacion RegistrarProducto(Producto entidad)
        {
            using (var client = new HttpClient())
            {
                string url = ConfigurationManager.AppSettings["urlWebApi"] + "Producto/RegistrarProducto";
                JsonContent jsonEntidad = JsonContent.Create(entidad);
                var respuesta = client.PostAsync(url, jsonEntidad).Result;

                if (respuesta.IsSuccessStatusCode)
                    return respuesta.Content.ReadFromJsonAsync<Confirmacion>().Result;
                else
                    return null;
            }
        }

        public Confirmacion ActualizarImagenProducto(Producto entidad)
        {
            using (var client = new HttpClient())
            {
                string url = ConfigurationManager.AppSettings["urlWebApi"] + "Producto/ActualizarImagenProducto";
                JsonContent jsonEntidad = JsonContent.Create(entidad);
                var respuesta = client.PutAsync(url, jsonEntidad).Result;

                if (respuesta.IsSuccessStatusCode)
                    return respuesta.Content.ReadFromJsonAsync<Confirmacion>().Result;
                else
                    return null;
            }
        }

        public ConfirmacionTiposCategoria ConsultarTiposCategoria()
        {
            using (var client = new HttpClient())
            {
                string url = ConfigurationManager.AppSettings["urlWebApi"] + "Producto/ConsultarTiposCategoria";
                var respuesta = client.GetAsync(url).Result;

                if (respuesta.IsSuccessStatusCode)
                    return respuesta.Content.ReadFromJsonAsync<ConfirmacionTiposCategoria>().Result;
                else
                    return null;
            }
        }

        public ConfirmacionProductoPorCategorias FiltrarProductosPorCategoria(int IdCategoria)
        {
            using (var client = new HttpClient())
            {
                string url = ConfigurationManager.AppSettings["urlWebApi"] + "Producto/FiltrarProductosPorCategoria?IdCategoria=" + IdCategoria;
                var respuesta = client.GetAsync(url).Result;

                if (respuesta.IsSuccessStatusCode)
                {
                    return respuesta.Content.ReadFromJsonAsync<ConfirmacionProductoPorCategorias>().Result;
                }
                else
                {
                    return null;
                }
            }
        }


        public ConfirmacionProductoPorCategorias FiltrarProductosPorRangoPrecio(decimal? PrecioMinimo, decimal? PrecioMaximo)
        {
            using (var client = new HttpClient())
            {
                string url = ConfigurationManager.AppSettings["urlWebApi"] + "Producto/FiltrarProductosPorRangoPrecio?PrecioMinimo={PrecioMinimo}&PrecioMaximo={PrecioMaximo}=" + PrecioMinimo + PrecioMaximo;
                var respuesta = client.GetAsync(url).Result;

                if (respuesta.IsSuccessStatusCode)
                {
                    return respuesta.Content.ReadFromJsonAsync<ConfirmacionProductoPorCategorias>().Result;
                }
                else
                {
                    return null;
                }
            }
        }


        public ConfirmacionProductoPorCategorias FiltrarProductosPorCaracteristicas(string Material, string Color, string Tamanio)
        {
            using (var client = new HttpClient())
            {
                string url = ConfigurationManager.AppSettings["urlWebApi"] + "Producto/FiltrarProductosPorCaracteristicas?Material={Material}&Color={Color}&Tamanio={Tamanio}";
                var respuesta = client.GetAsync(url).Result;

                if (respuesta.IsSuccessStatusCode)
                {
                    return respuesta.Content.ReadFromJsonAsync<ConfirmacionProductoPorCategorias>().Result;
                }
                else
                {
                    return null;
                }
            }
        }



        public Confirmacion ActualizarProducto(Producto entidad)
        {
            using (var client = new HttpClient())
            {
                string url = ConfigurationManager.AppSettings["urlWebApi"] + "Producto/ActualizarProducto";
                JsonContent jsonEntidad = JsonContent.Create(entidad);
                var respuesta = client.PutAsync(url, jsonEntidad).Result;

                if (respuesta.IsSuccessStatusCode)
                    return respuesta.Content.ReadFromJsonAsync<Confirmacion>().Result;
                else
                    return null;
            }
        }

        public Confirmacion EliminarProducto(long Consecutivo)
        {
            using (var client = new HttpClient())
            {
                string url = ConfigurationManager.AppSettings["urlWebApi"] + "Producto/EliminarProducto?Consecutivo=" + Consecutivo;
                var respuesta = client.DeleteAsync(url).Result;

                if (respuesta.IsSuccessStatusCode)
                    return respuesta.Content.ReadFromJsonAsync<Confirmacion>().Result;
                else
                    return null;
            }
        }
    }
}
