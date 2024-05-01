USE [Warehouse_BPS]
GO
/****** Object:  Table [dbo].[TBL_USER2]    Script Date: 05/02/2024 01:00:09 ******/
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
/****** Object:  StoredProcedure [dbo].[NH_danhmucnhomhang]    Script Date: 05/02/2024 01:00:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_danhmucnhomhang]
	
AS
BEGIN
	
select id,manhomhang,tennhomhang from htnhomhang

END
GO
/****** Object:  StoredProcedure [dbo].[NH_Update_nhomhang]    Script Date: 05/02/2024 01:00:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_Update_nhomhang]
	@makhuvuc as nvarchar(50), 
	@tenkhuvuc as nvarchar(50)
AS
BEGIN
	if exists(select * from htnhomhang where manhomhang =@makhuvuc )
	begin
		--update
		update htnhomhang set tennhomhang=@tenkhuvuc where manhomhang =@makhuvuc
		select 1
	end
	else
	begin
		--khong ton tai
		select 0
	end
END
GO
/****** Object:  StoredProcedure [dbo].[NH_insert_nhomhang]    Script Date: 05/02/2024 01:00:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[NH_insert_nhomhang]
	@makhuvuc as nvarchar(50), 
	@tenkhuvuc as nvarchar(50) 
	
AS
BEGIN
	if exists(select * from htnhomhang where manhomhang =@makhuvuc )
	begin
		--da ton tai nhom hang
		select 0
	end
	else
	begin
		--them moi
		insert into htnhomhang (manhomhang,tennhomhang) 
values(@makhuvuc,@tenkhuvuc)
		select 1
	end


END
GO
/****** Object:  StoredProcedure [dbo].[NH_danhmuchanghoa]    Script Date: 05/02/2024 01:00:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_danhmuchanghoa]
	
AS
BEGIN

	select a.id,a.mahang,a.tenhang,a.dvt,a.soluongton,a.gianhap,a.giaban,
(select b.manhomhang from htnhomhang b where b.id =a.nhomhangid ) as tennhomhang 
from hthanghoa a	 

END
GO
/****** Object:  StoredProcedure [dbo].[NH_Get_nhomhang]    Script Date: 05/02/2024 01:00:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_Get_nhomhang]
	
AS
BEGIN

select id,manhomhang from htnhomhang	

END
GO
/****** Object:  StoredProcedure [dbo].[NH_insert_nhacungcap]    Script Date: 05/02/2024 01:00:08 ******/
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
/****** Object:  StoredProcedure [dbo].[NH_danhmucnhacungcap]    Script Date: 05/02/2024 01:00:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_danhmucnhacungcap]
	
AS
BEGIN
	
select id,mancc,tenncc,congnodi from htnhacungcap

END
GO
/****** Object:  StoredProcedure [dbo].[NH_Update_nhacungcap]    Script Date: 05/02/2024 01:00:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_Update_nhacungcap]
	@makhuvuc as nvarchar(50), 
	@tenkhuvuc as nvarchar(50)
AS
BEGIN
	if exists(select * from htnhacungcap where mancc =@makhuvuc )
	begin
		--update
		update htnhacungcap set tenncc=@tenkhuvuc where mancc =@makhuvuc
		select 1
	end
	else
	begin
		--khong ton tai
		select 0
	end
END
GO
/****** Object:  StoredProcedure [dbo].[NH_insert_DMnhacungcap]    Script Date: 05/02/2024 01:00:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[NH_insert_DMnhacungcap]
	@makhuvuc as nvarchar(50), 
	@tenkhuvuc as nvarchar(50),
	@congnoden as nvarchar(50) 
	
AS
BEGIN
	if exists(select * from htnhacungcap where mancc =@makhuvuc )
	begin
		--da ton tai nhom hang
		select 0
	end
	else
	begin
		--them moi
		insert into htnhacungcap (mancc,tenncc,congnodi) 
values(@makhuvuc,@tenkhuvuc,@congnoden)
		select 1
	end


END
GO
/****** Object:  StoredProcedure [dbo].[NH_danhmucbanphong]    Script Date: 05/02/2024 01:00:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_danhmucbanphong]
	
AS
BEGIN
	
select * from htphong


END
GO
/****** Object:  StoredProcedure [dbo].[NH_Update_phongban]    Script Date: 05/02/2024 01:00:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_Update_phongban]
	@banphongid as nvarchar(50), 
	@khuvucid as nvarchar(50)
AS
BEGIN

if exists(select * from htphong where tenphong = @banphongid and karaoke=0 and nhanghi=0)
begin
	--nhahang
	update htphong set khuvucid=@khuvucid where tenphong = @banphongid
	select 1
end
else
begin
	select 0
end
	
END
GO
/****** Object:  StoredProcedure [dbo].[NH_addnew_phongban]    Script Date: 05/02/2024 01:00:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_addnew_phongban]
	@tenbanphong as nvarchar(50), 
	@khuvucid as nvarchar(50)
AS
BEGIN
	
if exists(select * from htphong where tenphong = @tenbanphong and karaoke=0 and nhanghi=0)
begin
	--nhahang	, da ton tai
	select 0
end
else
begin
	insert into htphong (tenphong,loaiphongid,khuvucid,karaoke,nhanghi) values(@tenbanphong,'1',cast (@khuvucid as int), '0','0')
	select 1
end

END
GO
/****** Object:  StoredProcedure [dbo].[NH_danhmucnhanvien]    Script Date: 05/02/2024 01:00:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_danhmucnhanvien]
	
AS
BEGIN
	
select U_ID,U_NAME,U_FULLNAME,U_PASSWORD from  TBL_USER2

END
GO
/****** Object:  StoredProcedure [dbo].[NH_Update_nhanvien]    Script Date: 05/02/2024 01:00:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_Update_nhanvien]
	@makhuvuc as nvarchar(50), 
	@tenkhuvuc as nvarchar(50)
AS
BEGIN
	if exists(select * from TBL_USER2 where U_NAME =@makhuvuc )
	begin
		--update
		update TBL_USER2 set U_FULLNAME=@tenkhuvuc where U_NAME =@makhuvuc
		select 1
	end
	else
	begin
		--khong ton tai
		select 0
	end
END
GO
/****** Object:  StoredProcedure [dbo].[NH_insert_DMnhanvien]    Script Date: 05/02/2024 01:00:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_insert_DMnhanvien]
	@makhuvuc as nvarchar(50), 
	@tenkhuvuc as nvarchar(50),
	@maukhau as nvarchar(50) 
	
AS
BEGIN
	if exists(select * from TBL_USER2 where U_NAME =@makhuvuc )
	begin
		--da ton tai nhom hang
		select 0
	end
	else
	begin
		--them moi
		insert into TBL_USER2 (U_NAME,U_FULLNAME,U_PASSWORD,ROLE) 
values(@makhuvuc,@tenkhuvuc,@maukhau,'NV')
		select 1
	end


END
GO
/****** Object:  StoredProcedure [dbo].[NH_insert_hanghoa]    Script Date: 05/02/2024 01:00:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_insert_hanghoa]
	@mahang as nvarchar(50), 
	@tenhang as nvarchar(50), 
	@dvt as nvarchar(50), 
	@gianhap as nvarchar(50), 
	@giaban as nvarchar(50), 
	@nhomhangid as nvarchar(50)
AS
BEGIN
	if exists(select * from hthanghoa where mahang =@mahang )
	begin
		--da ton tai ma hang
		select 0
	end
	else
	begin
		--them moi
		insert into hthanghoa (mahang,tenhang,dvt,soluongton,gianhap,giaban,nhomhangid) 
values(@mahang,@tenhang,@dvt,0,@gianhap,@giaban,@nhomhangid)
		select 1
	end


END
GO
/****** Object:  StoredProcedure [dbo].[NH_Update_hanghoa]    Script Date: 05/02/2024 01:00:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_Update_hanghoa]
	@mahang as nvarchar(50), 
	@tenhang as nvarchar(50), 
	@dvt as nvarchar(50), 
	@gianhap as nvarchar(50), 
	@giaban as nvarchar(50), 
	@nhomhangid as nvarchar(50)
AS
BEGIN
	if exists(select * from hthanghoa where mahang =@mahang )
	begin
		--update
		update hthanghoa set tenhang=@tenhang,dvt=@dvt,gianhap=@gianhap,giaban=@giaban,nhomhangid=@nhomhangid from hthanghoa where mahang =@mahang
		select 1
	end
	else
	begin
		--khong ton tai
		select 0
	end


END
GO
/****** Object:  StoredProcedure [dbo].[NH_insert_khachhang]    Script Date: 05/02/2024 01:00:08 ******/
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
/****** Object:  StoredProcedure [dbo].[NH_danhmuckhachhang]    Script Date: 05/02/2024 01:00:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_danhmuckhachhang]
	
AS
BEGIN
	
select id,makh,tenkh,congnoden from htkhachhang

END
GO
/****** Object:  StoredProcedure [dbo].[NH_Update_khachhang]    Script Date: 05/02/2024 01:00:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_Update_khachhang]
	@makhuvuc as nvarchar(50), 
	@tenkhuvuc as nvarchar(50)
AS
BEGIN
	if exists(select * from htkhachhang where makh =@makhuvuc )
	begin
		--update
		update htkhachhang set tenkh=@tenkhuvuc where makh =@makhuvuc
		select 1
	end
	else
	begin
		--khong ton tai
		select 0
	end
END
GO
/****** Object:  StoredProcedure [dbo].[NH_insert_DMkhachhang]    Script Date: 05/02/2024 01:00:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[NH_insert_DMkhachhang]
	@makhuvuc as nvarchar(50), 
	@tenkhuvuc as nvarchar(50),
	@congnoden as nvarchar(50) 
	
AS
BEGIN
	if exists(select * from htkhachhang where makh =@makhuvuc )
	begin
		--da ton tai nhom hang
		select 0
	end
	else
	begin
		--them moi
		insert into htkhachhang (makh,tenkh,congnoden) 
values(@makhuvuc,@tenkhuvuc,@congnoden)
		select 1
	end


END
GO
/****** Object:  StoredProcedure [dbo].[NH_Update_khuvuc]    Script Date: 05/02/2024 01:00:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_Update_khuvuc]
	@makhuvuc as nvarchar(50), 
	@tenkhuvuc as nvarchar(50)
AS
BEGIN
	if exists(select * from htkhuvuc where makhuvuc =@makhuvuc )
	begin
		--update
		update htkhuvuc set tenkhuvuc=@tenkhuvuc where makhuvuc =@makhuvuc
		select 1
	end
	else
	begin
		--khong ton tai
		select 0
	end
END
GO
/****** Object:  StoredProcedure [dbo].[NH_insert_khuvuc]    Script Date: 05/02/2024 01:00:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[NH_insert_khuvuc]
	@makhuvuc as nvarchar(50), 
	@tenkhuvuc as nvarchar(50) 
	
AS
BEGIN
	if exists(select * from htkhuvuc where makhuvuc =@makhuvuc )
	begin
		--da ton tai khu vuc
		select 0
	end
	else
	begin
		--them moi
		insert into htkhuvuc (makhuvuc,tenkhuvuc) 
values(@makhuvuc,@tenkhuvuc)
		select 1
	end


END
GO
/****** Object:  StoredProcedure [dbo].[NH_Get_Khuvuc]    Script Date: 05/02/2024 01:00:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_Get_Khuvuc]
	
AS
BEGIN
	
	select id, tenkhuvuc from htkhuvuc

END
GO
/****** Object:  StoredProcedure [dbo].[NH_danhmuckhuvuc]    Script Date: 05/02/2024 01:00:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_danhmuckhuvuc]
	
AS
BEGIN
	
select id,makhuvuc,tenkhuvuc from htkhuvuc

END
GO
