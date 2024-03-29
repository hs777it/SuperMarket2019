USE [master]
GO
/****** Object:  Database [SuperMarket2010]    Script Date: 2019/07/17 1:19:24 PM ******/
CREATE DATABASE [SuperMarket2010] ON  PRIMARY 
( NAME = N'SuperMarket07', FILENAME = N'D:\___Test\SuperMarket2019\SuperMarket2019\SuperMarket2010\bin\Debug\SuperMarket07.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SuperMarket07_log', FILENAME = N'D:\___Test\SuperMarket2019\SuperMarket2019\SuperMarket2010\bin\Debug\SuperMarket07_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SuperMarket2010] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SuperMarket2010].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SuperMarket2010] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SuperMarket2010] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SuperMarket2010] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SuperMarket2010] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SuperMarket2010] SET ARITHABORT OFF 
GO
ALTER DATABASE [SuperMarket2010] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SuperMarket2010] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SuperMarket2010] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SuperMarket2010] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SuperMarket2010] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SuperMarket2010] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SuperMarket2010] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SuperMarket2010] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SuperMarket2010] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SuperMarket2010] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SuperMarket2010] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SuperMarket2010] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SuperMarket2010] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SuperMarket2010] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SuperMarket2010] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SuperMarket2010] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SuperMarket2010] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SuperMarket2010] SET RECOVERY FULL 
GO
ALTER DATABASE [SuperMarket2010] SET  MULTI_USER 
GO
ALTER DATABASE [SuperMarket2010] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SuperMarket2010] SET DB_CHAINING OFF 
GO
EXEC sys.sp_db_vardecimal_storage_format N'SuperMarket2010', N'ON'
GO
USE [SuperMarket2010]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 2019/07/17 1:19:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CatID] [int] NOT NULL,
	[CatName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CatID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customers]    Script Date: 2019/07/17 1:19:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustID] [int] NOT NULL,
	[CustName] [nvarchar](50) NULL,
	[CustPhone] [nvarchar](30) NULL,
	[CustEmail] [nvarchar](30) NULL,
	[CustCompany] [nvarchar](50) NULL,
	[CustAddress] [nvarchar](100) NULL,
	[CustDateAdd] [date] NULL,
	[CustUserAdd] [nvarchar](50) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ItemCompany]    Script Date: 2019/07/17 1:19:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemCompany](
	[CoID] [int] NOT NULL,
	[CoName] [nvarchar](50) NULL,
	[CoPhone] [nvarchar](50) NULL,
	[CoAddress] [nvarchar](100) NULL,
	[ItemID] [int] NULL,
 CONSTRAINT [PK_ItemCompany] PRIMARY KEY CLUSTERED 
(
	[CoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ItemOrder]    Script Date: 2019/07/17 1:19:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemOrder](
	[OrderID] [int] NOT NULL,
	[OrderDate] [datetime] NULL,
	[OrderDesc] [nvarchar](100) NULL,
	[CustID] [int] NULL,
	[UserOrder] [nvarchar](50) NULL,
 CONSTRAINT [PK_ItemOrder] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Items]    Script Date: 2019/07/17 1:19:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Items](
	[ItemID] [int] NOT NULL,
	[Barcode] [nvarchar](60) NULL,
	[ItemName] [nvarchar](50) NULL,
	[ItemDate] [date] NULL,
	[PurPrice] [nvarchar](30) NULL,
	[SalePrice] [nvarchar](30) NULL,
	[ItemQty] [int] NULL,
	[ItemDiscount] [int] NULL,
	[CatID] [int] NULL,
 CONSTRAINT [PK_Items] PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 2019/07/17 1:19:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[ItemID] [int] NULL,
	[OrderID] [int] NULL,
	[Barcode] [nvarchar](60) NULL,
	[ItemName] [nvarchar](50) NULL,
	[Price] [nvarchar](30) NULL,
	[Qty] [int] NULL,
	[Discount] [int] NULL,
	[Amount] [nvarchar](30) NULL,
	[TotalAmount] [nvarchar](30) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Places]    Script Date: 2019/07/17 1:19:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Places](
	[PLID] [int] NOT NULL,
	[PlFloor] [nvarchar](50) NULL,
	[PlLine] [nvarchar](50) NULL,
	[PlStand] [nvarchar](50) NULL,
	[PlPlace] [nvarchar](50) NULL,
	[ItemID] [int] NULL,
 CONSTRAINT [PK_Places] PRIMARY KEY CLUSTERED 
(
	[PLID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PurchaseOrder]    Script Date: 2019/07/17 1:19:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseOrder](
	[PurOrderID] [int] NOT NULL,
	[PurOrderDate] [datetime] NULL,
	[PurOrderDesc] [nvarchar](100) NULL,
	[SupID] [int] NULL,
	[UserOrder] [nvarchar](50) NULL,
 CONSTRAINT [PK_PurchaseOrder] PRIMARY KEY CLUSTERED 
(
	[PurOrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PurchaseOrderDetails]    Script Date: 2019/07/17 1:19:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseOrderDetails](
	[ItemID] [int] NULL,
	[PurOrderID] [int] NULL,
	[OrBill] [nvarchar](50) NULL,
	[Barcode] [nvarchar](60) NULL,
	[ItemName] [nvarchar](50) NULL,
	[PurPrice] [nvarchar](30) NULL,
	[Qty] [int] NULL,
	[Discount] [int] NULL,
	[Amount] [nvarchar](30) NULL,
	[TotalAmount] [nvarchar](30) NULL,
	[State] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Return]    Script Date: 2019/07/17 1:19:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Return](
	[ReturnID] [int] NOT NULL,
	[ReturnItem] [nvarchar](50) NULL,
	[ReturnQty] [int] NULL,
	[ReturnDate] [date] NULL,
	[UserReturn] [nvarchar](50) NULL,
	[ItemID] [int] NULL,
 CONSTRAINT [PK_Returns] PRIMARY KEY CLUSTERED 
(
	[ReturnID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Status]    Script Date: 2019/07/17 1:19:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[StatusID] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 2019/07/17 1:19:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[SupID] [int] NOT NULL,
	[SupName] [nvarchar](50) NULL,
	[SupPhone] [nvarchar](30) NULL,
	[SupEmail] [nvarchar](30) NULL,
	[SupCompany] [nvarchar](50) NULL,
	[SupAddress] [nvarchar](100) NULL,
	[SupDateAdd] [date] NULL,
	[SupUserAdd] [nvarchar](50) NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[SupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserLogin]    Script Date: 2019/07/17 1:19:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLogin](
	[UserID] [int] NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[UserPass] [nvarchar](30) NULL,
	[FullName] [nvarchar](50) NULL,
	[UserRegDate] [datetime] NULL,
	[UserType] [nvarchar](40) NULL,
 CONSTRAINT [PK_SystemLogin] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[ItemCompany]  WITH CHECK ADD  CONSTRAINT [FK_ItemCompany_Items] FOREIGN KEY([ItemID])
REFERENCES [dbo].[Items] ([ItemID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ItemCompany] CHECK CONSTRAINT [FK_ItemCompany_Items]
GO
ALTER TABLE [dbo].[ItemOrder]  WITH CHECK ADD  CONSTRAINT [FK_ItemOrder_Customers] FOREIGN KEY([CustID])
REFERENCES [dbo].[Customers] ([CustID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ItemOrder] CHECK CONSTRAINT [FK_ItemOrder_Customers]
GO
ALTER TABLE [dbo].[Items]  WITH CHECK ADD  CONSTRAINT [FK_Items_Category] FOREIGN KEY([CatID])
REFERENCES [dbo].[Category] ([CatID])
GO
ALTER TABLE [dbo].[Items] CHECK CONSTRAINT [FK_Items_Category]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_ItemOrder] FOREIGN KEY([OrderID])
REFERENCES [dbo].[ItemOrder] ([OrderID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_ItemOrder]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Items] FOREIGN KEY([ItemID])
REFERENCES [dbo].[Items] ([ItemID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Items]
GO
ALTER TABLE [dbo].[Places]  WITH CHECK ADD  CONSTRAINT [FK_Places_Items] FOREIGN KEY([ItemID])
REFERENCES [dbo].[Items] ([ItemID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Places] CHECK CONSTRAINT [FK_Places_Items]
GO
ALTER TABLE [dbo].[PurchaseOrder]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseOrder_Supplier] FOREIGN KEY([SupID])
REFERENCES [dbo].[Supplier] ([SupID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PurchaseOrder] CHECK CONSTRAINT [FK_PurchaseOrder_Supplier]
GO
ALTER TABLE [dbo].[PurchaseOrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseOrderDetails_Items] FOREIGN KEY([ItemID])
REFERENCES [dbo].[Items] ([ItemID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PurchaseOrderDetails] CHECK CONSTRAINT [FK_PurchaseOrderDetails_Items]
GO
ALTER TABLE [dbo].[PurchaseOrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseOrderDetails_PurchaseOrder] FOREIGN KEY([PurOrderID])
REFERENCES [dbo].[PurchaseOrder] ([PurOrderID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PurchaseOrderDetails] CHECK CONSTRAINT [FK_PurchaseOrderDetails_PurchaseOrder]
GO
ALTER TABLE [dbo].[PurchaseOrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseOrderDetails_Status] FOREIGN KEY([State])
REFERENCES [dbo].[Status] ([StatusID])
GO
ALTER TABLE [dbo].[PurchaseOrderDetails] CHECK CONSTRAINT [FK_PurchaseOrderDetails_Status]
GO
ALTER TABLE [dbo].[Return]  WITH CHECK ADD  CONSTRAINT [FK_Return_Items] FOREIGN KEY([ItemID])
REFERENCES [dbo].[Items] ([ItemID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Return] CHECK CONSTRAINT [FK_Return_Items]
GO
/****** Object:  StoredProcedure [dbo].[spCategoryAdd]    Script Date: 2019/07/17 1:19:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spCategoryAdd]
@CatID int ,@CatName nvarchar(50)
as
INSERT INTO Category(CatID,CatName) VALUES(@CatID ,@CatName)
GO
/****** Object:  StoredProcedure [dbo].[spCategoryAll]    Script Date: 2019/07/17 1:19:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spCategoryAll]
as
SELECT 
CatID as 'رقم المجموعة',
CatName as 'اسم المجموعة' FROM Category



GO
/****** Object:  StoredProcedure [dbo].[spCategoryDelete]    Script Date: 2019/07/17 1:19:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[spCategoryDelete]
@CatID int
as
delete from Category WHERE CatID = @CatID



GO
/****** Object:  StoredProcedure [dbo].[spCategoryMaxID]    Script Date: 2019/07/17 1:19:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spCategoryMaxID]
as
select isnull(max(CatID)+1,1) from category
GO
/****** Object:  StoredProcedure [dbo].[spCategoryUpdate]    Script Date: 2019/07/17 1:19:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[spCategoryUpdate]
@CatID int,
@CatName nvarchar(50)
as
UPDATE Category SET CatName = @CatName
WHERE CatID = @CatID



GO
/****** Object:  StoredProcedure [dbo].[spSupplierAdd]    Script Date: 2019/07/17 1:19:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[spSupplierAdd]
@supID int,
@supName nvarchar(50),
@supPhone nvarchar(30),
@supEmail nvarchar(30),
@supCompany nvarchar(50),
@supAddress nvarchar(100),
@supDateAdd datetime,
@supUserAdd nvarchar(50)

AS

INSERT INTO Supplier (SupID,SupName,SupPhone,SupEmail,SupCompany,SupAddress,SupDateAdd,SupUserAdd)
VALUES(@supID,@supName,@supPhone,@supEmail,@supCompany,@supAddress,@supDateAdd,@supUserAdd )







GO
/****** Object:  StoredProcedure [dbo].[spSupplierAll]    Script Date: 2019/07/17 1:19:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[spSupplierAll]
AS
SELECT SupID as 'الرقم',
      SupName as 'اسم المورد',
      SupPhone as 'التليفون',
      SupEmail as 'البريد',
      SupCompany as 'اسم الشركة',
      SupAddress as 'العنوان',
      SupDateAdd as 'التاريخ',
      SupUserAdd as 'المستخدم'
FROM dbo.Supplier







GO
/****** Object:  StoredProcedure [dbo].[spSupplierDelete]    Script Date: 2019/07/17 1:19:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spSupplierDelete]
@ID int
as
DELETE FROM Supplier WHERE SupID = @ID

GO
/****** Object:  StoredProcedure [dbo].[spSupplierMaxID]    Script Date: 2019/07/17 1:19:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spSupplierMaxID]
as
select isnull(max(SupID)+1,1) from Supplier



GO
/****** Object:  StoredProcedure [dbo].[spSupplierReport]    Script Date: 2019/07/17 1:19:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spSupplierReport]
@ID int
as

select SupID,SupName,SupPhone,SupEmail,SupCompany,
SupAddress,SupDateAdd,SupUserAdd
from Supplier
where SupID = @ID

GO
/****** Object:  StoredProcedure [dbo].[spSupplierSearch]    Script Date: 2019/07/17 1:19:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[spSupplierSearch]
@value nvarchar(10)
as
SELECT * FROM Supplier 
WHERE convert(nvarchar,SupID) + SupPhone + SupEmail + SupCompany + SupAddress + SupUserAdd like '%' + @value + '%'
GO
/****** Object:  StoredProcedure [dbo].[spSupplierUpdate]    Script Date: 2019/07/17 1:19:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[spSupplierUpdate]
@supID int,
@supName nvarchar(50),
@supPhone nvarchar(30),
@supEmail nvarchar(30),
@supCompany nvarchar(50),
@supAddress nvarchar(100),
@supDateAdd datetime,
@supUserAdd nvarchar(50)

AS

UPDATE Supplier
   SET SupID = @supID
      ,SupName = @supName
      ,SupPhone = @supPhone
      ,SupEmail = @supEmail
      ,SupCompany = @supCompany
      ,SupAddress = @supAddress
      ,SupDateAdd = @supDateAdd
      ,SupUserAdd = @supUserAdd
 WHERE SupID = @supID








GO
/****** Object:  StoredProcedure [dbo].[spUserAdd]    Script Date: 2019/07/17 1:19:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spUserAdd]
@UserID int,
@UserName nvarchar(50),
@UserPass nvarchar(30),
@FullName nvarchar(50),
@UserRegDate datetime,
@UserType nvarchar(40)

AS

INSERT INTO dbo.UserLogin
(UserID,UserName,UserPass,FullName,UserRegDate,UserType)
VALUES
(@UserID,@UserName,@UserPass,@FullName,@UserRegDate,@UserType)






GO
/****** Object:  StoredProcedure [dbo].[spUserAll]    Script Date: 2019/07/17 1:19:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spUserAll]
AS

SELECT 
	UserID as 'الرقم',
	UserName as 'اسم المستخدم',
	UserPass as 'كلمة المرور',
	FullName as 'الاسم ',
	Convert(date,UserRegDate) as 'تاريخ التسجيل',
	UserType as 'نوع المستخدم'
FROM UserLogin






GO
/****** Object:  StoredProcedure [dbo].[spUserDelete]    Script Date: 2019/07/17 1:19:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spUserDelete]
@ID int
as
DELETE FROM UserLogin WHERE UserID = @ID

GO
/****** Object:  StoredProcedure [dbo].[spUserLogin]    Script Date: 2019/07/17 1:19:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spUserLogin]
@username nvarchar(50),
@password nvarchar(30)
as
SELECT * FROM UserLogin 
WHERE UserName = @username and UserPass =  @password
GO
/****** Object:  StoredProcedure [dbo].[spUserMaxID]    Script Date: 2019/07/17 1:19:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[spUserMaxID]
as
select isnull(max(UserID)+1,1) from UserLogin



GO
/****** Object:  StoredProcedure [dbo].[spUserSearch]    Script Date: 2019/07/17 1:19:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spUserSearch]
@value nvarchar(10)
as
SELECT * FROM UserLogin 
WHERE convert(nvarchar,UserID) + UserName + FullName + UserType like '%' + @value + '%'
GO
/****** Object:  StoredProcedure [dbo].[spUserUpdate]    Script Date: 2019/07/17 1:19:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spUserUpdate]
@userID int,
@userName nvarchar(50) ,
@userPass nvarchar(30) ,
@fullName nvarchar(50) ,
@userRegDate datetime ,
@userType nvarchar(40)
as

UPDATE dbo.UserLogin
SET		UserID = @userID,
		UserName = @userName,
		UserPass = @userPass,
		FullName = @fullName,
		UserRegDate = @userRegDate,
		UserType = @userType
WHERE	UserID = @UserID




GO
USE [master]
GO
ALTER DATABASE [SuperMarket2010] SET  READ_WRITE 
GO
