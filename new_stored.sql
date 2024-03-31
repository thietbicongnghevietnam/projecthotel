USE [Warehouse_BPS]
GO
/****** Object:  Table [dbo].[htphong]    Script Date: 03/31/2024 4:53:10 PM ******/
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
	[karaoke] [int] NULL,
	[tiengiohat] [int] NULL,
	[nhanghi] [int] NULL,
	[tiengionghi] [int] NULL,
	[modified] [datetime] NULL,
	[userid] [nvarchar](50) NULL,
	[locked] [nvarchar](50) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[htphong] ADD  CONSTRAINT [DF_htphong_karaoke]  DEFAULT ((0)) FOR [karaoke]
GO
ALTER TABLE [dbo].[htphong] ADD  CONSTRAINT [DF_htphong_nhanghi]  DEFAULT ((0)) FOR [nhanghi]
GO
/****** Object:  StoredProcedure [dbo].[NH_infor_thongtinhanghoa]    Script Date: 03/31/2024 4:53:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[NH_infor_thongtinhanghoa]  --NH_infor_thongtinhanghoa 'P02'
	@tenphong as nvarchar(50)
AS
BEGIN

declare @checkaraoke  as nvarchar(10)
declare @giohat  as nvarchar(5)

if exists(select karaoke from [Warehouse_BPS].[dbo].[htphong] where karaoke=1 and tenphong=@tenphong)
begin
	set @checkaraoke = '1'
	set @giohat = (select tiengiohat from [Warehouse_BPS].[dbo].[htphong] where  tenphong=@tenphong)
end
else
begin
	set @checkaraoke = '0'
	set @giohat = '0'
end

	if exists(select * from [Warehouse_BPS].[dbo].[htsocai] where tenphong=@tenphong and Flag='0')
	begin
			--select tenphong,giaphong,[items] from [Warehouse_BPS].[dbo].[htsocai] where tenphong=@tenphong
			--select [items],tienhang,giaphong,FORMAT(ngaygiothue,'dd-MM-yyyy HH:mm:ss') as ngaygiothue from [Warehouse_BPS].[dbo].[htsocai] where tenphong=@tenphong and Flag='0'
			select [items],tienhang,giaphong,FORMAT(ngaygiothue,'MM/dd/yyyy HH:mm:ss') as ngaygiothue from [Warehouse_BPS].[dbo].[htsocai] where tenphong=@tenphong and Flag='0'
	end
	else
	begin
		select 0
	end



END
GO
