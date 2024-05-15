USE [Warehouse_BPS]
GO
/****** Object:  Table [dbo].[htsocai]    Script Date: 05/16/2024 01:35:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[htsocai](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[sohd] [nvarchar](50) NULL,
	[type] [tinyint] NULL,
	[ngaygiothue] [datetime] NULL,
	[ngaygiora] [datetime] NULL,
	[tongthoigianthue] [nvarchar](50) NULL,
	[tenkhachhang] [nvarchar](50) NULL,
	[tenphong] [nvarchar](50) NULL,
	[giaphong] [float] NULL,
	[tiencoc] [float] NULL,
	[tienphong] [float] NULL,
	[tiengiohat] [float] NULL,
	[tienhang] [float] NULL,
	[tongtien] [float] NULL,
	[chietkhau] [float] NULL,
	[ckthoigian] [float] NULL,
	[tiensauchietkhau] [float] NULL,
	[psco] [float] NULL,
	[psno] [float] NULL,
	[hinhthucnghi] [int] NULL,
	[mohinh] [int] NULL,
	[items] [nvarchar](500) NULL,
	[listtoncuoiky] [nvarchar](300) NULL,
	[songuoio] [int] NULL,
	[ghichu] [nvarchar](50) NULL,
	[idnhanvien] [int] NULL,
	[idncc] [int] NULL,
	[Flag] [nvarchar](10) NULL CONSTRAINT [DF_htsocai_Flag]  DEFAULT (0),
	[userid] [nvarchar](50) NULL,
	[created] [datetime] NULL CONSTRAINT [DF_htsocai_created]  DEFAULT (getdate()),
	[modified] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[htsocai_BK]    Script Date: 05/16/2024 01:35:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[htsocai_BK](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[sohd] [nvarchar](50) NULL,
	[type] [tinyint] NULL,
	[ngaygiothue] [datetime] NULL,
	[ngaygiora] [datetime] NULL,
	[tongthoigianthue] [nvarchar](50) NULL,
	[tenkhachhang] [nvarchar](50) NULL,
	[tenphong] [nvarchar](50) NULL,
	[giaphong] [float] NULL,
	[tiencoc] [float] NULL,
	[tienphong] [float] NULL,
	[tiengiohat] [float] NULL,
	[tienhang] [float] NULL,
	[tongtien] [float] NULL,
	[chietkhau] [float] NULL,
	[ckthoigian] [float] NULL,
	[tiensauchietkhau] [float] NULL,
	[psco] [float] NULL,
	[psno] [float] NULL,
	[hinhthucnghi] [int] NULL,
	[mohinh] [int] NULL,
	[items] [nvarchar](500) NULL,
	[listtoncuoiky] [nvarchar](300) NULL,
	[songuoio] [int] NULL,
	[ghichu] [nvarchar](50) NULL,
	[idnhanvien] [int] NULL,
	[idncc] [int] NULL,
	[Flag] [nvarchar](10) NULL,
	[userid] [nvarchar](50) NULL,
	[created] [datetime] NULL,
	[modified] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[htsonhaphang]    Script Date: 05/16/2024 01:35:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[htsonhaphang](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[sohd] [nvarchar](50) NULL,
	[idncc] [int] NULL,
	[items] [nvarchar](500) NULL,
	[tongtien] [float] NULL,
	[chietkhau] [float] NULL,
	[tongtienthanhtoan] [float] NULL,
	[psco] [float] NULL,
	[psno] [float] NULL,
	[ghichu] [nvarchar](50) NULL,
	[userid] [nvarchar](50) NULL,
	[created] [datetime] NULL CONSTRAINT [DF_htsonhaphang_created]  DEFAULT (getdate()),
	[modified] [datetime] NULL,
	[listtoncuoiky] [nvarchar](500) NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[NH_Baocaotonkho]    Script Date: 05/16/2024 01:35:31 ******/
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
	  ,'' as soluongdauky
	  ,'' as soluongnhap
	  ,'' as soluongxuat
      ,[soluongton]
      ,[anh]
      ,[gianhap]
      ,[giaban]
	  ,'0' as doanhso
	  ,'0' as giavon
	  ,'0' as laigop
	  ,'' sohd
      ,[nhomhangid]
      ,[userid]
      ,[created]
      ,[modified]
  FROM hthanghoa


END
GO
/****** Object:  StoredProcedure [dbo].[NH_updatekho]    Script Date: 05/16/2024 01:35:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_updatekho] --NH_updatekho 'bia ha noi',1,'nhaphang'	
	@mahang as nvarchar(50), 
	@soluong as nvarchar(10),
	@type_act as nvarchar(50)
AS
BEGIN
if(@type_act = 'nhaphang')
begin
	update hthanghoa set soluongton=soluongton+cast(@soluong as int) where tenhang=@mahang
	select 1,soluongton from hthanghoa where tenhang=@mahang
end
else
begin
	--@type_act = 'banhang'
	update hthanghoa set soluongton=soluongton-cast(@soluong as int) where tenhang=@mahang
	select 1,soluongton from hthanghoa where tenhang=@mahang
end

	
	

END
GO
/****** Object:  StoredProcedure [dbo].[addthongtinhanghoa_PBH]    Script Date: 05/16/2024 01:35:32 ******/
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
	@items as nvarchar(300),
	@listtoncuoiky as nvarchar(300)
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
	insert into htsocai (sohd,idncc,items,tienhang,tongtien,chietkhau,tiensauchietkhau,psco,type,Flag,listtoncuoiky) values(@soHD,cast(@nhacungcap as int),@items,@tienhang,@tienhang,@chietkhau,cast(@thanhtoantien as float),cast(@psno as float),2,1,@listtoncuoiky)    

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
	insert into htsocai (sohd,idncc,items,tienhang,tongtien,chietkhau,tiensauchietkhau,psco,type,listtoncuoiky) values(@soHD,cast(@nhacungcap as int),@items,@tienhang,@tienhang,@chietkhau,cast(@thanhtoantien as float),cast(@psno as float),2,@listtoncuoiky)    
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
/****** Object:  StoredProcedure [dbo].[NH_save_khthanhtoan]    Script Date: 05/16/2024 01:35:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_save_khthanhtoan]  -- NH_save_khthanhtoan '2','P05','45000','0','0','0','-45000','0','{"biahn,20000,20000":1,"biaken,25000,25000":1}',''
	@idkhachhang as nvarchar(10),
	@tenphong as nvarchar(50), 	 
	@tongtienhang as nvarchar(50),
	@tongtienhat as nvarchar(50),
	@tongtienphong as nvarchar(50),
	@psco as nvarchar(50),
	@tienno as nvarchar(50),
	@tienck as nvarchar(50),
	@items as nvarchar(500),
	@listtoncuoiky as nvarchar(500)
AS
BEGIN
	
	declare @sohd as nvarchar(50)

	--set @sohd = (select id  FROM htsocai where tenphong=@tenphong and Flag='0')
	set @sohd = (select sohd  FROM htsocai where tenphong=@tenphong and Flag='0')


	if exists(select * FROM htsocai where tenphong=@tenphong and Flag='0')
	begin
		--update trang thai thanh toan
		update htsocai set Flag='1',items=@items,tienhang=@tongtienhang,tongtien=@psco,psno=@tienno,tiengiohat=@tongtienhat,tienphong=@tongtienphong,tiensauchietkhau=@psco,ngaygiora=GETDATE(),idncc=cast(@idkhachhang as int),chietkhau=@tienck,listtoncuoiky=@listtoncuoiky where sohd=@sohd

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
/****** Object:  StoredProcedure [dbo].[NH_thongtinthekho2]    Script Date: 05/16/2024 01:35:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_thongtinthekho2] --NH_thongtinthekho2 '2024-05-16','2024-05-16'	
	@fromdate as nvarchar(50),
	@todate as nvarchar(50)
AS
BEGIN
	
select * from (
	select sohd,listtoncuoiky,created,'xuathang' as typetk from htsocai 
where convert(varchar,created,23) < convert(varchar,@fromdate,23) and listtoncuoiky is not null
union
select sohd,listtoncuoiky,created,'nhaphang' as typetk from htsonhaphang 
where convert(varchar,created,23) < convert(varchar,@fromdate,23) and listtoncuoiky is not null
) abc order by created desc


--select convert(varchar,getdate(),23)

END
GO
/****** Object:  StoredProcedure [dbo].[addthongtinhanghoa_PNH]    Script Date: 05/16/2024 01:35:32 ******/
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
	@items as nvarchar(300),
	@listtoncuoiky as nvarchar(500)
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
	insert into htsonhaphang (sohd,idncc,items,tongtien,chietkhau,tongtienthanhtoan,psno,listtoncuoiky) values(@soHD,cast(@nhacungcap as int),@items,@tienhang,@chietkhau,cast(@thanhtoantien as float),cast(@psno as float),@listtoncuoiky)    

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
	insert into htsonhaphang (sohd,idncc,items,tongtien,chietkhau,tongtienthanhtoan,psno,listtoncuoiky) values(@soHD,cast(@nhacungcap as int),@items,@tienhang,@chietkhau,cast(@thanhtoantien as float),cast(@psno as float),@listtoncuoiky)
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
