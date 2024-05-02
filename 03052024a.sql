USE [Warehouse_BPS]
GO
/****** Object:  Table [dbo].[TBL_USER2]    Script Date: 05/03/2024 01:07:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBL_USER2](
	[U_ID] [int] IDENTITY(1,1) NOT NULL,
	[U_NAME] [varchar](50) NOT NULL,
	[U_PASSWORD] [varchar](255) NOT NULL,
	[U_FULLNAME] [nvarchar](2550) NOT NULL,
	[U_EMAIL] [varchar](100) NULL,
	[U_GROUP] [varchar](10) NULL,
	[U_ACTIVE] [varchar](50) NULL CONSTRAINT [DF_TBL_USER2_U_ACTIVE]  DEFAULT ('Y'),
	[ROLE] [nvarchar](200) NOT NULL,
	[INSERT_DATE] [datetime] NULL CONSTRAINT [DF_TBL_USER2_INSERT_DATE]  DEFAULT (getdate())
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[NH_BaocaoNH_theongay]    Script Date: 05/03/2024 01:07:10 ******/
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
  FROM htsonhaphang where convert(varchar,created,23) BETWEEN convert(varchar,@_fromdate,23) AND convert(varchar,@_todate,23)
--convert(varchar,created,23) BETWEEN convert(varchar,@_fromdate,23) AND convert(varchar,@_todate,23)
union

select '1000' as id, '-','-','Tong tien',
(select sum(tongtien) from htsonhaphang where convert(varchar,created,23) BETWEEN convert(varchar,@_fromdate,23) AND convert(varchar,@_todate,23)) as tongtien,
(select sum(chietkhau) from htsonhaphang where convert(varchar,created,23) BETWEEN convert(varchar,@_fromdate,23) AND convert(varchar,@_todate,23)) as chietkhau,
(select sum(tongtienthanhtoan) from htsonhaphang where convert(varchar,created,23) BETWEEN convert(varchar,@_fromdate,23) AND convert(varchar,@_todate,23)) as tongtienthanhtoan,
(select sum(psco) from htsonhaphang where convert(varchar,created,23) BETWEEN convert(varchar,@_fromdate,23) AND convert(varchar,@_todate,23)) as psco,
(select sum(psno) from htsonhaphang where convert(varchar,created,23) BETWEEN convert(varchar,@_fromdate,23) AND convert(varchar,@_todate,23)) as psno,
'' as created
from htsonhaphang


END
GO
/****** Object:  StoredProcedure [dbo].[NH_BaocaoNH]    Script Date: 05/03/2024 01:07:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_BaocaoNH]
	
AS
BEGIN
	SELECT TOP 1000 [id],[sohd],[idncc],[items],[tongtien],[chietkhau],[tongtienthanhtoan],[psco],[psno]
      --,[ghichu]
      --,[userid]
      ,[created]
      --,[modified]
  FROM htsonhaphang where convert(varchar, created, 23) = convert(varchar, getdate(), 23)

union

select '1000' as id, '-','-','Tong tien',
(select sum(tongtien) from htsonhaphang where convert(varchar, created, 23) = convert(varchar, getdate(), 23)) as tongtien,
(select sum(chietkhau) from htsonhaphang where convert(varchar, created, 23) = convert(varchar, getdate(), 23)) as chietkhau,
(select sum(tongtienthanhtoan) from htsonhaphang where convert(varchar, created, 23) = convert(varchar, getdate(), 23)) as tongtienthanhtoan,
(select sum(psco) from htsonhaphang where convert(varchar, created, 23) = convert(varchar, getdate(), 23)) as psco,
(select sum(psno) from htsonhaphang where convert(varchar, created, 23) = convert(varchar, getdate(), 23)) as psno,
'' as created
from htsonhaphang where convert(varchar, created, 23) = convert(varchar, getdate(), 23)



END
GO
/****** Object:  StoredProcedure [dbo].[NH_BaocaoBH_theongay]    Script Date: 05/03/2024 01:07:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_BaocaoBH_theongay] -- NH_BaocaoBH_theongay '2024-05-02','2024-05-02'
	@_fromdate as nvarchar(50),
	@_todate as nvarchar(50)
AS
BEGIN

select id,sohd,type,ngaygiothue,ngaygiora,tongthoigianthue,tenphong,
tienphong,tiengiohat,items,tienhang,tongtien,chietkhau,tiensauchietkhau,hinhthucnghi,mohinh,created,idnhanvien,psco,CONVERT(VARCHAR(5),ngaygiothue,108) as giovao,CONVERT(VARCHAR(5),ngaygiora,108)as giora from htsocai 
where convert(varchar,created,23) BETWEEN convert(varchar,@_fromdate,23) AND convert(varchar,@_todate,23)
--convert(varchar,created,23) BETWEEN convert(varchar,@_fromdate,23) AND convert(varchar,@_todate,23)
union 

select '1000' as id,'-','-','','','','Tong tien',
(select sum(tienphong) from htsocai where convert(varchar,created,23) BETWEEN convert(varchar,@_fromdate,23) AND convert(varchar,@_todate,23)) as tienphong,
(select sum(tiengiohat) from htsocai where convert(varchar,created,23) BETWEEN convert(varchar,@_fromdate,23) AND convert(varchar,@_todate,23)) as tiengiohat,
'' as items,
(select sum(tienhang) from htsocai where convert(varchar,created,23) BETWEEN convert(varchar,@_fromdate,23) AND convert(varchar,@_todate,23)) as tienhang,
(select sum(tongtien) from htsocai where convert(varchar,created,23) BETWEEN convert(varchar,@_fromdate,23) AND convert(varchar,@_todate,23)) as tongtien,
(select sum(chietkhau) from htsocai where convert(varchar,created,23) BETWEEN convert(varchar,@_fromdate,23) AND convert(varchar,@_todate,23)) as chietkhau,
(select sum(tiensauchietkhau) from htsocai where convert(varchar,created,23) BETWEEN convert(varchar,@_fromdate,23) AND convert(varchar,@_todate,23))as tiensauchietkhau,
'' as hinhthucnghi,
'' as mohinh,
'' as created,
'' as idnhanvien,
'' as psco,
'' as giovao,
'' as giora

from htsocai





END
GO
/****** Object:  StoredProcedure [dbo].[NH_BaocaoBH]    Script Date: 05/03/2024 01:07:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_BaocaoBH]
	
AS
BEGIN

select * from 
(
select id,sohd,type,ngaygiothue,ngaygiora,tongthoigianthue,tenphong,
tienphong,tiengiohat,items,tienhang,tongtien,chietkhau,tiensauchietkhau,hinhthucnghi,mohinh,created,idnhanvien,psco,CONVERT(VARCHAR(5),ngaygiothue,108) as giovao,CONVERT(VARCHAR(5),ngaygiora,108) as giora from htsocai where convert(varchar, created, 23) = convert(varchar, getdate(), 23)

union 

select '' as id,'-','-','','','','Tong tien',
(select sum(tienphong) from htsocai where convert(varchar, created, 23) = convert(varchar, getdate(), 23)) as tienphong,
(select sum(tiengiohat) from htsocai where convert(varchar, created, 23) = convert(varchar, getdate(), 23)) as tiengiohat,
'' as items,
(select sum(tienhang) from htsocai where convert(varchar, created, 23) = convert(varchar, getdate(), 23)) as tienhang,
(select sum(tongtien) from htsocai where convert(varchar, created, 23) = convert(varchar, getdate(), 23)) as tongtien,
(select sum(chietkhau) from htsocai where convert(varchar, created, 23) = convert(varchar, getdate(), 23)) as chietkhau,
(select sum(tiensauchietkhau) from htsocai where convert(varchar, created, 23) = convert(varchar, getdate(), 23))as tiensauchietkhau,
'' as hinhthucnghi,
'' as mohinh,
GETDATE() as created,
'' as idnhanvien,
'' as psco,
'' as giovao,
'' as giora
from htsocai where convert(varchar, created, 23) = convert(varchar, getdate(), 23)
) ABC order by created asc





END
GO
/****** Object:  StoredProcedure [dbo].[NH_Baocaothuchi_theongay]    Script Date: 05/03/2024 01:07:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_Baocaothuchi_theongay] --NH_Baocaothuchi_theongay '2024-05-02','2024-05-02'
	@tungay as nvarchar(50),
	@denngay as nvarchar(50)

AS
BEGIN
	
declare @tongthutheongay as nvarchar(50)
declare @tongchitheongay as nvarchar(50)
declare @doanhsobanhang as nvarchar(50)

set @tongthutheongay = (select sum(psco) as tongthu from htSoQuy where typeHD=1 and convert(varchar,Createdate,23) BETWEEN convert(varchar,@tungay,23) AND convert(varchar,@denngay,23))
set @tongchitheongay = (select sum(psno) as tongchi from htSoQuy where typeHD=0 and convert(varchar,Createdate,23) BETWEEN convert(varchar,@tungay,23) AND convert(varchar,@denngay,23))
set @doanhsobanhang = (select sum(tiensauchietkhau) as doanhthu from htsocai where convert(varchar,created,23) BETWEEN convert(varchar,@tungay,23) AND convert(varchar,@denngay,23))


print(@tongthutheongay)
print(@tongchitheongay)
print(@doanhsobanhang)

select @tongthutheongay as tongthu,@tongchitheongay as tongchi, @doanhsobanhang as tongdoanhso

END
GO
/****** Object:  StoredProcedure [dbo].[NH_Baocaosoquy_theongay]    Script Date: 05/03/2024 01:07:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_Baocaosoquy_theongay] --NH_Baocaosoquy_theongay '2024-04-24','2024-04-24'
	@_fromdate as nvarchar(50),
	@_todate as nvarchar(50)
AS
BEGIN
	
select * from 
(

SELECT id,
(CASE
    WHEN typeHD='0' THEN 'Phieu Chi'
    ELSE 'Phieu Thu'
END) as typeHD
--typeHD
,MaHD,IDketoan,IDnguoinhan,IDkhachhang,IDnhacungcap,psco,psno,Mota,ngaygiaodich,phuongthucTT,Createdate FROM htSoQuy
where convert(varchar,Createdate,23) BETWEEN convert(varchar,@_fromdate,23) AND convert(varchar,@_todate,23)

union

select '','','','','','','',
(select sum(psco) from htSoQuy) as psco,
(select sum(psno) from htSoQuy) as psco,
'',
'',
'',GETDATE() as Createdate
from htSoQuy

) ABC order by Createdate asc 

END
GO
/****** Object:  StoredProcedure [dbo].[NH_Baocaosoquy]    Script Date: 05/03/2024 01:07:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_Baocaosoquy]
	
AS
BEGIN
	
select * from 
(
SELECT id,
(CASE
    WHEN typeHD='0' THEN 'Phieu Chi'
    ELSE 'Phieu Thu'
END) as typeHD
--typeHD
,MaHD,IDketoan,IDnguoinhan,IDkhachhang,IDnhacungcap,psco,psno,Mota,ngaygiaodich,phuongthucTT,Createdate FROM htSoQuy where convert(varchar,Createdate,23) = convert(varchar,getdate(),23)

union

select '','','','','','','',
(select sum(psco) from htSoQuy where convert(varchar,Createdate,23) = convert(varchar,getdate(),23)) as psco,
(select sum(psno) from htSoQuy where convert(varchar,Createdate,23) = convert(varchar,getdate(),23)) as psco,
'',
'',
'',GETDATE() as Createdate
from htSoQuy 
) ABC order by Createdate asc 



END
GO
/****** Object:  StoredProcedure [dbo].[NH_Baocaotonkho]    Script Date: 05/03/2024 01:07:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_Baocaotonkho]
	
AS
BEGIN
	
	SELECT TOP 1000 [id]
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
  FROM hthanghoa


END
GO
