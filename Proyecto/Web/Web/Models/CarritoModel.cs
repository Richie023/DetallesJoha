﻿using System.Net.Http.Json;
using Web.Entidades;
using System.Configuration;

using System.Net.Http;


namespace Web.Models
{
    public class CarritoModel
    {
        public string url = ConfigurationManager.AppSettings["urlWebApi"];

        public Confirmacion AgregarCarrito(Carrito entidad)
        {
            using (var client = new HttpClient())
            {
                url += "Carrito/AgregarCarrito";
                JsonContent jsonEntidad = JsonContent.Create(entidad);
                var respuesta = client.PostAsync(url, jsonEntidad).Result;

                if (respuesta.IsSuccessStatusCode)
                    return respuesta.Content.ReadFromJsonAsync<Confirmacion>().Result;
                else
                    return null;
            }
        }

        public Confirmacion EliminarCarrito(long ConsecutivoCarrito)
        {
            using (var client = new HttpClient())
            {
                url += "Carrito/EliminarCarrito?ConsecutivoCarrito=" + ConsecutivoCarrito;

                var respuesta = client.DeleteAsync(url).Result;

                if (respuesta.IsSuccessStatusCode)
                    return respuesta.Content.ReadFromJsonAsync<Confirmacion>().Result;
                else
                    return null;
            }
        }

        public ConfirmacionCarrito ConsultarCarrito(long ConsecutivoUsuario)
        {
            using (var client = new HttpClient())
            {
                string url = ConfigurationManager.AppSettings["urlWebApi"] + "Carrito/ConsultarCarrito?ConsecutivoUsuario=" + ConsecutivoUsuario;
                var respuesta = client.GetAsync(url).Result;

                if (respuesta.IsSuccessStatusCode)
                    return respuesta.Content.ReadFromJsonAsync<ConfirmacionCarrito>().Result;
                else
                    return null;
            }
        }

        public Confirmacion PagarCarrito(Carrito entidad)
        {
            using (var client = new HttpClient())
            {
                url += "Carrito/PagarCarrito";
                JsonContent jsonEntidad = JsonContent.Create(entidad);
                var respuesta = client.PostAsync(url, jsonEntidad).Result;

                if (respuesta.IsSuccessStatusCode)
                    return respuesta.Content.ReadFromJsonAsync<Confirmacion>().Result;
                else
                    return null;
            }
        }

        public ConfirmacionCarrito ConsultarFacturas(long ConsecutivoUsuario)
        {
            using (var client = new HttpClient())
            {
                string url = ConfigurationManager.AppSettings["urlWebApi"] + "Carrito/ConsultarFacturas?ConsecutivoUsuario=" + ConsecutivoUsuario;
                var respuesta = client.GetAsync(url).Result;

                if (respuesta.IsSuccessStatusCode)
                    return respuesta.Content.ReadFromJsonAsync<ConfirmacionCarrito>().Result;
                else
                    return null;
            }
        }

        public ConfirmacionCarrito ConsultarDetalleFacturas(long ConsecutivoMaestro)
        {
            using (var client = new HttpClient())
            {
                string url = ConfigurationManager.AppSettings["urlWebApi"] + "Carrito/ConsultarDetalleFacturas?ConsecutivoMaestro=" + ConsecutivoMaestro;
                var respuesta = client.GetAsync(url).Result;

                if (respuesta.IsSuccessStatusCode)
                    return respuesta.Content.ReadFromJsonAsync<ConfirmacionCarrito>().Result;
                else
                    return null;
            }
        }
        public ConfirmacionCarrito RefacturaFactura(long ConsecutivoMaestro)
        {
            using (var client = new HttpClient())
            {
                string url = ConfigurationManager.AppSettings["urlWebApi"] + "Carrito/ RefacturaFactura?ConsecutivoMaestro=" + ConsecutivoMaestro;
                var respuesta = client.GetAsync(url).Result;

                if (respuesta.IsSuccessStatusCode)
                    return respuesta.Content.ReadFromJsonAsync<ConfirmacionCarrito>().Result;
                else
                    return null;
            }
        }
        public ConfirmacionCarrito ConsultarPedidos()
        {
            using (var client = new HttpClient())
            {
                string url = ConfigurationManager.AppSettings["urlWebApi"] + "Carrito/ConsultarPedidos" ;
                var respuesta = client.GetAsync(url).Result;

                if (respuesta.IsSuccessStatusCode)
                    return respuesta.Content.ReadFromJsonAsync<ConfirmacionCarrito>().Result;
                else
                    return null;
            }
        }

    }
}