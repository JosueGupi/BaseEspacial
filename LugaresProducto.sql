USE [Atlas]
GO
/****** Object:  StoredProcedure [dbo].[SP_DistanciaLugares]    Script Date: 22/4/2022 09:41:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [dbo].[SP_LugaresProducto]
	@inCasa VARCHAR(8),
	@inProducto VARCHAR(8)
AS
BEGIN
	SET NOCOUNT ON
	BEGIN TRY
	DECLARE @BloqueLugar GEOMETRY;
		

		SELECT @BloqueLugar = Dimensiones FROM Casas C WHERE C.NumeroCasa = @inCasa;

		SELECT T.NumeroTienda
			, T.Dimensiones
			, T.HoraInicio
			, T.HoraFin
			, PT.Cantidad AS CantidadProducto
			, @BloqueLugar.STDistance(T.Dimensiones) AS Distancia
			, P.Nombre
			, TP.Nombre AS TipoProducto
			, P.Precio
		FROM Tiendas T
		INNER JOIN ProductosxTienda PT ON T.IdTienda = PT.IdTienda
		INNER JOIN Productos P ON PT.IdProducto = P.IdProducto
		INNER JOIN TipoProducto TP ON P.IdTipoProducto = TP.IdTipoProducto
		WHERE P.Nombre = @inProducto
		ORDER BY @BloqueLugar.STDistance(T.Dimensiones);


		
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

	SET NOCOUNT OFF
END

EXEC SP_LugaresProducto 'B-14','Pastilla'