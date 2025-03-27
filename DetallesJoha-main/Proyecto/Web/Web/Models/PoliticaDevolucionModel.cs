using System.Configuration;
using System.Net.Http;
using Web.Entidades;

using System.Net.Http.Json;


namespace Web.Models
{
    public class PoliticaDevolucionModel
    {
        public PoliticaDevolucionRespuesta ConsultarTodos()
        {
            using (var client = new HttpClient())
            {
                string url = ConfigurationManager.AppSettings["urlWebApi"] + "PoliticaDevolucion/ConsultarTodos";
                var respuesta = client.GetAsync(url).Result;

                if (respuesta.IsSuccessStatusCode) 
                    return respuesta.Content.ReadFromJsonAsync<PoliticaDevolucionRespuesta>().Result;
                else
                    return null;
            }
        }


        public PoliticaDevolucionRespuesta ConsultarPorId(int id)
        {
            using (var client = new HttpClient())
            {
                string url = ConfigurationManager.AppSettings["urlWebApi"] + "PoliticaDevolucion/ConsultarPorId?id=" + id;
                var respuesta = client.GetAsync(url).Result;

                if (respuesta.IsSuccessStatusCode)
                    return respuesta.Content.ReadFromJsonAsync<PoliticaDevolucionRespuesta>().Result;
                else
                    return new PoliticaDevolucionRespuesta
                    {
                        Codigo = -1,
                        Detalle = "Error al consultar la política de devolución"
                    };
            }
        }



        public Confirmacion Insertar(PoliticaDevolucion entidad)
        {
            using (var client = new HttpClient())
            {
                string url = ConfigurationManager.AppSettings["urlWebApi"] + "PoliticaDevolucion/Insertar";
                JsonContent jsonEntidad = JsonContent.Create(entidad);
                var respuesta = client.PostAsync(url, jsonEntidad).Result;

                if (respuesta.IsSuccessStatusCode)
                    return respuesta.Content.ReadFromJsonAsync<Confirmacion>().Result;
                else
                    return null;
            }
        }



        public Confirmacion Actualizar(PoliticaDevolucion entidad)
        {
            using (var client = new HttpClient())
            {
                string url = ConfigurationManager.AppSettings["urlWebApi"] + "PoliticaDevolucion/Actualizar";
                JsonContent jsonEntidad = JsonContent.Create(entidad);
                var respuesta = client.PutAsync(url, jsonEntidad).Result;

                if (respuesta.IsSuccessStatusCode)
                    return respuesta.Content.ReadFromJsonAsync<Confirmacion>().Result;
                else
                    return null;
            }
        }



        public Confirmacion Eliminar(int id)
        {
            using (var client = new HttpClient())
            {
                string url = ConfigurationManager.AppSettings["urlWebApi"] + "PoliticaDevolucion/Eliminar?id=" + id;
                var respuesta = client.DeleteAsync(url).Result;

                if (respuesta.IsSuccessStatusCode)
                    return respuesta.Content.ReadFromJsonAsync<Confirmacion>().Result;
                else
                    return null;
            }
        }
    }
}
