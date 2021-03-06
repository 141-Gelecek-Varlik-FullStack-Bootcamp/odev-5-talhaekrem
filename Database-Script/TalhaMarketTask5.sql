USE [master]
GO
/****** Object:  Database [TalhaMarket]    Script Date: 31.12.2021 16:56:48 ******/
CREATE DATABASE [TalhaMarket]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TalhaMarket', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TalhaMarket.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TalhaMarket_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TalhaMarket_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TalhaMarket] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TalhaMarket].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TalhaMarket] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TalhaMarket] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TalhaMarket] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TalhaMarket] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TalhaMarket] SET ARITHABORT OFF 
GO
ALTER DATABASE [TalhaMarket] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TalhaMarket] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TalhaMarket] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TalhaMarket] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TalhaMarket] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TalhaMarket] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TalhaMarket] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TalhaMarket] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TalhaMarket] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TalhaMarket] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TalhaMarket] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TalhaMarket] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TalhaMarket] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TalhaMarket] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TalhaMarket] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TalhaMarket] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TalhaMarket] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TalhaMarket] SET RECOVERY FULL 
GO
ALTER DATABASE [TalhaMarket] SET  MULTI_USER 
GO
ALTER DATABASE [TalhaMarket] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TalhaMarket] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TalhaMarket] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TalhaMarket] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TalhaMarket] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TalhaMarket] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'TalhaMarket', N'ON'
GO
ALTER DATABASE [TalhaMarket] SET QUERY_STORE = OFF
GO
USE [TalhaMarket]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = OFF;
GO
USE [TalhaMarket]
GO
/****** Object:  Schema [HangFire]    Script Date: 31.12.2021 16:56:49 ******/
CREATE SCHEMA [HangFire]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 31.12.2021 16:56:49 ******/
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
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 31.12.2021 16:56:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 31.12.2021 16:56:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 31.12.2021 16:56:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 31.12.2021 16:56:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 31.12.2021 16:56:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 31.12.2021 16:56:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 31.12.2021 16:56:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 31.12.2021 16:56:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[displayName] [varchar](50) NOT NULL,
	[isActive] [bit] NOT NULL,
	[isDeleted] [bit] NOT NULL,
	[insertedUser] [int] NOT NULL,
	[insertDate] [datetime] NOT NULL,
	[updatedUser] [int] NULL,
	[updateDate] [datetime] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 31.12.2021 16:56:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[categoryId] [int] NOT NULL,
	[name] [varchar](50) NOT NULL,
	[displayName] [varchar](50) NOT NULL,
	[description] [varchar](250) NOT NULL,
	[price] [decimal](18, 2) NOT NULL,
	[stock] [int] NOT NULL,
	[isActive] [bit] NOT NULL,
	[isDeleted] [bit] NOT NULL,
	[insertedUser] [int] NOT NULL,
	[insertDate] [datetime] NOT NULL,
	[updatedUser] [int] NULL,
	[updateDate] [datetime] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 31.12.2021 16:56:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[AspNetUserId] [nvarchar](450) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[surName] [varchar](50) NOT NULL,
	[userName] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[isActive] [bit] NOT NULL,
	[isDeleted] [bit] NOT NULL,
	[insertDate] [datetime] NOT NULL,
	[updateDate] [datetime] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[AggregatedCounter]    Script Date: 31.12.2021 16:56:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[AggregatedCounter](
	[Key] [nvarchar](100) NOT NULL,
	[Value] [bigint] NOT NULL,
	[ExpireAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_CounterAggregated] PRIMARY KEY CLUSTERED 
(
	[Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Counter]    Script Date: 31.12.2021 16:56:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Counter](
	[Key] [nvarchar](100) NOT NULL,
	[Value] [int] NOT NULL,
	[ExpireAt] [datetime] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [CX_HangFire_Counter]    Script Date: 31.12.2021 16:56:49 ******/
CREATE CLUSTERED INDEX [CX_HangFire_Counter] ON [HangFire].[Counter]
(
	[Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Hash]    Script Date: 31.12.2021 16:56:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Hash](
	[Key] [nvarchar](100) NOT NULL,
	[Field] [nvarchar](100) NOT NULL,
	[Value] [nvarchar](max) NULL,
	[ExpireAt] [datetime2](7) NULL,
 CONSTRAINT [PK_HangFire_Hash] PRIMARY KEY CLUSTERED 
(
	[Key] ASC,
	[Field] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Job]    Script Date: 31.12.2021 16:56:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Job](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[StateId] [bigint] NULL,
	[StateName] [nvarchar](20) NULL,
	[InvocationData] [nvarchar](max) NOT NULL,
	[Arguments] [nvarchar](max) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[ExpireAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_Job] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[JobParameter]    Script Date: 31.12.2021 16:56:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[JobParameter](
	[JobId] [bigint] NOT NULL,
	[Name] [nvarchar](40) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_HangFire_JobParameter] PRIMARY KEY CLUSTERED 
(
	[JobId] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[JobQueue]    Script Date: 31.12.2021 16:56:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[JobQueue](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[JobId] [bigint] NOT NULL,
	[Queue] [nvarchar](50) NOT NULL,
	[FetchedAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_JobQueue] PRIMARY KEY CLUSTERED 
(
	[Queue] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[List]    Script Date: 31.12.2021 16:56:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[List](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Key] [nvarchar](100) NOT NULL,
	[Value] [nvarchar](max) NULL,
	[ExpireAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_List] PRIMARY KEY CLUSTERED 
(
	[Key] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Schema]    Script Date: 31.12.2021 16:56:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Schema](
	[Version] [int] NOT NULL,
 CONSTRAINT [PK_HangFire_Schema] PRIMARY KEY CLUSTERED 
(
	[Version] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Server]    Script Date: 31.12.2021 16:56:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Server](
	[Id] [nvarchar](200) NOT NULL,
	[Data] [nvarchar](max) NULL,
	[LastHeartbeat] [datetime] NOT NULL,
 CONSTRAINT [PK_HangFire_Server] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Set]    Script Date: 31.12.2021 16:56:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Set](
	[Key] [nvarchar](100) NOT NULL,
	[Score] [float] NOT NULL,
	[Value] [nvarchar](256) NOT NULL,
	[ExpireAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_Set] PRIMARY KEY CLUSTERED 
(
	[Key] ASC,
	[Value] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[State]    Script Date: 31.12.2021 16:56:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[State](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[JobId] [bigint] NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[Reason] [nvarchar](100) NULL,
	[CreatedAt] [datetime] NOT NULL,
	[Data] [nvarchar](max) NULL,
 CONSTRAINT [PK_HangFire_State] PRIMARY KEY CLUSTERED 
(
	[JobId] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211225133956_identity', N'5.0.13')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'31adda94-4e20-4a78-9792-12b355a2cb04', N'Admin', N'ADMIN', N'8bb6de57-6d2e-457c-a445-70b441d10041')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'8261a93a-4fda-453b-a71f-d9761d71193e', N'Editor', N'EDITOR', N'b8be102b-8cc6-49c8-8400-dea66349d338')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'635a946f-2c37-4f0a-a1ff-2ad2bc5ec17a', N'31adda94-4e20-4a78-9792-12b355a2cb04')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'5022f302-f2b2-4f46-9993-ec4193b51e5f', N'8261a93a-4fda-453b-a71f-d9761d71193e')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'5648dd19-cc10-4ab0-8d64-9e63caba5941', N'8261a93a-4fda-453b-a71f-d9761d71193e')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'bb89c949-d675-4fc6-87f0-e99104e4c45d', N'8261a93a-4fda-453b-a71f-d9761d71193e')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'cf6ebdd1-4955-4aff-891f-63e0f1412afe', N'8261a93a-4fda-453b-a71f-d9761d71193e')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'd0c018b9-5473-415a-ba31-7cc333e6fb55', N'8261a93a-4fda-453b-a71f-d9761d71193e')
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'26dc39c0-f250-4b44-ba76-e155129da61b', N'garryyoung', N'GARRYYOUNG', N'garry@young.com', N'GARRY@YOUNG.COM', 0, N'AQAAAAEAACcQAAAAEEuC/bgLw0r7OW591keNJPDhBn0naSR3QQqJhHYOjIuOkDSN9sFQ9cBCiTo6DRluPA==', N'6LIWMVG363CC5MGX54GYXB22YGLE5BIY', N'4a53c832-80b1-480d-95db-cee8b990b46c', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'5022f302-f2b2-4f46-9993-ec4193b51e5f', N'batuh12', N'BATUH12', N'batuhanekrem9@gmail.com', N'BATUHANEKREM9@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEHnAGgdZjztyeQR4wuBcRSsZGyY9jBBtOXL1vhDg3CPd8WionI6xNt1uNVwumknz4g==', N'BQGIFYYU7QL3TRFTALFK6CPRWSCGEWT4', N'3ba53e3d-b7df-44f3-8115-edba1a5f7dc9', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'5648dd19-cc10-4ab0-8d64-9e63caba5941', N'talhaekrem123', N'TALHAEKREM123', N'talha.ekrem.99@gmail.com', N'TALHA.EKREM.99@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAED5WV7yZPxFCm2L+1u8RedQ4Z1aNplbdDJR3vEq5M4vTfm1Gpwug7Ac+F3uW93oXTg==', N'MWDYMYPMPKY6VXPK5CFF6JSAU42HEFEO', N'1316e8e8-aea0-43b6-a643-907ee5f8444e', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'635a946f-2c37-4f0a-a1ff-2ad2bc5ec17a', N'talhaekrem', N'TALHAEKREM', N'talha.ekrem.99@gmail.com', N'TALHA.EKREM.99@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEHLJJShqTKX4ZqOucjaRVGClQowejG0mxzhyjFpofBlZnwQyjOAkC7efbDm+3+ioQg==', N'6UMNORP73LCK7G6WLUSV34S4YR47VPFH', N'7bc76bf6-2b99-43e8-aa70-a3f2b3a19450', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'bb89c949-d675-4fc6-87f0-e99104e4c45d', N'johnparker', N'JOHNPARKER', N'john@parker.com', N'JOHN@PARKER.COM', 0, N'AQAAAAEAACcQAAAAEEkkBOSgfV2Cu3ySuaPC+zqYCMHWSkeektf0IAcsXJ8GUvVWVaKTTeGmba2FGTaACw==', N'DLMWRAEK72VNIK4ZA5UXQUVEIZBUMT5B', N'6859bf3e-3957-46c2-8c6c-f592fea33ce5', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'cf6ebdd1-4955-4aff-891f-63e0f1412afe', N'mariaanderson0', N'MARIAANDERSON0', N'maria@anderson.co.uk', N'MARIA@ANDERSON.CO.UK', 0, N'AQAAAAEAACcQAAAAEMbjqBS2klx2hMW9HTwyH+HARjmyEy5JTHLQlq7Ett4deMBXq8/UCgtmfywRSTxDuQ==', N'SSAUVMP6PWMEJ76ZPTT5SDNVF7LDPPVT', N'4a2f33e4-065d-47d5-8320-aeae759c9feb', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'd0c018b9-5473-415a-ba31-7cc333e6fb55', N'zombie', N'ZOMBIE', N'test@test.com', N'TEST@TEST.COM', 0, N'AQAAAAEAACcQAAAAEFLDZMAzDAaw13X68SSkHTtMYqnE/t3zsMepfOsAOkeUJkjg3kQs4dOiechjuQiMTw==', N'JMZISCOP2A6R4HZXJFGTYSWIJMJB2NCD', N'e7715f66-0a7e-4109-a414-0d54f0f88446', NULL, 0, 0, CAST(N'2121-12-30T00:00:00.0000000+03:00' AS DateTimeOffset), 1, 0)
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([id], [name], [displayName], [isActive], [isDeleted], [insertedUser], [insertDate], [updatedUser], [updateDate]) VALUES (1, N'Elektronik', N'Elektronik Aletler', 1, 0, 1, CAST(N'2021-12-14T16:41:51.533' AS DateTime), NULL, NULL)
INSERT [dbo].[Category] ([id], [name], [displayName], [isActive], [isDeleted], [insertedUser], [insertDate], [updatedUser], [updateDate]) VALUES (2, N'Temizlik', N'Temizlik Ürünleri', 1, 0, 1, CAST(N'2021-12-15T16:04:45.597' AS DateTime), NULL, NULL)
INSERT [dbo].[Category] ([id], [name], [displayName], [isActive], [isDeleted], [insertedUser], [insertDate], [updatedUser], [updateDate]) VALUES (3, N'Bilgisayar', N'Bilgisayar ve Donanım', 1, 0, 1, CAST(N'2021-12-15T16:05:46.600' AS DateTime), NULL, NULL)
INSERT [dbo].[Category] ([id], [name], [displayName], [isActive], [isDeleted], [insertedUser], [insertDate], [updatedUser], [updateDate]) VALUES (4, N'Ev Aletleri', N'Ev ve Mutfak Aletleri', 0, 0, 1, CAST(N'2021-12-15T16:06:03.363' AS DateTime), 1, CAST(N'2021-12-15T16:13:54.957' AS DateTime))
INSERT [dbo].[Category] ([id], [name], [displayName], [isActive], [isDeleted], [insertedUser], [insertDate], [updatedUser], [updateDate]) VALUES (5, N'Oyuncak', N'Oyuncaklar', 1, 0, 1, CAST(N'2021-12-15T16:14:11.627' AS DateTime), NULL, NULL)
INSERT [dbo].[Category] ([id], [name], [displayName], [isActive], [isDeleted], [insertedUser], [insertDate], [updatedUser], [updateDate]) VALUES (6, N'Temizlik', N'Temizlik Malzemeleri', 1, 0, 2, CAST(N'2021-12-18T14:38:00.547' AS DateTime), 2, CAST(N'2021-12-18T14:38:58.770' AS DateTime))
INSERT [dbo].[Category] ([id], [name], [displayName], [isActive], [isDeleted], [insertedUser], [insertDate], [updatedUser], [updateDate]) VALUES (7, N'İçecekler', N'Sıcak-Soğuk İçecekler', 1, 0, 2, CAST(N'2021-12-18T15:18:02.223' AS DateTime), 1, CAST(N'2021-12-18T15:19:01.707' AS DateTime))
INSERT [dbo].[Category] ([id], [name], [displayName], [isActive], [isDeleted], [insertedUser], [insertDate], [updatedUser], [updateDate]) VALUES (8, N'Giyim', N'Tekstil - Giyim - Kıyafet', 0, 1, 1, CAST(N'2021-12-27T17:07:48.233' AS DateTime), 2, CAST(N'2021-12-27T17:11:29.223' AS DateTime))
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([id], [categoryId], [name], [displayName], [description], [price], [stock], [isActive], [isDeleted], [insertedUser], [insertDate], [updatedUser], [updateDate]) VALUES (1, 1, N'Xiaomi', N'Xiaomi Mi10', N'30 mpixel 2 adet arka kamera', CAST(12300.00 AS Decimal(18, 2)), 500, 1, 0, 1, CAST(N'2021-12-14T16:44:44.447' AS DateTime), 1, CAST(N'2021-12-15T16:15:22.300' AS DateTime))
INSERT [dbo].[Product] ([id], [categoryId], [name], [displayName], [description], [price], [stock], [isActive], [isDeleted], [insertedUser], [insertDate], [updatedUser], [updateDate]) VALUES (2, 1, N'Iphone', N'Iphone XS Pro Max', N'5.6inch ekrran. 40 mpixel 3 adet arka kamera', CAST(18500.00 AS Decimal(18, 2)), 100, 1, 0, 1, CAST(N'2021-12-14T16:49:27.183' AS DateTime), 1, CAST(N'2021-12-15T16:15:48.650' AS DateTime))
INSERT [dbo].[Product] ([id], [categoryId], [name], [displayName], [description], [price], [stock], [isActive], [isDeleted], [insertedUser], [insertDate], [updatedUser], [updateDate]) VALUES (3, 1, N'Samsung', N'Samsung Galaxy Ultra', N'5.6inch ekrran. 40 mpixel 3 adet arka kamera', CAST(19500.00 AS Decimal(18, 2)), 200, 1, 0, 1, CAST(N'2021-12-14T21:11:24.430' AS DateTime), 2, CAST(N'2021-12-14T21:22:09.610' AS DateTime))
INSERT [dbo].[Product] ([id], [categoryId], [name], [displayName], [description], [price], [stock], [isActive], [isDeleted], [insertedUser], [insertDate], [updatedUser], [updateDate]) VALUES (4, 1, N'Xiaomi', N'Xiaomi Mi10S', N'Ucuz ve kaliteli', CAST(8000.00 AS Decimal(18, 2)), 500, 1, 0, 2, CAST(N'2021-12-14T21:20:41.663' AS DateTime), 1, CAST(N'2021-12-15T16:16:19.353' AS DateTime))
INSERT [dbo].[Product] ([id], [categoryId], [name], [displayName], [description], [price], [stock], [isActive], [isDeleted], [insertedUser], [insertDate], [updatedUser], [updateDate]) VALUES (5, 1, N'Huawei', N'Huawei Lite 9', N'40x zoom', CAST(7600.00 AS Decimal(18, 2)), 750, 1, 0, 1, CAST(N'2021-12-14T22:46:35.490' AS DateTime), 1, CAST(N'2021-12-15T16:16:51.543' AS DateTime))
INSERT [dbo].[Product] ([id], [categoryId], [name], [displayName], [description], [price], [stock], [isActive], [isDeleted], [insertedUser], [insertDate], [updatedUser], [updateDate]) VALUES (6, 3, N'Kingston', N'Kingston 8GB Ram', N'2600mhz 8gb sodim ram', CAST(550.00 AS Decimal(18, 2)), 250, 1, 0, 1, CAST(N'2021-12-15T18:37:02.430' AS DateTime), NULL, NULL)
INSERT [dbo].[Product] ([id], [categoryId], [name], [displayName], [description], [price], [stock], [isActive], [isDeleted], [insertedUser], [insertDate], [updatedUser], [updateDate]) VALUES (7, 3, N'Samsung', N'Samsung Monitör', N'24.5 inch', CAST(1800.00 AS Decimal(18, 2)), 60, 1, 0, 1, CAST(N'2021-12-15T18:38:07.643' AS DateTime), NULL, NULL)
INSERT [dbo].[Product] ([id], [categoryId], [name], [displayName], [description], [price], [stock], [isActive], [isDeleted], [insertedUser], [insertDate], [updatedUser], [updateDate]) VALUES (9, 3, N'Monster', N'Monster Abra A5', N'15.6 inch intel core 11. nesil i7 işlemci, 16gb ram', CAST(18000.00 AS Decimal(18, 2)), 50, 1, 0, 1, CAST(N'2021-12-15T19:06:37.807' AS DateTime), NULL, NULL)
INSERT [dbo].[Product] ([id], [categoryId], [name], [displayName], [description], [price], [stock], [isActive], [isDeleted], [insertedUser], [insertDate], [updatedUser], [updateDate]) VALUES (10, 2, N'Cif', N'Cif', N'1600 ml Cif Temizleyici', CAST(35.90 AS Decimal(18, 2)), 800, 0, 1, 1, CAST(N'2021-12-15T19:07:29.830' AS DateTime), NULL, NULL)
INSERT [dbo].[Product] ([id], [categoryId], [name], [displayName], [description], [price], [stock], [isActive], [isDeleted], [insertedUser], [insertDate], [updatedUser], [updateDate]) VALUES (11, 2, N'Selpak', N'Selpak Islak Mendil', N'500 lü Selpak Islak Mendil', CAST(120.00 AS Decimal(18, 2)), 250, 1, 0, 2, CAST(N'2021-12-15T19:09:08.450' AS DateTime), NULL, NULL)
INSERT [dbo].[Product] ([id], [categoryId], [name], [displayName], [description], [price], [stock], [isActive], [isDeleted], [insertedUser], [insertDate], [updatedUser], [updateDate]) VALUES (12, 1, N'Televizyon', N'LG Smart TV', N'55inch 4k Smart LED TV', CAST(9650.00 AS Decimal(18, 2)), 75, 1, 0, 1, CAST(N'2021-12-15T19:10:17.593' AS DateTime), NULL, NULL)
INSERT [dbo].[Product] ([id], [categoryId], [name], [displayName], [description], [price], [stock], [isActive], [isDeleted], [insertedUser], [insertDate], [updatedUser], [updateDate]) VALUES (13, 1, N'Televizyon', N'Samsung LED TV', N'65inch', CAST(12600.00 AS Decimal(18, 2)), 40, 1, 0, 2, CAST(N'2021-12-15T19:10:55.143' AS DateTime), NULL, NULL)
INSERT [dbo].[Product] ([id], [categoryId], [name], [displayName], [description], [price], [stock], [isActive], [isDeleted], [insertedUser], [insertDate], [updatedUser], [updateDate]) VALUES (14, 5, N'Drone', N'250gr Basit Drone', N'ehliyet gerekmez', CAST(1250.00 AS Decimal(18, 2)), 678, 0, 0, 2, CAST(N'2021-12-15T19:12:44.237' AS DateTime), NULL, NULL)
INSERT [dbo].[Product] ([id], [categoryId], [name], [displayName], [description], [price], [stock], [isActive], [isDeleted], [insertedUser], [insertDate], [updatedUser], [updateDate]) VALUES (15, 5, N'Puzzle', N'1000 Parça Yapboz ', N'İstanbul manzaları Orta seviye 1000 parçalı yapboz', CAST(200.00 AS Decimal(18, 2)), 40, 0, 0, 1, CAST(N'2021-12-15T19:17:54.590' AS DateTime), NULL, NULL)
INSERT [dbo].[Product] ([id], [categoryId], [name], [displayName], [description], [price], [stock], [isActive], [isDeleted], [insertedUser], [insertDate], [updatedUser], [updateDate]) VALUES (17, 1, N'Samsung', N'Samsung Galaxy A5 2017 Telefon', N'Samsung Galaxy A5 2017 Akıllı Telefon 3GB Ram 16mpixel arka kamera', CAST(1650.00 AS Decimal(18, 2)), 150, 1, 0, 1, CAST(N'2021-12-15T19:19:01.973' AS DateTime), NULL, NULL)
INSERT [dbo].[Product] ([id], [categoryId], [name], [displayName], [description], [price], [stock], [isActive], [isDeleted], [insertedUser], [insertDate], [updatedUser], [updateDate]) VALUES (18, 4, N'Bosch', N'Buzdolabı', N'Bosch marka buzdolabı', CAST(5400.00 AS Decimal(18, 2)), 400, 1, 0, 2, CAST(N'2021-12-15T19:20:07.087' AS DateTime), NULL, NULL)
INSERT [dbo].[Product] ([id], [categoryId], [name], [displayName], [description], [price], [stock], [isActive], [isDeleted], [insertedUser], [insertDate], [updatedUser], [updateDate]) VALUES (19, 4, N'Bosch', N'Fırın', N'Bosch Fırın 10 yıl garantili', CAST(7000.00 AS Decimal(18, 2)), 216, 0, 0, 2, CAST(N'2021-12-15T19:20:42.300' AS DateTime), NULL, NULL)
INSERT [dbo].[Product] ([id], [categoryId], [name], [displayName], [description], [price], [stock], [isActive], [isDeleted], [insertedUser], [insertDate], [updatedUser], [updateDate]) VALUES (20, 4, N'Arçelik', N'Arçelik Çamaşır Makinesi', N'Arçelik çamaşır makinesi 5 yıl garantili beyaz', CAST(6200.00 AS Decimal(18, 2)), 40, 1, 0, 1, CAST(N'2021-12-15T19:21:32.713' AS DateTime), 20, CAST(N'2021-12-27T16:25:25.100' AS DateTime))
INSERT [dbo].[Product] ([id], [categoryId], [name], [displayName], [description], [price], [stock], [isActive], [isDeleted], [insertedUser], [insertDate], [updatedUser], [updateDate]) VALUES (21, 2, N'Solo', N'Tuvalet Kağıdı', N'Solo tuvalet kağıdı 32li', CAST(160.00 AS Decimal(18, 2)), 12, 1, 0, 2, CAST(N'2021-12-15T19:22:14.253' AS DateTime), NULL, NULL)
INSERT [dbo].[Product] ([id], [categoryId], [name], [displayName], [description], [price], [stock], [isActive], [isDeleted], [insertedUser], [insertDate], [updatedUser], [updateDate]) VALUES (22, 1, N'Samsung', N'Samsung Telefon', N'Samsung galaxy m31 6000mAh 6gb ram', CAST(5921.00 AS Decimal(18, 2)), 456, 1, 0, 1, CAST(N'2021-12-15T19:27:17.803' AS DateTime), NULL, NULL)
INSERT [dbo].[Product] ([id], [categoryId], [name], [displayName], [description], [price], [stock], [isActive], [isDeleted], [insertedUser], [insertDate], [updatedUser], [updateDate]) VALUES (23, 4, N'Tornavida', N'Tornavida', N'Tornavida 8li', CAST(123.00 AS Decimal(18, 2)), 542, 0, 0, 1, CAST(N'2021-12-15T19:28:01.160' AS DateTime), NULL, NULL)
INSERT [dbo].[Product] ([id], [categoryId], [name], [displayName], [description], [price], [stock], [isActive], [isDeleted], [insertedUser], [insertDate], [updatedUser], [updateDate]) VALUES (24, 4, N'Bant', N'16 lı para bandı', N'şeffaf 16 lı para bandı', CAST(59.00 AS Decimal(18, 2)), 493, 0, 0, 2, CAST(N'2021-12-15T19:28:44.557' AS DateTime), NULL, NULL)
INSERT [dbo].[Product] ([id], [categoryId], [name], [displayName], [description], [price], [stock], [isActive], [isDeleted], [insertedUser], [insertDate], [updatedUser], [updateDate]) VALUES (25, 5, N'Oyuncak Araba', N'Hot Wheels Oyuncak Araba', N'8 adet Hot Wheels yeni arabalar', CAST(381.00 AS Decimal(18, 2)), 380, 1, 0, 2, CAST(N'2021-12-15T19:29:29.840' AS DateTime), NULL, NULL)
INSERT [dbo].[Product] ([id], [categoryId], [name], [displayName], [description], [price], [stock], [isActive], [isDeleted], [insertedUser], [insertDate], [updatedUser], [updateDate]) VALUES (27, 5, N'Yugioh Kartları', N'Yugioh Kartları 2. seri', N'500 adet karışık Yu-Gi-Oh! kartları', CAST(421.00 AS Decimal(18, 2)), 281, 1, 0, 1, CAST(N'2021-12-15T19:41:24.990' AS DateTime), NULL, NULL)
INSERT [dbo].[Product] ([id], [categoryId], [name], [displayName], [description], [price], [stock], [isActive], [isDeleted], [insertedUser], [insertDate], [updatedUser], [updateDate]) VALUES (28, 4, N'Vestel', N'Kahve Makinesi', N'2 yıl garantili Vestel Kahve Makinesi. 2 programlı otomatik', CAST(6032.00 AS Decimal(18, 2)), 302, 1, 0, 2, CAST(N'2021-12-15T19:43:34.510' AS DateTime), NULL, NULL)
INSERT [dbo].[Product] ([id], [categoryId], [name], [displayName], [description], [price], [stock], [isActive], [isDeleted], [insertedUser], [insertDate], [updatedUser], [updateDate]) VALUES (29, 1, N'Oppo', N'Oppo Telefon', N'6 yıl garantili', CAST(602.00 AS Decimal(18, 2)), 401, 0, 0, 1, CAST(N'2021-12-16T00:12:45.650' AS DateTime), NULL, NULL)
INSERT [dbo].[Product] ([id], [categoryId], [name], [displayName], [description], [price], [stock], [isActive], [isDeleted], [insertedUser], [insertDate], [updatedUser], [updateDate]) VALUES (30, 1, N'General Mobile', N'General Mobile GM20', N'2 yıl garantili', CAST(5500.00 AS Decimal(18, 2)), 402, 0, 0, 2, CAST(N'2021-12-16T00:14:43.157' AS DateTime), NULL, NULL)
INSERT [dbo].[Product] ([id], [categoryId], [name], [displayName], [description], [price], [stock], [isActive], [isDeleted], [insertedUser], [insertDate], [updatedUser], [updateDate]) VALUES (31, 1, N'General Mobile', N'General Mobile GM30', N'4 yıl garantili', CAST(5600.00 AS Decimal(18, 2)), 5000, 0, 0, 1, CAST(N'2021-12-16T23:30:21.977' AS DateTime), NULL, NULL)
INSERT [dbo].[Product] ([id], [categoryId], [name], [displayName], [description], [price], [stock], [isActive], [isDeleted], [insertedUser], [insertDate], [updatedUser], [updateDate]) VALUES (32, 1, N'Vestel', N'Vestel venüs', N'Yerli Malı 3 yıl garantili', CAST(3000.00 AS Decimal(18, 2)), 1000, 1, 0, 2, CAST(N'2021-12-16T23:31:50.857' AS DateTime), 1, CAST(N'2021-12-22T17:53:27.483' AS DateTime))
INSERT [dbo].[Product] ([id], [categoryId], [name], [displayName], [description], [price], [stock], [isActive], [isDeleted], [insertedUser], [insertDate], [updatedUser], [updateDate]) VALUES (33, 1, N'Nokia', N'Nokia 3310', N'Tuğla, taş, çelik, efsane', CAST(220.90 AS Decimal(18, 2)), 2100, 1, 0, 1, CAST(N'2021-12-18T14:54:10.110' AS DateTime), 1, CAST(N'2021-12-18T14:55:00.890' AS DateTime))
INSERT [dbo].[Product] ([id], [categoryId], [name], [displayName], [description], [price], [stock], [isActive], [isDeleted], [insertedUser], [insertDate], [updatedUser], [updateDate]) VALUES (34, 1, N'Xiaomi', N'Xiaomi Mi9 Lite', N'40mpixel çift arka kamera', CAST(6900.00 AS Decimal(18, 2)), 200, 1, 0, 1, CAST(N'2021-12-18T15:15:18.700' AS DateTime), 2, CAST(N'2021-12-18T15:16:58.780' AS DateTime))
INSERT [dbo].[Product] ([id], [categoryId], [name], [displayName], [description], [price], [stock], [isActive], [isDeleted], [insertedUser], [insertDate], [updatedUser], [updateDate]) VALUES (35, 1, N'Samsung', N'Samsung Galaxy Fold', N'Katlanabilir Dokunmatik Telefon', CAST(20250.00 AS Decimal(18, 2)), 120, 1, 0, 1, CAST(N'2021-12-27T15:51:01.910' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([id], [AspNetUserId], [name], [surName], [userName], [email], [password], [isActive], [isDeleted], [insertDate], [updateDate]) VALUES (1, N'635a946f-2c37-4f0a-a1ff-2ad2bc5ec17a', N'Talha', N'Ekrem', N'talhaekrem', N'talha.ekrem.99@gmail.com', N'Admin.123', 1, 0, CAST(N'2021-12-14T16:41:51.533' AS DateTime), NULL)
INSERT [dbo].[User] ([id], [AspNetUserId], [name], [surName], [userName], [email], [password], [isActive], [isDeleted], [insertDate], [updateDate]) VALUES (2, N'bb89c949-d675-4fc6-87f0-e99104e4c45d', N'John', N'Parker', N'johnparker', N'john@parker.com', N'Editor.123', 1, 0, CAST(N'2021-12-14T21:19:16.353' AS DateTime), NULL)
INSERT [dbo].[User] ([id], [AspNetUserId], [name], [surName], [userName], [email], [password], [isActive], [isDeleted], [insertDate], [updateDate]) VALUES (6, N'26dc39c0-f250-4b44-ba76-e155129da61b', N'Garry', N'Young', N'garryyoung', N'garry@young.com', N'Editor.123', 1, 0, CAST(N'2021-12-26T02:49:59.170' AS DateTime), NULL)
INSERT [dbo].[User] ([id], [AspNetUserId], [name], [surName], [userName], [email], [password], [isActive], [isDeleted], [insertDate], [updateDate]) VALUES (20, N'cf6ebdd1-4955-4aff-891f-63e0f1412afe', N'Maria', N'Anderson', N'mariaanderson0', N'maria@anderson.co.uk', N'Editor.123', 1, 0, CAST(N'2021-12-26T17:43:25.973' AS DateTime), CAST(N'2021-12-31T16:52:32.687' AS DateTime))
INSERT [dbo].[User] ([id], [AspNetUserId], [name], [surName], [userName], [email], [password], [isActive], [isDeleted], [insertDate], [updateDate]) VALUES (34, N'5022f302-f2b2-4f46-9993-ec4193b51e5f', N'Batuhan', N'Ekrem', N'batuh12', N'batuhanekrem9@gmail.com', N'Batu.123', 1, 0, CAST(N'2021-12-29T15:44:47.897' AS DateTime), NULL)
INSERT [dbo].[User] ([id], [AspNetUserId], [name], [surName], [userName], [email], [password], [isActive], [isDeleted], [insertDate], [updateDate]) VALUES (35, N'5648dd19-cc10-4ab0-8d64-9e63caba5941', N'Talha', N'Ekrem', N'talhaekrem123', N'talha.ekrem.99@gmail.com', N'Talha.123', 1, 0, CAST(N'2021-12-29T15:49:16.673' AS DateTime), NULL)
INSERT [dbo].[User] ([id], [AspNetUserId], [name], [surName], [userName], [email], [password], [isActive], [isDeleted], [insertDate], [updateDate]) VALUES (36, N'd0c018b9-5473-415a-ba31-7cc333e6fb55', N'Zombie', N'Died', N'zombie', N'test@test.com', N'Testi.123', 1, 0, CAST(N'2021-12-30T01:00:37.903' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:deleted', 7, NULL)
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:failed:2021-12-28', 1, CAST(N'2022-01-28T13:23:43.220' AS DateTime))
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded', 8, NULL)
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded:2021-12-28', 8, CAST(N'2022-01-28T17:04:46.080' AS DateTime))
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded:2021-12-29', 4, CAST(N'2022-01-29T12:49:39.523' AS DateTime))
GO
SET IDENTITY_INSERT [HangFire].[Job] ON 

INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (16, 395, N'Scheduled', N'{"Type":"TalhaMarket.BackgroundJob.Managers.DelayedJob.UserWelcomeMailManager, TalhaMarket.BackgroundJob, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null","Method":"Process","ParameterTypes":"[\"System.Int32, System.Private.CoreLib, Version=5.0.0.0, Culture=neutral, PublicKeyToken=7cec85d7bea7798e\"]","Arguments":null}', N'["36"]', CAST(N'2021-12-29T22:00:38.257' AS DateTime), NULL)
SET IDENTITY_INSERT [HangFire].[Job] OFF
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (16, N'CurrentCulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (16, N'CurrentUICulture', N'"tr-TR"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (16, N'RetryCount', N'7')
GO
INSERT [HangFire].[Schema] ([Version]) VALUES (7)
GO
INSERT [HangFire].[Server] ([Id], [Data], [LastHeartbeat]) VALUES (N'talhaekrem:13668:7c05d03e-693e-41f5-ad06-497e367f771e', N'{"WorkerCount":20,"Queues":["default"],"StartedAt":"2021-12-31T13:54:27.528141Z"}', CAST(N'2021-12-31T13:54:27.877' AS DateTime))
INSERT [HangFire].[Server] ([Id], [Data], [LastHeartbeat]) VALUES (N'talhaekrem:2040:6a363fc9-22f0-4a31-af96-e572bc894387', N'{"WorkerCount":20,"Queues":["default"],"StartedAt":"2021-12-31T13:52:07.3824259Z"}', CAST(N'2021-12-31T13:52:38.137' AS DateTime))
INSERT [HangFire].[Server] ([Id], [Data], [LastHeartbeat]) VALUES (N'talhaekrem:7312:e06c38f3-d41b-48fb-be3c-305d6660df82', N'{"WorkerCount":20,"Queues":["default"],"StartedAt":"2021-12-31T13:49:45.7036608Z"}', CAST(N'2021-12-31T13:49:46.353' AS DateTime))
GO
INSERT [HangFire].[Set] ([Key], [Score], [Value], [ExpireAt]) VALUES (N'retries', 0, N'16', NULL)
INSERT [HangFire].[Set] ([Key], [Score], [Value], [ExpireAt]) VALUES (N'schedule', 1640960338, N'16', NULL)
GO
SET IDENTITY_INSERT [HangFire].[State] ON 

INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (367, 16, N'Scheduled', NULL, CAST(N'2021-12-29T22:00:38.297' AS DateTime), N'{"EnqueueAt":"2021-12-30T22:00:38.2332607Z","ScheduledAt":"2021-12-29T22:00:38.2333189Z"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (368, 16, N'Enqueued', N'Triggered by DelayedJobScheduler', CAST(N'2021-12-31T13:22:45.787' AS DateTime), N'{"EnqueuedAt":"2021-12-31T13:22:45.5844957Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (369, 16, N'Processing', NULL, CAST(N'2021-12-31T13:22:45.833' AS DateTime), N'{"StartedAt":"2021-12-31T13:22:45.8297456Z","ServerId":"talhaekrem:11564:ca38887f-33f1-452c-97b5-792676ed3b67","WorkerId":"cf0f9505-74ad-43ff-9099-20f5054ac2dd"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (370, 16, N'Failed', N'An exception occurred during performance of the job.', CAST(N'2021-12-31T13:22:50.993' AS DateTime), N'{"FailedAt":"2021-12-31T13:22:50.8877921Z","ExceptionType":"MailKit.Net.Smtp.SmtpCommandException","ExceptionMessage":"5.7.1 [2] Message rejected under suspicion of SPAM; https://ya.cc/1IrBc 1640956970-BiHmgQUeoL-MnP8hcoO","ExceptionDetails":"MailKit.Net.Smtp.SmtpCommandException: 5.7.1 [2] Message rejected under suspicion of SPAM; https://ya.cc/1IrBc 1640956970-BiHmgQUeoL-MnP8hcoO\r\n   at MailKit.Net.Smtp.SmtpClient.DataAsync(FormatOptions options, MimeMessage message, Int64 size, Boolean doAsync, CancellationToken cancellationToken, ITransferProgress progress)\r\n   at MailKit.Net.Smtp.SmtpClient.SendAsync(FormatOptions options, MimeMessage message, MailboxAddress sender, IList`1 recipients, Boolean doAsync, CancellationToken cancellationToken, ITransferProgress progress)\r\n   at MailKit.Net.Smtp.SmtpClient.SendAsync(FormatOptions options, MimeMessage message, MailboxAddress sender, IList`1 recipients, Boolean doAsync, CancellationToken cancellationToken, ITransferProgress progress)\r\n   at TalhaMarket.Service.MailSender.MailManager.SendWelcomeMail(Int32 userId) in C:\\Users\\talha\\source\\repos\\TalhaMarket\\TalhaMarket.Service\\MailSender\\MailManager.cs:line 48\r\n   at TalhaMarket.BackgroundJob.Managers.DelayedJob.UserWelcomeMailManager.Process(Int32 userId) in C:\\Users\\talha\\source\\repos\\TalhaMarket\\TalhaMarket.BackgroundJob\\Managers\\DelayedJob\\UserWelcomeMailManager.cs:line 20\r\n   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (371, 16, N'Scheduled', N'Retry attempt 1 of 10: 5.7.1 [2] Message rejected under suspicion of SPA…', CAST(N'2021-12-31T13:22:51.000' AS DateTime), N'{"EnqueueAt":"2021-12-31T13:23:08.8972522Z","ScheduledAt":"2021-12-31T13:22:50.8973160Z"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (372, 16, N'Enqueued', N'Triggered by DelayedJobScheduler', CAST(N'2021-12-31T13:23:15.853' AS DateTime), N'{"EnqueuedAt":"2021-12-31T13:23:15.8531216Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (373, 16, N'Processing', NULL, CAST(N'2021-12-31T13:23:15.860' AS DateTime), N'{"StartedAt":"2021-12-31T13:23:15.8589776Z","ServerId":"talhaekrem:11564:ca38887f-33f1-452c-97b5-792676ed3b67","WorkerId":"cf0f9505-74ad-43ff-9099-20f5054ac2dd"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (374, 16, N'Failed', N'An exception occurred during performance of the job.', CAST(N'2021-12-31T13:23:17.810' AS DateTime), N'{"FailedAt":"2021-12-31T13:23:17.8023450Z","ExceptionType":"MailKit.Net.Smtp.SmtpCommandException","ExceptionMessage":"5.7.1 [2] Message rejected under suspicion of SPAM; https://ya.cc/1IrBc 1640956997-ADwWM9UVB0-NGP8w6VC","ExceptionDetails":"MailKit.Net.Smtp.SmtpCommandException: 5.7.1 [2] Message rejected under suspicion of SPAM; https://ya.cc/1IrBc 1640956997-ADwWM9UVB0-NGP8w6VC\r\n   at MailKit.Net.Smtp.SmtpClient.DataAsync(FormatOptions options, MimeMessage message, Int64 size, Boolean doAsync, CancellationToken cancellationToken, ITransferProgress progress)\r\n   at MailKit.Net.Smtp.SmtpClient.SendAsync(FormatOptions options, MimeMessage message, MailboxAddress sender, IList`1 recipients, Boolean doAsync, CancellationToken cancellationToken, ITransferProgress progress)\r\n   at MailKit.Net.Smtp.SmtpClient.SendAsync(FormatOptions options, MimeMessage message, MailboxAddress sender, IList`1 recipients, Boolean doAsync, CancellationToken cancellationToken, ITransferProgress progress)\r\n   at TalhaMarket.Service.MailSender.MailManager.SendWelcomeMail(Int32 userId) in C:\\Users\\talha\\source\\repos\\TalhaMarket\\TalhaMarket.Service\\MailSender\\MailManager.cs:line 48\r\n   at TalhaMarket.BackgroundJob.Managers.DelayedJob.UserWelcomeMailManager.Process(Int32 userId) in C:\\Users\\talha\\source\\repos\\TalhaMarket\\TalhaMarket.BackgroundJob\\Managers\\DelayedJob\\UserWelcomeMailManager.cs:line 20\r\n   at System.Runtime.CompilerServices.TaskAwaiter.HandleNonSuccessAndDebuggerNotification(Task task)"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (375, 16, N'Scheduled', N'Retry attempt 2 of 10: 5.7.1 [2] Message rejected under suspicion of SPA…', CAST(N'2021-12-31T13:23:17.813' AS DateTime), N'{"EnqueueAt":"2021-12-31T13:24:03.8056729Z","ScheduledAt":"2021-12-31T13:23:17.8056740Z"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (376, 16, N'Enqueued', N'Triggered by DelayedJobScheduler', CAST(N'2021-12-31T13:24:10.140' AS DateTime), N'{"EnqueuedAt":"2021-12-31T13:24:09.9689433Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (377, 16, N'Processing', NULL, CAST(N'2021-12-31T13:24:10.213' AS DateTime), N'{"StartedAt":"2021-12-31T13:24:10.1884690Z","ServerId":"talhaekrem:5864:b9b3afc6-1a69-4f97-a598-23d46de8e200","WorkerId":"385b3a71-0346-4ff2-9ee2-ca8964614ec9"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (378, 16, N'Failed', N'An exception occurred during performance of the job.', CAST(N'2021-12-31T13:24:15.020' AS DateTime), N'{"FailedAt":"2021-12-31T13:24:14.9540049Z","ExceptionType":"MailKit.Net.Smtp.SmtpCommandException","ExceptionMessage":"5.7.1 [2] Message rejected under suspicion of SPAM; https://ya.cc/1IrBc 1640957054-x90vqfL5uq-ODPePgOq","ExceptionDetails":"MailKit.Net.Smtp.SmtpCommandException: 5.7.1 [2] Message rejected under suspicion of SPAM; https://ya.cc/1IrBc 1640957054-x90vqfL5uq-ODPePgOq\r\n   at MailKit.Net.Smtp.SmtpClient.DataAsync(FormatOptions options, MimeMessage message, Int64 size, Boolean doAsync, CancellationToken cancellationToken, ITransferProgress progress)\r\n   at MailKit.Net.Smtp.SmtpClient.SendAsync(FormatOptions options, MimeMessage message, MailboxAddress sender, IList`1 recipients, Boolean doAsync, CancellationToken cancellationToken, ITransferProgress progress)\r\n   at MailKit.Net.Smtp.SmtpClient.SendAsync(FormatOptions options, MimeMessage message, MailboxAddress sender, IList`1 recipients, Boolean doAsync, CancellationToken cancellationToken, ITransferProgress progress)\r\n   at TalhaMarket.Service.MailSender.MailManager.SendWelcomeMail(Int32 userId) in C:\\Users\\talha\\source\\repos\\TalhaMarket\\TalhaMarket.Service\\MailSender\\MailManager.cs:line 48\r\n   at TalhaMarket.BackgroundJob.Managers.DelayedJob.UserWelcomeMailManager.Process(Int32 userId) in C:\\Users\\talha\\source\\repos\\TalhaMarket\\TalhaMarket.BackgroundJob\\Managers\\DelayedJob\\UserWelcomeMailManager.cs:line 20\r\n   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (379, 16, N'Scheduled', N'Retry attempt 3 of 10: 5.7.1 [2] Message rejected under suspicion of SPA…', CAST(N'2021-12-31T13:24:15.023' AS DateTime), N'{"EnqueueAt":"2021-12-31T13:26:12.9624078Z","ScheduledAt":"2021-12-31T13:24:14.9624695Z"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (380, 16, N'Enqueued', N'Triggered by DelayedJobScheduler', CAST(N'2021-12-31T13:27:46.477' AS DateTime), N'{"EnqueuedAt":"2021-12-31T13:27:46.1578682Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (381, 16, N'Processing', NULL, CAST(N'2021-12-31T13:27:46.557' AS DateTime), N'{"StartedAt":"2021-12-31T13:27:46.5539013Z","ServerId":"talhaekrem:8892:c438b217-b582-453d-bd84-7b75d36f31d5","WorkerId":"da87cece-81a7-491f-b405-dbb8b93a86c5"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (382, 16, N'Failed', N'An exception occurred during performance of the job.', CAST(N'2021-12-31T13:27:51.433' AS DateTime), N'{"FailedAt":"2021-12-31T13:27:51.3498033Z","ExceptionType":"MailKit.Net.Smtp.SmtpCommandException","ExceptionMessage":"5.7.1 [2] Message rejected under suspicion of SPAM; https://ya.cc/1IrBc 1640957270-HtSnXrCTPi-RoQqS3V2","ExceptionDetails":"MailKit.Net.Smtp.SmtpCommandException: 5.7.1 [2] Message rejected under suspicion of SPAM; https://ya.cc/1IrBc 1640957270-HtSnXrCTPi-RoQqS3V2\r\n   at MailKit.Net.Smtp.SmtpClient.DataAsync(FormatOptions options, MimeMessage message, Int64 size, Boolean doAsync, CancellationToken cancellationToken, ITransferProgress progress)\r\n   at MailKit.Net.Smtp.SmtpClient.SendAsync(FormatOptions options, MimeMessage message, MailboxAddress sender, IList`1 recipients, Boolean doAsync, CancellationToken cancellationToken, ITransferProgress progress)\r\n   at MailKit.Net.Smtp.SmtpClient.SendAsync(FormatOptions options, MimeMessage message, MailboxAddress sender, IList`1 recipients, Boolean doAsync, CancellationToken cancellationToken, ITransferProgress progress)\r\n   at TalhaMarket.Service.MailSender.MailManager.SendWelcomeMail(Int32 userId) in C:\\Users\\talha\\source\\repos\\TalhaMarket\\TalhaMarket.Service\\MailSender\\MailManager.cs:line 48\r\n   at TalhaMarket.BackgroundJob.Managers.DelayedJob.UserWelcomeMailManager.Process(Int32 userId) in C:\\Users\\talha\\source\\repos\\TalhaMarket\\TalhaMarket.BackgroundJob\\Managers\\DelayedJob\\UserWelcomeMailManager.cs:line 20\r\n   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (383, 16, N'Scheduled', N'Retry attempt 4 of 10: 5.7.1 [2] Message rejected under suspicion of SPA…', CAST(N'2021-12-31T13:27:51.437' AS DateTime), N'{"EnqueueAt":"2021-12-31T13:30:47.3578679Z","ScheduledAt":"2021-12-31T13:27:51.3579353Z"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (384, 16, N'Enqueued', N'Triggered by DelayedJobScheduler', CAST(N'2021-12-31T13:32:28.200' AS DateTime), N'{"EnqueuedAt":"2021-12-31T13:32:27.9882298Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (385, 16, N'Processing', NULL, CAST(N'2021-12-31T13:32:28.257' AS DateTime), N'{"StartedAt":"2021-12-31T13:32:28.2401164Z","ServerId":"talhaekrem:12732:39cb63e9-1964-4d52-9b5f-86bec543668b","WorkerId":"28ace827-88c3-4fb5-8f3d-1464437fc523"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (386, 16, N'Failed', N'An exception occurred during performance of the job.', CAST(N'2021-12-31T13:32:32.603' AS DateTime), N'{"FailedAt":"2021-12-31T13:32:32.5212994Z","ExceptionType":"MailKit.Net.Smtp.SmtpCommandException","ExceptionMessage":"5.7.1 [2] Message rejected under suspicion of SPAM; https://ya.cc/1IrBc 1640957552-KMNnGeI7DE-WVPCd5f9","ExceptionDetails":"MailKit.Net.Smtp.SmtpCommandException: 5.7.1 [2] Message rejected under suspicion of SPAM; https://ya.cc/1IrBc 1640957552-KMNnGeI7DE-WVPCd5f9\r\n   at MailKit.Net.Smtp.SmtpClient.DataAsync(FormatOptions options, MimeMessage message, Int64 size, Boolean doAsync, CancellationToken cancellationToken, ITransferProgress progress)\r\n   at MailKit.Net.Smtp.SmtpClient.SendAsync(FormatOptions options, MimeMessage message, MailboxAddress sender, IList`1 recipients, Boolean doAsync, CancellationToken cancellationToken, ITransferProgress progress)\r\n   at MailKit.Net.Smtp.SmtpClient.SendAsync(FormatOptions options, MimeMessage message, MailboxAddress sender, IList`1 recipients, Boolean doAsync, CancellationToken cancellationToken, ITransferProgress progress)\r\n   at TalhaMarket.Service.MailSender.MailManager.SendWelcomeMail(Int32 userId) in C:\\Users\\talha\\source\\repos\\TalhaMarket\\TalhaMarket.Service\\MailSender\\MailManager.cs:line 48\r\n   at TalhaMarket.BackgroundJob.Managers.DelayedJob.UserWelcomeMailManager.Process(Int32 userId) in C:\\Users\\talha\\source\\repos\\TalhaMarket\\TalhaMarket.BackgroundJob\\Managers\\DelayedJob\\UserWelcomeMailManager.cs:line 20\r\n   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (387, 16, N'Scheduled', N'Retry attempt 5 of 10: 5.7.1 [2] Message rejected under suspicion of SPA…', CAST(N'2021-12-31T13:32:32.607' AS DateTime), N'{"EnqueueAt":"2021-12-31T13:37:18.5295096Z","ScheduledAt":"2021-12-31T13:32:32.5295842Z"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (388, 16, N'Enqueued', N'Triggered by DelayedJobScheduler', CAST(N'2021-12-31T13:42:53.373' AS DateTime), N'{"EnqueuedAt":"2021-12-31T13:42:52.9912818Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (389, 16, N'Processing', NULL, CAST(N'2021-12-31T13:42:53.463' AS DateTime), N'{"StartedAt":"2021-12-31T13:42:53.4543941Z","ServerId":"talhaekrem:12636:43510de3-c924-4f06-9ed8-fe4a7cef8ce7","WorkerId":"a27ef497-e1c2-4051-879c-017b2db8e963"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (390, 16, N'Failed', N'An exception occurred during performance of the job.', CAST(N'2021-12-31T13:42:58.480' AS DateTime), N'{"FailedAt":"2021-12-31T13:42:58.3658744Z","ExceptionType":"MailKit.Net.Smtp.SmtpCommandException","ExceptionMessage":"5.7.1 [2] Message rejected under suspicion of SPAM; https://ya.cc/1IrBc 1640958177-Vl2VYqFCYv-gvQiQYB5","ExceptionDetails":"MailKit.Net.Smtp.SmtpCommandException: 5.7.1 [2] Message rejected under suspicion of SPAM; https://ya.cc/1IrBc 1640958177-Vl2VYqFCYv-gvQiQYB5\r\n   at MailKit.Net.Smtp.SmtpClient.DataAsync(FormatOptions options, MimeMessage message, Int64 size, Boolean doAsync, CancellationToken cancellationToken, ITransferProgress progress)\r\n   at MailKit.Net.Smtp.SmtpClient.SendAsync(FormatOptions options, MimeMessage message, MailboxAddress sender, IList`1 recipients, Boolean doAsync, CancellationToken cancellationToken, ITransferProgress progress)\r\n   at MailKit.Net.Smtp.SmtpClient.SendAsync(FormatOptions options, MimeMessage message, MailboxAddress sender, IList`1 recipients, Boolean doAsync, CancellationToken cancellationToken, ITransferProgress progress)\r\n   at TalhaMarket.Service.MailSender.MailManager.SendWelcomeMail(Int32 userId) in C:\\Users\\talha\\source\\repos\\TalhaMarket\\TalhaMarket.Service\\MailSender\\MailManager.cs:line 48\r\n   at TalhaMarket.BackgroundJob.Managers.DelayedJob.UserWelcomeMailManager.Process(Int32 userId) in C:\\Users\\talha\\source\\repos\\TalhaMarket\\TalhaMarket.BackgroundJob\\Managers\\DelayedJob\\UserWelcomeMailManager.cs:line 20\r\n   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (391, 16, N'Scheduled', N'Retry attempt 6 of 10: 5.7.1 [2] Message rejected under suspicion of SPA…', CAST(N'2021-12-31T13:42:58.483' AS DateTime), N'{"EnqueueAt":"2021-12-31T13:54:20.3788869Z","ScheduledAt":"2021-12-31T13:42:58.3790029Z"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (392, 16, N'Enqueued', N'Triggered by DelayedJobScheduler', CAST(N'2021-12-31T13:54:28.607' AS DateTime), N'{"EnqueuedAt":"2021-12-31T13:54:28.3529894Z","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (393, 16, N'Processing', NULL, CAST(N'2021-12-31T13:54:28.667' AS DateTime), N'{"StartedAt":"2021-12-31T13:54:28.6522892Z","ServerId":"talhaekrem:13668:7c05d03e-693e-41f5-ad06-497e367f771e","WorkerId":"901c3b97-a6f8-44b7-ba87-c0559e67fd03"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (394, 16, N'Failed', N'An exception occurred during performance of the job.', CAST(N'2021-12-31T13:54:33.450' AS DateTime), N'{"FailedAt":"2021-12-31T13:54:33.3288682Z","ExceptionType":"MailKit.Net.Smtp.SmtpCommandException","ExceptionMessage":"5.7.1 [2] Message rejected under suspicion of SPAM; https://ya.cc/1IrBc 1640958872-BcYW0jlVtW-sWRiCAn4","ExceptionDetails":"MailKit.Net.Smtp.SmtpCommandException: 5.7.1 [2] Message rejected under suspicion of SPAM; https://ya.cc/1IrBc 1640958872-BcYW0jlVtW-sWRiCAn4\r\n   at MailKit.Net.Smtp.SmtpClient.DataAsync(FormatOptions options, MimeMessage message, Int64 size, Boolean doAsync, CancellationToken cancellationToken, ITransferProgress progress)\r\n   at MailKit.Net.Smtp.SmtpClient.SendAsync(FormatOptions options, MimeMessage message, MailboxAddress sender, IList`1 recipients, Boolean doAsync, CancellationToken cancellationToken, ITransferProgress progress)\r\n   at MailKit.Net.Smtp.SmtpClient.SendAsync(FormatOptions options, MimeMessage message, MailboxAddress sender, IList`1 recipients, Boolean doAsync, CancellationToken cancellationToken, ITransferProgress progress)\r\n   at TalhaMarket.Service.MailSender.MailManager.SendWelcomeMail(Int32 userId) in C:\\Users\\talha\\source\\repos\\TalhaMarket\\TalhaMarket.Service\\MailSender\\MailManager.cs:line 48\r\n   at TalhaMarket.BackgroundJob.Managers.DelayedJob.UserWelcomeMailManager.Process(Int32 userId) in C:\\Users\\talha\\source\\repos\\TalhaMarket\\TalhaMarket.BackgroundJob\\Managers\\DelayedJob\\UserWelcomeMailManager.cs:line 20\r\n   at System.Runtime.CompilerServices.TaskAwaiter.GetResult()"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (395, 16, N'Scheduled', N'Retry attempt 7 of 10: 5.7.1 [2] Message rejected under suspicion of SPA…', CAST(N'2021-12-31T13:54:33.453' AS DateTime), N'{"EnqueueAt":"2021-12-31T14:18:58.3432305Z","ScheduledAt":"2021-12-31T13:54:33.3433625Z"}')
SET IDENTITY_INSERT [HangFire].[State] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 31.12.2021 16:56:49 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 31.12.2021 16:56:49 ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 31.12.2021 16:56:49 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 31.12.2021 16:56:49 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 31.12.2021 16:56:49 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 31.12.2021 16:56:49 ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 31.12.2021 16:56:49 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_AspNetUserId]    Script Date: 31.12.2021 16:56:49 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UK_AspNetUserId] ON [dbo].[User]
(
	[AspNetUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_AggregatedCounter_ExpireAt]    Script Date: 31.12.2021 16:56:49 ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_AggregatedCounter_ExpireAt] ON [HangFire].[AggregatedCounter]
(
	[ExpireAt] ASC
)
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Hash_ExpireAt]    Script Date: 31.12.2021 16:56:49 ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Hash_ExpireAt] ON [HangFire].[Hash]
(
	[ExpireAt] ASC
)
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Job_ExpireAt]    Script Date: 31.12.2021 16:56:49 ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Job_ExpireAt] ON [HangFire].[Job]
(
	[ExpireAt] ASC
)
INCLUDE([StateName]) 
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_HangFire_Job_StateName]    Script Date: 31.12.2021 16:56:49 ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Job_StateName] ON [HangFire].[Job]
(
	[StateName] ASC
)
WHERE ([StateName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_List_ExpireAt]    Script Date: 31.12.2021 16:56:49 ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_List_ExpireAt] ON [HangFire].[List]
(
	[ExpireAt] ASC
)
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Server_LastHeartbeat]    Script Date: 31.12.2021 16:56:49 ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Server_LastHeartbeat] ON [HangFire].[Server]
(
	[LastHeartbeat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Set_ExpireAt]    Script Date: 31.12.2021 16:56:49 ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Set_ExpireAt] ON [HangFire].[Set]
(
	[ExpireAt] ASC
)
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_HangFire_Set_Score]    Script Date: 31.12.2021 16:56:49 ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Set_Score] ON [HangFire].[Set]
(
	[Key] ASC,
	[Score] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_isActive]  DEFAULT ((0)) FOR [isActive]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_isDeleted]  DEFAULT ((0)) FOR [isDeleted]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_insertDate]  DEFAULT (getdate()) FOR [insertDate]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_isActive]  DEFAULT ((0)) FOR [isActive]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_isDeleted]  DEFAULT ((0)) FOR [isDeleted]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_insertDate]  DEFAULT (getdate()) FOR [insertDate]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_isActive]  DEFAULT ((0)) FOR [isActive]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_isDeleted]  DEFAULT ((0)) FOR [isDeleted]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_insertDate]  DEFAULT (getdate()) FOR [insertDate]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Category]  WITH CHECK ADD  CONSTRAINT [FK_Category_User] FOREIGN KEY([insertedUser])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Category] CHECK CONSTRAINT [FK_Category_User]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([categoryId])
REFERENCES [dbo].[Category] ([id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Product] FOREIGN KEY([insertedUser])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Product]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_AspNetUsers1] FOREIGN KEY([AspNetUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_AspNetUsers1]
GO
ALTER TABLE [HangFire].[JobParameter]  WITH CHECK ADD  CONSTRAINT [FK_HangFire_JobParameter_Job] FOREIGN KEY([JobId])
REFERENCES [HangFire].[Job] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [HangFire].[JobParameter] CHECK CONSTRAINT [FK_HangFire_JobParameter_Job]
GO
ALTER TABLE [HangFire].[State]  WITH CHECK ADD  CONSTRAINT [FK_HangFire_State_Job] FOREIGN KEY([JobId])
REFERENCES [HangFire].[Job] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [HangFire].[State] CHECK CONSTRAINT [FK_HangFire_State_Job]
GO
USE [master]
GO
ALTER DATABASE [TalhaMarket] SET  READ_WRITE 
GO
