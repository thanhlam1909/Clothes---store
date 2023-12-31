USE [master]
GO
/****** Object:  Database [HIGH_WEBBANQUANAO]    Script Date: 12/9/2023 7:06:21 PM ******/
CREATE DATABASE [HIGH_WEBBANQUANAO]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HIGH_WEBBANQUANAO', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\HIGH_WEBBANQUANAO.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HIGH_WEBBANQUANAO_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\HIGH_WEBBANQUANAO_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [HIGH_WEBBANQUANAO] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HIGH_WEBBANQUANAO].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HIGH_WEBBANQUANAO] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HIGH_WEBBANQUANAO] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HIGH_WEBBANQUANAO] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HIGH_WEBBANQUANAO] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HIGH_WEBBANQUANAO] SET ARITHABORT OFF 
GO
ALTER DATABASE [HIGH_WEBBANQUANAO] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HIGH_WEBBANQUANAO] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HIGH_WEBBANQUANAO] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HIGH_WEBBANQUANAO] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HIGH_WEBBANQUANAO] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HIGH_WEBBANQUANAO] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HIGH_WEBBANQUANAO] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HIGH_WEBBANQUANAO] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HIGH_WEBBANQUANAO] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HIGH_WEBBANQUANAO] SET  ENABLE_BROKER 
GO
ALTER DATABASE [HIGH_WEBBANQUANAO] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HIGH_WEBBANQUANAO] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HIGH_WEBBANQUANAO] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HIGH_WEBBANQUANAO] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HIGH_WEBBANQUANAO] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HIGH_WEBBANQUANAO] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HIGH_WEBBANQUANAO] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HIGH_WEBBANQUANAO] SET RECOVERY FULL 
GO
ALTER DATABASE [HIGH_WEBBANQUANAO] SET  MULTI_USER 
GO
ALTER DATABASE [HIGH_WEBBANQUANAO] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HIGH_WEBBANQUANAO] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HIGH_WEBBANQUANAO] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HIGH_WEBBANQUANAO] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HIGH_WEBBANQUANAO] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HIGH_WEBBANQUANAO] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'HIGH_WEBBANQUANAO', N'ON'
GO
ALTER DATABASE [HIGH_WEBBANQUANAO] SET QUERY_STORE = ON
GO
ALTER DATABASE [HIGH_WEBBANQUANAO] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [HIGH_WEBBANQUANAO]
GO
/****** Object:  Table [dbo].[CartDetails]    Script Date: 12/9/2023 7:06:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartDetails](
	[CartDetailID] [int] IDENTITY(1,1) NOT NULL,
	[CartID] [int] NULL,
	[ProductID] [int] NULL,
	[Quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CartDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Carts]    Script Date: 12/9/2023 7:06:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carts](
	[CartID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](50) NULL,
	[CreatedDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[CartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FavoriteProducts]    Script Date: 12/9/2023 7:06:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FavoriteProducts](
	[FavoriteID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NULL,
	[UserID] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[FavoriteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InvoiceDetails]    Script Date: 12/9/2023 7:06:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvoiceDetails](
	[InvoiceDetailID] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[UnitPrice] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[InvoiceDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoices]    Script Date: 12/9/2023 7:06:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoices](
	[InvoiceID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](50) NOT NULL,
	[InvoiceDate] [datetime] NOT NULL,
	[TotalAmount] [decimal](10, 2) NOT NULL,
	[ShippingFee] [decimal](10, 2) NOT NULL,
	[PaymentMethod] [nvarchar](50) NOT NULL,
	[StatusOrder] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[InvoiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategories]    Script Date: 12/9/2023 7:06:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NOT NULL,
	[Gender] [nvarchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategoryMapping]    Script Date: 12/9/2023 7:06:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategoryMapping](
	[ProductID] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 12/9/2023 7:06:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[ProductImage] [nvarchar](255) NOT NULL,
	[Price] [decimal](10, 2) NOT NULL,
	[StockQuantity] [int] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[Material] [nvarchar](50) NOT NULL,
	[Size] [nvarchar](20) NOT NULL,
	[Color] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PromotionCodes]    Script Date: 12/9/2023 7:06:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PromotionCodes](
	[PromotionCodeID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[Discount] [decimal](5, 2) NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PromotionCodeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PromotionPrograms]    Script Date: 12/9/2023 7:06:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PromotionPrograms](
	[PromotionProgramID] [int] IDENTITY(1,1) NOT NULL,
	[ProgramName] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PromotionProgramID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PromotionTitles]    Script Date: 12/9/2023 7:06:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PromotionTitles](
	[PromotionTitleID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[PromotionProgramID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PromotionTitleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Review]    Script Date: 12/9/2023 7:06:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Review](
	[ReviewID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NULL,
	[UserID] [nvarchar](50) NULL,
	[ReviewText] [nvarchar](max) NOT NULL,
	[Rating] [int] NOT NULL,
	[Email] [nvarchar](255) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ReviewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 12/9/2023 7:06:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [nvarchar](50) NOT NULL,
	[Username] [nvarchar](255) NOT NULL,
	[Password] [nvarchar](255) NOT NULL,
	[Email] [nvarchar](255) NOT NULL,
	[FullName] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[PhoneNumber] [nvarchar](10) NULL,
	[UserType] [nvarchar](50) NULL,
	[NumericID] [int] IDENTITY(1,1) NOT NULL,
	[ComputedUserID]  AS (([UserType]+'_')+CONVERT([nvarchar](10),[NumericID])) PERSISTED,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CartDetails] ON 

INSERT [dbo].[CartDetails] ([CartDetailID], [CartID], [ProductID], [Quantity]) VALUES (1, NULL, 1028, 1)
INSERT [dbo].[CartDetails] ([CartDetailID], [CartID], [ProductID], [Quantity]) VALUES (2, NULL, 1027, 1)
INSERT [dbo].[CartDetails] ([CartDetailID], [CartID], [ProductID], [Quantity]) VALUES (3, NULL, 1, 1)
INSERT [dbo].[CartDetails] ([CartDetailID], [CartID], [ProductID], [Quantity]) VALUES (4, NULL, 6, 1)
INSERT [dbo].[CartDetails] ([CartDetailID], [CartID], [ProductID], [Quantity]) VALUES (5, NULL, 2, 1)
INSERT [dbo].[CartDetails] ([CartDetailID], [CartID], [ProductID], [Quantity]) VALUES (6, NULL, 1028, 1)
INSERT [dbo].[CartDetails] ([CartDetailID], [CartID], [ProductID], [Quantity]) VALUES (7, NULL, 1028, 2)
INSERT [dbo].[CartDetails] ([CartDetailID], [CartID], [ProductID], [Quantity]) VALUES (8, NULL, 1027, 1)
INSERT [dbo].[CartDetails] ([CartDetailID], [CartID], [ProductID], [Quantity]) VALUES (9, NULL, 1027, 1)
INSERT [dbo].[CartDetails] ([CartDetailID], [CartID], [ProductID], [Quantity]) VALUES (10, NULL, 1028, 4)
INSERT [dbo].[CartDetails] ([CartDetailID], [CartID], [ProductID], [Quantity]) VALUES (11, NULL, 1028, 1)
INSERT [dbo].[CartDetails] ([CartDetailID], [CartID], [ProductID], [Quantity]) VALUES (12, 2, 1027, 1)
INSERT [dbo].[CartDetails] ([CartDetailID], [CartID], [ProductID], [Quantity]) VALUES (13, 2, 1028, 1)
INSERT [dbo].[CartDetails] ([CartDetailID], [CartID], [ProductID], [Quantity]) VALUES (14, 2, 1026, 4)
INSERT [dbo].[CartDetails] ([CartDetailID], [CartID], [ProductID], [Quantity]) VALUES (15, NULL, 1028, 1)
INSERT [dbo].[CartDetails] ([CartDetailID], [CartID], [ProductID], [Quantity]) VALUES (16, NULL, 1028, 1)
INSERT [dbo].[CartDetails] ([CartDetailID], [CartID], [ProductID], [Quantity]) VALUES (17, NULL, 1029, 2)
INSERT [dbo].[CartDetails] ([CartDetailID], [CartID], [ProductID], [Quantity]) VALUES (20, NULL, 1029, 3)
INSERT [dbo].[CartDetails] ([CartDetailID], [CartID], [ProductID], [Quantity]) VALUES (21, NULL, 1028, 2)
INSERT [dbo].[CartDetails] ([CartDetailID], [CartID], [ProductID], [Quantity]) VALUES (23, NULL, 1029, 2)
INSERT [dbo].[CartDetails] ([CartDetailID], [CartID], [ProductID], [Quantity]) VALUES (24, NULL, 1029, 1)
INSERT [dbo].[CartDetails] ([CartDetailID], [CartID], [ProductID], [Quantity]) VALUES (25, NULL, 1028, 1)
INSERT [dbo].[CartDetails] ([CartDetailID], [CartID], [ProductID], [Quantity]) VALUES (26, NULL, 1029, 1)
INSERT [dbo].[CartDetails] ([CartDetailID], [CartID], [ProductID], [Quantity]) VALUES (27, NULL, 1028, 1)
INSERT [dbo].[CartDetails] ([CartDetailID], [CartID], [ProductID], [Quantity]) VALUES (28, NULL, 1029, 1)
INSERT [dbo].[CartDetails] ([CartDetailID], [CartID], [ProductID], [Quantity]) VALUES (29, NULL, 1028, 1)
INSERT [dbo].[CartDetails] ([CartDetailID], [CartID], [ProductID], [Quantity]) VALUES (1018, NULL, 7, 28)
INSERT [dbo].[CartDetails] ([CartDetailID], [CartID], [ProductID], [Quantity]) VALUES (1019, NULL, 1029, 7)
SET IDENTITY_INSERT [dbo].[CartDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Carts] ON 

INSERT [dbo].[Carts] ([CartID], [UserID], [CreatedDate]) VALUES (2, N'user_10', CAST(N'2023-09-03' AS Date))
SET IDENTITY_INSERT [dbo].[Carts] OFF
GO
SET IDENTITY_INSERT [dbo].[InvoiceDetails] ON 

INSERT [dbo].[InvoiceDetails] ([InvoiceDetailID], [InvoiceID], [ProductID], [Quantity], [UnitPrice]) VALUES (1, 1, 1029, 3, CAST(0.03 AS Decimal(10, 2)))
INSERT [dbo].[InvoiceDetails] ([InvoiceDetailID], [InvoiceID], [ProductID], [Quantity], [UnitPrice]) VALUES (2, 1, 1028, 2, CAST(0.01 AS Decimal(10, 2)))
INSERT [dbo].[InvoiceDetails] ([InvoiceDetailID], [InvoiceID], [ProductID], [Quantity], [UnitPrice]) VALUES (3, 6, 1029, 2, CAST(0.03 AS Decimal(10, 2)))
INSERT [dbo].[InvoiceDetails] ([InvoiceDetailID], [InvoiceID], [ProductID], [Quantity], [UnitPrice]) VALUES (4, 7, 1029, 1, CAST(0.03 AS Decimal(10, 2)))
INSERT [dbo].[InvoiceDetails] ([InvoiceDetailID], [InvoiceID], [ProductID], [Quantity], [UnitPrice]) VALUES (5, 9, 1028, 1, CAST(0.01 AS Decimal(10, 2)))
INSERT [dbo].[InvoiceDetails] ([InvoiceDetailID], [InvoiceID], [ProductID], [Quantity], [UnitPrice]) VALUES (6, 9, 1029, 1, CAST(0.03 AS Decimal(10, 2)))
INSERT [dbo].[InvoiceDetails] ([InvoiceDetailID], [InvoiceID], [ProductID], [Quantity], [UnitPrice]) VALUES (7, 11, 1028, 1, CAST(0.01 AS Decimal(10, 2)))
INSERT [dbo].[InvoiceDetails] ([InvoiceDetailID], [InvoiceID], [ProductID], [Quantity], [UnitPrice]) VALUES (8, 11, 1029, 1, CAST(0.03 AS Decimal(10, 2)))
INSERT [dbo].[InvoiceDetails] ([InvoiceDetailID], [InvoiceID], [ProductID], [Quantity], [UnitPrice]) VALUES (9, 12, 1028, 1, CAST(0.01 AS Decimal(10, 2)))
INSERT [dbo].[InvoiceDetails] ([InvoiceDetailID], [InvoiceID], [ProductID], [Quantity], [UnitPrice]) VALUES (10, 12, 7, 28, CAST(39.95 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[InvoiceDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Invoices] ON 

INSERT [dbo].[Invoices] ([InvoiceID], [UserID], [InvoiceDate], [TotalAmount], [ShippingFee], [PaymentMethod], [StatusOrder]) VALUES (1, N'user_14', CAST(N'2023-09-06T01:09:54.467' AS DateTime), CAST(1.11 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), N'Phương thức thanh toán', N'Xác nhận')
INSERT [dbo].[Invoices] ([InvoiceID], [UserID], [InvoiceDate], [TotalAmount], [ShippingFee], [PaymentMethod], [StatusOrder]) VALUES (6, N'user_14', CAST(N'2023-09-06T01:31:27.660' AS DateTime), CAST(1.06 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), N'Payoneer', N'Đã thanh toán')
INSERT [dbo].[Invoices] ([InvoiceID], [UserID], [InvoiceDate], [TotalAmount], [ShippingFee], [PaymentMethod], [StatusOrder]) VALUES (7, N'user_14', CAST(N'2023-09-06T01:36:48.330' AS DateTime), CAST(1.03 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), N'Paypal', N'Chờ xác nhận')
INSERT [dbo].[Invoices] ([InvoiceID], [UserID], [InvoiceDate], [TotalAmount], [ShippingFee], [PaymentMethod], [StatusOrder]) VALUES (9, N'user_14', CAST(N'2023-09-06T01:43:19.233' AS DateTime), CAST(1.04 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), N'Payoneer', N'Chờ xác nhận')
INSERT [dbo].[Invoices] ([InvoiceID], [UserID], [InvoiceDate], [TotalAmount], [ShippingFee], [PaymentMethod], [StatusOrder]) VALUES (11, N'user_14', CAST(N'2023-09-06T11:06:38.543' AS DateTime), CAST(1.04 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), N'Paypal', N'Chờ xác nhận')
INSERT [dbo].[Invoices] ([InvoiceID], [UserID], [InvoiceDate], [TotalAmount], [ShippingFee], [PaymentMethod], [StatusOrder]) VALUES (12, N'user_14', CAST(N'2023-12-06T13:48:44.483' AS DateTime), CAST(1119.61 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), N'Paypal', N'Chờ xác nhận')
SET IDENTITY_INSERT [dbo].[Invoices] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductCategories] ON 

INSERT [dbo].[ProductCategories] ([CategoryID], [CategoryName], [Gender]) VALUES (1, N'Áo thunm', N'Nữ')
INSERT [dbo].[ProductCategories] ([CategoryID], [CategoryName], [Gender]) VALUES (2, N'Váy dự tiệc', N'Nữ')
INSERT [dbo].[ProductCategories] ([CategoryID], [CategoryName], [Gender]) VALUES (3, N'Quần jeans', N'Nữ')
INSERT [dbo].[ProductCategories] ([CategoryID], [CategoryName], [Gender]) VALUES (4, N'Áo len', N'Nam')
INSERT [dbo].[ProductCategories] ([CategoryID], [CategoryName], [Gender]) VALUES (5, N'Đầm maxi', N'Nữ')
INSERT [dbo].[ProductCategories] ([CategoryID], [CategoryName], [Gender]) VALUES (2009, N'Áo thund', N'Nam')
INSERT [dbo].[ProductCategories] ([CategoryID], [CategoryName], [Gender]) VALUES (2012, N'Áo thund', N'Nam')
INSERT [dbo].[ProductCategories] ([CategoryID], [CategoryName], [Gender]) VALUES (2013, N'Áo thund', N'Nam')
SET IDENTITY_INSERT [dbo].[ProductCategories] OFF
GO
INSERT [dbo].[ProductCategoryMapping] ([ProductID], [CategoryID]) VALUES (1, 1)
INSERT [dbo].[ProductCategoryMapping] ([ProductID], [CategoryID]) VALUES (2, 2)
INSERT [dbo].[ProductCategoryMapping] ([ProductID], [CategoryID]) VALUES (3, 3)
INSERT [dbo].[ProductCategoryMapping] ([ProductID], [CategoryID]) VALUES (4, 4)
INSERT [dbo].[ProductCategoryMapping] ([ProductID], [CategoryID]) VALUES (5, 5)
INSERT [dbo].[ProductCategoryMapping] ([ProductID], [CategoryID]) VALUES (6, 1)
INSERT [dbo].[ProductCategoryMapping] ([ProductID], [CategoryID]) VALUES (7, 2)
INSERT [dbo].[ProductCategoryMapping] ([ProductID], [CategoryID]) VALUES (8, 3)
INSERT [dbo].[ProductCategoryMapping] ([ProductID], [CategoryID]) VALUES (9, 4)
INSERT [dbo].[ProductCategoryMapping] ([ProductID], [CategoryID]) VALUES (10, 5)
INSERT [dbo].[ProductCategoryMapping] ([ProductID], [CategoryID]) VALUES (11, 1)
INSERT [dbo].[ProductCategoryMapping] ([ProductID], [CategoryID]) VALUES (12, 2)
INSERT [dbo].[ProductCategoryMapping] ([ProductID], [CategoryID]) VALUES (13, 3)
INSERT [dbo].[ProductCategoryMapping] ([ProductID], [CategoryID]) VALUES (14, 4)
INSERT [dbo].[ProductCategoryMapping] ([ProductID], [CategoryID]) VALUES (15, 5)
INSERT [dbo].[ProductCategoryMapping] ([ProductID], [CategoryID]) VALUES (16, 1)
INSERT [dbo].[ProductCategoryMapping] ([ProductID], [CategoryID]) VALUES (17, 2)
INSERT [dbo].[ProductCategoryMapping] ([ProductID], [CategoryID]) VALUES (18, 3)
INSERT [dbo].[ProductCategoryMapping] ([ProductID], [CategoryID]) VALUES (19, 4)
INSERT [dbo].[ProductCategoryMapping] ([ProductID], [CategoryID]) VALUES (20, 5)
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ProductImage], [Price], [StockQuantity], [CreatedAt], [Material], [Size], [Color]) VALUES (1, N'Áo thun nam trắng', N'Áo thun nam màu trắng', N'images.jfif', CAST(16.01 AS Decimal(10, 2)), 100, CAST(N'2023-08-28T17:31:59.547' AS DateTime), N'Cotton', N'S', N'Đỏ')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ProductImage], [Price], [StockQuantity], [CreatedAt], [Material], [Size], [Color]) VALUES (2, N'Váy dự tiệc đỏ', N'Váy dự tiệc màu đỏ', N'dam-xoe-tieu-thu-mau-do-du-tiec-sang-trong-72218j.webp', CAST(49.99 AS Decimal(10, 2)), 50, CAST(N'2023-08-28T17:31:59.547' AS DateTime), N'Satin', N'M', N'Red')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ProductImage], [Price], [StockQuantity], [CreatedAt], [Material], [Size], [Color]) VALUES (3, N'Quần jeans unisex xanh', N'Quần jeans unisex màu xanh', N'tải xuống (11).jfif', CAST(34.50 AS Decimal(10, 2)), 75, CAST(N'2023-08-28T17:31:59.547' AS DateTime), N'Denim', N'XL', N'Blue')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ProductImage], [Price], [StockQuantity], [CreatedAt], [Material], [Size], [Color]) VALUES (4, N'Áo len nam đen', N'Áo len nam màu đen', N'O1CN01uxBclH21edCwNEt93_!!3501997010-0-cib.jpg', CAST(29.95 AS Decimal(10, 2)), 80, CAST(N'2023-08-28T17:31:59.547' AS DateTime), N'Wool', N'M', N'Black')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ProductImage], [Price], [StockQuantity], [CreatedAt], [Material], [Size], [Color]) VALUES (5, N'Đầm maxi nữ hồng', N'Đầm maxi nữ màu hồng', N'vay-suong-xoe-cardina__4__3bf908918aa74c0abd4aadc58d53c67f_c7c555dd7d3d409faea2b37b3e09abac_large.webp', CAST(55.00 AS Decimal(10, 2)), 60, CAST(N'2023-08-28T17:31:59.547' AS DateTime), N'Chiffon', N'S', N'Pink')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ProductImage], [Price], [StockQuantity], [CreatedAt], [Material], [Size], [Color]) VALUES (6, N'Áo polo nam đỏ', N'Áo polo nam màu đỏ', N'23_h2_mt_a1159-0040_eas_ps_on_fv_3.webp', CAST(27.50 AS Decimal(10, 2)), 90, CAST(N'2023-08-28T17:31:59.547' AS DateTime), N'Cotton', N'M', N'Red')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ProductImage], [Price], [StockQuantity], [CreatedAt], [Material], [Size], [Color]) VALUES (7, N'Váy trắng phối ren', N'Váy trắng phối ren dịu dàng', N'S7d3a411285274668b5358899893836c9M.jpg_720x720q80.jpg_.webp', CAST(39.95 AS Decimal(10, 2)), 40, CAST(N'2023-08-28T17:31:59.547' AS DateTime), N'Lace', N'S', N'White')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ProductImage], [Price], [StockQuantity], [CreatedAt], [Material], [Size], [Color]) VALUES (8, N'Quần kaki unisex beige', N'Quần kaki unisex màu beige', N'1e15003369e5c8292812158fb9aca31a.jfif', CAST(38.75 AS Decimal(10, 2)), 65, CAST(N'2023-08-28T17:31:59.547' AS DateTime), N'Cotton Blend', N'XS', N'Beige')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ProductImage], [Price], [StockQuantity], [CreatedAt], [Material], [Size], [Color]) VALUES (9, N'Áo len nữ xanh', N'Áo len nữ màu xanh', N'8ee5e98fac97c7a639a02510b0f243d6.jpg.webp', CAST(32.99 AS Decimal(10, 2)), 70, CAST(N'2023-08-28T17:31:59.547' AS DateTime), N'Wool', N'L', N'Green')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ProductImage], [Price], [StockQuantity], [CreatedAt], [Material], [Size], [Color]) VALUES (10, N'Đầm hoa dạ hội', N'Đầm hoa dạ hội sang trọng', N'o1cn01a365qs2hrwxmmlqil2852139.webp', CAST(59.50 AS Decimal(10, 2)), 30, CAST(N'2023-08-28T17:31:59.547' AS DateTime), N'Silk', N'M', N'Black')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ProductImage], [Price], [StockQuantity], [CreatedAt], [Material], [Size], [Color]) VALUES (11, N'Áo sơ mi trắng cổ điển', N'Áo sơ mi trắng kiểu cổ điển', N'shopping (1).webp', CAST(29.99 AS Decimal(10, 2)), 85, CAST(N'2023-08-28T17:31:59.547' AS DateTime), N'Cotton', N'S', N'White')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ProductImage], [Price], [StockQuantity], [CreatedAt], [Material], [Size], [Color]) VALUES (12, N'Chân váy đen dự tiệc', N'Chân váy đen thích hợp cho dự tiệc', N'shopping.webp', CAST(45.00 AS Decimal(10, 2)), 55, CAST(N'2023-08-28T17:31:59.547' AS DateTime), N'Silk', N'M', N'Black')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ProductImage], [Price], [StockQuantity], [CreatedAt], [Material], [Size], [Color]) VALUES (13, N'Quần jogger unisex xám', N'Quần jogger unisex màu xám', N'Quan-jogger-1b-Grey-3-ZiZoou-Store.webp', CAST(33.50 AS Decimal(10, 2)), 70, CAST(N'2023-08-28T17:31:59.547' AS DateTime), N'Cotton Blend', N'L', N'Gray')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ProductImage], [Price], [StockQuantity], [CreatedAt], [Material], [Size], [Color]) VALUES (14, N'Áo len nữ họa tiết', N'Áo len nữ với họa tiết đẹp mắt', N'20210125_RaoYsMIfqCimL4Oc3EM0h8wT.jpg', CAST(37.95 AS Decimal(10, 2)), 60, CAST(N'2023-08-28T17:31:59.547' AS DateTime), N'Wool', N'M', N'Patterned')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ProductImage], [Price], [StockQuantity], [CreatedAt], [Material], [Size], [Color]) VALUES (15, N'Đầm màu pastel', N'Đầm màu pastel tinh tế', N'o1cn01dgwcvp2nwlun9fczo2259019.webp', CAST(52.50 AS Decimal(10, 2)), 45, CAST(N'2023-08-28T17:31:59.547' AS DateTime), N'Chiffon', N'S', N'Pastel')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ProductImage], [Price], [StockQuantity], [CreatedAt], [Material], [Size], [Color]) VALUES (16, N'Áo hoodie nam đen', N'Áo hoodie nam màu đen', N'c3678c66-bb58-2000-82bb-001a3939483b.jpg', CAST(42.50 AS Decimal(10, 2)), 60, CAST(N'2023-08-28T17:31:59.547' AS DateTime), N'Cotton Blend', N'XL', N'Black')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ProductImage], [Price], [StockQuantity], [CreatedAt], [Material], [Size], [Color]) VALUES (17, N'Váy hoa dạ hội', N'Váy hoa dạ hội sang trọng', N'o1cn01inqe8y2hjergimli50itempi.webp', CAST(68.00 AS Decimal(10, 2)), 25, CAST(N'2023-08-28T17:31:59.547' AS DateTime), N'Silk', N'L', N'Floral')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ProductImage], [Price], [StockQuantity], [CreatedAt], [Material], [Size], [Color]) VALUES (18, N'Quần thể thao unisex đen', N'Quần thể thao unisex màu đen', N'167531-quan-the-thao-nam-nu-chat-lieu-chan-cua-cao-cap-167530-vn.jpg', CAST(28.75 AS Decimal(10, 2)), 80, CAST(N'2023-08-28T17:31:59.547' AS DateTime), N'Polyester', N'M', N'Black')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ProductImage], [Price], [StockQuantity], [CreatedAt], [Material], [Size], [Color]) VALUES (19, N'Áo len nữ trơn', N'Áo len nữ màu trơn', N'37025904_81_b_1_1.webp', CAST(34.99 AS Decimal(10, 2)), 70, CAST(N'2023-08-28T17:31:59.547' AS DateTime), N'Wool', N'S', N'Gray')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ProductImage], [Price], [StockQuantity], [CreatedAt], [Material], [Size], [Color]) VALUES (20, N'Đầm xanh pastel', N'Đầm xanh pastel dịu dàng', N'shopping (2).webp', CAST(56.75 AS Decimal(10, 2)), 35, CAST(N'2023-08-28T17:31:59.547' AS DateTime), N'Chiffon', N'M', N'Pastel Green')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ProductImage], [Price], [StockQuantity], [CreatedAt], [Material], [Size], [Color]) VALUES (1026, N'da', N'da', N'images.jfif', CAST(0.02 AS Decimal(10, 2)), 100, CAST(N'2023-09-02T18:05:03.183' AS DateTime), N'Cotton', N'XS', N'Đỏ')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ProductImage], [Price], [StockQuantity], [CreatedAt], [Material], [Size], [Color]) VALUES (1027, N'da', N'da', N'167531-quan-the-thao-nam-nu-chat-lieu-chan-cua-cao-cap-167530-vn.jpg', CAST(0.03 AS Decimal(10, 2)), 100, CAST(N'2023-09-02T18:06:11.317' AS DateTime), N'Cotton', N'XS', N'Đỏ')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ProductImage], [Price], [StockQuantity], [CreatedAt], [Material], [Size], [Color]) VALUES (1028, N'da', N'áo nam', N'o1cn01a365qs2hrwxmmlqil2852139.webp', CAST(0.01 AS Decimal(10, 2)), 100, CAST(N'2023-09-02T18:07:40.910' AS DateTime), N'Cotton', N'XS', N'Đỏ')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Description], [ProductImage], [Price], [StockQuantity], [CreatedAt], [Material], [Size], [Color]) VALUES (1029, N'Quần thể thao nam', N'Quần thể thao nam mềm mại', N'167531-quan-the-thao-nam-nu-chat-lieu-chan-cua-cao-cap-167530-vn.jpg', CAST(0.03 AS Decimal(10, 2)), 100, CAST(N'2023-09-05T22:52:43.307' AS DateTime), N'Cotton', N'XS', N'Đỏ')
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [Username], [Password], [Email], [FullName], [Address], [PhoneNumber], [UserType], [NumericID]) VALUES (N'_0', N'user12', N'Tuthan123@', N'ghenhot99@gmail.com', N'thanhlam', N'295 Phạm Thế Hiển Phường 3 Quận 8 TP.Hồ Chí Minh', N'1234567890', N'user', 7)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Email], [FullName], [Address], [PhoneNumber], [UserType], [NumericID]) VALUES (N'admin1', N'admin_user', N'adminpass', N'admin@example.com', N'Admin User', N'789 Oak St', N'5559876543', N'admin', 3)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Email], [FullName], [Address], [PhoneNumber], [UserType], [NumericID]) VALUES (N'admin2', N'admin2_user', N'secretadmin', N'admin2@example.com', N'Administrator 2', N'456 Birch St', N'5559998765', N'admin', 6)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Email], [FullName], [Address], [PhoneNumber], [UserType], [NumericID]) VALUES (N'user_10', N'user1', N'Tuthan123@', N'ghenhot212@gmail.com', N'thanhlam', N'295 Phạm Thế Hiển Phường 3 Quận 8 TP.Hồ Chí Minh', N'1234567890', N'user', 13)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Email], [FullName], [Address], [PhoneNumber], [UserType], [NumericID]) VALUES (N'user_14', N'user19', N'Tuthan123@@', N'ghenhot929@gmail.com', N'thanhlam2', N'295 Phạm Thế Hiển Phường 3 Quận 8 TP.Hồ Chí Minh', N'1234567890', N'User', 14)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Email], [FullName], [Address], [PhoneNumber], [UserType], [NumericID]) VALUES (N'user_15', N'user1', N'Tuthan123@', N'ghenhot99@gmail.com', N'thanhlam', N'295 Phạm Thế Hiển Phường 3 Quận 8 TP.Hồ Chí Minh', N'1234567890', N'User', 15)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Email], [FullName], [Address], [PhoneNumber], [UserType], [NumericID]) VALUES (N'user_16', N'user1235', N'Tuthan123@', N'3@gmail.com', N'thanhlam', N'295 Phạm Thế Hiển Phường 3 Quận 8 TP.Hồ Chí Minh', N'1234567890', N'User', 16)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Email], [FullName], [Address], [PhoneNumber], [UserType], [NumericID]) VALUES (N'user_17', N'user199', N'Tuthan123@', N'33@gmail.com', N'thanhlam', N'295 Phạm Thế Hiển Phường 3 Quận 8 TP.Hồ Chí Minh', N'1234567890', N'User', 17)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Email], [FullName], [Address], [PhoneNumber], [UserType], [NumericID]) VALUES (N'user_18', N'user19s', N'Tuthan123@', N'ghenhot99ss@gmail.com', N'thanhlam', N'295 Phạm Thế Hiển Phường 3 Quận 8 TP.Hồ Chí Minh', N'1234567890', N'User', 18)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Email], [FullName], [Address], [PhoneNumber], [UserType], [NumericID]) VALUES (N'user_8', N'user122s', N'Tuthan123@', N'ghenhot992@gmail.com', N'thanhlam', N'295 Phạm Thế Hiển Phường 3 Quận 8 TP.Hồ Chí Minh', N'1234567890', N'user', 8)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Email], [FullName], [Address], [PhoneNumber], [UserType], [NumericID]) VALUES (N'user_9', N'user123', N'password1', N'ghenhot993@gmail.com', N'thanhlam', N'295 Phạm Thế Hiển Phường 3 Quận 8 TP.Hồ Chí Minh', N'1234567890', N'user', 9)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Email], [FullName], [Address], [PhoneNumber], [UserType], [NumericID]) VALUES (N'user1', N'john_doe', N'password123', N'john@example.com', N'John Doe', N'123 Main St', N'5551234567', N'user', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Email], [FullName], [Address], [PhoneNumber], [UserType], [NumericID]) VALUES (N'user2', N'jane_smith', N'abc456', N'jane@example.com', N'Jane Smith', N'456 Elm St', N'5555678901', N'user', 2)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Email], [FullName], [Address], [PhoneNumber], [UserType], [NumericID]) VALUES (N'user3', N'sam_johnson', N'securepass', N'sam@example.com', N'Sam Johnson', N'789 Maple St', N'5557890123', N'user', 4)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Email], [FullName], [Address], [PhoneNumber], [UserType], [NumericID]) VALUES (N'user4', N'linda_anderson', N'hello123', N'linda@example.com', N'Linda Anderson', N'567 Pine St', N'5554321098', N'user', 5)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UC_Favorite]    Script Date: 12/9/2023 7:06:22 PM ******/
ALTER TABLE [dbo].[FavoriteProducts] ADD  CONSTRAINT [UC_Favorite] UNIQUE NONCLUSTERED 
(
	[ProductID] ASC,
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Invoices] ADD  DEFAULT ((0.00)) FOR [ShippingFee]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Review] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ('user') FOR [UserType]
GO
ALTER TABLE [dbo].[CartDetails]  WITH CHECK ADD FOREIGN KEY([CartID])
REFERENCES [dbo].[Carts] ([CartID])
GO
ALTER TABLE [dbo].[CartDetails]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[FavoriteProducts]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[InvoiceDetails]  WITH CHECK ADD  CONSTRAINT [FK_InvoiceDetails_Invoices] FOREIGN KEY([InvoiceID])
REFERENCES [dbo].[Invoices] ([InvoiceID])
GO
ALTER TABLE [dbo].[InvoiceDetails] CHECK CONSTRAINT [FK_InvoiceDetails_Invoices]
GO
ALTER TABLE [dbo].[ProductCategoryMapping]  WITH CHECK ADD  CONSTRAINT [FK_ProductCategory_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[ProductCategories] ([CategoryID])
GO
ALTER TABLE [dbo].[ProductCategoryMapping] CHECK CONSTRAINT [FK_ProductCategory_Category]
GO
ALTER TABLE [dbo].[ProductCategoryMapping]  WITH CHECK ADD  CONSTRAINT [FK_ProductCategory_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[ProductCategoryMapping] CHECK CONSTRAINT [FK_ProductCategory_Product]
GO
ALTER TABLE [dbo].[PromotionTitles]  WITH CHECK ADD FOREIGN KEY([PromotionProgramID])
REFERENCES [dbo].[PromotionPrograms] ([PromotionProgramID])
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD CHECK  (([Rating]>=(1) AND [Rating]<=(5)))
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD CHECK  ((len([PhoneNumber])=(10)))
GO
USE [master]
GO
ALTER DATABASE [HIGH_WEBBANQUANAO] SET  READ_WRITE 
GO
