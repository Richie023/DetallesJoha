-- Crear la base de datos
CREATE DATABASE [DetallesJoha]
GO

USE [DetallesJoha]
GO

-- Crear tabla tCategoria
CREATE TABLE [dbo].[tCategoria](
    [IdCategoria] [int] IDENTITY(1,1) NOT NULL,
    [Nombre] [varchar](200) NOT NULL,
 CONSTRAINT [PK_tCategorias] PRIMARY KEY CLUSTERED ([IdCategoria] ASC)
)
GO

-- Crear tabla tProducto
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
 CONSTRAINT [PK_tProducto] PRIMARY KEY CLUSTERED ([Consecutivo] ASC)
)
GO

-- Crear tabla tRol
CREATE TABLE [dbo].[tRol](
    [ConsecutivoRol] [bigint] IDENTITY(1,1) NOT NULL,
    [NombreRol] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tRol] PRIMARY KEY CLUSTERED ([ConsecutivoRol] ASC)
)
GO

-- Crear tabla tUsuario
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
 CONSTRAINT [PK_tUsuario] PRIMARY KEY CLUSTERED ([Consecutivo] ASC)
)
GO

-- Crear tabla tCarrito
CREATE TABLE [dbo].[tCarrito](
    [ConsecutivoCarrito] [bigint] IDENTITY(1,1) NOT NULL,
    [ConsecutivoUsuario] [bigint] NOT NULL,
    [ConsecutivoProducto] [bigint] NOT NULL,
    [FechaCarrito] [datetime] NOT NULL,
    [Cantidad] [int] NOT NULL,
 CONSTRAINT [PK_tCarrito] PRIMARY KEY CLUSTERED ([ConsecutivoCarrito] ASC)
)
GO

-- Crear tabla tMaestro
CREATE TABLE [dbo].[tMaestro](
    [ConsecutivoMaestro] [bigint] IDENTITY(1,1) NOT NULL,
    [ConsecutivoUsuario] [bigint] NOT NULL,
    [FechaCompra] [datetime] NOT NULL,
    [SubTotal] [decimal](18, 2) NOT NULL,
    [Impuestos] [decimal](18, 2) NOT NULL,
    [Total] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_tMaestro] PRIMARY KEY CLUSTERED ([ConsecutivoMaestro] ASC)
)
GO

-- Crear tabla tDetalle
CREATE TABLE [dbo].[tDetalle](
    [ConsecutivoDetalle] [bigint] IDENTITY(1,1) NOT NULL,
    [ConsecutivoMaestro] [bigint] NOT NULL,
    [ConsecutivoProducto] [bigint] NOT NULL,
    [Cantidad] [int] NOT NULL,
    [Precio] [decimal](18, 2) NOT NULL,
    [SubTotal] [decimal](18, 2) NOT NULL,
    [Impuestos] [decimal](18, 2) NOT NULL,
    [Total] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_tDetalle] PRIMARY KEY CLUSTERED ([ConsecutivoDetalle] ASC)
)
    -- Tabla de info empresa
CREATE TABLE tInformacionEmpresa (
    ConsecutivoInformacion BIGINT IDENTITY(1,1) PRIMARY KEY,
    NombreEmpresa VARCHAR(200) NOT NULL,
    Telefono VARCHAR(20) NOT NULL,
    CorreoElectronico VARCHAR(200) NOT NULL,
    Direccion VARCHAR(500)  NOT NULL,
    AcercaDeNosotros VARCHAR(200) NULL,
    Contactanos  VARCHAR(200) NULL,
    Politicas  VARCHAR(200)  NULL,
    OrdenesDevoluciones  VARCHAR(200) NULL,
    TerminosCondiciones  VARCHAR(200)  NULL
);

GO


-- Agregar claves foráneas
ALTER TABLE [dbo].[tProducto] ADD CONSTRAINT [FK_tProducto_tCategorias] FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[tCategoria] ([IdCategoria])
GO

ALTER TABLE [dbo].[tUsuario] ADD CONSTRAINT [FK_tUsuario_tRol] FOREIGN KEY([ConsecutivoRol])
REFERENCES [dbo].[tRol] ([ConsecutivoRol])
GO

ALTER TABLE [dbo].[tCarrito] ADD CONSTRAINT [FK_tCarrito_tProducto] FOREIGN KEY([ConsecutivoProducto])
REFERENCES [dbo].[tProducto] ([Consecutivo])
GO

ALTER TABLE [dbo].[tCarrito] ADD CONSTRAINT [FK_tCarrito_tUsuario] FOREIGN KEY([ConsecutivoUsuario])
REFERENCES [dbo].[tUsuario] ([Consecutivo])
GO

ALTER TABLE [dbo].[tMaestro] ADD CONSTRAINT [FK_tMaestro_tUsuario] FOREIGN KEY([ConsecutivoUsuario])
REFERENCES [dbo].[tUsuario] ([Consecutivo])
GO

ALTER TABLE [dbo].[tDetalle] ADD CONSTRAINT [FK_tDetalle_tMaestro] FOREIGN KEY([ConsecutivoMaestro])
REFERENCES [dbo].[tMaestro] ([ConsecutivoMaestro])
GO

ALTER TABLE [dbo].[tDetalle] ADD CONSTRAINT [FK_tDetalle_tProducto] FOREIGN KEY([ConsecutivoProducto])
REFERENCES [dbo].[tProducto] ([Consecutivo])
GO

-- Insertar categorías iniciales
INSERT INTO [dbo].[tCategoria] (Nombre) VALUES 
('Botellas'), ('Gorras'), ('Camisetas'), ('Tazas'), ('Accesorios'), ('Llaveros'), ('Mousepads');

-- Insertar roles iniciales
INSERT INTO [dbo].[tRol] (NombreRol) VALUES ('Administrador'), ('Cliente');
GO
-- Procedimientos almacenados

-- Procedimiento para registrar producto
CREATE PROCEDURE [dbo].[RegistrarProducto]
    @NombreProducto VARCHAR(200),
    @Precio DECIMAL(10,2),
    @Inventario INT,
    @IdCategoria INT,
    @Material VARCHAR(100),
    @Tamanio VARCHAR(50),
    @ColorBase VARCHAR(50)
AS
BEGIN
    IF NOT EXISTS(SELECT 1 FROM dbo.tProducto WHERE Nombre = @NombreProducto)
    BEGIN
        INSERT INTO dbo.tProducto(Nombre, Precio, Inventario, Estado, RutaImagen, IdCategoria, Material, Tamanio, ColorBase)
        VALUES (@NombreProducto, @Precio, @Inventario, 1, '', @IdCategoria, @Material, @Tamanio, @ColorBase)

        SELECT CONVERT(BIGINT,@@IDENTITY) Consecutivo
    END
    ELSE
    BEGIN
        SELECT CONVERT(BIGINT,-1) Consecutivo
    END
END
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
    @ColorBase VARCHAR(50)
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
        Estado = 1
    WHERE Consecutivo = @Consecutivo
END
GO

-- Procedimiento para consultar producto
CREATE PROCEDURE [dbo].[ConsultarProducto]
    @Consecutivo BIGINT
AS
BEGIN
    SELECT Consecutivo, P.Nombre 'NombreProducto', Precio, Inventario, Estado, RutaImagen, 
           P.IdCategoria, C.Nombre 'NombreCategoria', Material, Tamanio, ColorBase
    FROM tProducto P
    INNER JOIN tCategoria C ON P.IdCategoria = C.IdCategoria
    WHERE Consecutivo = @Consecutivo
END
GO

-- Procedimiento para consultar productos
CREATE PROCEDURE [dbo].[ConsultarProductos]
    @MostrarTodos BIT
AS
BEGIN
    IF(@MostrarTodos = 1)
    BEGIN
        SELECT Consecutivo, P.Nombre 'NombreProducto', Precio, Inventario, Estado, RutaImagen, 
               P.IdCategoria, C.Nombre 'NombreCategoria', Material, Tamanio, ColorBase
        FROM tProducto P
        INNER JOIN tCategoria C ON P.IdCategoria = C.IdCategoria
    END
    ELSE
    BEGIN
        SELECT Consecutivo, P.Nombre 'NombreProducto', Precio, Inventario, Estado, RutaImagen, 
               P.IdCategoria, C.Nombre 'NombreCategoria', Material, Tamanio, ColorBase
        FROM tProducto P
        INNER JOIN tCategoria C ON P.IdCategoria = C.IdCategoria
        WHERE Inventario > 0 AND Estado = 1
    END
END
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

-- Procedimiento para actualizar usuario
CREATE PROCEDURE [dbo].[ActualizarUsuario]
    @Consecutivo BIGINT,
    @Contrasenna varchar(10),
    @Nombre varchar(200),
    @CorreoElectronico varchar(200)
AS
BEGIN
    UPDATE dbo.tUsuario
    SET Contrasenna = (CASE WHEN @Contrasenna IS NULL THEN Contrasenna ELSE @Contrasenna END),
        Nombre = @Nombre,
        CorreoElectronico = @CorreoElectronico,
        Temporal = 0
    WHERE Consecutivo = @Consecutivo
END
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

-- Procedimiento para eliminar del carrito
CREATE PROCEDURE [dbo].[EliminarCarrito]
    @ConsecutivoCarrito BIGINT
AS
BEGIN
    DELETE FROM tCarrito WHERE ConsecutivoCarrito = @ConsecutivoCarrito
END
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

-- Procedimiento para consultar facturas
CREATE PROCEDURE [dbo].[ConsultarFacturas]
    @ConsecutivoUsuario BIGINT
AS
BEGIN
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
GO

-- Procedimiento para consultar detalle de facturas
CREATE PROCEDURE [dbo].[ConsultarDetalleFacturas]
    @ConsecutivoMaestro BIGINT
AS
BEGIN
    SELECT D.ConsecutivoDetalle,
           D.ConsecutivoMaestro,
           P.Nombre,
           D.Cantidad,
           D.Precio,
           D.SubTotal,
           D.Impuestos AS 'Impuesto',
           D.Total,
           P.Material,
           P.Tamanio,
           P.ColorBase
    FROM tDetalle D
    INNER JOIN tProducto P ON D.ConsecutivoProducto = P.Consecutivo
    WHERE ConsecutivoMaestro = @ConsecutivoMaestro
END
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

-- Procedimiento para consultar tipos de categoría
CREATE PROCEDURE [dbo].[ConsultarTiposCategoria]
AS
BEGIN
    SELECT IdCategoria, Nombre AS 'NombreCategoria'
    FROM tCategoria
END
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

-- Procedimiento almacenado para Registrar infro de la empresa 
CREATE PROCEDURE RegistrarInformacionEmpresa
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
--Porcedimiento para actualizar la info

-- Procedimiento para actualizar informacion
CREATE PROCEDURE ActualizarInfo
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
      
          

