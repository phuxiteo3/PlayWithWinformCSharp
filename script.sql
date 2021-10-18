USE [master]
GO
/****** Object:  Database [FStore]    Script Date: 18-Oct-21 8:20:21 PM ******/
CREATE DATABASE [FStore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FStore', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\FStore.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'FStore_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\FStore_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [FStore] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [FStore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FStore] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FStore] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FStore] SET  MULTI_USER 
GO
ALTER DATABASE [FStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FStore] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [FStore] SET DELAYED_DURABILITY = DISABLED 
GO
USE [FStore]
GO
/****** Object:  Table [dbo].[tblMember]    Script Date: 18-Oct-21 8:20:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblMember](
	[MemberId] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[CompanyName] [varchar](40) NOT NULL,
	[City] [varchar](30) NOT NULL,
	[Country] [varchar](30) NOT NULL,
	[Password] [varchar](30) NOT NULL,
 CONSTRAINT [PK__tblMembe__0CF04B38B3947E3E] PRIMARY KEY CLUSTERED 
(
	[MemberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblOrder]    Script Date: 18-Oct-21 8:20:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrder](
	[OrderID] [int] NOT NULL,
	[MemberID] [int] NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[RequiredDate] [datetime] NULL,
	[ShippedDate] [datetime] NULL,
	[Freight] [money] NULL,
 CONSTRAINT [PK_tblOrder] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblOrderDetail]    Script Date: 18-Oct-21 8:20:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDetail](
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[UnitPrice] [money] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Discount] [float] NOT NULL,
 CONSTRAINT [PK_tblOrderDetail] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC,
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblProduct]    Script Date: 18-Oct-21 8:20:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblProduct](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[ProductName] [varchar](40) NOT NULL,
	[Weight] [varchar](20) NOT NULL,
	[UnitPrice] [money] NOT NULL,
	[UnitsInStock] [int] NOT NULL,
 CONSTRAINT [PK__tblProdu__B40CC6ED2A49CCF4] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tblMember] ON 

INSERT [dbo].[tblMember] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (12, N'phuong@fstore.com', N'FSoft', N'Phnom Penh', N'Myanmar', N'123')
INSERT [dbo].[tblMember] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (13, N'an@fstore.com', N'Ree', N'Dili', N'Brunei', N'123')
INSERT [dbo].[tblMember] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (14, N'dan@fstore.com', N'FTech', N'TPHCM', N'Campuchia', N'123')
INSERT [dbo].[tblMember] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (15, N'nam@fstore.com', N'FPTU', N'Vien Chan', N'Lao', N'123')
INSERT [dbo].[tblMember] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (16, N'nhut@fstore.com', N'FSoft', N'Dili', N'DongTimor', N'123')
INSERT [dbo].[tblMember] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (17, N'trung@fstore.com', N'Misa', N'Vinh', N'VietNam', N'123')
INSERT [dbo].[tblMember] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (18, N'tung@fstore.com', N'VNG', N'Mui Ne', N'VietNam', N'123')
INSERT [dbo].[tblMember] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (19, N'trieumy@fstore.com', N'Samsung', N'Vung Tau', N'VietNam', N'123')
INSERT [dbo].[tblMember] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (20, N'kieu@fstore.com', N'Google', N'Phu Quoc', N'VietNam', N'123')
INSERT [dbo].[tblMember] ([MemberId], [Email], [CompanyName], [City], [Country], [Password]) VALUES (22, N'hihi@fstore.com', N'ahihi', N'Bang Koc', N'Singapore', N'1')
SET IDENTITY_INSERT [dbo].[tblMember] OFF
INSERT [dbo].[tblOrder] ([OrderID], [MemberID], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (1, 12, CAST(N'2021-10-17 22:26:26.660' AS DateTime), CAST(N'2021-10-17 22:26:26.660' AS DateTime), CAST(N'2021-10-17 22:26:26.660' AS DateTime), 27600.0000)
INSERT [dbo].[tblOrder] ([OrderID], [MemberID], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (2, 12, CAST(N'2021-10-17 22:29:17.493' AS DateTime), CAST(N'2021-10-17 22:29:17.493' AS DateTime), CAST(N'2021-10-17 22:29:17.493' AS DateTime), 92000.0000)
INSERT [dbo].[tblOrder] ([OrderID], [MemberID], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (3, 12, CAST(N'2021-10-18 17:01:08.913' AS DateTime), CAST(N'2021-10-18 17:01:08.913' AS DateTime), CAST(N'2021-10-18 17:01:08.913' AS DateTime), 23500.0000)
INSERT [dbo].[tblOrder] ([OrderID], [MemberID], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (4, 20, CAST(N'2021-10-18 17:03:28.410' AS DateTime), CAST(N'2021-10-18 17:03:28.410' AS DateTime), CAST(N'2021-10-18 17:03:28.410' AS DateTime), 25000.0000)
INSERT [dbo].[tblOrder] ([OrderID], [MemberID], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (5, 13, CAST(N'2021-10-18 17:11:19.357' AS DateTime), CAST(N'2021-10-18 17:11:19.357' AS DateTime), CAST(N'2021-10-18 17:11:19.357' AS DateTime), 10000.0000)
INSERT [dbo].[tblOrder] ([OrderID], [MemberID], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (6, 20, CAST(N'2021-10-18 17:13:31.047' AS DateTime), CAST(N'2021-10-18 17:13:31.047' AS DateTime), CAST(N'2021-10-18 17:13:31.047' AS DateTime), 3000.0000)
INSERT [dbo].[tblOrder] ([OrderID], [MemberID], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (7, 13, CAST(N'2021-10-18 17:20:13.683' AS DateTime), CAST(N'2021-10-18 17:20:13.683' AS DateTime), CAST(N'2021-10-18 17:20:13.683' AS DateTime), 0.0000)
INSERT [dbo].[tblOrder] ([OrderID], [MemberID], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (8, 13, CAST(N'2021-10-18 19:50:07.717' AS DateTime), CAST(N'2021-10-18 19:50:07.717' AS DateTime), CAST(N'2021-10-18 19:50:07.717' AS DateTime), 15000.0000)
INSERT [dbo].[tblOrder] ([OrderID], [MemberID], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (9, 12, CAST(N'2021-10-18 20:05:17.253' AS DateTime), CAST(N'2021-10-18 20:05:17.253' AS DateTime), CAST(N'2021-10-18 20:05:17.253' AS DateTime), 12000.0000)
INSERT [dbo].[tblOrder] ([OrderID], [MemberID], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (10, 12, CAST(N'2021-10-18 20:07:22.087' AS DateTime), CAST(N'2021-10-18 20:07:22.087' AS DateTime), CAST(N'2021-10-18 20:07:22.087' AS DateTime), 32000.0000)
INSERT [dbo].[tblOrder] ([OrderID], [MemberID], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (11, 12, CAST(N'2021-10-18 20:08:11.647' AS DateTime), CAST(N'2021-10-18 20:08:11.647' AS DateTime), CAST(N'2021-10-18 20:08:11.647' AS DateTime), 32000.0000)
INSERT [dbo].[tblOrder] ([OrderID], [MemberID], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (12, 12, CAST(N'2021-10-18 20:10:06.307' AS DateTime), CAST(N'2021-10-18 20:10:06.307' AS DateTime), CAST(N'2021-10-18 20:10:06.307' AS DateTime), 10000.0000)
INSERT [dbo].[tblOrder] ([OrderID], [MemberID], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (13, 12, CAST(N'2021-10-18 20:11:40.973' AS DateTime), CAST(N'2021-10-18 20:11:40.973' AS DateTime), CAST(N'2021-10-18 20:11:40.973' AS DateTime), 10000.0000)
INSERT [dbo].[tblOrder] ([OrderID], [MemberID], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (14, 20, CAST(N'2021-10-18 20:14:46.970' AS DateTime), CAST(N'2021-10-18 20:14:46.970' AS DateTime), CAST(N'2021-10-18 20:14:46.970' AS DateTime), 20000.0000)
INSERT [dbo].[tblOrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (1, 3, 23000.0000, 2, 0.4)
INSERT [dbo].[tblOrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (2, 3, 23000.0000, 1, 0.2)
INSERT [dbo].[tblOrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (4, 1, 30000.0000, 4, 0.32)
INSERT [dbo].[tblOrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (4, 2, 23000.0000, 4, 0.32)
INSERT [dbo].[tblOrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (4, 3, 23000.0000, 2, 0.32)
INSERT [dbo].[tblOrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (4, 6, 10000.0000, 4, 0.32)
INSERT [dbo].[tblOrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (5, 3, 23000.0000, 1, 0.3222)
INSERT [dbo].[tblOrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (6, 2, 23000.0000, 1, 0.2)
INSERT [dbo].[tblOrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (6, 3, 23000.0000, 1, 0.2)
INSERT [dbo].[tblOrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (7, 1, 30000.0000, 3, 0.2)
INSERT [dbo].[tblOrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (7, 2, 23000.0000, 2, 0.2)
INSERT [dbo].[tblOrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (7, 3, 23000.0000, 1, 0.2)
INSERT [dbo].[tblOrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (8, 2, 23000.0000, 12, 0.777)
INSERT [dbo].[tblOrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (8, 3, 23000.0000, 3, 0.777)
INSERT [dbo].[tblOrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (9, 1, 30000.0000, 1, 0.31)
INSERT [dbo].[tblOrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (9, 2, 23000.0000, 6, 0.31)
INSERT [dbo].[tblOrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (9, 3, 23000.0000, 4, 0.31)
INSERT [dbo].[tblOrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (10, 1, 30000.0000, 2, 0.3)
INSERT [dbo].[tblOrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (10, 2, 23000.0000, 2, 0.3)
INSERT [dbo].[tblOrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (10, 3, 23000.0000, 2, 0.3)
INSERT [dbo].[tblOrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (10, 4, 20000.0000, 2, 0.3)
INSERT [dbo].[tblOrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (10, 6, 10000.0000, 2, 0.3)
INSERT [dbo].[tblOrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (11, 2, 23000.0000, 2, 0)
INSERT [dbo].[tblOrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (11, 3, 23000.0000, 2, 0)
INSERT [dbo].[tblOrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (12, 1, 30000.0000, 5, 0.2)
INSERT [dbo].[tblOrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (13, 1, 30000.0000, 3, 0.3)
INSERT [dbo].[tblOrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (13, 2, 23000.0000, 3, 0.3)
INSERT [dbo].[tblOrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (13, 3, 23000.0000, 3, 0.3)
INSERT [dbo].[tblOrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (14, 1, 30000.0000, 4, 0.3)
INSERT [dbo].[tblOrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (14, 2, 23000.0000, 4, 0.3)
INSERT [dbo].[tblOrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (14, 3, 23000.0000, 4, 0.3)
INSERT [dbo].[tblOrderDetail] ([OrderId], [ProductId], [UnitPrice], [Quantity], [Discount]) VALUES (14, 4, 20000.0000, 4, 0.3)
SET IDENTITY_INSERT [dbo].[tblProduct] ON 

INSERT [dbo].[tblProduct] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitsInStock]) VALUES (1, 1, N'Banh keo', N'1', 30000.0000, 10)
INSERT [dbo].[tblProduct] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitsInStock]) VALUES (2, 2, N'Bia', N'5', 23000.0000, 47)
INSERT [dbo].[tblProduct] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitsInStock]) VALUES (3, 1, N'Cake', N'3', 23000.0000, 0)
INSERT [dbo].[tblProduct] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitsInStock]) VALUES (4, 1, N'Dau an', N'6', 20000.0000, 42)
INSERT [dbo].[tblProduct] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitsInStock]) VALUES (5, 3, N'Sua chua', N'4', 23000.0000, 32)
INSERT [dbo].[tblProduct] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitsInStock]) VALUES (6, 1, N'Sua Ong Tho', N'17', 10000.0000, 5)
INSERT [dbo].[tblProduct] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitsInStock]) VALUES (7, 1, N'Banh Beo', N'1', 2300000.0000, 32)
INSERT [dbo].[tblProduct] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitsInStock]) VALUES (8, 1, N'Nuoc ngot', N'2', 20000.0000, 8)
INSERT [dbo].[tblProduct] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitsInStock]) VALUES (10, 1, N'Ba Ba', N'33', 10000.0000, 10)
INSERT [dbo].[tblProduct] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitsInStock]) VALUES (11, 1, N'Tu tu', N'22', 10000.0000, 11)
INSERT [dbo].[tblProduct] ([ProductId], [CategoryId], [ProductName], [Weight], [UnitPrice], [UnitsInStock]) VALUES (13, 3, N'Juice', N'2', 30000.0000, 30)
SET IDENTITY_INSERT [dbo].[tblProduct] OFF
ALTER TABLE [dbo].[tblOrder]  WITH CHECK ADD  CONSTRAINT [FK_tblOrder_tblMember] FOREIGN KEY([MemberID])
REFERENCES [dbo].[tblMember] ([MemberId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblOrder] CHECK CONSTRAINT [FK_tblOrder_tblMember]
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetail_tblOrder] FOREIGN KEY([OrderId])
REFERENCES [dbo].[tblOrder] ([OrderID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [FK_tblOrderDetail_tblOrder]
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetail_tblProduct] FOREIGN KEY([ProductId])
REFERENCES [dbo].[tblProduct] ([ProductId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [FK_tblOrderDetail_tblProduct]
GO
USE [master]
GO
ALTER DATABASE [FStore] SET  READ_WRITE 
GO
