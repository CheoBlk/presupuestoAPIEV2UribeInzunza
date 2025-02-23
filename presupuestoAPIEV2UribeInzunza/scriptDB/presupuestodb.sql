USE [master]
GO
/****** Object:  Database [presupuestodbEv2]    Script Date: 22-10-2023 22:07:43 ******/
CREATE DATABASE [presupuestodbEv2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'presupuestodbEv2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\presupuestodbEv2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'presupuestodbEv2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\presupuestodbEv2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [presupuestodbEv2] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [presupuestodbEv2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [presupuestodbEv2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [presupuestodbEv2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [presupuestodbEv2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [presupuestodbEv2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [presupuestodbEv2] SET ARITHABORT OFF 
GO
ALTER DATABASE [presupuestodbEv2] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [presupuestodbEv2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [presupuestodbEv2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [presupuestodbEv2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [presupuestodbEv2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [presupuestodbEv2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [presupuestodbEv2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [presupuestodbEv2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [presupuestodbEv2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [presupuestodbEv2] SET  ENABLE_BROKER 
GO
ALTER DATABASE [presupuestodbEv2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [presupuestodbEv2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [presupuestodbEv2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [presupuestodbEv2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [presupuestodbEv2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [presupuestodbEv2] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [presupuestodbEv2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [presupuestodbEv2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [presupuestodbEv2] SET  MULTI_USER 
GO
ALTER DATABASE [presupuestodbEv2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [presupuestodbEv2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [presupuestodbEv2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [presupuestodbEv2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [presupuestodbEv2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [presupuestodbEv2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [presupuestodbEv2] SET QUERY_STORE = OFF
GO
USE [presupuestodbEv2]
GO
/****** Object:  Table [dbo].[Ahorros]    Script Date: 22-10-2023 22:07:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ahorros](
	[id_ahorro] [int] IDENTITY(1,1) NOT NULL,
	[id_usuario] [int] NOT NULL,
	[id_meta] [int] NOT NULL,
	[monto] [int] NOT NULL,
 CONSTRAINT [PK_Ahorros] PRIMARY KEY CLUSTERED 
(
	[id_ahorro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoriaGastos]    Script Date: 22-10-2023 22:07:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoriaGastos](
	[id_categoria] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_CategoriaGastos] PRIMARY KEY CLUSTERED 
(
	[id_categoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FuenteIngresos]    Script Date: 22-10-2023 22:07:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FuenteIngresos](
	[id_fuente] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_FuenteIngresos] PRIMARY KEY CLUSTERED 
(
	[id_fuente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gastos]    Script Date: 22-10-2023 22:07:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gastos](
	[id_gasto] [int] IDENTITY(1,1) NOT NULL,
	[id_usuario] [int] NOT NULL,
	[id_categoria] [int] NOT NULL,
	[monto] [int] NOT NULL,
 CONSTRAINT [PK_Gastos] PRIMARY KEY CLUSTERED 
(
	[id_gasto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ingresos]    Script Date: 22-10-2023 22:07:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ingresos](
	[id_ingreso] [int] IDENTITY(1,1) NOT NULL,
	[id_usuario] [int] NOT NULL,
	[id_fuente] [int] NOT NULL,
	[monto] [int] NOT NULL,
 CONSTRAINT [PK_Ingresos] PRIMARY KEY CLUSTERED 
(
	[id_ingreso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MetaAhorros]    Script Date: 22-10-2023 22:07:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MetaAhorros](
	[id_meta] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_MetaAhorros] PRIMARY KEY CLUSTERED 
(
	[id_meta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rols]    Script Date: 22-10-2023 22:07:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rols](
	[id_rol] [int] IDENTITY(1,1) NOT NULL,
	[rol] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Rols] PRIMARY KEY CLUSTERED 
(
	[id_rol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 22-10-2023 22:07:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[id_usuario] [int] IDENTITY(1,1) NOT NULL,
	[id_rol] [int] NOT NULL,
	[nombre] [nvarchar](max) NOT NULL,
	[apellido] [nvarchar](max) NOT NULL,
	[edad] [int] NOT NULL,
	[direccion] [nvarchar](max) NOT NULL,
	[email] [nvarchar](max) NOT NULL,
	[pass] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Rols] ON 

INSERT [dbo].[Rols] ([id_rol], [rol]) VALUES (1, N'admin')
SET IDENTITY_INSERT [dbo].[Rols] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([id_usuario], [id_rol], [nombre], [apellido], [edad], [direccion], [email], [pass]) VALUES (1, 1, N'admin', N'admin', 23, N'admin@mail.com', N'admin@mail.com', N'1234')
INSERT [dbo].[Usuarios] ([id_usuario], [id_rol], [nombre], [apellido], [edad], [direccion], [email], [pass]) VALUES (3, 1, N'string', N'string', 23, N'string', N'string', N'string')
INSERT [dbo].[Usuarios] ([id_usuario], [id_rol], [nombre], [apellido], [edad], [direccion], [email], [pass]) VALUES (4, 1, N'string', N'string', 23, N'string', N'string', N'string')
INSERT [dbo].[Usuarios] ([id_usuario], [id_rol], [nombre], [apellido], [edad], [direccion], [email], [pass]) VALUES (5, 1, N'string', N'string', 23, N'string', N'string', N'string')
INSERT [dbo].[Usuarios] ([id_usuario], [id_rol], [nombre], [apellido], [edad], [direccion], [email], [pass]) VALUES (6, 1, N'string', N'string', 23, N'string', N'string', N'string')
INSERT [dbo].[Usuarios] ([id_usuario], [id_rol], [nombre], [apellido], [edad], [direccion], [email], [pass]) VALUES (7, 1, N'string', N'string', 23, N'string', N'string', N'string')
INSERT [dbo].[Usuarios] ([id_usuario], [id_rol], [nombre], [apellido], [edad], [direccion], [email], [pass]) VALUES (8, 1, N'string', N'string', 23, N'string', N'string', N'string')
INSERT [dbo].[Usuarios] ([id_usuario], [id_rol], [nombre], [apellido], [edad], [direccion], [email], [pass]) VALUES (9, 1, N'string', N'string', 23, N'string', N'string', N'string')
INSERT [dbo].[Usuarios] ([id_usuario], [id_rol], [nombre], [apellido], [edad], [direccion], [email], [pass]) VALUES (10, 1, N'string', N'string', 23, N'string', N'string', N'string')
INSERT [dbo].[Usuarios] ([id_usuario], [id_rol], [nombre], [apellido], [edad], [direccion], [email], [pass]) VALUES (11, 1, N'string', N'string', 23, N'string', N'string', N'string')
INSERT [dbo].[Usuarios] ([id_usuario], [id_rol], [nombre], [apellido], [edad], [direccion], [email], [pass]) VALUES (12, 1, N'string', N'string', 23, N'string', N'string', N'string')
INSERT [dbo].[Usuarios] ([id_usuario], [id_rol], [nombre], [apellido], [edad], [direccion], [email], [pass]) VALUES (13, 1, N'string', N'string', 23, N'string', N'string', N'string')
INSERT [dbo].[Usuarios] ([id_usuario], [id_rol], [nombre], [apellido], [edad], [direccion], [email], [pass]) VALUES (14, 1, N'string', N'string', 23, N'string', N'string', N'string')
INSERT [dbo].[Usuarios] ([id_usuario], [id_rol], [nombre], [apellido], [edad], [direccion], [email], [pass]) VALUES (15, 1, N'string', N'string', 23, N'string', N'string', N'string')
INSERT [dbo].[Usuarios] ([id_usuario], [id_rol], [nombre], [apellido], [edad], [direccion], [email], [pass]) VALUES (16, 1, N'string', N'string', 23, N'string', N'string', N'string')
INSERT [dbo].[Usuarios] ([id_usuario], [id_rol], [nombre], [apellido], [edad], [direccion], [email], [pass]) VALUES (17, 1, N'string', N'string', 23, N'string', N'string', N'string')
INSERT [dbo].[Usuarios] ([id_usuario], [id_rol], [nombre], [apellido], [edad], [direccion], [email], [pass]) VALUES (18, 1, N'string', N'string', 23, N'string', N'string', N'string')
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO
/****** Object:  Index [IX_Ahorros_id_meta]    Script Date: 22-10-2023 22:07:44 ******/
CREATE NONCLUSTERED INDEX [IX_Ahorros_id_meta] ON [dbo].[Ahorros]
(
	[id_meta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Ahorros_id_usuario]    Script Date: 22-10-2023 22:07:44 ******/
CREATE NONCLUSTERED INDEX [IX_Ahorros_id_usuario] ON [dbo].[Ahorros]
(
	[id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Gastos_id_categoria]    Script Date: 22-10-2023 22:07:44 ******/
CREATE NONCLUSTERED INDEX [IX_Gastos_id_categoria] ON [dbo].[Gastos]
(
	[id_categoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Gastos_id_usuario]    Script Date: 22-10-2023 22:07:44 ******/
CREATE NONCLUSTERED INDEX [IX_Gastos_id_usuario] ON [dbo].[Gastos]
(
	[id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Ingresos_id_fuente]    Script Date: 22-10-2023 22:07:44 ******/
CREATE NONCLUSTERED INDEX [IX_Ingresos_id_fuente] ON [dbo].[Ingresos]
(
	[id_fuente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Ingresos_id_usuario]    Script Date: 22-10-2023 22:07:44 ******/
CREATE NONCLUSTERED INDEX [IX_Ingresos_id_usuario] ON [dbo].[Ingresos]
(
	[id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Usuarios_id_rol]    Script Date: 22-10-2023 22:07:44 ******/
CREATE NONCLUSTERED INDEX [IX_Usuarios_id_rol] ON [dbo].[Usuarios]
(
	[id_rol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Ahorros]  WITH CHECK ADD  CONSTRAINT [FK_Ahorros_MetaAhorros_id_meta] FOREIGN KEY([id_meta])
REFERENCES [dbo].[MetaAhorros] ([id_meta])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Ahorros] CHECK CONSTRAINT [FK_Ahorros_MetaAhorros_id_meta]
GO
ALTER TABLE [dbo].[Ahorros]  WITH CHECK ADD  CONSTRAINT [FK_Ahorros_Usuarios_id_usuario] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[Usuarios] ([id_usuario])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Ahorros] CHECK CONSTRAINT [FK_Ahorros_Usuarios_id_usuario]
GO
ALTER TABLE [dbo].[Gastos]  WITH CHECK ADD  CONSTRAINT [FK_Gastos_CategoriaGastos_id_categoria] FOREIGN KEY([id_categoria])
REFERENCES [dbo].[CategoriaGastos] ([id_categoria])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Gastos] CHECK CONSTRAINT [FK_Gastos_CategoriaGastos_id_categoria]
GO
ALTER TABLE [dbo].[Gastos]  WITH CHECK ADD  CONSTRAINT [FK_Gastos_Usuarios_id_usuario] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[Usuarios] ([id_usuario])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Gastos] CHECK CONSTRAINT [FK_Gastos_Usuarios_id_usuario]
GO
ALTER TABLE [dbo].[Ingresos]  WITH CHECK ADD  CONSTRAINT [FK_Ingresos_FuenteIngresos_id_fuente] FOREIGN KEY([id_fuente])
REFERENCES [dbo].[FuenteIngresos] ([id_fuente])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Ingresos] CHECK CONSTRAINT [FK_Ingresos_FuenteIngresos_id_fuente]
GO
ALTER TABLE [dbo].[Ingresos]  WITH CHECK ADD  CONSTRAINT [FK_Ingresos_Usuarios_id_usuario] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[Usuarios] ([id_usuario])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Ingresos] CHECK CONSTRAINT [FK_Ingresos_Usuarios_id_usuario]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_Rols_id_rol] FOREIGN KEY([id_rol])
REFERENCES [dbo].[Rols] ([id_rol])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_Usuarios_Rols_id_rol]
GO
USE [master]
GO
ALTER DATABASE [presupuestodbEv2] SET  READ_WRITE 
GO
