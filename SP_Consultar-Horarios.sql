USE Atlas
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_ConsultarHorarios]
	@id INT
AS
BEGIN
	SET NOCOUNT ON
	
	BEGIN TRY

	SELECT HoraInicio,HoraFin FROM dbo.Tiendas WHERE IdTienda = @id;

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
--EXECUTE SP_ConsultarHorarios '1';