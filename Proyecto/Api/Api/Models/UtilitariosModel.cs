﻿using System.Net.Mail;
using System.Configuration;



namespace Api.Models
{
    public class UtilitariosModel
    {
        public void EnviarCorreo(string destino, string asunto, string contenido)
        {
            MailMessage message = new MailMessage();
            message.From = new MailAddress(ConfigurationManager.AppSettings["cuentaCorreo"]);
            message.To.Add(new MailAddress(destino));
            message.Subject = asunto;
            message.Body = contenido;
            message.Priority = MailPriority.Normal;
            message.IsBodyHtml = true;

            SmtpClient client = new SmtpClient("smtp.office365.com", 587);
            client.Credentials = new System.Net.NetworkCredential(ConfigurationManager.AppSettings["cuentaCorreo"],
                                                                  ConfigurationManager.AppSettings["claveCorreo"]);
            client.EnableSsl = true;
            client.Send(message);
        }
    }
}