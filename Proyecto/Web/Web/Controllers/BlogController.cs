using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net.Http.Json;
using System.Net.Http;
using System.Web;
using System.Web.Mvc;
using Web.Entidades;

namespace Web.Controllers
{
    public class BlogController : Controller
    {
        
        public BlogRespuesta ConsultarTodos()
        {
            using (var client = new HttpClient())
            {
                string url = ConfigurationManager.AppSettings["urlWebApi"] + "Blog/ConsultarTodos";
                var respuesta = client.GetAsync(url).Result;

                if (respuesta.IsSuccessStatusCode)
                {
                    return respuesta.Content.ReadFromJsonAsync<BlogRespuesta>().Result;
                }
                else
                {
                    return null;
                }
            }
        }

        
        public BlogRespuesta ConsultarPorId(int id)
        {
            using (var client = new HttpClient())
            {
                string url = ConfigurationManager.AppSettings["urlWebApi"] + $"Blog/ConsultarPorId?id={id}";
                var respuesta = client.GetAsync(url).Result;

                if (respuesta.IsSuccessStatusCode)
                {
                    return respuesta.Content.ReadFromJsonAsync<BlogRespuesta>().Result;
                }
                else
                {
                    return null;
                }
            }
        }

        public Confirmacion Insertar(BlogArticulo entidad)
        {
            using (var client = new HttpClient())
            {
                string url = ConfigurationManager.AppSettings["urlWebApi"] + "Blog/Insertar";
                JsonContent jsonEntidad = JsonContent.Create(entidad);
                var respuesta = client.PostAsync(url, jsonEntidad).Result;

                if (respuesta.IsSuccessStatusCode)
                {
                    return respuesta.Content.ReadFromJsonAsync<Confirmacion>().Result;
                }
                else
                {
                    return null;
                }
            }
        }

        public Confirmacion Actualizar(BlogArticulo entidad)
        {
            using (var client = new HttpClient())
            {
                string url = ConfigurationManager.AppSettings["urlWebApi"] + "Blog/Actualizar";
                JsonContent jsonEntidad = JsonContent.Create(entidad);
                var respuesta = client.PutAsync(url, jsonEntidad).Result;

                if (respuesta.IsSuccessStatusCode)
                {
                    return respuesta.Content.ReadFromJsonAsync<Confirmacion>().Result;
                }
                else
                {
                    return null;
                }
            }
        }

        
        public Confirmacion Eliminar(int id)
        {
            using (var client = new HttpClient())
            {
                string url = ConfigurationManager.AppSettings["urlWebApi"] + $"Blog/Eliminar?id={id}";
                var respuesta = client.DeleteAsync(url).Result;

                if (respuesta.IsSuccessStatusCode)
                {
                    return respuesta.Content.ReadFromJsonAsync<Confirmacion>().Result;
                }
                else
                {
                    return null;
                }
            }
        }
    }
}