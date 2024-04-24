USE [Warehouse_BPS]
GO
/****** Object:  Table [dbo].[hthanghoa]    Script Date: 04/24/2024 5:02:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hthanghoa](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[mahang] [nvarchar](50) NULL,
	[tenhang] [nvarchar](50) NULL,
	[dvt] [nvarchar](50) NULL,
	[soluongton] [int] NULL,
	[anh] [nvarchar](50) NULL,
	[gianhap] [float] NULL,
	[giaban] [float] NULL,
	[nhomhangid] [int] NULL,
	[userid] [nvarchar](50) NULL,
	[created] [datetime] NULL,
	[modified] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[hthanghoa] ADD  CONSTRAINT [DF_hthanghoa_created]  DEFAULT (getdate()) FOR [created]
GO
/****** Object:  StoredProcedure [dbo].[NH_BaocaoBH_theongay]    Script Date: 04/24/2024 5:02:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[NH_BaocaoBH_theongay] -- NH_BaocaoBH_theongay '2024-04-24','2024-04-24'
	@_fromdate as nvarchar(50),
	@_todate as nvarchar(50)
AS
BEGIN

select id,sohd,type,ngaygiothue,ngaygiora,tongthoigianthue,tenphong,
tienphong,tiengiohat,items,tienhang,tongtien,chietkhau,tiensauchietkhau,hinhthucnghi,mohinh,created from htsocai 
where CONVERT(date,created) BETWEEN CONVERT(date,@_fromdate) AND CONVERT(date,@_todate)

union 

select '1000' as id,'-','-','','','','Tong tien',
(select sum(tienphong) from htsocai where CONVERT(date,created) BETWEEN CONVERT(date,@_fromdate) AND CONVERT(date,@_todate)) as tienphong,
(select sum(tiengiohat) from htsocai where CONVERT(date,created) BETWEEN CONVERT(date,@_fromdate) AND CONVERT(date,@_todate)) as tiengiohat,
'' as items,
(select sum(tienhang) from htsocai where CONVERT(date,created) BETWEEN CONVERT(date,@_fromdate) AND CONVERT(date,@_todate)) as tienhang,
(select sum(tongtien) from htsocai where CONVERT(date,created) BETWEEN CONVERT(date,@_fromdate) AND CONVERT(date,@_todate)) as tongtien,
(select sum(chietkhau) from htsocai where CONVERT(date,created) BETWEEN CONVERT(date,@_fromdate) AND CONVERT(date,@_todate)) as chietkhau,
(select sum(tiensauchietkhau) from htsocai where CONVERT(date,created) BETWEEN CONVERT(date,@_fromdate) AND CONVERT(date,@_todate))as tiensauchietkhau,
'' as hinhthucnghi,
'' as mohinh,
'' as created
from htsocai





END
GO
/****** Object:  StoredProcedure [dbo].[NH_BaocaoNH_theongay]    Script Date: 04/24/2024 5:02:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[NH_BaocaoNH_theongay]  -- NH_BaocaoNH_theongay '2024-04-24','2024-04-24'
	@_fromdate as nvarchar(50),
	@_todate as nvarchar(50)
AS
BEGIN
		SELECT TOP 1000 [id],[sohd],[idncc],[items],[tongtien],[chietkhau],[tongtienthanhtoan],[psco],[psno]
      --,[ghichu]
      --,[userid]
      ,[created]
      --,[modified]
  FROM [Warehouse_BPS].[dbo].[htsonhaphang] where CONVERT(date,created) BETWEEN CONVERT(date,@_fromdate) AND CONVERT(date,@_todate)

union

select '1000' as id, '-','-','Tong tien',
(select sum(tongtien) from htsonhaphang where CONVERT(date,created) BETWEEN CONVERT(date,@_fromdate) AND CONVERT(date,@_todate)) as tongtien,
(select sum(chietkhau) from htsonhaphang where CONVERT(date,created) BETWEEN CONVERT(date,@_fromdate) AND CONVERT(date,@_todate)) as chietkhau,
(select sum(tongtienthanhtoan) from htsonhaphang where CONVERT(date,created) BETWEEN CONVERT(date,@_fromdate) AND CONVERT(date,@_todate)) as tongtienthanhtoan,
(select sum(psco) from htsonhaphang where CONVERT(date,created) BETWEEN CONVERT(date,@_fromdate) AND CONVERT(date,@_todate)) as psco,
(select sum(psno) from htsonhaphang where CONVERT(date,created) BETWEEN CONVERT(date,@_fromdate) AND CONVERT(date,@_todate)) as psno,
'' as created
from htsonhaphang


END
GO
/****** Object:  StoredProcedure [dbo].[NH_Baocaotonkho]    Script Date: 04/24/2024 5:02:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[NH_Baocaotonkho]
	
AS
BEGIN
	
	SELECT TOP (1000) [id]
      ,[mahang]
      ,[tenhang]
      ,[dvt]
      ,[soluongton]
      ,[anh]
      ,[gianhap]
      ,[giaban]
      ,[nhomhangid]
      ,[userid]
      ,[created]
      ,[modified]
  FROM [Warehouse_BPS].[dbo].[hthanghoa]


END
GO
/****** Object:  StoredProcedure [dbo].[NH_thongtinthekho]    Script Date: 04/24/2024 5:02:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[NH_thongtinthekho] --NH_thongtinthekho '','2024-04-24','2024-04-24'
	@mahang as nvarchar(50),
	@fromdate as nvarchar(50),
	@todate as nvarchar(50)
AS
BEGIN
	
	select sohd,items,created,'xuathang' as typetk from htsocai 
where CONVERT(date,created) BETWEEN CONVERT(date,@fromdate) AND CONVERT(date,@todate)

union

select sohd,items,created,'nhaphang' as typetk from htsonhaphang 
where CONVERT(date,created) BETWEEN CONVERT(date,@fromdate) AND CONVERT(date,@todate)




END
GO
