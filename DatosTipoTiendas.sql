INSERT [dbo].[TipoTienda] ([IdTipoTienda],[Nombre]) VALUES
('Farmacia')
,('Abastecedor')
,('Tienda Ropa')
,('Zapateria')

UPDATE Tiendas
SET HoraInicio = '7:0:00', HoraFin = '22:30:00'
WHERE IdTienda = 1;
UPDATE Tiendas
SET HoraInicio = '8:00:00', HoraFin = '20:00:00'
WHERE IdTienda = 2;
UPDATE Tiendas
SET HoraInicio = '8:30:00', HoraFin = '13:30:00'
WHERE IdTienda = 3;
UPDATE Tiendas
SET HoraInicio = '9:00:00', HoraFin = '14:00:00'
WHERE IdTienda = 4;