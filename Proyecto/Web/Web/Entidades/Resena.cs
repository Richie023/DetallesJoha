﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Web.Entidades
{


    public class ResennaCompuesta {


        public Resena resenna { get; set; } = new Resena();
        //public List<Consulta> listaResennas { get; set; } = new List<Consulta>();
    
    }


    public class Resena
    {
        public int ConsecutivoUsuario { get; set; }
        public int Calificacion { get; set; }
        public string Comentario { get; set; }


    }
    public class ConfirmacionResena
    {
        public int Codigo { get; set; }
        public string Detalle { get; set; }
        public object Datos { get; set; }
        public object Dato { get; set; }
    }
}