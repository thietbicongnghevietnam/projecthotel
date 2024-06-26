USE [Warehouse_BPS]
GO
/****** Object:  Table [dbo].[htsocai]    Script Date: 04/01/2024 5:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[htsocai](
	[id] [int] IDENTITY(1,1) NOT NULL,
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
	[songuoio] [int] NULL,
	[ghichu] [nvarchar](50) NULL,
	[idnhanvien] [int] NULL,
	[Flag] [nvarchar](10) NULL,
	[userid] [nvarchar](50) NULL,
	[created] [datetime] NULL,
	[modified] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[htsocai] ADD  CONSTRAINT [DF_htsocai_Flag]  DEFAULT ((0)) FOR [Flag]
GO
ALTER TABLE [dbo].[htsocai] ADD  CONSTRAINT [DF_htsocai_created]  DEFAULT (getdate()) FOR [created]
GO
/****** Object:  StoredProcedure [dbo].[NH_getsohoadon]    Script Date: 04/01/2024 5:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[NH_getsohoadon]
	
AS
BEGIN
	declare @sohoadon as nvarchar(10)
	if exists(select id  FROM [Warehouse_BPS].[dbo].[htsocai] where Flag='0')
	begin		
		set @sohoadon = (select count(ID) as countid  from [Warehouse_BPS].[dbo].[htsocai] where Flag=1 )
		select @sohoadon
	end
	else
	begin
		--set @sohoadon = 0
		select 0
	end

END
GO
/****** Object:  StoredProcedure [dbo].[NH_infor_thongtinhanghoa]    Script Date: 04/01/2024 5:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[NH_infor_thongtinhanghoa]  --NH_infor_thongtinhanghoa 'P07'
	@tenphong as nvarchar(50)
AS
BEGIN

declare @checkaraoke  as nvarchar(10)
declare @giohatkaraoke  as float
declare @sohoadon as nvarchar(10)

set @sohoadon = (select top(1) ID from [Warehouse_BPS].[dbo].[htsocai] where Flag=1 order by ID desc)

if exists(select karaoke from [Warehouse_BPS].[dbo].[htphong] where karaoke=1 and tenphong=@tenphong)
begin
	set @checkaraoke = 'Karaoke'
	set @giohatkaraoke = (select tiengiohat from [Warehouse_BPS].[dbo].[htphong] where  tenphong=@tenphong)
end
else
begin
	set @checkaraoke = 'Nhahang'
	set @giohatkaraoke = 0
end

	if exists(select * from [Warehouse_BPS].[dbo].[htsocai] where tenphong=@tenphong and Flag='0')
	begin
			--select tenphong,giaphong,[items] from [Warehouse_BPS].[dbo].[htsocai] where tenphong=@tenphong
			--select [items],tienhang,giaphong,FORMAT(ngaygiothue,'dd-MM-yyyy HH:mm:ss') as ngaygiothue from [Warehouse_BPS].[dbo].[htsocai] where tenphong=@tenphong and Flag='0'
			select [items],tienhang,giaphong,FORMAT(ngaygiothue,'MM/dd/yyyy HH:mm:ss') as ngaygiothue,@checkaraoke as statusKaraoke,@giohatkaraoke as giohat,@sohoadon as sohoadon from [Warehouse_BPS].[dbo].[htsocai] where tenphong=@tenphong and Flag='0'
	end
	else
	begin
		select 0
	end



END
GO
/****** Object:  StoredProcedure [dbo].[NH_save_khthanhtoan]    Script Date: 04/01/2024 5:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[NH_save_khthanhtoan]  -- NH_save_khthanhtoan 'P01','0','0','0','0','{}'
	@tenphong as nvarchar(50), 	 
	@tongtienhang as nvarchar(50),
	@tongtienhat as nvarchar(50),
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
		update [Warehouse_BPS].[dbo].[htsocai] set Flag='1',items=@items,tienhang=@tongtienhang,psno=@tienno,tiengiohat=@tongtienhat,tiensauchietkhau=@psco where id=@sohd

		--update trang thai bang mater khi thanh toan xong  trangthai='0'  (khong co khach)
		update [Warehouse_BPS].[dbo].[htphong] set trangthai='0' where tenphong=@tenphong

		select 1
	end
	else
	begin
		-- khong ton tai, kiem tra lai
		select 0
	end

END
GO
