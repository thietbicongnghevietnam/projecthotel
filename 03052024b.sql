USE [Warehouse_BPS]
GO

/****** Object:  StoredProcedure [dbo].[NH_Baocaotonkho_lolai]    Script Date: 05/03/2024 5:04:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[NH_Baocaotonkho_lolai]
	
AS
BEGIN
	
	SELECT TOP 1000 [id]
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
where convert(varchar,created,23) BETWEEN CONVERT(varchar,@fromdate,23) AND CONVERT(varchar,@todate,23)


END
GO
