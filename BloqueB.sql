USE [Atlas]

INSERT [dbo].[Bloques] ([Bloque]) VALUES ('A'),('B'),('C'),('AT'),('BT'),('CT')
INSERT [dbo].[TipoTienda]([Nombre]) VALUES('Prueba')

INSERT [dbo].[Casas] ( [IdBloque], [NumeroCasa], [Dimensiones], [CantPersonas]) VALUES 
( 2, 'B-13','POLYGON ((5 2, 6 2, 6 3, 5 3, 5 2))',5)
,(2, 'B-14','POLYGON ((5 3, 6 3, 6 4, 5 4, 5 3))',3)
,(2, 'B-15','POLYGON ((5 4, 6 4, 6 5, 5 5, 5 4))',10) 
,(2, 'B-16','POLYGON((5 5, 6 5, 6 6, 5 6, 5 5))',3)
,(2, 'B-17','POLYGON((7 1, 8 1, 8 2, 7 2, 7 1))',9)
,(2, 'B-18','POLYGON((7 2, 8 2, 8 3, 7 3, 7 2))',7)
,(2, 'B-19','POLYGON((7 3, 8 3, 8 4, 7 4, 7 3))',1)
,(2, 'B-20','POLYGON((7 6, 8 6, 8 7, 7 7, 7 6))',0)
,(2, 'B-21','POLYGON((9 0, 10 0, 10 1, 9 1, 9 0))',5)
,(2, 'B-22','POLYGON((9 6, 10 6, 10 7, 9 7, 9 6))',4)
,(2, 'B-23','POLYGON((9 7, 10 7, 10 8, 9 8, 9 7))',8)

INSERT [dbo].[Tiendas] ( [IdTipoTienda],[IdBloque], [NumeroTienda], [Dimensiones], [HoraInicio], [HoraFin]) VALUES
(1,5,'BT-4','POLYGON((5 0, 7 0, 7 1, 5 1, 5 0))','8:30:54','9:30:54')
,(1,5,'BT-5','POLYGON((5 6, 6 6, 6 8, 5 8, 5 6))','9:30:54','10:30:54')
,(1,5,'BT-6','POLYGON((7 0, 9 0, 9 1, 7 1, 7 0))','10:30:54','11:30:54')
,(1,5,'BT-7','POLYGON((7 4, 8 4, 8 6, 7 6, 7 4))','11:30:54','12:30:54')
,(1,5,'BT-8','POLYGON((9 2, 10 2, 10 4, 9 4, 9 2))','12:30:54','13:30:54')
,(1,5,'BT-9','POLYGON((9 4, 10 4, 10 6, 9 6, 9 4))','13:30:54','14:30:54')



INSERT [dbo].[Calles] ( [Nombre], [Dimensiones]) VALUES
('Banillo','LINESTRING(6.5 1.5, 6.5 7.5)')
,('Bupi','LINESTRING(6.5 7.5, 8.5 7.5)')
,('Bhris','LINESTRING(8.5 1.5, 8.5 7.5)')


DECLARE @T AS TablaLugares;

INSERT INTO @T(
	Numero
	,IdBloque
	,Dimensiones
)SELECT
	NumeroCasa
	,IdBloque
	,Dimensiones
	FROM Casas

INSERT INTO @T(
	Numero
	,IdBloque
	,Dimensiones
)SELECT
	NumeroTienda
	,IdBloque
	,Dimensiones
	FROM Tiendas

INSERT INTO @T(
	Numero
	,IdBloque
	,Dimensiones
)SELECT
	Nombre
	,0
	,Dimensiones
	FROM Calles

	SELECT * FROM @T

EXEC SP_LugaresProducto 'B-13','Pastilla'
EXEC SP_BorrarTablas

