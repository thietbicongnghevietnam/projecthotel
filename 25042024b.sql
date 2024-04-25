USE [Warehouse_BPS]
GO
/****** Object:  Table [dbo].[TBL_USER2]    Script Date: 04/25/2024 5:20:00 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NH_infor_thongtincongnoKH]    Script Date: 04/25/2024 5:20:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[NH_infor_thongtincongnoKH]  --NH_infor_thongtincongnoKH 'P03','',''
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
			--select tenphong,giaphong,[items] from [Warehouse_BPS].[dbo].[htsocai] where tenphong=@tenphong
			--select [items],tienhang,giaphong from [Warehouse_BPS].[dbo].[htsocai] where tenphong=@tenphong and Flag='0'
			--select [items],tienhang,giaphong,ngaygiothue from [Warehouse_BPS].[dbo].[htsocai] where tenphong=@tenphong and Flag='0'
		select [items],tienhang,giaphong,CONVERT(varchar,ngaygiothue,22) as ngaygiothue,@checkaraoke as statusKaraoke,@giohatkaraoke as giohat,@sohoadon as sohoadon,hinhthucnghi from [Warehouse_BPS].[dbo].[htsocai] where id=@idhoadon and Flag='1'
	end
	else
	begin
		select 0
	end



END
GO
/****** Object:  StoredProcedure [dbo].[pro_user_login_N]    Script Date: 04/25/2024 5:20:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[pro_user_login_N] --'2013525','123456'
@username as varchar(50),
@password as varchar(100)
AS
BEGIN	
  		
	select * from TBL_USER2 where U_NAME = @username and U_PASSWORD=@password and U_ACTIVE = 'Y';	
END
GO
