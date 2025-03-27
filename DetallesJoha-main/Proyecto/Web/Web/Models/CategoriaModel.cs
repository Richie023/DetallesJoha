using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http.Json;
using System.Net.Http;
using System.Security.Policy;
using System.Web;
using Web.Entidades;
using System.Configuration;

namespace Web.Models
{
    public class CategoriaModel
    {
        public string url = ConfigurationManager.AppSettings["urlWebApi"];


        public Confirmacion  RegistrarCategoria(TiposCategoria categoria)
        {
            using (var client = new HttpClient())
            {
                url += "Categoria/RegistrarCategoria";
                JsonContent jsonEntidad = JsonContent.Create(categoria);
                var respuesta = client.PostAsync(url, jsonEntidad).Result;

                if (respuesta.IsSuccessStatusCode)
                    return respuesta.Content.ReadFromJsonAsync<Confirmacion>().Result;
               
                else
                    return null;
            }

        }

    }
}