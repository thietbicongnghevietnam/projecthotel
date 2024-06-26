USE [DataBanHang]
GO
/****** Object:  Table [dbo].[htdonvitinh]    Script Date: 06/26/2024 01:10:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[htdonvitinh](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[mahang] [nvarchar](50) NULL,
	[dvtto] [nvarchar](50) NULL,
	[soluongqudoi] [int] NULL,
	[dvtnho] [nvarchar](50) NULL,
	[gianhap] [float] NULL,
	[giaban] [float] NULL,
	[giabuon] [float] NULL,
	[giaban2] [float] NULL,
	[createdate] [datetime] NULL CONSTRAINT [DF_htdonvitinh_createdate]  DEFAULT (getdate())
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[NH_getdongia_cauthanh]    Script Date: 06/26/2024 01:10:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_getdongia_cauthanh]
	@mahang as nvarchar(50)
AS
BEGIN
	
if exists(select giaban from hthanghoa where mahang=@mahang)
begin
	select 1, giaban from hthanghoa where mahang=@mahang
end
else
begin
	select 0
end


END
GO
/****** Object:  StoredProcedure [dbo].[NH_dongia_cauthanh_dvt]    Script Date: 06/26/2024 01:10:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_dongia_cauthanh_dvt]
	@mahang as nvarchar(50),
	@dvtto as nvarchar(50)

AS
BEGIN
	declare @giabanto as float
	declare @giabantrungbinh as float
	declare @soluongquydoi as int

if(@dvtto = '==DVT==')
begin
	if exists(select top 1 giaban from htdonvitinh where mahang=@mahang)
	begin
		set @giabantrungbinh = (select top 1 giaban from htdonvitinh where mahang=@mahang )
		select 1,@giabantrungbinh
	end
	else
	begin
		select 1, giaban from hthanghoa where mahang = @mahang
	end	
end
else
begin
	if exists(select * from htdonvitinh where mahang=@mahang and dvtto=@dvtto)
	begin
		set @giabanto = (select giaban2 from htdonvitinh where mahang=@mahang and dvtto=@dvtto)
		set @soluongquydoi = (select soluongqudoi from htdonvitinh where mahang=@mahang and dvtto=@dvtto)

		set @giabantrungbinh = @giabanto/@soluongquydoi
		
		print @giabanto
		print @soluongquydoi
		print @giabantrungbinh

		select 1,@giabantrungbinh
	end
	else
	begin
		select 0
	end	

end




END
GO
/****** Object:  StoredProcedure [dbo].[NH_insert_cauthanhdvt]    Script Date: 06/26/2024 01:10:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_insert_cauthanhdvt]	
	@mahang as nvarchar(50), 
	@donvito as nvarchar(50), 
	@soluongquydoi as nvarchar(10), 
	@donvinho as nvarchar(50),
	@gianhap as nvarchar(50),
	@giasi as nvarchar(50),
	@giaban as nvarchar(50),
	@giacauthanh as nvarchar(50)
AS
BEGIN
	
	if exists(select * from htdonvitinh where mahang=@mahang and dvtto=@donvito and dvtnho=@donvinho)
	begin
		select 0
	end
	else
	begin
		insert into htdonvitinh([mahang]
      ,[dvtto]
      ,[soluongqudoi]
      ,[dvtnho],gianhap,giaban,giabuon,giaban2) values (@mahang,@donvito,@soluongquydoi,@donvinho,cast(@gianhap as float),cast(@giaban as float),cast(@giasi as float),cast(@giacauthanh as float))

	  --update code trang thai cau thanh san pham
	  update hthanghoa set cauthanhsanpham=1 where mahang=@mahang

		select 1
	end	

END
GO
/****** Object:  StoredProcedure [dbo].[NH_update_cauthanhdvt]    Script Date: 06/26/2024 01:10:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_update_cauthanhdvt]
	@id as nvarchar(10), 
	@mahang as nvarchar(50), 
	@donvito as nvarchar(50), 
	@soluongquydoi as nvarchar(10), 
	@donvinho as nvarchar(50),
	@gianhap as nvarchar(50),
	@giasi as nvarchar(50),
	@giaban as nvarchar(50),
	@giacauthanh as nvarchar(50)

AS
BEGIN
	
	update htdonvitinh set dvtto=@donvito,dvtnho=@donvinho,soluongqudoi=@soluongquydoi,gianhap=cast(@gianhap as float),giaban=cast(@giaban as float),giabuon=cast(@giasi as float),giaban2=cast(@giacauthanh as float) where id=@id
	select 1

END
GO
