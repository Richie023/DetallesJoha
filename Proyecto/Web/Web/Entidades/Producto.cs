﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Web.Entidades
{
    public class Producto
    {
        public long Consecutivo { get; set; }
        public string NombreProducto { get; set; }
        public decimal Precio { get; set; }
        public int Inventario { get; set; }
        public bool Estado { get; set; }
        public string RutaImagen { get; set; }
        public int IdCategoria { get; set; }
        public string NombreCategoria { get; set; }

        public string Material { get; set; }

        public string Tamanio { get; set; }

        public string ColorBase { get; set; }
    }

    public class ConfirmacionProducto
    {
        public int Codigo { get; set; }
        public string Detalle { get; set; }
        public List<Producto> Datos { get; set; }
        public Producto Dato { get; set; }
    }
}