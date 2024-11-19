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

        // Consultar Ayuda (GET)
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

        // Insertar Ayuda (POST)
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

        // Actualizar Ayuda (PUT)
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

        // Eliminar Ayuda (DELETE)
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
