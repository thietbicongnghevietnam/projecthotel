USE [Warehouse_BPS]
GO
/****** Object:  Table [dbo].[htsocai_BK]    Script Date: 04/03/2024 4:45:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[htsocai_BK](
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
/****** Object:  StoredProcedure [dbo].[NH_delete_phongban]    Script Date: 04/03/2024 4:45:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_delete_phongban]  --NH_delete_phongban 'P03'
	@nameitem as nvarchar(50)
AS
BEGIN
	
	if exists(select * from [Warehouse_BPS].[dbo].[htsocai] where tenphong=@nameitem and Flag=0)
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
      ,[idnhanvien] from [Warehouse_BPS].[dbo].[htsocai] where tenphong=@nameitem and Flag=0
		--thuc hien xoa ban ghi , thuc hien viec phan quen o day ( chi nhung usser nao moi duoc xoa????)
		delete [Warehouse_BPS].[dbo].[htsocai] where tenphong=@nameitem and Flag=0
		
		select 1
	end
	else
	begin
		select 0
	end
	

END
GO
/****** Object:  StoredProcedure [dbo].[NH_Move_phongban]    Script Date: 04/03/2024 4:45:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[NH_Move_phongban]
	@nameitem as nvarchar(50),
	@newroom as nvarchar(50)
AS
BEGIN	

	--kiem tra phong con trong khong ?
	if exists(select * from [Warehouse_BPS].[dbo].[htphong] where tenphong=@newroom and trangthai=0)
	begin		
		--update date bang socai
		update [Warehouse_BPS].[dbo].[htsocai] set tenphong=@newroom  where tenphong=@nameitem and Flag=0

		--update bang mater
		update [Warehouse_BPS].[dbo].[htphong] set trangthai=0 where tenphong=@nameitem and trangthai=1
		update [Warehouse_BPS].[dbo].[htphong] set trangthai=1 where tenphong=@newroom and trangthai=0

		select 1

	end
	else
	begin
		-- khong co trong mater
		-- phong da co khach -> khong chuyen duoc
		select 0
	end


END
GO
