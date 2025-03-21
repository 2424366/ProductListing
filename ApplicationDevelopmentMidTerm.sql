USE [master]
GO
/****** Object:  Database [ApplicationDevelopmentMidTerm]    Script Date: 2025-03-11 4:54:06 PM ******/
CREATE DATABASE [ApplicationDevelopmentMidTerm]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ApplicationDevelopmentMidTerm', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\ApplicationDevelopmentMidTerm.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ApplicationDevelopmentMidTerm_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\ApplicationDevelopmentMidTerm_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ApplicationDevelopmentMidTerm] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ApplicationDevelopmentMidTerm].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ApplicationDevelopmentMidTerm] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ApplicationDevelopmentMidTerm] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ApplicationDevelopmentMidTerm] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ApplicationDevelopmentMidTerm] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ApplicationDevelopmentMidTerm] SET ARITHABORT OFF 
GO
ALTER DATABASE [ApplicationDevelopmentMidTerm] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ApplicationDevelopmentMidTerm] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ApplicationDevelopmentMidTerm] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ApplicationDevelopmentMidTerm] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ApplicationDevelopmentMidTerm] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ApplicationDevelopmentMidTerm] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ApplicationDevelopmentMidTerm] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ApplicationDevelopmentMidTerm] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ApplicationDevelopmentMidTerm] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ApplicationDevelopmentMidTerm] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ApplicationDevelopmentMidTerm] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ApplicationDevelopmentMidTerm] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ApplicationDevelopmentMidTerm] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ApplicationDevelopmentMidTerm] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ApplicationDevelopmentMidTerm] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ApplicationDevelopmentMidTerm] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ApplicationDevelopmentMidTerm] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ApplicationDevelopmentMidTerm] SET RECOVERY FULL 
GO
ALTER DATABASE [ApplicationDevelopmentMidTerm] SET  MULTI_USER 
GO
ALTER DATABASE [ApplicationDevelopmentMidTerm] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ApplicationDevelopmentMidTerm] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ApplicationDevelopmentMidTerm] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ApplicationDevelopmentMidTerm] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ApplicationDevelopmentMidTerm] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ApplicationDevelopmentMidTerm', N'ON'
GO
ALTER DATABASE [ApplicationDevelopmentMidTerm] SET QUERY_STORE = OFF
GO
USE [ApplicationDevelopmentMidTerm]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [ApplicationDevelopmentMidTerm]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 2025-03-11 4:54:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](50) NULL,
	[Price] [decimal](18, 6) NULL,
	[Qauntity] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifyDate] [datetime] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductID], [ProductName], [Price], [Qauntity], [CreatedDate], [ModifyDate], [IsDeleted]) VALUES (1, N'ABC', CAST(10.000000 AS Decimal(18, 6)), 20, CAST(N'2025-03-11T14:51:34.750' AS DateTime), CAST(N'2025-03-11T15:04:07.910' AS DateTime), 0)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Price], [Qauntity], [CreatedDate], [ModifyDate], [IsDeleted]) VALUES (2, N'ABCD', CAST(10.000000 AS Decimal(18, 6)), 10, CAST(N'2025-03-11T15:08:16.470' AS DateTime), NULL, 0)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Price], [Qauntity], [CreatedDate], [ModifyDate], [IsDeleted]) VALUES (3, N'SDDFG', CAST(32.000000 AS Decimal(18, 6)), 10, CAST(N'2025-03-11T15:09:54.340' AS DateTime), NULL, 0)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Price], [Qauntity], [CreatedDate], [ModifyDate], [IsDeleted]) VALUES (4, N'WSC', CAST(200.000000 AS Decimal(18, 6)), 12, CAST(N'2025-03-11T15:12:35.497' AS DateTime), NULL, 0)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Price], [Qauntity], [CreatedDate], [ModifyDate], [IsDeleted]) VALUES (5, N'abcdef', CAST(100.000000 AS Decimal(18, 6)), 10, CAST(N'2025-03-11T15:17:44.193' AS DateTime), CAST(N'2025-03-11T15:17:52.093' AS DateTime), 0)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Price], [Qauntity], [CreatedDate], [ModifyDate], [IsDeleted]) VALUES (6, N'abc', CAST(400.000000 AS Decimal(18, 6)), 10, CAST(N'2025-03-11T15:20:41.960' AS DateTime), NULL, 0)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
/****** Object:  StoredProcedure [dbo].[usp_AddEditProduct]    Script Date: 2025-03-11 4:54:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[usp_AddEditProduct]
@ProductID INT=0, -- 0 then Add mode
@ProductName VARCHAR(200),  
@Price Decimal(18,6), 
@Qauntity INT
AS 
BEGIN  
	IF @ProductID = 0 
	BEGIN 
		INSERT INTO Product
        (
            ProductName,
            Price,
            Qauntity,
			CreatedDate
        )
		VALUES 
        (
            @ProductName, 
            @Price, 
            @Qauntity, 
            GetDate()
        )
		
		SET @ProductID=SCOPE_IDENTITY(); 
		select 200 AS status,@ProductID AS ProductID
	END
	ELSE
	BEGIN
		UPDATE Product SET
		    ProductName=@ProductName,
            Price=@Price,  
			Qauntity=@Qauntity,
            ModifyDate=GetDate() 
		WHERE ProductID=@ProductID
	END
	select 201 AS status,@ProductID AS ProductID
END



GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteProduct]    Script Date: 2025-03-11 4:54:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[usp_DeleteProduct]
@ProductID INT
AS
BEGIN
	IF EXISTS(Select 1 from [Product] WHERE ProductID=@ProductID)
    BEGIN 
        UPDATE [Product] SET IsDeleted=1 WHERE ProductID=@ProductID;    
        SELECT cast(1 AS bit) AS AllowToDelete
	END
	ELSE 
	BEGIN
		SELECT cast(0 AS bit) AS AllowToDelete
	END
END;
GO
/****** Object:  StoredProcedure [dbo].[usp_GetProductDetailsById]    Script Date: 2025-03-11 4:54:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[usp_GetProductDetailsById]
@ProductID int
AS 
BEGIN  

	SELECT 
		ProductID,
		ProductName, 
		Price,
		Qauntity
	FROM dbo.Product p
	WHERE ISNULL(p.IsDeleted,0)=0 AND p.ProductID=@ProductID
    
         
END


GO
/****** Object:  StoredProcedure [dbo].[usp_GetProductGrid]    Script Date: 2025-03-11 4:54:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_GetProductGrid]
@Search NVARCHAR(50) = NULL,    
@DisplayStart INT,    
@PageSize INT,    
@SortColumnName VARCHAR(50)=NULL,    
@SortOrder VARCHAR(50)='asc',    
@noOfRecords INT Out     
As    
BEGIN    
	DECLARE @QRY NVARCHAR(MAX)= '';      
    DECLARE @QRYStatus NVARCHAR(MAX)= '';    
    DECLARE @QRYWHERE NVARCHAR(MAX)= '';    
    DECLARE @PAGINATION NVARCHAR(MAX)= '';    
    DECLARE @CountRecord NVARCHAR(MAX)= '';     

    SET @QRY = 'SELECT  ProductID,
						ProductName,
						Price,
						Qauntity
                FROM(    
                    Select     
                        p.ProductID,
						p.ProductName,
						p.Price,
						Qauntity
                    FROM Product p';     

    SET @QRYWHERE = ' WHERE ISNULL(p.IsDeleteD,0)=0 '; 

	IF(@Search IS NOT NULL AND @Search<>'' AND LEN(@Search)>0)
    BEGIN    
        SET @QRYWHERE+=' AND p.ProductName like ''%'+COALESCE(@Search, '')+'%'''+'';    
    END;    

    SET @QRYWHERE += ')TempTable'    
    SET @CountRecord = 'SELECT @noOfRecord=COUNT(*) FROM ('+(@QRY  + @QRYWHERE)+') countRecord';    
    SET @PAGINATION = ' ORDER BY '+@SortColumnName+' '+@SortOrder+' OFFSET '+CONVERT(VARCHAR, @DisplayStart)+' ROWS FETCH NEXT '+CONVERT(VARCHAR, @PageSize)+' ROWS ONLY'; 
    EXECUTE sp_executesql    
    @CountRecord,    
    N'@noOfRecord int OUTPUT',    
    @noOfRecord = @noOfRecords OUTPUT;    
    PRINT (@QRY+@QRYWHERE+@PAGINATION);  
    EXEC (@QRY+@QRYWHERE+@PAGINATION);   
END



GO
USE [master]
GO
ALTER DATABASE [ApplicationDevelopmentMidTerm] SET  READ_WRITE 
GO
