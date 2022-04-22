USE [Atlas]
GO

/****** Object:  UserDefinedTableType [dbo].[TablaLugares]    Script Date: 21/4/2022 18:41:24 ******/
CREATE TYPE [dbo].[TablaLugares] AS TABLE(
	[Numero] [varchar](8) NULL,
	[IdBloque] [int] NULL,
	[Dimensiones] [geometry] NULL
)
GO


