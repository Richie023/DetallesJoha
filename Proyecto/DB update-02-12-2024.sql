USE [master]
GO
/****** Object:  Database [DetallesJoha]    Script Date: 12/2/2024 4:03:10 PM ******/
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
/****** Object:  Table [dbo].[aviso_privacidad]    Script Date: 12/2/2024 4:03:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aviso_privacidad](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[titulo_seccion] [varchar](5000) NOT NULL,
	[subtitulo_seccion] [varchar](5000) NULL,
	[contenido] [varchar](max) NOT NULL,
	[orden] [int] NOT NULL,
	[ultima_actualizacion] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ayuda]    Script Date: 12/2/2024 4:03:10 PM ******/
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
/****** Object:  Table [dbo].[blog_articulos]    Script Date: 12/2/2024 4:03:10 PM ******/
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
/****** Object:  Table [dbo].[politica_devolucion]    Script Date: 12/2/2024 4:03:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[politica_devolucion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[titulo_seccion] [varchar](5000) NOT NULL,
	[subtitulo_seccion] [varchar](5000) NULL,
	[contenido] [varchar](max) NOT NULL,
	[orden] [int] NOT NULL,
	[ultima_actualizacion] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PreguntasFrecuentes]    Script Date: 12/2/2024 4:03:10 PM ******/
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
/****** Object:  Table [dbo].[tCarrito]    Script Date: 12/2/2024 4:03:10 PM ******/
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
/****** Object:  Table [dbo].[tCategoria]    Script Date: 12/2/2024 4:03:10 PM ******/
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
/****** Object:  Table [dbo].[tDetalle]    Script Date: 12/2/2024 4:03:10 PM ******/
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
/****** Object:  Table [dbo].[tInformacionEmpresa]    Script Date: 12/2/2024 4:03:10 PM ******/
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
/****** Object:  Table [dbo].[tMaestro]    Script Date: 12/2/2024 4:03:10 PM ******/
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
/****** Object:  Table [dbo].[tProducto]    Script Date: 12/2/2024 4:03:10 PM ******/
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
 CONSTRAINT [PK_tProducto] PRIMARY KEY CLUSTERED 
(
	[Consecutivo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tPromociones]    Script Date: 12/2/2024 4:03:10 PM ******/
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
/****** Object:  Table [dbo].[tResenna]    Script Date: 12/2/2024 4:03:10 PM ******/
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
/****** Object:  Table [dbo].[tRol]    Script Date: 12/2/2024 4:03:10 PM ******/
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
/****** Object:  Table [dbo].[tUsuario]    Script Date: 12/2/2024 4:03:10 PM ******/
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
SET IDENTITY_INSERT [dbo].[tCategoria] OFF
GO
SET IDENTITY_INSERT [dbo].[tDetalle] ON 

INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (1, 1, 3, 5, CAST(16000.00 AS Decimal(18, 2)), CAST(80000.00 AS Decimal(18, 2)), CAST(10400.00 AS Decimal(18, 2)), CAST(90400.00 AS Decimal(18, 2)))
INSERT [dbo].[tDetalle] ([ConsecutivoDetalle], [ConsecutivoMaestro], [ConsecutivoProducto], [Cantidad], [Precio], [SubTotal], [Impuestos], [Total]) VALUES (2, 2, 3, 4, CAST(16000.00 AS Decimal(18, 2)), CAST(64000.00 AS Decimal(18, 2)), CAST(8320.00 AS Decimal(18, 2)), CAST(72320.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[tDetalle] OFF
GO
SET IDENTITY_INSERT [dbo].[tInformacionEmpresa] ON 

INSERT [dbo].[tInformacionEmpresa] ([ConsecutivoInformacion], [NombreEmpresa], [Telefono], [CorreoElectronico], [Direccion], [AcercaDeNosotros], [Contactanos], [Politicas], [OrdenesDevoluciones], [TerminosCondiciones]) VALUES (1, N'84177454', N'leonaap36@gmail.com', N'pavas rhormoser , 100 mts y 75 mts del super boulevard', N'dadas', N'asdad', N'sadsada', N'112730030', N'asdasdas', N'asdasda')
SET IDENTITY_INSERT [dbo].[tInformacionEmpresa] OFF
GO
SET IDENTITY_INSERT [dbo].[tMaestro] ON 

INSERT [dbo].[tMaestro] ([ConsecutivoMaestro], [ConsecutivoUsuario], [FechaCompra], [SubTotal], [Impuestos], [Total]) VALUES (1, 2, CAST(N'2024-12-02T01:20:15.423' AS DateTime), CAST(80000.00 AS Decimal(18, 2)), CAST(10400.00 AS Decimal(18, 2)), CAST(90400.00 AS Decimal(18, 2)))
INSERT [dbo].[tMaestro] ([ConsecutivoMaestro], [ConsecutivoUsuario], [FechaCompra], [SubTotal], [Impuestos], [Total]) VALUES (2, 2, CAST(N'2024-12-02T15:27:43.723' AS DateTime), CAST(64000.00 AS Decimal(18, 2)), CAST(8320.00 AS Decimal(18, 2)), CAST(72320.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[tMaestro] OFF
GO
SET IDENTITY_INSERT [dbo].[tProducto] ON 

INSERT [dbo].[tProducto] ([Consecutivo], [Nombre], [Precio], [Inventario], [Estado], [RutaImagen], [IdCategoria], [Material], [Tamanio], [ColorBase], [Id_Promocion]) VALUES (1, N'Cojín', CAST(25000.00 AS Decimal(10, 2)), 100, 1, N'/Imagenes/1.jpg', 9, N'aluminio', N'Grande', N'#000000', NULL)
INSERT [dbo].[tProducto] ([Consecutivo], [Nombre], [Precio], [Inventario], [Estado], [RutaImagen], [IdCategoria], [Material], [Tamanio], [ColorBase], [Id_Promocion]) VALUES (2, N'Botella', CAST(16000.00 AS Decimal(10, 2)), 3, 1, N'/Imagenes/2.jpg', 11, N'acero inoxidable', N'Grande', N'#000000', NULL)
INSERT [dbo].[tProducto] ([Consecutivo], [Nombre], [Precio], [Inventario], [Estado], [RutaImagen], [IdCategoria], [Material], [Tamanio], [ColorBase], [Id_Promocion]) VALUES (3, N'Taza', CAST(16000.00 AS Decimal(10, 2)), 91, 1, N'/Imagenes/3.jpg', 6, N'acero inoxidable', N'Mediano', N'#000000', NULL)
SET IDENTITY_INSERT [dbo].[tProducto] OFF
GO
SET IDENTITY_INSERT [dbo].[tRol] ON 

INSERT [dbo].[tRol] ([ConsecutivoRol], [NombreRol]) VALUES (1, N'Administrador')
INSERT [dbo].[tRol] ([ConsecutivoRol], [NombreRol]) VALUES (2, N'Cliente')
SET IDENTITY_INSERT [dbo].[tRol] OFF
GO
SET IDENTITY_INSERT [dbo].[tUsuario] ON 

INSERT [dbo].[tUsuario] ([Consecutivo], [Identificacion], [Contrasenna], [Nombre], [CorreoElectronico], [Estado], [Temporal], [Vencimiento], [ConsecutivoRol]) VALUES (1, N'112730030', N'123', N'LEONEL ALFONSO AZOFEIFA HIDALGO', N'leonaap36@gmail.com', 1, 0, CAST(N'2024-11-30T21:41:31.143' AS DateTime), 1)
INSERT [dbo].[tUsuario] ([Consecutivo], [Identificacion], [Contrasenna], [Nombre], [CorreoElectronico], [Estado], [Temporal], [Vencimiento], [ConsecutivoRol]) VALUES (2, N'112650215', N'1234', N'KATTERINE CHAN SANCHEZ', N'leonaap36@gmail.com', 1, 0, CAST(N'2024-12-01T15:32:25.253' AS DateTime), 2)
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
/****** Object:  StoredProcedure [dbo].[ActualizarImagenProducto]    Script Date: 12/2/2024 4:03:10 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ActualizarInfo]    Script Date: 12/2/2024 4:03:10 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ActualizarProducto]    Script Date: 12/2/2024 4:03:10 PM ******/
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
	@Id_Promocion int
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
		Id_Promocion = @Id_Promocion
    WHERE Consecutivo = @Consecutivo
END
GO
/****** Object:  StoredProcedure [dbo].[ActualizarUsuario]    Script Date: 12/2/2024 4:03:10 PM ******/
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
/****** Object:  StoredProcedure [dbo].[AgregarCarrito]    Script Date: 12/2/2024 4:03:10 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ColsultarAvisoPrivacidad]    Script Date: 12/2/2024 4:03:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ColsultarAvisoPrivacidad]
AS
BEGIN
    SELECT id, titulo_seccion, subtitulo_seccion, contenido, orden, ultima_actualizacion
    FROM aviso_privacidad
    ORDER BY orden;
END;
GO
/****** Object:  StoredProcedure [dbo].[ColsultarAyuda]    Script Date: 12/2/2024 4:03:10 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ColsultarBlogs]    Script Date: 12/2/2024 4:03:10 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ColsultarPoliticaDevolucion]    Script Date: 12/2/2024 4:03:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ColsultarPoliticaDevolucion]
AS
BEGIN
    SELECT id, titulo_seccion, subtitulo_seccion, contenido, orden, ultima_actualizacion
    FROM politica_devolucion
    ORDER BY orden;
END;
GO
/****** Object:  StoredProcedure [dbo].[ColsutarPGF]    Script Date: 12/2/2024 4:03:10 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ConsultarCarrito]    Script Date: 12/2/2024 4:03:10 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ConsultarDetalleFacturas]    Script Date: 12/2/2024 4:03:10 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ConsultarFacturas]    Script Date: 12/2/2024 4:03:10 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ConsultarPedidos]    Script Date: 12/2/2024 4:03:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultarPedidos]
   
AS
BEGIN
    SELECT D.ConsecutivoDetalle,
           D.ConsecutivoMaestro,
		   P.Consecutivo,
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
/****** Object:  StoredProcedure [dbo].[ConsultarProducto]    Script Date: 12/2/2024 4:03:10 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ConsultarProductos]    Script Date: 12/2/2024 4:03:10 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ConsultarProductosPorRangoPrecio]    Script Date: 12/2/2024 4:03:10 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ConsultarResennas]    Script Date: 12/2/2024 4:03:10 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ConsultarRoles]    Script Date: 12/2/2024 4:03:10 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ConsultarTiposCategoria]    Script Date: 12/2/2024 4:03:10 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ConsultarUsuario]    Script Date: 12/2/2024 4:03:10 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ConsultarUsuarios]    Script Date: 12/2/2024 4:03:10 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ConsultarVentas]    Script Date: 12/2/2024 4:03:10 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ConsultarVentasMensuales]    Script Date: 12/2/2024 4:03:10 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ConsultarVentasUsuario]    Script Date: 12/2/2024 4:03:10 PM ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteAvisoPrivacidad]    Script Date: 12/2/2024 4:03:10 PM ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteAyuda]    Script Date: 12/2/2024 4:03:10 PM ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteBlog]    Script Date: 12/2/2024 4:03:10 PM ******/
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
/****** Object:  StoredProcedure [dbo].[DeletePGF]    Script Date: 12/2/2024 4:03:10 PM ******/
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
/****** Object:  StoredProcedure [dbo].[DeletePoliticaDevolucion]    Script Date: 12/2/2024 4:03:10 PM ******/
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
/****** Object:  StoredProcedure [dbo].[EliminarAyuda]    Script Date: 12/2/2024 4:03:10 PM ******/
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
/****** Object:  StoredProcedure [dbo].[EliminarCarrito]    Script Date: 12/2/2024 4:03:10 PM ******/
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
/****** Object:  StoredProcedure [dbo].[EliminarProducto]    Script Date: 12/2/2024 4:03:10 PM ******/
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
/****** Object:  StoredProcedure [dbo].[FiltrarProductosPorCaracteristicas]    Script Date: 12/2/2024 4:03:10 PM ******/
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
/****** Object:  StoredProcedure [dbo].[FiltrarProductosPorCategoria]    Script Date: 12/2/2024 4:03:10 PM ******/
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
/****** Object:  StoredProcedure [dbo].[InactivaUsuario]    Script Date: 12/2/2024 4:03:10 PM ******/
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
/****** Object:  StoredProcedure [dbo].[IniciarSesionUsuario]    Script Date: 12/2/2024 4:03:10 PM ******/
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
/****** Object:  StoredProcedure [dbo].[InsertAvisoPrivacidad]    Script Date: 12/2/2024 4:03:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertAvisoPrivacidad]
    @TituloSeccion NVARCHAR(255),
    @SubtituloSeccion NVARCHAR(255),
    @Contenido NVARCHAR(MAX),
    @Orden INT
AS
BEGIN
    INSERT INTO aviso_privacidad (titulo_seccion, subtitulo_seccion, contenido, orden)
    VALUES (@TituloSeccion, @SubtituloSeccion, @Contenido, @Orden);
END;
GO
/****** Object:  StoredProcedure [dbo].[InsertAyuda]    Script Date: 12/2/2024 4:03:10 PM ******/
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
/****** Object:  StoredProcedure [dbo].[InsertBlog]    Script Date: 12/2/2024 4:03:10 PM ******/
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
/****** Object:  StoredProcedure [dbo].[InsertPGF]    Script Date: 12/2/2024 4:03:10 PM ******/
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
/****** Object:  StoredProcedure [dbo].[InsertPoliticaDevolucion]    Script Date: 12/2/2024 4:03:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--2.  Procedimiento de politica de dvolucion
CREATE PROCEDURE [dbo].[InsertPoliticaDevolucion]
    @TituloSeccion NVARCHAR(255),
    @SubtituloSeccion NVARCHAR(255),
    @Contenido NVARCHAR(MAX),
    @Orden INT
AS
BEGIN
    INSERT INTO politica_devolucion (titulo_seccion, subtitulo_seccion, contenido, orden)
    VALUES (@TituloSeccion, @SubtituloSeccion, @Contenido, @Orden);
END;
GO
/****** Object:  StoredProcedure [dbo].[PagarCarrito]    Script Date: 12/2/2024 4:03:10 PM ******/
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
GO
/****** Object:  StoredProcedure [dbo].[RecuperarAccesoUsuario]    Script Date: 12/2/2024 4:03:10 PM ******/
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
/****** Object:  StoredProcedure [dbo].[RefacturaFactura]    Script Date: 12/2/2024 4:03:10 PM ******/
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
/****** Object:  StoredProcedure [dbo].[RegistrarInformacionEmpresa]    Script Date: 12/2/2024 4:03:10 PM ******/
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
/****** Object:  StoredProcedure [dbo].[RegistrarProducto]    Script Date: 12/2/2024 4:03:10 PM ******/
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
    @FechaFinPromocion DATETIME = NULL          
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
            Nombre, Precio, Inventario, Estado, RutaImagen, IdCategoria, Material, Tamanio, ColorBase, Id_Promocion)
        VALUES (
            @NombreProducto, @Precio, @Inventario, 1, '', @IdCategoria, @Material, @Tamanio, @ColorBase, @IdPromocion
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
/****** Object:  StoredProcedure [dbo].[RegistrarResenna]    Script Date: 12/2/2024 4:03:10 PM ******/
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
/****** Object:  StoredProcedure [dbo].[RegistrarUsuario]    Script Date: 12/2/2024 4:03:10 PM ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateAvisoPrivacidad]    Script Date: 12/2/2024 4:03:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateAvisoPrivacidad]
    @Id INT,
    @TituloSeccion NVARCHAR(255),
    @SubtituloSeccion NVARCHAR(255),
    @Contenido NVARCHAR(MAX),
    @Orden INT
AS
BEGIN
    UPDATE aviso_privacidad
    SET titulo_seccion = @TituloSeccion,
        subtitulo_seccion = @SubtituloSeccion,
        contenido = @Contenido,
        orden = @Orden,
        ultima_actualizacion = GETDATE()
    WHERE id = @Id;
END;
GO
/****** Object:  StoredProcedure [dbo].[UpdateAyuda]    Script Date: 12/2/2024 4:03:10 PM ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateBlog]    Script Date: 12/2/2024 4:03:10 PM ******/
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
/****** Object:  StoredProcedure [dbo].[UpdatePGF]    Script Date: 12/2/2024 4:03:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdatePGF]
    @Id INT,                     
    @Categoria VARCHAR(5000), 
    @Pregunta VARCHAR(5000),    
    @Respuesta VARCHAR(5000)    
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE PreguntasFrecuentes
    SET categoria = @Categoria,
        pregunta = @Pregunta,
        respuesta = @Respuesta,
        ultima_actualizacion = GETDATE()
    WHERE id = @Id;

    -- Devuelve el registro actualizado
    SELECT id, categoria, pregunta, respuesta, ultima_actualizacion
    FROM PreguntasFrecuentes
    WHERE id = @Id;
END;
GO
/****** Object:  StoredProcedure [dbo].[UpdatePoliticaDevolucion]    Script Date: 12/2/2024 4:03:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdatePoliticaDevolucion]
    @Id INT,
    @TituloSeccion NVARCHAR(255),
    @SubtituloSeccion NVARCHAR(255),
    @Contenido NVARCHAR(MAX),
    @Orden INT
AS
BEGIN
    UPDATE politica_devolucion
    SET titulo_seccion = @TituloSeccion,
        subtitulo_seccion = @SubtituloSeccion,
        contenido = @Contenido,
        orden = @Orden,
        ultima_actualizacion = GETDATE()
    WHERE id = @Id;
END;
GO
USE [master]
GO
ALTER DATABASE [DetallesJoha] SET  READ_WRITE 
GO
