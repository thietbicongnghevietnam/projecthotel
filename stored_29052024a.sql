USE [DataNhaHang]
GO
/****** Object:  Table [dbo].[hthanghoa]    Script Date: 05/29/2024 06:03:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hthanghoa](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[mahang] [nvarchar](50) NULL,
	[tenhang] [nvarchar](50) NULL,
	[dvt] [nvarchar](50) NULL,
	[soluongton] [float] NULL,
	[anh] [nvarchar](200) NULL,
	[gianhap] [float] NULL,
	[giaban] [float] NULL,
	[nhomhangid] [int] NULL,
	[cauthanhsanpham] [tinyint] NULL CONSTRAINT [DF_hthanghoa_cauthanhsanpham]  DEFAULT (0),
	[Orderid] [tinyint] NULL CONSTRAINT [DF_hthanghoa_Orderid]  DEFAULT (0),
	[userid] [nvarchar](50) NULL,
	[created] [datetime] NULL CONSTRAINT [DF_hthanghoa_created]  DEFAULT (getdate()),
	[modified] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[htOrderMonan]    Script Date: 05/29/2024 06:03:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[htOrderMonan](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[mahang] [nvarchar](50) NULL,
	[tenhang] [nvarchar](50) NULL,
	[soluong] [int] NULL,
	[banid] [nvarchar](50) NULL,
	[Solanin] [int] NULL,
	[Flag] [int] NULL CONSTRAINT [DF_htOrderMonan_Flag]  DEFAULT (0),
	[createtime] [datetime] NULL CONSTRAINT [DF_htOrderMonan_createtime]  DEFAULT (getdate())
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[NH_danhmuchanghoa]    Script Date: 05/29/2024 06:03:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_danhmuchanghoa]
	
AS
BEGIN

	select a.id,a.mahang,a.tenhang,a.dvt,a.soluongton,a.gianhap,a.giaban,a.anh,a.Orderid,
(select b.manhomhang from htnhomhang b where b.id =a.nhomhangid ) as tennhomhang 
from hthanghoa a	 

END
GO
/****** Object:  StoredProcedure [dbo].[NH_Update_hanghoa]    Script Date: 05/29/2024 06:03:52 ******/
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
	@nhomhangid as nvarchar(50),
	@anhid as nvarchar(200),
	@checkorder as nvarchar(10)
AS
BEGIN
	if exists(select * from hthanghoa where mahang =@mahang )
	begin
		--update
		update hthanghoa set tenhang=@tenhang,dvt=@dvt,gianhap=@gianhap,giaban=@giaban,nhomhangid=@nhomhangid,anh=@anhid,Orderid=@checkorder from hthanghoa where mahang =@mahang
		select 1
	end
	else
	begin
		--khong ton tai
		select 0
	end


END
GO
/****** Object:  StoredProcedure [dbo].[NH_insert_hanghoa]    Script Date: 05/29/2024 06:03:52 ******/
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
	@nhomhangid as nvarchar(50),
	@anhid as nvarchar(200),
	@checkorder as nvarchar(10)
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
		insert into hthanghoa (mahang,tenhang,dvt,soluongton,gianhap,giaban,nhomhangid,anh,Orderid) 
values(@mahang,@tenhang,@dvt,0,@gianhap,@giaban,@nhomhangid,@anhid,@checkorder)
		select 1
	end


END
GO
