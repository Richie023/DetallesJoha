using System.Configuration;
using System.Net.Http;
using System.Net.Http.Json;
using Web.Entidades;

namespace Web.Models
{
    public class BlogModel
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
                    return new BlogRespuesta
                    {
                        Codigo = -1,
                        Detalle = "Error al consumir la API para consultar todos los artículos."
                    };
                }
            }
        }

        public BlogRespuesta ConsultarBlogPorId(int id)
        {
            using (var client = new HttpClient())
            {
                string url = ConfigurationManager.AppSettings["urlWebApi"] + "Blog/ConsultarBlogPorId?id=" + id;
                var respuesta = client.GetAsync(url).Result;

                if (respuesta.IsSuccessStatusCode)
                    return respuesta.Content.ReadFromJsonAsync<BlogRespuesta>().Result;
                else
                    return new BlogRespuesta
                    {
                        Codigo = -1,
                        Detalle = "Error al consultar el blog"
                    };
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
                    return new Confirmacion
                    {
                        Codigo = -1,
                        Detalle = "Error al consumir la API para insertar el artículo."
                    };
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
                    return new Confirmacion
                    {
                        Codigo = -1,
                        Detalle = "Error al consumir la API para actualizar el artículo."
                    };
                }
            }
        }


        public BlogRespuesta ActualizarImagenBlog(BlogArticulo entidad)
        {
            using (var client = new HttpClient())
            {
                string url = ConfigurationManager.AppSettings["urlWebApi"] + "Blog/ActualizarImagenBlog";
                var respuesta = client.PutAsJsonAsync(url, entidad).Result;

                if (respuesta.IsSuccessStatusCode)
                    return respuesta.Content.ReadFromJsonAsync<BlogRespuesta>().Result;
                else
                    return new BlogRespuesta
                    {
                        Codigo = -1,
                        Detalle = "Error al actualizar la imagen del blog"
                    };
            }
        }


        public Confirmacion Eliminar(int id)
        {
            using (var client = new HttpClient())
            {
                string url = ConfigurationManager.AppSettings["urlWebApi"] + "Blog/Eliminar?id=" +id;
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
                        Detalle = "Error al consumir la API para eliminar el artículo."
                    };
                }
            }
        }
    }
}
