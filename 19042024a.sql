USE [Warehouse_BPS]
GO
/****** Object:  Table [dbo].[htSoQuy]    Script Date: 04/19/2024 05:53:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[htSoQuy](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[typeHD] [tinyint] NULL,
	[MaHD] [nvarchar](50) NULL,
	[IDketoan] [nvarchar](50) NULL,
	[IDnguoinhan] [nvarchar](50) NULL,
	[IDkhachhang] [int] NULL,
	[IDnhacungcap] [int] NULL,
	[psco] [float] NULL,
	[psno] [float] NULL,
	[Mota] [nvarchar](50) NULL,
	[ngaygiaodich] [datetime] NULL,
	[phuongthucTT] [nvarchar](50) NULL,
	[Createdate] [datetime] NOT NULL CONSTRAINT [DF_htSoQuy_Createdate]  DEFAULT (getdate())
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[htphong]    Script Date: 04/19/2024 05:53:17 ******/
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
	[giophutroitheophut] [float] NULL,
	[timephutroi] [int] NULL,
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
/****** Object:  StoredProcedure [dbo].[NH_infor_thongtinhanghoa]    Script Date: 04/19/2024 05:53:15 ******/
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


declare @nghigio as float
declare @nghidem as float
declare @nghingay as float
declare @nghithang as float
declare @tienphutroi as float
declare @tienphutroiphut as float
declare @timephutroi as int

set @sohoadon = (select top 1 ID from [Warehouse_BPS].[dbo].[htsocai] where Flag=1 order by ID desc)

if exists(select karaoke from [Warehouse_BPS].[dbo].[htphong] where karaoke=1 and tenphong=@tenphong)
begin
	set @checkaraoke = 'Karaoke'
	set @giohatkaraoke = (select tiengiohat from [Warehouse_BPS].[dbo].[htphong] where  tenphong=@tenphong)
	set @nghigio = 0
	set @nghidem = 0
	set @nghingay = 0
	set @nghithang = 0
	set @tienphutroi =0
	set @tienphutroiphut =0
	set @timephutroi =0
end
else if exists(select nhanghi from [Warehouse_BPS].[dbo].[htphong] where karaoke=0 and nhanghi=1 and tenphong=@tenphong)
begin
	set @checkaraoke = 'hotel'
	set @giohatkaraoke = 0
	set @nghigio = (select tiengionghi from [Warehouse_BPS].[dbo].[htphong] where karaoke=0 and nhanghi=1 and tenphong=@tenphong)	
	set @nghidem = (select tiennghidem from [Warehouse_BPS].[dbo].[htphong] where karaoke=0 and nhanghi=1 and tenphong=@tenphong)
	set @nghingay = (select tiennghingay from [Warehouse_BPS].[dbo].[htphong] where karaoke=0 and nhanghi=1 and tenphong=@tenphong)
	set @nghithang = (select tiennghithang from [Warehouse_BPS].[dbo].[htphong] where karaoke=0 and nhanghi=1 and tenphong=@tenphong)
	set @tienphutroi = (select giophutroi from [Warehouse_BPS].[dbo].[htphong] where karaoke=0 and nhanghi=1 and tenphong=@tenphong)
	set @tienphutroiphut = (select giophutroitheophut from [Warehouse_BPS].[dbo].[htphong] where karaoke=0 and nhanghi=1 and tenphong=@tenphong)
	set @timephutroi =(select timephutroi from [Warehouse_BPS].[dbo].[htphong] where karaoke=0 and nhanghi=1 and tenphong=@tenphong)
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

	if exists(select * from [Warehouse_BPS].[dbo].[htsocai] where tenphong=@tenphong and Flag='0')
	begin
			--select tenphong,giaphong,[items] from [Warehouse_BPS].[dbo].[htsocai] where tenphong=@tenphong
			--select [items],tienhang,giaphong from [Warehouse_BPS].[dbo].[htsocai] where tenphong=@tenphong and Flag='0'
			--select [items],tienhang,giaphong,ngaygiothue from [Warehouse_BPS].[dbo].[htsocai] where tenphong=@tenphong and Flag='0'
		select [items],tienhang,giaphong,CONVERT(varchar,ngaygiothue,22) as ngaygiothue,@checkaraoke as statusKaraoke,@giohatkaraoke as giohat,@sohoadon as sohoadon,hinhthucnghi,@nghigio,@nghidem,@nghingay,@nghithang,@tienphutroi,@tienphutroiphut,@timephutroi from [Warehouse_BPS].[dbo].[htsocai] where tenphong=@tenphong and Flag='0'
	end
	else
	begin
		select 0
	end



END
GO
/****** Object:  StoredProcedure [dbo].[NH_save_khthanhtoan]    Script Date: 04/19/2024 05:53:16 ******/
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

	set @sohd = (select id  FROM [Warehouse_BPS].[dbo].[htsocai] where tenphong=@tenphong and Flag='0')


	if exists(select * FROM [Warehouse_BPS].[dbo].[htsocai] where tenphong=@tenphong and Flag='0')
	begin
		--update trang thai thanh toan
		update [Warehouse_BPS].[dbo].[htsocai] set Flag='1',items=@items,tienhang=@tongtienhang,tongtien=@psco,psno=@tienno,tiengiohat=@tongtienhat,tienphong=@tongtienphong,tiensauchietkhau=@psco,ngaygiora=GETDATE(),idncc=cast(@idkhachhang as int) where id=@sohd

		--update trang thai bang mater khi thanh toan xong  trangthai='0'  (khong co khach)
		update [Warehouse_BPS].[dbo].[htphong] set trangthai='0' where tenphong=@tenphong

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
