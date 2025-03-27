using System;
using System.Configuration;
using System.Net.Http;
using System.Net.Http.Json;
using Web.Entidades;

namespace Web.Models
{
    public class AyudaModel
    {
        private readonly string baseUrl = ConfigurationManager.AppSettings["urlWebApi"] + "Ayuda/";

      
        public AyudaCategoriaRespuesta ConsultarAyuda()
        {
            using (var client = new HttpClient())
            {
                string url = baseUrl + "ConsultarAyuda";
                var respuesta = client.GetAsync(url).Result;

                if (respuesta.IsSuccessStatusCode)
                    return respuesta.Content.ReadFromJsonAsync<AyudaCategoriaRespuesta>().Result;
                else
                    return null;
            }
        }

        public AyudaCategoriaRespuesta ConsultarAyudaPorId(int id)
        {
            using (var client = new HttpClient())
            {
                string url = ConfigurationManager.AppSettings["urlWebApi"] + "Ayuda/ConsultarAyudaPorId?id=" + id;
                var respuesta = client.GetAsync(url).Result;

                if (respuesta.IsSuccessStatusCode)
                    return respuesta.Content.ReadFromJsonAsync<AyudaCategoriaRespuesta>().Result;
                else
                    return new AyudaCategoriaRespuesta
                    {
                        Codigo = -1,
                        Detalle = "Error al consultar la ayuda"
                    };
            }
        }


        public Confirmacion InsertarAyuda(Ayuda entidad)
        {
            using (var client = new HttpClient())
            {
                string url = baseUrl + "InsertarAyuda";
                JsonContent jsonEntidad = JsonContent.Create(entidad);
                var respuesta = client.PostAsync(url, jsonEntidad).Result;

                if (respuesta.IsSuccessStatusCode)
                    return respuesta.Content.ReadFromJsonAsync<Confirmacion>().Result;
                else
                    return null;
            }
        }

        
        public Confirmacion ActualizarAyuda(Ayuda entidad)
        {
            using (var client = new HttpClient())
            {
                string url = baseUrl + "ActualizarAyuda";
                JsonContent jsonEntidad = JsonContent.Create(entidad);
                var respuesta = client.PutAsync(url, jsonEntidad).Result;

                if (respuesta.IsSuccessStatusCode)
                    return respuesta.Content.ReadFromJsonAsync<Confirmacion>().Result;
                else
                    return null;
            }
        }

        public AyudaCategoriaRespuesta ActualizarImagenAyuda(Ayuda entidad)
        {
            using (var client = new HttpClient())
            {
                string url = ConfigurationManager.AppSettings["urlWebApi"] + "Ayuda/ActualizarImagenAyuda";
                var respuesta = client.PutAsJsonAsync(url, entidad).Result;

                if (respuesta.IsSuccessStatusCode)
                    return respuesta.Content.ReadFromJsonAsync<AyudaCategoriaRespuesta>().Result;
                else
                    return new AyudaCategoriaRespuesta
                    {
                        Codigo = -1,
                        Detalle = "Error al actualizar la imagen de la ayuda"
                    };
            }
        }


        public Confirmacion EliminarAyuda(int id)
        {
            using (var client = new HttpClient())
            {
                string url = baseUrl + "EliminarAyuda?id=" + id;
                var respuesta = client.DeleteAsync(url).Result;

                if (respuesta.IsSuccessStatusCode)
                    return respuesta.Content.ReadFromJsonAsync<Confirmacion>().Result;
                else
                    return null;
            }
        }
    }
}
