﻿using Web.Entidades;
using System.Configuration;
using System.Net.Http;
using System.Net.Http.Json;
using System.Web;

namespace Web.Models
{
    public class UsuarioModel
    {
        public string url = ConfigurationManager.AppSettings["urlWebApi"];

        public Confirmacion RegistrarUsuario(Usuario entidad)
        {
            using (var client = new HttpClient())
            {
                url += "Inicio/RegistrarUsuario";
                JsonContent jsonEntidad = JsonContent.Create(entidad);
                var respuesta = client.PostAsync(url, jsonEntidad).Result;

                if (respuesta.IsSuccessStatusCode)
                    return respuesta.Content.ReadFromJsonAsync<Confirmacion>().Result;
                else
                    return null;
            }
        }

        public ConfirmacionUsuario IniciarSesionUsuario(Usuario entidad)
        {
            using (var client = new HttpClient())
            {
                url += "Inicio/IniciarSesionUsuario";
                JsonContent jsonEntidad = JsonContent.Create(entidad);
                var respuesta = client.PostAsync(url, jsonEntidad).Result;

                if (respuesta.IsSuccessStatusCode)
                    return respuesta.Content.ReadFromJsonAsync<ConfirmacionUsuario>().Result;
                else
                    return null;
            }
        }

        public Confirmacion RecuperarAccesoUsuario(Usuario entidad)
        {
            using (var client = new HttpClient())
            {
                url += "Inicio/RecuperarAccesoUsuario";
                JsonContent jsonEntidad = JsonContent.Create(entidad);
                var respuesta = client.PostAsync(url, jsonEntidad).Result;

                if (respuesta.IsSuccessStatusCode)
                    return respuesta.Content.ReadFromJsonAsync<Confirmacion>().Result;
                else
                    return null;
            }
        }

        public ConfirmacionUsuario ConsultarUsuario()
        {
            using (var client = new HttpClient())
            {
                if(HttpContext.Current.Session["RolUsuario"].ToString() == "2"){

                }
              long Consecutivo = long.Parse(HttpContext.Current.Session["Consecutivo"].ToString());   
                string url = ConfigurationManager.AppSettings["urlWebApi"] + "Usuario/ConsultarUsuario?Consecutivo=" + Consecutivo;
                var respuesta = client.GetAsync(url).Result;

                if (respuesta.IsSuccessStatusCode)
                    return respuesta.Content.ReadFromJsonAsync<ConfirmacionUsuario>().Result;
                else
                    return null;
            }
        }    public ConfirmacionUsuario ConsultaUsuario(long id)
        {
            using (var client = new HttpClient())
            {
                
         
                string url = ConfigurationManager.AppSettings["urlWebApi"] + "Usuario/ConsultarUsuario?Consecutivo=" + id;
                var respuesta = client.GetAsync(url).Result;

                if (respuesta.IsSuccessStatusCode)
                    return respuesta.Content.ReadFromJsonAsync<ConfirmacionUsuario>().Result;
                else
                    return null;
            }
        }

        public Confirmacion ActualizarUsuario(Usuario entidad)
        {
            using (var client = new HttpClient())
            {
                entidad.Consecutivo = long.Parse(HttpContext.Current.Session["Consecutivo"].ToString());
                string url = ConfigurationManager.AppSettings["urlWebApi"] + "Usuario/ActualizarUsuario";
                JsonContent jsonEntidad = JsonContent.Create(entidad);
                var respuesta = client.PutAsync(url, jsonEntidad).Result;

                if (respuesta.IsSuccessStatusCode)
                    return respuesta.Content.ReadFromJsonAsync<Confirmacion>().Result;
                else
                    return null;
            }
        }
        public Confirmacion ActualizaUsuario(Usuario entidad)
        {
            using (var client = new HttpClient())
            {
               
                string url = ConfigurationManager.AppSettings["urlWebApi"] + "Usuario/ActualizarUsuario";
                JsonContent jsonEntidad = JsonContent.Create(entidad);
                var respuesta = client.PutAsync(url, jsonEntidad).Result;

                if (respuesta.IsSuccessStatusCode)
                    return respuesta.Content.ReadFromJsonAsync<Confirmacion>().Result;
                else
                    return null;
            }
        }


        public ConfirmacionUsuario ConsultaUsuarios()
        {
            using (var client = new HttpClient())
            {
              
                string url = ConfigurationManager.AppSettings["urlWebApi"] + "Usuario/ConsultarUsuarios";
                var respuesta = client.GetAsync(url).Result;

                if (respuesta.IsSuccessStatusCode)
                    return respuesta.Content.ReadFromJsonAsync<ConfirmacionUsuario>().Result;
                else
                    return null;
            }
        }
        public ConfirmacionUsuario InactivaUsuario(long Consecutivo)
        {
            using (var client = new HttpClient())
            {
                string url = ConfigurationManager.AppSettings["urlWebApi"] + "Usuario/InactivaUsuario?Consecutivo=" + Consecutivo;
                var respuesta = client.DeleteAsync(url).Result;

                if (respuesta.IsSuccessStatusCode)
                    return respuesta.Content.ReadFromJsonAsync<ConfirmacionUsuario>().Result;
                else
                    return null;
            }
        }


        public ConfirmacionRoles ConsultarRoles()
        {
            using (var client = new HttpClient())
            {
                string url = ConfigurationManager.AppSettings["urlWebApi"] + "Usuario/ConsultarRoles";
                var respuesta = client.GetAsync(url).Result;

                if (respuesta.IsSuccessStatusCode)
                    return respuesta.Content.ReadFromJsonAsync<ConfirmacionRoles>().Result;
                else
                    return null;
            }
        }

    }
}