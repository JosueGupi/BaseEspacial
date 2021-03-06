USE [Atlas]
GO
/****** Object:  StoredProcedure [dbo].[SP_BorrarTablas]    Script Date: 21/4/2022 19:19:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [dbo].[SP_BorrarTablas]
AS
BEGIN
	SET NOCOUNT ON

		--LIMPIAR TABLAS
		--Reiniciar index

		DELETE FROM dbo.Calles
		DBCC CHECKIDENT(Calles, RESEED,0)

		DELETE FROM dbo.Casas
		DBCC CHECKIDENT(Casas, RESEED,0)

		DELETE FROM dbo.ProductosxTienda
		DBCC CHECKIDENT(ProductosxTienda, RESEED,0)

		DELETE FROM dbo.Productos
		DBCC CHECKIDENT(Productos, RESEED,0)
		
		DELETE FROM dbo.TipoProducto
		DBCC CHECKIDENT(TipoProducto, RESEED,0)

		DELETE FROM dbo.Tiendas
		DBCC CHECKIDENT(Tiendas, RESEED,0)

		DELETE FROM dbo.TipoTienda
		DBCC CHECKIDENT(TipoTienda, RESEED,0)

		DELETE FROM dbo.Bloques
		DBCC CHECKIDENT(Bloques, RESEED,0)
		

	SET NOCOUNT OFF
END