USE [master]
GO
/****** Object:  Database [MediacalSystemDB]    Script Date: 6/9/2016 8:25:25 PM ******/
CREATE DATABASE [MediacalSystemDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MediacalSystemDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\MediacalSystemDB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'MediacalSystemDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\MediacalSystemDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [MediacalSystemDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MediacalSystemDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MediacalSystemDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MediacalSystemDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MediacalSystemDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MediacalSystemDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MediacalSystemDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [MediacalSystemDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MediacalSystemDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MediacalSystemDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MediacalSystemDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MediacalSystemDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MediacalSystemDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MediacalSystemDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MediacalSystemDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MediacalSystemDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MediacalSystemDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MediacalSystemDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MediacalSystemDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MediacalSystemDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MediacalSystemDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MediacalSystemDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MediacalSystemDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MediacalSystemDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MediacalSystemDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MediacalSystemDB] SET  MULTI_USER 
GO
ALTER DATABASE [MediacalSystemDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MediacalSystemDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MediacalSystemDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MediacalSystemDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [MediacalSystemDB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [MediacalSystemDB]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 6/9/2016 8:25:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BillNo] [varchar](10) NOT NULL,
	[EntryDate] [date] NOT NULL,
	[PatientId] [int] NOT NULL,
	[TotalFee] [float] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderTest]    Script Date: 6/9/2016 8:25:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderTest](
	[OrderId] [int] NOT NULL,
	[TestId] [int] NOT NULL,
 CONSTRAINT [PK_OrderTest] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC,
	[TestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Patient]    Script Date: 6/9/2016 8:25:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Patient](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[DOB] [datetime] NOT NULL,
	[Mobile] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Patient] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Test]    Script Date: 6/9/2016 8:25:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Test](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Fee] [float] NOT NULL,
	[TestTypeId] [int] NOT NULL,
 CONSTRAINT [PK_Test] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TestType]    Script Date: 6/9/2016 8:25:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TestType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TestType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[ViewOrderWithDate]    Script Date: 6/9/2016 8:25:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewOrderWithDate]
AS
SELECT ot.TestId as TestId, t.Name as TestName, Fee, tt.Id as TestTypeId, tt.Name as TestTypeName, o.EntryDate
FROM OrderTest ot
JOIN Test t ON ot.TestId = t.Id
JOIN TestType tt ON t.TestTypeId = tt.Id
JOIN [Order] o ON o.Id = ot.OrderId
GO
/****** Object:  View [dbo].[ViewOrderWithPatient]    Script Date: 6/9/2016 8:25:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewOrderWithPatient]
AS
SELECT        o.Id AS OrderId, o.BillNo, o.TotalFee, o.EntryDate, p.Id AS PatientId, p.Name AS PatientName, p.Mobile, p.DOB
FROM            dbo.[Order] AS o INNER JOIN
                         dbo.Patient AS p ON o.PatientId = p.Id

GO
/****** Object:  View [dbo].[ViewTestWithTestType]    Script Date: 6/9/2016 8:25:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewTestWithTestType]
AS
SELECT t.id as TestId, t.Name as TestName, t.Fee, tt.Id as TestTypeId, tt.Name as TestTypeName FROM Test t 
JOIN TestType tt ON t.TestTypeId = tt.Id
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Order]    Script Date: 6/9/2016 8:25:26 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Order] ON [dbo].[Order]
(
	[BillNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Test]    Script Date: 6/9/2016 8:25:26 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Test] ON [dbo].[Test]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_TestType]    Script Date: 6/9/2016 8:25:26 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_TestType] ON [dbo].[TestType]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "o"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "p"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewOrderWithPatient'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewOrderWithPatient'
GO
USE [master]
GO
ALTER DATABASE [MediacalSystemDB] SET  READ_WRITE 
GO
