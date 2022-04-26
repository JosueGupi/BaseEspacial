USE Atlas
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_AsignarHorarios]
	@idTipo INT
	,@HoraI time(0)
	,@HoraF time(0)
AS
BEGIN
	SET NOCOUNT ON
	
	BEGIN TRY

	UPDATE Tiendas
	SET HoraInicio = @HoraI, HoraFin = @HoraF
	WHERE IdTipoTienda = @idTipo;

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
GO
--EXECUTE SP_AsignarHorarios '1','7:0:00','11:0:00';;