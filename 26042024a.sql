USE [Warehouse_BPS]
GO
/****** Object:  Table [dbo].[TBL_USER2]    Script Date: 04/26/2024 05:14:59 ******/
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
/****** Object:  StoredProcedure [dbo].[NH_BaocaocongnoNCC]    Script Date: 04/26/2024 05:14:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_BaocaocongnoNCC]
	
AS
BEGIN
	
select id,mancc as makh,tenncc as tenkh,congnodi as congnoden,'' sohoadon,createdate as createddate from htnhacungcap

END
GO
/****** Object:  StoredProcedure [dbo].[NH_Baocaocongno_theongay_NCC]    Script Date: 04/26/2024 05:14:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_Baocaocongno_theongay_NCC] --NH_Baocaocongno_theongay_NCC '2024-03-24','2024-04-27'
	@_fromdate as nvarchar(50),
	@_todate as nvarchar(50)
AS
BEGIN

	select a.id,
	a.idncc as makh,
	(select tenncc from htnhacungcap b where b.id=a.idncc) as tenkh,
	a.psno as congnoden,
	a.sohd as sohoadon,
	a.created as createddate
 from htsonhaphang a where a.psno<0 and convert(varchar,a.created,120) BETWEEN convert(varchar,@_fromdate,120) AND convert(varchar,@_todate,120)


END
GO
/****** Object:  StoredProcedure [dbo].[NH_thongtinthekho_NCC]    Script Date: 04/26/2024 05:14:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_thongtinthekho_NCC] -- NH_thongtinthekho_NCC '2','2024-03-24','2024-04-27'
	@makh as nvarchar(50), 
	@_fromdate as nvarchar(50), 
	@_todate as nvarchar(50)
AS
BEGIN

	select a.sohd as sohoadon,
	a.idncc as makh,
	(select tenncc from htnhacungcap b where b.id=a.idncc) as tenkh,
	a.tongtien as tongtien,
	a.psno as congnoden,	
	a.created as createddate
 from htsonhaphang a where a.idncc=@makh and a.psno<0 and convert(varchar,a.created,120) BETWEEN convert(varchar,@_fromdate,120) AND convert(varchar,@_todate,120)

	
	
END
GO
/****** Object:  StoredProcedure [dbo].[NH_infor_thongtincongnoNCC]    Script Date: 04/26/2024 05:14:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_infor_thongtincongnoNCC]  --NH_infor_thongtincongnoNCC '37','2024-04-24','2024-04-27'
	@idhoadon as nvarchar(50),
	@_fromdate as nvarchar(50),
	@_todate as nvarchar(50)
AS
BEGIN

	if exists(select * from [Warehouse_BPS].[dbo].[htsonhaphang] where id=@idhoadon)
	begin
--print('asdfa')
			--select tenphong,giaphong,[items] from [Warehouse_BPS].[dbo].[htsocai] where tenphong=@tenphong
			--select [items],tienhang,giaphong from [Warehouse_BPS].[dbo].[htsocai] where tenphong=@tenphong and Flag='0'
			--select [items],tienhang,giaphong,ngaygiothue from [Warehouse_BPS].[dbo].[htsocai] where tenphong=@tenphong and Flag='0'
		select [items],tongtien,'' as giaphong,'' as ngaygiothue,'' as statusKaraoke,'' as giohat,
sohd as sohoadon,'' as hinhthucnghi from [Warehouse_BPS].[dbo].[htsonhaphang] 
where id=@idhoadon and convert(varchar,created,120) BETWEEN convert(varchar,@_fromdate,120) AND convert(varchar,@_todate,120)
	end
	else
	begin
		select 0
	end



END
GO
/****** Object:  StoredProcedure [dbo].[NH_infor_thongtincongnoKH]    Script Date: 04/26/2024 05:14:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_infor_thongtincongnoKH]  --NH_infor_thongtincongnoKH '37','2024-04-24','2024-04-27'
	@idhoadon as nvarchar(50),
	@_fromdate as nvarchar(50),
	@_todate as nvarchar(50)
AS
BEGIN

declare @checkaraoke  as nvarchar(10)
declare @giohatkaraoke  as float
declare @sohoadon as nvarchar(10)

set @sohoadon = (select top 1 ID from [Warehouse_BPS].[dbo].[htsocai] where Flag=1 order by ID desc)

if exists(select karaoke from [Warehouse_BPS].[dbo].[htphong] where karaoke=1 and id=@idhoadon)
begin
	set @checkaraoke = 'Karaoke'
	set @giohatkaraoke = (select tiengiohat from [Warehouse_BPS].[dbo].[htphong] where  id=@idhoadon)
end
else if exists(select nhanghi from [Warehouse_BPS].[dbo].[htphong] where karaoke=0 and nhanghi=1 and id=@idhoadon)
begin
	set @checkaraoke = 'hotel'
	set @giohatkaraoke = 0
end
else
begin
	set @checkaraoke = 'Nhahang'
	set @giohatkaraoke = 0
end

	if exists(select * from [Warehouse_BPS].[dbo].[htsocai] where id=@idhoadon and Flag='1')
	begin
--print('asdfa')
			--select tenphong,giaphong,[items] from [Warehouse_BPS].[dbo].[htsocai] where tenphong=@tenphong
			--select [items],tienhang,giaphong from [Warehouse_BPS].[dbo].[htsocai] where tenphong=@tenphong and Flag='0'
			--select [items],tienhang,giaphong,ngaygiothue from [Warehouse_BPS].[dbo].[htsocai] where tenphong=@tenphong and Flag='0'
		select [items],tienhang,giaphong,CONVERT(varchar,ngaygiothue,22) as ngaygiothue,@checkaraoke as statusKaraoke,@giohatkaraoke as giohat,
@sohoadon as sohoadon,hinhthucnghi from [Warehouse_BPS].[dbo].[htsocai] 
where id=@idhoadon and Flag='1' and convert(varchar,created,120) BETWEEN convert(varchar,@_fromdate,120) AND convert(varchar,@_todate,120)
	end
	else
	begin
		select 0
	end



END
GO
/****** Object:  StoredProcedure [dbo].[addthongtinhanghoa_PBH]    Script Date: 04/26/2024 05:14:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[addthongtinhanghoa_PBH]  --addthongtinhanghoa_PBH '', '0','0','NCC','13000','{"biahn,5000,5000":1,"biaken,8000,8000":1}'
	@thanhtoantien as nvarchar(50),
	@psno as nvarchar(20),
	@chietkhau as nvarchar(20), 
    @nhacungcap as nvarchar(20), 
	@tienhang as nvarchar(20), 
	@items as nvarchar(300)
AS
BEGIN
--check ban ghi dau tien
declare @countid int
declare @soHD as nvarchar(50)
declare @maxHD as nvarchar(10)
declare @tongtienthanhtoan  as float

--declare @NCC as int
--set @NCC =1

set 	@countid = (select count(ID) FROM htsocai)
if (@countid > 0)
begin
	--select 1  -- co ban ghi roi
	--tao so hoadon
	set @maxHD = (select max(cast(substring(sohd,4,len(sohd)-3) as int))+1 from htsocai)
	set @soHD = 'BH_'+@maxHD
	--set @tongtienthanhtoan = cast(@tienhang as float) - cast(@chietkhau as float)
	--type =1 : nhahang,hotel,khachsan
	--type =2 : Phieu ban hang
	insert into htsocai (sohd,idncc,items,tienhang,tongtien,chietkhau,tiensauchietkhau,psco,type,Flag) values(@soHD,cast(@nhacungcap as int),@items,@tienhang,@tienhang,@chietkhau,cast(@thanhtoantien as float),cast(@psno as float),2,1)    

	--update cong no khach NCC
	if(@psno <> '0')
	begin
		--update cong no bang mater
		update htkhachhang set congnoden=congnoden + cast(@psno as float) where id =cast(@nhacungcap as int)
	end

	select 1
	

--select substring('NH_1',4,1) as abc

end
else
begin
	-- TRUONG HOP khong co ban ghi
	--select 0
	--tao so hoadon
	set @maxHD = '1'
	set @soHD = 'BH_'+@maxHD
	--set @tongtienthanhtoan = cast(@tienhang as float) - cast(@chietkhau as float)
	--insert ban ghi
	--type =1 : nhahang,hotel,khachsan
	--type =2 : Phieu ban hang
	insert into htsocai (sohd,idncc,items,tienhang,tongtien,chietkhau,tiensauchietkhau,psco,type) values(@soHD,cast(@nhacungcap as int),@items,@tienhang,@tienhang,@chietkhau,cast(@thanhtoantien as float),cast(@psno as float),2)    
	--update kho  -> xu ly o code c#

	--update cong no khach NCC
	if(@psno <> '0')
	begin
		--update cong no bang mater
		update htkhachhang set congnoden=congnoden + cast(@psno as float) where id =cast(@nhacungcap as int)
	end
	
	
	select 1	

end
	
END
GO
/****** Object:  StoredProcedure [dbo].[NH_Baocaosoquy]    Script Date: 04/26/2024 05:14:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_Baocaosoquy]
	
AS
BEGIN
	
SELECT id,
(CASE
    WHEN typeHD='0' THEN 'Phieu Chi'
    ELSE 'Phieu Thu'
END) as typeHD
--typeHD
,MaHD,IDketoan,IDnguoinhan,IDkhachhang,IDnhacungcap,psco,psno,Mota,ngaygiaodich,phuongthucTT,Createdate FROM htSoQuy


END
GO
/****** Object:  StoredProcedure [dbo].[NH_Baocaosoquy_theongay]    Script Date: 04/26/2024 05:14:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_Baocaosoquy_theongay] --NH_Baocaosoquy_theongay '2024-04-24','2024-04-24'
	@_fromdate as nvarchar(50),
	@_todate as nvarchar(50)
AS
BEGIN
	
SELECT id,
(CASE
    WHEN typeHD='0' THEN 'Phieu Chi'
    ELSE 'Phieu Thu'
END) as typeHD
--typeHD
,MaHD,IDketoan,IDnguoinhan,IDkhachhang,IDnhacungcap,psco,psno,Mota,ngaygiaodich,phuongthucTT,Createdate FROM htSoQuy
where convert(varchar,Createdate,120) BETWEEN convert(varchar,@_fromdate,120) AND convert(varchar,@_todate,120)


END
GO
