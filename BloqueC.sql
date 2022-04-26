-- Bloque C
SELECT * FROM Tiendas 

INSERT INTO Tiendas ()
VALUES (1,1,48,geometry::STGeomFromText('POLYGON((12 2, 12 3 , 14 3 , 14 2, 12 2))', 0)),
	   (1,2,49,geometry::STGeomFromText('POLYGON((10 3, 10 4 , 12 4 , 12 3, 10 3))', 0))

INSERT INTO Calles 
VALUES ('Calle C-8',geometry::STGeomFromText('LINESTRING(7.5 1.5, 14.5 1.5)', 0)),
	   ('Calle C-9',geometry::STGeomFromText('LINESTRING(14.5 1.5, 14.5 6.5)', 0)),
	   ('Calle C-10',geometry::STGeomFromText('LINESTRING(10.5 4.5, 14.5 4.5)', 0)),
	   ('Calle C-11',geometry::STGeomFromText('LINESTRING(10.5 6.5, 14.5 6.5)', 0)),
	   ('Calle C-12',geometry::STGeomFromText('LINESTRING(12.5 4.5, 12.5 6.5)', 0)),
	   ('Calle C-13',geometry::STGeomFromText('LINESTRING(10.5 4.5, 10.5 6.5)', 0))

INSERT INTO Casas (IdBloque,NumeroCasa,Dimensiones,CantPersonas) 
VALUES (3,33,geometry::STGeomFromText('POLYGON((10 0 , 10 1 , 11 1 , 11 0, 10 0))',0),5),
       (3,34,geometry::STGeomFromText('POLYGON((11 0 , 11 1 , 12 1 , 12 0, 11 0))',0),8),
       (3,35,geometry::STGeomFromText('POLYGON((12 0 , 12 1 , 13 1 , 13 0, 12 0))',0),3),
       (3,36,geometry::STGeomFromText('POLYGON((13 0 , 13 1 , 14 1 , 14 0, 13 0))',0),2),
       (3,37,geometry::STGeomFromText('POLYGON((14 0 , 14 1 , 15 1 , 15 0, 14 0))',0),5),
       (3,38,geometry::STGeomFromText('POLYGON((10 2, 10 3 , 11 3 , 11 2, 10 2))',0),4),
       (3,39,geometry::STGeomFromText('POLYGON((11 2, 11 3 , 12 3 , 12 2, 11 2))',0),7),
       (3,40,geometry::STGeomFromText('POLYGON((12 3, 12 4 , 13 4 , 13 3, 12 3))',0),3),
       (3,41,geometry::STGeomFromText('POLYGON((13 3, 13 4 , 14 4 , 14 3, 13 3))',0),6),
       (3,42,geometry::STGeomFromText('POLYGON((13 5, 13 6 , 14 6 , 14 5, 13 5))',0),7),
       (3,43,geometry::STGeomFromText('POLYGON((11 5, 11 6 , 12 6 , 12 5, 11 5))',0),2),
       (3,44,geometry::STGeomFromText('POLYGON((10 7 , 10 8 , 11 8, 11 7, 10 7))',0),1),
       (3,45,geometry::STGeomFromText('POLYGON((11 7 , 11 8 , 12 8, 12 7, 11 7))',0),6),
       (3,45,geometry::STGeomFromText('POLYGON((12 7 , 12 8 , 13 8, 13 7, 12 7))',0),4),
       (3,46,geometry::STGeomFromText('POLYGON((13 7 , 13 8 , 14 8, 14 7, 13 7))',0),3),
       (3,47,geometry::STGeomFromText('POLYGON((14 7 , 14 8 , 15 8, 15 7, 14 7))',0),5)

/*
SELECT IdTienda, NumeroTienda, Dimensiones FROM Tiendas
UNION ALL
SELECT IdCasa, NumeroCasa, Dimensiones FROM Casas
UNION ALL
SELECT IdCalle, Nombre, Dimensiones FROM Calles
*/
