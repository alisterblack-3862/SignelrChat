USE [master]
GO
/****** Object:  Database [StudentDatabase]    Script Date: 07-06-2024 18:30:39 ******/
CREATE DATABASE [StudentDatabase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'StudentDatabase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\StudentDatabase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'StudentDatabase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\StudentDatabase_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [StudentDatabase] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StudentDatabase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StudentDatabase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StudentDatabase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StudentDatabase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StudentDatabase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StudentDatabase] SET ARITHABORT OFF 
GO
ALTER DATABASE [StudentDatabase] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [StudentDatabase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StudentDatabase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StudentDatabase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StudentDatabase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StudentDatabase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StudentDatabase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StudentDatabase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StudentDatabase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StudentDatabase] SET  ENABLE_BROKER 
GO
ALTER DATABASE [StudentDatabase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StudentDatabase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StudentDatabase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StudentDatabase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StudentDatabase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StudentDatabase] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [StudentDatabase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StudentDatabase] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [StudentDatabase] SET  MULTI_USER 
GO
ALTER DATABASE [StudentDatabase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StudentDatabase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StudentDatabase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StudentDatabase] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [StudentDatabase] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [StudentDatabase] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [StudentDatabase] SET QUERY_STORE = ON
GO
ALTER DATABASE [StudentDatabase] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [StudentDatabase]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 07-06-2024 18:30:39 ******/
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
/****** Object:  Table [dbo].[ChatRoom]    Script Date: 07-06-2024 18:30:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChatRoom](
	[RoomId] [int] IDENTITY(1,1) NOT NULL,
	[User1] [varchar](150) NULL,
	[User2] [varchar](150) NULL,
	[CommonRoom] [varchar](150) NULL,
	[CreatedDate] [varchar](50) NULL,
 CONSTRAINT [PK_ChatRoom] PRIMARY KEY CLUSTERED 
(
	[RoomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Messages]    Script Date: 07-06-2024 18:30:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Messages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[User] [nvarchar](max) NOT NULL,
	[Text] [nvarchar](max) NOT NULL,
	[Timestamp] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Messages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[students]    Script Date: 07-06-2024 18:30:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[students](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NULL,
	[Mobile] [nvarchar](15) NULL,
	[password] [nvarchar](150) NULL,
	[Image] [varchar](max) NULL,
 CONSTRAINT [PK_students] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 07-06-2024 18:30:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[MobileNumber] [nvarchar](50) NOT NULL,
	[OTP] [nvarchar](50) NOT NULL,
	[OTPIssueTime] [datetime] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231020045704_initial', N'7.0.12')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231020051020_initiall', N'7.0.12')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231020053437_initial', N'7.0.12')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240528055332_InitialCreate', N'8.0.5')
GO
SET IDENTITY_INSERT [dbo].[ChatRoom] ON 

INSERT [dbo].[ChatRoom] ([RoomId], [User1], [User2], [CommonRoom], [CreatedDate]) VALUES (1, N'shiv@gmail.com', N'Sourabh@gmail.com', N'3A20C02C-0F30-4DC0-B8BB-EA26A7037C94', N'2024-06-07 10:46:02.200')
SET IDENTITY_INSERT [dbo].[ChatRoom] OFF
GO
SET IDENTITY_INSERT [dbo].[students] ON 

INSERT [dbo].[students] ([Id], [Name], [Email], [Mobile], [password], [Image]) VALUES (1, N'shivshankar', N'shiv@gmail.com', N'7848579586', N'123456', N'https://useridimages.blob.core.windows.net/useridphoto/13QU2DPO3F.png')
INSERT [dbo].[students] ([Id], [Name], [Email], [Mobile], [password], [Image]) VALUES (2, N'sourabh', N'Sourabh@gmail.com', N'7584632589', N'123456', N'	https://useridimages.blob.core.windows.net/useridphoto/K96G5449MK.png')
INSERT [dbo].[students] ([Id], [Name], [Email], [Mobile], [password], [Image]) VALUES (3, N'kishan', N'Kishan@gmail.com', N'4567879656', N'123456', N'https://useridimages.blob.core.windows.net/useridphoto/EUL5HAISZR.png')
INSERT [dbo].[students] ([Id], [Name], [Email], [Mobile], [password], [Image]) VALUES (4, N'harsh', N'harsh@gmail.com', N'5896478975', N'123456', N'https://useridimages.blob.core.windows.net/useridphoto/OX3P8C9QUC.png')
INSERT [dbo].[students] ([Id], [Name], [Email], [Mobile], [password], [Image]) VALUES (5, N'yugal', N'yugal@gmail.com', N'9654875145', N'123456', N'https://useridimages.blob.core.windows.net/useridphoto/GMROCM8R3M.png')
SET IDENTITY_INSERT [dbo].[students] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserId], [MobileNumber], [OTP], [OTPIssueTime]) VALUES (3, N'6351220244', N'437152', CAST(N'2024-05-24T15:33:47.440' AS DateTime))
INSERT [dbo].[Users] ([UserId], [MobileNumber], [OTP], [OTPIssueTime]) VALUES (4, N'7069407003', N'322999', CAST(N'2024-05-24T12:23:23.547' AS DateTime))
INSERT [dbo].[Users] ([UserId], [MobileNumber], [OTP], [OTPIssueTime]) VALUES (5, N'9601949054', N'214672', CAST(N'2024-05-24T15:36:43.173' AS DateTime))
INSERT [dbo].[Users] ([UserId], [MobileNumber], [OTP], [OTPIssueTime]) VALUES (6, N'9106241354', N'951112', CAST(N'2024-05-24T15:43:57.917' AS DateTime))
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[ChatRoom] ADD  CONSTRAINT [DF_ChatRoom_CommonRoom]  DEFAULT (newid()) FOR [CommonRoom]
GO
ALTER TABLE [dbo].[ChatRoom] ADD  CONSTRAINT [DF_ChatRoom_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[students] ADD  CONSTRAINT [DF__students__Mobile__5AEE82B9]  DEFAULT (N'') FOR [Mobile]
GO
USE [master]
GO
ALTER DATABASE [StudentDatabase] SET  READ_WRITE 
GO
