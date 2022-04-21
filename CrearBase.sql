USE [Atlas]
GO
/****** Object:  Table [dbo].[Calles]    Script Date: 20/4/2022 20:19:30 ******/
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
/****** Object:  Table [dbo].[CasasA]    Script Date: 20/4/2022 20:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CasasA](
	[IdCasa] [int] IDENTITY(1,1) NOT NULL,
	[Bloque] [varchar](1) NOT NULL,
	[Dimensiones] [geometry] NOT NULL,
	[CantPersonas] [int] NOT NULL,
 CONSTRAINT [PK_CasasA] PRIMARY KEY CLUSTERED 
(
	[IdCasa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CasasB]    Script Date: 20/4/2022 20:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CasasB](
	[IdCasa] [int] IDENTITY(1,1) NOT NULL,
	[Bloque] [varchar](1) NOT NULL,
	[Dimensiones] [geometry] NOT NULL,
	[CantPersonas] [int] NOT NULL,
 CONSTRAINT [PK_CasasB] PRIMARY KEY CLUSTERED 
(
	[IdCasa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CasasC]    Script Date: 20/4/2022 20:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CasasC](
	[IdCasa] [int] IDENTITY(1,1) NOT NULL,
	[Bloque] [varchar](1) NOT NULL,
	[Dimensiones] [geometry] NOT NULL,
	[CantPersonas] [int] NOT NULL,
 CONSTRAINT [PK_CasasC] PRIMARY KEY CLUSTERED 
(
	[IdCasa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 20/4/2022 20:19:30 ******/
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
/****** Object:  Table [dbo].[ProductosxTienda]    Script Date: 20/4/2022 20:19:30 ******/
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
/****** Object:  Table [dbo].[TiendasA]    Script Date: 20/4/2022 20:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TiendasA](
	[IdTienda] [int] IDENTITY(1,1) NOT NULL,
	[IdTipoTienda] [int] NOT NULL,
	[Bloque] [varchar](1) NOT NULL,
	[Dimensiones] [geometry] NOT NULL,
	[HoraInicio] [time](0) NOT NULL,
	[HoraFin] [time](0) NOT NULL,
 CONSTRAINT [PK_TiendasaA] PRIMARY KEY CLUSTERED 
(
	[IdTienda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TiendasB]    Script Date: 20/4/2022 20:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TiendasB](
	[IdTienda] [int] IDENTITY(1,1) NOT NULL,
	[IdTipoTienda] [int] NOT NULL,
	[Bloque] [varchar](1) NOT NULL,
	[Dimensiones] [geometry] NOT NULL,
	[HoraInicio] [time](0) NOT NULL,
	[HoraFin] [time](0) NOT NULL,
 CONSTRAINT [PK_TiendasB] PRIMARY KEY CLUSTERED 
(
	[IdTienda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TiendasC]    Script Date: 20/4/2022 20:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TiendasC](
	[IdTienda] [int] IDENTITY(1,1) NOT NULL,
	[IdTipoTienda] [int] NOT NULL,
	[Bloque] [varchar](1) NOT NULL,
	[Dimensiones] [geometry] NOT NULL,
	[HoraInicio] [time](0) NOT NULL,
	[HoraFin] [time](0) NOT NULL,
 CONSTRAINT [PK_TiendasC] PRIMARY KEY CLUSTERED 
(
	[IdTienda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoProducto]    Script Date: 20/4/2022 20:19:30 ******/
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
/****** Object:  Table [dbo].[TipoTienda]    Script Date: 20/4/2022 20:19:30 ******/
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
ALTER TABLE [dbo].[TiendasA]  WITH CHECK ADD  CONSTRAINT [FK_TiendasA_TipoTienda] FOREIGN KEY([IdTipoTienda])
REFERENCES [dbo].[TipoTienda] ([IdTipoTienda])
GO
ALTER TABLE [dbo].[TiendasA] CHECK CONSTRAINT [FK_TiendasA_TipoTienda]
GO
ALTER TABLE [dbo].[TiendasB]  WITH CHECK ADD  CONSTRAINT [FK_TiendasB_TipoTienda] FOREIGN KEY([IdTipoTienda])
REFERENCES [dbo].[TipoTienda] ([IdTipoTienda])
GO
ALTER TABLE [dbo].[TiendasB] CHECK CONSTRAINT [FK_TiendasB_TipoTienda]
GO
ALTER TABLE [dbo].[TiendasC]  WITH CHECK ADD  CONSTRAINT [FK_TiendasC_TipoTienda] FOREIGN KEY([IdTipoTienda])
REFERENCES [dbo].[TipoTienda] ([IdTipoTienda])
GO
ALTER TABLE [dbo].[TiendasC] CHECK CONSTRAINT [FK_TiendasC_TipoTienda]
GO
