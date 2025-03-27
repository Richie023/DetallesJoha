using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Json;
using System.Web;
using Web.Entidades;

namespace Web.Models
{
	public class BuscarModel
	{
        public ConfirmacionBuscar ConsultarProductos(string nombre = null)
        {
            using (var client = new HttpClient())
            {
                string url = ConfigurationManager.AppSettings["urlWebApi"] + "Buscar/ConsultarProductos?nombre=" + nombre;
                var respuesta = client.GetAsync(url).Result;

                if (respuesta.IsSuccessStatusCode)
                    return respuesta.Content.ReadFromJsonAsync<ConfirmacionBuscar>().Result;
                else
                    return new ConfirmacionBuscar { Codigo = -1, Detalle = "Error al consultar productos." };
            }
        }
    }
}
//cambio