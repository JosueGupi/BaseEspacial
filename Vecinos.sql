USE [Atlas]
GO
/****** Object:  StoredProcedure [dbo].[SP_DistanciaLugares]    Script Date: 21/4/2022 15:51:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [dbo].[SP_Vecinos]
	@inNombreLugar VARCHAR(8)
AS
BEGIN
	SET NOCOUNT ON
	BEGIN TRY
	DECLARE @BloqueLugar GEOMETRY,
		@TablaLugares AS TablaLugares
	IF @inNombreLugar LIKE '%T%'
	BEGIN
		SELECT @BloqueLugar = Dimensiones 
		FROM Tiendas 
		WHERE NumeroTienda = @inNombreLugar;

	END

	ELSE
	BEGIN
		SELECT @BloqueLugar = Dimensiones 
		FROM Casas 
		WHERE NumeroCasa = @inNombreLugar;
	END

	INSERT INTO @TablaLugares(
		Numero
		, IdBloque
		, Dimensiones
	)
	SELECT NumeroCasa
		, IdBloque
		, Dimensiones
	FROM Casas WHERE Dimensiones.STTouches(@BloqueLugar) = 1;

	INSERT INTO @TablaLugares(
		Numero
		, IdBloque
		, Dimensiones
	)
	SELECT NumeroTienda
		, IdBloque
		, Dimensiones
	FROM Tiendas WHERE Dimensiones.STTouches(@BloqueLugar) = 1;

	SELECT Numero
		, IdBloque
		, Dimensiones
	FROM @TablaLugares;

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

EXEC SP_Vecinos 'B-14'
SELECT * FROM Casas