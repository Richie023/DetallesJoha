using System;
using System.Configuration;
using System.Net.Http;
using System.Net.Http.Json;
using Web.Entidades;

namespace Web.Models
{
    public class PreguntasFrecuentesModel
    {
        // Consultar todas las preguntas frecuentes
        public FaqRespuesta ConsultarTodos()
        {
            using (var client = new HttpClient())
            {
                string url = ConfigurationManager.AppSettings["urlWebApi"] + "PreguntasFrecuentes/ConsultarTodos";
                var respuesta = client.GetAsync(url).Result;

                if (respuesta.IsSuccessStatusCode)
                {
                    return respuesta.Content.ReadFromJsonAsync<FaqRespuesta>().Result;
                }
                else
                {
                    return null;
                    
                }
            }
        }

        // Insertar una nueva pregunta frecuente
        public Confirmacion Insertar(PreguntasFrecuentes entidad)
        {
            using (var client = new HttpClient())
            {
                string url = ConfigurationManager.AppSettings["urlWebApi"] + "PreguntasFrecuentes/Insertar";
                JsonContent jsonEntidad = JsonContent.Create(entidad);
                var respuesta = client.PostAsync(url, jsonEntidad).Result;

                if (respuesta.IsSuccessStatusCode)
                {
                    return respuesta.Content.ReadFromJsonAsync<Confirmacion>().Result;
                }
                else
                {
                    return new Confirmacion
                    {
                        Codigo = -1,
                        Detalle = "Error al consumir la API para insertar preguntas frecuentes."
                    };
                }
            }
        }

        // Actualizar una pregunta frecuente existente
        public Confirmacion Actualizar(PreguntasFrecuentes entidad)
        {
            using (var client = new HttpClient())
            {
                string url = ConfigurationManager.AppSettings["urlWebApi"] + "PreguntasFrecuentes/Actualizar";
                JsonContent jsonEntidad = JsonContent.Create(entidad);
                var respuesta = client.PutAsync(url, jsonEntidad).Result;

                if (respuesta.IsSuccessStatusCode)
                {
                    return respuesta.Content.ReadFromJsonAsync<Confirmacion>().Result;
                }
                else
                {
                    return new Confirmacion
                    {
                        Codigo = -1,
                        Detalle = "Error al consumir la API para actualizar preguntas frecuentes."
                    };
                }
            }
        }

        // Eliminar una pregunta frecuente por ID
        public Confirmacion Eliminar(int id)
        {
            using (var client = new HttpClient())
            {
                string url = ConfigurationManager.AppSettings["urlWebApi"] + $"PreguntasFrecuentes/Eliminar?id={id}";
                var respuesta = client.DeleteAsync(url).Result;

                if (respuesta.IsSuccessStatusCode)
                {
                    return respuesta.Content.ReadFromJsonAsync<Confirmacion>().Result;
                }
                else
                {
                    return new Confirmacion
                    {
                        Codigo = -1,
                        Detalle = "Error al consumir la API para eliminar preguntas frecuentes."
                    };
                }
            }
        }

        public PreguntasFrecuentes ConsultarPreguntaFrecuente(int id)
        {
            using (var client = new HttpClient())
            {
                try
                {
                    // Obtener la URL base desde el archivo de configuración
                    string url = ConfigurationManager.AppSettings["urlWebApi"] + $"PreguntasFrecuentes/Consultar/{id}";
                    var respuesta = client.GetAsync(url).Result;

                    if (respuesta.IsSuccessStatusCode)
                    {
                        // Deserialización directa a PreguntasFrecuentes
                        return respuesta.Content.ReadFromJsonAsync<PreguntasFrecuentes>().Result;
                    }
                    else
                    {
                        // Manejo del caso donde no se obtiene un 200 OK
                        throw new Exception($"Error al consultar la pregunta frecuente: {respuesta.ReasonPhrase}");
                    }
                }
                catch (Exception ex)
                {
                    // Manejo de errores
                    throw new Exception($"Se produjo un error al llamar a la API: {ex.Message}");
                }
            }
        }


    }
}
