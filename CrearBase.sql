USE [Atlas]
GO
/****** Object:  Table [dbo].[Bloques]    Script Date: 21/4/2022 17:26:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bloques](
	[IdBloque] [int] IDENTITY(1,1) NOT NULL,
	[Bloque] [varchar](16) NOT NULL,
 CONSTRAINT [PK_Bloques] PRIMARY KEY CLUSTERED 
(
	[IdBloque] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Calles]    Script Date: 21/4/2022 17:26:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Calles](
	[IdCalle] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](16) NOT NULL,
	[Dimensiones] [geometry] NOT NULL,
 CONSTRAINT [PK_Calles] PRIMARY KEY CLUSTERED 
(
	[IdCalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Casas]    Script Date: 21/4/2022 17:26:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Casas](
	[IdCasa] [int] IDENTITY(1,1) NOT NULL,
	[IdBloque] [int] NOT NULL,
	[NumeroCasa] [varchar](8) NOT NULL,
	[Dimensiones] [geometry] NOT NULL,
	[CantPersonas] [int] NOT NULL,
 CONSTRAINT [PK_CasasA] PRIMARY KEY CLUSTERED 
(
	[IdCasa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Errores]    Script Date: 21/4/2022 17:26:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Errores](
	[Name] [varchar](max) NOT NULL,
	[Numero] [int] NOT NULL,
	[Estado] [int] NOT NULL,
	[Severidad] [int] NOT NULL,
	[Linea] [int] NOT NULL,
	[Procedimientos] [varchar](max) NOT NULL,
	[Mensaje] [varchar](max) NOT NULL,
	[Fecha] [date] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 21/4/2022 17:26:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[IdProducto] [int] IDENTITY(1,1) NOT NULL,
	[IdTipoProducto] [int] NOT NULL,
	[Nombre] [varchar](32) NOT NULL,
	[Precio] [int] NOT NULL,
 CONSTRAINT [PK_Productos] PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductosxTienda]    Script Date: 21/4/2022 17:26:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductosxTienda](
	[IdProdxTienda] [int] IDENTITY(1,1) NOT NULL,
	[IdProducto] [int] NOT NULL,
	[IdTienda] [int] NOT NULL,
	[Bloque] [varchar](1) NOT NULL,
	[Cantidad] [int] NOT NULL,
 CONSTRAINT [PK_ProductosxTienda] PRIMARY KEY CLUSTERED 
(
	[IdProdxTienda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tiendas]    Script Date: 21/4/2022 17:26:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tiendas](
	[IdTienda] [int] IDENTITY(1,1) NOT NULL,
	[IdTipoTienda] [int] NOT NULL,
	[IdBloque] [int] NOT NULL,
	[NumeroTienda] [varchar](8) NOT NULL,
	[Dimensiones] [geometry] NOT NULL,
	[HoraInicio] [time](0) NOT NULL,
	[HoraFin] [time](0) NOT NULL,
 CONSTRAINT [PK_Tiendas] PRIMARY KEY CLUSTERED 
(
	[IdTienda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoProducto]    Script Date: 21/4/2022 17:26:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoProducto](
	[IdTipoProducto] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](32) NOT NULL,
 CONSTRAINT [PK_TipoProducto] PRIMARY KEY CLUSTERED 
(
	[IdTipoProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoTienda]    Script Date: 21/4/2022 17:26:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoTienda](
	[IdTipoTienda] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](16) NOT NULL,
 CONSTRAINT [PK_TipoTienda] PRIMARY KEY CLUSTERED 
(
	[IdTipoTienda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Casas]  WITH CHECK ADD  CONSTRAINT [FK_Casas_Bloques] FOREIGN KEY([IdBloque])
REFERENCES [dbo].[Bloques] ([IdBloque])
GO
ALTER TABLE [dbo].[Casas] CHECK CONSTRAINT [FK_Casas_Bloques]
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD  CONSTRAINT [FK_Productos_TipoProducto] FOREIGN KEY([IdTipoProducto])
REFERENCES [dbo].[TipoProducto] ([IdTipoProducto])
GO
ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [FK_Productos_TipoProducto]
GO
ALTER TABLE [dbo].[ProductosxTienda]  WITH CHECK ADD  CONSTRAINT [FK_ProductosxTienda_Productos] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Productos] ([IdProducto])
GO
ALTER TABLE [dbo].[ProductosxTienda] CHECK CONSTRAINT [FK_ProductosxTienda_Productos]
GO
ALTER TABLE [dbo].[ProductosxTienda]  WITH CHECK ADD  CONSTRAINT [FK_ProductosxTienda_Tiendas] FOREIGN KEY([IdTienda])
REFERENCES [dbo].[Tiendas] ([IdTienda])
GO
ALTER TABLE [dbo].[ProductosxTienda] CHECK CONSTRAINT [FK_ProductosxTienda_Tiendas]
GO
ALTER TABLE [dbo].[Tiendas]  WITH CHECK ADD  CONSTRAINT [FK_Tiendas_Bloques] FOREIGN KEY([IdBloque])
REFERENCES [dbo].[Bloques] ([IdBloque])
GO
ALTER TABLE [dbo].[Tiendas] CHECK CONSTRAINT [FK_Tiendas_Bloques]
GO
ALTER TABLE [dbo].[Tiendas]  WITH CHECK ADD  CONSTRAINT [FK_Tiendas_TipoTienda] FOREIGN KEY([IdTipoTienda])
REFERENCES [dbo].[TipoTienda] ([IdTipoTienda])
GO
ALTER TABLE [dbo].[Tiendas] CHECK CONSTRAINT [FK_Tiendas_TipoTienda]
GO
