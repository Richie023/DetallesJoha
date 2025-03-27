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
    public class InforEModel
    {
        public string url = ConfigurationManager.AppSettings["urlWebApi"];

        public Confirmacion AgregarInfoE(InforE entidad)
        {
            using (var client = new HttpClient())
            {
                url += "InfoE/AgregarInfoE";
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