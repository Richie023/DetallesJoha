using System.Configuration;
using System.Net.Http;
using Web.Entidades;

using System.Net.Http.Json;


namespace Web.Models
{
    public class AvisoPrivacidadModel
    {
        public AvisoPrivacidadRespuesta ColsultarAvisoPrivacidad()
        {
            using (var client = new HttpClient())
            {
                string url = ConfigurationManager.AppSettings["urlWebApi"] + "AvisoPrivacidad/ColsultarAvisoPrivacidad";
                var respuesta = client.GetAsync(url).Result;

                if (respuesta.IsSuccessStatusCode)
                    return respuesta.Content.ReadFromJsonAsync<AvisoPrivacidadRespuesta>().Result;
                else
                    return null;
            }
        }



        public Confirmacion InsertarAvisoPrivacidad(AvisoPrivacidad entidad)
        {
            using (var client = new HttpClient())
            {
                string url = ConfigurationManager.AppSettings["urlWebApi"] + "AvisoPrivacidad/InsertarAvisoPrivacidad";
                JsonContent jsonEntidad = JsonContent.Create(entidad);
                var respuesta = client.PostAsync(url, jsonEntidad).Result;

                if (respuesta.IsSuccessStatusCode)
                    return respuesta.Content.ReadFromJsonAsync<Confirmacion>().Result;
                else
                    return null;
            }
        }

        public Confirmacion ActualizarAvisoPrivacidad(AvisoPrivacidad entidad)
        {
            using (var client = new HttpClient())
            {
                string url = ConfigurationManager.AppSettings["urlWebApi"] + "AvisoPrivacidad/ActualizarAvisoPrivacidad";
                JsonContent jsonEntidad = JsonContent.Create(entidad);
                var respuesta = client.PutAsync(url, jsonEntidad).Result;

                if (respuesta.IsSuccessStatusCode)
                    return respuesta.Content.ReadFromJsonAsync<Confirmacion>().Result;
                else
                    return null;
            }
        }


        public Confirmacion EliminarAvisoPrivacidad(int id)
        {
            using (var client = new HttpClient())
            {
                string url = ConfigurationManager.AppSettings["urlWebApi"] + "AvisoPrivacidad/EliminarAvisoPrivacidad?id=" + id;
                var respuesta = client.DeleteAsync(url).Result;

                if (respuesta.IsSuccessStatusCode)
                    return respuesta.Content.ReadFromJsonAsync<Confirmacion>().Result;
                else
                    return null;
            }
        }
    }
}
