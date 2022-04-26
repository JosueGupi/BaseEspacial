-- CRUD Tipo de Producto
GO
CREATE PROCEDURE spTipoProducto (@flag int, @IdTipoProducto int, @Nombre varchar(16))
WITH ENCRYPTION AS
DECLARE @error varchar(2222)
IF (SELECT COUNT(IdTipoProducto) FROM TipoProducto WHERE IdTipoProducto = @IdTipoProducto ) = 0
	AND @IdTipoProducto IS NOT NULL
	BEGIN
		SET @error = 'El tipo de producto no existe.'
		SELECT @error AS Error
		RETURN 1
	END
BEGIN TRY
	IF @flag = 1 
	BEGIN
		BEGIN TRY
			INSERT INTO TipoProducto (Nombre)
							  VALUES (@Nombre)
			SET @error = 'Tipo de producto ingresado correctamente.'
		END TRY 
		BEGIN CATCH
			SET @error = 'Error al ingresar el tipo de producto.'
			SELECT @error AS Error
			RETURN 1
		END CATCH
	END
	IF @flag = 2 
	BEGIN 
		SELECT IdTipoProducto  AS Id, Nombre AS 'Tipo de Producto'
		FROM TipoProducto
		WHERE IdTipoProducto = ISNULL(@IdTipoProducto,IdTipoProducto)
		AND   Nombre = ISNULL(@Nombre,Nombre)
		SET @error = 'Consulta finalizada.'
	END
	IF @flag = 3 
	BEGIN 
		UPDATE TipoProducto
		SET Nombre = ISNULL(@Nombre,Nombre)
		WHERE IdTipoProducto = @IdTipoProducto
		SET @error = 'Tipo de producto actualizado correctamente.'
	END
	IF @flag = 4
	BEGIN 
		DELETE FROM TipoProducto
		WHERE IdTipoProducto = @IdTipoProducto
		SET @error = 'Tipo de producto eliminado correctamente.'
	END
END TRY
BEGIN CATCH               
    INSERT INTO dbo.Errores    VALUES (
        SUSER_SNAME(),
        ERROR_NUMBER(),
        ERROR_STATE(),
        ERROR_SEVERITY(),
        ERROR_LINE(),
        ERROR_PROCEDURE(),
        ERROR_MESSAGE(),
        GETDATE()
    );
END CATCH
PRINT(@error)
RETURN 0

/*
EXECUTE spTipoProducto 1,NULL,'Repostería'
EXECUTE spTipoProducto 1,NULL,'Golosina'
EXECUTE spTipoProducto 1,NULL,'Medicamento'
EXECUTE spTipoProducto 1,NULL,'Ropa para niño'
EXECUTE spTipoProducto 1,NULL,'Verdura'
EXECUTE spTipoProducto 1,NULL,'Fruta'
EXECUTE spTipoProducto 1,NULL,'Lácteos'
EXECUTE spTipoProducto 1,NULL,'Carnes'
EXECUTE spTipoProducto 1,NULL,'Ropa para adulto'
EXECUTE spTipoProducto 1,NULL,'Deporte'
EXECUTE spTipoProducto 1,NULL,'Calzado'

EXECUTE spTipoProducto 2,NULL,NULL
EXECUTE spTipoProducto 3,4,'Ropa para niña'
EXECUTE spTipoProducto 2,NULL,'Golosina'
EXECUTE spTipoProducto 2,1,NULL
EXECUTE spTipoProducto 4,1,NULL
*/

GO
CREATE PROCEDURE spProductos (@flag int, @IdProducto int, @Nombre varchar(16), @IdTipoProducto int,
							 @Precio int)
WITH ENCRYPTION AS
DECLARE @error varchar(2222)
IF (SELECT COUNT(IdProducto) FROM Productos WHERE IdProducto = @IdProducto ) = 0
	AND @IdProducto IS NOT NULL
	BEGIN
		SET @error = 'El producto no existe.'
		SELECT @error AS Error
		RETURN 1
	END
BEGIN TRY
	IF @flag = 1 
	BEGIN
		BEGIN TRY
			INSERT INTO Productos (IdTipoProducto, Nombre, Precio)
						   VALUES (@IdTipoProducto, @Nombre, @Precio)
			SET @error = 'Producto ingresado correctamente.'
		END TRY 
		BEGIN CATCH
			SET @error = 'Error al ingresar el producto.'
			SELECT @error AS Error
			RETURN 1
		END CATCH
	END
	IF @flag = 2 
	BEGIN 
		SELECT IdProducto AS Id, P.Nombre AS Producto, T.IdTipoProducto AS 'Id Tipo de Producto',
			   T.Nombre AS 'Tipo de Producto', Precio
		FROM Productos AS P
		INNER JOIN TipoProducto AS T
				ON P.IdTipoProducto = T.IdTipoProducto
		WHERE IdProducto = ISNULL(@IdProducto,IdProducto)
		AND   P.IdTipoProducto = ISNULL(@IdTipoProducto,P.IdTipoProducto)
		AND   P.Nombre = ISNULL(@Nombre,P.Nombre)
		AND   Precio = ISNULL(@Precio,Precio)
		SET @error = 'Consulta finalizada.'
	END
	IF @flag = 3 
	BEGIN 
		UPDATE Productos
		SET   IdTipoProducto = ISNULL(@IdTipoProducto,IdTipoProducto),
			  Nombre = ISNULL(@Nombre,Nombre),
			  Precio = ISNULL(@Precio,Precio)
		WHERE IdProducto = @IdProducto
		SET @error = 'Producto actualizado correctamente.'
	END
	IF @flag = 4
	BEGIN 
		DELETE FROM Productos
		WHERE IdProducto = @IdProducto
		SET @error = 'Producto eliminado correctamente.'
	END
END TRY
BEGIN CATCH               
    INSERT INTO dbo.Errores    VALUES (
        SUSER_SNAME(),
        ERROR_NUMBER(),
        ERROR_STATE(),
        ERROR_SEVERITY(),
        ERROR_LINE(),
        ERROR_PROCEDURE(),
        ERROR_MESSAGE(),
        GETDATE()
    );
END CATCH
PRINT(@error)
RETURN 0

/*
EXECUTE spProductos 1, NULL, 'Chicle', 2, 500
EXECUTE spProductos 1, NULL, 'Ibuprofeno', 3, 300
EXECUTE spProductos 1, NULL, 'Pijama', 4, 5000
EXECUTE spProductos 1, NULL, 'Helado', 2, 3000
EXECUTE spProductos 1, NULL, 'Acetaminofén', 3, 100
EXECUTE spProductos 1, NULL, 'Paracetamol', 3, 100
EXECUTE spProductos 1, NULL, 'Manzana', 6, 500
EXECUTE spProductos 1, NULL, 'Pera', 6, 800
EXECUTE spProductos 1, NULL, 'Piña', 6, 1000
EXECUTE spProductos 1, NULL, 'Zanahoria', 5, 400
EXECUTE spProductos 1, NULL, 'Tomate', 5, 700
EXECUTE spProductos 1, NULL, 'Tennis', 11, 40000
EXECUTE spProductos 1, NULL, 'Raqueta', 10, 22000
EXECUTE spProductos 1, NULL, 'Balón', 10, 10000
EXECUTE spProductos 1, NULL, 'Costilla de res', 8, 3500
EXECUTE spProductos 1, NULL, 'Quesocrema', 7, 2000
EXECUTE spProductos 1, NULL, 'Natilla', 7, 1500

EXECUTE spProductos 2, NULL, NULL, NULL, NULL
EXECUTE spProductos 2, NULL, 'Ibuprofeno', NULL, NULL -- consultar por nombre de producto
EXECUTE spProductos 2, NULL, NULL, 3, NULL  -- consultar por tipo de producto
EXECUTE spProductos 2, NULL, NULL, NULL, 5000 -- consultar por precio de producto
EXECUTE spProductos 2, 4, NULL, NULL, NULL -- consultar por id de producto
EXECUTE spProductos 3, 4, 'Ibuprofeno 2', 3, 500
EXECUTE spProductos 4, 1, NULL, NULL, NULL
*/

GO
CREATE PROCEDURE spProductosxTienda (@flag int, @IdProdxTienda int, @IdProducto int, @IdTienda int, @Bloque varchar(1),
									 @Cantidad int)
WITH ENCRYPTION AS
DECLARE @error varchar(2222)
IF (SELECT COUNT(IdProdxTienda) FROM ProductosxTienda WHERE IdProdxTienda = @IdProdxTienda ) = 0
	AND @IdProdxTienda IS NOT NULL
	BEGIN
		SET @error = 'El producto no existe en el inventario.'
		SELECT @error AS Error
		RETURN 1
	END
BEGIN TRY 
	IF @flag = 1 
	BEGIN
		BEGIN TRY
			INSERT INTO ProductosxTienda (IdProducto, IdTienda, Bloque, Cantidad)
								  VALUES (@IdProducto, @IdTienda, @Bloque, @Cantidad)
			SET @error = 'Producto ingresado correctamente al inventario.'
		END TRY 
		BEGIN CATCH
			SET @error = 'Error al ingresar el producto al inventario.'
			SELECT @error AS Error
			RETURN 1
		END CATCH
	END
	IF @flag = 2 
	BEGIN 
		SELECT PT.IdProdxTienda AS 'Id Inventario', PT.IdProducto AS 'Id Producto', P.Nombre AS Producto, Cantidad, 
		T.IdTienda AS 'Id Tienda', T.NumeroTienda AS Tienda, B.Bloque
		FROM ProductosxTienda AS PT
		INNER JOIN Productos AS P
				ON PT.IdProducto = P.IdProducto
		INNER JOIN Tiendas AS T
				ON PT.IdTienda = T.IdTienda 
		INNER JOIN Bloques AS B
				ON PT.Bloque = B.IdBloque 
		WHERE IdProdxTienda = ISNULL(@IdProdxTienda,IdProdxTienda)
		AND   PT.IdProducto = ISNULL(@IdProducto,PT.IdProducto)
		AND   T.IdTienda = ISNULL(@IdTienda,T.IdTienda)
		AND   B.Bloque = ISNULL(@Bloque,B.Bloque)
		AND   Cantidad = ISNULL(@Cantidad,Cantidad)
		SET @error = 'Consulta finalizada.'
	END
	IF @flag = 3 
	BEGIN 
		UPDATE ProductosxTienda
		SET   IdProducto = ISNULL(@IdProducto,IdProducto),
			  IdTienda = ISNULL(@IdTienda,IdTienda),
			  Bloque = ISNULL(@Bloque,Bloque),
			  Cantidad = ISNULL(@Cantidad,Cantidad)
		WHERE IdProdxTienda = @IdProdxTienda
		SET @error = 'Producto de inventario actualizado correctamente.'
	END
	IF @flag = 4
	BEGIN 
		DELETE FROM ProductosxTienda
		WHERE IdProdxTienda = @IdProdxTienda
		SET @error = 'Producto eliminado del inventario correctamente.'
	END
END TRY
BEGIN CATCH               
    INSERT INTO dbo.Errores    VALUES (
        SUSER_SNAME(),
        ERROR_NUMBER(),
        ERROR_STATE(),
        ERROR_SEVERITY(),
        ERROR_LINE(),
        ERROR_PROCEDURE(),
        ERROR_MESSAGE(),
        GETDATE()
    );
END CATCH
PRINT(@error)
RETURN 0

 /*
EXECUTE spProductos 2, NULL, NULL, NULL, NULL
SELECT IdTienda, NumeroTienda, TipoTienda.Nombre Tipo FROM Tiendas INNER JOIN TipoTienda ON Tiendas.IdTipoTienda = TipoTienda.IdTipoTienda

-- @flag int, @IdProdxTienda int, @IdProducto int, @IdTienda int, @Bloque varchar(1), @Cantidad int

EXECUTE spProductosxTienda 1, NULL, 1, 3, 3, 100
EXECUTE spProductosxTienda 1, NULL, 1, 2, 3, 100
EXECUTE spProductosxTienda 1, NULL, 5, 2, 3, 50
EXECUTE spProductosxTienda 1, NULL, 6, 2, 3, 50
EXECUTE spProductosxTienda 1, NULL, 9, 3, 3, 10
EXECUTE spProductosxTienda 1, NULL, 10, 3, 3, 10
EXECUTE spProductosxTienda 1, NULL, 11, 3, 3, 10
EXECUTE spProductosxTienda 1, NULL, 12, 3, 3, 10

EXECUTE spProductosxTienda 2, NULL, NULL, NULL, NULL, NULL
EXECUTE spProductosxTienda 2, NULL, NULL, NULL, C, NULL -- consultar por bloque 
EXECUTE spProductosxTienda 2, NULL, NULL, 3, NULL, NULL -- consultar por tienda
EXECUTE spProductosxTienda 2, NULL, 1, NULL, NULL, NULL -- consultar por id de producto

EXECUTE spProductosxTienda 3, 1, NULL, NULL, NULL, 99
EXECUTE spProductosxTienda 4, 1, NULL, NULL, NULL, NULL 
*/

