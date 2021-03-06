USE [Atlas]
GO
/****** Object:  StoredProcedure [dbo].[SP_DistanciaLugares]    Script Date: 21/4/2022 15:51:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [dbo].[SP_DistanciaLugares]
	@inNombreLugar1 VARCHAR(8),
	@inNombreLugar2 VARCHAR(8)
AS
BEGIN
	SET NOCOUNT ON
	BEGIN TRY
	DECLARE @BloqueLugar1 GEOMETRY,
		@BloqueLugar2 GEOMETRY;

		
	
		IF @inNombreLugar1 LIKE '%T%'
		BEGIN
			SELECT @BloqueLugar1 =  Dimensiones FROM Tiendas WHERE NumeroTienda = @inNombreLugar1;
			
		END

		ELSE
		BEGIN
			SELECT @BloqueLugar1 = Dimensiones FROM Casas WHERE NumeroCasa = @inNombreLugar1;
			
		END

		IF @inNombreLugar2 LIKE '%T%'
		BEGIN
			SELECT @BloqueLugar2 = Dimensiones FROM Tiendas WHERE NumeroTienda = @inNombreLugar2;
			
		END

		ELSE
		BEGIN
			SELECT @BloqueLugar2 = Dimensiones FROM Casas WHERE NumeroCasa = @inNombreLugar2;
			
		END
		
	
		SELECT @inNombreLugar1 AS ZonaInicio
			, @inNombreLugar2 AS ZonaFinal
			, @BloqueLugar1.STDistance(@BloqueLugar2) AS Distancia;

		
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