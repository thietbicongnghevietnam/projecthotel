USE [Warehouse_BPS]
GO
/****** Object:  Table [dbo].[TBL_USER2]    Script Date: 05/03/2024 5:04:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_USER2](
	[U_ID] [int] IDENTITY(1,1) NOT NULL,
	[U_NAME] [varchar](50) NOT NULL,
	[U_PASSWORD] [varchar](255) NOT NULL,
	[U_FULLNAME] [nvarchar](2550) NOT NULL,
	[U_EMAIL] [varchar](100) NULL,
	[U_GROUP] [varchar](10) NULL,
	[U_ACTIVE] [varchar](50) NULL,
	[ROLE] [nvarchar](200) NOT NULL,
	[INSERT_DATE] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TBL_USER2] ADD  CONSTRAINT [DF_TBL_USER2_U_ACTIVE]  DEFAULT ('Y') FOR [U_ACTIVE]
GO
/****** Object:  StoredProcedure [dbo].[NH_Baocaotonkho_lolai]    Script Date: 05/03/2024 5:04:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[NH_Baocaotonkho_lolai]
	
AS
BEGIN
	
	SELECT TOP (1000) [id]
      ,[mahang]
      ,[tenhang]
      ,[dvt]
	  ,'' as soluongnhap
	  ,'' as soluongxuat
      ,[soluongton] as toncuoiky
      ,[anh]
      ,[gianhap]
      ,[giaban]
	  ,'' as doanhso
	  ,'' as giavon
	  ,'' as laigop
      --,[nhomhangid]
      --,[userid]
      --,[created]
      --,[modified]
  FROM [Warehouse_BPS].[dbo].[hthanghoa]


END
GO
/****** Object:  StoredProcedure [dbo].[NH_Baocaotonkho_lolai2]    Script Date: 05/03/2024 5:04:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[NH_Baocaotonkho_lolai2] --NH_Baocaotonkho_lolai2 '2024-04-01','2024-05-03'
	@fromdate as nvarchar(50),
	@todate as nvarchar(50)
AS
BEGIN
	
	select items from htsocai 
where CONVERT(date,created) BETWEEN CONVERT(date,@fromdate) AND CONVERT(date,@todate)


END
GO
