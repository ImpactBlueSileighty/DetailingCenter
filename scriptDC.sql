USE [DetailingCenter]
GO
/****** Object:  Table [dbo].[CarClass]    Script Date: 15.03.2021 0:17:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarClass](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Coefficient] [decimal](3, 2) NULL,
 CONSTRAINT [PK_CarClass] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CarMark]    Script Date: 15.03.2021 0:17:08 ******/
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
/****** Object:  Table [dbo].[CarModel]    Script Date: 15.03.2021 0:17:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarModel](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[StartYear] [nvarchar](4) NOT NULL,
	[CarMarkId] [int] NOT NULL,
	[ClassId] [int] NOT NULL,
 CONSTRAINT [PK_CarModel] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 15.03.2021 0:17:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[SurName] [nvarchar](50) NOT NULL,
	[GenderCode] [nvarchar](1) NOT NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[LastService] [int] NOT NULL,
	[LastVisit] [date] NOT NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 15.03.2021 0:17:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[SurName] [nvarchar](50) NOT NULL,
	[GenderCode] [nvarchar](1) NOT NULL,
	[DateOfEmployment] [date] NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 15.03.2021 0:17:08 ******/
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
/****** Object:  Table [dbo].[Order]    Script Date: 15.03.2021 0:17:08 ******/
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
	[CarColor] [int] NOT NULL,
	[DateOfService] [datetime] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 15.03.2021 0:17:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ServiceTypeId] [int] NOT NULL,
	[Duration] [decimal](5, 2) NOT NULL,
	[Cost] [decimal](10, 2) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Service_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceType]    Script Date: 15.03.2021 0:17:08 ******/
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
SET IDENTITY_INSERT [dbo].[CarClass] ON 

INSERT [dbo].[CarClass] ([Id], [Name], [Coefficient]) VALUES (1, N'Class 1', NULL)
INSERT [dbo].[CarClass] ([Id], [Name], [Coefficient]) VALUES (2, N'Class 2', NULL)
INSERT [dbo].[CarClass] ([Id], [Name], [Coefficient]) VALUES (3, N'Class 3', NULL)
INSERT [dbo].[CarClass] ([Id], [Name], [Coefficient]) VALUES (4, N'Class 4', NULL)
SET IDENTITY_INSERT [dbo].[CarClass] OFF
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

INSERT [dbo].[CarModel] ([Id], [Name], [StartYear], [CarMarkId], [ClassId]) VALUES (1, N'Silvia', N'1992', 60, 1)
SET IDENTITY_INSERT [dbo].[CarModel] OFF
SET IDENTITY_INSERT [dbo].[Client] ON 

INSERT [dbo].[Client] ([Id], [Name], [SurName], [GenderCode], [Phone], [Email], [LastService], [LastVisit]) VALUES (1, N'Chase', N'Anderson', N'M', N'+7(407)340-01-46', N'o@outlook.com', 2, CAST(N'2011-07-25' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [SurName], [GenderCode], [Phone], [Email], [LastService], [LastVisit]) VALUES (2, N'Jackson', N'Ward', N'M', N'+7(40)064-56-32', N'hr6zdl@yandex.ru', 3, CAST(N'2019-08-04' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [SurName], [GenderCode], [Phone], [Email], [LastService], [LastVisit]) VALUES (3, N'Justin', N'Lewis', N'F', N'+7(79)336-69-17', N'kaft93x@outlook.com', 4, CAST(N'2010-06-23' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [SurName], [GenderCode], [Phone], [Email], [LastService], [LastVisit]) VALUES (4, N'Aiden', N'Gonzalez', N'M', N'+7(9019)248-28-80', N'dcu@yandex.ru', 1, CAST(N'2013-01-02' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [SurName], [GenderCode], [Phone], [Email], [LastService], [LastVisit]) VALUES (5, N'Mason', N'Garcia', N'M', N'+7(5551)725-79-80', N'19dn@outlook.com', 3, CAST(N'2016-08-25' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [SurName], [GenderCode], [Phone], [Email], [LastService], [LastVisit]) VALUES (6, N'Miguel', N'Flores', N'F', N'+7(597)673-86-51', N'pa5h@mail.ru', 2, CAST(N'2012-08-10' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [SurName], [GenderCode], [Phone], [Email], [LastService], [LastVisit]) VALUES (7, N'Wyatt', N'Scott', N'M', N'+7(34)259-70-49', N'281av0@gmail.com', 6, CAST(N'2019-10-24' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [SurName], [GenderCode], [Phone], [Email], [LastService], [LastVisit]) VALUES (8, N'Nicholas', N'Gonzalez', N'M', N'+7(1158)388-98-51', N'8edmfh@outlook.com', 2, CAST(N'2012-05-19' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [SurName], [GenderCode], [Phone], [Email], [LastService], [LastVisit]) VALUES (9, N'Daniel', N'Lee', N'M', N'+7(243)050-39-05', N'sfn13i@mail.ru', 6, CAST(N'2016-05-07' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [SurName], [GenderCode], [Phone], [Email], [LastService], [LastVisit]) VALUES (10, N'Noah', N'Diaz', N'F', N'+7(935)345-49-36', N'g0orc3x1@outlook.com', 8, CAST(N'2012-06-29' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [SurName], [GenderCode], [Phone], [Email], [LastService], [LastVisit]) VALUES (11, N'Chase', N'Davis', N'M', N'+7(24)003-53-89', N'rv7bp@gmail.com', 6, CAST(N'2014-07-11' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [SurName], [GenderCode], [Phone], [Email], [LastService], [LastVisit]) VALUES (12, N'Brandon', N'Green', N'M', N'+7(84)244-89-41', N'93@outlook.com', 3, CAST(N'2019-04-11' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [SurName], [GenderCode], [Phone], [Email], [LastService], [LastVisit]) VALUES (13, N'Christian', N'Butler', N'M', N'+7(748)976-60-80', N'er@gmail.com', 2, CAST(N'2020-06-29' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [SurName], [GenderCode], [Phone], [Email], [LastService], [LastVisit]) VALUES (14, N'Elijah', N'Carter', N'M', N'+7(91)545-47-49', N'o0my@gmail.com', 1, CAST(N'2015-04-13' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [SurName], [GenderCode], [Phone], [Email], [LastService], [LastVisit]) VALUES (15, N'Logan', N'Reed', N'M', N'+7(63)529-67-71', N'715qy08@gmail.com', 5, CAST(N'2013-09-10' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [SurName], [GenderCode], [Phone], [Email], [LastService], [LastVisit]) VALUES (16, N'David', N'Coleman', N'M', N'+7(013)745-87-49', N'vubx0t@mail.ru', 2, CAST(N'2010-07-20' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [SurName], [GenderCode], [Phone], [Email], [LastService], [LastVisit]) VALUES (17, N'Diego', N'Butler', N'M', N'+7(940)153-22-77', N'wnhborq@outlook.com', 5, CAST(N'2019-09-14' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [SurName], [GenderCode], [Phone], [Email], [LastService], [LastVisit]) VALUES (18, N'Noah', N'Johnson', N'M', N'+7(0747)534-76-15', N'gq@yandex.ru', 7, CAST(N'2013-06-16' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [SurName], [GenderCode], [Phone], [Email], [LastService], [LastVisit]) VALUES (19, N'Ashton', N'Moore', N'F', N'+7(64)143-18-45', N'ic0pu@outlook.com', 5, CAST(N'2017-10-09' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [SurName], [GenderCode], [Phone], [Email], [LastService], [LastVisit]) VALUES (20, N'Steven', N'Hughes', N'M', N'+7(99)160-97-73', N'o7khr@yandex.ru', 1, CAST(N'2011-06-06' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [SurName], [GenderCode], [Phone], [Email], [LastService], [LastVisit]) VALUES (21, N'Wyatt', N'Ross', N'M', N'+7(297)648-25-56', N'2shlaq@outlook.com', 5, CAST(N'2020-04-26' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [SurName], [GenderCode], [Phone], [Email], [LastService], [LastVisit]) VALUES (22, N'Timothy', N'Torres', N'M', N'+7(717)914-01-32', N'cdbw@yandex.ru', 6, CAST(N'2016-12-25' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [SurName], [GenderCode], [Phone], [Email], [LastService], [LastVisit]) VALUES (23, N'Noah', N'Parker', N'M', N'+7(03)715-23-49', N'wrts90puk@yandex.ru', 2, CAST(N'2019-02-17' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [SurName], [GenderCode], [Phone], [Email], [LastService], [LastVisit]) VALUES (24, N'Eric', N'Bell', N'M', N'+7(14)395-03-31', N'yxunv@gmail.com', 3, CAST(N'2016-04-21' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [SurName], [GenderCode], [Phone], [Email], [LastService], [LastVisit]) VALUES (25, N'Richard', N'Reed', N'M', N'+7(11)514-94-69', N'7y@yandex.ru', 3, CAST(N'2014-12-30' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [SurName], [GenderCode], [Phone], [Email], [LastService], [LastVisit]) VALUES (26, N'Nathaniel', N'Diaz', N'F', N'+7(8694)388-40-34', N'6@mail.ru', 8, CAST(N'2020-08-07' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [SurName], [GenderCode], [Phone], [Email], [LastService], [LastVisit]) VALUES (27, N'Luke', N'Allen', N'M', N'+7(204)367-48-00', N'k8sjebg1y@mail.ru', 8, CAST(N'2017-04-15' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [SurName], [GenderCode], [Phone], [Email], [LastService], [LastVisit]) VALUES (28, N'Alex', N'Ross', N'M', N'+7(49)182-05-14', N'jirbold@gmail.com', 4, CAST(N'2020-10-23' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [SurName], [GenderCode], [Phone], [Email], [LastService], [LastVisit]) VALUES (29, N'Diego', N'Barnes', N'M', N'+7(533)463-89-33', N'u7yhwf1vb@mail.ru', 7, CAST(N'2011-07-20' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [SurName], [GenderCode], [Phone], [Email], [LastService], [LastVisit]) VALUES (30, N'Adrian', N'Wright', N'M', N'+7(693)842-89-13', N'f@outlook.com', 3, CAST(N'2012-05-05' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [SurName], [GenderCode], [Phone], [Email], [LastService], [LastVisit]) VALUES (31, N'Anthony', N'Martin', N'M', N'+7(06)686-03-93', N'gjkhp@mail.ru', 2, CAST(N'2012-06-19' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [SurName], [GenderCode], [Phone], [Email], [LastService], [LastVisit]) VALUES (32, N'Tyler', N'Phillips', N'M', N'+7(40)290-55-75', N'wyalkxfde@gmail.com', 2, CAST(N'2011-11-14' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [SurName], [GenderCode], [Phone], [Email], [LastService], [LastVisit]) VALUES (33, N'Jaden', N'Lee', N'M', N'+7(8331)225-23-14', N'f245n@outlook.com', 2, CAST(N'2017-07-13' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [SurName], [GenderCode], [Phone], [Email], [LastService], [LastVisit]) VALUES (34, N'Jake', N'Murphy', N'M', N'+7(9003)454-42-64', N'w@outlook.com', 4, CAST(N'2020-04-18' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [SurName], [GenderCode], [Phone], [Email], [LastService], [LastVisit]) VALUES (35, N'Isaac', N'Stewart', N'M', N'+7(29)788-01-93', N'js3kyopz@mail.ru', 8, CAST(N'2013-10-30' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [SurName], [GenderCode], [Phone], [Email], [LastService], [LastVisit]) VALUES (36, N'Ryan', N'Lewis', N'F', N'+7(286)006-00-63', N'o@outlook.com', 6, CAST(N'2017-03-03' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [SurName], [GenderCode], [Phone], [Email], [LastService], [LastVisit]) VALUES (37, N'Aaron', N'Patterson', N'M', N'+7(19)512-03-49', N'uzfd@mail.ru', 5, CAST(N'2016-09-06' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [SurName], [GenderCode], [Phone], [Email], [LastService], [LastVisit]) VALUES (38, N'Eric', N'Walker', N'M', N'+7(17)281-52-34', N'g@mail.ru', 3, CAST(N'2018-12-29' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [SurName], [GenderCode], [Phone], [Email], [LastService], [LastVisit]) VALUES (39, N'Tyler', N'Butler', N'M', N'+7(0586)928-04-86', N'dvjf0@gmail.com', 3, CAST(N'2018-05-12' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [SurName], [GenderCode], [Phone], [Email], [LastService], [LastVisit]) VALUES (40, N'Jack', N'Williams', N'M', N'+7(99)239-55-77', N'd2mc@outlook.com', 7, CAST(N'2016-12-11' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [SurName], [GenderCode], [Phone], [Email], [LastService], [LastVisit]) VALUES (41, N'Landon', N'Howard', N'M', N'+7(6838)862-35-88', N'06lk@mail.ru', 5, CAST(N'2020-07-21' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [SurName], [GenderCode], [Phone], [Email], [LastService], [LastVisit]) VALUES (42, N'Aiden', N'Flores', N'M', N'+7(176)526-51-67', N'emhzysf2@yandex.ru', 8, CAST(N'2017-02-24' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [SurName], [GenderCode], [Phone], [Email], [LastService], [LastVisit]) VALUES (43, N'Jayden', N'Brown', N'M', N'+7(530)089-92-72', N'd1w28lkg@yandex.ru', 1, CAST(N'2017-04-22' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [SurName], [GenderCode], [Phone], [Email], [LastService], [LastVisit]) VALUES (44, N'Tyler', N'Washington', N'M', N'+7(44)932-55-01', N't93@mail.ru', 4, CAST(N'2017-10-24' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [SurName], [GenderCode], [Phone], [Email], [LastService], [LastVisit]) VALUES (45, N'Lucas', N'Alexander', N'M', N'+7(63)154-91-02', N't3i@outlook.com', 3, CAST(N'2017-07-07' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [SurName], [GenderCode], [Phone], [Email], [LastService], [LastVisit]) VALUES (46, N'Jeremiah', N'Wright', N'M', N'+7(33)232-05-34', N't6ro3@gmail.com', 1, CAST(N'2012-02-01' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [SurName], [GenderCode], [Phone], [Email], [LastService], [LastVisit]) VALUES (47, N'Isaiah', N'Howard', N'M', N'+7(7439)901-16-59', N'1zqnk0y7@yandex.ru', 1, CAST(N'2010-06-24' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [SurName], [GenderCode], [Phone], [Email], [LastService], [LastVisit]) VALUES (48, N'Diego', N'Washington', N'F', N'+7(0371)037-33-96', N'768ptl4nv@gmail.com', 5, CAST(N'2010-03-13' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [SurName], [GenderCode], [Phone], [Email], [LastService], [LastVisit]) VALUES (49, N'Zachary', N'Jackson', N'M', N'+7(019)169-56-94', N'bzq3yh2c1@mail.ru', 1, CAST(N'2017-07-29' AS Date))
INSERT [dbo].[Client] ([Id], [Name], [SurName], [GenderCode], [Phone], [Email], [LastService], [LastVisit]) VALUES (50, N'Samuel', N'Coleman', N'M', N'+7(0535)267-98-10', N'78k3dvwx@outlook.com', 3, CAST(N'2021-01-03' AS Date))
SET IDENTITY_INSERT [dbo].[Client] OFF
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([Id], [Name], [SurName], [GenderCode], [DateOfEmployment]) VALUES (1, N'Patrick', N'Bryant', N'M', CAST(N'2015-02-13' AS Date))
INSERT [dbo].[Employee] ([Id], [Name], [SurName], [GenderCode], [DateOfEmployment]) VALUES (2, N'Diego', N'Perry', N'M', CAST(N'2015-04-17' AS Date))
INSERT [dbo].[Employee] ([Id], [Name], [SurName], [GenderCode], [DateOfEmployment]) VALUES (3, N'Luke', N'Foster', N'M', CAST(N'2015-04-20' AS Date))
INSERT [dbo].[Employee] ([Id], [Name], [SurName], [GenderCode], [DateOfEmployment]) VALUES (4, N'Kyle', N'Miller', N'M', CAST(N'2015-07-28' AS Date))
INSERT [dbo].[Employee] ([Id], [Name], [SurName], [GenderCode], [DateOfEmployment]) VALUES (5, N'Eric', N'Johnson', N'M', CAST(N'2016-03-24' AS Date))
INSERT [dbo].[Employee] ([Id], [Name], [SurName], [GenderCode], [DateOfEmployment]) VALUES (6, N'Lucas', N'Nelson', N'M', CAST(N'2017-09-05' AS Date))
INSERT [dbo].[Employee] ([Id], [Name], [SurName], [GenderCode], [DateOfEmployment]) VALUES (7, N'Gabriel', N'King', N'M', CAST(N'2017-12-14' AS Date))
INSERT [dbo].[Employee] ([Id], [Name], [SurName], [GenderCode], [DateOfEmployment]) VALUES (8, N'Aaron', N'Jones', N'M', CAST(N'2019-06-14' AS Date))
INSERT [dbo].[Employee] ([Id], [Name], [SurName], [GenderCode], [DateOfEmployment]) VALUES (9, N'James', N'Baker', N'M', CAST(N'2019-08-07' AS Date))
INSERT [dbo].[Employee] ([Id], [Name], [SurName], [GenderCode], [DateOfEmployment]) VALUES (10, N'Isaac', N'Brown', N'M', CAST(N'2021-03-30' AS Date))
SET IDENTITY_INSERT [dbo].[Employee] OFF
INSERT [dbo].[Gender] ([Code], [Name]) VALUES (N'F', N'Female')
INSERT [dbo].[Gender] ([Code], [Name]) VALUES (N'M', N'Male')
SET IDENTITY_INSERT [dbo].[Service] ON 

INSERT [dbo].[Service] ([Id], [Name], [ServiceTypeId], [Duration], [Cost], [Description]) VALUES (1, N'Full Basic Detail', 1, CAST(3.00 AS Decimal(5, 2)), CAST(159.00 AS Decimal(10, 2)), N'Interior: Carpet Shampoo & Extracted
Seat Shampoo & Extracted
Leather/Vinyl/Plastic—Cleaned and Conditioned Headliner Cleaned—Vents Cleaned
Exterior: Vehicle Washed (Hand Wash Extra)
Professional Wax applied with DA Orbital Machine
Wheel Wells Dressed
Rims Cleaned
Exterior Trim Conditioned
Tire Shine Applied
Tire Pressure + Washer Fluid Checked and Added (Upon Request)')
INSERT [dbo].[Service] ([Id], [Name], [ServiceTypeId], [Duration], [Cost], [Description]) VALUES (2, N'Executive Detail', 1, CAST(5.00 AS Decimal(5, 2)), CAST(250.00 AS Decimal(10, 2)), N'Interior: Carpet Shampoo & Extracted
Seat Shampoo & Extracted
Leather/Vinyl/Plastic—Cleaned and Conditioned
Headliner Cleaned—Vents Cleaned—Fragrance
Exterior: Vehicle Washed (Hand Wash Extra)
Clay Bar the Paint ( Removes Industrial Fallout and contaminates on surface)
Diamond Cut Compounded (to remove impurities and minor scratches)
Meguiar’s Carnauba Wax applied with DA Orbital Machine (3-6 Months)
Wheel Wells Dressed
Rims Cleaned
Exterior Trim Conditioning
Tire Shine Applied')
INSERT [dbo].[Service] ([Id], [Name], [ServiceTypeId], [Duration], [Cost], [Description]) VALUES (3, N'ELITE Detail', 1, CAST(6.00 AS Decimal(5, 2)), CAST(340.00 AS Decimal(10, 2)), N'INTERIOR: Carpets— Carpet Shampoo & Extracted
Seats—Seat Shampoo & Extracted
Leather/Vinyl/Plastic—CLEANED and Conditioned
Headliner CLEANED
EXTERIOR: Vehicle Washed
Clay Bar Paint —(Removes Industrial Fallout and contamination
High Speed—(Clear Coat Scratch Removal + Oxidation Removal)
Diamond Cut Compounded —(removes impurities minor scratches) Meguiar’s Synthetic Sealant applied with DA Orbital Machine (6-12 Months +)
Wheel Wells dressed
Rims Cleaned
Exterior Trim Dressed')
INSERT [dbo].[Service] ([Id], [Name], [ServiceTypeId], [Duration], [Cost], [Description]) VALUES (4, N'Compound and Clay Bar Package', 2, CAST(3.00 AS Decimal(5, 2)), CAST(167.00 AS Decimal(10, 2)), N'Exterior Wash of Vehicle
Clay Bar Entire Vehicle to remove Industrial Fall out and imperfections
D/A Compound vehicle
D/A Apply Carnuaba Wax')
INSERT [dbo].[Service] ([Id], [Name], [ServiceTypeId], [Duration], [Cost], [Description]) VALUES (5, N'High Speed Compound Package', 2, CAST(5.00 AS Decimal(5, 2)), CAST(250.00 AS Decimal(10, 2)), N'To fix heavily oxidized paint and light scratches from paint
Wash Exterior of Vehicle
High Speed Buff Vehicle
D/A Compound to remove any swirls
D/A Carnuaba Wax
Tire Shine')
INSERT [dbo].[Service] ([Id], [Name], [ServiceTypeId], [Duration], [Cost], [Description]) VALUES (6, N'Interior Detail', 3, CAST(1.50 AS Decimal(5, 2)), CAST(117.00 AS Decimal(10, 2)), N'Carpets— Carpet Shampoo & Extracted
Seats—Seat Shampoo & Extracted
Leather/Vinyl/Plastic—DEEP CLEANED and Conditioned
Headliner CLEANED—Vents Cleaned—')
INSERT [dbo].[Service] ([Id], [Name], [ServiceTypeId], [Duration], [Cost], [Description]) VALUES (7, N'Hand Wash (exterior only)', 4, CAST(0.83 AS Decimal(5, 2)), CAST(41.00 AS Decimal(10, 2)), N'includes spray wax and tire shine')
INSERT [dbo].[Service] ([Id], [Name], [ServiceTypeId], [Duration], [Cost], [Description]) VALUES (8, N'Ceramic Inspection & Quote', 5, CAST(0.25 AS Decimal(5, 2)), CAST(0.00 AS Decimal(10, 2)), N'We would love to install Caramic Pro on your vehicle, but we need to meet with you first to inspect vehicle and answer any questions you may have. We want to make sure that you know as much as possible about the product and our company. After we meet, we will be able to provide you with pricing on all of our packages.')
INSERT [dbo].[Service] ([Id], [Name], [ServiceTypeId], [Duration], [Cost], [Description]) VALUES (9, N'Ceramic Aftercare Exterior Wash', 5, CAST(1.00 AS Decimal(5, 2)), CAST(25.00 AS Decimal(10, 2)), N'After installation of Ceramic Pro, We perform delicate washing of your vehicle. We apply a special ceramic coating wash soap with a foam cannon. Then we wash with microfiber mitt. After rinsing, we use air to blow off the majority of water, followed by hand drying with fresh microfiber towel. Tire shine included.')
INSERT [dbo].[Service] ([Id], [Name], [ServiceTypeId], [Duration], [Cost], [Description]) VALUES (10, N'WRAP JOB QUOTE', 6, CAST(0.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Service] ([Id], [Name], [ServiceTypeId], [Duration], [Cost], [Description]) VALUES (11, N'XPEL Paint Protect Film Quote ', 7, CAST(0.25 AS Decimal(5, 2)), CAST(0.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Service] ([Id], [Name], [ServiceTypeId], [Duration], [Cost], [Description]) VALUES (12, N'XPEL Full Vehicle Install', 7, CAST(9.00 AS Decimal(5, 2)), CAST(0.00 AS Decimal(10, 2)), NULL)
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
ALTER TABLE [dbo].[CarModel]  WITH CHECK ADD  CONSTRAINT [FK_CarModel_CarClass] FOREIGN KEY([ClassId])
REFERENCES [dbo].[CarClass] ([Id])
GO
ALTER TABLE [dbo].[CarModel] CHECK CONSTRAINT [FK_CarModel_CarClass]
GO
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
ALTER TABLE [dbo].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_Service] FOREIGN KEY([LastService])
REFERENCES [dbo].[Service] ([Id])
GO
ALTER TABLE [dbo].[Client] CHECK CONSTRAINT [FK_Client_Service]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Gender] FOREIGN KEY([GenderCode])
REFERENCES [dbo].[Gender] ([Code])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Gender]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_CarModel] FOREIGN KEY([CarId])
REFERENCES [dbo].[CarModel] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_CarModel]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Employee] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Employee]
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
