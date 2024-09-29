CREATE DATABASE [Tienda]
 
USE [Tienda]

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
/****** Object:  Table [dbo].[tCategoria]    Script Date: 8/26/2024 10:41:30 PM ******/
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
/****** Object:  Table [dbo].[tDetalle]    Script Date: 8/26/2024 10:41:30 PM ******/
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
/****** Object:  Table [dbo].[tMaestro]    Script Date: 8/26/2024 10:41:30 PM ******/
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
/****** Object:  Table [dbo].[tProducto]    Script Date: 8/26/2024 10:41:30 PM ******/
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
 CONSTRAINT [PK_tProducto] PRIMARY KEY CLUSTERED 
(
	[Consecutivo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tRol]    Script Date: 8/26/2024 10:41:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tRol](
	[ConsecutivoRol] [bigint] IDENTITY(1,1) NOT NULL,
	[NombreRol] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tRol] PRIMARY KEY CLUSTERED 
(
	[ConsecutivoRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tUsuario]    Script Date: 8/26/2024 10:41:30 PM ******/
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
	[ConsecutivoRol] [bigint] NOT NULL,
 CONSTRAINT [PK_tUsuario] PRIMARY KEY CLUSTERED 
(
	[Consecutivo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tCategoria] ON 
GO
INSERT [dbo].[tCategoria] ([IdCategoria], [Nombre]) VALUES (1, N'Accesorios')
GO
INSERT [dbo].[tCategoria] ([IdCategoria], [Nombre]) VALUES (2, N'Perifericcos')
GO
INSERT [dbo].[tCategoria] ([IdCategoria], [Nombre]) VALUES (3, N'Laptop')
GO
INSERT [dbo].[tCategoria] ([IdCategoria], [Nombre]) VALUES (4, N'varios')
GO
INSERT [dbo].[tCategoria] ([IdCategoria], [Nombre]) VALUES (5, N'Belleza')
GO
SET IDENTITY_INSERT [dbo].[tCategoria] OFF
GO
SET IDENTITY_INSERT [dbo].[tProducto] ON 
GO
INSERT [dbo].[tProducto] ([Consecutivo], [Nombre], [Precio], [Inventario], [Estado], [RutaImagen], [IdCategoria]) VALUES (1, N'Control Bluethoot', CAST(16000.00 AS Decimal(10, 2)), 2, 1, N'/Imagenes/1.jpg', 1)
GO
SET IDENTITY_INSERT [dbo].[tProducto] OFF
GO
SET IDENTITY_INSERT [dbo].[tRol] ON 
GO
INSERT [dbo].[tRol] ([ConsecutivoRol], [NombreRol]) VALUES (1, N'Administrador')
GO
INSERT [dbo].[tRol] ([ConsecutivoRol], [NombreRol]) VALUES (2, N'Cliente')
GO
SET IDENTITY_INSERT [dbo].[tRol] OFF
GO
SET IDENTITY_INSERT [dbo].[tUsuario] ON 
GO
INSERT [dbo].[tUsuario] ([Consecutivo], [Identificacion], [Contrasenna], [Nombre], [CorreoElectronico], [Estado], [Temporal], [Vencimiento], [ConsecutivoRol]) VALUES (5, N'112730030', N'1234', N'AZOFEIFA HIDALGO LEONEL ALFONSO', N'leonaap36@gmail.com', 1, 0, CAST(N'2024-08-26T22:27:14.900' AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[tUsuario] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_Identificacion]    Script Date: 8/26/2024 10:41:30 PM ******/
ALTER TABLE [dbo].[tUsuario] ADD  CONSTRAINT [UK_Identificacion] UNIQUE NONCLUSTERED 
(
	[Identificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
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
ALTER TABLE [dbo].[tUsuario]  WITH CHECK ADD  CONSTRAINT [FK_tUsuario_tRol] FOREIGN KEY([ConsecutivoRol])
REFERENCES [dbo].[tRol] ([ConsecutivoRol])
GO
ALTER TABLE [dbo].[tUsuario] CHECK CONSTRAINT [FK_tUsuario_tRol]
GO
/****** Object:  StoredProcedure [dbo].[ActualizarImagenProducto]    Script Date: 8/26/2024 10:41:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ActualizarImagenProducto]
	@Consecutivo	BIGINT,
	@RutaImagen		VARCHAR(200)
AS
BEGIN

	UPDATE dbo.tProducto
	SET RutaImagen = @RutaImagen
	WHERE Consecutivo = @Consecutivo

END
GO
/****** Object:  StoredProcedure [dbo].[ActualizarProducto]    Script Date: 8/26/2024 10:41:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ActualizarProducto]
	@Consecutivo	BIGINT,
	@NombreProducto	VARCHAR(200),
	@Precio			DECIMAL(10,2),
	@Inventario		INT,
	@IdCategoria	INT   
AS
BEGIN

	UPDATE	dbo.tProducto
	SET		Nombre = @NombreProducto,
			Precio = @Precio,
			Inventario = @Inventario,
			IdCategoria = @IdCategoria,
			Estado = 1
	WHERE	Consecutivo = @Consecutivo

END
GO
/****** Object:  StoredProcedure [dbo].[ActualizarUsuario]    Script Date: 8/26/2024 10:41:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ActualizarUsuario]
	@Consecutivo		BIGINT,
	@Contrasenna		VARCHAR(10),
	@Nombre				VARCHAR(200),
	@CorreoElectronico	VARCHAR(200)
AS
BEGIN

	UPDATE dbo.tUsuario
	   SET Contrasenna = (CASE WHEN @Contrasenna IS NULL THEN Contrasenna ELSE @Contrasenna END),
		   Nombre = @Nombre,
		   CorreoElectronico = @CorreoElectronico,
		   Temporal= 0
	 WHERE Consecutivo = @Consecutivo

END
GO
/****** Object:  StoredProcedure [dbo].[AgregarCarrito]    Script Date: 8/26/2024 10:41:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AgregarCarrito]
	@ConsecutivoUsuario bigint,
	@ConsecutivoProducto bigint,
	@Cantidad	int
AS
BEGIN

	IF NOT EXISTS(	SELECT 1 FROM dbo.tCarrito 
					WHERE	ConsecutivoUsuario = @ConsecutivoUsuario 
					AND		ConsecutivoProducto = @ConsecutivoProducto)
	BEGIN

		INSERT INTO dbo.tCarrito(ConsecutivoUsuario,ConsecutivoProducto,FechaCarrito,Cantidad)
		VALUES (@ConsecutivoUsuario,@ConsecutivoProducto,GETDATE(),@Cantidad)

	END
	ELSE
	BEGIN
		
		UPDATE	dbo.tCarrito
		   SET	FechaCarrito = GETDATE(),
				Cantidad = @Cantidad
		WHERE	ConsecutivoUsuario = @ConsecutivoUsuario 
			AND	ConsecutivoProducto = @ConsecutivoProducto

	END

END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarCarrito]    Script Date: 8/26/2024 10:41:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ConsultarCarrito]
	@ConsecutivoUsuario BIGINT
AS
BEGIN

	SELECT ConsecutivoCarrito,
		   ConsecutivoUsuario,
		   ConsecutivoProducto,
		   FechaCarrito 'Fecha',
		   Cantidad,
		   Precio,
		   Cantidad * Precio 'SubTotal',
		   (Cantidad * Precio) * 0.13 'Impuesto',
		   (Cantidad * Precio) + (Cantidad * Precio) * 0.13 'Total',
		   Nombre
	  FROM dbo.tCarrito			C
	  INNER JOIN dbo.tProducto	P	ON C.ConsecutivoProducto = P.Consecutivo
	  WHERE ConsecutivoUsuario = @ConsecutivoUsuario
	
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarDetalleFacturas]    Script Date: 8/26/2024 10:41:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ConsultarDetalleFacturas]
	@ConsecutivoMaestro BIGINT
AS
BEGIN

	SELECT	D.ConsecutivoDetalle,
			D.ConsecutivoMaestro,
			Nombre,
			Cantidad,
			D.Precio,
			SubTotal,
			Impuestos 'Impuesto',
			Total
	FROM	tDetalle D
	INNER	JOIN tProducto P ON D.ConsecutivoProducto = P.Consecutivo
	WHERE	ConsecutivoMaestro = @ConsecutivoMaestro
	
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarFacturas]    Script Date: 8/26/2024 10:41:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ConsultarFacturas]
	@ConsecutivoUsuario BIGINT
AS
BEGIN

	SELECT	ConsecutivoMaestro,
			Nombre,
			FechaCompra 'Fecha',
			SubTotal,
			Impuestos 'Impuesto',
			Total
	FROM	tMaestro M
	INNER	JOIN tUsuario U ON M.ConsecutivoUsuario = U.Consecutivo
	WHERE	ConsecutivoUsuario = @ConsecutivoUsuario
	
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarProducto]    Script Date: 8/26/2024 10:41:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ConsultarProducto]
	@Consecutivo BIGINT
AS
BEGIN
	SELECT	Consecutivo, P.Nombre 'NombreProducto', Precio, Inventario, Estado, RutaImagen, P.IdCategoria, C.Nombre 'NombreCategoria'
	FROM	tProducto P
	INNER JOIN	tCategoria C ON P.IdCategoria = C.IdCategoria
	WHERE	Consecutivo = @Consecutivo
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarProductos]    Script Date: 8/26/2024 10:41:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ConsultarProductos]
	@MostrarTodos BIT
AS
BEGIN

	IF(@MostrarTodos = 1)
	BEGIN
		SELECT	Consecutivo, P.Nombre 'NombreProducto', Precio, Inventario, Estado, RutaImagen, P.IdCategoria, C.Nombre 'NombreCategoria'
		FROM	tProducto P
		INNER JOIN	tCategoria C ON P.IdCategoria = C.IdCategoria
	END
	ELSE
	BEGIN
		SELECT	Consecutivo, P.Nombre 'NombreProducto', Precio, Inventario, Estado, RutaImagen, P.IdCategoria, C.Nombre 'NombreCategoria'
		FROM	tProducto P
		INNER JOIN	tCategoria C ON P.IdCategoria = C.IdCategoria
		WHERE	Inventario > 0
			AND Estado = 1
	END
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarTiposCategoria]    Script Date: 8/26/2024 10:41:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[ConsultarTiposCategoria]

AS
BEGIN

	SELECT	IdCategoria, Nombre 'NombreCategoria'
	FROM	tCategoria

END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarUsuario]    Script Date: 8/26/2024 10:41:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ConsultarUsuario]
	@Consecutivo BIGINT
AS
BEGIN

	SELECT	Consecutivo,Identificacion,Nombre,CorreoElectronico,Estado,Temporal,Vencimiento,U.ConsecutivoRol,R.NombreRol
	FROM	dbo.tUsuario U
	INNER   JOIN dbo.tRol R ON U.ConsecutivoRol = R.ConsecutivoRol
	WHERE	Consecutivo = @Consecutivo

END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarVentas]    Script Date: 8/26/2024 10:41:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ConsultarVentas]

AS
BEGIN

	SET LANGUAGE Spanish

	SELECT	DateName( month , DateAdd( month , MONTH(GETDATE()) , -1 )) 'Mes', 
			SUM(M.Total)												'TotalMes'
	FROM	tMaestro M
	WHERE	MONTH(M.FechaCompra) = MONTH(GETDATE()) 
	
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarVentasMensuales]    Script Date: 8/26/2024 10:41:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ConsultarVentasMensuales]

AS
BEGIN

	SET LANGUAGE Spanish

	SELECT Mes, TotalMes
	FROM (

		SELECT	DateName( month , DateAdd( month , MONTH(FechaCompra) , -1 ))	'Mes',  
				SUM(M.Total)													'TotalMes',
				MONTH(FechaCompra)												'NumeroMes'
		FROM	tMaestro M
		GROUP BY DateName( month , DateAdd( month , MONTH(FechaCompra) , -1 )), MONTH(FechaCompra)	

	)X 
	ORDER BY NumeroMes

	
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarVentasUsuario]    Script Date: 8/26/2024 10:41:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ConsultarVentasUsuario]

AS
BEGIN

	SELECT	TOP 1	
			U.Identificacion + ' - ' + U.Nombre							'NombreUsuario', 
			SUM(M.Total)												'TotalUsuario'
	FROM	tMaestro M
	INNER JOIN tUsuario U ON M.ConsecutivoUsuario = U.Consecutivo
	WHERE	MONTH(M.FechaCompra) = MONTH(GETDATE()) 
	GROUP BY U.Identificacion + ' - ' + U.Nombre	
	ORDER BY SUM(M.Total) DESC
	
END
GO
/****** Object:  StoredProcedure [dbo].[EliminarCarrito]    Script Date: 8/26/2024 10:41:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[EliminarCarrito]
	@ConsecutivoCarrito	BIGINT
AS
BEGIN

	DELETE FROM tCarrito WHERE ConsecutivoCarrito = @ConsecutivoCarrito

END
GO
/****** Object:  StoredProcedure [dbo].[EliminarProducto]    Script Date: 8/26/2024 10:41:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[EliminarProducto]
	@Consecutivo	BIGINT
AS
BEGIN

	UPDATE dbo.tProducto
	SET Estado = 0
	WHERE Consecutivo = @Consecutivo

END
GO
/****** Object:  StoredProcedure [dbo].[IniciarSesionUsuario]    Script Date: 8/26/2024 10:41:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[IniciarSesionUsuario]
	@Identificacion		varchar(20),
    @Contrasenna		varchar(10)
AS
BEGIN

	SELECT	Consecutivo,Identificacion,Nombre,CorreoElectronico,Estado,Temporal,Vencimiento,U.ConsecutivoRol,R.NombreRol
	FROM	dbo.tUsuario U
	INNER   JOIN dbo.tRol R ON U.ConsecutivoRol = R.ConsecutivoRol
	WHERE	Identificacion = @Identificacion
		AND Contrasenna = @Contrasenna
		AND Estado = 1

END
GO
/****** Object:  StoredProcedure [dbo].[PagarCarrito]    Script Date: 8/26/2024 10:41:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PagarCarrito]
	@ConsecutivoUsuario BIGINT
AS
BEGIN

	IF NOT EXISTS(	SELECT 1 FROM tCarrito C
				INNER JOIN tProducto P ON C.ConsecutivoProducto = P.Consecutivo
				WHERE	ConsecutivoUsuario = @ConsecutivoUsuario
					AND (P.Inventario - C.Cantidad) < 0)
	BEGIN
	
		-->MAESTRO
		INSERT INTO dbo.tMaestro(ConsecutivoUsuario,FechaCompra,SubTotal,Impuestos,Total)
		SELECT	ConsecutivoUsuario,GETDATE(),SUM(P.Precio * Cantidad),SUM(P.Precio * Cantidad) * 0.13,SUM(P.Precio * Cantidad) + SUM(P.Precio * Cantidad) * 0.13
		FROM	tCarrito C
		INNER	JOIN tProducto P ON C.ConsecutivoProducto = P.Consecutivo
		WHERE	ConsecutivoUsuario = @ConsecutivoUsuario
		GROUP	BY ConsecutivoUsuario

	
		-->DETALLE
		INSERT	INTO dbo.tDetalle(ConsecutivoMaestro,ConsecutivoProducto,Cantidad,Precio,SubTotal,Impuestos,Total)
		SELECT	@@IDENTITY,ConsecutivoProducto,Cantidad,P.Precio,(P.Precio * Cantidad),(P.Precio * Cantidad) * 0.13,(P.Precio * Cantidad) + (P.Precio * Cantidad) * 0.13
		FROM	tCarrito C
		INNER	JOIN tProducto P ON C.ConsecutivoProducto = P.Consecutivo
		WHERE	ConsecutivoUsuario = @ConsecutivoUsuario

	   
		-->INVENTARIO
		UPDATE	P
		SET		Inventario = Inventario - Cantidad
		FROM	tProducto P
		INNER	JOIN tCarrito C ON P.Consecutivo = C.ConsecutivoProducto
		WHERE	ConsecutivoUsuario = @ConsecutivoUsuario


		-->LIMPIAR CARRITO
		DELETE	FROM tCarrito 
		WHERE	ConsecutivoUsuario = @ConsecutivoUsuario

	END

END
GO
/****** Object:  StoredProcedure [dbo].[RecuperarAccesoUsuario]    Script Date: 8/26/2024 10:41:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RecuperarAccesoUsuario]
	@Identificacion		varchar(20),
    @CorreoElectronico	varchar(200)
AS
BEGIN

	DECLARE @Consecutivo BIGINT

	SELECT	@Consecutivo = Consecutivo
	FROM	dbo.tUsuario WHERE	Identificacion = @Identificacion 
						AND CorreoElectronico = @CorreoElectronico
						AND Estado = 1

	IF @Consecutivo IS NOT NULL
	BEGIN
		UPDATE	tUsuario
		SET		Contrasenna = LEFT(NEWID(),8),
				Temporal = 1,
				Vencimiento = DATEADD(HOUR, 1, GETDATE())  
		WHERE	Consecutivo = @Consecutivo
	END

	SELECT	Consecutivo,Identificacion,Contrasenna,Nombre,CorreoElectronico,Estado,Temporal,Vencimiento
	FROM	dbo.tUsuario
	WHERE	Consecutivo = @Consecutivo

END
GO
/****** Object:  StoredProcedure [dbo].[RegistrarProducto]    Script Date: 8/26/2024 10:41:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RegistrarProducto]
	@NombreProducto	VARCHAR(200),
	@Precio			DECIMAL(10,2),
	@Inventario		INT,
	@IdCategoria	INT   
AS
BEGIN

	IF NOT EXISTS(SELECT 1 FROM dbo.tProducto WHERE Nombre = @NombreProducto)
	BEGIN

		INSERT INTO dbo.tProducto(Nombre,Precio,Inventario,Estado,RutaImagen,IdCategoria)
		VALUES (@NombreProducto,@Precio,@Inventario,1,'',@IdCategoria)

		SELECT CONVERT(BIGINT,@@IDENTITY) Consecutivo

	END
	ELSE
	BEGIN
		SELECT CONVERT(BIGINT,-1) Consecutivo
	END

END
GO
/****** Object:  StoredProcedure [dbo].[RegistrarUsuario]    Script Date: 8/26/2024 10:41:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RegistrarUsuario]
	@Identificacion		varchar(20),
    @Contrasenna		varchar(10),
    @Nombre				varchar(200),
    @CorreoElectronico	varchar(200)    
AS
BEGIN

	IF NOT EXISTS(SELECT 1 FROM dbo.tUsuario WHERE Identificacion = @Identificacion)
	BEGIN

		INSERT INTO dbo.tUsuario(Identificacion,Contrasenna,Nombre,CorreoElectronico,Estado,Temporal,Vencimiento,ConsecutivoRol)
		VALUES (@Identificacion,@Contrasenna,@Nombre,@CorreoElectronico,1,0,GETDATE(),2)

	END

END
GO
USE [master]
GO
ALTER DATABASE [Tienda] SET  READ_WRITE 
GO
