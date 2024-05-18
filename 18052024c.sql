USE [Warehouse_BPS]
GO
/****** Object:  StoredProcedure [dbo].[NH_BaocaoBH_theogio]    Script Date: 05/18/2024 23:55:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_BaocaoBH_theogio] -- NH_BaocaoBH_theogio '2024-05-18 06:00:00','2024-05-18 07:30:00'
	@checkin as nvarchar(50),
	@checkout as nvarchar(50)
AS
BEGIN
--CAST('2024-05-18 07:09:56' AS DATETIME);
--CONVERT(DATETIME, '2024-05-18 07:09:56', 120)

select * from 
(
select id,sohd,type,ngaygiothue,ngaygiora,tongthoigianthue,tenphong,
tienphong,tiengiohat,items,tienhang,tongtien,chietkhau,tiensauchietkhau,hinhthucnghi,mohinh,created,idnhanvien,psco,CONVERT(VARCHAR(5),ngaygiothue,108) as giovao,CONVERT(VARCHAR(5),ngaygiora,108) as giora from htsocai where type<>2 and ngaygiora BETWEEN  @checkin AND @checkout  

union 

select '' as id,'-','-','','','','Tong tien',
(select sum(tienphong) from htsocai where type<>2 and ngaygiora BETWEEN  @checkin AND @checkout) as tienphong,
(select sum(tiengiohat) from htsocai where type<>2 and ngaygiora BETWEEN  @checkin AND @checkout) as tiengiohat,
'' as items,
(select sum(tienhang) from htsocai where type<>2 and ngaygiora BETWEEN  @checkin AND @checkout) as tienhang,
(select sum(tongtien) from htsocai where type<>2 and ngaygiora BETWEEN  @checkin AND @checkout) as tongtien,
(select sum(chietkhau) from htsocai where type<>2 and ngaygiora BETWEEN  @checkin AND @checkout) as chietkhau,
(select sum(tiensauchietkhau) from htsocai where type<>2 and ngaygiora BETWEEN  @checkin AND @checkout)as tiensauchietkhau,
'' as hinhthucnghi,
'' as mohinh,
GETDATE() as created,
'' as idnhanvien,
'' as psco,
'' as giovao,
'' as giora
from htsocai where type<>2 and ngaygiora BETWEEN  @checkin AND @checkout
) ABC order by created asc





END
GO
/****** Object:  Table [dbo].[htsocai]    Script Date: 05/18/2024 23:55:46 ******/
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
	[idnhanvien] [nvarchar](20) NULL,
	[idncc] [int] NULL,
	[Flag] [nvarchar](10) NULL CONSTRAINT [DF_htsocai_Flag]  DEFAULT (0),
	[userid] [nvarchar](50) NULL,
	[created] [datetime] NULL CONSTRAINT [DF_htsocai_created]  DEFAULT (getdate()),
	[modified] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[htthongtindonvi]    Script Date: 05/18/2024 23:55:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[htthongtindonvi](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Tendoanhnghiep] [nvarchar](100) NULL,
	[NguoiQuanly] [nvarchar](50) NULL,
	[Masothue] [nvarchar](50) NULL,
	[Fax] [nvarchar](50) NULL,
	[Diachi1] [nvarchar](300) NULL,
	[Diachi2] [nvarchar](300) NULL,
	[Sodt1] [nvarchar](50) NULL,
	[Sodt2] [nvarchar](50) NULL,
	[Ghichu] [nvarchar](50) NULL,
	[createdate] [datetime] NULL CONSTRAINT [DF_htthongtindonvi_createdate]  DEFAULT (getdate())
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_USER2]    Script Date: 05/18/2024 23:55:48 ******/
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
/****** Object:  StoredProcedure [dbo].[NH_BaocaoBH_theongay_NV]    Script Date: 05/18/2024 23:55:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_BaocaoBH_theongay_NV] -- NH_BaocaoBH_theongay_NV '2024-05-02','2024-05-02'
	@_fromdate as nvarchar(50),
	@_todate as nvarchar(50),
	@idnhanvien as nvarchar(50)
AS
BEGIN

select id,sohd,type,ngaygiothue,ngaygiora,tongthoigianthue,tenphong,
tienphong,tiengiohat,items,tienhang,tongtien,chietkhau,tiensauchietkhau,hinhthucnghi,mohinh,created,idnhanvien,psco,CONVERT(VARCHAR(5),ngaygiothue,108) as giovao,CONVERT(VARCHAR(5),ngaygiora,108)as giora from htsocai 
where idnhanvien=@idnhanvien and convert(varchar,created,23) BETWEEN convert(varchar,@_fromdate,23) AND convert(varchar,@_todate,23)
--convert(varchar,created,23) BETWEEN convert(varchar,@_fromdate,23) AND convert(varchar,@_todate,23)
union 

select '1000' as id,'-','-','','','','Tong tien',
(select sum(tienphong) from htsocai where idnhanvien=@idnhanvien and convert(varchar,created,23) BETWEEN convert(varchar,@_fromdate,23) AND convert(varchar,@_todate,23)) as tienphong,
(select sum(tiengiohat) from htsocai where idnhanvien=@idnhanvien and convert(varchar,created,23) BETWEEN convert(varchar,@_fromdate,23) AND convert(varchar,@_todate,23)) as tiengiohat,
'' as items,
(select sum(tienhang) from htsocai where idnhanvien=@idnhanvien and convert(varchar,created,23) BETWEEN convert(varchar,@_fromdate,23) AND convert(varchar,@_todate,23)) as tienhang,
(select sum(tongtien) from htsocai where idnhanvien=@idnhanvien and convert(varchar,created,23) BETWEEN convert(varchar,@_fromdate,23) AND convert(varchar,@_todate,23)) as tongtien,
(select sum(chietkhau) from htsocai where idnhanvien=@idnhanvien and convert(varchar,created,23) BETWEEN convert(varchar,@_fromdate,23) AND convert(varchar,@_todate,23)) as chietkhau,
(select sum(tiensauchietkhau) from htsocai where idnhanvien=@idnhanvien and convert(varchar,created,23) BETWEEN convert(varchar,@_fromdate,23) AND convert(varchar,@_todate,23))as tiensauchietkhau,
'' as hinhthucnghi,
'' as mohinh,
'' as created,
'' as idnhanvien,
'' as psco,
'' as giovao,
'' as giora

from htsocai





END
GO
/****** Object:  StoredProcedure [dbo].[NH_BaocaoBH_NV]    Script Date: 05/18/2024 23:55:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_BaocaoBH_NV]
	@idnhanvien as nvarchar(50)
AS
BEGIN

select * from 
(
select id,sohd,type,ngaygiothue,ngaygiora,tongthoigianthue,tenphong,
tienphong,tiengiohat,items,tienhang,tongtien,chietkhau,tiensauchietkhau,hinhthucnghi,mohinh,created,idnhanvien,psco,CONVERT(VARCHAR(5),ngaygiothue,108) as giovao,CONVERT(VARCHAR(5),ngaygiora,108) as giora from htsocai where convert(varchar, created, 23) = convert(varchar, getdate(), 23) and idnhanvien=@idnhanvien

union 

select '' as id,'-','-','','','','Tong tien',
(select sum(tienphong) from htsocai where convert(varchar, created, 23) = convert(varchar, getdate(), 23) and idnhanvien=@idnhanvien) as tienphong,
(select sum(tiengiohat) from htsocai where convert(varchar, created, 23) = convert(varchar, getdate(), 23) and idnhanvien=@idnhanvien) as tiengiohat,
'' as items,
(select sum(tienhang) from htsocai where convert(varchar, created, 23) = convert(varchar, getdate(), 23) and idnhanvien=@idnhanvien) as tienhang,
(select sum(tongtien) from htsocai where convert(varchar, created, 23) = convert(varchar, getdate(), 23) and idnhanvien=@idnhanvien) as tongtien,
(select sum(chietkhau) from htsocai where convert(varchar, created, 23) = convert(varchar, getdate(), 23) and idnhanvien=@idnhanvien) as chietkhau,
(select sum(tiensauchietkhau) from htsocai where convert(varchar, created, 23) = convert(varchar, getdate(), 23) and idnhanvien=@idnhanvien)as tiensauchietkhau,
'' as hinhthucnghi,
'' as mohinh,
GETDATE() as created,
'' as idnhanvien,
'' as psco,
'' as giovao,
'' as giora
from htsocai where convert(varchar, created, 23) = convert(varchar, getdate(), 23) and idnhanvien=@idnhanvien
) ABC order by created asc





END
GO
/****** Object:  StoredProcedure [dbo].[NH_save_thongtinhanghoa]    Script Date: 05/18/2024 23:55:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_save_thongtinhanghoa]   --NH_save_thongtinhanghoa '2','P04','0','{}',''
	@kieunghi as nvarchar(10),
	@tenphong as nvarchar(50), 	 
	@tienhang as nvarchar(50),
	@items as nvarchar(500),
	@userid as nvarchar(20)
	
AS
BEGIN
	declare @status_checking as nvarchar(10)

	declare @sohd as nvarchar(50)
	declare @namthangngay  as nvarchar(50)
	declare @unitno as nvarchar(50)
	declare @maxunitno as nvarchar(50)
	
	declare @maxHD as nvarchar(10)

	declare @checkbegin as int
	set @checkbegin = (select COUNT (*) FROM htsocai)

	print @checkbegin


	set @namthangngay = (SELECT CONVERT(CHAR(8),getdate(),112))



	set @status_checking = (select top 1 [Flag]  FROM htsocai where tenphong=@tenphong and Flag='0')
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
			set @maxunitno = (select top 1 ID  FROM htsocai where tenphong=@tenphong and Flag='0' order by ID desc)
									
				insert into htsocai ([sohd],
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
			  ,[idnhanvien]) values(@sohd,'1',GETDATE(),'','','nguyen van a',@tenphong,8000,'','',@tienhang,'','','','','','',@kieunghi,'1',@items,3,'',@userid)

			  --update trang thai phong co khach  trangthai='1'  (co khach)
			  update htphong set trangthai='1' where tenphong=@tenphong

			  select 1

		end
		else
		begin
			--update
			print 'update'
			update htsocai set items=@items,tienhang=@tienhang where tenphong=@tenphong and Flag='0' 

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
		insert into htsocai ([sohd],
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
      ,[idnhanvien]) values(@soHD,'1',GETDATE(),'','','nguyen van a',@tenphong,8000,'','',@tienhang,'','','','','','',@kieunghi,'1',@items,3,'',@userid)

		select 1
	end


END
GO
/****** Object:  StoredProcedure [dbo].[NH_thongtin_doanhnghiep]    Script Date: 05/18/2024 23:55:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_thongtin_doanhnghiep]
	
AS
BEGIN
	
 select * from htthongtindonvi where id=1

END
GO
/****** Object:  StoredProcedure [dbo].[NH_insert_thongtindoanhnghiep]    Script Date: 05/18/2024 23:55:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_insert_thongtindoanhnghiep]
@tenid_ as nvarchar(100), 
@quanlyid_ as nvarchar(100), 
@masothueid_ as nvarchar(50), 
@faxid_ as nvarchar(50), 
@diachi1id_ as nvarchar(200), 
@diachi2id_ as nvarchar(200), 
@dienthoai1id_ as nvarchar(20), 
@dienthoai2id_ as nvarchar(20), 
@ghichuid_ as nvarchar(300)
AS
BEGIN
	
	insert into htthongtindonvi (Tendoanhnghiep,NguoiQuanly,Masothue,Fax,Diachi1,Diachi2,Sodt1,Sodt2,Ghichu)
values(@tenid_,@quanlyid_,@masothueid_,@faxid_,@diachi1id_,@diachi2id_,@dienthoai1id_,@dienthoai2id_,@ghichuid_)
select 1


END
GO
/****** Object:  StoredProcedure [dbo].[NH_Update_doanhnghiep]    Script Date: 05/18/2024 23:55:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_Update_doanhnghiep]
	@id as nvarchar(10),
	@Tendoanhnghiep as nvarchar(100), 
	@NguoiQuanly as nvarchar(100), 
	@Masothue as nvarchar(50), 
	@Fax as nvarchar(50), 
	@Diachi1 as nvarchar(200), 
	@Diachi2 as nvarchar(200), 
	@Sodt1 as nvarchar(20), 
	@Sodt2 as nvarchar(20), 
	@ghichu as nvarchar(300)
AS
BEGIN

	if exists(select * from htthongtindonvi where id= @id)
	begin
					update htthongtindonvi set Tendoanhnghiep=@Tendoanhnghiep,NguoiQuanly=@NguoiQuanly,Masothue=@Masothue,
		Fax=@Fax,Diachi1=@Diachi1,Diachi2=@Diachi2,Sodt1=@Sodt1,Sodt2=@Sodt2,Ghichu=@ghichu where id= @id

			select 1

	end
	else
	begin
		select 0
	end
	
END
GO
/****** Object:  StoredProcedure [dbo].[NH_select_info_phong4]    Script Date: 05/18/2024 23:55:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[NH_select_info_phong4] 
	

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
      
  FROM htphong where khuvucid=3

END
GO
/****** Object:  StoredProcedure [dbo].[NH_select_info_phong3]    Script Date: 05/18/2024 23:55:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_select_info_phong3] 
	

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
      
  FROM htphong where khuvucid=3

END
GO
/****** Object:  StoredProcedure [dbo].[NH_Get_nhanvien]    Script Date: 05/18/2024 23:55:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_Get_nhanvien]

AS
BEGIN
	
select U_ID,U_NAME from  TBL_USER2

END
GO
/****** Object:  StoredProcedure [dbo].[NH_select_khuvuc4]    Script Date: 05/18/2024 23:55:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[NH_select_khuvuc4]
	

AS
BEGIN
	
	SELECT [tenkhuvuc] FROM htkhuvuc where makhuvuc='4'

END
GO
/****** Object:  StoredProcedure [dbo].[NH_select_khuvuc3]    Script Date: 05/18/2024 23:55:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_select_khuvuc3]
	

AS
BEGIN
	
	SELECT [tenkhuvuc] FROM htkhuvuc where makhuvuc='3'

END
GO
