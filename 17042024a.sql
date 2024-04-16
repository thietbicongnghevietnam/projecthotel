USE [Warehouse_BPS]
GO
/****** Object:  Table [dbo].[hthinhthucnghi]    Script Date: 04/17/2024 01:59:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hthinhthucnghi](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[hinhthucnghi] [nvarchar](50) NULL,
	[ngaytao] [datetime] NULL CONSTRAINT [DF_hthinhthucnghi_ngaytao]  DEFAULT (getdate()),
	[nguoitao] [nvarchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[htphong]    Script Date: 04/17/2024 01:59:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[htphong](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tenphong] [nvarchar](50) NULL,
	[loaiphongid] [int] NULL,
	[khuvucid] [int] NULL,
	[trangthai] [int] NULL,
	[trangthaidatphong] [int] NULL,
	[trangthaidonphong] [int] NULL,
	[giophutroi] [float] NULL,
	[karaoke] [int] NULL CONSTRAINT [DF_htphong_karaoke]  DEFAULT (0),
	[tiengiohat] [int] NULL,
	[nhanghi] [int] NULL CONSTRAINT [DF_htphong_nhanghi]  DEFAULT (0),
	[tiengionghi] [int] NULL,
	[tiennghidem] [int] NULL,
	[tiennghingay] [int] NULL,
	[tiennghithang] [int] NULL,
	[modified] [datetime] NULL,
	[userid] [nvarchar](50) NULL,
	[locked] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[NH_infor_thongtinhanghoa]    Script Date: 04/17/2024 01:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_infor_thongtinhanghoa]  --NH_infor_thongtinhanghoa 'P03'
	@tenphong as nvarchar(50)
AS
BEGIN

declare @checkaraoke  as nvarchar(10)
declare @giohatkaraoke  as float
declare @sohoadon as nvarchar(10)

set @sohoadon = (select top 1 ID from [Warehouse_BPS].[dbo].[htsocai] where Flag=1 order by ID desc)

if exists(select karaoke from [Warehouse_BPS].[dbo].[htphong] where karaoke=1 and tenphong=@tenphong)
begin
	set @checkaraoke = 'Karaoke'
	set @giohatkaraoke = (select tiengiohat from [Warehouse_BPS].[dbo].[htphong] where  tenphong=@tenphong)
end
else if exists(select nhanghi from [Warehouse_BPS].[dbo].[htphong] where karaoke=0 and nhanghi=1 and tenphong=@tenphong)
begin
	set @checkaraoke = 'hotel'
	set @giohatkaraoke = 0
end
else
begin
	set @checkaraoke = 'Nhahang'
	set @giohatkaraoke = 0
end

	if exists(select * from [Warehouse_BPS].[dbo].[htsocai] where tenphong=@tenphong and Flag='0')
	begin
			--select tenphong,giaphong,[items] from [Warehouse_BPS].[dbo].[htsocai] where tenphong=@tenphong
			--select [items],tienhang,giaphong from [Warehouse_BPS].[dbo].[htsocai] where tenphong=@tenphong and Flag='0'
			--select [items],tienhang,giaphong,ngaygiothue from [Warehouse_BPS].[dbo].[htsocai] where tenphong=@tenphong and Flag='0'
		select [items],tienhang,giaphong,CONVERT(varchar,ngaygiothue,22) as ngaygiothue,@checkaraoke as statusKaraoke,@giohatkaraoke as giohat,@sohoadon as sohoadon,hinhthucnghi from [Warehouse_BPS].[dbo].[htsocai] where tenphong=@tenphong and Flag='0'
	end
	else
	begin
		select 0
	end



END
GO
/****** Object:  StoredProcedure [dbo].[NH_infor_thongtinhanghoa_inlai]    Script Date: 04/17/2024 01:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_infor_thongtinhanghoa_inlai]  --NH_infor_thongtinhanghoa_inlai '1022'
	@sohoadon as nvarchar(50)
AS
BEGIN

declare @checkaraoke  as nvarchar(10)
declare @giohatkaraoke  as float
declare @sohoadon1 as nvarchar(10)

declare @tenphong as nvarchar(10)

set @tenphong = (select tenphong FROM [Warehouse_BPS].[dbo].[htsocai] where id=@sohoadon)

--set @sohoadon = (select top(1) ID from [Warehouse_BPS].[dbo].[htsocai] where Flag=1 order by ID desc)
set @sohoadon1 = (select top 1 id FROM [Warehouse_BPS].[dbo].[htsocai] where Flag =1 order by id desc)

if exists(select karaoke from [Warehouse_BPS].[dbo].[htphong] where karaoke=1 and tenphong=@tenphong)
begin
	set @checkaraoke = 'Karaoke'
	--set @giohatkaraoke = (select tiengiohat from [Warehouse_BPS].[dbo].[htphong] where  tenphong=@tenphong)
	set @giohatkaraoke = (select tiengiohat from [Warehouse_BPS].[dbo].[htphong] where  tenphong=@tenphong)
end
else if exists(select nhanghi from [Warehouse_BPS].[dbo].[htphong] where karaoke=0 and nhanghi=1 and tenphong=@tenphong)
begin
	set @checkaraoke = 'hotel'
	set @giohatkaraoke = 0
end
else
begin
	set @checkaraoke = 'Nhahang'
	set @giohatkaraoke = 0
end

	if exists(select * from [Warehouse_BPS].[dbo].[htsocai] where id=@sohoadon )   -- truong hop in lai hoa don   --tenphong=@tenphong and Flag='1'
	begin			
			select [items],tienhang,giaphong,CONVERT(varchar,ngaygiothue,22) as ngaygiothue,@checkaraoke as statusKaraoke,tiengiohat as giohat,@sohoadon1 as sohoadon,ngaygiora,tenphong from [Warehouse_BPS].[dbo].[htsocai] where id=@sohoadon
	end
	else
	begin
		select 0
	end



END
GO
/****** Object:  StoredProcedure [dbo].[NH_save_thongtinhanghoa]    Script Date: 04/17/2024 01:59:14 ******/
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
	set @checkbegin = (select COUNT (*) FROM [Warehouse_BPS].[dbo].[htsocai])

	print @checkbegin


	set @namthangngay = (SELECT CONVERT(CHAR(8),getdate(),112))



	set @status_checking = (select top 1 [Flag]  FROM [Warehouse_BPS].[dbo].[htsocai] where tenphong=@tenphong and Flag='0')
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
			set @maxunitno = (select top 1 ID  FROM [Warehouse_BPS].[dbo].[htsocai] where tenphong=@tenphong and Flag='0' order by ID desc)
									
				insert into [Warehouse_BPS].[dbo].[htsocai] ([sohd],
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
			  update [Warehouse_BPS].[dbo].[htphong] set trangthai='1' where tenphong=@tenphong

			  select 1

		end
		else
		begin
			--update
			print 'update'
			update [Warehouse_BPS].[dbo].[htsocai] set items=@items,tienhang=@tienhang where tenphong=@tenphong and Flag='0' 

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
		insert into [Warehouse_BPS].[dbo].[htsocai] ([sohd],
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
/****** Object:  StoredProcedure [dbo].[NH_Get_kieunghi]    Script Date: 04/17/2024 01:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[NH_Get_kieunghi]
	
AS
BEGIN
	select id,hinhthucnghi from hthinhthucnghi
END
GO
/****** Object:  StoredProcedure [dbo].[NH_select_info_phong]    Script Date: 04/17/2024 01:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_select_info_phong] 
	

AS
BEGIN
	
	SELECT TOP 1000 [id]
      ,[tenphong]
      ,[loaiphongid]
      ,[khuvucid]
      ,[trangthai]
      ,[trangthaidatphong]
      ,[trangthaidonphong]
      ,[giophutroi]
		,karaoke
		,nhanghi
      
  FROM [Warehouse_BPS].[dbo].[htphong] where khuvucid=1

END
GO
/****** Object:  StoredProcedure [dbo].[NH_select_info_phong1]    Script Date: 04/17/2024 01:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_select_info_phong1] 
	

AS
BEGIN
	
	SELECT TOP 1000 [id]
      ,[tenphong]
      ,[loaiphongid]
      ,[khuvucid]
      ,[trangthai]
      ,[trangthaidatphong]
      ,[trangthaidonphong]
      ,[giophutroi]
		,karaoke
		,nhanghi
      
  FROM [Warehouse_BPS].[dbo].[htphong] where khuvucid=2

END
GO
/****** Object:  StoredProcedure [dbo].[NH_select_khuvuc1]    Script Date: 04/17/2024 01:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[NH_select_khuvuc1]
	

AS
BEGIN
	
	SELECT [tenkhuvuc] FROM [Warehouse_BPS].[dbo].[htkhuvuc] where makhuvuc='2'

END
GO
/****** Object:  StoredProcedure [dbo].[NH_select_khuvuc]    Script Date: 04/17/2024 01:59:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_select_khuvuc]
	

AS
BEGIN
	
	SELECT [tenkhuvuc] FROM [Warehouse_BPS].[dbo].[htkhuvuc] where makhuvuc='1'

END
GO
