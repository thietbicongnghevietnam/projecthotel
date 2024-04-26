USE [Warehouse_BPS]
GO
/****** Object:  Table [dbo].[TBL_USER2]    Script Date: 04/26/2024 5:17:41 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NH_BaocaoBH]    Script Date: 04/26/2024 5:17:41 PM ******/
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
tienphong,tiengiohat,items,tienhang,tongtien,chietkhau,tiensauchietkhau,hinhthucnghi,mohinh,created from htsocai

union 

select '' as id,'-','-','','','','Tong tien',
(select sum(tienphong) from htsocai) as tienphong,
(select sum(tiengiohat) from htsocai) as tiengiohat,
'' as items,
(select sum(tienhang) from htsocai) as tienhang,
(select sum(tongtien) from htsocai) as tongtien,
(select sum(chietkhau) from htsocai) as chietkhau,
(select sum(tiensauchietkhau) from htsocai)as tiensauchietkhau,
'' as hinhthucnghi,
'' as mohinh,
GETDATE() as created
from htsocai
) ABC order by created asc





END
GO
/****** Object:  StoredProcedure [dbo].[NH_Baocaosoquy]    Script Date: 04/26/2024 5:17:41 PM ******/
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
,MaHD,IDketoan,IDnguoinhan,IDkhachhang,IDnhacungcap,psco,psno,Mota,ngaygiaodich,phuongthucTT,Createdate FROM htSoQuy

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
/****** Object:  StoredProcedure [dbo].[NH_Baocaosoquy_theongay]    Script Date: 04/26/2024 5:17:41 PM ******/
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
where convert(varchar,Createdate,120) BETWEEN convert(varchar,@_fromdate,120) AND convert(varchar,@_todate,120)

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
/****** Object:  StoredProcedure [dbo].[NH_infor_thongtinhanghoa2]    Script Date: 04/26/2024 5:17:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_infor_thongtinhanghoa2]  --NH_infor_thongtinhanghoa2 '15'
	@idhoadon as nvarchar(50)
AS
BEGIN

	if exists(select * from [Warehouse_BPS].[dbo].[htsocai] where id=@idhoadon)
	begin
			--select tenphong,giaphong,[items] from [Warehouse_BPS].[dbo].[htsocai] where tenphong=@tenphong
			--select [items],tienhang,giaphong from [Warehouse_BPS].[dbo].[htsocai] where tenphong=@tenphong and Flag='0'
			--select [items],tienhang,giaphong,ngaygiothue from [Warehouse_BPS].[dbo].[htsocai] where tenphong=@tenphong and Flag='0'
		select [items],tienhang,giaphong,CONVERT(varchar,ngaygiothue,22) as ngaygiothue,'' as statusKaraoke,'' as giohat,'' as sohoadon,hinhthucnghi from [Warehouse_BPS].[dbo].[htsocai] where id=@idhoadon
	end
	else
	begin
		select 0
	end



END
GO
