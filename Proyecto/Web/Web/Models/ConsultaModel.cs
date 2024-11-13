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
    public class ConsultaModel
    {
        public string url = ConfigurationManager.AppSettings["urlWebApi"];

        public ConfirmacionConsulta ConsultarConsultas()
        {

            using (var client = new HttpClient())
            {
                string url = ConfigurationManager.AppSettings["urlWebApi"] + "Consulta/ConsultarResenas";
                var respuesta = client.GetAsync(url).Result;

                if (respuesta.IsSuccessStatusCode)
                    return respuesta.Content.ReadFromJsonAsync<ConfirmacionConsulta>().Result;
                else
                    return null;
            }
        }
    }
}