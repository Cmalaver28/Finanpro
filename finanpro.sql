USE [master]
GO
/****** Object:  Database [finanpro]    Script Date: 26/03/2025 4:40:54 p. m. ******/
CREATE DATABASE [finanpro]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'finanpro', FILENAME = N'C:\Users\User\Downloads\MSSQL16.SQLEXPRESS\MSSQL\DATA\finanpro.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'finanpro_log', FILENAME = N'C:\Users\User\Downloads\MSSQL16.SQLEXPRESS\MSSQL\DATA\finanpro_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [finanpro] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [finanpro].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [finanpro] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [finanpro] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [finanpro] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [finanpro] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [finanpro] SET ARITHABORT OFF 
GO
ALTER DATABASE [finanpro] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [finanpro] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [finanpro] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [finanpro] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [finanpro] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [finanpro] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [finanpro] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [finanpro] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [finanpro] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [finanpro] SET  ENABLE_BROKER 
GO
ALTER DATABASE [finanpro] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [finanpro] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [finanpro] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [finanpro] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [finanpro] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [finanpro] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [finanpro] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [finanpro] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [finanpro] SET  MULTI_USER 
GO
ALTER DATABASE [finanpro] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [finanpro] SET DB_CHAINING OFF 
GO
ALTER DATABASE [finanpro] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [finanpro] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [finanpro] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [finanpro] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [finanpro] SET QUERY_STORE = ON
GO
ALTER DATABASE [finanpro] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [finanpro]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 26/03/2025 4:40:55 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ahorros]    Script Date: 26/03/2025 4:40:55 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ahorros](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Monto] [decimal](18, 2) NOT NULL,
	[Fecha] [datetime2](7) NOT NULL,
	[UsuarioId] [int] NOT NULL,
	[BolsilloId] [int] NOT NULL,
 CONSTRAINT [PK_Ahorros] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bolsillos]    Script Date: 26/03/2025 4:40:55 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bolsillos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](max) NOT NULL,
	[Saldo] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Bolsillos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Egresos]    Script Date: 26/03/2025 4:40:55 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Egresos](
	[Id] [uniqueidentifier] NOT NULL,
	[UsuarioId] [uniqueidentifier] NOT NULL,
	[UsuarioId1] [int] NOT NULL,
	[Monto] [decimal](18, 2) NOT NULL,
	[Fecha] [datetime2](7) NOT NULL,
	[EtiquetaId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Egresos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Etiquetas]    Script Date: 26/03/2025 4:40:55 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Etiquetas](
	[Id] [uniqueidentifier] NOT NULL,
	[UsuarioId] [uniqueidentifier] NOT NULL,
	[UsuarioId1] [int] NOT NULL,
	[Nombre] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Etiquetas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ingresos]    Script Date: 26/03/2025 4:40:55 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ingresos](
	[Id] [uniqueidentifier] NOT NULL,
	[UsuarioId] [uniqueidentifier] NOT NULL,
	[UsuarioId1] [int] NOT NULL,
	[Monto] [decimal](18, 2) NOT NULL,
	[Mes] [int] NOT NULL,
	[EtiquetaId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Ingresos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Logs]    Script Date: 26/03/2025 4:40:55 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Logs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Tipo] [nvarchar](max) NOT NULL,
	[Mensaje] [nvarchar](max) NOT NULL,
	[Detalle] [nvarchar](max) NOT NULL,
	[Fecha] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Logs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Presupuestos]    Script Date: 26/03/2025 4:40:55 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Presupuestos](
	[Id] [uniqueidentifier] NOT NULL,
	[UsuarioId] [uniqueidentifier] NOT NULL,
	[UsuarioId1] [int] NOT NULL,
	[Tipo] [nvarchar](max) NOT NULL,
	[MontoEsperado] [decimal](18, 2) NOT NULL,
	[FechaInicio] [datetime2](7) NOT NULL,
	[FechaFin] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Presupuestos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 26/03/2025 4:40:55 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Contraseña] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250326155151_FixAhorroRelationship', N'9.0.3')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250326163740_AddLogsTable', N'9.0.3')
GO
/****** Object:  Index [IX_Ahorros_BolsilloId]    Script Date: 26/03/2025 4:40:55 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_Ahorros_BolsilloId] ON [dbo].[Ahorros]
(
	[BolsilloId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Ahorros_UsuarioId]    Script Date: 26/03/2025 4:40:55 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_Ahorros_UsuarioId] ON [dbo].[Ahorros]
(
	[UsuarioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Egresos_EtiquetaId]    Script Date: 26/03/2025 4:40:55 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_Egresos_EtiquetaId] ON [dbo].[Egresos]
(
	[EtiquetaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Egresos_UsuarioId1]    Script Date: 26/03/2025 4:40:55 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_Egresos_UsuarioId1] ON [dbo].[Egresos]
(
	[UsuarioId1] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Etiquetas_UsuarioId1]    Script Date: 26/03/2025 4:40:55 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_Etiquetas_UsuarioId1] ON [dbo].[Etiquetas]
(
	[UsuarioId1] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Ingresos_EtiquetaId]    Script Date: 26/03/2025 4:40:55 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_Ingresos_EtiquetaId] ON [dbo].[Ingresos]
(
	[EtiquetaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Ingresos_UsuarioId1]    Script Date: 26/03/2025 4:40:55 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_Ingresos_UsuarioId1] ON [dbo].[Ingresos]
(
	[UsuarioId1] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Presupuestos_UsuarioId1]    Script Date: 26/03/2025 4:40:55 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_Presupuestos_UsuarioId1] ON [dbo].[Presupuestos]
(
	[UsuarioId1] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Ahorros]  WITH CHECK ADD  CONSTRAINT [FK_Ahorros_Bolsillos_BolsilloId] FOREIGN KEY([BolsilloId])
REFERENCES [dbo].[Bolsillos] ([Id])
GO
ALTER TABLE [dbo].[Ahorros] CHECK CONSTRAINT [FK_Ahorros_Bolsillos_BolsilloId]
GO
ALTER TABLE [dbo].[Ahorros]  WITH CHECK ADD  CONSTRAINT [FK_Ahorros_Usuarios_UsuarioId] FOREIGN KEY([UsuarioId])
REFERENCES [dbo].[Usuarios] ([Id])
GO
ALTER TABLE [dbo].[Ahorros] CHECK CONSTRAINT [FK_Ahorros_Usuarios_UsuarioId]
GO
ALTER TABLE [dbo].[Egresos]  WITH CHECK ADD  CONSTRAINT [FK_Egresos_Etiquetas_EtiquetaId] FOREIGN KEY([EtiquetaId])
REFERENCES [dbo].[Etiquetas] ([Id])
GO
ALTER TABLE [dbo].[Egresos] CHECK CONSTRAINT [FK_Egresos_Etiquetas_EtiquetaId]
GO
ALTER TABLE [dbo].[Egresos]  WITH CHECK ADD  CONSTRAINT [FK_Egresos_Usuarios_UsuarioId1] FOREIGN KEY([UsuarioId1])
REFERENCES [dbo].[Usuarios] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Egresos] CHECK CONSTRAINT [FK_Egresos_Usuarios_UsuarioId1]
GO
ALTER TABLE [dbo].[Etiquetas]  WITH CHECK ADD  CONSTRAINT [FK_Etiquetas_Usuarios_UsuarioId1] FOREIGN KEY([UsuarioId1])
REFERENCES [dbo].[Usuarios] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Etiquetas] CHECK CONSTRAINT [FK_Etiquetas_Usuarios_UsuarioId1]
GO
ALTER TABLE [dbo].[Ingresos]  WITH CHECK ADD  CONSTRAINT [FK_Ingresos_Etiquetas_EtiquetaId] FOREIGN KEY([EtiquetaId])
REFERENCES [dbo].[Etiquetas] ([Id])
GO
ALTER TABLE [dbo].[Ingresos] CHECK CONSTRAINT [FK_Ingresos_Etiquetas_EtiquetaId]
GO
ALTER TABLE [dbo].[Ingresos]  WITH CHECK ADD  CONSTRAINT [FK_Ingresos_Usuarios_UsuarioId1] FOREIGN KEY([UsuarioId1])
REFERENCES [dbo].[Usuarios] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Ingresos] CHECK CONSTRAINT [FK_Ingresos_Usuarios_UsuarioId1]
GO
ALTER TABLE [dbo].[Presupuestos]  WITH CHECK ADD  CONSTRAINT [FK_Presupuestos_Usuarios_UsuarioId1] FOREIGN KEY([UsuarioId1])
REFERENCES [dbo].[Usuarios] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Presupuestos] CHECK CONSTRAINT [FK_Presupuestos_Usuarios_UsuarioId1]
GO
USE [master]
GO
ALTER DATABASE [finanpro] SET  READ_WRITE 
GO
