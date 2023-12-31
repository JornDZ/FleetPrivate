USE [master]
GO
/****** Object:  Database [FleetManagementDB]    Script Date: 2/11/2023 9:23:01 ******/
CREATE DATABASE [FleetManagementDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FleetManagementDB', FILENAME = N'/var/opt/mssql/data/FleetManagementDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FleetManagementDB_log', FILENAME = N'/var/opt/mssql/data/FleetManagementDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [FleetManagementDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FleetManagementDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FleetManagementDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FleetManagementDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FleetManagementDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FleetManagementDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FleetManagementDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [FleetManagementDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FleetManagementDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FleetManagementDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FleetManagementDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FleetManagementDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FleetManagementDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FleetManagementDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FleetManagementDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FleetManagementDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FleetManagementDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FleetManagementDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FleetManagementDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FleetManagementDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FleetManagementDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FleetManagementDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FleetManagementDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FleetManagementDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FleetManagementDB] SET RECOVERY FULL 
GO
ALTER DATABASE [FleetManagementDB] SET  MULTI_USER 
GO
ALTER DATABASE [FleetManagementDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FleetManagementDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FleetManagementDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FleetManagementDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FleetManagementDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FleetManagementDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'FleetManagementDB', N'ON'
GO
ALTER DATABASE [FleetManagementDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [FleetManagementDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [FleetManagementDB]
GO
/****** Object:  Table [dbo].[Bestuurder]    Script Date: 2/11/2023 9:23:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bestuurder](
	[bestuurderId] [int] IDENTITY(1,1) NOT NULL,
	[naam] [varchar](30) NOT NULL,
	[voornaam] [varchar](30) NOT NULL,
	[adres] [varchar](100) NOT NULL,
	[rijksregisternummer] [varchar](30) NOT NULL,
	[typerijbewijsId] [int] NOT NULL,
 CONSTRAINT [PK_Bestuurder] PRIMARY KEY CLUSTERED 
(
	[bestuurderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BrandstofType]    Script Date: 2/11/2023 9:23:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BrandstofType](
	[brandstofTypeId] [int] IDENTITY(1,1) NOT NULL,
	[type] [varchar](30) NOT NULL,
 CONSTRAINT [PK_BrandstofType] PRIMARY KEY CLUSTERED 
(
	[brandstofTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fleet]    Script Date: 2/11/2023 9:23:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fleet](
	[fleetId] [int] IDENTITY(1,1) NOT NULL,
	[bestuurderId] [int] NOT NULL,
	[tankkaartId] [int] NOT NULL,
	[voertuigId] [int] NOT NULL,
 CONSTRAINT [PK_Fleet] PRIMARY KEY CLUSTERED 
(
	[fleetId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UK_Fleet_B] UNIQUE NONCLUSTERED 
(
	[bestuurderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UK_Fleet_BTV] UNIQUE NONCLUSTERED 
(
	[bestuurderId] ASC,
	[tankkaartId] ASC,
	[voertuigId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UK_Fleet_T] UNIQUE NONCLUSTERED 
(
	[tankkaartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UK_Fleet_V] UNIQUE NONCLUSTERED 
(
	[voertuigId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Login]    Script Date: 2/11/2023 9:23:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Login](
	[loginId] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[wachtwoord] [varchar](20) NOT NULL,
	[rol] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Login] PRIMARY KEY CLUSTERED 
(
	[loginId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tankkaart]    Script Date: 2/11/2023 9:23:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tankkaart](
	[tankkaartId] [int] IDENTITY(1,1) NOT NULL,
	[kaartnummer] [int] NOT NULL,
	[geldigheidsdatum] [datetime] NOT NULL,
	[pincode] [int] NOT NULL,
	[brandstofTypeId] [int] NOT NULL,
	[actief] [bit] NULL,
 CONSTRAINT [PK_Tankkaart] PRIMARY KEY CLUSTERED 
(
	[tankkaartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeRijbewijs]    Script Date: 2/11/2023 9:23:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeRijbewijs](
	[typeRijbewijsId] [int] IDENTITY(1,1) NOT NULL,
	[type] [varchar](30) NOT NULL,
 CONSTRAINT [PK_TypeRijbewijs] PRIMARY KEY CLUSTERED 
(
	[typeRijbewijsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeWagen]    Script Date: 2/11/2023 9:23:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeWagen](
	[typeWagenId] [int] IDENTITY(1,1) NOT NULL,
	[type] [varchar](30) NOT NULL,
 CONSTRAINT [PK_TypeWagen] PRIMARY KEY CLUSTERED 
(
	[typeWagenId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Voertuig]    Script Date: 2/11/2023 9:23:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Voertuig](
	[voertuigId] [int] IDENTITY(1,1) NOT NULL,
	[merkEnModel] [varchar](30) NOT NULL,
	[chassisnummer] [varchar](30) NOT NULL,
	[nummerplaat] [varchar](30) NOT NULL,
	[brandstofTypeId] [int] NOT NULL,
	[typeWagenId] [int] NOT NULL,
	[kleur] [varchar](30) NOT NULL,
	[aantal_deuren] [int] NOT NULL,
 CONSTRAINT [PK_Voertuig] PRIMARY KEY CLUSTERED 
(
	[voertuigId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Login] ADD  DEFAULT ('User') FOR [rol]
GO
ALTER TABLE [dbo].[Tankkaart] ADD  DEFAULT ((1)) FOR [actief]
GO
ALTER TABLE [dbo].[Bestuurder]  WITH CHECK ADD  CONSTRAINT [FK_Bestuurder_TypeRijbewijs] FOREIGN KEY([typerijbewijsId])
REFERENCES [dbo].[TypeRijbewijs] ([typeRijbewijsId])
GO
ALTER TABLE [dbo].[Bestuurder] CHECK CONSTRAINT [FK_Bestuurder_TypeRijbewijs]
GO
ALTER TABLE [dbo].[Fleet]  WITH CHECK ADD  CONSTRAINT [FK_Fleet_Bestuurder] FOREIGN KEY([bestuurderId])
REFERENCES [dbo].[Bestuurder] ([bestuurderId])
GO
ALTER TABLE [dbo].[Fleet] CHECK CONSTRAINT [FK_Fleet_Bestuurder]
GO
ALTER TABLE [dbo].[Fleet]  WITH CHECK ADD  CONSTRAINT [FK_Fleet_Tankkaart] FOREIGN KEY([tankkaartId])
REFERENCES [dbo].[Tankkaart] ([tankkaartId])
GO
ALTER TABLE [dbo].[Fleet] CHECK CONSTRAINT [FK_Fleet_Tankkaart]
GO
ALTER TABLE [dbo].[Fleet]  WITH CHECK ADD  CONSTRAINT [FK_Fleet_Voertuig] FOREIGN KEY([voertuigId])
REFERENCES [dbo].[Voertuig] ([voertuigId])
GO
ALTER TABLE [dbo].[Fleet] CHECK CONSTRAINT [FK_Fleet_Voertuig]
GO
ALTER TABLE [dbo].[Tankkaart]  WITH CHECK ADD  CONSTRAINT [FK_Tankkaart_BrandstofType] FOREIGN KEY([brandstofTypeId])
REFERENCES [dbo].[BrandstofType] ([brandstofTypeId])
GO
ALTER TABLE [dbo].[Tankkaart] CHECK CONSTRAINT [FK_Tankkaart_BrandstofType]
GO
ALTER TABLE [dbo].[Voertuig]  WITH CHECK ADD  CONSTRAINT [FK_Voertuig_BrandstofType] FOREIGN KEY([brandstofTypeId])
REFERENCES [dbo].[BrandstofType] ([brandstofTypeId])
GO
ALTER TABLE [dbo].[Voertuig] CHECK CONSTRAINT [FK_Voertuig_BrandstofType]
GO
ALTER TABLE [dbo].[Voertuig]  WITH CHECK ADD  CONSTRAINT [FK_Voertuig_TypeWagen] FOREIGN KEY([typeWagenId])
REFERENCES [dbo].[TypeWagen] ([typeWagenId])
GO
ALTER TABLE [dbo].[Voertuig] CHECK CONSTRAINT [FK_Voertuig_TypeWagen]
GO
USE [master]
GO
ALTER DATABASE [FleetManagementDB] SET  READ_WRITE 
GO
