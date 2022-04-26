USE [Atlas]

INSERT [dbo].[Bloques] ([Bloque]) VALUES ('A'),('B'),('C'),('AT'),('BT'),('CT')
INSERT [dbo].[TipoTienda]([Nombre]) VALUES('Prueba')

INSERT [dbo].[Casas] ( [IdBloque], [NumeroCasa], [Dimensiones], [CantPersonas]) VALUES 
( 1, 'A-1','POLYGON ((0 0, 0 1, 1 1, 1 0, 0 0))', 6)
,( 1, 'A-2','POLYGON ((0 8, 1 8, 1 7, 0 7, 0 8))', 2)
,( 1, 'A-3','POLYGON ((1 0, 1 1, 2 1, 2 0, 1 0))', 3) 
,(1, 'A-4','POLYGON((1 2, 2 2, 2 3, 1 3, 1 2))',5)
,(1, 'A-5','POLYGON((1 3, 2 3, 2 4, 1 4, 1 3))',7)
,(1, 'A-6','POLYGON((1 4, 2 4, 2 5, 1 5, 1 4))',5)
,(1, 'A-7','POLYGON((1 5, 2 5, 2 6, 1 6, 1 5))',2)
,(1, 'A-8','POLYGON((1 8, 2 8, 2 7, 1 7, 1 8))',1)
,(1, 'A-9','POLYGON((2 0, 2 1, 3 1, 3 0, 2 0))',4)
,(1, 'A-10','POLYGON((2 8, 3 8, 3 7, 2 7, 2 8))',8)
,(1, 'A-11','POLYGON((3 0, 3 1, 4 1, 4 0, 3 0))',0)
,(1, 'A-12','POLYGON((4 0, 4 1, 5 1, 5 0, 4 0))',9)

INSERT [dbo].[Tiendas] ( [IdTipoTienda],[IdBloque], [NumeroTienda], [Dimensiones], [HoraInicio], [HoraFin]) VALUES
(1,4,'AT-1','POLYGON((3 2, 4 2, 4 4, 3 4, 3 2))','8:30:54','9:30:54')
,(1,4,'AT-2','POLYGON((3 4, 4 4, 4 6, 3 6, 3 4))','9:30:54','10:30:54')
,(1,4,'AT-3','POLYGON((3 8, 5 8, 5 7, 3 7, 3 8))','10:30:54','11:30:54')



INSERT [dbo].[Calles] ( [Nombre], [Dimensiones]) VALUES
('Perez','LINESTRING(0.5 1.5, 0.5 7.5)')
,('Ruiz','LINESTRING(0.5 1.5, 0.5 6.5)')
,('Ayala','LINESTRING(2.5 6.5, 2.5 1.5)')
,('Cruz','LINESTRING(4.5 6.5, 4.5 1.5)')
,('Dos hermanas','LINESTRING(8.5 1.5, 8.5 7.5)')


