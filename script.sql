USE [master]
GO
/****** Object:  Database [DetailingCenter]    Script Date: 13.05.2021 21:55:41 ******/
CREATE DATABASE [DetailingCenter]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DetailingCenter', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\DetailingCenter.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DetailingCenter_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\DetailingCenter_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [DetailingCenter] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DetailingCenter].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DetailingCenter] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DetailingCenter] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DetailingCenter] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DetailingCenter] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DetailingCenter] SET ARITHABORT OFF 
GO
ALTER DATABASE [DetailingCenter] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DetailingCenter] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DetailingCenter] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DetailingCenter] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DetailingCenter] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DetailingCenter] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DetailingCenter] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DetailingCenter] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DetailingCenter] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DetailingCenter] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DetailingCenter] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DetailingCenter] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DetailingCenter] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DetailingCenter] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DetailingCenter] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DetailingCenter] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DetailingCenter] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DetailingCenter] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DetailingCenter] SET  MULTI_USER 
GO
ALTER DATABASE [DetailingCenter] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DetailingCenter] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DetailingCenter] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DetailingCenter] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DetailingCenter] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DetailingCenter] SET QUERY_STORE = OFF
GO
USE [DetailingCenter]
GO
/****** Object:  Table [dbo].[CarColor]    Script Date: 13.05.2021 21:55:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarColor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_CarColor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CarMark]    Script Date: 13.05.2021 21:55:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarMark](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_CarMark] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CarModel]    Script Date: 13.05.2021 21:55:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarModel](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[StartYear] [nvarchar](4) NOT NULL,
	[CarMarkId] [int] NOT NULL,
 CONSTRAINT [PK_CarModel] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 13.05.2021 21:55:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[GenderCode] [nvarchar](1) NOT NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[LastServiceId] [int] NULL,
	[LastVisit] [date] NOT NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 13.05.2021 21:55:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[GenderCode] [nvarchar](1) NOT NULL,
	[RoleId] [int] NOT NULL,
	[DateOfEmployment] [date] NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 13.05.2021 21:55:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[Code] [nvarchar](1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 13.05.2021 21:55:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[ClientId] [int] NOT NULL,
	[ServiceId] [int] NOT NULL,
	[CarId] [int] NOT NULL,
	[CarPhotoPath] [nvarchar](1000) NULL,
	[StatusId] [int] NOT NULL,
	[CarColorId] [int] NOT NULL,
	[DateOfService] [date] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderStatus]    Script Date: 13.05.2021 21:55:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderStatus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_OrderStatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 13.05.2021 21:55:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 13.05.2021 21:55:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ServiceTypeId] [int] NOT NULL,
	[Duration] [decimal](5, 2) NOT NULL,
	[Cost] [decimal](10, 2) NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Service_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceType]    Script Date: 13.05.2021 21:55:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CarColor] ON 

INSERT [dbo].[CarColor] ([Id], [Name]) VALUES (1, N'White')
INSERT [dbo].[CarColor] ([Id], [Name]) VALUES (2, N'Red')
INSERT [dbo].[CarColor] ([Id], [Name]) VALUES (3, N'Black')
INSERT [dbo].[CarColor] ([Id], [Name]) VALUES (4, N'Yellow')
INSERT [dbo].[CarColor] ([Id], [Name]) VALUES (5, N'Blue')
SET IDENTITY_INSERT [dbo].[CarColor] OFF
SET IDENTITY_INSERT [dbo].[CarMark] ON 

INSERT [dbo].[CarMark] ([Id], [Name]) VALUES (1, N'Acura')
INSERT [dbo].[CarMark] ([Id], [Name]) VALUES (2, N'Alfa Romeo')
INSERT [dbo].[CarMark] ([Id], [Name]) VALUES (3, N'Aston Martin')
INSERT [dbo].[CarMark] ([Id], [Name]) VALUES (4, N'Audi')
INSERT [dbo].[CarMark] ([Id], [Name]) VALUES (5, N'Bentley')
INSERT [dbo].[CarMark] ([Id], [Name]) VALUES (6, N'BMW')
INSERT [dbo].[CarMark] ([Id], [Name]) VALUES (7, N'Brilliance')
INSERT [dbo].[CarMark] ([Id], [Name]) VALUES (8, N'Bugatti')
INSERT [dbo].[CarMark] ([Id], [Name]) VALUES (9, N'Buick')
INSERT [dbo].[CarMark] ([Id], [Name]) VALUES (10, N'BYD')
INSERT [dbo].[CarMark] ([Id], [Name]) VALUES (11, N'Cadillac')
INSERT [dbo].[CarMark] ([Id], [Name]) VALUES (12, N'Changan')
INSERT [dbo].[CarMark] ([Id], [Name]) VALUES (13, N'Chery')
INSERT [dbo].[CarMark] ([Id], [Name]) VALUES (14, N'Chevrolet')
INSERT [dbo].[CarMark] ([Id], [Name]) VALUES (15, N'Chrysler')
INSERT [dbo].[CarMark] ([Id], [Name]) VALUES (16, N'Citroen')
INSERT [dbo].[CarMark] ([Id], [Name]) VALUES (17, N'Daewoo')
INSERT [dbo].[CarMark] ([Id], [Name]) VALUES (18, N'Daihatsu')
INSERT [dbo].[CarMark] ([Id], [Name]) VALUES (19, N'Datsun')
INSERT [dbo].[CarMark] ([Id], [Name]) VALUES (20, N'Dodge')
INSERT [dbo].[CarMark] ([Id], [Name]) VALUES (21, N'Dongfeng')
INSERT [dbo].[CarMark] ([Id], [Name]) VALUES (22, N'FAW')
INSERT [dbo].[CarMark] ([Id], [Name]) VALUES (23, N'Ferrari')
INSERT [dbo].[CarMark] ([Id], [Name]) VALUES (24, N'Fiat')
INSERT [dbo].[CarMark] ([Id], [Name]) VALUES (25, N'Fisker')
INSERT [dbo].[CarMark] ([Id], [Name]) VALUES (26, N'Ford')
INSERT [dbo].[CarMark] ([Id], [Name]) VALUES (27, N'GAZ')
INSERT [dbo].[CarMark] ([Id], [Name]) VALUES (28, N'Geely')
INSERT [dbo].[CarMark] ([Id], [Name]) VALUES (29, N'Genesis')
INSERT [dbo].[CarMark] ([Id], [Name]) VALUES (30, N'GMC')
INSERT [dbo].[CarMark] ([Id], [Name]) VALUES (31, N'Great Wall')
INSERT [dbo].[CarMark] ([Id], [Name]) VALUES (32, N'Haval')
INSERT [dbo].[CarMark] ([Id], [Name]) VALUES (33, N'Holden')
INSERT [dbo].[CarMark] ([Id], [Name]) VALUES (34, N'Honda')
INSERT [dbo].[CarMark] ([Id], [Name]) VALUES (35, N'Hummer')
INSERT [dbo].[CarMark] ([Id], [Name]) VALUES (36, N'Hyundai')
INSERT [dbo].[CarMark] ([Id], [Name]) VALUES (37, N'Infiniti')
INSERT [dbo].[CarMark] ([Id], [Name]) VALUES (38, N'Isuzu')
INSERT [dbo].[CarMark] ([Id], [Name]) VALUES (39, N'Iveco')
INSERT [dbo].[CarMark] ([Id], [Name]) VALUES (40, N'Jaguar')
INSERT [dbo].[CarMark] ([Id], [Name]) VALUES (41, N'Jeep')
INSERT [dbo].[CarMark] ([Id], [Name]) VALUES (42, N'Kia')
INSERT [dbo].[CarMark] ([Id], [Name]) VALUES (43, N'Lamborghini')
INSERT [dbo].[CarMark] ([Id], [Name]) VALUES (44, N'Lancia')
INSERT [dbo].[CarMark] ([Id], [Name]) VALUES (45, N'Land Rover')
INSERT [dbo].[CarMark] ([Id], [Name]) VALUES (46, N'Lexus')
INSERT [dbo].[CarMark] ([Id], [Name]) VALUES (47, N'Lifan')
INSERT [dbo].[CarMark] ([Id], [Name]) VALUES (48, N'Lincoln')
INSERT [dbo].[CarMark] ([Id], [Name]) VALUES (49, N'Lotus')
INSERT [dbo].[CarMark] ([Id], [Name]) VALUES (50, N'Marussia')
INSERT [dbo].[CarMark] ([Id], [Name]) VALUES (51, N'Maserati')
INSERT [dbo].[CarMark] ([Id], [Name]) VALUES (52, N'Maybach')
INSERT [dbo].[CarMark] ([Id], [Name]) VALUES (53, N'Mazda')
INSERT [dbo].[CarMark] ([Id], [Name]) VALUES (54, N'McLaren')
INSERT [dbo].[CarMark] ([Id], [Name]) VALUES (55, N'Mercedes')
INSERT [dbo].[CarMark] ([Id], [Name]) VALUES (56, N'Mercury')
INSERT [dbo].[CarMark] ([Id], [Name]) VALUES (57, N'MG')
INSERT [dbo].[CarMark] ([Id], [Name]) VALUES (58, N'Mini')
INSERT [dbo].[CarMark] ([Id], [Name]) VALUES (59, N'Mitsubishi')
INSERT [dbo].[CarMark] ([Id], [Name]) VALUES (60, N'Nissan')
INSERT [dbo].[CarMark] ([Id], [Name]) VALUES (61, N'Noble')
INSERT [dbo].[CarMark] ([Id], [Name]) VALUES (62, N'Opel')
INSERT [dbo].[CarMark] ([Id], [Name]) VALUES (63, N'Peugeot')
INSERT [dbo].[CarMark] ([Id], [Name]) VALUES (64, N'Plymouth')
INSERT [dbo].[CarMark] ([Id], [Name]) VALUES (65, N'Pontiac')
INSERT [dbo].[CarMark] ([Id], [Name]) VALUES (66, N'Porsche')
INSERT [dbo].[CarMark] ([Id], [Name]) VALUES (67, N'Ravon')
INSERT [dbo].[CarMark] ([Id], [Name]) VALUES (68, N'Renault')
INSERT [dbo].[CarMark] ([Id], [Name]) VALUES (69, N'Rolls-Royce')
INSERT [dbo].[CarMark] ([Id], [Name]) VALUES (70, N'Rover')
INSERT [dbo].[CarMark] ([Id], [Name]) VALUES (71, N'Saab')
INSERT [dbo].[CarMark] ([Id], [Name]) VALUES (72, N'Saturn')
INSERT [dbo].[CarMark] ([Id], [Name]) VALUES (73, N'Scion')
INSERT [dbo].[CarMark] ([Id], [Name]) VALUES (74, N'Seat')
INSERT [dbo].[CarMark] ([Id], [Name]) VALUES (75, N'Skoda')
INSERT [dbo].[CarMark] ([Id], [Name]) VALUES (76, N'Smart')
INSERT [dbo].[CarMark] ([Id], [Name]) VALUES (77, N'Ssang Yong')
INSERT [dbo].[CarMark] ([Id], [Name]) VALUES (78, N'Subaru')
INSERT [dbo].[CarMark] ([Id], [Name]) VALUES (79, N'Suzuki')
INSERT [dbo].[CarMark] ([Id], [Name]) VALUES (80, N'Tesla')
INSERT [dbo].[CarMark] ([Id], [Name]) VALUES (81, N'Toyota')
INSERT [dbo].[CarMark] ([Id], [Name]) VALUES (82, N'UAZ')
INSERT [dbo].[CarMark] ([Id], [Name]) VALUES (83, N'VAZ')
INSERT [dbo].[CarMark] ([Id], [Name]) VALUES (84, N'Volkswagen')
INSERT [dbo].[CarMark] ([Id], [Name]) VALUES (85, N'Volvo')
SET IDENTITY_INSERT [dbo].[CarMark] OFF
SET IDENTITY_INSERT [dbo].[CarModel] ON 

INSERT [dbo].[CarModel] ([Id], [Name], [StartYear], [CarMarkId]) VALUES (1, N'Silvia', N'1992', 60)
INSERT [dbo].[CarModel] ([Id], [Name], [StartYear], [CarMarkId]) VALUES (2, N'Impreza 22B', N'1993', 78)
INSERT [dbo].[CarModel] ([Id], [Name], [StartYear], [CarMarkId]) VALUES (5, N'X-TRAIL', N'2002', 60)
INSERT [dbo].[CarModel] ([Id], [Name], [StartYear], [CarMarkId]) VALUES (6, N'Giulia Super', N'2019', 2)
INSERT [dbo].[CarModel] ([Id], [Name], [StartYear], [CarMarkId]) VALUES (9, N'Alfa 6 2.5 Turbo Diesel', N'1985', 2)
INSERT [dbo].[CarModel] ([Id], [Name], [StartYear], [CarMarkId]) VALUES (10, N'A4', N'2019', 4)
INSERT [dbo].[CarModel] ([Id], [Name], [StartYear], [CarMarkId]) VALUES (11, N'Q8', N'2020', 4)
INSERT [dbo].[CarModel] ([Id], [Name], [StartYear], [CarMarkId]) VALUES (12, N'R8', N'2020', 4)
INSERT [dbo].[CarModel] ([Id], [Name], [StartYear], [CarMarkId]) VALUES (13, N'RS5', N'2020', 4)
INSERT [dbo].[CarModel] ([Id], [Name], [StartYear], [CarMarkId]) VALUES (15, N'750Li ', N'2008', 6)
INSERT [dbo].[CarModel] ([Id], [Name], [StartYear], [CarMarkId]) VALUES (16, N'M5 (E39)', N'2001', 6)
INSERT [dbo].[CarModel] ([Id], [Name], [StartYear], [CarMarkId]) VALUES (17, N'M8 Competition Coupe (F92)', N'2020', 6)
INSERT [dbo].[CarModel] ([Id], [Name], [StartYear], [CarMarkId]) VALUES (18, N'X4 M Competition (F98)', N'2020', 6)
INSERT [dbo].[CarModel] ([Id], [Name], [StartYear], [CarMarkId]) VALUES (19, N'545e xDrive M Sport', N'2020', 6)
INSERT [dbo].[CarModel] ([Id], [Name], [StartYear], [CarMarkId]) VALUES (20, N'Escalade', N'2020', 11)
INSERT [dbo].[CarModel] ([Id], [Name], [StartYear], [CarMarkId]) VALUES (21, N'CT6 Platinum', N'2020', 11)
INSERT [dbo].[CarModel] ([Id], [Name], [StartYear], [CarMarkId]) VALUES (22, N'XT6', N'2020', 11)
INSERT [dbo].[CarModel] ([Id], [Name], [StartYear], [CarMarkId]) VALUES (23, N'e-SpaceTourer', N'2020', 16)
INSERT [dbo].[CarModel] ([Id], [Name], [StartYear], [CarMarkId]) VALUES (24, N'C4', N'2020', 16)
INSERT [dbo].[CarModel] ([Id], [Name], [StartYear], [CarMarkId]) VALUES (25, N'C3L', N'2020', 16)
INSERT [dbo].[CarModel] ([Id], [Name], [StartYear], [CarMarkId]) VALUES (26, N'NSX-R ', N'1993', 34)
INSERT [dbo].[CarModel] ([Id], [Name], [StartYear], [CarMarkId]) VALUES (27, N'CR-V Sport Turbo', N'2020', 34)
INSERT [dbo].[CarModel] ([Id], [Name], [StartYear], [CarMarkId]) VALUES (28, N'S2000', N'2009', 34)
INSERT [dbo].[CarModel] ([Id], [Name], [StartYear], [CarMarkId]) VALUES (29, N'Civic Type R', N'2020', 34)
INSERT [dbo].[CarModel] ([Id], [Name], [StartYear], [CarMarkId]) VALUES (30, N'Soul', N'2020', 42)
INSERT [dbo].[CarModel] ([Id], [Name], [StartYear], [CarMarkId]) VALUES (31, N'K5', N'2020', 42)
INSERT [dbo].[CarModel] ([Id], [Name], [StartYear], [CarMarkId]) VALUES (32, N'Sportage', N'2019', 42)
INSERT [dbo].[CarModel] ([Id], [Name], [StartYear], [CarMarkId]) VALUES (33, N'GT Roadster (R190)', N'2020', 55)
INSERT [dbo].[CarModel] ([Id], [Name], [StartYear], [CarMarkId]) VALUES (34, N'G350', N'2020', 55)
INSERT [dbo].[CarModel] ([Id], [Name], [StartYear], [CarMarkId]) VALUES (35, N'GT (R190)', N'2020', 55)
INSERT [dbo].[CarModel] ([Id], [Name], [StartYear], [CarMarkId]) VALUES (36, N'190 E Evolution II', N'1990', 55)
INSERT [dbo].[CarModel] ([Id], [Name], [StartYear], [CarMarkId]) VALUES (37, N'Miata ', N'1993', 53)
INSERT [dbo].[CarModel] ([Id], [Name], [StartYear], [CarMarkId]) VALUES (38, N'MX-5 R-Sport', N'2020', 53)
INSERT [dbo].[CarModel] ([Id], [Name], [StartYear], [CarMarkId]) VALUES (39, N'RX-7 (FD)', N'1991', 53)
INSERT [dbo].[CarModel] ([Id], [Name], [StartYear], [CarMarkId]) VALUES (40, N'RX-7 Savanna', N'1980', 53)
INSERT [dbo].[CarModel] ([Id], [Name], [StartYear], [CarMarkId]) VALUES (41, N'Alphard', N'2019', 81)
INSERT [dbo].[CarModel] ([Id], [Name], [StartYear], [CarMarkId]) VALUES (42, N'Camry C35', N'2019', 81)
INSERT [dbo].[CarModel] ([Id], [Name], [StartYear], [CarMarkId]) VALUES (43, N'Corolla Verso', N'2001', 81)
INSERT [dbo].[CarModel] ([Id], [Name], [StartYear], [CarMarkId]) VALUES (44, N'XC90', N'2015', 85)
INSERT [dbo].[CarModel] ([Id], [Name], [StartYear], [CarMarkId]) VALUES (45, N'S60 T4', N'2019', 85)
INSERT [dbo].[CarModel] ([Id], [Name], [StartYear], [CarMarkId]) VALUES (46, N'V60 T8 Polestar', N'2019', 85)
SET IDENTITY_INSERT [dbo].[CarModel] OFF
SET IDENTITY_INSERT [dbo].[Client] ON 

INSERT [dbo].[Client] ([Id], [Name], [Surname], [GenderCode], [Phone], [Email], [LastServiceId], [LastVisit]) VALUES (1, N'Chase', N'Anderson', N'M', N'79073400146', N'oooo@outlook.com', 2, CAST(N'2011-07-25' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [Surname], [GenderCode], [Phone], [Email], [LastServiceId], [LastVisit]) VALUES (2, N'Jackson', N'Ward', N'M', N'74775861821', N'hr6zdl@yandex.ru', 3, CAST(N'2019-08-04' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [Surname], [GenderCode], [Phone], [Email], [LastServiceId], [LastVisit]) VALUES (3, N'Justin', N'Lewis', N'F', N'78615047218', N'kaft93x@outlook.com', 4, CAST(N'2010-06-23' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [Surname], [GenderCode], [Phone], [Email], [LastServiceId], [LastVisit]) VALUES (4, N'Aizen', N'Gonzalez', N'F', N'74264689464', N'dcu@yandex.ru', 3, CAST(N'2021-05-13' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [Surname], [GenderCode], [Phone], [Email], [LastServiceId], [LastVisit]) VALUES (5, N'Mason', N'Garcia', N'M', N'71675489984', N'19dn@outlook.com', 3, CAST(N'2016-08-25' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [Surname], [GenderCode], [Phone], [Email], [LastServiceId], [LastVisit]) VALUES (6, N'Miguel', N'Flores', N'F', N'75549903072', N'pa5h@mail.ru', 2, CAST(N'2012-08-10' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [Surname], [GenderCode], [Phone], [Email], [LastServiceId], [LastVisit]) VALUES (7, N'Wyatt', N'Scott', N'M', N'71944069734', N'281av0@gmail.com', 6, CAST(N'2019-10-24' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [Surname], [GenderCode], [Phone], [Email], [LastServiceId], [LastVisit]) VALUES (8, N'Nicholas', N'Gonzalez', N'M', N'71083498489', N'8edmfh@outlook.com', 2, CAST(N'2012-05-19' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [Surname], [GenderCode], [Phone], [Email], [LastServiceId], [LastVisit]) VALUES (9, N'Daniel', N'Lee', N'M', N'79603234922', N'sfn13i@mail.ru', 6, CAST(N'2016-05-07' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [Surname], [GenderCode], [Phone], [Email], [LastServiceId], [LastVisit]) VALUES (10, N'Noah', N'Diaz', N'M', N'77426405640', N'g0orc3x1@outlook.com', 8, CAST(N'2012-06-29' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [Surname], [GenderCode], [Phone], [Email], [LastServiceId], [LastVisit]) VALUES (11, N'Chase', N'Davis', N'M', N'72442383263', N'rv7bp@gmail.com', 6, CAST(N'2014-07-11' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [Surname], [GenderCode], [Phone], [Email], [LastServiceId], [LastVisit]) VALUES (12, N'Brandon', N'Green', N'M', N'76199177594', N'93@outlook.com', 11, CAST(N'2021-05-13' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [Surname], [GenderCode], [Phone], [Email], [LastServiceId], [LastVisit]) VALUES (13, N'Christian', N'Butler', N'M', N'76392468697', N'er@gmail.com', 2, CAST(N'2020-06-29' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [Surname], [GenderCode], [Phone], [Email], [LastServiceId], [LastVisit]) VALUES (14, N'Elijah', N'Carter', N'M', N'72930283461', N'o0my@gmail.com', 1, CAST(N'2015-04-13' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [Surname], [GenderCode], [Phone], [Email], [LastServiceId], [LastVisit]) VALUES (15, N'Logan', N'Reed', N'M', N'75157959596', N'715qy08@gmail.com', 5, CAST(N'2013-09-10' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [Surname], [GenderCode], [Phone], [Email], [LastServiceId], [LastVisit]) VALUES (16, N'David', N'Coleman', N'M', N'76256789792', N'vubx0t@mail.ru', 2, CAST(N'2010-07-20' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [Surname], [GenderCode], [Phone], [Email], [LastServiceId], [LastVisit]) VALUES (17, N'Diego', N'Butler', N'M', N'77287093572', N'wnhborq@outlook.com', 5, CAST(N'2019-09-14' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [Surname], [GenderCode], [Phone], [Email], [LastServiceId], [LastVisit]) VALUES (18, N'Noah', N'Johnson', N'M', N'76833595081', N'gq@yandex.ru', 7, CAST(N'2013-06-16' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [Surname], [GenderCode], [Phone], [Email], [LastServiceId], [LastVisit]) VALUES (19, N'Ashton', N'Moore', N'F', N'77156192340', N'ic0pu@outlook.com', 5, CAST(N'2017-10-09' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [Surname], [GenderCode], [Phone], [Email], [LastServiceId], [LastVisit]) VALUES (20, N'Steven', N'Hughes', N'M', N'75067360796', N'o7khr@yandex.ru', 1, CAST(N'2011-06-06' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [Surname], [GenderCode], [Phone], [Email], [LastServiceId], [LastVisit]) VALUES (21, N'Wyatt', N'Ross', N'M', N'75652092294', N'2shlaq@outlook.com', 5, CAST(N'2020-04-26' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [Surname], [GenderCode], [Phone], [Email], [LastServiceId], [LastVisit]) VALUES (22, N'Timothy', N'Torres', N'M', N'78848119570', N'cdbw@yandex.ru', 6, CAST(N'2016-12-25' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [Surname], [GenderCode], [Phone], [Email], [LastServiceId], [LastVisit]) VALUES (23, N'Noah', N'Parker', N'M', N'76913897506', N'wrts90puk@yandex.ru', 10, CAST(N'2021-05-13' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [Surname], [GenderCode], [Phone], [Email], [LastServiceId], [LastVisit]) VALUES (24, N'Eric', N'Bell', N'M', N'72997720531', N'yxunv@gmail.com', 3, CAST(N'2016-04-21' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [Surname], [GenderCode], [Phone], [Email], [LastServiceId], [LastVisit]) VALUES (25, N'Richard', N'Reed', N'M', N'79515075555', N'7y@yandex.ru', 3, CAST(N'2014-12-30' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [Surname], [GenderCode], [Phone], [Email], [LastServiceId], [LastVisit]) VALUES (26, N'Nathaniel', N'Diaz', N'F', N'79982740522', N'6@mail.ru', 9, CAST(N'2021-05-13' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [Surname], [GenderCode], [Phone], [Email], [LastServiceId], [LastVisit]) VALUES (27, N'Luke', N'Allen', N'M', N'75724762960', N'k8sjebg1y@mail.ru', 8, CAST(N'2017-04-15' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [Surname], [GenderCode], [Phone], [Email], [LastServiceId], [LastVisit]) VALUES (28, N'Alex', N'Ross', N'M', N'71474750025', N'jirbold@gmail.com', 4, CAST(N'2020-10-23' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [Surname], [GenderCode], [Phone], [Email], [LastServiceId], [LastVisit]) VALUES (29, N'Diego', N'Barnes', N'M', N'77235173859', N'u7yhwf1vb@mail.ru', 7, CAST(N'2011-07-20' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [Surname], [GenderCode], [Phone], [Email], [LastServiceId], [LastVisit]) VALUES (30, N'Adrian', N'Wright', N'M', N'71172258724', N'f@outlook.com', 3, CAST(N'2012-05-05' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [Surname], [GenderCode], [Phone], [Email], [LastServiceId], [LastVisit]) VALUES (31, N'Anthony', N'Martin', N'M', N'76249584392', N'gjkhp@mail.ru', 2, CAST(N'2012-06-19' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [Surname], [GenderCode], [Phone], [Email], [LastServiceId], [LastVisit]) VALUES (32, N'Tyler', N'Phillips', N'M', N'78859115987', N'wyalkxfde@gmail.com', 2, CAST(N'2011-11-14' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [Surname], [GenderCode], [Phone], [Email], [LastServiceId], [LastVisit]) VALUES (33, N'Jaden', N'Lee', N'M', N'78700783188', N'f245n@outlook.com', 2, CAST(N'2017-07-13' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [Surname], [GenderCode], [Phone], [Email], [LastServiceId], [LastVisit]) VALUES (34, N'Jake', N'Murphy', N'M', N'72967457868', N'w@outlook.com', 4, CAST(N'2020-04-18' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [Surname], [GenderCode], [Phone], [Email], [LastServiceId], [LastVisit]) VALUES (35, N'Isaac', N'Stewart', N'M', N'76187787385', N'js3kyopz@mail.ru', 8, CAST(N'2013-10-30' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [Surname], [GenderCode], [Phone], [Email], [LastServiceId], [LastVisit]) VALUES (36, N'Ryan', N'Lewis', N'F', N'77073269144', N'o@outlook.com', 6, CAST(N'2017-03-03' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [Surname], [GenderCode], [Phone], [Email], [LastServiceId], [LastVisit]) VALUES (37, N'Aaron', N'Patterson', N'M', N'71239967875', N'uzfd@mail.ru', 5, CAST(N'2016-09-06' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [Surname], [GenderCode], [Phone], [Email], [LastServiceId], [LastVisit]) VALUES (38, N'Eric', N'Walker', N'M', N'78405505238', N'g@mail.ru', 3, CAST(N'2018-12-29' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [Surname], [GenderCode], [Phone], [Email], [LastServiceId], [LastVisit]) VALUES (39, N'Tyler', N'Butler', N'M', N'73038500570', N'dvjf0@gmail.com', 3, CAST(N'2018-05-12' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [Surname], [GenderCode], [Phone], [Email], [LastServiceId], [LastVisit]) VALUES (40, N'Jack', N'Williams', N'M', N'79045202267', N'd2mc@outlook.com', 7, CAST(N'2016-12-11' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [Surname], [GenderCode], [Phone], [Email], [LastServiceId], [LastVisit]) VALUES (41, N'Landon', N'Howard', N'M', N'77090388899', N'06lk@mail.ru', 5, CAST(N'2020-07-21' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [Surname], [GenderCode], [Phone], [Email], [LastServiceId], [LastVisit]) VALUES (42, N'Aiden', N'Flores', N'M', N'75243307509', N'emhzysf2@yandex.ru', 8, CAST(N'2017-02-24' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [Surname], [GenderCode], [Phone], [Email], [LastServiceId], [LastVisit]) VALUES (43, N'Jayden', N'Brown', N'M', N'76628995009', N'd1w28lkg@yandex.ru', 7, CAST(N'2021-05-13' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [Surname], [GenderCode], [Phone], [Email], [LastServiceId], [LastVisit]) VALUES (44, N'Tyler', N'Washington', N'M', N'79716796239', N't93@mail.ru', 4, CAST(N'2017-10-24' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [Surname], [GenderCode], [Phone], [Email], [LastServiceId], [LastVisit]) VALUES (45, N'Lucas', N'Alexander', N'M', N'73946693689', N't3i@outlook.com', 3, CAST(N'2017-07-07' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [Surname], [GenderCode], [Phone], [Email], [LastServiceId], [LastVisit]) VALUES (46, N'Jeremiah', N'Wright', N'M', N'78676482252', N't6ro3@gmail.com', 1, CAST(N'2012-02-01' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [Surname], [GenderCode], [Phone], [Email], [LastServiceId], [LastVisit]) VALUES (47, N'Isaiah', N'Howard', N'M', N'78963693362', N'1zqnk0y7@yandex.ru', 1, CAST(N'2010-06-24' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [Surname], [GenderCode], [Phone], [Email], [LastServiceId], [LastVisit]) VALUES (48, N'Diego', N'Washington', N'F', N'71504670129', N'768ptl4nv@gmail.com', 5, CAST(N'2010-03-13' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [Surname], [GenderCode], [Phone], [Email], [LastServiceId], [LastVisit]) VALUES (49, N'Zachary', N'Jackson', N'M', N'75461231974', N'bzq3yh2c1@mail.ru', 1, CAST(N'2017-07-29' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [Surname], [GenderCode], [Phone], [Email], [LastServiceId], [LastVisit]) VALUES (50, N'Samuel', N'Coleman', N'M', N'77930611616', N'78k3dvwx@outlook.com', 3, CAST(N'2021-01-03' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [Surname], [GenderCode], [Phone], [Email], [LastServiceId], [LastVisit]) VALUES (1058, N'Ed', N'Edick', N'M', N'78945161515', N'rigtrtgu@gibjtgh.ru', 4, CAST(N'2021-05-13' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [Surname], [GenderCode], [Phone], [Email], [LastServiceId], [LastVisit]) VALUES (1059, N'Edick', N'Edffff', N'M', N'15156151551', N'kghtuj@girtg.ru', 3, CAST(N'2021-04-18' AS Date))
SET IDENTITY_INSERT [dbo].[Client] OFF
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([Id], [Name], [Surname], [GenderCode], [RoleId], [DateOfEmployment]) VALUES (1, N'Patrick', N'Bryant', N'M', 2, CAST(N'2015-02-13' AS Date))
INSERT [dbo].[Employee] ([Id], [Name], [Surname], [GenderCode], [RoleId], [DateOfEmployment]) VALUES (2, N'Diego', N'Perry', N'M', 2, CAST(N'2015-04-17' AS Date))
INSERT [dbo].[Employee] ([Id], [Name], [Surname], [GenderCode], [RoleId], [DateOfEmployment]) VALUES (3, N'Luke', N'Foster', N'M', 2, CAST(N'2016-04-20' AS Date))
INSERT [dbo].[Employee] ([Id], [Name], [Surname], [GenderCode], [RoleId], [DateOfEmployment]) VALUES (4, N'Kyle', N'Miller', N'M', 2, CAST(N'2015-07-28' AS Date))
INSERT [dbo].[Employee] ([Id], [Name], [Surname], [GenderCode], [RoleId], [DateOfEmployment]) VALUES (6, N'Lucas', N'Nelson', N'M', 2, CAST(N'2017-09-05' AS Date))
INSERT [dbo].[Employee] ([Id], [Name], [Surname], [GenderCode], [RoleId], [DateOfEmployment]) VALUES (7, N'Gabriel', N'King', N'M', 2, CAST(N'2017-12-14' AS Date))
INSERT [dbo].[Employee] ([Id], [Name], [Surname], [GenderCode], [RoleId], [DateOfEmployment]) VALUES (8, N'Aaron', N'Jones', N'M', 2, CAST(N'2019-06-14' AS Date))
INSERT [dbo].[Employee] ([Id], [Name], [Surname], [GenderCode], [RoleId], [DateOfEmployment]) VALUES (9, N'James', N'Baker', N'M', 1, CAST(N'2019-08-07' AS Date))
INSERT [dbo].[Employee] ([Id], [Name], [Surname], [GenderCode], [RoleId], [DateOfEmployment]) VALUES (10, N'Isaac', N'Brown', N'M', 1, CAST(N'2021-03-30' AS Date))
SET IDENTITY_INSERT [dbo].[Employee] OFF
INSERT [dbo].[Gender] ([Code], [Name]) VALUES (N'F', N'Female')
INSERT [dbo].[Gender] ([Code], [Name]) VALUES (N'M', N'Male')
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([Id], [EmployeeId], [ClientId], [ServiceId], [CarId], [CarPhotoPath], [StatusId], [CarColorId], [DateOfService]) VALUES (19, 2, 5, 4, 1, N'/Resources/OrderPhotoes/1637536985660736143.png', 3, 3, CAST(N'2021-04-11' AS Date))
INSERT [dbo].[Order] ([Id], [EmployeeId], [ClientId], [ServiceId], [CarId], [CarPhotoPath], [StatusId], [CarColorId], [DateOfService]) VALUES (25, 6, 4, 3, 37, N'/Resources/OrderPhotoes/637565318871935717.jpg', 2, 1, CAST(N'2021-05-13' AS Date))
INSERT [dbo].[Order] ([Id], [EmployeeId], [ClientId], [ServiceId], [CarId], [CarPhotoPath], [StatusId], [CarColorId], [DateOfService]) VALUES (26, 1, 12, 11, 36, N'/Resources/OrderPhotoes/637565320241239510.jpg', 3, 3, CAST(N'2021-05-13' AS Date))
INSERT [dbo].[Order] ([Id], [EmployeeId], [ClientId], [ServiceId], [CarId], [CarPhotoPath], [StatusId], [CarColorId], [DateOfService]) VALUES (27, 7, 26, 9, 46, N'/Resources/OrderPhotoes/637565345309366980.jpg', 1, 1, CAST(N'2021-05-13' AS Date))
INSERT [dbo].[Order] ([Id], [EmployeeId], [ClientId], [ServiceId], [CarId], [CarPhotoPath], [StatusId], [CarColorId], [DateOfService]) VALUES (28, 6, 43, 7, 34, N'/Resources/OrderPhotoes/637565323045171144.jpg', 2, 3, CAST(N'2021-05-13' AS Date))
INSERT [dbo].[Order] ([Id], [EmployeeId], [ClientId], [ServiceId], [CarId], [CarPhotoPath], [StatusId], [CarColorId], [DateOfService]) VALUES (29, 9, 23, 10, 2, N'/Resources/OrderPhotoes/637565323487649258.jpg', 4, 5, CAST(N'2021-05-13' AS Date))
SET IDENTITY_INSERT [dbo].[Order] OFF
SET IDENTITY_INSERT [dbo].[OrderStatus] ON 

INSERT [dbo].[OrderStatus] ([Id], [Name]) VALUES (1, N'In Progress')
INSERT [dbo].[OrderStatus] ([Id], [Name]) VALUES (2, N'In Queue ')
INSERT [dbo].[OrderStatus] ([Id], [Name]) VALUES (3, N'Ready')
INSERT [dbo].[OrderStatus] ([Id], [Name]) VALUES (4, N'Cancelled ')
SET IDENTITY_INSERT [dbo].[OrderStatus] OFF
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Id], [Name]) VALUES (1, N'Manager')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (2, N'Worker')
SET IDENTITY_INSERT [dbo].[Role] OFF
SET IDENTITY_INSERT [dbo].[Service] ON 

INSERT [dbo].[Service] ([Id], [Name], [ServiceTypeId], [Duration], [Cost], [Description]) VALUES (1, N'Full Basic Detail', 1, CAST(3.00 AS Decimal(5, 2)), CAST(159.00 AS Decimal(10, 2)), N'Interior: Carpet Shampoo & ExtractedSeat Shampoo & ExtractedLeather/Vinyl/Plastic—Cleaned and Conditioned Headliner Cleaned—Vents CleanedExterior: Vehicle Washed (Hand Wash Extra)Professional Wax applied with DA Orbital MachineWheel Wells DressedRims CleanedExterior Trim ConditionedTire Shine AppliedTire Pressure + Washer Fluid Checked and Added (Upon Request)')
INSERT [dbo].[Service] ([Id], [Name], [ServiceTypeId], [Duration], [Cost], [Description]) VALUES (2, N'Executive Detail', 1, CAST(5.00 AS Decimal(5, 2)), CAST(250.00 AS Decimal(10, 2)), N'Interior: Carpet Shampoo & ExtractedSeat Shampoo & ExtractedLeather/Vinyl/Plastic—Cleaned and ConditionedHeadliner Cleaned—Vents Cleaned—FragranceExterior: Vehicle Washed (Hand Wash Extra)Clay Bar the Paint ( Removes Industrial Fallout and contaminates on surface)Diamond Cut Compounded (to remove impurities and minor scratches)Meguiar’s Carnauba Wax applied with DA Orbital Machine (3-6 Months)Wheel Wells DressedRims CleanedExterior Trim ConditioningTire Shine Applied')
INSERT [dbo].[Service] ([Id], [Name], [ServiceTypeId], [Duration], [Cost], [Description]) VALUES (3, N'ELITE Detail', 1, CAST(6.00 AS Decimal(5, 2)), CAST(340.00 AS Decimal(10, 2)), N'INTERIOR: Carpets— Carpet Shampoo & ExtractedSeats—Seat Shampoo & ExtractedLeather/Vinyl/Plastic—CLEANED and ConditionedHeadliner CLEANEDEXTERIOR: Vehicle WashedClay Bar Paint —(Removes Industrial Fallout and contaminationHigh Speed—(Clear Coat Scratch Removal + Oxidation Removal)Diamond Cut Compounded —(removes impurities minor scratches) Meguiar’s Synthetic Sealant applied with DA Orbital Machine (6-12 Months +)Wheel Wells dressedRims CleanedExterior Trim Dressed')
INSERT [dbo].[Service] ([Id], [Name], [ServiceTypeId], [Duration], [Cost], [Description]) VALUES (4, N'Compound and Clay Bar Package', 2, CAST(3.00 AS Decimal(5, 2)), CAST(167.00 AS Decimal(10, 2)), N'Exterior Wash of VehicleClay Bar Entire Vehicle to remove Industrial Fall out and imperfectionsD/A Compound vehicleD/A Apply Carnuaba Wax')
INSERT [dbo].[Service] ([Id], [Name], [ServiceTypeId], [Duration], [Cost], [Description]) VALUES (5, N'High Speed Compound Package', 2, CAST(5.00 AS Decimal(5, 2)), CAST(250.00 AS Decimal(10, 2)), N'To fix heavily oxidized paint and light scratches from paintWash Exterior of VehicleHigh Speed Buff VehicleD/A Compound to remove any swirlsD/A Carnuaba WaxTire Shine')
INSERT [dbo].[Service] ([Id], [Name], [ServiceTypeId], [Duration], [Cost], [Description]) VALUES (6, N'Interior Detail', 3, CAST(1.50 AS Decimal(5, 2)), CAST(117.00 AS Decimal(10, 2)), N'Carpets— Carpet Shampoo & ExtractedSeats—Seat Shampoo & ExtractedLeather/Vinyl/Plastic—DEEP CLEANED and ConditionedHeadliner CLEANED—Vents Cleaned—')
INSERT [dbo].[Service] ([Id], [Name], [ServiceTypeId], [Duration], [Cost], [Description]) VALUES (7, N'Hand Wash (exterior only)', 4, CAST(0.83 AS Decimal(5, 2)), CAST(41.00 AS Decimal(10, 2)), N'includes spray wax and tire shine')
INSERT [dbo].[Service] ([Id], [Name], [ServiceTypeId], [Duration], [Cost], [Description]) VALUES (8, N'Ceramic Inspection & Quote', 5, CAST(0.25 AS Decimal(5, 2)), CAST(0.00 AS Decimal(10, 2)), N'We would love to install Caramic Pro on your vehicle, but we need to meet with you first to inspect vehicle and answer any questions you may have. We want to make sure that you know as much as possible about the product and our company. After we meet, we will be able to provide you with pricing on all of our packages.')
INSERT [dbo].[Service] ([Id], [Name], [ServiceTypeId], [Duration], [Cost], [Description]) VALUES (9, N'Ceramic Aftercare Exterior Wash', 5, CAST(1.00 AS Decimal(5, 2)), CAST(25.00 AS Decimal(10, 2)), N'After installation of Ceramic Pro, We perform delicate washing of your vehicle. We apply a special ceramic coating wash soap with a foam cannon. Then we wash with microfiber mitt. After rinsing, we use air to blow off the majority of water, followed by hand drying with fresh microfiber towel. Tire shine included.')
INSERT [dbo].[Service] ([Id], [Name], [ServiceTypeId], [Duration], [Cost], [Description]) VALUES (10, N'WRAP JOB QUOTE', 6, CAST(0.50 AS Decimal(5, 2)), CAST(0.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Service] ([Id], [Name], [ServiceTypeId], [Duration], [Cost], [Description]) VALUES (11, N'XPEL Paint Protect Film Quote ', 7, CAST(0.25 AS Decimal(5, 2)), CAST(50.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Service] ([Id], [Name], [ServiceTypeId], [Duration], [Cost], [Description]) VALUES (12, N'XPEL Full Vehicle Install', 7, CAST(9.00 AS Decimal(5, 2)), CAST(150.00 AS Decimal(10, 2)), NULL)
SET IDENTITY_INSERT [dbo].[Service] OFF
SET IDENTITY_INSERT [dbo].[ServiceType] ON 

INSERT [dbo].[ServiceType] ([Id], [Name]) VALUES (1, N'Full Vehicle Details')
INSERT [dbo].[ServiceType] ([Id], [Name]) VALUES (2, N'Exterior Detail')
INSERT [dbo].[ServiceType] ([Id], [Name]) VALUES (3, N'Interior Detail')
INSERT [dbo].[ServiceType] ([Id], [Name]) VALUES (4, N'Hand Wash')
INSERT [dbo].[ServiceType] ([Id], [Name]) VALUES (5, N'Ceramic Coatings and Maintainence')
INSERT [dbo].[ServiceType] ([Id], [Name]) VALUES (6, N'Vinyl Wrapping')
INSERT [dbo].[ServiceType] ([Id], [Name]) VALUES (7, N'XPEL Paint Protection Film')
SET IDENTITY_INSERT [dbo].[ServiceType] OFF
ALTER TABLE [dbo].[CarModel]  WITH CHECK ADD  CONSTRAINT [FK_CarModel_CarMark] FOREIGN KEY([CarMarkId])
REFERENCES [dbo].[CarMark] ([Id])
GO
ALTER TABLE [dbo].[CarModel] CHECK CONSTRAINT [FK_CarModel_CarMark]
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_Gender] FOREIGN KEY([GenderCode])
REFERENCES [dbo].[Gender] ([Code])
GO
ALTER TABLE [dbo].[Client] CHECK CONSTRAINT [FK_Client_Gender]
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_Service] FOREIGN KEY([LastServiceId])
REFERENCES [dbo].[Service] ([Id])
GO
ALTER TABLE [dbo].[Client] CHECK CONSTRAINT [FK_Client_Service]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Gender] FOREIGN KEY([GenderCode])
REFERENCES [dbo].[Gender] ([Code])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Gender]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Role]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_CarColor] FOREIGN KEY([CarColorId])
REFERENCES [dbo].[CarColor] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_CarColor]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_CarModel] FOREIGN KEY([CarId])
REFERENCES [dbo].[CarModel] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_CarModel]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Client] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Client] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Client]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Employee] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Employee]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_OrderStatus] FOREIGN KEY([StatusId])
REFERENCES [dbo].[OrderStatus] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_OrderStatus]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Service] FOREIGN KEY([ServiceId])
REFERENCES [dbo].[Service] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Service]
GO
ALTER TABLE [dbo].[Service]  WITH CHECK ADD  CONSTRAINT [FK_Service_ServiceType] FOREIGN KEY([ServiceTypeId])
REFERENCES [dbo].[ServiceType] ([Id])
GO
ALTER TABLE [dbo].[Service] CHECK CONSTRAINT [FK_Service_ServiceType]
GO
USE [master]
GO
ALTER DATABASE [DetailingCenter] SET  READ_WRITE 
GO
