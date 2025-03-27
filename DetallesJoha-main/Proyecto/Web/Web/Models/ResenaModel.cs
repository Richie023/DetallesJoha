using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net.Http.Json;
using System.Net.Http;
using System.Web;
using Web.Entidades;

namespace Web.Models
{
    public class ResenaModel
    {

        public string url = ConfigurationManager.AppSettings["urlWebApi"];

        public Confirmacion AgregarResena(Resena entidad)
        {
            using (var client = new HttpClient())
            {
                url += "Resena/AgregarResena";
                JsonContent jsonEntidad = JsonContent.Create(entidad);
                var respuesta = client.PostAsync(url, jsonEntidad).Result;

                if (respuesta.IsSuccessStatusCode)
                    return respuesta.Content.ReadFromJsonAsync<Confirmacion>().Result;
                else
                    return null;
            }
        }
    }
}