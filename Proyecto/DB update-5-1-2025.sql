USE [master]
GO
/****** Object:  Database [DetallesJoha]    Script Date: 5/1/2025 18:26:11 ******/
CREATE DATABASE [DetallesJoha]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DetallesJoha', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\DetallesJoha.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DetallesJoha_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\DetallesJoha_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [DetallesJoha] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DetallesJoha].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DetallesJoha] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DetallesJoha] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DetallesJoha] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DetallesJoha] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DetallesJoha] SET ARITHABORT OFF 
GO
ALTER DATABASE [DetallesJoha] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DetallesJoha] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DetallesJoha] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DetallesJoha] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DetallesJoha] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DetallesJoha] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DetallesJoha] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DetallesJoha] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DetallesJoha] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DetallesJoha] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DetallesJoha] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DetallesJoha] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DetallesJoha] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DetallesJoha] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DetallesJoha] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DetallesJoha] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DetallesJoha] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DetallesJoha] SET RECOVERY FULL 
GO
ALTER DATABASE [DetallesJoha] SET  MULTI_USER 
GO
ALTER DATABASE [DetallesJoha] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DetallesJoha] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DetallesJoha] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DetallesJoha] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DetallesJoha] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DetallesJoha] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DetallesJoha', N'ON'
GO
ALTER DATABASE [DetallesJoha] SET QUERY_STORE = ON
GO
ALTER DATABASE [DetallesJoha] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [DetallesJoha]
GO
/****** Object:  Table [dbo].[aviso_privacidad]    Script Date: 5/1/2025 18:26:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aviso_privacidad](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[titulo_seccion] [varchar](5000) NOT NULL,
	[contenido] [varchar](max) NOT NULL,
	[ultima_actualizacion] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ayuda]    Script Date: 5/1/2025 18:26:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ayuda](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[categoria] [varchar](5000) NOT NULL,
	[titulo] [varchar](5000) NOT NULL,
	[contenido] [varchar](5000) NOT NULL,
	[imagen_url] [varchar](5000) NULL,
	[ultima_actualizacion] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[blog_articulos]    Script Date: 5/1/2025 18:26:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[blog_articulos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[categoria] [varchar](5000) NOT NULL,
	[titulo] [varchar](5000) NOT NULL,
	[resumen] [varchar](5000) NOT NULL,
	[contenido] [varchar](5000) NOT NULL,
	[imagen_url] [nvarchar](255) NULL,
	[fecha_publicacion] [datetime] NULL,
	[ultima_actualizacion] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[politica_devolucion]    Script Date: 5/1/2025 18:26:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[politica_devolucion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[titulo_seccion] [varchar](5000) NOT NULL,
	[contenido] [varchar](max) NOT NULL,
	[ultima_actualizacion] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PreguntasFrecuentes]    Script Date: 5/1/2025 18:26:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PreguntasFrecuentes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[categoria] [varchar](5000) NOT NULL,
	[pregunta] [varchar](5000) NOT NULL,
	[respuesta] [varchar](5000) NOT NULL,
	[ultima_actualizacion] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tCarrito]    Script Date: 5/1/2025 18:26:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tCarrito](
	[ConsecutivoCarrito] [bigint] IDENTITY(1,1) NOT NULL,
	[ConsecutivoUsuario] [bigint] NOT NULL,
	[ConsecutivoProducto] [bigint] NOT NULL,
	[FechaCarrito] [datetime] NOT NULL,
	[Cantidad] [int] NOT NULL,
 CONSTRAINT [PK_tCarrito] PRIMARY KEY CLUSTERED 
(
	[ConsecutivoCarrito] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tCategoria]    Script Date: 5/1/2025 18:26:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tCategoria](
	[IdCategoria] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](200) NOT NULL,
 CONSTRAINT [PK_tCategorias] PRIMARY KEY CLUSTERED 
(
	[IdCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tDetalle]    Script Date: 5/1/2025 18:26:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tDetalle](
	[ConsecutivoDetalle] [bigint] IDENTITY(1,1) NOT NULL,
	[ConsecutivoMaestro] [bigint] NOT NULL,
	[ConsecutivoProducto] [bigint] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Precio] [decimal](18, 2) NOT NULL,
	[SubTotal] [decimal](18, 2) NOT NULL,
	[Impuestos] [decimal](18, 2) NOT NULL,
	[Total] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_tDetalle] PRIMARY KEY CLUSTERED 
(
	[ConsecutivoDetalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tInformacionEmpresa]    Script Date: 5/1/2025 18:26:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tInformacionEmpresa](
	[ConsecutivoInformacion] [bigint] IDENTITY(1,1) NOT NULL,
	[NombreEmpresa] [varchar](200) NOT NULL,
	[Telefono] [varchar](20) NOT NULL,
	[CorreoElectronico] [varchar](200) NOT NULL,
	[Direccion] [varchar](500) NOT NULL,
	[AcercaDeNosotros] [varchar](200) NULL,
	[Contactanos] [varchar](200) NULL,
	[Politicas] [varchar](200) NULL,
	[OrdenesDevoluciones] [varchar](200) NULL,
	[TerminosCondiciones] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[ConsecutivoInformacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tMaestro]    Script Date: 5/1/2025 18:26:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tMaestro](
	[ConsecutivoMaestro] [bigint] IDENTITY(1,1) NOT NULL,
	[ConsecutivoUsuario] [bigint] NOT NULL,
	[FechaCompra] [datetime] NOT NULL,
	[SubTotal] [decimal](18, 2) NOT NULL,
	[Impuestos] [decimal](18, 2) NOT NULL,
	[Total] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_tMaestro] PRIMARY KEY CLUSTERED 
(
	[ConsecutivoMaestro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tProducto]    Script Date: 5/1/2025 18:26:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tProducto](
	[Consecutivo] [bigint] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](200) NOT NULL,
	[Precio] [decimal](10, 2) NOT NULL,
	[Inventario] [int] NOT NULL,
	[Estado] [bit] NOT NULL,
	[RutaImagen] [varchar](200) NOT NULL,
	[IdCategoria] [int] NOT NULL,
	[Material] [varchar](100) NULL,
	[Tamanio] [varchar](50) NULL,
	[ColorBase] [varchar](50) NULL,
	[Id_Promocion] [int] NULL,
	[Descripcion] [varchar](255) NULL,
 CONSTRAINT [PK_tProducto] PRIMARY KEY CLUSTERED 
(
	[Consecutivo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tPromociones]    Script Date: 5/1/2025 18:26:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tPromociones](
	[Id_promocion] [int] IDENTITY(1,1) NOT NULL,
	[En_promocion] [bit] NOT NULL,
	[Porcentaje_descuento] [int] NOT NULL,
	[Fecha_inicio] [datetime] NOT NULL,
	[Fecha_fin] [datetime] NOT NULL,
	[PrecioConDescuento] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_promocion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tResenna]    Script Date: 5/1/2025 18:26:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tResenna](
	[IdResenna] [bigint] IDENTITY(1,1) NOT NULL,
	[ConsecutivoUsuario] [bigint] NOT NULL,
	[Calificacion] [int] NOT NULL,
	[Comentario] [varchar](500) NULL,
	[FechaResenna] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdResenna] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tRol]    Script Date: 5/1/2025 18:26:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tRol](
	[ConsecutivoRol] [int] IDENTITY(1,1) NOT NULL,
	[NombreRol] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tRol] PRIMARY KEY CLUSTERED 
(
	[ConsecutivoRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tUsuario]    Script Date: 5/1/2025 18:26:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tUsuario](
	[Consecutivo] [bigint] IDENTITY(1,1) NOT NULL,
	[Identificacion] [varchar](20) NOT NULL,
	[Contrasenna] [varchar](10) NOT NULL,
	[Nombre] [varchar](200) NOT NULL,
	[CorreoElectronico] [varchar](200) NOT NULL,
	[Estado] [bit] NOT NULL,
	[Temporal] [bit] NOT NULL,
	[Vencimiento] [datetime] NOT NULL,
	[ConsecutivoRol] [int] NOT NULL,
 CONSTRAINT [PK_tUsuario] PRIMARY KEY CLUSTERED 
(
	[Consecutivo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[aviso_privacidad] ON 

INSERT [dbo].[aviso_privacidad] ([id], [titulo_seccion], [contenido], [ultima_actualizacion]) VALUES (1, N'tt', N'Nos comprometemos a proteger tus datos personales. Este documento explica cómo recopilamos, utilizamos y protegemos tu información. muchas gracias', CAST(N'2025-01-05T17:34:11.477' AS DateTime))
INSERT [dbo].[aviso_privacidad] ([id], [titulo_seccion], [contenido], [ultima_actualizacion]) VALUES (2, N'Responsable del Tratamiento de Datos', N'Nuestra empresa, con domicilio en Cipreses de Oreamuno Cartago, es responsable del tratamiento de tus datos personales y garantiza su protección conforme a las leyes aplicables.', NULL)
INSERT [dbo].[aviso_privacidad] ([id], [titulo_seccion], [contenido], [ultima_actualizacion]) VALUES (3, N'Datos Personales que Recopilamos', N'Recopilamos datos personales como nombre, correo electrónico, dirección de envío, número de teléfono, y detalles de pago, necesarios para procesar tus pedidos y brindar un mejor servicio.', NULL)
INSERT [dbo].[aviso_privacidad] ([id], [titulo_seccion], [contenido], [ultima_actualizacion]) VALUES (4, N'Finalidades del Tratamiento de Datos', N'Tus datos se utilizan para procesar y gestionar tus pedidos, mejorar nuestra atención al cliente, enviarte información promocional relevante y cumplir con nuestras obligaciones legales.', NULL)
INSERT [dbo].[aviso_privacidad] ([id], [titulo_seccion], [contenido], [ultima_actualizacion]) VALUES (5, N'Derechos ARCO', N'Tienes derecho a acceder, rectificar, cancelar y oponerte al uso de tus datos personales. Puedes ejercer estos derechos contactándonos a través de los medios indicados en este documento.', NULL)
INSERT [dbo].[aviso_privacidad] ([id], [titulo_seccion], [contenido], [ultima_actualizacion]) VALUES (6, N'Transferencia de Datos', N'En algunos casos, tus datos personales podrán ser transferidos a terceros, como empresas de logística, siempre bajo estrictos estándares de confidencialidad y seguridad.', NULL)
INSERT [dbo].[aviso_privacidad] ([id], [titulo_seccion], [contenido], [ultima_actualizacion]) VALUES (7, N'Uso de Cookies y Tecnologías de Rastreo', N'Utilizamos cookies para mejorar tu experiencia en nuestro sitio web, analizar patrones de navegación y personalizar contenido. Puedes configurar tu navegador para limitar o bloquear su uso.', NULL)
INSERT [dbo].[aviso_privacidad] ([id], [titulo_seccion], [contenido], [ultima_actualizacion]) VALUES (8, N'Cambios al Aviso de Privacidad', N'Nos reservamos el derecho de realizar cambios a este aviso de privacidad. Las modificaciones estarán disponibles en nuestro sitio web y se notificarán oportunamente.', NULL)
INSERT [dbo].[aviso_privacidad] ([id], [titulo_seccion], [contenido], [ultima_actualizacion]) VALUES (9, N'Contacto', N'Si tienes dudas sobre este aviso de privacidad o el tratamiento de tus datos personales, contáctanos al correo contacto@empresa.com o al teléfono +34 123 456 789.', NULL)
SET IDENTITY_INSERT [dbo].[aviso_privacidad] OFF
GO
SET IDENTITY_INSERT [dbo].[Ayuda] ON 

INSERT [dbo].[Ayuda] ([id], [categoria], [titulo], [contenido], [imagen_url], [ultima_actualizacion]) VALUES (9, N'Introducción al Diseño Personalizado', N'¿Qué es el diseño personalizado para sublimación?', N'El diseño personalizado para sublimación es una técnica innovadora que permite transferir imágenes, gráficos o textos directamente a una amplia variedad de productos mediante el uso de calor y tintas especiales. Este método es ideal para crear artículos únicos, duraderos y de alta calidad, como camisetas, tazas, cojines, fundas de teléfono y mucho más.', NULL, CAST(N'2025-01-05T16:31:04.413' AS DateTime))
INSERT [dbo].[Ayuda] ([id], [categoria], [titulo], [contenido], [imagen_url], [ultima_actualizacion]) VALUES (10, N'Personalización de Productos', N'Cómo Diseñar tu Producto Personalizado Perfecto?', N'Personalizar productos en línea nunca ha sido tan fácil y emocionante. Con nuestra plataforma, puedes transformar tus ideas en realidad con unos pocos clics. Desde camisetas y tazas hasta artículos de decoración, nuestra herramienta de diseño intuitiva te permite seleccionar colores, agregar imágenes, insertar texto y previsualizar tu diseño en tiempo real.', NULL, NULL)
INSERT [dbo].[Ayuda] ([id], [categoria], [titulo], [contenido], [imagen_url], [ultima_actualizacion]) VALUES (11, N'Tipos de Productos Personalizables', N'Descubre la Variedad de Productos que Puedes Personalizar', N'Nuestra plataforma ofrece una amplia gama de productos personalizables para satisfacer todas tus necesidades. Entre las opciones más populares se encuentran:

Ropa Personalizada: Camisetas, sudaderas, gorras y más.
Artículos para el Hogar: Tazas, cojines, mantas y relojes.
Accesorios Personales: Fundas de teléfono, mochilas, y carteras.
Regalos Especiales: Álbumes de fotos, rompecabezas personalizados y calendarios.
Explora cada categoría para encontrar el producto ideal. Cada opción está cuidadosamente seleccionada para garantizar una alta calidad de impresión y durabilidad. Además, puedes combinar múltiples productos para crear un paquete personalizado único.', NULL, NULL)
INSERT [dbo].[Ayuda] ([id], [categoria], [titulo], [contenido], [imagen_url], [ultima_actualizacion]) VALUES (12, N'Guía de Uso de la Herramienta de Diseño', N'Paso a Paso para Crear tu Producto Personalizado', N'Sigue estos pasos sencillos para diseñar el producto de tus sueños:

Elige tu Producto: Navega por nuestras categorías y selecciona el producto que deseas personalizar.
Personaliza: Usa nuestra herramienta de diseño para agregar imágenes, texto y gráficos. Puedes cargar tus propios archivos o usar nuestras plantillas prediseñadas.
Previsualiza: Antes de finalizar, revisa el diseño en la vista previa 3D para asegurarte de que todo esté perfecto.
Finaliza tu Compra: Agrega tu producto al carrito, completa la información de envío y realiza el pago de manera segura.
Recibe tu Producto: Espera la llegada de tu creación personalizada directamente en tu puerta.
', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Ayuda] OFF
GO
SET IDENTITY_INSERT [dbo].[blog_articulos] ON 

INSERT [dbo].[blog_articulos] ([id], [categoria], [titulo], [resumen], [contenido], [imagen_url], [fecha_publicacion], [ultima_actualizacion]) VALUES (1, N'Tutoriales', N'Cómo diseñar tus propias camiseta personalizada', N'Aprende los pasos básicos para crear diseños únicos...', N'En este tutorial te mostramos cómo personalizar camisetas...', NULL, NULL, CAST(N'2024-12-28T20:56:10.610' AS DateTime))
INSERT [dbo].[blog_articulos] ([id], [categoria], [titulo], [resumen], [contenido], [imagen_url], [fecha_publicacion], [ultima_actualizacion]) VALUES (2, N'Tendencias', N'Tendencias en sublimación para 2024', N'Descubre las últimas tendencias en diseños personalizados...', N'La sublimación sigue siendo una técnica popular en 2024...', N'/api/placeholder/400/320', NULL, NULL)
INSERT [dbo].[blog_articulos] ([id], [categoria], [titulo], [resumen], [contenido], [imagen_url], [fecha_publicacion], [ultima_actualizacion]) VALUES (3, N'Ideas', N'Top 10 regalos personalizados más originales', N'Encuentra inspiración para crear regalos únicos y memorables...', N'Desde tazas hasta camisetas personalizadas...', N'/api/placeholder/400/320', NULL, NULL)
SET IDENTITY_INSERT [dbo].[blog_articulos] OFF
GO
SET IDENTITY_INSERT [dbo].[politica_devolucion] ON 

INSERT [dbo].[politica_devolucion] ([id], [titulo_seccion], [contenido], [ultima_actualizacion]) VALUES (19, N'Plazos para Devoluciones', N'1. **Productos Estándar**:\n   - Los clientes tienen un plazo de **30 días naturales** a partir de la fecha de compra para realizar una solicitud de devolución.\n2. **Productos Internacionales**:\n   - Las devoluciones internacionales tienen un plazo extendido de **45 días naturales** desde la recepción del producto.\n3. **Extensión del Plazo en Fiestas**:\n   - Para productos adquiridos durante promociones especiales, como Navidad o Black Friday, el plazo de devolución será ampliado a **60 días naturales**.', CAST(N'2025-01-05T17:34:54.873' AS DateTime))
INSERT [dbo].[politica_devolucion] ([id], [titulo_seccion], [contenido], [ultima_actualizacion]) VALUES (20, N'Exclusiones', N'1. **Productos no elegibles para devolución**:\n   - Artículos personalizados o fabricados bajo pedido específico.\n   - Productos digitales, como software descargable, claves de licencia o contenido multimedia.\n   - Productos íntimos o de higiene personal (por ejemplo, ropa interior, cosméticos abiertos).\n   - Artículos en oferta final o con descuentos superiores al 50%.\n2. **Condiciones no aceptadas**:\n   - Productos que hayan sido usados, lavados, alterados o dañados por el cliente.\n   - Falta de embalaje original, etiquetas o accesorios incluidos.', NULL)
INSERT [dbo].[politica_devolucion] ([id], [titulo_seccion], [contenido], [ultima_actualizacion]) VALUES (21, N'Reembolsos', N'1. **Método de Reembolso**:\n   - Los reembolsos serán procesados utilizando el mismo método de pago utilizado en la compra original.\n   - En el caso de pagos contra reembolso, el reembolso será emitido como crédito en tienda o transferencia bancaria.\n2. **Tiempo de Procesamiento**:\n   - Una vez aprobada la solicitud de devolución, el reembolso será procesado dentro de los **7 a 14 días hábiles**.\n3. **Costos no Reembolsables**:\n   - Los costos de envío original no serán reembolsados, salvo que el producto devuelto sea defectuoso o incorrecto.\n4. **Notificaciones**:\n   - Recibirá un correo electrónico confirmando que el reembolso ha sido procesado exitosamente.', NULL)
INSERT [dbo].[politica_devolucion] ([id], [titulo_seccion], [contenido], [ultima_actualizacion]) VALUES (22, N'Cambios de Producto', N'1. **Condiciones para Cambios**:\n   - Solo se aceptan cambios por el mismo modelo en un color o talla diferente.\n   - Para cambios de un modelo diferente, se requerirá procesar una devolución y realizar una nueva compra.\n2. **Disponibilidad de Stock**:\n   - Los cambios están sujetos a la disponibilidad del producto solicitado.\n3. **Tiempo de Procesamiento**:\n   - Los cambios serán procesados dentro de los **10 días hábiles** después de recibir el producto devuelto.', NULL)
INSERT [dbo].[politica_devolucion] ([id], [titulo_seccion], [contenido], [ultima_actualizacion]) VALUES (23, N'Proceso de Devolución', N'1. **Inicio de la Solicitud**:\n   - Complete el formulario de devolución disponible en nuestro sitio web o contáctenos a través de correo electrónico o teléfono.\n2. **Preparación del Producto**:\n   - Empaque el producto de forma segura utilizando su embalaje original e incluya el comprobante de compra.\n3. **Dirección de Envío**:\n   - Envíe el producto a la dirección proporcionada por nuestro equipo de atención al cliente.\n4. **Seguimiento**:\n   - Le recomendamos utilizar un servicio de envío con número de seguimiento para garantizar la llegada del paquete.\n5. **Confirmación de Recepción**:\n   - Una vez recibido el producto, se revisará su estado y se le notificará el resultado del proceso.', CAST(N'2025-01-05T15:03:22.240' AS DateTime))
SET IDENTITY_INSERT [dbo].[politica_devolucion] OFF
GO
SET IDENTITY_INSERT [dbo].[PreguntasFrecuentes] ON 

INSERT [dbo].[PreguntasFrecuentes] ([id], [categoria], [pregunta], [respuesta], [ultima_actualizacion]) VALUES (1, N'Pedidos y Envíos', N'¿Cuál es el tiempo de entrega estándar_?', N'El tiempo de entrega estándar es de 5-7 días hábiles. Incluye 2-3 días para producción y personalización, y 3-4 días para envío nacional. Para pedidos urgentes, contamos con opciones de envío express con costo adicional.', NULL)
INSERT [dbo].[PreguntasFrecuentes] ([id], [categoria], [pregunta], [respuesta], [ultima_actualizacion]) VALUES (2, N'Pedidos y Envíos', N'¿Cómo puedo rastrear mi pedido?', N'Una vez que tu pedido sea enviado, recibirás un correo electrónico con el número de seguimiento, un enlace para rastrear en tiempo real y la información de la paquetería.', NULL)
INSERT [dbo].[PreguntasFrecuentes] ([id], [categoria], [pregunta], [respuesta], [ultima_actualizacion]) VALUES (3, N'Diseños y Personalización', N'¿Qué formato de archivo debo usar para mis diseños?', N'Aceptamos los siguientes formatos: JPG/JPEG (alta resolución), PNG (preferentemente con fondo transparente), PDF vectorial y AI (Adobe Illustrator). Recomendamos una resolución mínima de 200 MB para mejores resultados.', CAST(N'2024-12-29T18:28:24.800' AS DateTime))
INSERT [dbo].[PreguntasFrecuentes] ([id], [categoria], [pregunta], [respuesta], [ultima_actualizacion]) VALUES (4, N'Diseños y Personalización', N'¿Pueden ayudarme a diseñar mi producto?', N'Sí, ofrecemos servicios de diseño profesional, que incluyen diseño desde cero, mejora de diseños existentes, adaptación de logos y asesoría en diseño. Contacta a nuestro equipo de diseño para más detalles y costos.', NULL)
INSERT [dbo].[PreguntasFrecuentes] ([id], [categoria], [pregunta], [respuesta], [ultima_actualizacion]) VALUES (5, N'Pagos', N'¿Qué métodos de pago aceptan?', N'Aceptamos tarjetas de crédito o débito, PayPal, transferencia bancaria y depósito en efectivo. Todos nuestros métodos de pago son seguros y están respaldados por certificados SSL.', NULL)
INSERT [dbo].[PreguntasFrecuentes] ([id], [categoria], [pregunta], [respuesta], [ultima_actualizacion]) VALUES (6, N'Pagos', N'¿Ofrecen facturación?', N'Sí, emitimos facturas para todas las compras. Solicítala al momento de tu compra, proporciona tus datos fiscales y recibirás tu factura por correo electrónico. El plazo máximo para solicitar factura es de 5 días después de la compra.', NULL)
SET IDENTITY_INSERT [dbo].[PreguntasFrecuentes] OFF
GO
SET IDENTITY_INSERT [dbo].[tCarrito] ON 

INSERT [dbo].[tCarrito] ([ConsecutivoCarrito], [ConsecutivoUsuario], [ConsecutivoProducto], [FechaCarrito], [Cantidad]) VALUES (129, 2, 10002, CAST(N'2024-12-16T18:49:46.610' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[tCarrito] OFF
GO
SET IDENTITY_INSERT [dbo].[tCategoria] ON 

INSERT [dbo].[tCategoria] ([IdCategoria], [Nombre]) VALUES (1, N'Ropa de niño')
INSERT [dbo].[tCategoria] ([IdCategoria], [Nombre]) VALUES (2, N'Ropa de niña')
INSERT [dbo].[tCategoria] ([IdCategoria], [Nombre]) VALUES (3, N'Ropa de hombre')
INSERT [dbo].[tCategoria] ([IdCategoria], [Nombre]) VALUES (4, N'Ropa de mujer')
INSERT [dbo].[tCategoria] ([IdCategoria], [Nombre]) VALUES (5, N'Sin asignar')
INSERT [dbo].[tCategoria] ([IdCategoria], [Nombre]) VALUES (6, N'Tazas')
INSERT [dbo].[tCategoria] ([IdCategoria], [Nombre]) VALUES (7, N'Sin asignar')
INSERT [dbo].[tCategoria] ([IdCategoria], [Nombre]) VALUES (8, N'Mousepads')
INSERT [dbo].[tCategoria] ([IdCategoria], [Nombre]) VALUES (9, N'Cojines')
INSERT [dbo].[tCategoria] ([IdCategoria], [Nombre]) VALUES (10, N'Llaveros')
INSERT [dbo].[tCategoria] ([IdCategoria], [Nombre]) VALUES (11, N'Botellas térmicas')
INSERT [dbo].[tCategoria] ([IdCategoria], [Nombre]) VALUES (12, N'Fundas de teléfono')
INSERT [dbo].[tCategoria] ([IdCategoria], [Nombre]) VALUES (13, N'Platos decorativos')
INSERT [dbo].[tCategoria] ([IdCategoria], [Nombre]) VALUES (14, N'Almohadas')
INSERT [dbo].[tCategoria] ([IdCategoria], [Nombre]) VALUES (1002, N'Grabados')
INSERT [dbo].[tCategoria] ([IdCategoria], [Nombre]) VALUES (1003, N'Grabados')
INSERT [dbo].[tCategoria] ([IdCategoria], [Nombre]) VALUES (1004, N'Bordado')
INSERT [dbo].[tCategoria] ([IdCategoria], [Nombre]) VALUES (1005, N'troquel')
INSERT [dbo].[tCategoria] ([IdCategoria], [Nombre]) VALUES (1006, N'Texturizado')
INSERT [dbo].[tCategoria] ([IdCategoria], [Nombre]) VALUES (1007, N'Gorras')
SET IDENTITY_INSERT [dbo].[tCategoria] OFF
GO
SET IDENTITY_INSERT [dbo].[tDetalle] ON 

INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (1, 1, 3, 5, CAST(16000.00 AS Decimal(18, 2)), CAST(80000.00 AS Decimal(18, 2)), CAST(10400.00 AS Decimal(18, 2)), CAST(90400.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (2, 2, 3, 4, CAST(16000.00 AS Decimal(18, 2)), CAST(64000.00 AS Decimal(18, 2)), CAST(8320.00 AS Decimal(18, 2)), CAST(72320.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (3, 3, 2, 1, CAST(16000.00 AS Decimal(18, 2)), CAST(16000.00 AS Decimal(18, 2)), CAST(2080.00 AS Decimal(18, 2)), CAST(18080.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (4, 4, 3, 1, CAST(16000.00 AS Decimal(18, 2)), CAST(16000.00 AS Decimal(18, 2)), CAST(2080.00 AS Decimal(18, 2)), CAST(18080.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (5, 5, 3, 1, CAST(16000.00 AS Decimal(18, 2)), CAST(16000.00 AS Decimal(18, 2)), CAST(2080.00 AS Decimal(18, 2)), CAST(18080.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (6, 6, 1, 1, CAST(25000.00 AS Decimal(18, 2)), CAST(25000.00 AS Decimal(18, 2)), CAST(3250.00 AS Decimal(18, 2)), CAST(28250.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (7, 6, 2, 1, CAST(16000.00 AS Decimal(18, 2)), CAST(16000.00 AS Decimal(18, 2)), CAST(2080.00 AS Decimal(18, 2)), CAST(18080.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (8, 7, 3, 1, CAST(16000.00 AS Decimal(18, 2)), CAST(16000.00 AS Decimal(18, 2)), CAST(2080.00 AS Decimal(18, 2)), CAST(18080.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (9, 7, 2, 1, CAST(16000.00 AS Decimal(18, 2)), CAST(16000.00 AS Decimal(18, 2)), CAST(2080.00 AS Decimal(18, 2)), CAST(18080.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (10, 7, 1, 1, CAST(25000.00 AS Decimal(18, 2)), CAST(25000.00 AS Decimal(18, 2)), CAST(3250.00 AS Decimal(18, 2)), CAST(28250.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (11, 8, 3, 1, CAST(16000.00 AS Decimal(18, 2)), CAST(16000.00 AS Decimal(18, 2)), CAST(2080.00 AS Decimal(18, 2)), CAST(18080.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (12, 9, 3, 2, CAST(16000.00 AS Decimal(18, 2)), CAST(32000.00 AS Decimal(18, 2)), CAST(4160.00 AS Decimal(18, 2)), CAST(36160.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (13, 10, 3, 1, CAST(16000.00 AS Decimal(18, 2)), CAST(16000.00 AS Decimal(18, 2)), CAST(2080.00 AS Decimal(18, 2)), CAST(18080.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (14, 11, 1, 4, CAST(25000.00 AS Decimal(18, 2)), CAST(100000.00 AS Decimal(18, 2)), CAST(13000.00 AS Decimal(18, 2)), CAST(113000.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (15, 12, 3, 1, CAST(16000.00 AS Decimal(18, 2)), CAST(16000.00 AS Decimal(18, 2)), CAST(2080.00 AS Decimal(18, 2)), CAST(18080.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (16, 13, 3, 1, CAST(16000.00 AS Decimal(18, 2)), CAST(16000.00 AS Decimal(18, 2)), CAST(2080.00 AS Decimal(18, 2)), CAST(18080.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (17, 14, 1, 1, CAST(25000.00 AS Decimal(18, 2)), CAST(25000.00 AS Decimal(18, 2)), CAST(3250.00 AS Decimal(18, 2)), CAST(28250.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (18, 15, 1, 1, CAST(25000.00 AS Decimal(18, 2)), CAST(25000.00 AS Decimal(18, 2)), CAST(3250.00 AS Decimal(18, 2)), CAST(28250.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (19, 16, 3, 1, CAST(16000.00 AS Decimal(18, 2)), CAST(16000.00 AS Decimal(18, 2)), CAST(2080.00 AS Decimal(18, 2)), CAST(18080.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (20, 17, 3, 1, CAST(16000.00 AS Decimal(18, 2)), CAST(16000.00 AS Decimal(18, 2)), CAST(2080.00 AS Decimal(18, 2)), CAST(18080.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (21, 18, 1, 1, CAST(25000.00 AS Decimal(18, 2)), CAST(25000.00 AS Decimal(18, 2)), CAST(3250.00 AS Decimal(18, 2)), CAST(28250.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (22, 19, 1, 1, CAST(25000.00 AS Decimal(18, 2)), CAST(25000.00 AS Decimal(18, 2)), CAST(3250.00 AS Decimal(18, 2)), CAST(28250.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (23, 20, 1, 1, CAST(25000.00 AS Decimal(18, 2)), CAST(25000.00 AS Decimal(18, 2)), CAST(3250.00 AS Decimal(18, 2)), CAST(28250.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (24, 21, 1, 1, CAST(25000.00 AS Decimal(18, 2)), CAST(25000.00 AS Decimal(18, 2)), CAST(3250.00 AS Decimal(18, 2)), CAST(28250.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (25, 22, 3, 1, CAST(16000.00 AS Decimal(18, 2)), CAST(16000.00 AS Decimal(18, 2)), CAST(2080.00 AS Decimal(18, 2)), CAST(18080.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (26, 23, 3, 1, CAST(16000.00 AS Decimal(18, 2)), CAST(16000.00 AS Decimal(18, 2)), CAST(2080.00 AS Decimal(18, 2)), CAST(18080.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (27, 24, 3, 1, CAST(16000.00 AS Decimal(18, 2)), CAST(16000.00 AS Decimal(18, 2)), CAST(2080.00 AS Decimal(18, 2)), CAST(18080.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (28, 25, 1, 1, CAST(25000.00 AS Decimal(18, 2)), CAST(25000.00 AS Decimal(18, 2)), CAST(3250.00 AS Decimal(18, 2)), CAST(28250.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (29, 26, 3, 1, CAST(16000.00 AS Decimal(18, 2)), CAST(16000.00 AS Decimal(18, 2)), CAST(2080.00 AS Decimal(18, 2)), CAST(18080.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (30, 27, 1, 1, CAST(25000.00 AS Decimal(18, 2)), CAST(25000.00 AS Decimal(18, 2)), CAST(3250.00 AS Decimal(18, 2)), CAST(28250.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (31, 28, 1, 1, CAST(25000.00 AS Decimal(18, 2)), CAST(25000.00 AS Decimal(18, 2)), CAST(3250.00 AS Decimal(18, 2)), CAST(28250.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (32, 29, 3, 1, CAST(16000.00 AS Decimal(18, 2)), CAST(16000.00 AS Decimal(18, 2)), CAST(2080.00 AS Decimal(18, 2)), CAST(18080.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (33, 30, 1, 1, CAST(25000.00 AS Decimal(18, 2)), CAST(25000.00 AS Decimal(18, 2)), CAST(3250.00 AS Decimal(18, 2)), CAST(28250.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (34, 31, 1, 3, CAST(25000.00 AS Decimal(18, 2)), CAST(75000.00 AS Decimal(18, 2)), CAST(9750.00 AS Decimal(18, 2)), CAST(84750.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (35, 32, 3, 1, CAST(16000.00 AS Decimal(18, 2)), CAST(16000.00 AS Decimal(18, 2)), CAST(2080.00 AS Decimal(18, 2)), CAST(18080.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (36, 33, 3, 1, CAST(16000.00 AS Decimal(18, 2)), CAST(16000.00 AS Decimal(18, 2)), CAST(2080.00 AS Decimal(18, 2)), CAST(18080.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (37, 34, 3, 1, CAST(16000.00 AS Decimal(18, 2)), CAST(16000.00 AS Decimal(18, 2)), CAST(2080.00 AS Decimal(18, 2)), CAST(18080.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (38, 35, 3, 1, CAST(16000.00 AS Decimal(18, 2)), CAST(16000.00 AS Decimal(18, 2)), CAST(2080.00 AS Decimal(18, 2)), CAST(18080.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (39, 36, 1, 1, CAST(25000.00 AS Decimal(18, 2)), CAST(25000.00 AS Decimal(18, 2)), CAST(3250.00 AS Decimal(18, 2)), CAST(28250.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (40, 37, 1, 1, CAST(25000.00 AS Decimal(18, 2)), CAST(25000.00 AS Decimal(18, 2)), CAST(3250.00 AS Decimal(18, 2)), CAST(28250.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (41, 38, 3, 1, CAST(16000.00 AS Decimal(18, 2)), CAST(16000.00 AS Decimal(18, 2)), CAST(2080.00 AS Decimal(18, 2)), CAST(18080.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (42, 38, 1, 1, CAST(25000.00 AS Decimal(18, 2)), CAST(25000.00 AS Decimal(18, 2)), CAST(3250.00 AS Decimal(18, 2)), CAST(28250.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (43, 39, 3, 1, CAST(16000.00 AS Decimal(18, 2)), CAST(16000.00 AS Decimal(18, 2)), CAST(2080.00 AS Decimal(18, 2)), CAST(18080.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (44, 39, 1, 1, CAST(25000.00 AS Decimal(18, 2)), CAST(25000.00 AS Decimal(18, 2)), CAST(3250.00 AS Decimal(18, 2)), CAST(28250.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (45, 40, 3, 1, CAST(16000.00 AS Decimal(18, 2)), CAST(16000.00 AS Decimal(18, 2)), CAST(2080.00 AS Decimal(18, 2)), CAST(18080.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (46, 41, 1, 1, CAST(25000.00 AS Decimal(18, 2)), CAST(25000.00 AS Decimal(18, 2)), CAST(3250.00 AS Decimal(18, 2)), CAST(28250.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (47, 42, 1, 1, CAST(25000.00 AS Decimal(18, 2)), CAST(25000.00 AS Decimal(18, 2)), CAST(3250.00 AS Decimal(18, 2)), CAST(28250.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (48, 43, 1, 1, CAST(25000.00 AS Decimal(18, 2)), CAST(25000.00 AS Decimal(18, 2)), CAST(3250.00 AS Decimal(18, 2)), CAST(28250.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (49, 44, 3, 1, CAST(16000.00 AS Decimal(18, 2)), CAST(16000.00 AS Decimal(18, 2)), CAST(2080.00 AS Decimal(18, 2)), CAST(18080.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (50, 45, 1, 1, CAST(25000.00 AS Decimal(18, 2)), CAST(25000.00 AS Decimal(18, 2)), CAST(3250.00 AS Decimal(18, 2)), CAST(28250.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (51, 46, 1, 1, CAST(25000.00 AS Decimal(18, 2)), CAST(25000.00 AS Decimal(18, 2)), CAST(3250.00 AS Decimal(18, 2)), CAST(28250.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (52, 47, 3, 1, CAST(16000.00 AS Decimal(18, 2)), CAST(16000.00 AS Decimal(18, 2)), CAST(2080.00 AS Decimal(18, 2)), CAST(18080.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (53, 48, 3, 1, CAST(16000.00 AS Decimal(18, 2)), CAST(16000.00 AS Decimal(18, 2)), CAST(2080.00 AS Decimal(18, 2)), CAST(18080.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (54, 48, 1, 1, CAST(25000.00 AS Decimal(18, 2)), CAST(25000.00 AS Decimal(18, 2)), CAST(3250.00 AS Decimal(18, 2)), CAST(28250.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (55, 49, 3, 1, CAST(16000.00 AS Decimal(18, 2)), CAST(16000.00 AS Decimal(18, 2)), CAST(2080.00 AS Decimal(18, 2)), CAST(18080.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (56, 49, 1, 1, CAST(25000.00 AS Decimal(18, 2)), CAST(25000.00 AS Decimal(18, 2)), CAST(3250.00 AS Decimal(18, 2)), CAST(28250.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (57, 50, 3, 1, CAST(16000.00 AS Decimal(18, 2)), CAST(16000.00 AS Decimal(18, 2)), CAST(2080.00 AS Decimal(18, 2)), CAST(18080.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (58, 50, 1, 1, CAST(25000.00 AS Decimal(18, 2)), CAST(25000.00 AS Decimal(18, 2)), CAST(3250.00 AS Decimal(18, 2)), CAST(28250.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (59, 51, 3, 1, CAST(16000.00 AS Decimal(18, 2)), CAST(16000.00 AS Decimal(18, 2)), CAST(2080.00 AS Decimal(18, 2)), CAST(18080.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (60, 51, 1, 1, CAST(25000.00 AS Decimal(18, 2)), CAST(25000.00 AS Decimal(18, 2)), CAST(3250.00 AS Decimal(18, 2)), CAST(28250.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (61, 52, 3, 1, CAST(16000.00 AS Decimal(18, 2)), CAST(16000.00 AS Decimal(18, 2)), CAST(2080.00 AS Decimal(18, 2)), CAST(18080.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (62, 52, 1, 1, CAST(25000.00 AS Decimal(18, 2)), CAST(25000.00 AS Decimal(18, 2)), CAST(3250.00 AS Decimal(18, 2)), CAST(28250.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (63, 53, 3, 1, CAST(16000.00 AS Decimal(18, 2)), CAST(16000.00 AS Decimal(18, 2)), CAST(2080.00 AS Decimal(18, 2)), CAST(18080.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (64, 53, 1, 1, CAST(25000.00 AS Decimal(18, 2)), CAST(25000.00 AS Decimal(18, 2)), CAST(3250.00 AS Decimal(18, 2)), CAST(28250.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (65, 54, 3, 1, CAST(16000.00 AS Decimal(18, 2)), CAST(16000.00 AS Decimal(18, 2)), CAST(2080.00 AS Decimal(18, 2)), CAST(18080.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (66, 54, 1, 1, CAST(25000.00 AS Decimal(18, 2)), CAST(25000.00 AS Decimal(18, 2)), CAST(3250.00 AS Decimal(18, 2)), CAST(28250.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (67, 55, 3, 1, CAST(16000.00 AS Decimal(18, 2)), CAST(16000.00 AS Decimal(18, 2)), CAST(2080.00 AS Decimal(18, 2)), CAST(18080.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (68, 55, 1, 1, CAST(25000.00 AS Decimal(18, 2)), CAST(25000.00 AS Decimal(18, 2)), CAST(3250.00 AS Decimal(18, 2)), CAST(28250.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (69, 56, 3, 1, CAST(16000.00 AS Decimal(18, 2)), CAST(16000.00 AS Decimal(18, 2)), CAST(2080.00 AS Decimal(18, 2)), CAST(18080.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (70, 56, 1, 1, CAST(25000.00 AS Decimal(18, 2)), CAST(25000.00 AS Decimal(18, 2)), CAST(3250.00 AS Decimal(18, 2)), CAST(28250.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (71, 57, 3, 1, CAST(16000.00 AS Decimal(18, 2)), CAST(16000.00 AS Decimal(18, 2)), CAST(2080.00 AS Decimal(18, 2)), CAST(18080.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (72, 57, 1, 1, CAST(25000.00 AS Decimal(18, 2)), CAST(25000.00 AS Decimal(18, 2)), CAST(3250.00 AS Decimal(18, 2)), CAST(28250.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (73, 58, 3, 1, CAST(16000.00 AS Decimal(18, 2)), CAST(16000.00 AS Decimal(18, 2)), CAST(2080.00 AS Decimal(18, 2)), CAST(18080.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (74, 58, 1, 1, CAST(25000.00 AS Decimal(18, 2)), CAST(25000.00 AS Decimal(18, 2)), CAST(3250.00 AS Decimal(18, 2)), CAST(28250.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (75, 59, 3, 1, CAST(16000.00 AS Decimal(18, 2)), CAST(16000.00 AS Decimal(18, 2)), CAST(2080.00 AS Decimal(18, 2)), CAST(18080.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (76, 59, 1, 1, CAST(25000.00 AS Decimal(18, 2)), CAST(25000.00 AS Decimal(18, 2)), CAST(3250.00 AS Decimal(18, 2)), CAST(28250.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (77, 60, 3, 1, CAST(16000.00 AS Decimal(18, 2)), CAST(16000.00 AS Decimal(18, 2)), CAST(2080.00 AS Decimal(18, 2)), CAST(18080.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (78, 60, 1, 1, CAST(25000.00 AS Decimal(18, 2)), CAST(25000.00 AS Decimal(18, 2)), CAST(3250.00 AS Decimal(18, 2)), CAST(28250.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (79, 61, 3, 1, CAST(16000.00 AS Decimal(18, 2)), CAST(16000.00 AS Decimal(18, 2)), CAST(2080.00 AS Decimal(18, 2)), CAST(18080.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (80, 61, 2, 1, CAST(16000.00 AS Decimal(18, 2)), CAST(16000.00 AS Decimal(18, 2)), CAST(2080.00 AS Decimal(18, 2)), CAST(18080.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (81, 61, 1, 1, CAST(25000.00 AS Decimal(18, 2)), CAST(25000.00 AS Decimal(18, 2)), CAST(3250.00 AS Decimal(18, 2)), CAST(28250.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (82, 62, 2, 1, CAST(16000.00 AS Decimal(18, 2)), CAST(16000.00 AS Decimal(18, 2)), CAST(2080.00 AS Decimal(18, 2)), CAST(18080.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (83, 63, 2, 1, CAST(16000.00 AS Decimal(18, 2)), CAST(16000.00 AS Decimal(18, 2)), CAST(2080.00 AS Decimal(18, 2)), CAST(18080.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (84, 64, 2, 1, CAST(16000.00 AS Decimal(18, 2)), CAST(16000.00 AS Decimal(18, 2)), CAST(2080.00 AS Decimal(18, 2)), CAST(18080.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (85, 65, 2, 1, CAST(16000.00 AS Decimal(18, 2)), CAST(16000.00 AS Decimal(18, 2)), CAST(2080.00 AS Decimal(18, 2)), CAST(18080.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (86, 66, 2, 1, CAST(16000.00 AS Decimal(18, 2)), CAST(16000.00 AS Decimal(18, 2)), CAST(2080.00 AS Decimal(18, 2)), CAST(18080.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (87, 67, 3, 1, CAST(16000.00 AS Decimal(18, 2)), CAST(16000.00 AS Decimal(18, 2)), CAST(2080.00 AS Decimal(18, 2)), CAST(18080.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (88, 68, 3, 1, CAST(16000.00 AS Decimal(18, 2)), CAST(16000.00 AS Decimal(18, 2)), CAST(2080.00 AS Decimal(18, 2)), CAST(18080.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (89, 69, 3, 1, CAST(16000.00 AS Decimal(18, 2)), CAST(16000.00 AS Decimal(18, 2)), CAST(2080.00 AS Decimal(18, 2)), CAST(18080.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (90, 70, 3, 1, CAST(16000.00 AS Decimal(18, 2)), CAST(16000.00 AS Decimal(18, 2)), CAST(2080.00 AS Decimal(18, 2)), CAST(18080.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (91, 71, 1, 1, CAST(25000.00 AS Decimal(18, 2)), CAST(25000.00 AS Decimal(18, 2)), CAST(3250.00 AS Decimal(18, 2)), CAST(28250.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (92, 72, 2, 1, CAST(16000.00 AS Decimal(18, 2)), CAST(16000.00 AS Decimal(18, 2)), CAST(2080.00 AS Decimal(18, 2)), CAST(18080.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (93, 73, 2, 1, CAST(16000.00 AS Decimal(18, 2)), CAST(16000.00 AS Decimal(18, 2)), CAST(2080.00 AS Decimal(18, 2)), CAST(18080.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (94, 74, 2, 1, CAST(16000.00 AS Decimal(18, 2)), CAST(16000.00 AS Decimal(18, 2)), CAST(2080.00 AS Decimal(18, 2)), CAST(18080.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (95, 74, 3, 1, CAST(16000.00 AS Decimal(18, 2)), CAST(16000.00 AS Decimal(18, 2)), CAST(2080.00 AS Decimal(18, 2)), CAST(18080.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (96, 74, 1, 1, CAST(25000.00 AS Decimal(18, 2)), CAST(25000.00 AS Decimal(18, 2)), CAST(3250.00 AS Decimal(18, 2)), CAST(28250.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (97, 75, 3, 1, CAST(16000.00 AS Decimal(18, 2)), CAST(16000.00 AS Decimal(18, 2)), CAST(2080.00 AS Decimal(18, 2)), CAST(18080.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (98, 75, 2, 2, CAST(16000.00 AS Decimal(18, 2)), CAST(32000.00 AS Decimal(18, 2)), CAST(4160.00 AS Decimal(18, 2)), CAST(36160.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (99, 75, 1, 2, CAST(25000.00 AS Decimal(18, 2)), CAST(50000.00 AS Decimal(18, 2)), CAST(6500.00 AS Decimal(18, 2)), CAST(56500.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (100, 76, 2, 2, CAST(16000.00 AS Decimal(18, 2)), CAST(32000.00 AS Decimal(18, 2)), CAST(4160.00 AS Decimal(18, 2)), CAST(36160.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (101, 77, 3, 2, CAST(16000.00 AS Decimal(18, 2)), CAST(32000.00 AS Decimal(18, 2)), CAST(4160.00 AS Decimal(18, 2)), CAST(36160.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (102, 77, 2, 1, CAST(16000.00 AS Decimal(18, 2)), CAST(16000.00 AS Decimal(18, 2)), CAST(2080.00 AS Decimal(18, 2)), CAST(18080.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (103, 77, 1, 1, CAST(25000.00 AS Decimal(18, 2)), CAST(25000.00 AS Decimal(18, 2)), CAST(3250.00 AS Decimal(18, 2)), CAST(28250.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (104, 78, 3, 2, CAST(16000.00 AS Decimal(18, 2)), CAST(32000.00 AS Decimal(18, 2)), CAST(4160.00 AS Decimal(18, 2)), CAST(36160.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (105, 78, 2, 1, CAST(16000.00 AS Decimal(18, 2)), CAST(16000.00 AS Decimal(18, 2)), CAST(2080.00 AS Decimal(18, 2)), CAST(18080.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (106, 78, 1, 1, CAST(25000.00 AS Decimal(18, 2)), CAST(25000.00 AS Decimal(18, 2)), CAST(3250.00 AS Decimal(18, 2)), CAST(28250.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (107, 79, 1, 2, CAST(25000.00 AS Decimal(18, 2)), CAST(50000.00 AS Decimal(18, 2)), CAST(6500.00 AS Decimal(18, 2)), CAST(56500.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (108, 79, 2, 1, CAST(16000.00 AS Decimal(18, 2)), CAST(16000.00 AS Decimal(18, 2)), CAST(2080.00 AS Decimal(18, 2)), CAST(18080.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (109, 79, 3, 1, CAST(16000.00 AS Decimal(18, 2)), CAST(16000.00 AS Decimal(18, 2)), CAST(2080.00 AS Decimal(18, 2)), CAST(18080.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (110, 80, 1, 2, CAST(25000.00 AS Decimal(18, 2)), CAST(50000.00 AS Decimal(18, 2)), CAST(6500.00 AS Decimal(18, 2)), CAST(56500.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (111, 80, 2, 2, CAST(16000.00 AS Decimal(18, 2)), CAST(32000.00 AS Decimal(18, 2)), CAST(4160.00 AS Decimal(18, 2)), CAST(36160.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (112, 80, 3, 1, CAST(16000.00 AS Decimal(18, 2)), CAST(16000.00 AS Decimal(18, 2)), CAST(2080.00 AS Decimal(18, 2)), CAST(18080.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (113, 81, 3, 1, CAST(16000.00 AS Decimal(18, 2)), CAST(16000.00 AS Decimal(18, 2)), CAST(2080.00 AS Decimal(18, 2)), CAST(18080.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (114, 81, 2, 1, CAST(16000.00 AS Decimal(18, 2)), CAST(16000.00 AS Decimal(18, 2)), CAST(2080.00 AS Decimal(18, 2)), CAST(18080.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (115, 81, 1, 1, CAST(25000.00 AS Decimal(18, 2)), CAST(25000.00 AS Decimal(18, 2)), CAST(3250.00 AS Decimal(18, 2)), CAST(28250.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (116, 82, 1, 1, CAST(25000.00 AS Decimal(18, 2)), CAST(25000.00 AS Decimal(18, 2)), CAST(3250.00 AS Decimal(18, 2)), CAST(28250.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (117, 83, 1, 1, CAST(25000.00 AS Decimal(18, 2)), CAST(25000.00 AS Decimal(18, 2)), CAST(3250.00 AS Decimal(18, 2)), CAST(28250.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (118, 84, 1, 1, CAST(25000.00 AS Decimal(18, 2)), CAST(25000.00 AS Decimal(18, 2)), CAST(3250.00 AS Decimal(18, 2)), CAST(28250.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (119, 85, 1, 1, CAST(25000.00 AS Decimal(18, 2)), CAST(25000.00 AS Decimal(18, 2)), CAST(3250.00 AS Decimal(18, 2)), CAST(28250.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (120, 86, 1, 1, CAST(5000.00 AS Decimal(18, 2)), CAST(5000.00 AS Decimal(18, 2)), CAST(650.00 AS Decimal(18, 2)), CAST(5650.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[tDetalle] OFF
GO
SET IDENTITY_INSERT [dbo].[tInformacionEmpresa] ON 

INSERT [dbo].[tInformacionEmpresa] ([ConsecutivoInformacion], [NombreEmpresa], [Telefono], [CorreoElectronico], [Direccion], [AcercaDeNosotros], [Contactanos], [Politicas], [OrdenesDevoluciones], [TerminosCondiciones]) VALUES (1, N'84177454', N'leonaap36@gmail.com', N'pavas rhormoser , 100 mts y 75 mts del super boulevard', N'dadas', N'asdad', N'sadsada', N'112730030', N'asdasdas', N'asdasda')
SET IDENTITY_INSERT [dbo].[tInformacionEmpresa] OFF
GO
SET IDENTITY_INSERT [dbo].[tMaestro] ON 

INSERT [dbo].[tMaestro] ([ConsecutivoMaestro], [ConsecutivoUsuario], [FechaCompra], [SubTotal], [Impuestos], [Total]) VALUES (1, 2, CAST(N'2024-10-02T01:20:15.423' AS DateTime), CAST(80000.00 AS Decimal(18, 2)), CAST(10400.00 AS Decimal(18, 2)), CAST(90400.00 AS Decimal(18, 2)))
INSERT [dbo].[tMaestro] ([ConsecutivoMaestro], [ConsecutivoUsuario], [FechaCompra], [SubTotal], [Impuestos], [Total]) VALUES (2, 2, CAST(N'2024-10-02T15:27:43.723' AS DateTime), CAST(64000.00 AS Decimal(18, 2)), CAST(8320.00 AS Decimal(18, 2)), CAST(72320.00 AS Decimal(18, 2)))
INSERT [dbo].[tMaestro] ([ConsecutivoMaestro], [ConsecutivoUsuario], [FechaCompra], [SubTotal], [Impuestos], [Total]) VALUES (3, 2, CAST(N'2024-10-02T16:30:23.897' AS DateTime), CAST(16000.00 AS Decimal(18, 2)), CAST(2080.00 AS Decimal(18, 2)), CAST(18080.00 AS Decimal(18, 2)))
INSERT [dbo].[tMaestro] ([ConsecutivoMaestro], [ConsecutivoUsuario], [FechaCompra], [SubTotal], [Impuestos], [Total]) VALUES (4, 1, CAST(N'2024-10-02T16:32:45.180' AS DateTime), CAST(16000.00 AS Decimal(18, 2)), CAST(2080.00 AS Decimal(18, 2)), CAST(18080.00 AS Decimal(18, 2)))
INSERT [dbo].[tMaestro] ([ConsecutivoMaestro], [ConsecutivoUsuario], [FechaCompra], [SubTotal], [Impuestos], [Total]) VALUES (5, 2, CAST(N'2024-10-02T18:47:49.877' AS DateTime), CAST(16000.00 AS Decimal(18, 2)), CAST(2080.00 AS Decimal(18, 2)), CAST(18080.00 AS Decimal(18, 2)))
INSERT [dbo].[tMaestro] ([ConsecutivoMaestro], [ConsecutivoUsuario], [FechaCompra], [SubTotal], [Impuestos], [Total]) VALUES (6, 2, CAST(N'2024-10-09T22:16:59.260' AS DateTime), CAST(41000.00 AS Decimal(18, 2)), CAST(5330.00 AS Decimal(18, 2)), CAST(46330.00 AS Decimal(18, 2)))
INSERT [dbo].[tMaestro] ([ConsecutivoMaestro], [ConsecutivoUsuario], [FechaCompra], [SubTotal], [Impuestos], [Total]) VALUES (7, 2, CAST(N'2024-10-09T22:25:42.003' AS DateTime), CAST(57000.00 AS Decimal(18, 2)), CAST(7410.00 AS Decimal(18, 2)), CAST(64410.00 AS Decimal(18, 2)))
INSERT [dbo].[tMaestro] ([ConsecutivoMaestro], [ConsecutivoUsuario], [FechaCompra], [SubTotal], [Impuestos], [Total]) VALUES (8, 2, CAST(N'2024-09-09T22:31:09.270' AS DateTime), CAST(16000.00 AS Decimal(18, 2)), CAST(2080.00 AS Decimal(18, 2)), CAST(18080.00 AS Decimal(18, 2)))
INSERT [dbo].[tMaestro] ([ConsecutivoMaestro], [ConsecutivoUsuario], [FechaCompra], [SubTotal], [Impuestos], [Total]) VALUES (9, 2, CAST(N'2024-09-09T22:32:04.287' AS DateTime), CAST(32000.00 AS Decimal(18, 2)), CAST(4160.00 AS Decimal(18, 2)), CAST(36160.00 AS Decimal(18, 2)))
INSERT [dbo].[tMaestro] ([ConsecutivoMaestro], [ConsecutivoUsuario], [FechaCompra], [SubTotal], [Impuestos], [Total]) VALUES (10, 2, CAST(N'2024-09-09T22:33:59.163' AS DateTime), CAST(16000.00 AS Decimal(18, 2)), CAST(2080.00 AS Decimal(18, 2)), CAST(18080.00 AS Decimal(18, 2)))
INSERT [dbo].[tMaestro] ([ConsecutivoMaestro], [ConsecutivoUsuario], [FechaCompra], [SubTotal], [Impuestos], [Total]) VALUES (11, 2, CAST(N'2024-09-09T22:42:07.770' AS DateTime), CAST(100000.00 AS Decimal(18, 2)), CAST(13000.00 AS Decimal(18, 2)), CAST(113000.00 AS Decimal(18, 2)))
INSERT [dbo].[tMaestro] ([ConsecutivoMaestro], [ConsecutivoUsuario], [FechaCompra], [SubTotal], [Impuestos], [Total]) VALUES (12, 2, CAST(N'2024-08-09T22:58:55.550' AS DateTime), CAST(16000.00 AS Decimal(18, 2)), CAST(2080.00 AS Decimal(18, 2)), CAST(18080.00 AS Decimal(18, 2)))
INSERT [dbo].[tMaestro] ([ConsecutivoMaestro], [ConsecutivoUsuario], [FechaCompra], [SubTotal], [Impuestos], [Total]) VALUES (13, 2, CAST(N'2024-08-09T23:08:11.517' AS DateTime), CAST(16000.00 AS Decimal(18, 2)), CAST(2080.00 AS Decimal(18, 2)), CAST(18080.00 AS Decimal(18, 2)))
INSERT [dbo].[tMaestro] ([ConsecutivoMaestro], [ConsecutivoUsuario], [FechaCompra], [SubTotal], [Impuestos], [Total]) VALUES (14, 2, CAST(N'2024-08-09T23:13:53.303' AS DateTime), CAST(25000.00 AS Decimal(18, 2)), CAST(3250.00 AS Decimal(18, 2)), CAST(28250.00 AS Decimal(18, 2)))
INSERT [dbo].[tMaestro] ([ConsecutivoMaestro], [ConsecutivoUsuario], [FechaCompra], [SubTotal], [Impuestos], [Total]) VALUES (15, 2, CAST(N'2024-08-09T23:21:35.450' AS DateTime), CAST(25000.00 AS Decimal(18, 2)), CAST(3250.00 AS Decimal(18, 2)), CAST(28250.00 AS Decimal(18, 2)))
INSERT [dbo].[tMaestro] ([ConsecutivoMaestro], [ConsecutivoUsuario], [FechaCompra], [SubTotal], [Impuestos], [Total]) VALUES (16, 2, CAST(N'2024-08-09T23:28:58.870' AS DateTime), CAST(16000.00 AS Decimal(18, 2)), CAST(2080.00 AS Decimal(18, 2)), CAST(18080.00 AS Decimal(18, 2)))
INSERT [dbo].[tMaestro] ([ConsecutivoMaestro], [ConsecutivoUsuario], [FechaCompra], [SubTotal], [Impuestos], [Total]) VALUES (17, 2, CAST(N'2024-08-09T23:31:21.137' AS DateTime), CAST(16000.00 AS Decimal(18, 2)), CAST(2080.00 AS Decimal(18, 2)), CAST(18080.00 AS Decimal(18, 2)))
INSERT [dbo].[tMaestro] ([ConsecutivoMaestro], [ConsecutivoUsuario], [FechaCompra], [SubTotal], [Impuestos], [Total]) VALUES (18, 2, CAST(N'2024-08-10T16:51:26.590' AS DateTime), CAST(25000.00 AS Decimal(18, 2)), CAST(3250.00 AS Decimal(18, 2)), CAST(28250.00 AS Decimal(18, 2)))
INSERT [dbo].[tMaestro] ([ConsecutivoMaestro], [ConsecutivoUsuario], [FechaCompra], [SubTotal], [Impuestos], [Total]) VALUES (19, 2, CAST(N'2024-08-10T18:31:59.960' AS DateTime), CAST(25000.00 AS Decimal(18, 2)), CAST(3250.00 AS Decimal(18, 2)), CAST(28250.00 AS Decimal(18, 2)))
INSERT [dbo].[tMaestro] ([ConsecutivoMaestro], [ConsecutivoUsuario], [FechaCompra], [SubTotal], [Impuestos], [Total]) VALUES (20, 2, CAST(N'2024-08-10T18:33:49.580' AS DateTime), CAST(25000.00 AS Decimal(18, 2)), CAST(3250.00 AS Decimal(18, 2)), CAST(28250.00 AS Decimal(18, 2)))
INSERT [dbo].[tMaestro] ([ConsecutivoMaestro], [ConsecutivoUsuario], [FechaCompra], [SubTotal], [Impuestos], [Total]) VALUES (21, 2, CAST(N'2024-08-10T18:35:02.370' AS DateTime), CAST(25000.00 AS Decimal(18, 2)), CAST(3250.00 AS Decimal(18, 2)), CAST(28250.00 AS Decimal(18, 2)))
INSERT [dbo].[tMaestro] ([ConsecutivoMaestro], [ConsecutivoUsuario], [FechaCompra], [SubTotal], [Impuestos], [Total]) VALUES (22, 2, CAST(N'2024-08-10T18:36:01.780' AS DateTime), CAST(16000.00 AS Decimal(18, 2)), CAST(2080.00 AS Decimal(18, 2)), CAST(18080.00 AS Decimal(18, 2)))
INSERT [dbo].[tMaestro] ([ConsecutivoMaestro], [ConsecutivoUsuario], [FechaCompra], [SubTotal], [Impuestos], [Total]) VALUES (23, 2, CAST(N'2024-08-10T20:31:22.550' AS DateTime), CAST(16000.00 AS Decimal(18, 2)), CAST(2080.00 AS Decimal(18, 2)), CAST(18080.00 AS Decimal(18, 2)))
INSERT [dbo].[tMaestro] ([ConsecutivoMaestro], [ConsecutivoUsuario], [FechaCompra], [SubTotal], [Impuestos], [Total]) VALUES (24, 2, CAST(N'2024-08-10T20:32:45.857' AS DateTime), CAST(16000.00 AS Decimal(18, 2)), CAST(2080.00 AS Decimal(18, 2)), CAST(18080.00 AS Decimal(18, 2)))
INSERT [dbo].[tMaestro] ([ConsecutivoMaestro], [ConsecutivoUsuario], [FechaCompra], [SubTotal], [Impuestos], [Total]) VALUES (25, 2, CAST(N'2024-08-10T21:07:19.340' AS DateTime), CAST(25000.00 AS Decimal(18, 2)), CAST(3250.00 AS Decimal(18, 2)), CAST(28250.00 AS Decimal(18, 2)))
INSERT [dbo].[tMaestro] ([ConsecutivoMaestro], [ConsecutivoUsuario], [FechaCompra], [SubTotal], [Impuestos], [Total]) VALUES (26, 2, CAST(N'2024-08-10T21:11:45.633' AS DateTime), CAST(16000.00 AS Decimal(18, 2)), CAST(2080.00 AS Decimal(18, 2)), CAST(18080.00 AS Decimal(18, 2)))
INSERT [dbo].[tMaestro] ([ConsecutivoMaestro], [ConsecutivoUsuario], [FechaCompra], [SubTotal], [Impuestos], [Total]) VALUES (27, 2, CAST(N'2024-08-11T00:22:37.960' AS DateTime), CAST(25000.00 AS Decimal(18, 2)), CAST(3250.00 AS Decimal(18, 2)), CAST(28250.00 AS Decimal(18, 2)))
INSERT [dbo].[tMaestro] ([ConsecutivoMaestro], [ConsecutivoUsuario], [FechaCompra], [SubTotal], [Impuestos], [Total]) VALUES (28, 2, CAST(N'2024-08-11T00:27:04.053' AS DateTime), CAST(25000.00 AS Decimal(18, 2)), CAST(3250.00 AS Decimal(18, 2)), CAST(28250.00 AS Decimal(18, 2)))
INSERT [dbo].[tMaestro] ([ConsecutivoMaestro], [ConsecutivoUsuario], [FechaCompra], [SubTotal], [Impuestos], [Total]) VALUES (29, 2, CAST(N'2024-08-11T01:06:04.967' AS DateTime), CAST(16000.00 AS Decimal(18, 2)), CAST(2080.00 AS Decimal(18, 2)), CAST(18080.00 AS Decimal(18, 2)))
INSERT [dbo].[tMaestro] ([ConsecutivoMaestro], [ConsecutivoUsuario], [FechaCompra], [SubTotal], [Impuestos], [Total]) VALUES (30, 2, CAST(N'2024-08-11T01:23:22.347' AS DateTime), CAST(25000.00 AS Decimal(18, 2)), CAST(3250.00 AS Decimal(18, 2)), CAST(28250.00 AS Decimal(18, 2)))
INSERT [dbo].[tMaestro] ([ConsecutivoMaestro], [ConsecutivoUsuario], [FechaCompra], [SubTotal], [Impuestos], [Total]) VALUES (31, 2, CAST(N'2024-08-11T11:02:46.750' AS DateTime), CAST(75000.00 AS Decimal(18, 2)), CAST(9750.00 AS Decimal(18, 2)), CAST(84750.00 AS Decimal(18, 2)))
INSERT [dbo].[tMaestro] ([ConsecutivoMaestro], [ConsecutivoUsuario], [FechaCompra], [SubTotal], [Impuestos], [Total]) VALUES (32, 2, CAST(N'2024-08-11T11:34:53.580' AS DateTime), CAST(16000.00 AS Decimal(18, 2)), CAST(2080.00 AS Decimal(18, 2)), CAST(18080.00 AS Decimal(18, 2)))
INSERT [dbo].[tMaestro] ([ConsecutivoMaestro], [ConsecutivoUsuario], [FechaCompra], [SubTotal], [Impuestos], [Total]) VALUES (33, 2, CAST(N'2024-08-11T11:40:39.690' AS DateTime), CAST(16000.00 AS Decimal(18, 2)), CAST(2080.00 AS Decimal(18, 2)), CAST(18080.00 AS Decimal(18, 2)))
INSERT [dbo].[tMaestro] ([ConsecutivoMaestro], [ConsecutivoUsuario], [FechaCompra], [SubTotal], [Impuestos], [Total]) VALUES (34, 2, CAST(N'2024-08-11T11:57:45.083' AS DateTime), CAST(16000.00 AS Decimal(18, 2)), CAST(2080.00 AS Decimal(18, 2)), CAST(18080.00 AS Decimal(18, 2)))
INSERT [dbo].[tMaestro] ([ConsecutivoMaestro], [ConsecutivoUsuario], [FechaCompra], [SubTotal], [Impuestos], [Total]) VALUES (35, 2, CAST(N'2024-08-11T12:01:23.757' AS DateTime), CAST(16000.00 AS Decimal(18, 2)), CAST(2080.00 AS Decimal(18, 2)), CAST(18080.00 AS Decimal(18, 2)))
INSERT [dbo].[tMaestro] ([ConsecutivoMaestro], [ConsecutivoUsuario], [FechaCompra], [SubTotal], [Impuestos], [Total]) VALUES (36, 2, CAST(N'2024-08-11T12:04:04.123' AS DateTime), CAST(25000.00 AS Decimal(18, 2)), CAST(3250.00 AS Decimal(18, 2)), CAST(28250.00 AS Decimal(18, 2)))
INSERT [dbo].[tMaestro] ([ConsecutivoMaestro], [ConsecutivoUsuario], [FechaCompra], [SubTotal], [Impuestos], [Total]) VALUES (37, 2, CAST(N'2024-08-11T12:09:35.457' AS DateTime), CAST(25000.00 AS Decimal(18, 2)), CAST(3250.00 AS Decimal(18, 2)), CAST(28250.00 AS Decimal(18, 2)))
INSERT [dbo].[tMaestro] ([ConsecutivoMaestro], [ConsecutivoUsuario], [FechaCompra], [SubTotal], [Impuestos], [Total]) VALUES (38, 2, CAST(N'2024-08-11T12:10:33.320' AS DateTime), CAST(41000.00 AS Decimal(18, 2)), CAST(5330.00 AS Decimal(18, 2)), CAST(46330.00 AS Decimal(18, 2)))
INSERT [dbo].[tMaestro] ([ConsecutivoMaestro], [ConsecutivoUsuario], [FechaCompra], [SubTotal], [Impuestos], [Total]) VALUES (39, 2, CAST(N'2024-08-11T12:14:11.313' AS DateTime), CAST(41000.00 AS Decimal(18, 2)), CAST(5330.00 AS Decimal(18, 2)), CAST(46330.00 AS Decimal(18, 2)))
INSERT [dbo].[tMaestro] ([ConsecutivoMaestro], [ConsecutivoUsuario], [FechaCompra], [SubTotal], [Impuestos], [Total]) VALUES (40, 2, CAST(N'2024-08-11T12:24:58.103' AS DateTime), CAST(16000.00 AS Decimal(18, 2)), CAST(2080.00 AS Decimal(18, 2)), CAST(18080.00 AS Decimal(18, 2)))
INSERT [dbo].[tMaestro] ([ConsecutivoMaestro], [ConsecutivoUsuario], [FechaCompra], [SubTotal], [Impuestos], [Total]) VALUES (41, 2, CAST(N'2024-12-11T12:25:57.040' AS DateTime), CAST(25000.00 AS Decimal(18, 2)), CAST(3250.00 AS Decimal(18, 2)), CAST(28250.00 AS Decimal(18, 2)))
INSERT [dbo].[tMaestro] ([ConsecutivoMaestro], [ConsecutivoUsuario], [FechaCompra], [SubTotal], [Impuestos], [Total]) VALUES (42, 2, CAST(N'2024-12-11T12:26:44.010' AS DateTime), CAST(25000.00 AS Decimal(18, 2)), CAST(3250.00 AS Decimal(18, 2)), CAST(28250.00 AS Decimal(18, 2)))
INSERT [dbo].[tMaestro] ([ConsecutivoMaestro], [ConsecutivoUsuario], [FechaCompra], [SubTotal], [Impuestos], [Total]) VALUES (43, 2, CAST(N'2024-12-11T12:29:04.740' AS DateTime), CAST(25000.00 AS Decimal(18, 2)), CAST(3250.00 AS Decimal(18, 2)), CAST(28250.00 AS Decimal(18, 2)))
INSERT [dbo].[tMaestro] ([ConsecutivoMaestro], [ConsecutivoUsuario], [FechaCompra], [SubTotal], [Impuestos], [Total]) VALUES (44, 2, CAST(N'2024-12-11T12:29:51.820' AS DateTime), CAST(16000.00 AS Decimal(18, 2)), CAST(2080.00 AS Decimal(18, 2)), CAST(18080.00 AS Decimal(18, 2)))
INSERT [dbo].[tMaestro] ([ConsecutivoMaestro], [ConsecutivoUsuario], [FechaCompra], [SubTotal], [Impuestos], [Total]) VALUES (45, 2, CAST(N'2024-12-11T12:36:03.947' AS DateTime), CAST(25000.00 AS Decimal(18, 2)), CAST(3250.00 AS Decimal(18, 2)), CAST(28250.00 AS Decimal(18, 2)))
INSERT [dbo].[tMaestro] ([ConsecutivoMaestro], [ConsecutivoUsuario], [FechaCompra], [SubTotal], [Impuestos], [Total]) VALUES (46, 2, CAST(N'2024-12-11T12:46:08.683' AS DateTime), CAST(25000.00 AS Decimal(18, 2)), CAST(3250.00 AS Decimal(18, 2)), CAST(28250.00 AS Decimal(18, 2)))
INSERT [dbo].[tMaestro] ([ConsecutivoMaestro], [ConsecutivoUsuario], [FechaCompra], [SubTotal], [Impuestos], [Total]) VALUES (47, 2, CAST(N'2024-12-11T12:50:55.527' AS DateTime), CAST(16000.00 AS Decimal(18, 2)), CAST(2080.00 AS Decimal(18, 2)), CAST(18080.00 AS Decimal(18, 2)))
INSERT [dbo].[tMaestro] ([ConsecutivoMaestro], [ConsecutivoUsuario], [FechaCompra], [SubTotal], [Impuestos], [Total]) VALUES (48, 2, CAST(N'2024-12-15T15:32:31.320' AS DateTime), CAST(41000.00 AS Decimal(18, 2)), CAST(5330.00 AS Decimal(18, 2)), CAST(46330.00 AS Decimal(18, 2)))
INSERT [dbo].[tMaestro] ([ConsecutivoMaestro], [ConsecutivoUsuario], [FechaCompra], [SubTotal], [Impuestos], [Total]) VALUES (49, 2, CAST(N'2024-12-15T15:37:35.730' AS DateTime), CAST(41000.00 AS Decimal(18, 2)), CAST(5330.00 AS Decimal(18, 2)), CAST(46330.00 AS Decimal(18, 2)))
INSERT [dbo].[tMaestro] ([ConsecutivoMaestro], [ConsecutivoUsuario], [FechaCompra], [SubTotal], [Impuestos], [Total]) VALUES (50, 2, CAST(N'2024-12-15T16:47:54.213' AS DateTime), CAST(41000.00 AS Decimal(18, 2)), CAST(5330.00 AS Decimal(18, 2)), CAST(46330.00 AS Decimal(18, 2)))
INSERT [dbo].[tMaestro] ([ConsecutivoMaestro], [ConsecutivoUsuario], [FechaCompra], [SubTotal], [Impuestos], [Total]) VALUES (51, 2, CAST(N'2024-12-15T16:49:14.870' AS DateTime), CAST(41000.00 AS Decimal(18, 2)), CAST(5330.00 AS Decimal(18, 2)), CAST(46330.00 AS Decimal(18, 2)))
INSERT [dbo].[tMaestro] ([ConsecutivoMaestro], [ConsecutivoUsuario], [FechaCompra], [SubTotal], [Impuestos], [Total]) VALUES (52, 2, CAST(N'2024-12-15T16:50:50.700' AS DateTime), CAST(41000.00 AS Decimal(18, 2)), CAST(5330.00 AS Decimal(18, 2)), CAST(46330.00 AS Decimal(18, 2)))
INSERT [dbo].[tMaestro] ([ConsecutivoMaestro], [ConsecutivoUsuario], [FechaCompra], [SubTotal], [Impuestos], [Total]) VALUES (53, 2, CAST(N'2024-12-15T16:53:23.233' AS DateTime), CAST(41000.00 AS Decimal(18, 2)), CAST(5330.00 AS Decimal(18, 2)), CAST(46330.00 AS Decimal(18, 2)))
INSERT [dbo].[tMaestro] ([ConsecutivoMaestro], [ConsecutivoUsuario], [FechaCompra], [SubTotal], [Impuestos], [Total]) VALUES (54, 2, CAST(N'2024-12-15T16:57:20.667' AS DateTime), CAST(41000.00 AS Decimal(18, 2)), CAST(5330.00 AS Decimal(18, 2)), CAST(46330.00 AS Decimal(18, 2)))
INSERT [dbo].[tMaestro] ([ConsecutivoMaestro], [ConsecutivoUsuario], [FechaCompra], [SubTotal], [Impuestos], [Total]) VALUES (55, 2, CAST(N'2024-12-15T18:03:55.660' AS DateTime), CAST(41000.00 AS Decimal(18, 2)), CAST(5330.00 AS Decimal(18, 2)), CAST(46330.00 AS Decimal(18, 2)))
INSERT [dbo].[tMaestro] ([ConsecutivoMaestro], [ConsecutivoUsuario], [FechaCompra], [SubTotal], [Impuestos], [Total]) VALUES (56, 2, CAST(N'2024-12-15T18:11:07.930' AS DateTime), CAST(41000.00 AS Decimal(18, 2)), CAST(5330.00 AS Decimal(18, 2)), CAST(46330.00 AS Decimal(18, 2)))
INSERT [dbo].[tMaestro] ([ConsecutivoMaestro], [ConsecutivoUsuario], [FechaCompra], [SubTotal], [Impuestos], [Total]) VALUES (57, 2, CAST(N'2024-12-15T18:12:40.590' AS DateTime), CAST(41000.00 AS Decimal(18, 2)), CAST(5330.00 AS Decimal(18, 2)), CAST(46330.00 AS Decimal(18, 2)))
INSERT [dbo].[tMaestro] ([ConsecutivoMaestro], [ConsecutivoUsuario], [FechaCompra], [SubTotal], [Impuestos], [Total]) VALUES (58, 2, CAST(N'2024-12-15T18:14:33.300' AS DateTime), CAST(41000.00 AS Decimal(18, 2)), CAST(5330.00 AS Decimal(18, 2)), CAST(46330.00 AS Decimal(18, 2)))
INSERT [dbo].[tMaestro] ([ConsecutivoMaestro], [ConsecutivoUsuario], [FechaCompra], [SubTotal], [Impuestos], [Total]) VALUES (59, 2, CAST(N'2024-12-16T15:14:31.367' AS DateTime), CAST(41000.00 AS Decimal(18, 2)), CAST(5330.00 AS Decimal(18, 2)), CAST(46330.00 AS Decimal(18, 2)))
INSERT [dbo].[tMaestro] ([ConsecutivoMaestro], [ConsecutivoUsuario], [FechaCompra], [SubTotal], [Impuestos], [Total]) VALUES (60, 2, CAST(N'2024-12-16T15:17:08.497' AS DateTime), CAST(41000.00 AS Decimal(18, 2)), CAST(5330.00 AS Decimal(18, 2)), CAST(46330.00 AS Decimal(18, 2)))
INSERT [dbo].[tMaestro] ([ConsecutivoMaestro], [ConsecutivoUsuario], [FechaCompra], [SubTotal], [Impuestos], [Total]) VALUES (61, 2, CAST(N'2024-12-16T15:28:03.923' AS DateTime), CAST(57000.00 AS Decimal(18, 2)), CAST(7410.00 AS Decimal(18, 2)), CAST(64410.00 AS Decimal(18, 2)))
INSERT [dbo].[tMaestro] ([ConsecutivoMaestro], [ConsecutivoUsuario], [FechaCompra], [SubTotal], [Impuestos], [Total]) VALUES (62, 2, CAST(N'2024-12-16T15:29:54.453' AS DateTime), CAST(16000.00 AS Decimal(18, 2)), CAST(2080.00 AS Decimal(18, 2)), CAST(18080.00 AS Decimal(18, 2)))
INSERT [dbo].[tMaestro] ([ConsecutivoMaestro], [ConsecutivoUsuario], [FechaCompra], [SubTotal], [Impuestos], [Total]) VALUES (63, 2, CAST(N'2024-12-16T15:31:29.047' AS DateTime), CAST(16000.00 AS Decimal(18, 2)), CAST(2080.00 AS Decimal(18, 2)), CAST(18080.00 AS Decimal(18, 2)))
INSERT [dbo].[tMaestro] ([ConsecutivoMaestro], [ConsecutivoUsuario], [FechaCompra], [SubTotal], [Impuestos], [Total]) VALUES (64, 2, CAST(N'2024-12-16T15:34:56.523' AS DateTime), CAST(16000.00 AS Decimal(18, 2)), CAST(2080.00 AS Decimal(18, 2)), CAST(18080.00 AS Decimal(18, 2)))
INSERT [dbo].[tMaestro] ([ConsecutivoMaestro], [ConsecutivoUsuario], [FechaCompra], [SubTotal], [Impuestos], [Total]) VALUES (65, 2, CAST(N'2024-12-16T15:37:21.457' AS DateTime), CAST(16000.00 AS Decimal(18, 2)), CAST(2080.00 AS Decimal(18, 2)), CAST(18080.00 AS Decimal(18, 2)))
INSERT [dbo].[tMaestro] ([ConsecutivoMaestro], [ConsecutivoUsuario], [FechaCompra], [SubTotal], [Impuestos], [Total]) VALUES (66, 2, CAST(N'2024-12-16T15:39:25.010' AS DateTime), CAST(16000.00 AS Decimal(18, 2)), CAST(2080.00 AS Decimal(18, 2)), CAST(18080.00 AS Decimal(18, 2)))
INSERT [dbo].[tMaestro] ([ConsecutivoMaestro], [ConsecutivoUsuario], [FechaCompra], [SubTotal], [Impuestos], [Total]) VALUES (67, 2, CAST(N'2024-12-16T15:40:58.423' AS DateTime), CAST(16000.00 AS Decimal(18, 2)), CAST(2080.00 AS Decimal(18, 2)), CAST(18080.00 AS Decimal(18, 2)))
INSERT [dbo].[tMaestro] ([ConsecutivoMaestro], [ConsecutivoUsuario], [FechaCompra], [SubTotal], [Impuestos], [Total]) VALUES (68, 2, CAST(N'2024-12-16T15:41:49.833' AS DateTime), CAST(16000.00 AS Decimal(18, 2)), CAST(2080.00 AS Decimal(18, 2)), CAST(18080.00 AS Decimal(18, 2)))
INSERT [dbo].[tMaestro] ([ConsecutivoMaestro], [ConsecutivoUsuario], [FechaCompra], [SubTotal], [Impuestos], [Total]) VALUES (69, 2, CAST(N'2024-12-16T15:44:51.410' AS DateTime), CAST(16000.00 AS Decimal(18, 2)), CAST(2080.00 AS Decimal(18, 2)), CAST(18080.00 AS Decimal(18, 2)))
INSERT [dbo].[tMaestro] ([ConsecutivoMaestro], [ConsecutivoUsuario], [FechaCompra], [SubTotal], [Impuestos], [Total]) VALUES (70, 2, CAST(N'2024-12-16T15:46:00.107' AS DateTime), CAST(16000.00 AS Decimal(18, 2)), CAST(2080.00 AS Decimal(18, 2)), CAST(18080.00 AS Decimal(18, 2)))
INSERT [dbo].[tMaestro] ([ConsecutivoMaestro], [ConsecutivoUsuario], [FechaCompra], [SubTotal], [Impuestos], [Total]) VALUES (71, 2, CAST(N'2024-12-16T15:47:09.133' AS DateTime), CAST(25000.00 AS Decimal(18, 2)), CAST(3250.00 AS Decimal(18, 2)), CAST(28250.00 AS Decimal(18, 2)))
INSERT [dbo].[tMaestro] ([ConsecutivoMaestro], [ConsecutivoUsuario], [FechaCompra], [SubTotal], [Impuestos], [Total]) VALUES (72, 2, CAST(N'2024-12-16T15:48:02.697' AS DateTime), CAST(16000.00 AS Decimal(18, 2)), CAST(2080.00 AS Decimal(18, 2)), CAST(18080.00 AS Decimal(18, 2)))
INSERT [dbo].[tMaestro] ([ConsecutivoMaestro], [ConsecutivoUsuario], [FechaCompra], [SubTotal], [Impuestos], [Total]) VALUES (73, 2, CAST(N'2024-12-16T15:48:40.807' AS DateTime), CAST(16000.00 AS Decimal(18, 2)), CAST(2080.00 AS Decimal(18, 2)), CAST(18080.00 AS Decimal(18, 2)))
INSERT [dbo].[tMaestro] ([ConsecutivoMaestro], [ConsecutivoUsuario], [FechaCompra], [SubTotal], [Impuestos], [Total]) VALUES (74, 2, CAST(N'2024-12-16T16:02:09.773' AS DateTime), CAST(57000.00 AS Decimal(18, 2)), CAST(7410.00 AS Decimal(18, 2)), CAST(64410.00 AS Decimal(18, 2)))
INSERT [dbo].[tMaestro] ([ConsecutivoMaestro], [ConsecutivoUsuario], [FechaCompra], [SubTotal], [Impuestos], [Total]) VALUES (75, 2, CAST(N'2024-12-16T16:03:39.053' AS DateTime), CAST(98000.00 AS Decimal(18, 2)), CAST(12740.00 AS Decimal(18, 2)), CAST(110740.00 AS Decimal(18, 2)))
INSERT [dbo].[tMaestro] ([ConsecutivoMaestro], [ConsecutivoUsuario], [FechaCompra], [SubTotal], [Impuestos], [Total]) VALUES (76, 2, CAST(N'2024-12-16T16:07:16.277' AS DateTime), CAST(32000.00 AS Decimal(18, 2)), CAST(4160.00 AS Decimal(18, 2)), CAST(36160.00 AS Decimal(18, 2)))
INSERT [dbo].[tMaestro] ([ConsecutivoMaestro], [ConsecutivoUsuario], [FechaCompra], [SubTotal], [Impuestos], [Total]) VALUES (77, 2, CAST(N'2024-12-16T16:14:34.407' AS DateTime), CAST(73000.00 AS Decimal(18, 2)), CAST(9490.00 AS Decimal(18, 2)), CAST(82490.00 AS Decimal(18, 2)))
INSERT [dbo].[tMaestro] ([ConsecutivoMaestro], [ConsecutivoUsuario], [FechaCompra], [SubTotal], [Impuestos], [Total]) VALUES (78, 2, CAST(N'2024-12-16T16:18:21.940' AS DateTime), CAST(73000.00 AS Decimal(18, 2)), CAST(9490.00 AS Decimal(18, 2)), CAST(82490.00 AS Decimal(18, 2)))
INSERT [dbo].[tMaestro] ([ConsecutivoMaestro], [ConsecutivoUsuario], [FechaCompra], [SubTotal], [Impuestos], [Total]) VALUES (79, 2, CAST(N'2024-12-16T16:19:59.823' AS DateTime), CAST(82000.00 AS Decimal(18, 2)), CAST(10660.00 AS Decimal(18, 2)), CAST(92660.00 AS Decimal(18, 2)))
INSERT [dbo].[tMaestro] ([ConsecutivoMaestro], [ConsecutivoUsuario], [FechaCompra], [SubTotal], [Impuestos], [Total]) VALUES (80, 2, CAST(N'2024-12-16T16:20:50.027' AS DateTime), CAST(98000.00 AS Decimal(18, 2)), CAST(12740.00 AS Decimal(18, 2)), CAST(110740.00 AS Decimal(18, 2)))
INSERT [dbo].[tMaestro] ([ConsecutivoMaestro], [ConsecutivoUsuario], [FechaCompra], [SubTotal], [Impuestos], [Total]) VALUES (81, 2, CAST(N'2024-12-16T16:22:30.693' AS DateTime), CAST(57000.00 AS Decimal(18, 2)), CAST(7410.00 AS Decimal(18, 2)), CAST(64410.00 AS Decimal(18, 2)))
INSERT [dbo].[tMaestro] ([ConsecutivoMaestro], [ConsecutivoUsuario], [FechaCompra], [SubTotal], [Impuestos], [Total]) VALUES (82, 2, CAST(N'2024-12-16T16:27:33.313' AS DateTime), CAST(25000.00 AS Decimal(18, 2)), CAST(3250.00 AS Decimal(18, 2)), CAST(28250.00 AS Decimal(18, 2)))
INSERT [dbo].[tMaestro] ([ConsecutivoMaestro], [ConsecutivoUsuario], [FechaCompra], [SubTotal], [Impuestos], [Total]) VALUES (83, 2, CAST(N'2024-12-16T16:28:32.010' AS DateTime), CAST(25000.00 AS Decimal(18, 2)), CAST(3250.00 AS Decimal(18, 2)), CAST(28250.00 AS Decimal(18, 2)))
INSERT [dbo].[tMaestro] ([ConsecutivoMaestro], [ConsecutivoUsuario], [FechaCompra], [SubTotal], [Impuestos], [Total]) VALUES (84, 2, CAST(N'2024-12-16T16:30:41.620' AS DateTime), CAST(25000.00 AS Decimal(18, 2)), CAST(3250.00 AS Decimal(18, 2)), CAST(28250.00 AS Decimal(18, 2)))
INSERT [dbo].[tMaestro] ([ConsecutivoMaestro], [ConsecutivoUsuario], [FechaCompra], [SubTotal], [Impuestos], [Total]) VALUES (85, 2, CAST(N'2024-12-16T16:31:43.630' AS DateTime), CAST(25000.00 AS Decimal(18, 2)), CAST(3250.00 AS Decimal(18, 2)), CAST(28250.00 AS Decimal(18, 2)))
INSERT [dbo].[tMaestro] ([ConsecutivoMaestro], [ConsecutivoUsuario], [FechaCompra], [SubTotal], [Impuestos], [Total]) VALUES (86, 2, CAST(N'2024-12-16T18:46:33.920' AS DateTime), CAST(5000.00 AS Decimal(18, 2)), CAST(650.00 AS Decimal(18, 2)), CAST(5650.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[tMaestro] OFF
GO
SET IDENTITY_INSERT [dbo].[tProducto] ON 

INSERT [dbo].[tProducto] ([Consecutivo], [Nombre], [Precio], [Inventario], [Estado], [RutaImagen], [IdCategoria], [Material], [Tamanio], [ColorBase], [Id_Promocion], [Descripcion]) VALUES (1, N'Mouse Pad', CAST(5000.00 AS Decimal(10, 2)), 499, 1, N'/Imagenes/1.jpg', 8, N'aluminio', N'¨Pequeño', N'#ffffff', NULL, NULL)
INSERT [dbo].[tProducto] ([Consecutivo], [Nombre], [Precio], [Inventario], [Estado], [RutaImagen], [IdCategoria], [Material], [Tamanio], [ColorBase], [Id_Promocion], [Descripcion]) VALUES (2, N'Botella', CAST(16000.00 AS Decimal(10, 2)), 81, 1, N'/Imagenes/2.jpg', 11, N'acero inoxidable', N'Grande', N'#000000', NULL, NULL)
INSERT [dbo].[tProducto] ([Consecutivo], [Nombre], [Precio], [Inventario], [Estado], [RutaImagen], [IdCategoria], [Material], [Tamanio], [ColorBase], [Id_Promocion], [Descripcion]) VALUES (3, N'Taza', CAST(16000.00 AS Decimal(10, 2)), 39, 1, N'/Imagenes/3.jpg', 6, N'acero inoxidable', N'Mediano', N'#ed1d1d', NULL, NULL)
INSERT [dbo].[tProducto] ([Consecutivo], [Nombre], [Precio], [Inventario], [Estado], [RutaImagen], [IdCategoria], [Material], [Tamanio], [ColorBase], [Id_Promocion], [Descripcion]) VALUES (10002, N'Gorra', CAST(15000.00 AS Decimal(10, 2)), 100, 1, N'/Imagenes/10002.jpg', 1007, N'Tela', N'S', N'#000000', NULL, N'Garra talla S, Color Negro.')
SET IDENTITY_INSERT [dbo].[tProducto] OFF
GO
SET IDENTITY_INSERT [dbo].[tResenna] ON 

INSERT [dbo].[tResenna] ([IdResenna], [ConsecutivoUsuario], [Calificacion], [Comentario], [FechaResenna]) VALUES (1, 1, 1, N'Resena', CAST(N'2024-12-02T18:53:52.553' AS DateTime))
INSERT [dbo].[tResenna] ([IdResenna], [ConsecutivoUsuario], [Calificacion], [Comentario], [FechaResenna]) VALUES (2, 1, 0, N'TEST JAVAS', CAST(N'2024-12-02T21:08:30.327' AS DateTime))
INSERT [dbo].[tResenna] ([IdResenna], [ConsecutivoUsuario], [Calificacion], [Comentario], [FechaResenna]) VALUES (3, 1, 0, N'dadsad', CAST(N'2024-12-02T21:15:16.250' AS DateTime))
INSERT [dbo].[tResenna] ([IdResenna], [ConsecutivoUsuario], [Calificacion], [Comentario], [FechaResenna]) VALUES (4, 1, 0, N'ddas', CAST(N'2024-12-02T21:19:01.010' AS DateTime))
INSERT [dbo].[tResenna] ([IdResenna], [ConsecutivoUsuario], [Calificacion], [Comentario], [FechaResenna]) VALUES (5, 1, 0, N'45', CAST(N'2024-12-02T21:23:40.030' AS DateTime))
INSERT [dbo].[tResenna] ([IdResenna], [ConsecutivoUsuario], [Calificacion], [Comentario], [FechaResenna]) VALUES (6, 1, 0, N'dasd', CAST(N'2024-12-02T21:33:49.440' AS DateTime))
INSERT [dbo].[tResenna] ([IdResenna], [ConsecutivoUsuario], [Calificacion], [Comentario], [FechaResenna]) VALUES (7, 1, 0, N'dasd', CAST(N'2024-12-02T21:47:53.657' AS DateTime))
INSERT [dbo].[tResenna] ([IdResenna], [ConsecutivoUsuario], [Calificacion], [Comentario], [FechaResenna]) VALUES (8, 1, 0, N'dasd', CAST(N'2024-12-02T21:50:26.990' AS DateTime))
INSERT [dbo].[tResenna] ([IdResenna], [ConsecutivoUsuario], [Calificacion], [Comentario], [FechaResenna]) VALUES (9, 1, 0, N'sdasd', CAST(N'2024-12-02T21:54:16.597' AS DateTime))
INSERT [dbo].[tResenna] ([IdResenna], [ConsecutivoUsuario], [Calificacion], [Comentario], [FechaResenna]) VALUES (10, 1, 0, N'asddasdsada', CAST(N'2024-12-02T21:54:50.550' AS DateTime))
INSERT [dbo].[tResenna] ([IdResenna], [ConsecutivoUsuario], [Calificacion], [Comentario], [FechaResenna]) VALUES (11, 1, 0, N'fsddfsdf', CAST(N'2024-12-02T22:14:00.063' AS DateTime))
INSERT [dbo].[tResenna] ([IdResenna], [ConsecutivoUsuario], [Calificacion], [Comentario], [FechaResenna]) VALUES (12, 1, 0, N'dasdasda', CAST(N'2024-12-02T22:15:30.403' AS DateTime))
INSERT [dbo].[tResenna] ([IdResenna], [ConsecutivoUsuario], [Calificacion], [Comentario], [FechaResenna]) VALUES (13, 1, 4, N'dasdda', CAST(N'2024-12-02T22:18:40.803' AS DateTime))
INSERT [dbo].[tResenna] ([IdResenna], [ConsecutivoUsuario], [Calificacion], [Comentario], [FechaResenna]) VALUES (14, 1, 1, N'test 1', CAST(N'2024-12-02T22:23:42.830' AS DateTime))
INSERT [dbo].[tResenna] ([IdResenna], [ConsecutivoUsuario], [Calificacion], [Comentario], [FechaResenna]) VALUES (15, 1, 2, N'test 2', CAST(N'2024-12-02T22:23:57.770' AS DateTime))
INSERT [dbo].[tResenna] ([IdResenna], [ConsecutivoUsuario], [Calificacion], [Comentario], [FechaResenna]) VALUES (16, 1, 3, N'test 3', CAST(N'2024-12-02T22:24:22.060' AS DateTime))
INSERT [dbo].[tResenna] ([IdResenna], [ConsecutivoUsuario], [Calificacion], [Comentario], [FechaResenna]) VALUES (17, 1, 4, NULL, CAST(N'2024-12-02T22:24:32.837' AS DateTime))
INSERT [dbo].[tResenna] ([IdResenna], [ConsecutivoUsuario], [Calificacion], [Comentario], [FechaResenna]) VALUES (18, 1, 5, NULL, CAST(N'2024-12-02T22:24:44.047' AS DateTime))
INSERT [dbo].[tResenna] ([IdResenna], [ConsecutivoUsuario], [Calificacion], [Comentario], [FechaResenna]) VALUES (19, 1, 4, NULL, CAST(N'2024-12-02T22:28:03.213' AS DateTime))
INSERT [dbo].[tResenna] ([IdResenna], [ConsecutivoUsuario], [Calificacion], [Comentario], [FechaResenna]) VALUES (20, 1, 5, N'e', CAST(N'2024-12-02T22:29:11.663' AS DateTime))
INSERT [dbo].[tResenna] ([IdResenna], [ConsecutivoUsuario], [Calificacion], [Comentario], [FechaResenna]) VALUES (21, 1, 0, N'tets', CAST(N'2024-12-06T20:55:03.510' AS DateTime))
INSERT [dbo].[tResenna] ([IdResenna], [ConsecutivoUsuario], [Calificacion], [Comentario], [FechaResenna]) VALUES (22, 1, 1, N'tetst', CAST(N'2024-12-06T20:55:42.940' AS DateTime))
INSERT [dbo].[tResenna] ([IdResenna], [ConsecutivoUsuario], [Calificacion], [Comentario], [FechaResenna]) VALUES (23, 1, 1, N'Tets', CAST(N'2024-12-06T20:56:18.330' AS DateTime))
INSERT [dbo].[tResenna] ([IdResenna], [ConsecutivoUsuario], [Calificacion], [Comentario], [FechaResenna]) VALUES (24, 1, 1, N'test', CAST(N'2024-12-06T21:03:14.493' AS DateTime))
INSERT [dbo].[tResenna] ([IdResenna], [ConsecutivoUsuario], [Calificacion], [Comentario], [FechaResenna]) VALUES (25, 1, 1, N'calificacion', CAST(N'2024-12-06T21:04:07.570' AS DateTime))
INSERT [dbo].[tResenna] ([IdResenna], [ConsecutivoUsuario], [Calificacion], [Comentario], [FechaResenna]) VALUES (26, 1, 4, NULL, CAST(N'2024-12-08T22:22:09.840' AS DateTime))
INSERT [dbo].[tResenna] ([IdResenna], [ConsecutivoUsuario], [Calificacion], [Comentario], [FechaResenna]) VALUES (27, 1, 4, NULL, CAST(N'2024-12-08T22:23:50.067' AS DateTime))
INSERT [dbo].[tResenna] ([IdResenna], [ConsecutivoUsuario], [Calificacion], [Comentario], [FechaResenna]) VALUES (28, 1, 1, NULL, CAST(N'2024-12-08T22:25:53.473' AS DateTime))
INSERT [dbo].[tResenna] ([IdResenna], [ConsecutivoUsuario], [Calificacion], [Comentario], [FechaResenna]) VALUES (29, 1, 0, NULL, CAST(N'2024-12-08T22:29:53.047' AS DateTime))
INSERT [dbo].[tResenna] ([IdResenna], [ConsecutivoUsuario], [Calificacion], [Comentario], [FechaResenna]) VALUES (30, 1, 5, NULL, CAST(N'2024-12-08T22:31:13.200' AS DateTime))
INSERT [dbo].[tResenna] ([IdResenna], [ConsecutivoUsuario], [Calificacion], [Comentario], [FechaResenna]) VALUES (31, 1, 5, N'dadada', CAST(N'2024-12-08T22:35:38.053' AS DateTime))
INSERT [dbo].[tResenna] ([IdResenna], [ConsecutivoUsuario], [Calificacion], [Comentario], [FechaResenna]) VALUES (32, 2, 4, N'Test', CAST(N'2024-12-09T20:59:18.190' AS DateTime))
SET IDENTITY_INSERT [dbo].[tResenna] OFF
GO
SET IDENTITY_INSERT [dbo].[tRol] ON 

INSERT [dbo].[tRol] ([ConsecutivoRol], [NombreRol]) VALUES (1, N'Administrador')
INSERT [dbo].[tRol] ([ConsecutivoRol], [NombreRol]) VALUES (2, N'Cliente')
SET IDENTITY_INSERT [dbo].[tRol] OFF
GO
SET IDENTITY_INSERT [dbo].[tUsuario] ON 

INSERT [dbo].[tUsuario] ([Consecutivo], [Identificacion], [Contrasenna], [Nombre], [CorreoElectronico], [Estado], [Temporal], [Vencimiento], [ConsecutivoRol]) VALUES (1, N'112730030', N'123', N'LEONEL ALFONSO AZOFEIFA HIDALGO', N'leonaap36@gmail.com', 1, 0, CAST(N'2024-11-30T21:41:31.143' AS DateTime), 1)
INSERT [dbo].[tUsuario] ([Consecutivo], [Identificacion], [Contrasenna], [Nombre], [CorreoElectronico], [Estado], [Temporal], [Vencimiento], [ConsecutivoRol]) VALUES (2, N'112650215', N'1234', N'KATTERINE CHAN SANCHEZ', N'leonaap36@gmail.com', 1, 0, CAST(N'2024-12-09T23:21:19.893' AS DateTime), 2)
INSERT [dbo].[tUsuario] ([Consecutivo], [Identificacion], [Contrasenna], [Nombre], [CorreoElectronico], [Estado], [Temporal], [Vencimiento], [ConsecutivoRol]) VALUES (3, N'604550225', N'123', N'EDWIN ALBERTO CHAVARRIA CAMACHO', N'edwinchavarriac@gmail.com', 1, 0, CAST(N'2024-12-16T21:16:57.553' AS DateTime), 2)
SET IDENTITY_INSERT [dbo].[tUsuario] OFF
GO
ALTER TABLE [dbo].[tResenna] ADD  DEFAULT (getdate()) FOR [FechaResenna]
GO
ALTER TABLE [dbo].[tCarrito]  WITH CHECK ADD  CONSTRAINT [FK_tCarrito_tProducto] FOREIGN KEY([ConsecutivoProducto])
REFERENCES [dbo].[tProducto] ([Consecutivo])
GO
ALTER TABLE [dbo].[tCarrito] CHECK CONSTRAINT [FK_tCarrito_tProducto]
GO
ALTER TABLE [dbo].[tCarrito]  WITH CHECK ADD  CONSTRAINT [FK_tCarrito_tUsuario] FOREIGN KEY([ConsecutivoUsuario])
REFERENCES [dbo].[tUsuario] ([Consecutivo])
GO
ALTER TABLE [dbo].[tCarrito] CHECK CONSTRAINT [FK_tCarrito_tUsuario]
GO
ALTER TABLE [dbo].[tDetalle]  WITH CHECK ADD  CONSTRAINT [FK_tDetalle_tMaestro] FOREIGN KEY([ConsecutivoMaestro])
REFERENCES [dbo].[tMaestro] ([ConsecutivoMaestro])
GO
ALTER TABLE [dbo].[tDetalle] CHECK CONSTRAINT [FK_tDetalle_tMaestro]
GO
ALTER TABLE [dbo].[tDetalle]  WITH CHECK ADD  CONSTRAINT [FK_tDetalle_tProducto] FOREIGN KEY([ConsecutivoProducto])
REFERENCES [dbo].[tProducto] ([Consecutivo])
GO
ALTER TABLE [dbo].[tDetalle] CHECK CONSTRAINT [FK_tDetalle_tProducto]
GO
ALTER TABLE [dbo].[tMaestro]  WITH CHECK ADD  CONSTRAINT [FK_tMaestro_tUsuario] FOREIGN KEY([ConsecutivoUsuario])
REFERENCES [dbo].[tUsuario] ([Consecutivo])
GO
ALTER TABLE [dbo].[tMaestro] CHECK CONSTRAINT [FK_tMaestro_tUsuario]
GO
ALTER TABLE [dbo].[tProducto]  WITH CHECK ADD  CONSTRAINT [FK_tProducto_tCategorias] FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[tCategoria] ([IdCategoria])
GO
ALTER TABLE [dbo].[tProducto] CHECK CONSTRAINT [FK_tProducto_tCategorias]
GO
ALTER TABLE [dbo].[tResenna]  WITH CHECK ADD  CONSTRAINT [FK_Resenna_Usuario] FOREIGN KEY([ConsecutivoUsuario])
REFERENCES [dbo].[tUsuario] ([Consecutivo])
GO
ALTER TABLE [dbo].[tResenna] CHECK CONSTRAINT [FK_Resenna_Usuario]
GO
ALTER TABLE [dbo].[tUsuario]  WITH CHECK ADD  CONSTRAINT [FK_tUsuario_tRol] FOREIGN KEY([ConsecutivoRol])
REFERENCES [dbo].[tRol] ([ConsecutivoRol])
GO
ALTER TABLE [dbo].[tUsuario] CHECK CONSTRAINT [FK_tUsuario_tRol]
GO
/****** Object:  StoredProcedure [dbo].[ActualizarImagenAyuda]    Script Date: 5/1/2025 18:26:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ActualizarImagenAyuda]
    @id INT, 
    @imagen_url VARCHAR(500) 
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        UPDATE dbo.Ayuda
        SET imagen_url = @imagen_url,
            ultima_actualizacion = GETDATE() -- Actualiza la fecha de modificación
        WHERE id = @id;

        -- Devuelve el número de filas afectadas
        SELECT @@ROWCOUNT AS FilasAfectadas;
    END TRY
    BEGIN CATCH
        -- Manejo de errores
        SELECT ERROR_NUMBER() AS ErrorNumber, ERROR_MESSAGE() AS ErrorMessage;
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[ActualizarImagenBlog]    Script Date: 5/1/2025 18:26:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ActualizarImagenBlog]
    @id INT,
    @imagen_url VARCHAR(255)
AS
BEGIN

    UPDATE dbo.blog_articulos
    SET imagen_url = @imagen_url
    WHERE id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[ActualizarImagenProducto]    Script Date: 5/1/2025 18:26:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Procedimiento para actualizar imagen de producto
CREATE PROCEDURE [dbo].[ActualizarImagenProducto]
    @Consecutivo BIGINT,
    @RutaImagen VARCHAR(200)
AS
BEGIN
    UPDATE dbo.tProducto
    SET RutaImagen = @RutaImagen
    WHERE Consecutivo = @Consecutivo
END
GO
/****** Object:  StoredProcedure [dbo].[ActualizarInfo]    Script Date: 5/1/2025 18:26:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Porcedimiento para actualizar la info
-- Procedimiento para actualizar informacion
CREATE PROCEDURE [dbo].[ActualizarInfo]
    @ConsecutivoInformacion BIGINT,
	@NombreEmpresa VARCHAR(200),
    @Telefono VARCHAR(20),
    @CorreoElectronico VARCHAR(200),
    @Direccion VARCHAR(500),
    @AcercaDeNosotros VARCHAR(200),
    @Contactanos VARCHAR(200),
    @Politicas VARCHAR(200),
    @OrdenesDevoluciones VARCHAR(200),
    @TerminosCondiciones VARCHAR(200)
      
AS
BEGIN
    UPDATE dbo.tInformacionEmpresa
     SET NombreEmpresa =@NombreEmpresa,
                Telefono = @Telefono,
                CorreoElectronico = @CorreoElectronico,
                Direccion = @Direccion,
                AcercaDeNosotros = @AcercaDeNosotros,
                Contactanos = @Contactanos,
                Politicas = @Politicas,
                OrdenesDevoluciones = @OrdenesDevoluciones,
                TerminosCondiciones = @TerminosCondiciones
            WHERE ConsecutivoInformacion =  @ConsecutivoInformacion ;
        END
      
GO
/****** Object:  StoredProcedure [dbo].[ActualizarProducto]    Script Date: 5/1/2025 18:26:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Procedimiento para actualizar producto
CREATE PROCEDURE [dbo].[ActualizarProducto]
    @Consecutivo BIGINT,
    @NombreProducto VARCHAR(200),
    @Precio DECIMAL(10,2),
    @Inventario INT,
    @IdCategoria INT,
    @Material VARCHAR(100),
    @Tamanio VARCHAR(50),
    @ColorBase VARCHAR(50),
	@Id_Promocion int,
	@Descripcion varchar(255)
AS
BEGIN
    UPDATE dbo.tProducto
    SET Nombre = @NombreProducto,
        Precio = @Precio,
        Inventario = @Inventario,
        IdCategoria = @IdCategoria,
        Material = @Material,
        Tamanio = @Tamanio,
        ColorBase = @ColorBase,
        Estado = 1,
		Id_Promocion = @Id_Promocion,
		Descripcion = @Descripcion
    WHERE Consecutivo = @Consecutivo
END
GO
/****** Object:  StoredProcedure [dbo].[ActualizarUsuario]    Script Date: 5/1/2025 18:26:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Procedimiento para actualizar usuario
CREATE PROCEDURE [dbo].[ActualizarUsuario]
    @Consecutivo BIGINT,
    @Contrasenna varchar(10),
    @Nombre varchar(200),
    @CorreoElectronico varchar(200),
	@ConsecutivoRol int
AS
BEGIN
    UPDATE dbo.tUsuario
    SET Contrasenna = (CASE WHEN @Contrasenna IS NULL THEN Contrasenna ELSE @Contrasenna END),
        Nombre = @Nombre,
        CorreoElectronico = @CorreoElectronico,
		ConsecutivoRol = @ConsecutivoRol,
        Temporal = 0
    WHERE Consecutivo = @Consecutivo
END
GO
/****** Object:  StoredProcedure [dbo].[AgregarCarrito]    Script Date: 5/1/2025 18:26:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Procedimiento para agregar al carrito
CREATE PROCEDURE [dbo].[AgregarCarrito]
    @ConsecutivoUsuario bigint,
    @ConsecutivoProducto bigint,
    @Cantidad int
AS
BEGIN
    IF NOT EXISTS(SELECT 1 FROM dbo.tCarrito 
                  WHERE ConsecutivoUsuario = @ConsecutivoUsuario 
                  AND ConsecutivoProducto = @ConsecutivoProducto)
    BEGIN
        INSERT INTO dbo.tCarrito(ConsecutivoUsuario, ConsecutivoProducto, FechaCarrito, Cantidad)
        VALUES (@ConsecutivoUsuario, @ConsecutivoProducto, GETDATE(), @Cantidad)
    END
    ELSE
    BEGIN
        UPDATE dbo.tCarrito
        SET FechaCarrito = GETDATE(),
            Cantidad = @Cantidad
        WHERE ConsecutivoUsuario = @ConsecutivoUsuario 
        AND ConsecutivoProducto = @ConsecutivoProducto
    END
END
GO
/****** Object:  StoredProcedure [dbo].[ColsultarAvisoPrivacidad]    Script Date: 5/1/2025 18:26:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ColsultarAvisoPrivacidad]
AS
BEGIN
    SELECT id, titulo_seccion, contenido, ultima_actualizacion
    FROM aviso_privacidad
END;
GO
/****** Object:  StoredProcedure [dbo].[ColsultarAyuda]    Script Date: 5/1/2025 18:26:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ColsultarAyuda]
AS
BEGIN
    SELECT id, categoria, titulo, contenido, imagen_url, ultima_actualizacion
    FROM Ayuda
    ORDER BY ultima_actualizacion DESC;
END;
GO
/****** Object:  StoredProcedure [dbo].[ColsultarBlogs]    Script Date: 5/1/2025 18:26:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ColsultarBlogs]
AS
BEGIN
    SELECT id, categoria, titulo, resumen, contenido, imagen_url, fecha_publicacion, ultima_actualizacion
    FROM blog_articulos
    ORDER BY fecha_publicacion DESC;
END;
GO
/****** Object:  StoredProcedure [dbo].[ColsultarPoliticaDevolucion]    Script Date: 5/1/2025 18:26:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ColsultarPoliticaDevolucion]

AS
BEGIN
        SELECT 
            id, 
            titulo_seccion, 
            contenido, 
            ultima_actualizacion
        FROM 
            politica_devolucion
END;
GO
/****** Object:  StoredProcedure [dbo].[ColsultarPoliticaDevolucionPorId]    Script Date: 5/1/2025 18:26:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ColsultarPoliticaDevolucionPorId]
@id INT -- Parámetro para identificar la política de devolución
AS
BEGIN
    SET NOCOUNT ON;
    
    BEGIN TRY
        -- Consulta la política de devolución por ID
        SELECT 
            id, 
            titulo_seccion, 
            contenido, 
            ultima_actualizacion
        FROM 
            politica_devolucion
        WHERE 
            id = @id;
    END TRY
    BEGIN CATCH
        -- Manejo de errores
        SELECT 
            ERROR_NUMBER() AS ErrorNumber, 
            ERROR_MESSAGE() AS ErrorMessage;
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[ColsutarPGF]    Script Date: 5/1/2025 18:26:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ColsutarPGF]
AS
BEGIN
 

    SELECT id, categoria, pregunta, respuesta, ultima_actualizacion
    FROM PreguntasFrecuentes
    ORDER BY categoria, id;
END;
GO
/****** Object:  StoredProcedure [dbo].[ConsultarAvisoPrivacidadPorID]    Script Date: 5/1/2025 18:26:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[ConsultarAvisoPrivacidadPorID]
    @id INT
AS
BEGIN
    SELECT id, titulo_seccion, contenido, ultima_actualizacion
    FROM aviso_privacidad
    WHERE id = @id;
END;
GO
/****** Object:  StoredProcedure [dbo].[ConsultarAyudaPorID]    Script Date: 5/1/2025 18:26:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE PROCEDURE [dbo].[ConsultarAyudaPorID]
    @id INT -- Parámetro para identificar la ayuda
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        SELECT 
            id, 
            categoria, 
            titulo, 
            contenido, 
            imagen_url, 
            ultima_actualizacion
        FROM 
            Ayuda
        WHERE 
            id = @id; -- Filtra por el ID proporcionado
    END TRY
    BEGIN CATCH
        -- Manejo de errores: Devuelve el número y mensaje del error
        SELECT 
            ERROR_NUMBER() AS ErrorNumber, 
            ERROR_MESSAGE() AS ErrorMessage;
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[ConsultarBlogPorID]    Script Date: 5/1/2025 18:26:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[ConsultarBlogPorID]
    @id INT
AS
BEGIN
    SELECT 
        id, 
        categoria, 
        titulo, 
        resumen, 
        contenido, 
        imagen_url, 
        fecha_publicacion, 
        ultima_actualizacion
    FROM blog_articulos
    WHERE id = @id;
END;

GO
/****** Object:  StoredProcedure [dbo].[ConsultarCarrito]    Script Date: 5/1/2025 18:26:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Procedimiento para consultar carrito
CREATE PROCEDURE [dbo].[ConsultarCarrito]
    @ConsecutivoUsuario BIGINT
AS
BEGIN
    SELECT C.ConsecutivoCarrito,
           C.ConsecutivoUsuario,
           C.ConsecutivoProducto,
           C.FechaCarrito AS 'Fecha',
           C.Cantidad,
           P.Precio,
           C.Cantidad * P.Precio AS 'SubTotal',
           (C.Cantidad * P.Precio) * 0.13 AS 'Impuesto',
           (C.Cantidad * P.Precio) + (C.Cantidad * P.Precio) * 0.13 AS 'Total',
           P.Nombre,
           P.Material,
           P.Tamanio,
           P.ColorBase
    FROM dbo.tCarrito C
    INNER JOIN dbo.tProducto P ON C.ConsecutivoProducto = P.Consecutivo
    WHERE C.ConsecutivoUsuario = @ConsecutivoUsuario
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarDetalleFacturas]    Script Date: 5/1/2025 18:26:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Procedimiento para consultar detalle de facturas
CREATE PROCEDURE [dbo].[ConsultarDetalleFacturas]
    @ConsecutivoMaestro BIGINT
AS
BEGIN
    SELECT D.ConsecutivoDetalle,
           D.ConsecutivoMaestro,
		   D.ConsecutivoProducto,
           P.Nombre,
           D.Cantidad,
           D.Precio,
           D.SubTotal,
           D.Impuestos AS 'Impuesto',
           D.Total,
           P.Material,
           P.Tamanio
     
    FROM tDetalle D
    INNER JOIN tProducto P ON D.ConsecutivoProducto = P.Consecutivo
    WHERE ConsecutivoMaestro = @ConsecutivoMaestro
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarFacturas]    Script Date: 5/1/2025 18:26:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Procedimiento para consultar facturas
CREATE PROCEDURE [dbo].[ConsultarFacturas]
    @ConsecutivoUsuario BIGINT
AS
BEGIN
if(@ConsecutivoUsuario != 0 )
begin
    SELECT ConsecutivoMaestro,
           U.Nombre,
           FechaCompra AS 'Fecha',
           SubTotal,
           Impuestos AS 'Impuesto',
           Total
    FROM tMaestro M
    INNER JOIN tUsuario U ON M.ConsecutivoUsuario = U.Consecutivo
    WHERE ConsecutivoUsuario = @ConsecutivoUsuario
END
 ELSE
    BEGIN
	SELECT ConsecutivoMaestro,
           U.Nombre,
           FechaCompra AS 'Fecha',
           SubTotal,
           Impuestos AS 'Impuesto',
           Total
    FROM tMaestro M
    INNER JOIN tUsuario U ON M.ConsecutivoUsuario = U.Consecutivo
  
	 END
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarPedido]    Script Date: 5/1/2025 18:26:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[ConsultarPedido]

AS
BEGIN
    SELECT D.ConsecutivoDetalle,
           D.ConsecutivoMaestro,
		   P.Consecutivo ,
		   U.Nombre as 'NombreUsuario',
           FechaCompra AS 'Fecha',
           P.Nombre,
           D.Cantidad,
           D.Precio,
           D.SubTotal,
           D.Impuestos AS 'Impuesto',
           D.Total,
           P.Material,
           P.Tamanio,
           P.ColorBase
    FROM  tDetalle D
    INNER JOIN tProducto P ON D.ConsecutivoProducto = P.Consecutivo
	,tMaestro M
INNER JOIN tUsuario U ON M.ConsecutivoUsuario = U.Consecutivo
   where d.ConsecutivoMaestro = M.ConsecutivoMaestro 
   and  m.ConsecutivoMaestro =  IDENT_CURRENT('tMaestro');
END

    
GO
/****** Object:  StoredProcedure [dbo].[ConsultarPedidos]    Script Date: 5/1/2025 18:26:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultarPedidos]
   
AS
BEGIN
    SELECT D.ConsecutivoDetalle,
           D.ConsecutivoMaestro,
		   P.Consecutivo ,
		   U.Nombre as 'NombreUsuario',
           FechaCompra AS 'Fecha',
           P.Nombre,
           D.Cantidad,
           D.Precio,
           D.SubTotal,
           D.Impuestos AS 'Impuesto',
           D.Total,
           P.Material,
           P.Tamanio,
           P.ColorBase
    FROM  tDetalle D
    INNER JOIN tProducto P ON D.ConsecutivoProducto = P.Consecutivo
	,tMaestro M
INNER JOIN tUsuario U ON M.ConsecutivoUsuario = U.Consecutivo
   where d.ConsecutivoMaestro = M.ConsecutivoMaestro
END

    
GO
/****** Object:  StoredProcedure [dbo].[ConsultarPGFPorId]    Script Date: 5/1/2025 18:26:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ConsultarPGFPorId]
    @id INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Consulta la pregunta frecuente por su ID
    SELECT id, categoria, pregunta, respuesta, ultima_actualizacion
    FROM PreguntasFrecuentes
    WHERE id = @id;
END;
GO
/****** Object:  StoredProcedure [dbo].[ConsultarPreguntaFrecuente]    Script Date: 5/1/2025 18:26:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultarPreguntaFrecuente]
    @Id INT -- Parámetro para identificar la pregunta frecuente
AS
BEGIN
    SET NOCOUNT ON;
 
    BEGIN TRY
        SELECT 
            id, 
            categoria, 
            pregunta, 
            respuesta, 
            ultima_actualizacion
        FROM 
            PreguntasFrecuentes
        WHERE 
            id = @Id;
    END TRY
    BEGIN CATCH
        -- Manejo de errores
        SELECT 
            ERROR_NUMBER() AS ErrorNumber, 
            ERROR_MESSAGE() AS ErrorMessage;
    END CATCH
END;


GO
/****** Object:  StoredProcedure [dbo].[ConsultarProducto]    Script Date: 5/1/2025 18:26:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultarProducto]
    @Consecutivo BIGINT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        P.Consecutivo,
        P.Nombre AS NombreProducto,
        P.Precio,
        P.Inventario,
        P.Estado,
        P.RutaImagen,
        P.IdCategoria,
        C.Nombre AS NombreCategoria,
        P.Material,
        P.Tamanio,
        P.ColorBase,
        -- Campos de promoción
        ISNULL(Pr.En_promocion, 0) AS En_promocion,  -- Si es NULL, devuelve 0
        Pr.porcentaje_descuento,
        Pr.fecha_inicio,
        Pr.fecha_fin,
        -- Cálculo del precio con descuento si la promoción está activa
        CASE 
            WHEN ISNULL(Pr.En_promocion, 0) = 1 
                 AND GETDATE() BETWEEN Pr.fecha_inicio AND Pr.fecha_fin 
            THEN P.Precio * (100 - Pr.porcentaje_descuento) / 100
            ELSE P.Precio
        END AS PrecioConDescuento
    FROM 
        tProducto P
    INNER JOIN 
        tCategoria C ON P.IdCategoria = C.IdCategoria
    LEFT JOIN 
        tPromociones Pr ON P.Id_Promocion = Pr.Id_promocion
    WHERE 
        P.Consecutivo = @Consecutivo;
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarProductos]    Script Date: 5/1/2025 18:26:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Procedimiento para consultar productos
CREATE PROCEDURE [dbo].[ConsultarProductos]
    @MostrarTodos BIT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        P.Consecutivo,
        P.Nombre AS NombreProducto,
        P.Precio,
        P.Inventario,
        P.Estado,
        P.RutaImagen,
        P.IdCategoria,
        C.Nombre AS NombreCategoria,
        P.Material,
        P.Tamanio,
        P.ColorBase,

        -- Campos de promoción
        Pr.En_promocion,
        Pr.porcentaje_descuento,
        Pr.fecha_inicio,
        Pr.fecha_fin,

        -- Cálculo del precio con descuento si la promoción está activa
        CASE 
            WHEN Pr.En_promocion = 1 
                 AND GETDATE() BETWEEN Pr.fecha_inicio AND Pr.fecha_fin 
            THEN P.Precio * (1.0 - CAST(Pr.porcentaje_descuento AS DECIMAL(5,2)) / 100.0)
            ELSE P.Precio
        END AS PrecioConDescuento,

        -- Indicador si la promoción está activa
        CASE 
            WHEN Pr.En_promocion = 1 
                 AND GETDATE() BETWEEN Pr.fecha_inicio AND Pr.fecha_fin 
            THEN 1
            ELSE 0
        END AS PromocionActiva

    FROM 
        tProducto P
    INNER JOIN 
        tCategoria C ON P.IdCategoria = C.IdCategoria
    LEFT JOIN 
        tPromociones Pr ON P.Id_Promocion = Pr.Id_promocion

    ORDER BY 
        P.Consecutivo DESC;
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarProductosPorRangoPrecio]    Script Date: 5/1/2025 18:26:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultarProductosPorRangoPrecio]
    @PrecioMinimo DECIMAL(10, 2) = NULL, 
    @PrecioMaximo DECIMAL(10, 2) = NULL  
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        P.Consecutivo,
        P.Nombre AS NombreProducto,
        P.Precio,
        P.Inventario,
        P.Estado,
        P.RutaImagen,
        P.IdCategoria,
        C.Nombre AS NombreCategoria,
        P.Material,
        P.Tamanio,
        P.ColorBase,

        -- Campos de promoción
        Pr.En_promocion,
        Pr.porcentaje_descuento,
        Pr.fecha_inicio,
        Pr.fecha_fin,

        -- Cálculo del precio con descuento si la promoción está activa
        CASE 
            WHEN Pr.En_promocion = 1 
                 AND GETDATE() BETWEEN Pr.fecha_inicio AND Pr.fecha_fin 
            THEN P.Precio * (1.0 - CAST(Pr.porcentaje_descuento AS DECIMAL(5,2)) / 100.0)
            ELSE P.Precio
        END AS PrecioConDescuento,

        -- Indicador si la promoción está activa
        CASE 
            WHEN Pr.En_promocion = 1 
                 AND GETDATE() BETWEEN Pr.fecha_inicio AND Pr.fecha_fin 
            THEN 1
            ELSE 0
        END AS PromocionActiva

    FROM 
        tProducto P
    INNER JOIN 
        tCategoria C ON P.IdCategoria = C.IdCategoria
    LEFT JOIN 
        tPromociones Pr ON P.Id_Promocion = Pr.Id_promocion
    WHERE 
        (@PrecioMinimo IS NULL OR P.Precio >= @PrecioMinimo) -- Filtrar por precio mínimo si se proporciona
        AND (@PrecioMaximo IS NULL OR P.Precio <= @PrecioMaximo) -- Filtrar por precio máximo si se proporciona
    ORDER BY 
        P.Precio ASC; -- Ordena los productos por precio en orden ascendente
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarResennas]    Script Date: 5/1/2025 18:26:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Procedimiento para Consultar resenas
CREATE PROCEDURE [dbo].[ConsultarResennas]
AS
BEGIN
    

    SELECT 
        r.IdResenna,
        u.Nombre AS NombreUsuario,
        u.CorreoElectronico,
        r.Calificacion,
        r.Comentario,
        r.FechaResenna
    FROM 
        [dbo].[tResenna] r
    INNER JOIN 
        [dbo].[tUsuario] u ON r.ConsecutivoUsuario = u.Consecutivo
    ORDER BY 
        r.FechaResenna DESC;
END;
GO
/****** Object:  StoredProcedure [dbo].[ConsultarRoles]    Script Date: 5/1/2025 18:26:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Procedimiento para consultar tipos de categoría
CREATE PROCEDURE [dbo].[ConsultarRoles]
AS
BEGIN
    SELECT ConsecutivoRol, NombreRol
    FROM tRol
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarTiposCategoria]    Script Date: 5/1/2025 18:26:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Procedimiento para consultar tipos de categoría
CREATE PROCEDURE [dbo].[ConsultarTiposCategoria]
AS
BEGIN
    SELECT IdCategoria, Nombre AS 'NombreCategoria'
    FROM tCategoria
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarUsuario]    Script Date: 5/1/2025 18:26:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Procedimiento para consultar usuario
CREATE PROCEDURE [dbo].[ConsultarUsuario]
    @Consecutivo BIGINT
AS
BEGIN
    SELECT Consecutivo, Identificacion, Nombre, CorreoElectronico, Estado, Temporal, Vencimiento, U.ConsecutivoRol, R.NombreRol
    FROM dbo.tUsuario U
    INNER JOIN dbo.tRol R ON U.ConsecutivoRol = R.ConsecutivoRol
    WHERE Consecutivo = @Consecutivo
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarUsuarios]    Script Date: 5/1/2025 18:26:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Procedimiento para consultar usuario
Create PROCEDURE [dbo].[ConsultarUsuarios]
    
AS
BEGIN
    SELECT Consecutivo, Identificacion, Nombre, CorreoElectronico, Estado, Temporal, Vencimiento, U.ConsecutivoRol, R.NombreRol
    FROM dbo.tUsuario U
    INNER JOIN dbo.tRol R ON U.ConsecutivoRol = R.ConsecutivoRol
    
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarVentas]    Script Date: 5/1/2025 18:26:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Procedimiento para consultar ventas
CREATE PROCEDURE [dbo].[ConsultarVentas]
AS
BEGIN
    SET LANGUAGE Spanish

    SELECT DateName(month, DateAdd(month, MONTH(GETDATE()), -1)) AS 'Mes', 
           SUM(M.Total) AS 'TotalMes'
    FROM tMaestro M
    WHERE MONTH(M.FechaCompra) = MONTH(GETDATE()) 
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarVentasMensuales]    Script Date: 5/1/2025 18:26:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Procedimiento para consultar ventas mensuales
CREATE PROCEDURE [dbo].[ConsultarVentasMensuales]
AS
BEGIN
    SET LANGUAGE Spanish

    SELECT Mes, TotalMes
    FROM (
        SELECT DateName(month, DateAdd(month, MONTH(FechaCompra), -1)) AS 'Mes',  
               SUM(M.Total) AS 'TotalMes',
               MONTH(FechaCompra) AS 'NumeroMes'
        FROM tMaestro M
        GROUP BY DateName(month, DateAdd(month, MONTH(FechaCompra), -1)), MONTH(FechaCompra)  
    ) X 
    ORDER BY NumeroMes
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarVentasUsuario]    Script Date: 5/1/2025 18:26:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Procedimiento para consultar ventas por usuario
CREATE PROCEDURE [dbo].[ConsultarVentasUsuario]
AS
BEGIN
    SELECT TOP 1  
           U.Identificacion + ' - ' + U.Nombre AS 'NombreUsuario', 
           SUM(M.Total) AS 'TotalUsuario'
    FROM tMaestro M
    INNER JOIN tUsuario U ON M.ConsecutivoUsuario = U.Consecutivo
    WHERE MONTH(M.FechaCompra) = MONTH(GETDATE()) 
    GROUP BY U.Identificacion + ' - ' + U.Nombre 
    ORDER BY SUM(M.Total) DESC
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteAvisoPrivacidad]    Script Date: 5/1/2025 18:26:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteAvisoPrivacidad]
    @Id INT
AS
BEGIN
    DELETE FROM aviso_privacidad
    WHERE id = @Id;
END;
GO
/****** Object:  StoredProcedure [dbo].[DeleteAyuda]    Script Date: 5/1/2025 18:26:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteAyuda]
  @id INT
AS
BEGIN
    DELETE FROM Ayuda
    WHERE id = @id;

    SELECT @id AS EliminadoID; -- Devuelve el ID eliminado como confirmación
END;
GO
/****** Object:  StoredProcedure [dbo].[DeleteBlog]    Script Date: 5/1/2025 18:26:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteBlog]
    @Id INT
AS
BEGIN
    DELETE FROM blog_articulos
    WHERE id = @Id;
END;
GO
/****** Object:  StoredProcedure [dbo].[DeletePGF]    Script Date: 5/1/2025 18:26:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeletePGF]
  @Id INT -- ID de la pregunta a eliminar
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM PreguntasFrecuentes
    WHERE id = @Id;

    SELECT 'Registro eliminado correctamente' AS Mensaje;
END
GO
/****** Object:  StoredProcedure [dbo].[DeletePoliticaDevolucion]    Script Date: 5/1/2025 18:26:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeletePoliticaDevolucion]
    @Id INT
AS
BEGIN
    DELETE FROM politica_devolucion
    WHERE id = @Id;
END;
GO
/****** Object:  StoredProcedure [dbo].[EliminarAyuda]    Script Date: 5/1/2025 18:26:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EliminarAyuda]
    @id INT
AS
BEGIN
    DELETE FROM Ayuda
    WHERE id = @id;
END;
GO
/****** Object:  StoredProcedure [dbo].[EliminarCarrito]    Script Date: 5/1/2025 18:26:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Procedimiento para eliminar del carrito
CREATE PROCEDURE [dbo].[EliminarCarrito]
    @ConsecutivoCarrito BIGINT
AS
BEGIN
    DELETE FROM tCarrito WHERE ConsecutivoCarrito = @ConsecutivoCarrito
END
GO
/****** Object:  StoredProcedure [dbo].[EliminarProducto]    Script Date: 5/1/2025 18:26:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Procedimiento para eliminar producto
CREATE PROCEDURE [dbo].[EliminarProducto]
    @Consecutivo BIGINT
AS
BEGIN
    UPDATE dbo.tProducto
    SET Estado = 0
    WHERE Consecutivo = @Consecutivo
END
GO
/****** Object:  StoredProcedure [dbo].[FiltrarProductosPorCaracteristicas]    Script Date: 5/1/2025 18:26:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FiltrarProductosPorCaracteristicas]
    @Material NVARCHAR(100) = NULL, 
    @ColorBase NVARCHAR(50) = NULL,   
    @Tamanio NVARCHAR(50) = NULL   
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        P.Consecutivo,
        P.Nombre AS NombreProducto,
        P.Precio,
        P.Inventario,
        P.Estado,
        P.RutaImagen,
        P.IdCategoria,
        C.Nombre AS NombreCategoria,
        P.Material,
        P.Tamanio,
        P.ColorBase,

        -- Campos de promoción
            ISNULL(Pr.En_promocion, 0) AS En_promocion,  -- Si es NULL, devuelve 0
        Pr.porcentaje_descuento,
        Pr.fecha_inicio,
        Pr.fecha_fin,

        -- Cálculo del precio con descuento si la promoción está activa
        CASE 
          WHEN ISNULL(Pr.En_promocion, 0) = 1 
                 AND GETDATE() BETWEEN Pr.fecha_inicio AND Pr.fecha_fin 
            THEN P.Precio * (1.0 - CAST(Pr.porcentaje_descuento AS DECIMAL(5,2)) / 100.0)
            ELSE P.Precio
        END AS PrecioConDescuento,

        -- Indicador si la promoción está activa
        CASE 
          WHEN ISNULL(Pr.En_promocion, 0) = 1 
                 AND GETDATE() BETWEEN Pr.fecha_inicio AND Pr.fecha_fin 
            THEN 1
            ELSE 0
        END AS PromocionActiva

    FROM 
        tProducto P
    INNER JOIN 
        tCategoria C ON P.IdCategoria = C.IdCategoria
    LEFT JOIN 
        tPromociones Pr ON P.Id_Promocion = Pr.Id_promocion
    WHERE 
        (@Material IS NULL OR P.Material LIKE '%' + @Material + '%') -- Filtrar por material si se proporciona
        AND (@ColorBase IS NULL OR P.ColorBase LIKE '%' + @ColorBase + '%')  -- Filtrar por color si se proporciona
        AND (@Tamanio IS NULL OR P.Tamanio LIKE '%' + @Tamanio + '%') -- Filtrar por tamaño si se proporciona
    ORDER BY 
        P.Consecutivo DESC; -- Ordena los productos por el más reciente
END
GO
/****** Object:  StoredProcedure [dbo].[FiltrarProductosPorCategoria]    Script Date: 5/1/2025 18:26:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FiltrarProductosPorCategoria]
    @IdCategoria INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        P.Consecutivo,
        P.Nombre AS NombreProducto,
        P.Precio,
        P.Inventario,
        P.Estado,
        P.RutaImagen,
        P.IdCategoria,
        C.Nombre AS NombreCategoria,
        P.Material,
        P.Tamanio,
        P.ColorBase,

        -- Campos de promoción
        ISNULL(Pr.En_promocion, 0) AS En_promocion,  -- Si es NULL, devuelve 0
        Pr.porcentaje_descuento,
        Pr.fecha_inicio,
        Pr.fecha_fin,

        -- Cálculo del precio con descuento si la promoción está activa
        CASE 
             WHEN ISNULL(Pr.En_promocion, 0) = 1 
                 AND GETDATE() BETWEEN Pr.fecha_inicio AND Pr.fecha_fin 
            THEN P.Precio * (1.0 - CAST(Pr.porcentaje_descuento AS DECIMAL(5,2)) / 100.0)
            ELSE P.Precio
        END AS PrecioConDescuento,

        -- Indicador si la promoción está activa
        CASE 
           WHEN ISNULL(Pr.En_promocion, 0) = 1 
                 AND GETDATE() BETWEEN Pr.fecha_inicio AND Pr.fecha_fin 
            THEN 1
            ELSE 0
        END AS PromocionActiva

    FROM 
        tProducto P
    INNER JOIN 
        tCategoria C ON P.IdCategoria = C.IdCategoria
    LEFT JOIN 
        tPromociones Pr ON P.Id_Promocion = Pr.Id_promocion
    WHERE 
        P.IdCategoria = @IdCategoria
    ORDER BY 
        P.Consecutivo DESC;
END;
GO
/****** Object:  StoredProcedure [dbo].[InactivaUsuario]    Script Date: 5/1/2025 18:26:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Procedimiento para eliminar producto
create PROCEDURE [dbo].[InactivaUsuario]
    @Consecutivo BIGINT
AS
BEGIN
    UPDATE dbo.tUsuario
    SET Estado = 0
    WHERE Consecutivo = @Consecutivo
END
GO
/****** Object:  StoredProcedure [dbo].[IniciarSesionUsuario]    Script Date: 5/1/2025 18:26:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Procedimiento para iniciar sesión de usuario
CREATE PROCEDURE [dbo].[IniciarSesionUsuario]
    @Identificacion varchar(20),
    @Contrasenna varchar(10)
AS
BEGIN
    SELECT Consecutivo, Identificacion, Nombre, CorreoElectronico, Estado, Temporal, Vencimiento, U.ConsecutivoRol, R.NombreRol
    FROM dbo.tUsuario U
    INNER JOIN dbo.tRol R ON U.ConsecutivoRol = R.ConsecutivoRol
    WHERE Identificacion = @Identificacion
        AND Contrasenna = @Contrasenna
        AND Estado = 1
END
GO
/****** Object:  StoredProcedure [dbo].[InsertAvisoPrivacidad]    Script Date: 5/1/2025 18:26:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertAvisoPrivacidad]
    @TituloSeccion VARCHAR(5000),
    @Contenido VARCHAR(MAX)
AS
BEGIN
    INSERT INTO aviso_privacidad (titulo_seccion, contenido)
    VALUES (@TituloSeccion, @Contenido);
END;
GO
/****** Object:  StoredProcedure [dbo].[InsertAyuda]    Script Date: 5/1/2025 18:26:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertAyuda]
    @categoria VARCHAR(5000),
    @titulo VARCHAR(5000),
    @contenido VARCHAR(5000),
    @imagen_url VARCHAR(5000)
AS
BEGIN
    INSERT INTO Ayuda (categoria, titulo, contenido, imagen_url)
    VALUES (@categoria, @titulo, @contenido, @imagen_url);
END;
GO
/****** Object:  StoredProcedure [dbo].[InsertBlog]    Script Date: 5/1/2025 18:26:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--5. Procedimiento de Blogs
CREATE PROCEDURE [dbo].[InsertBlog]
    @Categoria NVARCHAR(255),
    @Titulo NVARCHAR(255),
    @Resumen NVARCHAR(MAX),
    @Contenido NVARCHAR(MAX),
    @ImagenUrl NVARCHAR(255)
AS
BEGIN
    INSERT INTO blog_articulos (categoria, titulo, resumen, contenido, imagen_url)
    VALUES (@Categoria, @Titulo, @Resumen, @Contenido, @ImagenUrl);
END;
GO
/****** Object:  StoredProcedure [dbo].[InsertPGF]    Script Date: 5/1/2025 18:26:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--3. Procedimientos de preguntas frecuentes

CREATE PROCEDURE [dbo].[InsertPGF]
   @Categoria VARCHAR(5000),   
    @Pregunta VARCHAR(5000),  
    @Respuesta VARCHAR(5000)  
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO PreguntasFrecuentes (categoria, pregunta, respuesta, ultima_actualizacion)
    VALUES (@Categoria, @Pregunta, @Respuesta, GETDATE());

    SELECT SCOPE_IDENTITY() AS NuevoId; 
END;
GO
/****** Object:  StoredProcedure [dbo].[InsertPoliticaDevolucion]    Script Date: 5/1/2025 18:26:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertPoliticaDevolucion]
    @TituloSeccion NVARCHAR(255),
    @Contenido NVARCHAR(MAX)
AS
BEGIN
    INSERT INTO politica_devolucion (titulo_seccion, contenido)
    VALUES (@TituloSeccion, @Contenido);
END;
GO
/****** Object:  StoredProcedure [dbo].[PagarCarrito]    Script Date: 5/1/2025 18:26:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Procedimiento para pagar carrito
CREATE PROCEDURE [dbo].[PagarCarrito]
    @ConsecutivoUsuario BIGINT
AS
BEGIN
    IF NOT EXISTS(
        SELECT 1 FROM tCarrito C
        INNER JOIN tProducto P ON C.ConsecutivoProducto = P.Consecutivo
        WHERE ConsecutivoUsuario = @ConsecutivoUsuario
        AND (P.Inventario - C.Cantidad) < 0
    )
    BEGIN
        -- Insertar en tMaestro
        INSERT INTO dbo.tMaestro(ConsecutivoUsuario, FechaCompra, SubTotal, Impuestos, Total)
        SELECT ConsecutivoUsuario, GETDATE(), 
               SUM(P.Precio * Cantidad),
               SUM(P.Precio * Cantidad) * 0.13,
               SUM(P.Precio * Cantidad) + SUM(P.Precio * Cantidad) * 0.13
        FROM tCarrito C
        INNER JOIN tProducto P ON C.ConsecutivoProducto = P.Consecutivo
        WHERE ConsecutivoUsuario = @ConsecutivoUsuario
        GROUP BY ConsecutivoUsuario

        DECLARE @ConsecutivoMaestro BIGINT = SCOPE_IDENTITY()
		

        -- Insertar en tDetalle
        INSERT INTO dbo.tDetalle(ConsecutivoMaestro, ConsecutivoProducto, Cantidad, Precio, SubTotal, Impuestos, Total)
        SELECT @ConsecutivoMaestro, ConsecutivoProducto, Cantidad, P.Precio,
               (P.Precio * Cantidad),
               (P.Precio * Cantidad) * 0.13,
               (P.Precio * Cantidad) + (P.Precio * Cantidad) * 0.13
        FROM tCarrito C
        INNER JOIN tProducto P ON C.ConsecutivoProducto = P.Consecutivo
        WHERE ConsecutivoUsuario = @ConsecutivoUsuario

        -- Actualizar inventario
        UPDATE P
        SET Inventario = P.Inventario - C.Cantidad
        FROM tProducto P
        INNER JOIN tCarrito C ON P.Consecutivo = C.ConsecutivoProducto
        WHERE C.ConsecutivoUsuario = @ConsecutivoUsuario

        -- Limpiar carrito
        DELETE FROM tCarrito 
        WHERE ConsecutivoUsuario = @ConsecutivoUsuario
    END
END
return @ConsecutivoMaestro;
GO
/****** Object:  StoredProcedure [dbo].[RecuperarAccesoUsuario]    Script Date: 5/1/2025 18:26:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Procedimiento para recuperar acceso de usuario
CREATE PROCEDURE [dbo].[RecuperarAccesoUsuario]
    @Identificacion varchar(20),
    @CorreoElectronico varchar(200)
AS
BEGIN
    DECLARE @Consecutivo BIGINT

    SELECT @Consecutivo = Consecutivo
    FROM dbo.tUsuario 
    WHERE Identificacion = @Identificacion 
    AND CorreoElectronico = @CorreoElectronico
    AND Estado = 1

    IF @Consecutivo IS NOT NULL
    BEGIN
        UPDATE tUsuario
        SET Contrasenna = LEFT(NEWID(),8),
            Temporal = 1,
            Vencimiento = DATEADD(HOUR, 1, GETDATE())  
        WHERE Consecutivo = @Consecutivo
    END

    SELECT Consecutivo, Identificacion, Contrasenna, Nombre, CorreoElectronico, Estado, Temporal, Vencimiento
    FROM dbo.tUsuario
    WHERE Consecutivo = @Consecutivo
END
GO
/****** Object:  StoredProcedure [dbo].[RefacturaFactura]    Script Date: 5/1/2025 18:26:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Procedimiento para consultar detalle de facturas
Create PROCEDURE [dbo].[RefacturaFactura]
    @ConsecutivoMaestro BIGINT
AS
BEGIN
    SELECT
		   D.ConsecutivoProducto,
		   P.Consecutivo,
        
           D.Cantidad
       
        
     
   

          
          
    FROM tDetalle D
    INNER JOIN tProducto P ON D.ConsecutivoProducto = P.Consecutivo
    WHERE ConsecutivoMaestro = @ConsecutivoMaestro
END
GO
/****** Object:  StoredProcedure [dbo].[RegistrarCategoria]    Script Date: 5/1/2025 18:26:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[RegistrarCategoria]

@NombreCategoria varchar(200)

AS
 IF NOT EXISTS (SELECT 1 FROM dbo.tCategoria WHERE Nombre = @NombreCategoria)
BEGIN
INSERT INTO [dbo].[tCategoria]
           (Nombre)
     VALUES
           (@NombreCategoria)

end

GO
/****** Object:  StoredProcedure [dbo].[RegistrarInformacionEmpresa]    Script Date: 5/1/2025 18:26:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Procedimiento almacenado para Registrar infro de la empresa 
CREATE PROCEDURE [dbo].[RegistrarInformacionEmpresa]
    @NombreEmpresa VARCHAR(200),
    @Telefono VARCHAR(20),
    @CorreoElectronico VARCHAR(200),
    @Direccion VARCHAR(500),
    @AcercaDeNosotros VARCHAR(200),
    @Contactanos VARCHAR(200),
    @Politicas VARCHAR(200),
    @OrdenesDevoluciones VARCHAR(200),
    @TerminosCondiciones VARCHAR(200)
AS
BEGIN
    SET NOCOUNT OFF;
    -- Verificar si ya existe información de la empresa
    IF EXISTS (SELECT 1 FROM tInformacionEmpresa)
    BEGIN
        -- Actualizar el registro existente
        UPDATE tInformacionEmpresa
        SET NombreEmpresa = @NombreEmpresa,
            Telefono = @Telefono,
            CorreoElectronico = @CorreoElectronico,
            Direccion = @Direccion,
            AcercaDeNosotros = @AcercaDeNosotros,
            Contactanos = @Contactanos,
            Politicas = @Politicas,
            OrdenesDevoluciones = @OrdenesDevoluciones,
            TerminosCondiciones = @TerminosCondiciones
        WHERE ConsecutivoInformacion = (SELECT TOP 1 ConsecutivoInformacion FROM tInformacionEmpresa);
    END
    ELSE
    BEGIN
        -- Insertar un nuevo registro si no existe
        INSERT INTO tInformacionEmpresa (
            NombreEmpresa,
            Telefono,
            CorreoElectronico,
            Direccion,
            AcercaDeNosotros,
            Contactanos,
            Politicas,
            OrdenesDevoluciones,
            TerminosCondiciones
        ) VALUES (
            @NombreEmpresa,
            @Telefono,
            @CorreoElectronico,
            @Direccion,
            @AcercaDeNosotros,
            @Contactanos,
            @Politicas,
            @OrdenesDevoluciones,
            @TerminosCondiciones
        );
    END
END;    
GO
/****** Object:  StoredProcedure [dbo].[RegistrarProducto]    Script Date: 5/1/2025 18:26:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RegistrarProducto]
    @NombreProducto VARCHAR(200),
    @Precio DECIMAL(10,2),                      
    @Inventario INT,
    @IdCategoria INT,
    @Material VARCHAR(100),
    @Tamanio VARCHAR(50),
    @ColorBase VARCHAR(50),
    @Porcentaje_Descuento INT NULL,             
    @FechaInicioPromocion DATETIME = NULL,      
    @FechaFinPromocion DATETIME = NULL   ,
	@Descripcion varchar(255)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @IdPromocion INT = 0;

    DECLARE @PrecioConDescuento DECIMAL(10, 2) = NULL;

    -- Calcular el precio con descuento si se especifica un porcentaje de descuento
    IF @Porcentaje_Descuento IS NOT NULL
       AND @FechaInicioPromocion IS NOT NULL 
       AND @FechaFinPromocion IS NOT NULL
    BEGIN
        -- Cálculo del precio con descuento
        SET @PrecioConDescuento = @Precio * (1.0 - CAST(@Porcentaje_Descuento AS DECIMAL(5,2)) / 100.0);

        -- Insertar la promoción en la tabla tPromociones con el precio con descuento
        INSERT INTO dbo.tPromociones (En_promocion, Porcentaje_descuento, Fecha_inicio, Fecha_fin, PrecioConDescuento)
        VALUES (1, @Porcentaje_Descuento, @FechaInicioPromocion, @FechaFinPromocion, @PrecioConDescuento);

        -- Obtener el Id_promocion recién creado
        SET @IdPromocion = SCOPE_IDENTITY();
    END

    -- Verificar si el producto ya existe para evitar duplicados
    IF NOT EXISTS (SELECT 1 FROM dbo.tProducto WHERE Nombre = @NombreProducto)
    BEGIN
        -- Insertar el nuevo producto, incluyendo el ID de promoción si se especificó
        INSERT INTO dbo.tProducto(
            Nombre, Precio, Inventario, Estado, RutaImagen, IdCategoria, Material, Tamanio, ColorBase, Id_Promocion,Descripcion)
        VALUES (
            @NombreProducto, @Precio, @Inventario, 1, '', @IdCategoria, @Material, @Tamanio, @ColorBase, @IdPromocion,@Descripcion
        );

        -- Retornar el ID del nuevo producto insertado y el precio con descuento
        SELECT CONVERT(BIGINT, SCOPE_IDENTITY()) AS Consecutivo, @PrecioConDescuento AS PrecioConDescuento;
    END
    ELSE
    BEGIN
        -- Si el producto ya existe, retornamos -1 para indicar que no fue insertado
        SELECT CONVERT(BIGINT, -1) AS Consecutivo, NULL AS PrecioConDescuento;
    END
END
GO
/****** Object:  StoredProcedure [dbo].[RegistrarResenna]    Script Date: 5/1/2025 18:26:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[RegistrarResenna]
    @ConsecutivoUsuario BIGINT,
    @Calificacion INT,
    @Comentario VARCHAR(500)
AS
BEGIN

    INSERT INTO [dbo].[tResenna] (ConsecutivoUsuario, Calificacion, Comentario)
    VALUES (@ConsecutivoUsuario, @Calificacion, @Comentario);
END;
GO
/****** Object:  StoredProcedure [dbo].[RegistrarUsuario]    Script Date: 5/1/2025 18:26:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Procedimiento para registrar usuario
CREATE PROCEDURE [dbo].[RegistrarUsuario]
    @Identificacion varchar(20),
    @Contrasenna varchar(10),
    @Nombre varchar(200),
    @CorreoElectronico varchar(200)    
AS
BEGIN
    IF NOT EXISTS(SELECT 1 FROM dbo.tUsuario WHERE Identificacion = @Identificacion)
    BEGIN
        INSERT INTO dbo.tUsuario(Identificacion, Contrasenna, Nombre, CorreoElectronico, Estado, Temporal, Vencimiento, ConsecutivoRol)
        VALUES (@Identificacion, @Contrasenna, @Nombre, @CorreoElectronico, 1, 0, GETDATE(), 2)
    END
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateAvisoPrivacidad]    Script Date: 5/1/2025 18:26:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateAvisoPrivacidad]
    @Id INT,
    @TituloSeccion VARCHAR(5000),
    @Contenido VARCHAR(MAX)
AS
BEGIN
    UPDATE aviso_privacidad
    SET titulo_seccion = @TituloSeccion,
        contenido = @Contenido,
        ultima_actualizacion = GETDATE()
    WHERE id = @Id;
END;
GO
/****** Object:  StoredProcedure [dbo].[UpdateAyuda]    Script Date: 5/1/2025 18:26:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateAyuda]
    @id INT,
    @categoria VARCHAR(5000),
    @titulo VARCHAR(5000),
    @contenido VARCHAR(5000),
    @imagen_url VARCHAR(5000) = NULL
AS
BEGIN
    UPDATE Ayuda
    SET 
        categoria = @categoria,
        titulo = @titulo,
        contenido = @contenido,
        imagen_url = @imagen_url,
        ultima_actualizacion = GETDATE()
    WHERE id = @id;

    SELECT * FROM Ayuda WHERE id = @id; -- Devuelve el registro actualizado
END;
GO
/****** Object:  StoredProcedure [dbo].[UpdateBlog]    Script Date: 5/1/2025 18:26:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateBlog]
    @Id INT,
    @Categoria NVARCHAR(255),
    @Titulo NVARCHAR(255),
    @Resumen NVARCHAR(MAX),
    @Contenido NVARCHAR(MAX),
    @Imagen_url NVARCHAR(255)
AS
BEGIN
    UPDATE blog_articulos
    SET categoria = @Categoria,
        titulo = @Titulo,
        resumen = @Resumen,
        contenido = @Contenido,
        imagen_url = @Imagen_Url,
        ultima_actualizacion = GETDATE()
    WHERE id = @Id;
END;
GO
/****** Object:  StoredProcedure [dbo].[UpdatePGF]    Script Date: 5/1/2025 18:26:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdatePGF]
    @id INT,                     
    @categoria VARCHAR(5000), 
    @pregunta VARCHAR(5000),    
    @respuesta VARCHAR(5000)    
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE PreguntasFrecuentes
    SET categoria = @categoria,
        pregunta = @pregunta,
        respuesta = @respuesta,
        ultima_actualizacion = GETDATE()
    WHERE id = @id;

    -- Devuelve el registro actualizado
    SELECT id, categoria, pregunta, respuesta, ultima_actualizacion
    FROM PreguntasFrecuentes
    WHERE id = @id;
END;
GO
/****** Object:  StoredProcedure [dbo].[UpdatePoliticaDevolucion]    Script Date: 5/1/2025 18:26:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdatePoliticaDevolucion]
    @Id INT,
    @TituloSeccion NVARCHAR(255),
    @Contenido NVARCHAR(MAX)
AS
BEGIN
    UPDATE politica_devolucion
    SET titulo_seccion = @TituloSeccion,
        contenido = @Contenido,
        ultima_actualizacion = GETDATE()
    WHERE id = @Id;
END;
GO
USE [master]
GO
ALTER DATABASE [DetallesJoha] SET  READ_WRITE 
GO
