USE [master]
GO
/****** Object:  Database [sigestran]    Script Date: 04/09/2019 06:49:28 p.m. ******/
CREATE DATABASE [sigestran]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'sigestran', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\sigestran.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'sigestran_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\sigestran_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [sigestran] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [sigestran].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [sigestran] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [sigestran] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [sigestran] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [sigestran] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [sigestran] SET ARITHABORT OFF 
GO
ALTER DATABASE [sigestran] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [sigestran] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [sigestran] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [sigestran] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [sigestran] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [sigestran] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [sigestran] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [sigestran] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [sigestran] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [sigestran] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [sigestran] SET  DISABLE_BROKER 
GO
ALTER DATABASE [sigestran] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [sigestran] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [sigestran] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [sigestran] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [sigestran] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [sigestran] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [sigestran] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [sigestran] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [sigestran] SET  MULTI_USER 
GO
ALTER DATABASE [sigestran] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [sigestran] SET DB_CHAINING OFF 
GO
ALTER DATABASE [sigestran] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [sigestran] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
/****** Object:  Login [NT SERVICE\Winmgmt]    Script Date: 04/09/2019 06:49:28 p.m. ******/
CREATE LOGIN [NT SERVICE\Winmgmt] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT SERVICE\SQLWriter]    Script Date: 04/09/2019 06:49:28 p.m. ******/
CREATE LOGIN [NT SERVICE\SQLWriter] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT Service\MSSQLSERVER]    Script Date: 04/09/2019 06:49:28 p.m. ******/
CREATE LOGIN [NT Service\MSSQLSERVER] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT AUTHORITY\SYSTEM]    Script Date: 04/09/2019 06:49:28 p.m. ******/
CREATE LOGIN [NT AUTHORITY\SYSTEM] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [dm15012]    Script Date: 04/09/2019 06:49:28 p.m. ******/
CREATE LOGIN [dm15012] WITH PASSWORD=N'a+7QRajzvRtHJSJkaXWauZh7aKVuSmd0Xa/39ZUUR48=', DEFAULT_DATABASE=[sigestran], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [dm15012] DISABLE
GO
/****** Object:  Login [Dalton-PC\Dalton]    Script Date: 04/09/2019 06:49:28 p.m. ******/
CREATE LOGIN [Dalton-PC\Dalton] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [BUILTIN\Usuarios]    Script Date: 04/09/2019 06:49:28 p.m. ******/
CREATE LOGIN [BUILTIN\Usuarios] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [##MS_PolicyTsqlExecutionLogin##]    Script Date: 04/09/2019 06:49:28 p.m. ******/
CREATE LOGIN [##MS_PolicyTsqlExecutionLogin##] WITH PASSWORD=N'Jf4jPkaROVKOrWNTRBhNFSO37Y1KlAX2iar0D/xkwco=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [##MS_PolicyTsqlExecutionLogin##] DISABLE
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [##MS_PolicyEventProcessingLogin##]    Script Date: 04/09/2019 06:49:28 p.m. ******/
CREATE LOGIN [##MS_PolicyEventProcessingLogin##] WITH PASSWORD=N'jBgFSznLjeSFHaHE5dIhyZ+9iK4O4juVVDoLZ2xPCng=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [##MS_PolicyEventProcessingLogin##] DISABLE
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT SERVICE\Winmgmt]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT SERVICE\SQLWriter]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT Service\MSSQLSERVER]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [dm15012]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [Dalton-PC\Dalton]
GO
USE [sigestran]
GO
/****** Object:  User [dm15012]    Script Date: 04/09/2019 06:49:29 p.m. ******/
CREATE USER [dm15012] FOR LOGIN [dm15012] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[address]    Script Date: 04/09/2019 06:49:29 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[address](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[detail] [nvarchar](250) NOT NULL,
	[created_by] [int] NULL,
	[updated_by] [int] NULL,
	[created_at] [datetimeoffset](7) NOT NULL,
	[updated_at] [datetimeoffset](7) NOT NULL,
	[city_id] [int] NULL,
	[department_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[city]    Script Date: 04/09/2019 06:49:29 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[city](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[created_by] [int] NULL,
	[updated_by] [int] NULL,
	[created_at] [datetimeoffset](7) NOT NULL,
	[updated_at] [datetimeoffset](7) NOT NULL,
	[department_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[department]    Script Date: 04/09/2019 06:49:29 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[department](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[created_by] [int] NULL,
	[updated_by] [int] NULL,
	[created_at] [datetimeoffset](7) NOT NULL,
	[updated_at] [datetimeoffset](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[frequent_place]    Script Date: 04/09/2019 06:49:29 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[frequent_place](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](250) NOT NULL,
	[detail] [nvarchar](250) NOT NULL,
	[created_by] [int] NULL,
	[updated_by] [int] NULL,
	[created_at] [datetimeoffset](7) NOT NULL,
	[updated_at] [datetimeoffset](7) NOT NULL,
	[city_id] [int] NULL,
	[department_id] [int] NULL,
	[frequent_place_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[procuraduria]    Script Date: 04/09/2019 06:49:29 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[procuraduria](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[created_by] [int] NULL,
	[updated_by] [int] NULL,
	[created_at] [datetimeoffset](7) NOT NULL,
	[updated_at] [datetimeoffset](7) NOT NULL,
	[address_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[vehicle]    Script Date: 04/09/2019 06:49:29 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vehicle](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[brand] [nvarchar](50) NOT NULL,
	[model] [nvarchar](50) NOT NULL,
	[plate] [nvarchar](10) NOT NULL,
	[chassis] [nvarchar](20) NOT NULL,
	[engine] [nvarchar](25) NOT NULL,
	[seats] [int] NOT NULL,
	[state] [nvarchar](25) NOT NULL,
	[created_by] [int] NULL,
	[updated_by] [int] NULL,
	[created_at] [datetimeoffset](7) NOT NULL,
	[updated_at] [datetimeoffset](7) NOT NULL,
	[procuraduria_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[city] ON 

INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (1, N'Santa Tecla', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 5)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (2, N'Antiguo Cuscatlán', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 5)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (3, N'Chiltiupán', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 5)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (4, N'Ciudad Arce', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 5)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (5, N'Colón', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 5)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (6, N'Comasagua', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 5)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (7, N'Huizúcar', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 5)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (8, N'Jayaque', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 5)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (9, N'Jicalapa', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 5)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (10, N'La Libertad', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 5)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (11, N' Nuevo Cuscatlán', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 5)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (12, N'Quezaltepeque', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 5)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (13, N'San Juan Opico', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 5)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (14, N'Sacacoyo', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 5)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (15, N'San José Villanueva', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 5)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (16, N'San Matías', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 5)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (17, N'San Pablo Tacachico', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 5)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (18, N'Talnique', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 5)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (19, N'Tamanique', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 5)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (20, N'Teotepeque', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 5)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (21, N'Tepecoyo', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 5)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (22, N'Zaragoza', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 5)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (23, N'SAN PEDRO PUXTLA', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 1)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (24, N'JUJUTLA', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 1)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (25, N'APANECA', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 1)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (26, N'CONCEPCION DE ATACO', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 1)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (27, N'SAN FRANCISCO MENENDEZ', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 1)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (28, N'TACUBA', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 1)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (29, N'TURIN', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 1)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (30, N'EL REFUGIO', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 1)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (31, N'ATIQUIZAYA', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 1)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (32, N'AHUACHAPAN', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 1)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (33, N'SAN LORENZO', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 1)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (34, N'GUAYMANGO', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 1)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (35, N'METAPAN', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 2)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (36, N'SAN ANTONIO PAJONAL', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 2)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (37, N'SANTIAGO DE LA FRONTERA', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 2)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (38, N'SANTA ROSA GUACHIPILIN', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 2)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (39, N'MASAHUAT', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 2)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (40, N'TEXISTEPEQUE', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 2)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (41, N'CANDELARIA DE LA FRONTERA', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 2)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (42, N'SANTA ANA', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 2)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (43, N'COATEPEQUE', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 2)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (44, N'EL PORVENIR', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 2)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (45, N'SAN SEBASTIAN SALITRILLO', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 2)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (46, N'CHALCHUAPA', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 2)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (47, N'EL CONGO', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 2)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (48, N'SANTA ISABEL ISHUATAN', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 3)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (49, N'CUISNAHUAT', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 3)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (50, N'ACAJUTLA', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 3)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (51, N'NAHULINGO', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 3)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (52, N'CALUCO', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 3)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (53, N'SAN ANTONIO DEL MONTE', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 3)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (54, N'SONSONATE', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 3)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (55, N'SAN JULIAN', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 3)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (56, N'ARMENIA', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 3)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (57, N'IZALCO', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 3)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (58, N'SANTA CATARINA MASAHUAT', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 3)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (59, N'SALCOATITAN', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 3)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (60, N'NAHUIZALCO', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 3)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (61, N'JUAYUA', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 3)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (62, N'SONZACATE', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 3)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (63, N'SANTO DOMINGO DE GUZMAN', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 3)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (64, N'NUEVA CONCEPCION', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 4)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (65, N'AGUA CALIENTE', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 4)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (66, N'LA PALMA', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 4)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (67, N'SAN IGNACIO', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 4)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (68, N'CITALA', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 4)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (69, N'SAN FERNANDO', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 4)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (70, N'LA REINA', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 4)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (71, N'SAN FRANCISCO MORAZAN', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 4)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (72, N'TEJUTLA', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 4)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (73, N'DULCE NOMBRE DE MARIA', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 4)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (74, N'EL PARAISO', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 4)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (75, N'SAN RAFAEL', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 4)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (76, N'SANTA RITA', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 4)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (77, N'CONCEPCION QUEZALTEPEQUE', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 4)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (78, N'CHALATENANGO', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 4)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (79, N'NUEVA TRINIDAD', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 4)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (80, N'LAS VUELTAS', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 4)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (81, N'OJOS DE AGUA', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 4)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (82, N'SAN ISIDRO LABRADOR', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 4)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (83, N'CANCASQUE', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 4)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (84, N'POTONICO', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 4)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (85, N'SAN MIGUEL DE MERCEDES', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 4)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (86, N'SAN ANTONIO LOS RANCHOS', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 4)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (87, N'AZACUALPA', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 4)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (88, N'SAN LUIS DEL CARMEN', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 4)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (89, N'SAN FRANCISCO LEMPA', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 4)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (90, N'SAN ANTONIO DE LA CRUZ', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 4)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (91, N'NOMBRE DE JESUS', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 4)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (92, N'LAS FLORES', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 4)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (93, N'ARCATAO', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 4)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (94, N'COMALAPA', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 4)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (95, N'LA LAGUNA', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 4)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (96, N'EL CARRIZAL', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 4)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (97, N'ROSARIO DE MORA', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 6)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (98, N'PANCHIMALCO', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 6)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (99, N'SAN MARCOS', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 6)
GO
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (100, N'SANTO TOMAS', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 6)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (101, N'SANTIAGO TEXACUANGOS', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 6)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (102, N'ILOPANGO', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 6)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (103, N'CUSCATANCINGO', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 6)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (104, N'SOYAPANGO', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 6)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (105, N'SAN SALVADOR', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 6)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (106, N'MEJICANOS', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 6)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (107, N'AYUTUXTEPEQUE', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 6)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (108, N'CIUDAD DELGADO', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 6)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (109, N'SAN MARTIN', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 6)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (110, N'TONACATEPEQUE', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 6)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (111, N'APOPA', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 6)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (112, N'NEJAPA', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 6)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (113, N'GUAZAPA', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 6)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (114, N'AGUILARES', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 6)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (115, N'EL PAISNAL', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 6)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (116, N'SUCHITOTO', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 7)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (117, N'TENANCINGO', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 7)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (118, N'SAN JOSE GUAYABAL', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 7)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (119, N'ORATORIO DE CONCEPCION', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 7)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (120, N'SAN BARTOLOME PERULAPIA', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 7)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (121, N'SAN PEDRO PERULAPAN', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 7)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (122, N'SANTA CRUZ MICHAPA', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 7)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (123, N'MONTE SAN JUAN', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 7)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (124, N'EL ROSARIO', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 7)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (125, N'SAN RAFAEL CEDROS', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 7)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (126, N'COJUTEPEQUE', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 7)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (127, N'EL CARMEN', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 7)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (128, N'SAN CRISTOBAL', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 7)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (129, N'CANDELARIA', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 7)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (130, N'SAN RAMON', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 7)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (131, N'SANTA CRUZ ANALQUITO', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 7)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (132, N'SAN LUIS TALPA', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 8)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (133, N'OLOCUILTA', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 8)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (134, N'SAN JUAN TALPA', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 8)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (135, N'EL ROSARIO', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 8)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (136, N'SAN ANTONIO MASAHUAT', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 8)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (137, N'TAPALHUACA', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 8)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (138, N'CUYULTITAN', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 8)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (139, N'SAN FRANCISCO CHINAMECA', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 8)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (140, N'SAN JUAN TEPEZONTES', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 8)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (141, N'SANTIAGO NONUALCO', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 8)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (142, N'SAN PEDRO MASAHUAT', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 8)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (143, N'SAN JUAN NONUALCO', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 8)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (144, N'ZACATECOLUCA', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 8)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (145, N'SAN RAFAEL OBRAJUELO', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 8)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (146, N'SAN LUIS LA HERRADURA', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 8)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (147, N'SAN PEDRO NONUALCO', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 8)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (148, N'SANTA MARIA OSTUMA', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 8)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (149, N'PARAISO DE OSORIO', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 8)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (150, N'SAN EMIGDIO', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 8)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (151, N'SAN MIGUEL TEPEZONTES', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 8)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (152, N'JERUSALEN', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 8)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (153, N'MERCEDES LA CEIBA', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 8)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (154, N'ILOBASCO', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 9)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (155, N'SAN ISIDRO', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 9)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (156, N'JUTIAPA', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 9)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (157, N'TEJUTEPEQUE', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 9)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (158, N'CINQUERA', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 9)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (159, N'SENSUNTEPEQUE', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 9)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (160, N'VICTORIA', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 9)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (161, N'GUACOTECTI', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 9)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (162, N'DOLORES', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 9)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (163, N'APASTEPEQUE', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 10)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (164, N'SAN SEBASTIAN', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 10)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (165, N'VERAPAZ', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 10)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (166, N'SANTO DOMINGO', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 10)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (167, N'SAN LORENZO', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 10)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (168, N'TEPETITAN', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 10)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (169, N'SAN CAYETANO ISTEPEQUE', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 10)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (170, N'GUADALUPE', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 10)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (171, N'TECOLUCA', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 10)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (172, N'SAN ILDEFONSO', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 10)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (173, N'SANTA CLARA', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 10)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (174, N'SAN ESTEBAN CATARINA', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 10)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (175, N'SAN VICENTE', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 10)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (176, N'ESTANZUELAS', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 11)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (177, N'SAN AGUSTIN', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 11)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (178, N'BERLIN', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 11)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (179, N'NUEVA GRANADA', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 11)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (180, N'EL TRIUNFO', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 11)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (181, N'SAN BUENA VENTURA', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 11)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (182, N'SANTIAGO DE MARIA', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 11)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (183, N'JUCUAPA', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 11)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (184, N'ALEGRIA', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 11)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (185, N'JIQUILISCO', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 11)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (186, N'SANTA ELENA', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 11)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (187, N'SAN FRANCISCO JAVIER', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 11)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (188, N'TECAPAN', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 11)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (189, N'CALIFORNIA', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 11)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (190, N'OZATLAN', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 11)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (191, N'SANTA MARIA', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 11)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (192, N'EREGUAYQUIN', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 11)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (193, N'USULUTAN', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 11)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (194, N'CONCEPCION BATRES', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 11)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (195, N'SAN DIONISIO', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 11)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (196, N'PUERTO EL TRIUNFO', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 11)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (197, N'JUCUARAN', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 11)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (198, N'MERCEDES UMANA', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 11)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (199, N'SESORI', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 12)
GO
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (200, N'NUEVO EDEN DE SAN JUAN', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 12)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (201, N'SAN GERARDO', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 12)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (202, N'SAN LUIS DE LA REINA', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 12)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (203, N'CAROLINA', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 12)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (204, N'SAN ANTONIO', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 12)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (205, N'CIUDAD BARRIOS', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 12)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (206, N'CHAPELTIQUE', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 12)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (207, N'LOLOTIQUE', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 12)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (208, N'MONCAGUA', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 12)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (209, N'NUEVA GUADALUPE', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 12)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (210, N'CHINAMECA', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 12)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (211, N'SAN JORGE', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 12)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (212, N'QUELEPA', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 12)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (213, N'SAN MIGUEL', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 12)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (214, N'SAN RAFAEL ORIENTE', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 12)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (215, N'EL TRANSITO', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 12)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (216, N'CHIRILAGUA', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 12)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (217, N'ULUAZAPA', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 12)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (218, N'COMACARAN', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 12)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (219, N'LOLOTIQUILLO', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 13)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (220, N'CHILANGA', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 13)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (221, N'GUATAJIAGUA', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 13)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (222, N'SAN FRANCISCO GOTERA', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 13)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (223, N'SENSEMBRA', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 13)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (224, N'YAMABAL', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 13)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (225, N'SAN CARLOS', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 13)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (226, N'EL DIVISADERO', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 13)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (227, N'JOCORO', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 13)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (228, N'CORINTO', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 13)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (229, N'SOCIEDAD', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 13)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (230, N'CACAOPERA', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 13)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (231, N'SAN FERNANDO', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 13)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (232, N'ARAMBALA', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 13)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (233, N'PERQUIN', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 13)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (234, N'JOCOAITIQUE', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 13)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (235, N'TOROLA', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 13)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (236, N'SAN ISIDRO', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 13)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (237, N'EL ROSARIO', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 13)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (238, N'MEANGUERA', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 13)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (239, N'JOATECA', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 13)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (240, N'SAN SIMON', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 13)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (241, N'GUALOCOCTI', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 13)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (242, N'DELICIAS DE CONCEPCION', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 13)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (243, N'YOLOAIQUIN', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 13)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (244, N'OSICALA', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 13)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (245, N'SAN ALEJO', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 14)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (246, N'PASAQUINA', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 14)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (247, N'SANTA ROSA DE LIMA', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 14)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (248, N'EL SAUCE', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 14)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (249, N'ANAMOROS', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 14)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (250, N'CONCHAGUA', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 14)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (251, N'INTIPUCA', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 14)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (252, N'NUEVA ESPARTA', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 14)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (253, N'LISLIQUE', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 14)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (254, N'POLOROS', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 14)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (255, N'CONCEPCION DE ORIENTE', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 14)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (256, N'YUCUAIQUIN', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 14)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (257, N'BOLIVAR', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 14)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (258, N'SAN JOSE', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 14)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (259, N'YAYANTIQUE', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 14)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (260, N'EL CARMEN', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 14)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (261, N'LA UNION', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 14)
INSERT [dbo].[city] ([id], [name], [created_by], [updated_by], [created_at], [updated_at], [department_id]) VALUES (262, N'MEANGUERA DEL GOLFO', 0, 0, CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0000000+00:00' AS DateTimeOffset), 14)
SET IDENTITY_INSERT [dbo].[city] OFF
SET IDENTITY_INSERT [dbo].[department] ON 

INSERT [dbo].[department] ([id], [name], [created_by], [updated_by], [created_at], [updated_at]) VALUES (1, N'Ahuachapan', NULL, NULL, CAST(N'2019-07-15T05:18:42.0870000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0870000+00:00' AS DateTimeOffset))
INSERT [dbo].[department] ([id], [name], [created_by], [updated_by], [created_at], [updated_at]) VALUES (2, N'Santa Ana', NULL, NULL, CAST(N'2019-07-15T05:18:42.0870000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0870000+00:00' AS DateTimeOffset))
INSERT [dbo].[department] ([id], [name], [created_by], [updated_by], [created_at], [updated_at]) VALUES (3, N'Sonsonate', NULL, NULL, CAST(N'2019-07-15T05:18:42.0870000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0870000+00:00' AS DateTimeOffset))
INSERT [dbo].[department] ([id], [name], [created_by], [updated_by], [created_at], [updated_at]) VALUES (4, N'Chalatenango', NULL, NULL, CAST(N'2019-07-15T05:18:42.0870000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0870000+00:00' AS DateTimeOffset))
INSERT [dbo].[department] ([id], [name], [created_by], [updated_by], [created_at], [updated_at]) VALUES (5, N'La Libertad', NULL, NULL, CAST(N'2019-07-15T05:18:42.0870000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0870000+00:00' AS DateTimeOffset))
INSERT [dbo].[department] ([id], [name], [created_by], [updated_by], [created_at], [updated_at]) VALUES (6, N'San Salvador', NULL, NULL, CAST(N'2019-07-15T05:18:42.0870000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0870000+00:00' AS DateTimeOffset))
INSERT [dbo].[department] ([id], [name], [created_by], [updated_by], [created_at], [updated_at]) VALUES (7, N'Cuscatlán', NULL, NULL, CAST(N'2019-07-15T05:18:42.0870000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0870000+00:00' AS DateTimeOffset))
INSERT [dbo].[department] ([id], [name], [created_by], [updated_by], [created_at], [updated_at]) VALUES (8, N'La Paz', NULL, NULL, CAST(N'2019-07-15T05:18:42.0870000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0870000+00:00' AS DateTimeOffset))
INSERT [dbo].[department] ([id], [name], [created_by], [updated_by], [created_at], [updated_at]) VALUES (9, N'Cabañas', NULL, NULL, CAST(N'2019-07-15T05:18:42.0870000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0870000+00:00' AS DateTimeOffset))
INSERT [dbo].[department] ([id], [name], [created_by], [updated_by], [created_at], [updated_at]) VALUES (10, N'San Vicente', NULL, NULL, CAST(N'2019-07-15T05:18:42.0870000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0870000+00:00' AS DateTimeOffset))
INSERT [dbo].[department] ([id], [name], [created_by], [updated_by], [created_at], [updated_at]) VALUES (11, N'Usulután', NULL, NULL, CAST(N'2019-07-15T05:18:42.0870000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0870000+00:00' AS DateTimeOffset))
INSERT [dbo].[department] ([id], [name], [created_by], [updated_by], [created_at], [updated_at]) VALUES (12, N'San Miguel', NULL, NULL, CAST(N'2019-07-15T05:18:42.0870000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0870000+00:00' AS DateTimeOffset))
INSERT [dbo].[department] ([id], [name], [created_by], [updated_by], [created_at], [updated_at]) VALUES (13, N'Morazán', NULL, NULL, CAST(N'2019-07-15T05:18:42.0870000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0870000+00:00' AS DateTimeOffset))
INSERT [dbo].[department] ([id], [name], [created_by], [updated_by], [created_at], [updated_at]) VALUES (14, N'La Unión', NULL, NULL, CAST(N'2019-07-15T05:18:42.0870000+00:00' AS DateTimeOffset), CAST(N'2019-07-15T05:18:42.0870000+00:00' AS DateTimeOffset))
SET IDENTITY_INSERT [dbo].[department] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__frequent__72E12F1BCFFA2EE6]    Script Date: 04/09/2019 06:49:29 p.m. ******/
ALTER TABLE [dbo].[frequent_place] ADD UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__vehicle__0C04E256C9E5B3EA]    Script Date: 04/09/2019 06:49:29 p.m. ******/
ALTER TABLE [dbo].[vehicle] ADD UNIQUE NONCLUSTERED 
(
	[plate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[vehicle] ADD  DEFAULT (N'Funcional') FOR [state]
GO
ALTER TABLE [dbo].[address]  WITH CHECK ADD FOREIGN KEY([city_id])
REFERENCES [dbo].[city] ([id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[address]  WITH CHECK ADD FOREIGN KEY([department_id])
REFERENCES [dbo].[department] ([id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[city]  WITH CHECK ADD FOREIGN KEY([department_id])
REFERENCES [dbo].[department] ([id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[frequent_place]  WITH CHECK ADD FOREIGN KEY([city_id])
REFERENCES [dbo].[city] ([id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[frequent_place]  WITH CHECK ADD FOREIGN KEY([department_id])
REFERENCES [dbo].[department] ([id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[frequent_place]  WITH CHECK ADD FOREIGN KEY([frequent_place_id])
REFERENCES [dbo].[procuraduria] ([id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[procuraduria]  WITH CHECK ADD FOREIGN KEY([address_id])
REFERENCES [dbo].[address] ([id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[vehicle]  WITH CHECK ADD FOREIGN KEY([procuraduria_id])
REFERENCES [dbo].[procuraduria] ([id])
ON DELETE SET NULL
GO
USE [master]
GO
ALTER DATABASE [sigestran] SET  READ_WRITE 
GO
