USE [Warehouse_BPS]
GO
/****** Object:  Table [dbo].[TBL_USER2]    Script Date: 04/30/2024 23:38:30 ******/
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
/****** Object:  StoredProcedure [dbo].[NH_select_nhomhang]    Script Date: 04/30/2024 23:38:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_select_nhomhang]
	
AS
BEGIN

	select [id],[manhomhang] ,[tennhomhang] from htnhomhang
	 
END
GO
/****** Object:  StoredProcedure [dbo].[NH_insert_nhacungcap]    Script Date: 04/30/2024 23:38:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_insert_nhacungcap]
	@makh as nvarchar(50), 
	@tenkh as nvarchar(50), 
	@congnoden as nvarchar(50), 
	@congnodi as nvarchar(50)
AS
BEGIN
	
	if not exists(select * FROM htnhacungcap where mancc = @makh)
	begin
		insert into htnhacungcap(mancc,tenncc,congnoden,congnodi) values(@makh,@tenkh,@congnoden,@congnodi)
		select top 1 id,mancc from htnhacungcap order by id desc
	end
	else
	begin
		select 0
	end

END
GO
/****** Object:  StoredProcedure [dbo].[addthongtinhanghoa_PNH]    Script Date: 04/30/2024 23:38:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[addthongtinhanghoa_PNH]  --addthongtinhanghoa_PNH '', '0','0','NCC','13000','{"biahn,5000,5000":1,"biaken,8000,8000":1}'
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

set 	@countid = (select count(ID) FROM htsonhaphang)
if (@countid > 0)
begin
	--select 1  -- co ban ghi roi
	--tao so hoadon
	set @maxHD = (select max(cast(substring(sohd,4,len(sohd)-3) as int))+1 from htsonhaphang)
	set @soHD = 'NH_'+@maxHD
	--set @tongtienthanhtoan = cast(@tienhang as float) - cast(@chietkhau as float)
	insert into htsonhaphang (sohd,idncc,items,tongtien,chietkhau,tongtienthanhtoan,psno) values(@soHD,cast(@nhacungcap as int),@items,@tienhang,@chietkhau,cast(@thanhtoantien as float),cast(@psno as float))    

	--update cong no khach NCC
	if(@psno <> '0')
	begin
		--update cong no bang mater
		update htnhacungcap set congnodi=congnodi + cast(@psno as float) where id =cast(@nhacungcap as int)
	end

	select 1,@soHD
	

--select substring('NH_1',4,1) as abc

end
else
begin
	-- TRUONG HOP khong co ban ghi
	--select 0
	--tao so hoadon
	set @maxHD = '1'
	set @soHD = 'NH_'+@maxHD
	set @tongtienthanhtoan = cast(@tienhang as float) - cast(@chietkhau as float)
	--insert ban ghi
	insert into htsonhaphang (sohd,idncc,items,tongtien,chietkhau,tongtienthanhtoan,psno) values(@soHD,cast(@nhacungcap as int),@items,@tienhang,@chietkhau,cast(@thanhtoantien as float),cast(@psno as float))
	--update kho  -> xu ly o code c#

	--update cong no khach NCC
	if(@psno <> '0')
	begin
		--update cong no bang mater
		update htnhacungcap set congnodi=congnodi + cast(@psno as float) where id =cast(@nhacungcap as int)
	end
	
	
	select 1,@soHD	

end
	
END
GO
/****** Object:  StoredProcedure [dbo].[NH_BaocaoNH_theongay]    Script Date: 04/30/2024 23:38:26 ******/
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
/****** Object:  StoredProcedure [dbo].[NH_infor_thongtincongnoNCC]    Script Date: 04/30/2024 23:38:27 ******/
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

	if exists(select * from htsonhaphang where id=@idhoadon)
	begin
--print('asdfa')
			--select tenphong,giaphong,[items] from [Warehouse_BPS].[dbo].[htsocai] where tenphong=@tenphong
			--select [items],tienhang,giaphong from [Warehouse_BPS].[dbo].[htsocai] where tenphong=@tenphong and Flag='0'
			--select [items],tienhang,giaphong,ngaygiothue from [Warehouse_BPS].[dbo].[htsocai] where tenphong=@tenphong and Flag='0'
		select [items],tongtien,'' as giaphong,'' as ngaygiothue,'' as statusKaraoke,'' as giohat,
sohd as sohoadon,'' as hinhthucnghi from htsonhaphang
where id=@idhoadon and convert(varchar,created,23) BETWEEN convert(varchar,@_fromdate,23) AND convert(varchar,@_todate,23)
	end
	else
	begin
		select 0
	end



END
GO
/****** Object:  StoredProcedure [dbo].[NH_BaocaoNH]    Script Date: 04/30/2024 23:38:26 ******/
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
/****** Object:  StoredProcedure [dbo].[NH_getsohoadon_NH]    Script Date: 04/30/2024 23:38:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_getsohoadon_NH]
	
AS
BEGIN
	declare @sohoadon as nvarchar(10)
	declare @checkbegin as int

	set @checkbegin = (select count(sohd) FROM htsonhaphang)

	if (@checkbegin > 0)
	begin		
		--set @sohoadon = (select count(ID) as countid  from [Warehouse_BPS].[dbo].[htsocai] where Flag=1 )
	    set @sohoadon = (select top 1 sohd FROM htsonhaphang order by id desc)
		select @sohoadon
	end
	else
	begin
		--set @sohoadon = 0
		select 0
	end

END
GO
/****** Object:  StoredProcedure [dbo].[NH_infor_thongtinhanghoa2_NH]    Script Date: 04/30/2024 23:38:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_infor_thongtinhanghoa2_NH]  --NH_infor_thongtinhanghoa2_NH 'NH_15'
	@idhoadon as nvarchar(50)
AS
BEGIN
	declare @sohoadon_new as nvarchar(50)
	declare @maxHD as nvarchar(10)
	set @maxHD = (select max(cast(substring(@idhoadon,4,len(@idhoadon)-3) as int))+1 )
	set @sohoadon_new = 'NH_'+@maxHD

	if exists(select * from htsonhaphang where sohd=@sohoadon_new)
	begin
			--select tenphong,giaphong,[items] from [Warehouse_BPS].[dbo].[htsocai] where tenphong=@tenphong
			--select [items],tienhang,giaphong from [Warehouse_BPS].[dbo].[htsocai] where tenphong=@tenphong and Flag='0'
			--select [items],tienhang,giaphong,ngaygiothue from [Warehouse_BPS].[dbo].[htsocai] where tenphong=@tenphong and Flag='0'
		select [items],tongtien as tienhang,'' as giaphong,'' as ngaygiothue,'' as statusKaraoke,'' as giohat,sohd as sohoadon,'' as hinhthucnghi,chietkhau,tongtienthanhtoan as tiensauchietkhau,psno as psco,created from htsonhaphang where sohd=@sohoadon_new
	end
	else
	begin
		select 0
	end



END
GO
/****** Object:  StoredProcedure [dbo].[NH_infor_thongtinhanghoa2_inlai_NH]    Script Date: 04/30/2024 23:38:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[NH_infor_thongtinhanghoa2_inlai_NH]  --NH_infor_thongtinhanghoa2_inlai_NH 'NH_15'
	@idhoadon as nvarchar(50)
AS
BEGIN
--	declare @sohoadon_new as nvarchar(50)
--	declare @maxHD as nvarchar(10)
--	set @maxHD = (select max(cast(substring(@idhoadon,4,len(@idhoadon)-3) as int))+1 )
--	set @sohoadon_new = 'BH_'+@maxHD

	if exists(select * from htsonhaphang where sohd=@idhoadon)
	begin
			--select tenphong,giaphong,[items] from [Warehouse_BPS].[dbo].[htsocai] where tenphong=@tenphong
			--select [items],tienhang,giaphong from [Warehouse_BPS].[dbo].[htsocai] where tenphong=@tenphong and Flag='0'
			--select [items],tienhang,giaphong,ngaygiothue from [Warehouse_BPS].[dbo].[htsocai] where tenphong=@tenphong and Flag='0'
		select [items],tongtien as tienhang,'' as giaphong,'' as ngaygiothue,'' as statusKaraoke,'' as giohat,sohd as sohoadon,'' as hinhthucnghi,chietkhau,tongtienthanhtoan as tiensauchietkhau,psno as psco,created from htsonhaphang where sohd=@idhoadon
	end
	else
	begin
		select 0
	end



END
GO
/****** Object:  StoredProcedure [dbo].[NH_infor_thongtinhanghoa2_inlai]    Script Date: 04/30/2024 23:38:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_infor_thongtinhanghoa2_inlai]  --NH_infor_thongtinhanghoa2_inlai 'BH_74'
	@idhoadon as nvarchar(50)
AS
BEGIN
--	declare @sohoadon_new as nvarchar(50)
--	declare @maxHD as nvarchar(10)
--	set @maxHD = (select max(cast(substring(@idhoadon,4,len(@idhoadon)-3) as int))+1 )
--	set @sohoadon_new = 'BH_'+@maxHD

	if exists(select * from [Warehouse_BPS].[dbo].[htsocai] where sohd=@idhoadon)
	begin
			--select tenphong,giaphong,[items] from [Warehouse_BPS].[dbo].[htsocai] where tenphong=@tenphong
			--select [items],tienhang,giaphong from [Warehouse_BPS].[dbo].[htsocai] where tenphong=@tenphong and Flag='0'
			--select [items],tienhang,giaphong,ngaygiothue from [Warehouse_BPS].[dbo].[htsocai] where tenphong=@tenphong and Flag='0'
		select [items],tienhang,giaphong,CONVERT(varchar,ngaygiothue,22) as ngaygiothue,'' as statusKaraoke,'' as giohat,sohd as sohoadon,hinhthucnghi,chietkhau,tiensauchietkhau,psco,created from [Warehouse_BPS].[dbo].[htsocai] where sohd=@idhoadon
	end
	else
	begin
		select 0
	end



END
GO
/****** Object:  StoredProcedure [dbo].[NH_infor_thongtinhanghoa]    Script Date: 04/30/2024 23:38:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_infor_thongtinhanghoa]  --NH_infor_thongtinhanghoa 'Ban6'
	@tenphong as nvarchar(50)
AS
BEGIN

declare @checkaraoke  as nvarchar(10)
declare @giohatkaraoke  as float
declare @sohoadon as nvarchar(10)


declare @nghigio as float
declare @nghidem as float
declare @nghingay as float
declare @nghithang as float
declare @tienphutroi as float
declare @tienphutroiphut as float
declare @timephutroi as int

set @sohoadon = (select top 1 ID from htsocai where Flag=1 order by ID desc)

if exists(select karaoke from htphong where karaoke=1 and tenphong=@tenphong)
begin
	set @checkaraoke = 'Karaoke'
	set @giohatkaraoke = (select tiengiohat from htphong where  tenphong=@tenphong)
	set @nghigio = 0
	set @nghidem = 0
	set @nghingay = 0
	set @nghithang = 0
	set @tienphutroi =0
	set @tienphutroiphut =0
	set @timephutroi =0
end
else if exists(select nhanghi from htphong where karaoke=0 and nhanghi=1 and tenphong=@tenphong)
begin
	set @checkaraoke = 'hotel'
	set @giohatkaraoke = 0
	set @nghigio = (select tiengionghi from htphong where karaoke=0 and nhanghi=1 and tenphong=@tenphong)	
	set @nghidem = (select tiennghidem from htphong where karaoke=0 and nhanghi=1 and tenphong=@tenphong)
	set @nghingay = (select tiennghingay from htphong where karaoke=0 and nhanghi=1 and tenphong=@tenphong)
	set @nghithang = (select tiennghithang from htphong where karaoke=0 and nhanghi=1 and tenphong=@tenphong)
	set @tienphutroi = (select giophutroi from htphong where karaoke=0 and nhanghi=1 and tenphong=@tenphong)
	set @tienphutroiphut = (select giophutroitheophut from htphong where karaoke=0 and nhanghi=1 and tenphong=@tenphong)
	set @timephutroi =(select timephutroi from htphong where karaoke=0 and nhanghi=1 and tenphong=@tenphong)
end
else
begin
	set @checkaraoke = 'Nhahang'
	set @giohatkaraoke = 0
	set @nghigio = 0	
	set @nghidem = 0
	set @nghingay = 0
	set @nghithang = 0
	set @tienphutroi = 0
	set @tienphutroiphut =0
	set @timephutroi =0
end

	if exists(select * from htsocai where tenphong=@tenphong and Flag='0')
	begin
			--select tenphong,giaphong,[items] from [Warehouse_BPS].[dbo].[htsocai] where tenphong=@tenphong
			--select [items],tienhang,giaphong from [Warehouse_BPS].[dbo].[htsocai] where tenphong=@tenphong and Flag='0'
			--select [items],tienhang,giaphong,ngaygiothue from [Warehouse_BPS].[dbo].[htsocai] where tenphong=@tenphong and Flag='0'
		select [items],tienhang,giaphong,CONVERT(varchar,ngaygiothue,22) as ngaygiothue,@checkaraoke as statusKaraoke,@giohatkaraoke as giohat,sohd as sohoadon,hinhthucnghi,@nghigio,@nghidem,@nghingay,@nghithang,@tienphutroi,@tienphutroiphut,@timephutroi,convert(varchar, created, 23) as ngaytao from htsocai where tenphong=@tenphong and Flag='0'
	end
	else
	begin
		select 0
	end



END
GO
/****** Object:  StoredProcedure [dbo].[NH_BaocaoBH_theongay]    Script Date: 04/30/2024 23:38:26 ******/
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
'' as created
from htsocai





END
GO
/****** Object:  StoredProcedure [dbo].[NH_save_khthanhtoan]    Script Date: 04/30/2024 23:38:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_save_khthanhtoan]  -- NH_save_khthanhtoan '2','P05','45000','0','0','0','-45000','0','{"biahn,20000,20000":1,"biaken,25000,25000":1}'
	@idkhachhang as nvarchar(10),
	@tenphong as nvarchar(50), 	 
	@tongtienhang as nvarchar(50),
	@tongtienhat as nvarchar(50),
	@tongtienphong as nvarchar(50),
	@psco as nvarchar(50),
	@tienno as nvarchar(50),
	@tienck as nvarchar(50),
	@items as nvarchar(500)
AS
BEGIN
	
	declare @sohd as nvarchar(50)

	--set @sohd = (select id  FROM htsocai where tenphong=@tenphong and Flag='0')
	set @sohd = (select sohd  FROM htsocai where tenphong=@tenphong and Flag='0')


	if exists(select * FROM htsocai where tenphong=@tenphong and Flag='0')
	begin
		--update trang thai thanh toan
		update htsocai set Flag='1',items=@items,tienhang=@tongtienhang,tongtien=@psco,psno=@tienno,tiengiohat=@tongtienhat,tienphong=@tongtienphong,tiensauchietkhau=@psco,ngaygiora=GETDATE(),idncc=cast(@idkhachhang as int),chietkhau=@tienck where sohd=@sohd

		--update trang thai bang mater khi thanh toan xong  trangthai='0'  (khong co khach)
		update htphong set trangthai='0' where tenphong=@tenphong

		--update cong no khach NCC
		if(@tienno <> '0')
		begin
			--print('vao cong no')
			--update cong no bang mater
			update htkhachhang set congnoden=congnoden + cast(@tienno as float) where id =cast(@idkhachhang as int)
		end

		select 1
	end
	else
	begin
		-- khong ton tai, kiem tra lai
		select 0
	end

END
GO
/****** Object:  StoredProcedure [dbo].[NH_BaocaoBH]    Script Date: 04/30/2024 23:38:26 ******/
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
tienphong,tiengiohat,items,tienhang,tongtien,chietkhau,tiensauchietkhau,hinhthucnghi,mohinh,created from htsocai where convert(varchar, created, 23) = convert(varchar, getdate(), 23)

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
GETDATE() as created
from htsocai where convert(varchar, created, 23) = convert(varchar, getdate(), 23)
) ABC order by created asc





END
GO
/****** Object:  StoredProcedure [dbo].[NH_infor_thongtinhanghoa2]    Script Date: 04/30/2024 23:38:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_infor_thongtinhanghoa2]  --NH_infor_thongtinhanghoa2 'BH_74'
	@idhoadon as nvarchar(50)
AS
BEGIN
	declare @sohoadon_new as nvarchar(50)
	declare @maxHD as nvarchar(10)
	set @maxHD = (select max(cast(substring(@idhoadon,4,len(@idhoadon)-3) as int))+1 )
	set @sohoadon_new = 'BH_'+@maxHD

	if exists(select * from [Warehouse_BPS].[dbo].[htsocai] where sohd=@sohoadon_new)
	begin
			--select tenphong,giaphong,[items] from [Warehouse_BPS].[dbo].[htsocai] where tenphong=@tenphong
			--select [items],tienhang,giaphong from [Warehouse_BPS].[dbo].[htsocai] where tenphong=@tenphong and Flag='0'
			--select [items],tienhang,giaphong,ngaygiothue from [Warehouse_BPS].[dbo].[htsocai] where tenphong=@tenphong and Flag='0'
		select [items],tienhang,giaphong,CONVERT(varchar,ngaygiothue,22) as ngaygiothue,'' as statusKaraoke,'' as giohat,sohd as sohoadon,hinhthucnghi,chietkhau,tiensauchietkhau,psco,created from [Warehouse_BPS].[dbo].[htsocai] where sohd=@sohoadon_new
	end
	else
	begin
		select 0
	end



END
GO
/****** Object:  StoredProcedure [dbo].[NH_getsohoadon_BH]    Script Date: 04/30/2024 23:38:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_getsohoadon_BH]
	
AS
BEGIN
	declare @sohoadon as nvarchar(10)
	if exists(select sohd  FROM [Warehouse_BPS].[dbo].[htsocai] where Flag='1')
	begin		
		--set @sohoadon = (select count(ID) as countid  from [Warehouse_BPS].[dbo].[htsocai] where Flag=1 )
	    set @sohoadon = (select top 1 sohd FROM [Warehouse_BPS].[dbo].[htsocai] where Flag =1 order by id desc)
		select @sohoadon
	end
	else
	begin
		--set @sohoadon = 0
		select 0
	end

END
GO
/****** Object:  StoredProcedure [dbo].[NH_infor_thongtincongnoKH]    Script Date: 04/30/2024 23:38:27 ******/
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

set @sohoadon = (select top 1 ID from htsocai where Flag=1 order by ID desc)

if exists(select karaoke from htphong where karaoke=1 and id=@idhoadon)
begin
	set @checkaraoke = 'Karaoke'
	set @giohatkaraoke = (select tiengiohat from htphong where  id=@idhoadon)
end
else if exists(select nhanghi from htphong where karaoke=0 and nhanghi=1 and id=@idhoadon)
begin
	set @checkaraoke = 'hotel'
	set @giohatkaraoke = 0
end
else
begin
	set @checkaraoke = 'Nhahang'
	set @giohatkaraoke = 0
end

	if exists(select * from htsocai where id=@idhoadon and Flag='1')
	begin
--print('asdfa')
			--select tenphong,giaphong,[items] from [Warehouse_BPS].[dbo].[htsocai] where tenphong=@tenphong
			--select [items],tienhang,giaphong from [Warehouse_BPS].[dbo].[htsocai] where tenphong=@tenphong and Flag='0'
			--select [items],tienhang,giaphong,ngaygiothue from [Warehouse_BPS].[dbo].[htsocai] where tenphong=@tenphong and Flag='0'
		select [items],tienhang,giaphong,CONVERT(varchar,ngaygiothue,22) as ngaygiothue,@checkaraoke as statusKaraoke,@giohatkaraoke as giohat,
@sohoadon as sohoadon,hinhthucnghi from htsocai
where id=@idhoadon and Flag='1' and convert(varchar, created, 23) BETWEEN convert(varchar,@_fromdate,23) AND convert(varchar,@_todate,23)
	end
	else
	begin
		select 0
	end



END
GO
/****** Object:  StoredProcedure [dbo].[NH_save_thongtinhanghoa]    Script Date: 04/30/2024 23:38:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_save_thongtinhanghoa]   --NH_save_thongtinhanghoa '2','P04','0','{}'
	@kieunghi as nvarchar(10),
	@tenphong as nvarchar(50), 	 
	@tienhang as nvarchar(50),
	@items as nvarchar(500)
	
AS
BEGIN
	declare @status_checking as nvarchar(10)

	declare @sohd as nvarchar(50)
	declare @namthangngay  as nvarchar(50)
	declare @unitno as nvarchar(50)
	declare @maxunitno as nvarchar(50)
	
	declare @maxHD as nvarchar(10)

	declare @checkbegin as int
	set @checkbegin = (select COUNT (*) FROM htsocai)

	print @checkbegin


	set @namthangngay = (SELECT CONVERT(CHAR(8),getdate(),112))



	set @status_checking = (select top 1 [Flag]  FROM htsocai where tenphong=@tenphong and Flag='0')
	print @status_checking

	if (@checkbegin > 0)
	begin
		print 'vao 1'
		--NH20221212_1
		--tao so hoadon
		set @maxHD = (select max(cast(substring(sohd,4,len(sohd)-3) as int))+1 from htsocai)
		set @sohd = 'BH_'+@maxHD

		if(@status_checking is null)
		begin
			print 'aaa'
			--them moi
			set @maxunitno = (select top 1 ID  FROM htsocai where tenphong=@tenphong and Flag='0' order by ID desc)
									
				insert into htsocai ([sohd],
			   [type]
			  ,[ngaygiothue]
			  ,[ngaygiora]
			  ,[tongthoigianthue]
			  ,[tenkhachhang]
			  ,[tenphong]
			  ,[giaphong]
			  ,[tiencoc]
			  ,[tienphong]
			  ,[tienhang]
			  ,[tongtien]
			  ,[chietkhau]
			  ,[ckthoigian]
			  ,[tiensauchietkhau]
			  ,[psco]
			  ,[psno]
			  ,[hinhthucnghi]
			  ,[mohinh]
			  ,[items]
			  ,[songuoio]
			  ,[ghichu]
			  ,[idnhanvien]) values(@sohd,'1',GETDATE(),'','','nguyen van a',@tenphong,8000,'','',@tienhang,'','','','','','',@kieunghi,'1',@items,3,'',2)

			  --update trang thai phong co khach  trangthai='1'  (co khach)
			  update htphong set trangthai='1' where tenphong=@tenphong

			  select 1

		end
		else
		begin
			--update
			print 'update'
			update htsocai set items=@items,tienhang=@tienhang where tenphong=@tenphong and Flag='0' 

			select 1

		end

		

		
	end
	else
	begin
		print 'vao 0: truong hop khong ban ghi'
		set @maxHD = '1'
		set @soHD = 'BH_'+@maxHD
		--type =1 : nhahang,hotel,khachsan
		--type =2 : Phieu ban hang
		insert into htsocai ([sohd],
       [type]
      ,[ngaygiothue]
      ,[ngaygiora]
      ,[tongthoigianthue]
      ,[tenkhachhang]
      ,[tenphong]
      ,[giaphong]
      ,[tiencoc]
      ,[tienphong]
      ,[tienhang]
      ,[tongtien]
      ,[chietkhau]
      ,[ckthoigian]
      ,[tiensauchietkhau]
      ,[psco]
      ,[psno]
      ,[hinhthucnghi]
      ,[mohinh]
      ,[items]
      ,[songuoio]
      ,[ghichu]
      ,[idnhanvien]) values(@soHD,'1',GETDATE(),'','','nguyen van a',@tenphong,8000,'','',@tienhang,'','','','','','',@kieunghi,'1',@items,3,'',2)

		select 1
	end


END
GO
/****** Object:  StoredProcedure [dbo].[addthongtinhanghoa_PBH]    Script Date: 04/30/2024 23:38:26 ******/
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

	select 1, @soHD
	

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
	
	
	select 1,@soHD

end
	
END
GO
/****** Object:  StoredProcedure [dbo].[NH_getsohoadon]    Script Date: 04/30/2024 23:38:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_getsohoadon]
	
AS
BEGIN
	declare @sohoadon as nvarchar(10)
	if exists(select id  FROM htsocai where Flag='0')
	begin		
		--set @sohoadon = (select count(ID) as countid  from [Warehouse_BPS].[dbo].[htsocai] where Flag=1 )
	    --set @sohoadon = (select top 1 id FROM htsocai where Flag =1 order by id desc)
		set @sohoadon = (select top 1 sohd FROM htsocai where Flag =1 order by id desc)
		select @sohoadon
	end
	else
	begin
		--set @sohoadon = 0
		select 0
	end

END
GO
/****** Object:  StoredProcedure [dbo].[NH_delete_phongban]    Script Date: 04/30/2024 23:38:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_delete_phongban]  --NH_delete_phongban 'Ban2','2012757'
	@nameitem as nvarchar(50),
	@userid as nvarchar(50)
AS
BEGIN
	--kiem tra user xoa co quyen addmin khong?
if exists(select * from TBL_USER2 where U_NAME=@userid and ROLE='admin')
begin
	if exists(select * from htsocai where tenphong=@nameitem and Flag=0)
	begin
		--back up du lieu truoc khi xoa
		insert into htsocai_BK(
       [type]
      ,[ngaygiothue]
      ,[ngaygiora]
      ,[tongthoigianthue]
      ,[tenkhachhang]
      ,[tenphong]
      ,[giaphong]
      ,[tiencoc]
      ,[tienphong]
      ,[tiengiohat]
      ,[tienhang]
      ,[tongtien]
      ,[chietkhau]
      ,[ckthoigian]
      ,[tiensauchietkhau]
      ,[psco]
      ,[psno]
      ,[hinhthucnghi]
      ,[mohinh]
      ,[items]
      ,[songuoio]
      ,[ghichu]
      ,[idnhanvien]      
      ) select [type]
      ,[ngaygiothue]
      ,[ngaygiora]
      ,[tongthoigianthue]
      ,[tenkhachhang]
      ,[tenphong]
      ,[giaphong]
      ,[tiencoc]
      ,[tienphong]
      ,[tiengiohat]
      ,[tienhang]
      ,[tongtien]
      ,[chietkhau]
      ,[ckthoigian]
      ,[tiensauchietkhau]
      ,[psco]
      ,[psno]
      ,[hinhthucnghi]
      ,[mohinh]
      ,[items]
      ,[songuoio]
      ,[ghichu]
      ,[idnhanvien] from htsocai where tenphong=@nameitem and Flag=0
		--thuc hien xoa ban ghi , thuc hien viec phan quen o day ( chi nhung usser nao moi duoc xoa????)
		delete htsocai where tenphong=@nameitem and Flag=0
		
		--update trang thai phong
		update htphong set trangthai=0 where tenphong=@nameitem and trangthai=1
		
		select 1
	end
	else
	begin
		select 0
	end
end
else
begin
	--user khong co quyen xoa ban / phong
	select 0
end


	
	

END
GO
/****** Object:  StoredProcedure [dbo].[NH_infor_thongtinhanghoa_inlai]    Script Date: 04/30/2024 23:38:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_infor_thongtinhanghoa_inlai]  --NH_infor_thongtinhanghoa_inlai 'BH_113'
	@sohoadon as nvarchar(50)
AS
BEGIN

declare @checkaraoke  as nvarchar(10)
declare @giohatkaraoke  as float
declare @sohoadon1 as nvarchar(10)

declare @tenphong as nvarchar(10)

set @tenphong = (select tenphong FROM htsocai where sohd=@sohoadon)

--set @sohoadon = (select top(1) ID from [Warehouse_BPS].[dbo].[htsocai] where Flag=1 order by ID desc)
set @sohoadon1 = (select top 1 sohd FROM htsocai where Flag =1 order by id desc)

if exists(select karaoke from htphong where karaoke=1 and tenphong=@tenphong)
begin
	set @checkaraoke = 'Karaoke'
	--set @giohatkaraoke = (select tiengiohat from [Warehouse_BPS].[dbo].[htphong] where  tenphong=@tenphong)
	set @giohatkaraoke = (select tiengiohat from htphong where  tenphong=@tenphong)
end
else if exists(select nhanghi from htphong where karaoke=0 and nhanghi=1 and tenphong=@tenphong)
begin
	set @checkaraoke = 'hotel'
	set @giohatkaraoke = 0
end
else
begin
	set @checkaraoke = 'Nhahang'
	set @giohatkaraoke = 0
end

	if exists(select * from htsocai where sohd=@sohoadon )   -- truong hop in lai hoa don   --tenphong=@tenphong and Flag='1'
	begin			
			select [items],tienhang,giaphong,CONVERT(varchar,ngaygiothue,22) as ngaygiothue,@checkaraoke as statusKaraoke,tiengiohat as giohat,sohd as sohoadon,ngaygiora,tenphong,convert(varchar, created, 23)as ngaytao,tiensauchietkhau,psco from htsocai where sohd=@sohoadon
	end
	else
	begin
		select 0
	end



END
GO
/****** Object:  StoredProcedure [dbo].[NH_select_hanghoa]    Script Date: 04/30/2024 23:38:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_select_hanghoa]  --NH_select_hanghoa '1'
	@nhomhangid as nvarchar(50)
AS
BEGIN
	if(@nhomhangid='')
	begin
		--all nhom hang
		select *  FROM hthanghoa 
	end
	else
	begin
		select *  FROM hthanghoa where nhomhangid=@nhomhangid
	end
	

END
GO
/****** Object:  StoredProcedure [dbo].[NH_insert_khachhang]    Script Date: 04/30/2024 23:38:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_insert_khachhang]
	@makh as nvarchar(50), 
	@tenkh as nvarchar(50), 
	@congnoden as nvarchar(50), 
	@congnodi as nvarchar(50)
AS
BEGIN
	
	if not exists(select * FROM htkhachhang where makh = @makh)
	begin
		insert into htkhachhang(makh,tenkh,congnoden,congnodi) values(@makh,@tenkh,@congnoden,@congnodi)
		select top 1 id,makh from htkhachhang order by id desc
	end
	else
	begin
		select 0
	end

END
GO
