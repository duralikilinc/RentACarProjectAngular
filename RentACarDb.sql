USE [master]
GO
/****** Object:  Database [RentACarDb]    Script Date: 10.04.2021 17:05:32 ******/
CREATE DATABASE [RentACarDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RentACarDb', FILENAME = N'C:\Users\SoftwareDeveloper\RentACarDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'RentACarDb_log', FILENAME = N'C:\Users\SoftwareDeveloper\RentACarDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [RentACarDb] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RentACarDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RentACarDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RentACarDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RentACarDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RentACarDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RentACarDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [RentACarDb] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [RentACarDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RentACarDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RentACarDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RentACarDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RentACarDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RentACarDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RentACarDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RentACarDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RentACarDb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [RentACarDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RentACarDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RentACarDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RentACarDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RentACarDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RentACarDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RentACarDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RentACarDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [RentACarDb] SET  MULTI_USER 
GO
ALTER DATABASE [RentACarDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RentACarDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RentACarDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RentACarDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [RentACarDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [RentACarDb] SET QUERY_STORE = OFF
GO
USE [RentACarDb]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [RentACarDb]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 10.04.2021 17:05:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Car]    Script Date: 10.04.2021 17:05:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Car](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ColorId] [int] NOT NULL,
	[BrandId] [int] NOT NULL,
	[ModelYear] [int] NOT NULL,
	[DailyPrice] [money] NOT NULL,
	[Description] [nvarchar](50) NULL,
	[Name] [nvarchar](50) NOT NULL,
	[MinFindexScore] [smallint] NOT NULL,
 CONSTRAINT [PK__Cars__3214EC07ACF048C3] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CarImage]    Script Date: 10.04.2021 17:05:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarImage](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CarId] [int] NOT NULL,
	[ImagePath] [nvarchar](250) NULL,
	[Date] [date] NULL,
 CONSTRAINT [PK__CarImage__3214EC07AE5C80B8] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Color]    Script Date: 10.04.2021 17:05:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Color](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CrediCard]    Script Date: 10.04.2021 17:05:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CrediCard](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[Number] [bigint] NOT NULL,
	[FullName] [varchar](50) NOT NULL,
	[Ccv] [smallint] NOT NULL,
	[ExpirationMonth] [smallint] NOT NULL,
	[ExpirationYear] [smallint] NOT NULL,
 CONSTRAINT [PK_CrediCard] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 10.04.2021 17:05:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[CompanyName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Findex]    Script Date: 10.04.2021 17:05:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Findex](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[Score] [smallint] NOT NULL,
 CONSTRAINT [PK_Findex] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Logs]    Script Date: 10.04.2021 17:05:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Logs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Detail] [nvarchar](4000) NULL,
	[Audit] [nvarchar](50) NOT NULL,
	[Date] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.Logs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OperationClaims]    Script Date: 10.04.2021 17:05:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OperationClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](250) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rentals]    Script Date: 10.04.2021 17:05:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rentals](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CarId] [int] NULL,
	[CustomerId] [int] NULL,
	[RentDate] [datetime] NULL,
	[ReturnDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 10.04.2021 17:05:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[PasswordHash] [varbinary](500) NOT NULL,
	[PasswordSalt] [varbinary](500) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK__tmp_ms_x__3214EC07112C1A6D] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserOperationClaims]    Script Date: 10.04.2021 17:05:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserOperationClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[OperationClaimId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Brand] ON 

INSERT [dbo].[Brand] ([Id], [Name]) VALUES (1, N'Renault   ')
INSERT [dbo].[Brand] ([Id], [Name]) VALUES (2, N'Hyundai   ')
INSERT [dbo].[Brand] ([Id], [Name]) VALUES (3, N'Honda     ')
INSERT [dbo].[Brand] ([Id], [Name]) VALUES (4, N'Mercedes  ')
INSERT [dbo].[Brand] ([Id], [Name]) VALUES (5, N'Seat      ')
SET IDENTITY_INSERT [dbo].[Brand] OFF
SET IDENTITY_INSERT [dbo].[Car] ON 

INSERT [dbo].[Car] ([Id], [ColorId], [BrandId], [ModelYear], [DailyPrice], [Description], [Name], [MinFindexScore]) VALUES (1, 1, 1, 2015, 1000.0000, N'Dizel', N'Megane', 500)
INSERT [dbo].[Car] ([Id], [ColorId], [BrandId], [ModelYear], [DailyPrice], [Description], [Name], [MinFindexScore]) VALUES (2, 2, 1, 2012, 950.0000, N'Dizel', N'Fluence', 800)
INSERT [dbo].[Car] ([Id], [ColorId], [BrandId], [ModelYear], [DailyPrice], [Description], [Name], [MinFindexScore]) VALUES (3, 2, 2, 2018, 1200.0000, N'Benzin', N'Getz', 750)
INSERT [dbo].[Car] ([Id], [ColorId], [BrandId], [ModelYear], [DailyPrice], [Description], [Name], [MinFindexScore]) VALUES (4, 3, 4, 2020, 1500.0000, N'Dizel', N'CLA 200', 1500)
INSERT [dbo].[Car] ([Id], [ColorId], [BrandId], [ModelYear], [DailyPrice], [Description], [Name], [MinFindexScore]) VALUES (6, 1, 5, 2015, 800.0000, N'Benzin', N'Leon', 800)
SET IDENTITY_INSERT [dbo].[Car] OFF
SET IDENTITY_INSERT [dbo].[CarImage] ON 

INSERT [dbo].[CarImage] ([Id], [CarId], [ImagePath], [Date]) VALUES (6, 2, N'\Uploads\85259b74-31fd-4c5b-8a45-ba1f22548502.jpg', CAST(N'2021-04-10' AS Date))
INSERT [dbo].[CarImage] ([Id], [CarId], [ImagePath], [Date]) VALUES (7, 1, N'\Uploads\d4b5e543-82e4-43e9-87e3-3f64908c8e55.jpg', CAST(N'2021-04-10' AS Date))
INSERT [dbo].[CarImage] ([Id], [CarId], [ImagePath], [Date]) VALUES (8, 3, N'\Uploads\7c67b281-d2e5-4e88-a6bd-addc2790d56a.jpg', CAST(N'2021-04-10' AS Date))
INSERT [dbo].[CarImage] ([Id], [CarId], [ImagePath], [Date]) VALUES (9, 4, N'\Uploads\d4386465-4f7d-4052-89ac-a0679bb3d952.jpg', CAST(N'2021-04-10' AS Date))
INSERT [dbo].[CarImage] ([Id], [CarId], [ImagePath], [Date]) VALUES (10, 6, N'\Uploads\eed98e87-3d48-45ac-b77c-419205cc375b.jpg', CAST(N'2021-04-10' AS Date))
SET IDENTITY_INSERT [dbo].[CarImage] OFF
SET IDENTITY_INSERT [dbo].[Color] ON 

INSERT [dbo].[Color] ([Id], [Name]) VALUES (1, N'Kırmızı')
INSERT [dbo].[Color] ([Id], [Name]) VALUES (2, N'Mavi')
INSERT [dbo].[Color] ([Id], [Name]) VALUES (3, N'Gri')
INSERT [dbo].[Color] ([Id], [Name]) VALUES (4, N'Siyah')
INSERT [dbo].[Color] ([Id], [Name]) VALUES (5, N'Beyaz')
SET IDENTITY_INSERT [dbo].[Color] OFF
SET IDENTITY_INSERT [dbo].[CrediCard] ON 

INSERT [dbo].[CrediCard] ([Id], [UserId], [Number], [FullName], [Ccv], [ExpirationMonth], [ExpirationYear]) VALUES (1, 1, 1234567845856985, N'Durali KILINÇ', 123, 6, 2022)
SET IDENTITY_INSERT [dbo].[CrediCard] OFF
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([Id], [UserId], [CompanyName]) VALUES (1, 1, N'duralikilinc')
SET IDENTITY_INSERT [dbo].[Customer] OFF
SET IDENTITY_INSERT [dbo].[Findex] ON 

INSERT [dbo].[Findex] ([Id], [CustomerId], [Score]) VALUES (2, 1, 541)
SET IDENTITY_INSERT [dbo].[Findex] OFF
SET IDENTITY_INSERT [dbo].[Logs] ON 

INSERT [dbo].[Logs] ([Id], [Detail], [Audit], [Date]) VALUES (1, N'{
  "Message": {
    "MethodName": "GetAll",
    "LogParameters": []
  }
}
', N'INFO', CAST(N'2021-04-08T10:04:47.903' AS DateTime))
INSERT [dbo].[Logs] ([Id], [Detail], [Audit], [Date]) VALUES (2, N'{
  "Message": {
    "MethodName": "GetAll",
    "LogParameters": []
  }
}
', N'INFO', CAST(N'2021-04-08T10:04:47.903' AS DateTime))
INSERT [dbo].[Logs] ([Id], [Detail], [Audit], [Date]) VALUES (3, N'{
  "Message": {
    "MethodName": "GetAll",
    "LogParameters": []
  }
}
', N'INFO', CAST(N'2021-04-08T11:09:57.957' AS DateTime))
INSERT [dbo].[Logs] ([Id], [Detail], [Audit], [Date]) VALUES (4, N'{
  "Message": {
    "MethodName": "GetAll",
    "LogParameters": []
  }
}
', N'INFO', CAST(N'2021-04-08T11:09:57.957' AS DateTime))
INSERT [dbo].[Logs] ([Id], [Detail], [Audit], [Date]) VALUES (5, N'{
  "Message": {
    "MethodName": "GetAll",
    "LogParameters": []
  }
}
', N'INFO', CAST(N'2021-04-08T11:18:16.817' AS DateTime))
INSERT [dbo].[Logs] ([Id], [Detail], [Audit], [Date]) VALUES (6, N'{
  "Message": {
    "MethodName": "GetAll",
    "LogParameters": []
  }
}
', N'INFO', CAST(N'2021-04-08T11:18:16.817' AS DateTime))
INSERT [dbo].[Logs] ([Id], [Detail], [Audit], [Date]) VALUES (7, N'{
  "Message": {
    "MethodName": "GetAll",
    "LogParameters": []
  }
}
', N'INFO', CAST(N'2021-04-08T11:19:08.673' AS DateTime))
INSERT [dbo].[Logs] ([Id], [Detail], [Audit], [Date]) VALUES (8, N'{
  "Message": {
    "MethodName": "GetAll",
    "LogParameters": []
  }
}
', N'INFO', CAST(N'2021-04-08T11:19:08.673' AS DateTime))
INSERT [dbo].[Logs] ([Id], [Detail], [Audit], [Date]) VALUES (9, N'{
  "Message": {
    "MethodName": "GetAll",
    "LogParameters": []
  }
}
', N'INFO', CAST(N'2021-04-08T12:08:49.190' AS DateTime))
INSERT [dbo].[Logs] ([Id], [Detail], [Audit], [Date]) VALUES (10, N'{
  "Message": {
    "MethodName": "GetAll",
    "LogParameters": []
  }
}
', N'INFO', CAST(N'2021-04-08T12:08:49.190' AS DateTime))
INSERT [dbo].[Logs] ([Id], [Detail], [Audit], [Date]) VALUES (11, N'{
  "Message": {
    "MethodName": "GetAll",
    "LogParameters": []
  }
}
', N'INFO', CAST(N'2021-04-08T12:50:11.907' AS DateTime))
INSERT [dbo].[Logs] ([Id], [Detail], [Audit], [Date]) VALUES (12, N'{
  "Message": {
    "MethodName": "GetAll",
    "LogParameters": []
  }
}
', N'INFO', CAST(N'2021-04-08T12:50:11.907' AS DateTime))
INSERT [dbo].[Logs] ([Id], [Detail], [Audit], [Date]) VALUES (13, N'{
  "Message": {
    "MethodName": "GetAll",
    "LogParameters": []
  }
}
', N'INFO', CAST(N'2021-04-08T13:37:33.970' AS DateTime))
INSERT [dbo].[Logs] ([Id], [Detail], [Audit], [Date]) VALUES (14, N'{
  "Message": {
    "MethodName": "GetAll",
    "LogParameters": []
  }
}
', N'INFO', CAST(N'2021-04-08T13:37:33.970' AS DateTime))
INSERT [dbo].[Logs] ([Id], [Detail], [Audit], [Date]) VALUES (15, N'{
  "Message": {
    "MethodName": "GetAll",
    "LogParameters": []
  }
}
', N'INFO', CAST(N'2021-04-08T13:40:35.353' AS DateTime))
INSERT [dbo].[Logs] ([Id], [Detail], [Audit], [Date]) VALUES (16, N'{
  "Message": {
    "MethodName": "GetAll",
    "LogParameters": []
  }
}
', N'INFO', CAST(N'2021-04-08T13:40:35.353' AS DateTime))
INSERT [dbo].[Logs] ([Id], [Detail], [Audit], [Date]) VALUES (17, N'{
  "Message": {
    "MethodName": "GetAll",
    "LogParameters": []
  }
}
', N'INFO', CAST(N'2021-04-08T13:47:31.140' AS DateTime))
INSERT [dbo].[Logs] ([Id], [Detail], [Audit], [Date]) VALUES (18, N'{
  "Message": {
    "MethodName": "GetAll",
    "LogParameters": []
  }
}
', N'INFO', CAST(N'2021-04-08T13:47:31.140' AS DateTime))
INSERT [dbo].[Logs] ([Id], [Detail], [Audit], [Date]) VALUES (19, N'{
  "Message": {
    "MethodName": "GetAll",
    "LogParameters": []
  }
}
', N'INFO', CAST(N'2021-04-08T13:49:38.807' AS DateTime))
INSERT [dbo].[Logs] ([Id], [Detail], [Audit], [Date]) VALUES (20, N'{
  "Message": {
    "MethodName": "GetAll",
    "LogParameters": []
  }
}
', N'INFO', CAST(N'2021-04-08T13:49:38.807' AS DateTime))
INSERT [dbo].[Logs] ([Id], [Detail], [Audit], [Date]) VALUES (21, N'{
  "Message": {
    "MethodName": "GetAll",
    "LogParameters": []
  }
}
', N'INFO', CAST(N'2021-04-08T13:58:09.483' AS DateTime))
INSERT [dbo].[Logs] ([Id], [Detail], [Audit], [Date]) VALUES (22, N'{
  "Message": {
    "MethodName": "GetAll",
    "LogParameters": []
  }
}
', N'INFO', CAST(N'2021-04-08T13:58:09.483' AS DateTime))
INSERT [dbo].[Logs] ([Id], [Detail], [Audit], [Date]) VALUES (23, N'{
  "Message": {
    "MethodName": "GetAll",
    "LogParameters": []
  }
}
', N'INFO', CAST(N'2021-04-08T14:57:53.203' AS DateTime))
INSERT [dbo].[Logs] ([Id], [Detail], [Audit], [Date]) VALUES (24, N'{
  "Message": {
    "MethodName": "GetAll",
    "LogParameters": []
  }
}
', N'INFO', CAST(N'2021-04-08T14:57:53.203' AS DateTime))
INSERT [dbo].[Logs] ([Id], [Detail], [Audit], [Date]) VALUES (25, N'{
  "Message": {
    "MethodName": "GetAll",
    "LogParameters": []
  }
}
', N'INFO', CAST(N'2021-04-08T15:00:25.330' AS DateTime))
INSERT [dbo].[Logs] ([Id], [Detail], [Audit], [Date]) VALUES (26, N'{
  "Message": {
    "MethodName": "GetAll",
    "LogParameters": []
  }
}
', N'INFO', CAST(N'2021-04-08T15:00:25.330' AS DateTime))
INSERT [dbo].[Logs] ([Id], [Detail], [Audit], [Date]) VALUES (27, N'{
  "Message": {
    "MethodName": "GetAll",
    "LogParameters": []
  }
}
', N'INFO', CAST(N'2021-04-09T08:36:02.670' AS DateTime))
INSERT [dbo].[Logs] ([Id], [Detail], [Audit], [Date]) VALUES (28, N'{
  "Message": {
    "MethodName": "GetAll",
    "LogParameters": []
  }
}
', N'INFO', CAST(N'2021-04-09T08:36:02.670' AS DateTime))
INSERT [dbo].[Logs] ([Id], [Detail], [Audit], [Date]) VALUES (29, N'{
  "Message": {
    "MethodName": "GetAll",
    "LogParameters": []
  }
}
', N'INFO', CAST(N'2021-04-09T10:37:26.157' AS DateTime))
INSERT [dbo].[Logs] ([Id], [Detail], [Audit], [Date]) VALUES (30, N'{
  "Message": {
    "MethodName": "GetAll",
    "LogParameters": []
  }
}
', N'INFO', CAST(N'2021-04-09T10:37:26.157' AS DateTime))
INSERT [dbo].[Logs] ([Id], [Detail], [Audit], [Date]) VALUES (31, N'{
  "Message": {
    "MethodName": "GetAll",
    "LogParameters": []
  }
}
', N'INFO', CAST(N'2021-04-09T11:07:15.300' AS DateTime))
INSERT [dbo].[Logs] ([Id], [Detail], [Audit], [Date]) VALUES (32, N'{
  "Message": {
    "MethodName": "GetAll",
    "LogParameters": []
  }
}
', N'INFO', CAST(N'2021-04-09T11:07:15.300' AS DateTime))
INSERT [dbo].[Logs] ([Id], [Detail], [Audit], [Date]) VALUES (33, N'{
  "Message": {
    "MethodName": "GetAll",
    "LogParameters": []
  }
}
', N'INFO', CAST(N'2021-04-09T14:59:10.530' AS DateTime))
INSERT [dbo].[Logs] ([Id], [Detail], [Audit], [Date]) VALUES (34, N'{
  "Message": {
    "MethodName": "GetAll",
    "LogParameters": []
  }
}
', N'INFO', CAST(N'2021-04-09T14:59:10.530' AS DateTime))
INSERT [dbo].[Logs] ([Id], [Detail], [Audit], [Date]) VALUES (35, N'{
  "Message": {
    "MethodName": "GetAll",
    "LogParameters": []
  }
}
', N'INFO', CAST(N'2021-04-09T16:09:39.793' AS DateTime))
INSERT [dbo].[Logs] ([Id], [Detail], [Audit], [Date]) VALUES (36, N'{
  "Message": {
    "MethodName": "GetAll",
    "LogParameters": []
  }
}
', N'INFO', CAST(N'2021-04-09T16:09:39.793' AS DateTime))
INSERT [dbo].[Logs] ([Id], [Detail], [Audit], [Date]) VALUES (37, N'{
  "Message": {
    "MethodName": "GetAll",
    "LogParameters": []
  }
}
', N'INFO', CAST(N'2021-04-10T14:34:04.953' AS DateTime))
INSERT [dbo].[Logs] ([Id], [Detail], [Audit], [Date]) VALUES (38, N'{
  "Message": {
    "MethodName": "GetAll",
    "LogParameters": []
  }
}
', N'INFO', CAST(N'2021-04-10T14:34:04.953' AS DateTime))
SET IDENTITY_INSERT [dbo].[Logs] OFF
SET IDENTITY_INSERT [dbo].[OperationClaims] ON 

INSERT [dbo].[OperationClaims] ([Id], [Name]) VALUES (1, N'admin')
INSERT [dbo].[OperationClaims] ([Id], [Name]) VALUES (2, N'moderator')
INSERT [dbo].[OperationClaims] ([Id], [Name]) VALUES (3, N'user')
INSERT [dbo].[OperationClaims] ([Id], [Name]) VALUES (4, N'car.add')
INSERT [dbo].[OperationClaims] ([Id], [Name]) VALUES (5, N'car.list')
INSERT [dbo].[OperationClaims] ([Id], [Name]) VALUES (6, N'user.add')
INSERT [dbo].[OperationClaims] ([Id], [Name]) VALUES (7, N'user.update')
INSERT [dbo].[OperationClaims] ([Id], [Name]) VALUES (8, N'user.get')
SET IDENTITY_INSERT [dbo].[OperationClaims] OFF
SET IDENTITY_INSERT [dbo].[Rentals] ON 

INSERT [dbo].[Rentals] ([Id], [CarId], [CustomerId], [RentDate], [ReturnDate]) VALUES (1, 1, 1, CAST(N'2021-03-06T00:00:00.000' AS DateTime), CAST(N'2021-04-08T00:00:00.000' AS DateTime))
INSERT [dbo].[Rentals] ([Id], [CarId], [CustomerId], [RentDate], [ReturnDate]) VALUES (6, 1, 1, CAST(N'2021-04-09T00:00:00.000' AS DateTime), CAST(N'2021-04-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Rentals] ([Id], [CarId], [CustomerId], [RentDate], [ReturnDate]) VALUES (7, 1, 1, CAST(N'2021-04-10T00:00:00.000' AS DateTime), CAST(N'2021-04-11T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Rentals] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [PasswordHash], [PasswordSalt], [Status]) VALUES (1, N'Durali', N'KILINÇ', N'durali@durali.com', 0x3E771BECD801963F225ADBE0174530D5E36D37C06F405B040FD7BAAEB1F82FC44BA56CEA13B5086233A0AA1133813EE7608361C4E787AC21AF225F65B41B714C, 0x0075562E6B56AB738A507999C357BF537852141874B5E6FF27603D28E1E4927DC70E4BC3A14640E623087A6CCF913FFA1AB1DD752E7F06881289298C3FC203372A73720657900E97140718F476BEEF6531EAFC9905D2458382F6F28090567E58E7599DAE6AEA3532F3AC1F5FD9044ABB80DABB2A1538AD15912136CB23962ED0, 1)
SET IDENTITY_INSERT [dbo].[User] OFF
SET IDENTITY_INSERT [dbo].[UserOperationClaims] ON 

INSERT [dbo].[UserOperationClaims] ([Id], [UserId], [OperationClaimId]) VALUES (1, 1, 1)
SET IDENTITY_INSERT [dbo].[UserOperationClaims] OFF
USE [master]
GO
ALTER DATABASE [RentACarDb] SET  READ_WRITE 
GO
