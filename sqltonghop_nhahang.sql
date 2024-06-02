USE [DataNhaHang]
GO
/****** Object:  Table [dbo].[htloaiphong]    Script Date: 06/01/2024 00:26:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[htloaiphong](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tenloaiphong] [nvarchar](50) NULL,
	[giadem] [float] NULL,
	[gio1] [float] NULL,
	[giagio1] [float] NULL,
	[gio2] [float] NULL,
	[giagio2] [float] NULL,
	[gio3] [float] NULL,
	[giagio3] [float] NULL,
	[ngay1] [float] NULL,
	[giacangay] [float] NULL,
	[giangay1] [float] NULL,
	[ngay2] [float] NULL,
	[giangay2] [float] NULL,
	[tuan1] [float] NULL,
	[giatuan1] [float] NULL,
	[giathang1] [float] NULL,
	[userid] [nvarchar](50) NULL,
	[locked] [tinyint] NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[NH_getsohoadon]    Script Date: 06/01/2024 00:26:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_getsohoadon]
	
AS
BEGIN
	declare @sohoadon as nvarchar(10)
	if exists(select id  FROM htsocai where Flag='1')
	begin		
		--set @sohoadon = (select count(ID) as countid  from [Warehouse_BPS].[dbo].[htsocai] where Flag=1 )
	    --set @sohoadon = (select top 1 id FROM htsocai where Flag =1 order by id desc)
		set @sohoadon = (select top 1 sohd FROM htsocai where Flag =1 order by id desc)
		select @sohoadon
	end
	else
	begin
		--set @sohoadon = 0
		select 0
	end

END
GO
/****** Object:  Table [dbo].[htnhanvien]    Script Date: 06/01/2024 00:26:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[htnhanvien](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idhoadon] [int] NULL,
	[manv] [nvarchar](50) NULL,
	[fullname] [nvarchar](50) NULL,
	[cmt] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[address] [nvarchar](50) NULL,
	[mobile] [nvarchar](50) NULL,
	[modified] [datetime] NULL,
	[created] [datetime] NULL,
	[locked] [nvarchar](50) NULL,
	[userid] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[htnhomhang]    Script Date: 06/01/2024 00:26:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[htnhomhang](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[manhomhang] [nvarchar](50) NULL,
	[tennhomhang] [nvarchar](50) NULL,
	[userid] [nvarchar](50) NULL,
	[modified] [datetime] NULL,
	[locked] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[htcauthanhsanpham]    Script Date: 06/01/2024 00:26:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[htcauthanhsanpham](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[mahang] [nvarchar](50) NULL,
	[Slquydoi] [float] NULL,
	[mahangquydoi] [nvarchar](50) NULL,
	[Createdate] [datetime] NULL CONSTRAINT [DF_htcauthanhsanpham_Createdate]  DEFAULT (getdate())
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[htthuephong]    Script Date: 06/01/2024 00:26:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[htthuephong](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[khachhangid] [nvarchar](50) NULL,
	[phongid] [int] NULL,
	[sophong] [nvarchar](50) NULL,
	[thoigianthue] [varchar](50) NULL,
	[hinhthuctra] [nvarchar](50) NULL,
	[userid] [nvarchar](50) NULL,
	[createtime] [datetime] NULL,
	[modified] [datetime] NULL,
	[locked] [tinyint] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[Insert_DM_NCC]    Script Date: 06/01/2024 00:26:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_DM_NCC]
	@mancc as nvarchar(50), @tenncc as nvarchar(50), @nhomhang as nvarchar(5), @nguoitao as nvarchar(10)
AS
BEGIN
	
	
	
	insert into DM_NCC([MaNCC]
      ,[TenNCC]
      ,[MaNhom]
      ,[TrangThai]
      ,[userid]
      ,[updatesql]) values(@mancc, @tenncc, @nhomhang,0, @nguoitao,getdate()) 
	
	select * from DM_NCC --where MaNCC=@mancc
END
GO
/****** Object:  Table [dbo].[TBL_LOCATION]    Script Date: 06/01/2024 00:26:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_LOCATION](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LOCATION_CODE] [nvarchar](50) NULL,
	[LOCATION_NAME] [nvarchar](50) NULL,
	[F_STATUS] [int] NOT NULL CONSTRAINT [DF_TBL_LOCATION_F_STATUS]  DEFAULT (0),
	[INSERT_DT] [datetime] NOT NULL CONSTRAINT [DF_TBL_LOCATION_INSERT_DT]  DEFAULT (getdate())
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_User]    Script Date: 06/01/2024 00:26:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_User](
	[User_ID] [int] IDENTITY(1,1) NOT NULL,
	[User_Name] [nvarchar](500) NOT NULL,
	[User_FullName] [nvarchar](500) NOT NULL,
	[User_DeptID] [nvarchar](500) NOT NULL,
	[User_Pass] [nvarchar](500) NOT NULL,
	[CreateDate] [datetime] NULL,
	[CreateBy] [nvarchar](500) NULL,
	[Status] [nvarchar](500) NOT NULL,
	[DeleteDate] [datetime] NULL,
	[DeleteBy] [nvarchar](500) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UpLoad_Mater]    Script Date: 06/01/2024 00:26:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UpLoad_Mater](
	[Mahang] [nvarchar](50) NULL,
	[TenHang] [nvarchar](50) NULL,
	[DVT] [nvarchar](50) NULL,
	[LoaiHang] [nvarchar](50) NULL,
	[InputDate] [datetime] NULL,
	[Comment] [nvarchar](50) NULL,
	[IDHD] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[htnhacungcap]    Script Date: 06/01/2024 00:26:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[htnhacungcap](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[mancc] [nvarchar](50) NULL,
	[tenncc] [nvarchar](50) NULL,
	[congnoden] [float] NULL,
	[congnodi] [float] NULL,
	[createdate] [datetime] NULL,
	[createuser] [nvarchar](50) NULL,
	[updatedate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[htsocai_BK]    Script Date: 06/01/2024 00:26:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[htsocai_BK](
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
	[idnhanvien] [int] NULL,
	[idncc] [int] NULL,
	[Flag] [nvarchar](10) NULL,
	[userid] [nvarchar](50) NULL,
	[created] [datetime] NULL,
	[modified] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[NH_BaocaoBH_theogio]    Script Date: 06/01/2024 00:26:15 ******/
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
/****** Object:  Table [dbo].[htsonhaphang]    Script Date: 06/01/2024 00:26:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[htsonhaphang](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[sohd] [nvarchar](50) NULL,
	[idncc] [int] NULL,
	[items] [nvarchar](500) NULL,
	[tongtien] [float] NULL,
	[chietkhau] [float] NULL,
	[tongtienthanhtoan] [float] NULL,
	[psco] [float] NULL,
	[psno] [float] NULL,
	[ghichu] [nvarchar](50) NULL,
	[userid] [nvarchar](50) NULL,
	[created] [datetime] NULL CONSTRAINT [DF_htsonhaphang_created]  DEFAULT (getdate()),
	[modified] [datetime] NULL,
	[listtoncuoiky] [nvarchar](500) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[htsocai]    Script Date: 06/01/2024 00:26:43 ******/
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
/****** Object:  Table [dbo].[htthongtindonvi]    Script Date: 06/01/2024 00:26:47 ******/
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
/****** Object:  Table [dbo].[htSoQuy]    Script Date: 06/01/2024 00:26:46 ******/
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
/****** Object:  Table [dbo].[hthinhthucnghi]    Script Date: 06/01/2024 00:26:34 ******/
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
/****** Object:  StoredProcedure [dbo].[NH_danhsachinbarcode]    Script Date: 06/01/2024 00:26:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_danhsachinbarcode] 
	
AS
BEGIN
	
select mahang,tenhang,giaban from hthanghoa

END
GO
/****** Object:  Table [dbo].[htphong]    Script Date: 06/01/2024 00:26:41 ******/
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
/****** Object:  Table [dbo].[TBL_USER2]    Script Date: 06/01/2024 00:26:50 ******/
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
/****** Object:  Table [dbo].[htcandoihangton]    Script Date: 06/01/2024 00:26:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[htcandoihangton](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[mahang] [nvarchar](50) NULL,
	[tenhang] [nvarchar](100) NULL,
	[slcu] [nvarchar](10) NULL,
	[slmoi] [nvarchar](10) NULL,
	[listtoncuoiky] [nvarchar](200) NULL,
	[created] [datetime] NULL CONSTRAINT [DF_htcandoihangton_created]  DEFAULT (getdate()),
	[userid] [nvarchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[Insert_DM_HangHoa]    Script Date: 06/01/2024 00:26:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_DM_HangHoa]
	@mahang nvarchar(50), @tenhang nvarchar(50), @dvt nvarchar(50), @giale float, @nhomhang nvarchar(50),@nhacc nvarchar(50), @xuatxu nvarchar(50), @nguoitao nvarchar(50)
AS
BEGIN
	insert into DM_HangHoa(MaHang, TenHang, Dvt, GiaLe, NhomHangID,MaNCC, XuatXu, NguoiTao) values(@mahang,@tenhang,@dvt,@giale,@nhomhang,@nhacc,@xuatxu,@nguoitao) 
	select * from DM_HangHoa where MaHang=@mahang
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_DM_nhomhang]    Script Date: 06/01/2024 00:26:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_DM_nhomhang]
	@manhom nvarchar(50),@tennhom nvarchar(50)
AS
BEGIN
	insert into DM_NhomHang(MaNhom,TenNhom) values(@manhom,@tennhom) 
	select * from DM_NhomHang 
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_DM_PhongBan]    Script Date: 06/01/2024 00:26:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_DM_PhongBan]
	@maphongban as nvarchar(50), @tenphongban as nvarchar(50), @section as nvarchar(50), @namegroup as nvarchar(50), @nguoitao as nvarchar(10)
AS
BEGIN
	
	
	
	insert into DM_PhongBan([MaPhongBan]
      ,[TenPhongBan]
      ,[Section]
      ,[NameGroup]
      ,[TrangThai]
      ,[userid]
      ,[updatesql]) values(@maphongban, @tenphongban, @section, @namegroup,0, @nguoitao,getdate()) 
	
	select * from DM_PhongBan where MaPhongBan=@maphongban
END
GO
/****** Object:  Table [dbo].[hthanghoa]    Script Date: 06/01/2024 00:26:34 ******/
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
/****** Object:  StoredProcedure [dbo].[NH_select_documentNo]    Script Date: 06/01/2024 00:26:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_select_documentNo]  --NH_select_documentNo 'Bò khô'
	@mahang as nvarchar(50)
AS
BEGIN
	--select * from [dbo].[hthanghoa] where tenhang like '%'+@mahang+'%'

	select * from hthanghoa where tenhang=@mahang

	
END
GO
/****** Object:  StoredProcedure [dbo].[NH_select_hanghoa]    Script Date: 06/01/2024 00:26:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_select_hanghoa]  --NH_select_hanghoa '1'
	@nhomhangid as nvarchar(50)
AS
BEGIN
	if(@nhomhangid='')
	begin
		--all nhom hang
		select *  FROM hthanghoa 
	end
	else
	begin
		--mahang,tenhang,giaban
		select *  FROM hthanghoa where nhomhangid=@nhomhangid
	end
	

END
GO
/****** Object:  Table [dbo].[htOrderMonan]    Script Date: 06/01/2024 00:26:39 ******/
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
/****** Object:  StoredProcedure [dbo].[NH_Baocaotonkho_lolai]    Script Date: 06/01/2024 00:26:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_Baocaotonkho_lolai]
	
AS
BEGIN
	
	SELECT TOP 1000 [id]
      ,[mahang]
      ,[tenhang]
      ,[dvt]
	  ,'' as soluongnhap
	  ,'' as soluongxuat
      ,[soluongton] as toncuoiky
      ,[anh]
      ,[gianhap]
      ,[giaban]
	  ,'0' as doanhso
	  ,'0' as giavon
	  ,'0' as laigop
	  ,'' sohd
      --,[nhomhangid]
      --,[userid]
      --,[created]
      --,[modified]
  FROM hthanghoa


END
GO
/****** Object:  StoredProcedure [dbo].[NH_laymahang_tk]    Script Date: 06/01/2024 00:26:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_laymahang_tk] 
	@tenhang as nvarchar(300)
AS
BEGIN

if exists(select mahang from hthanghoa where tenhang=@tenhang)
begin
	select mahang,dvt,giaban from hthanghoa where tenhang=@tenhang
	--select 1
end
else
begin
	select 0
end	

END
GO
/****** Object:  StoredProcedure [dbo].[NH_select_documentNo2]    Script Date: 06/01/2024 00:26:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_select_documentNo2]  --NH_select_documentNo2 'Biahn'
	@mahang as nvarchar(50)
AS
BEGIN
	--select * from [dbo].[hthanghoa] where tenhang like '%'+@mahang+'%'

	select * from hthanghoa where tenhang=@mahang

	
END
GO
/****** Object:  StoredProcedure [dbo].[NH_select_documentNo_NH]    Script Date: 06/01/2024 00:26:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_select_documentNo_NH]  --NH_select_documentNo_NH 'bia ha noi'
	@mahang as nvarchar(50)
AS
BEGIN
	--select * from [dbo].[hthanghoa] where tenhang like '%'+@mahang+'%'

	select * from hthanghoa where tenhang=@mahang

	
END
GO
/****** Object:  Table [dbo].[htlogin]    Script Date: 06/01/2024 00:26:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[htlogin](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[checkdate] [datetime] NULL,
	[Flag] [tinyint] NULL CONSTRAINT [DF_htlogin_Flag]  DEFAULT (0)
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[htdonvitinh]    Script Date: 06/01/2024 00:26:33 ******/
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
	[createdate] [datetime] NULL CONSTRAINT [DF_htdonvitinh_createdate]  DEFAULT (getdate())
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[htdatphong]    Script Date: 06/01/2024 00:26:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[htdatphong](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[sohd] [nvarchar](50) NULL,
	[tenphong] [nvarchar](50) NULL,
	[giaphong] [float] NULL,
	[ngaygiothue] [datetime] NULL,
	[ngaygiora] [datetime] NULL,
	[tenkhachhang] [nvarchar](50) NULL,
	[cmt] [nvarchar](50) NULL,
	[diachi] [nvarchar](50) NULL,
	[tiencoc] [float] NULL,
	[hinhthucnghi] [int] NULL,
	[trangthai] [tinyint] NULL,
	[ghichu] [nvarchar](50) NULL,
	[userid] [nvarchar](50) NULL,
	[createtime] [datetime] NULL,
	[modified] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[NH_laymahang_tk_chuan]    Script Date: 06/01/2024 00:26:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_laymahang_tk_chuan]  --NH_laymahang_tk_chuan 'nuocloc'
	@mahang as nvarchar(300)
AS
BEGIN

if exists(select mahang from hthanghoa where mahang=@mahang)
begin
	select mahang,dvt,giaban from hthanghoa where mahang=@mahang
	--select 1
end
else
begin
	if exists(select mahang from hthanghoa where tenhang=@mahang)
	begin
		select mahang,dvt,giaban from hthanghoa where tenhang=@mahang
	end
	else
	begin
		select 0
	end
end	

END
GO
/****** Object:  Table [dbo].[htkhachhang]    Script Date: 06/01/2024 00:26:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[htkhachhang](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[makh] [nchar](10) NULL,
	[tenkh] [nvarchar](50) NULL,
	[congnoden] [float] NULL,
	[congnodi] [float] NULL,
	[createddate] [datetime] NULL,
	[createduser] [nvarchar](50) NULL,
	[updatedate] [datetime] NULL,
	[status] [tinyint] NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[NH_laydungtenhang]    Script Date: 06/01/2024 00:26:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_laydungtenhang]
	@mahang_chuan as nvarchar(50)
AS
BEGIN
	
	if exists(select * from hthanghoa where mahang=@mahang_chuan )
begin
	select tenhang from hthanghoa where mahang=@mahang_chuan
end
else
begin
	if exists(select * from hthanghoa where tenhang=@mahang_chuan )
	begin
		select tenhang from hthanghoa where tenhang=@mahang_chuan
	end
	else
	begin
		select 0
	end
	--select 0
end

END
GO
/****** Object:  Table [dbo].[htkhuvuc]    Script Date: 06/01/2024 00:26:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[htkhuvuc](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[makhuvuc] [nvarchar](50) NULL,
	[tenkhuvuc] [nvarchar](50) NULL,
	[userid] [nvarchar](50) NULL,
	[modified] [datetime] NULL,
	[locked] [tinyint] NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[NH_laydungmahang]    Script Date: 06/01/2024 00:26:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[NH_laydungmahang]  -- NH_laydungmahang 'biahn'
	@tenhangid as nvarchar(50)
AS
BEGIN
	
	if exists(select * from hthanghoa where tenhang=@tenhangid )
begin
	select mahang from hthanghoa where tenhang=@tenhangid
end
else
begin
	select 0
end

END
GO
/****** Object:  StoredProcedure [dbo].[NH_Baocaotonkho]    Script Date: 06/01/2024 00:26:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_Baocaotonkho]
	
AS
BEGIN
	
	SELECT TOP 1000 [id]
      ,[mahang]
      ,[tenhang]
      ,[dvt]
	  ,'' as soluongdauky
	  ,'' as soluongnhap
	  ,'' as soluongxuat
      ,[soluongton]
      ,[anh]
      ,[gianhap]
      ,[giaban]
	  ,'0' as doanhso
	  ,'0' as giavon
	  ,'0' as laigop
	  ,'' sohd
      ,[nhomhangid]
      ,[userid]
      ,[created]
      ,[modified]
  FROM hthanghoa


END
GO
/****** Object:  StoredProcedure [dbo].[addthongtinhanghoa_PNH]    Script Date: 06/01/2024 00:26:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[addthongtinhanghoa_PNH]  --addthongtinhanghoa_PNH '', '0','0','NCC','13000','{"biahn,5000,5000":1,"biaken,8000,8000":1}'
	@thanhtoantien as nvarchar(50),
	@psno as nvarchar(20),
	@chietkhau as nvarchar(20), 
    @nhacungcap as nvarchar(20), 
	@tienhang as nvarchar(20), 
	@items as nvarchar(300),
	@listtoncuoiky as nvarchar(500)
AS
BEGIN
--check ban ghi dau tien
declare @countid int
declare @soHD as nvarchar(50)
declare @maxHD as nvarchar(10)
declare @tongtienthanhtoan  as float

--declare @NCC as int
--set @NCC =1

set 	@countid = (select count(ID) FROM htsonhaphang)
if (@countid > 0)
begin
	--select 1  -- co ban ghi roi
	--tao so hoadon
	set @maxHD = (select max(cast(substring(sohd,4,len(sohd)-3) as int))+1 from htsonhaphang)
	set @soHD = 'NH_'+@maxHD
	--set @tongtienthanhtoan = cast(@tienhang as float) - cast(@chietkhau as float)
	insert into htsonhaphang (sohd,idncc,items,tongtien,chietkhau,tongtienthanhtoan,psno,listtoncuoiky) values(@soHD,cast(@nhacungcap as int),@items,@tienhang,@chietkhau,cast(@thanhtoantien as float),cast(@psno as float),@listtoncuoiky)    

	--update cong no khach NCC
	if(@psno <> '0')
	begin
		--update cong no bang mater
		update htnhacungcap set congnodi=congnodi + cast(@psno as float) where id =cast(@nhacungcap as int)
	end

	select 1,@soHD
	

--select substring('NH_1',4,1) as abc

end
else
begin
	-- TRUONG HOP khong co ban ghi
	--select 0
	--tao so hoadon
	set @maxHD = '1'
	set @soHD = 'NH_'+@maxHD
	set @tongtienthanhtoan = cast(@tienhang as float) - cast(@chietkhau as float)
	--insert ban ghi
	insert into htsonhaphang (sohd,idncc,items,tongtien,chietkhau,tongtienthanhtoan,psno,listtoncuoiky) values(@soHD,cast(@nhacungcap as int),@items,@tienhang,@chietkhau,cast(@thanhtoantien as float),cast(@psno as float),@listtoncuoiky)
	--update kho  -> xu ly o code c#

	--update cong no khach NCC
	if(@psno <> '0')
	begin
		--update cong no bang mater
		update htnhacungcap set congnodi=congnodi + cast(@psno as float) where id =cast(@nhacungcap as int)
	end
	
	
	select 1,@soHD	

end
	
END
GO
/****** Object:  StoredProcedure [dbo].[NH_Get_NCC]    Script Date: 06/01/2024 00:26:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_Get_NCC]
	
AS
BEGIN
	select id,mancc from htnhacungcap
END
GO
/****** Object:  StoredProcedure [dbo].[NH_Phieuchi_Phieuthu]    Script Date: 06/01/2024 00:26:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_Phieuchi_Phieuthu]
	@guoinhan as nvarchar(50), 
	@nhacc as nvarchar(50), 
	@sotien as nvarchar(50), 
	@conoid as nvarchar(50), 
	@motaid as nvarchar(50), 
	@ngaychi as nvarchar(50), 
	@phuongthuc as nvarchar(50), 
	@nguoichitienid as nvarchar(50)
AS
BEGIN

declare @maxHD as nvarchar(10)
declare @sohd as nvarchar(50)

declare @checkbegin as int
set @checkbegin = (select COUNT (*) FROM htSoQuy where typeHD='0')


if (@checkbegin > 0)
begin
	set @maxHD = (select max(cast(substring(MaHD,4,len(MaHD)-3) as int))+1 from htSoQuy where typeHD='0')
	set @soHD = 'PC_'+@maxHD	

	insert into htSoQuy(typeHD,MaHD,IDketoan,IDnguoinhan,IDkhachhang,IDnhacungcap,psco,psno,Mota,ngaygiaodich,phuongthucTT,Createdate) 
	values('0',@soHD,@nguoichitienid,@guoinhan,'',@nhacc,'',@sotien,@motaid,@ngaychi,@phuongthuc,getdate())


	--update cong no
	
	update htnhacungcap set congnodi=congnodi + cast(@sotien as float) where id = cast(@nhacc as int)

  
	select 1,@soHD
end
else
begin
	--- truong hop chua co ban ghi nao
	set @maxHD = '1'
	set @soHD = 'PC_'+@maxHD	

	insert into htSoQuy(typeHD,MaHD,IDketoan,IDnguoinhan,IDkhachhang,IDnhacungcap,psco,psno,Mota,ngaygiaodich,phuongthucTT,Createdate) 
	values('0',@soHD,@nguoichitienid,@guoinhan,'',@nhacc,'',@sotien,@motaid,@ngaychi,@phuongthuc,getdate())

	--update cong no nha cung cap
	update htnhacungcap set congnodi=congnodi + cast(@sotien as float) where id = cast(@nhacc as int)
	select 1,@soHD

end




END
GO
/****** Object:  StoredProcedure [dbo].[NH_getcongno]    Script Date: 06/01/2024 00:26:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_getcongno]
	@idcongno as nvarchar(10),
	@type_cono as nvarchar(10)
AS
BEGIN
	
if(@type_cono = 'phieuchi')
begin
	select congnodi from htnhacungcap where id = cast(@idcongno as int)
end
else
begin
	select congnoden from htkhachhang where id = cast(@idcongno as int)
end
	

END
GO
/****** Object:  StoredProcedure [dbo].[NH_insert_nhacungcap]    Script Date: 06/01/2024 00:26:23 ******/
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
/****** Object:  StoredProcedure [dbo].[NH_danhmucnhacungcap]    Script Date: 06/01/2024 00:26:18 ******/
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
/****** Object:  StoredProcedure [dbo].[NH_thongtinthekho_NCC]    Script Date: 06/01/2024 00:26:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_thongtinthekho_NCC] -- NH_thongtinthekho_NCC '2','2024-03-24','2024-04-27'
	@makh as nvarchar(50), 
	@_fromdate as nvarchar(50), 
	@_todate as nvarchar(50)
AS
BEGIN

	select a.sohd as sohoadon,
	a.idncc as makh,
	(select tenncc from htnhacungcap b where b.id=a.idncc) as tenkh,
	a.tongtien as tongtien,
	a.psno as congnoden,	
	a.created as createddate
 from htsonhaphang a where a.idncc=@makh and a.psno<0 and convert(varchar,a.created,120) BETWEEN convert(varchar,@_fromdate,120) AND convert(varchar,@_todate,120)

	
	
END
GO
/****** Object:  StoredProcedure [dbo].[NH_BaocaocongnoNCC]    Script Date: 06/01/2024 00:26:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_BaocaocongnoNCC]
	
AS
BEGIN
	
select id,mancc as makh,tenncc as tenkh,congnodi as congnoden,'' sohoadon,createdate as createddate from htnhacungcap

END
GO
/****** Object:  StoredProcedure [dbo].[NH_Baocaocongno_theongay_NCC]    Script Date: 06/01/2024 00:26:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_Baocaocongno_theongay_NCC] --NH_Baocaocongno_theongay_NCC '2024-03-01','2024-05-14'
	@_fromdate as nvarchar(50),
	@_todate as nvarchar(50)
AS
BEGIN

	select a.id,
	a.idncc as makh,
	(select tenncc from htnhacungcap b where b.id=a.idncc) as tenkh,
	a.psno as congnoden,
	a.sohd as sohoadon,
	a.created as createddate
 from htsonhaphang a where a.psno<0 and convert(varchar,a.created,23) BETWEEN convert(varchar,@_fromdate,23) AND convert(varchar,@_todate,23)


END
GO
/****** Object:  StoredProcedure [dbo].[NH_Update_nhacungcap]    Script Date: 06/01/2024 00:26:29 ******/
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
/****** Object:  StoredProcedure [dbo].[NH_insert_DMnhacungcap]    Script Date: 06/01/2024 00:26:22 ******/
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
/****** Object:  StoredProcedure [dbo].[addthongtinhanghoa_PBH]    Script Date: 06/01/2024 00:26:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[addthongtinhanghoa_PBH]  --addthongtinhanghoa_PBH '','','', '0','0','NCC','13000','{"biahn,5000,5000":1,"biaken,8000,8000":1}'
	@suahoadon as nvarchar(5),
	@sohoadon as nvarchar(50),	
	@thanhtoantien as nvarchar(50),
	@psno as nvarchar(20),
	@chietkhau as nvarchar(20), 
    @nhacungcap as nvarchar(20), 
	@tienhang as nvarchar(20), 
	@items as nvarchar(300),
	@listtoncuoiky as nvarchar(300)
AS
BEGIN
--check ban ghi dau tien
declare @countid int
declare @soHD as nvarchar(50)
declare @maxHD as nvarchar(10)
declare @tongtienthanhtoan  as float

--declare @NCC as int
--set @NCC =1

set 	@countid = (select count(ID) FROM htsocai)
if (@countid > 0)
begin
	--select 1  -- co ban ghi roi
	--tao so hoadon
	set @maxHD = (select max(cast(substring(sohd,4,len(sohd)-3) as int))+1 from htsocai)
	set @soHD = 'BH_'+@maxHD
	--set @tongtienthanhtoan = cast(@tienhang as float) - cast(@chietkhau as float)
	--type =1 : nhahang,hotel,khachsan
	--type =2 : Phieu ban hang
	if(@suahoadon = '1')
	begin
		--update lai hoa don neu sua
		--back up ban ghi cu da sua
	insert into htsocai_BK(sohd,
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
		  ) select sohd,[type]
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
		  ,[idnhanvien] from htsocai where sohd=@sohoadon
			
		--update banghi moi
		update htsocai set idncc=cast(@nhacungcap as int),items=@items,tienhang=@tienhang,tongtien=@tienhang,chietkhau=@chietkhau,tiensauchietkhau=cast(@thanhtoantien as float),psco=cast(@psno as float),listtoncuoiky=@listtoncuoiky where sohd=@sohoadon

		--update cong no khach NCC
		if(@psno <> '0')
		begin
			--update cong no bang mater
			update htkhachhang set congnoden=congnoden + cast(@psno as float) where id =cast(@nhacungcap as int)
		end

		select 1, @sohoadon
	end
	else
	begin
		--truong hop khong sua hoa don
		insert into htsocai (sohd,idncc,items,tienhang,tongtien,chietkhau,tiensauchietkhau,psco,type,Flag,listtoncuoiky) values(@soHD,cast(@nhacungcap as int),@items,@tienhang,@tienhang,@chietkhau,cast(@thanhtoantien as float),cast(@psno as float),2,1,@listtoncuoiky)    

		--update cong no khach NCC
		if(@psno <> '0')
		begin
			--update cong no bang mater
			update htkhachhang set congnoden=congnoden + cast(@psno as float) where id =cast(@nhacungcap as int)
		end

		select 1, @soHD
	end
		
--select substring('NH_1',4,1) as abc

end
else
begin
	-- TRUONG HOP khong co ban ghi
	--select 0
	--tao so hoadon
	set @maxHD = '1'
	set @soHD = 'BH_'+@maxHD
	--set @tongtienthanhtoan = cast(@tienhang as float) - cast(@chietkhau as float)
	--insert ban ghi
	--type =1 : nhahang,hotel,khachsan
	--type =2 : Phieu ban hang
	insert into htsocai (sohd,idncc,items,tienhang,tongtien,chietkhau,tiensauchietkhau,psco,type,Flag,listtoncuoiky) values(@soHD,cast(@nhacungcap as int),@items,@tienhang,@tienhang,@chietkhau,cast(@thanhtoantien as float),cast(@psno as float),2,1,@listtoncuoiky)    
	--update kho  -> xu ly o code c#

	--update cong no khach NCC
	if(@psno <> '0')
	begin
		--update cong no bang mater
		update htkhachhang set congnoden=congnoden + cast(@psno as float) where id =cast(@nhacungcap as int)
	end
	
	
	select 1,@soHD

end
	
END
GO
/****** Object:  StoredProcedure [dbo].[NH_delete_phongban]    Script Date: 06/01/2024 00:26:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_delete_phongban]  --NH_delete_phongban 'Ban2','2012757'
	@nameitem as nvarchar(50),
	@userid as nvarchar(50)
AS
BEGIN
	--kiem tra user xoa co quyen addmin khong?
if exists(select * from TBL_USER2 where U_NAME=@userid and ROLE='admin')
begin
	if exists(select * from htsocai where tenphong=@nameitem and Flag=0)
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
      ,[idnhanvien] from htsocai where tenphong=@nameitem and Flag=0
		--thuc hien xoa ban ghi , thuc hien viec phan quen o day ( chi nhung usser nao moi duoc xoa????)
		delete htsocai where tenphong=@nameitem and Flag=0
		
		--update trang thai phong
		update htphong set trangthai=0 where tenphong=@nameitem and trangthai=1
		
		select 1
	end
	else
	begin
		select 0
	end
end
else
begin
	--user khong co quyen xoa ban / phong
	select 0
end


	
	

END
GO
/****** Object:  StoredProcedure [dbo].[NH_infor_thongtincongnoNCC]    Script Date: 06/01/2024 00:26:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_infor_thongtincongnoNCC]  --NH_infor_thongtincongnoNCC '7','2024-05-15','2024-05-15'
	@idhoadon as nvarchar(50),
	@_fromdate as nvarchar(50),
	@_todate as nvarchar(50)
AS
BEGIN

	if exists(select * from htsonhaphang where id=@idhoadon)
	begin
--print('asdfa')
			--select tenphong,giaphong,[items] from [Warehouse_BPS].[dbo].[htsocai] where tenphong=@tenphong
			--select [items],tienhang,giaphong from [Warehouse_BPS].[dbo].[htsocai] where tenphong=@tenphong and Flag='0'
			--select [items],tienhang,giaphong,ngaygiothue from [Warehouse_BPS].[dbo].[htsocai] where tenphong=@tenphong and Flag='0'
		select [items],tongtien,'' as giaphong,'' as ngaygiothue,'' as statusKaraoke,'' as giohat,
sohd as sohoadon,'' as hinhthucnghi,chietkhau,created from htsonhaphang
where id=@idhoadon and convert(varchar,created,23) BETWEEN convert(varchar,@_fromdate,23) AND convert(varchar,@_todate,23)
	end
	else
	begin
		select 0
	end



END
GO
/****** Object:  StoredProcedure [dbo].[NH_BaocaoNH_theongay]    Script Date: 06/01/2024 00:26:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_BaocaoNH_theongay]  -- NH_BaocaoNH_theongay '2024-04-24','2024-04-24'
	@_fromdate as nvarchar(50),
	@_todate as nvarchar(50)
AS
BEGIN
		SELECT TOP 1000 [id],[sohd],[idncc],[items],[tongtien],[chietkhau],[tongtienthanhtoan],[psco],[psno]
      --,[ghichu]
      --,[userid]
      ,[created]
      --,[modified]
  FROM htsonhaphang where convert(varchar,created,23) BETWEEN convert(varchar,@_fromdate,23) AND convert(varchar,@_todate,23)
--convert(varchar,created,23) BETWEEN convert(varchar,@_fromdate,23) AND convert(varchar,@_todate,23)
union

select '1000' as id, '-','-','Tong tien',
(select sum(tongtien) from htsonhaphang where convert(varchar,created,23) BETWEEN convert(varchar,@_fromdate,23) AND convert(varchar,@_todate,23)) as tongtien,
(select sum(chietkhau) from htsonhaphang where convert(varchar,created,23) BETWEEN convert(varchar,@_fromdate,23) AND convert(varchar,@_todate,23)) as chietkhau,
(select sum(tongtienthanhtoan) from htsonhaphang where convert(varchar,created,23) BETWEEN convert(varchar,@_fromdate,23) AND convert(varchar,@_todate,23)) as tongtienthanhtoan,
(select sum(psco) from htsonhaphang where convert(varchar,created,23) BETWEEN convert(varchar,@_fromdate,23) AND convert(varchar,@_todate,23)) as psco,
(select sum(psno) from htsonhaphang where convert(varchar,created,23) BETWEEN convert(varchar,@_fromdate,23) AND convert(varchar,@_todate,23)) as psno,
'' as created
from htsonhaphang


END
GO
/****** Object:  StoredProcedure [dbo].[NH_thongtinthekho]    Script Date: 06/01/2024 00:26:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_thongtinthekho] --NH_thongtinthekho '','2024-05-01','2024-05-27'
	@mahang as nvarchar(50),
	@fromdate as nvarchar(50),
	@todate as nvarchar(50)
AS
BEGIN
	
	select sohd,items,created,'xuathang' as typetk from htsocai 
where convert(varchar,created,23) BETWEEN convert(varchar,@fromdate,23) AND convert(varchar,@todate,23)

union

select sohd,items,created,'nhaphang' as typetk from htsonhaphang 
where convert(varchar,created,23) BETWEEN convert(varchar,@fromdate,23) AND convert(varchar,@todate,23)
union
SELECT cast(id as nvarchar(10)) as sohd,listtoncuoiky as items,created,'candoitk' as typetk from htcandoihangton 
where convert(varchar,created,23) BETWEEN convert(varchar,@fromdate,23) AND convert(varchar,@todate,23)



END
GO
/****** Object:  StoredProcedure [dbo].[NH_BaocaoNH]    Script Date: 06/01/2024 00:26:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_BaocaoNH]
	
AS
BEGIN
	SELECT TOP 1000 [id],[sohd],[idncc],[items],[tongtien],[chietkhau],[tongtienthanhtoan],[psco],[psno]
      --,[ghichu]
      --,[userid]
      ,[created]
      --,[modified]
  FROM htsonhaphang where convert(varchar, created, 23) = convert(varchar, getdate(), 23)

union

select '1000' as id, 'Total','-','-',
(select sum(tongtien) from htsonhaphang where convert(varchar, created, 23) = convert(varchar, getdate(), 23)) as tongtien,
(select sum(chietkhau) from htsonhaphang where convert(varchar, created, 23) = convert(varchar, getdate(), 23)) as chietkhau,
(select sum(tongtienthanhtoan) from htsonhaphang where convert(varchar, created, 23) = convert(varchar, getdate(), 23)) as tongtienthanhtoan,
(select sum(psco) from htsonhaphang where convert(varchar, created, 23) = convert(varchar, getdate(), 23)) as psco,
(select sum(psno) from htsonhaphang where convert(varchar, created, 23) = convert(varchar, getdate(), 23)) as psno,
'' as created
from htsonhaphang where convert(varchar, created, 23) = convert(varchar, getdate(), 23)



END
GO
/****** Object:  StoredProcedure [dbo].[NH_thongtinthekho_NH]    Script Date: 06/01/2024 00:26:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[NH_thongtinthekho_NH] --NH_thongtinthekho_NH '','2024-05-04','2024-05-04'
	@mahang as nvarchar(50),
	@fromdate as nvarchar(50),
	@todate as nvarchar(50)
AS
BEGIN

select sohd,items,created,'nhaphang' as typetk from htsonhaphang 
where convert(varchar,created,23) BETWEEN convert(varchar,@fromdate,23) AND convert(varchar,@todate,23)




END
GO
/****** Object:  StoredProcedure [dbo].[NH_BC_tonghopNH]    Script Date: 06/01/2024 00:26:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_BC_tonghopNH]
	
AS
BEGIN
	
select items from htsonhaphang where convert(varchar, created, 23) = convert(varchar, getdate(), 23)

END
GO
/****** Object:  StoredProcedure [dbo].[NH_BC_tonghopNH_theongay]    Script Date: 06/01/2024 00:26:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[NH_BC_tonghopNH_theongay] 
	@fromdate as nvarchar(50),
	@todate as nvarchar(50)
AS
BEGIN

select items from htsonhaphang where convert(varchar,created,23) BETWEEN convert(varchar,@fromdate,23) AND convert(varchar,@todate,23)


END
GO
/****** Object:  StoredProcedure [dbo].[NH_getsohoadon_NH]    Script Date: 06/01/2024 00:26:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_getsohoadon_NH]
	
AS
BEGIN
	declare @sohoadon as nvarchar(10)
	declare @checkbegin as int

	set @checkbegin = (select count(sohd) FROM htsonhaphang)

	if (@checkbegin > 0)
	begin		
		--set @sohoadon = (select count(ID) as countid  from [Warehouse_BPS].[dbo].[htsocai] where Flag=1 )
	    set @sohoadon = (select top 1 sohd FROM htsonhaphang order by id desc)
		select @sohoadon
	end
	else
	begin
		--set @sohoadon = 0
		select 0
	end

END
GO
/****** Object:  StoredProcedure [dbo].[NH_infor_thongtinhanghoa2_NH]    Script Date: 06/01/2024 00:26:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_infor_thongtinhanghoa2_NH]  --NH_infor_thongtinhanghoa2_NH 'NH_15'
	@idhoadon as nvarchar(50)
AS
BEGIN
	declare @sohoadon_new as nvarchar(50)
	declare @maxHD as nvarchar(10)
	set @maxHD = (select max(cast(substring(@idhoadon,4,len(@idhoadon)-3) as int))+1 )
	set @sohoadon_new = 'NH_'+@maxHD

	if exists(select * from htsonhaphang where sohd=@sohoadon_new)
	begin
			--select tenphong,giaphong,[items] from [Warehouse_BPS].[dbo].[htsocai] where tenphong=@tenphong
			--select [items],tienhang,giaphong from [Warehouse_BPS].[dbo].[htsocai] where tenphong=@tenphong and Flag='0'
			--select [items],tienhang,giaphong,ngaygiothue from [Warehouse_BPS].[dbo].[htsocai] where tenphong=@tenphong and Flag='0'
		select [items],tongtien as tienhang,'' as giaphong,'' as ngaygiothue,'' as statusKaraoke,'' as giohat,sohd as sohoadon,'' as hinhthucnghi,chietkhau,tongtienthanhtoan as tiensauchietkhau,psno as psco,created from htsonhaphang where sohd=@sohoadon_new
	end
	else
	begin
		select 0
	end



END
GO
/****** Object:  StoredProcedure [dbo].[NH_infor_thongtinhanghoa2_inlai_NH]    Script Date: 06/01/2024 00:26:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[NH_infor_thongtinhanghoa2_inlai_NH]  --NH_infor_thongtinhanghoa2_inlai_NH 'NH_15'
	@idhoadon as nvarchar(50)
AS
BEGIN
--	declare @sohoadon_new as nvarchar(50)
--	declare @maxHD as nvarchar(10)
--	set @maxHD = (select max(cast(substring(@idhoadon,4,len(@idhoadon)-3) as int))+1 )
--	set @sohoadon_new = 'BH_'+@maxHD

	if exists(select * from htsonhaphang where sohd=@idhoadon)
	begin
			--select tenphong,giaphong,[items] from [Warehouse_BPS].[dbo].[htsocai] where tenphong=@tenphong
			--select [items],tienhang,giaphong from [Warehouse_BPS].[dbo].[htsocai] where tenphong=@tenphong and Flag='0'
			--select [items],tienhang,giaphong,ngaygiothue from [Warehouse_BPS].[dbo].[htsocai] where tenphong=@tenphong and Flag='0'
		select [items],tongtien as tienhang,'' as giaphong,'' as ngaygiothue,'' as statusKaraoke,'' as giohat,sohd as sohoadon,'' as hinhthucnghi,chietkhau,tongtienthanhtoan as tiensauchietkhau,psno as psco,created from htsonhaphang where sohd=@idhoadon
	end
	else
	begin
		select 0
	end



END
GO
/****** Object:  StoredProcedure [dbo].[NH_thongtinthekho2]    Script Date: 06/01/2024 00:26:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_thongtinthekho2] --NH_thongtinthekho2 '2024-05-26','2024-05-26'	
	@fromdate as nvarchar(50),
	@todate as nvarchar(50)
AS
BEGIN
	
select * from (
	select sohd,listtoncuoiky,created,'xuathang' as typetk from htsocai 
where convert(varchar,created,23) < convert(varchar,@fromdate,23) and listtoncuoiky is not null
union
select sohd,listtoncuoiky,created,'nhaphang' as typetk from htsonhaphang 
where convert(varchar,created,23) < convert(varchar,@fromdate,23) and listtoncuoiky is not null
union --phieu can doi ton kho
SELECT cast(id as nvarchar(10)) as sohd,listtoncuoiky,created,'candoitk' as typetk from htcandoihangton 
where convert(varchar,created,23) < convert(varchar,@fromdate,23) and listtoncuoiky is not null     

) abc order by created desc


--select convert(varchar,getdate(),23)

END
GO
/****** Object:  StoredProcedure [dbo].[NH_save_thongtinhanghoa]    Script Date: 06/01/2024 00:26:25 ******/
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
/****** Object:  StoredProcedure [dbo].[NH_BaocaoBH_NV]    Script Date: 06/01/2024 00:26:15 ******/
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
/****** Object:  StoredProcedure [dbo].[NH_BaocaoBH_theongay_NV]    Script Date: 06/01/2024 00:26:16 ******/
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
/****** Object:  StoredProcedure [dbo].[NH_getsohoadon_BH]    Script Date: 06/01/2024 00:26:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_getsohoadon_BH]
	
AS
BEGIN
	declare @sohoadon as nvarchar(10)
	if exists(select sohd  FROM htsocai where Flag='1')
	begin		
		--set @sohoadon = (select count(ID) as countid  from [Warehouse_BPS].[dbo].[htsocai] where Flag=1 )
	    set @sohoadon = (select top 1 sohd FROM htsocai where Flag =1 order by id desc)
		select @sohoadon
	end
	else
	begin
		--set @sohoadon = 0
		select 0
	end

END
GO
/****** Object:  StoredProcedure [dbo].[NH_thongtinthekho_BH]    Script Date: 06/01/2024 00:26:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[NH_thongtinthekho_BH] --NH_thongtinthekho_BH '','2024-05-04','2024-05-04'
	@mahang as nvarchar(50),
	@fromdate as nvarchar(50),
	@todate as nvarchar(50)
AS
BEGIN
	
	select sohd,items,created,'xuathang' as typetk from htsocai 
where convert(varchar,created,23) BETWEEN convert(varchar,@fromdate,23) AND convert(varchar,@todate,23)




END
GO
/****** Object:  StoredProcedure [dbo].[NH_BC_tonghopBH_theongay]    Script Date: 06/01/2024 00:26:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[NH_BC_tonghopBH_theongay] 
	@fromdate as nvarchar(50),
	@todate as nvarchar(50)
AS
BEGIN

select items from htsocai where convert(varchar,created,23) BETWEEN convert(varchar,@fromdate,23) AND convert(varchar,@todate,23)


END
GO
/****** Object:  StoredProcedure [dbo].[NH_BC_tonghopBH]    Script Date: 06/01/2024 00:26:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_BC_tonghopBH] 
	
AS
BEGIN

select items from htsocai where convert(varchar, created, 23) = convert(varchar, getdate(), 23)


END
GO
/****** Object:  StoredProcedure [dbo].[NH_Baocaothuchi_theongay]    Script Date: 06/01/2024 00:26:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_Baocaothuchi_theongay] --NH_Baocaothuchi_theongay '2024-05-04','2024-05-04'
	@tungay as nvarchar(50),
	@denngay as nvarchar(50)

AS
BEGIN
	
declare @tongthutheongay as nvarchar(50)
declare @tongchitheongay as nvarchar(50)
declare @doanhsobanhang as nvarchar(50)


if exists(select psco as tongthu from htSoQuy where typeHD=1 and convert(varchar,Createdate,23) BETWEEN convert(varchar,@tungay,23) AND convert(varchar,@denngay,23))
begin
	set @tongthutheongay = (select sum(psco) as tongthu from htSoQuy where typeHD=1 and convert(varchar,Createdate,23) BETWEEN convert(varchar,@tungay,23) AND convert(varchar,@denngay,23))
end
else
begin
	set @tongthutheongay = '0'
end

if exists(select psno as tongthu from htSoQuy where typeHD=0 and convert(varchar,Createdate,23) BETWEEN convert(varchar,@tungay,23) AND convert(varchar,@denngay,23))
begin
	set @tongchitheongay = (select sum(psno) as tongthu from htSoQuy where typeHD=0 and convert(varchar,Createdate,23) BETWEEN convert(varchar,@tungay,23) AND convert(varchar,@denngay,23))
end
else
begin
	set @tongchitheongay = '0'
end


--set @tongthutheongay = (select sum(psco) as tongthu from htSoQuy where typeHD=1 and convert(varchar,Createdate,23) BETWEEN convert(varchar,@tungay,23) AND convert(varchar,@denngay,23))
--set @tongchitheongay = (select sum(psno) as tongchi from htSoQuy where typeHD=0 and convert(varchar,Createdate,23) BETWEEN convert(varchar,@tungay,23) AND convert(varchar,@denngay,23))
set @doanhsobanhang = (select cast(sum(tiensauchietkhau) as bigint) as doanhthu from htsocai where convert(varchar,created,23) BETWEEN convert(varchar,@tungay,23) AND convert(varchar,@denngay,23))


print(@tongthutheongay)
print(@tongchitheongay)
print(@doanhsobanhang)

select @tongthutheongay as tongthu,@tongchitheongay as tongchi, @doanhsobanhang as tongdoanhso

END
GO
/****** Object:  StoredProcedure [dbo].[NH_infor_thongtincongnoKH]    Script Date: 06/01/2024 00:26:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_infor_thongtincongnoKH]  --NH_infor_thongtincongnoKH '39','2024-05-01','2024-05-17'
	@idhoadon as nvarchar(50),
	@_fromdate as nvarchar(50),
	@_todate as nvarchar(50)
AS
BEGIN

declare @checkaraoke  as nvarchar(10)
declare @giohatkaraoke  as float
declare @sohoadon as nvarchar(10)

set @sohoadon = (select top 1 ID from htsocai where Flag=1 order by ID desc)

if exists(select karaoke from htphong where karaoke=1 and id=@idhoadon)
begin
	set @checkaraoke = 'Karaoke'
	set @giohatkaraoke = (select tiengiohat from htphong where  id=@idhoadon)
end
else if exists(select nhanghi from htphong where karaoke=0 and nhanghi=1 and id=@idhoadon)
begin
	set @checkaraoke = 'hotel'
	set @giohatkaraoke = 0
end
else
begin
	set @checkaraoke = 'Nhahang'
	set @giohatkaraoke = 0
end

	if exists(select * from htsocai where id=@idhoadon and Flag='1')
	begin
--print('asdfa')
			--select tenphong,giaphong,[items] from [Warehouse_BPS].[dbo].[htsocai] where tenphong=@tenphong
			--select [items],tienhang,giaphong from [Warehouse_BPS].[dbo].[htsocai] where tenphong=@tenphong and Flag='0'
			--select [items],tienhang,giaphong,ngaygiothue from [Warehouse_BPS].[dbo].[htsocai] where tenphong=@tenphong and Flag='0'
		select [items],tienhang,giaphong,CONVERT(varchar,ngaygiothue,22) as ngaygiothue,@checkaraoke as statusKaraoke,@giohatkaraoke as giohat,
@sohoadon as sohoadon,hinhthucnghi,sohd as sohoadon2,chietkhau,created from htsocai
where id=@idhoadon and Flag='1' and convert(varchar, created, 23) BETWEEN convert(varchar,@_fromdate,23) AND convert(varchar,@_todate,23)
	end
	else
	begin
		select 0
	end



END
GO
/****** Object:  StoredProcedure [dbo].[NH_infor_thongtinhanghoa]    Script Date: 06/01/2024 00:26:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_infor_thongtinhanghoa]  --NH_infor_thongtinhanghoa 'Ban6'
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

set @sohoadon = (select top 1 ID from htsocai where Flag=1 order by ID desc)

if exists(select karaoke from htphong where karaoke=1 and tenphong=@tenphong)
begin
	set @checkaraoke = 'Karaoke'
	set @giohatkaraoke = (select tiengiohat from htphong where  tenphong=@tenphong)
	set @nghigio = 0
	set @nghidem = 0
	set @nghingay = 0
	set @nghithang = 0
	set @tienphutroi =0
	set @tienphutroiphut =0
	set @timephutroi =0
end
else if exists(select nhanghi from htphong where karaoke=0 and nhanghi=1 and tenphong=@tenphong)
begin
	set @checkaraoke = 'hotel'
	set @giohatkaraoke = 0
	set @nghigio = (select tiengionghi from htphong where karaoke=0 and nhanghi=1 and tenphong=@tenphong)	
	set @nghidem = (select tiennghidem from htphong where karaoke=0 and nhanghi=1 and tenphong=@tenphong)
	set @nghingay = (select tiennghingay from htphong where karaoke=0 and nhanghi=1 and tenphong=@tenphong)
	set @nghithang = (select tiennghithang from htphong where karaoke=0 and nhanghi=1 and tenphong=@tenphong)
	set @tienphutroi = (select giophutroi from htphong where karaoke=0 and nhanghi=1 and tenphong=@tenphong)
	set @tienphutroiphut = (select giophutroitheophut from htphong where karaoke=0 and nhanghi=1 and tenphong=@tenphong)
	set @timephutroi =(select timephutroi from htphong where karaoke=0 and nhanghi=1 and tenphong=@tenphong)
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

	if exists(select * from htsocai where tenphong=@tenphong and Flag='0')
	begin
			--select tenphong,giaphong,[items] from [Warehouse_BPS].[dbo].[htsocai] where tenphong=@tenphong
			--select [items],tienhang,giaphong from [Warehouse_BPS].[dbo].[htsocai] where tenphong=@tenphong and Flag='0'
			--select [items],tienhang,giaphong,ngaygiothue from [Warehouse_BPS].[dbo].[htsocai] where tenphong=@tenphong and Flag='0'
		select [items],tienhang,giaphong,CONVERT(varchar,ngaygiothue,22) as ngaygiothue,@checkaraoke as statusKaraoke,@giohatkaraoke as giohat,sohd as sohoadon,hinhthucnghi,@nghigio,@nghidem,@nghingay,@nghithang,@tienphutroi,@tienphutroiphut,@timephutroi,convert(varchar, created, 23) as ngaytao from htsocai where tenphong=@tenphong and Flag='0'
	end
	else
	begin
		select 0
	end



END
GO
/****** Object:  StoredProcedure [dbo].[NH_Move_phongban]    Script Date: 06/01/2024 00:26:24 ******/
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
	if exists(select * from htphong where tenphong=@newroom and trangthai=0)
	begin		
		--update date bang socai
		update htsocai set tenphong=@newroom  where tenphong=@nameitem and Flag=0

		--update bang mater
		update htphong set trangthai=0 where tenphong=@nameitem and trangthai=1
		update htphong set trangthai=1 where tenphong=@newroom and trangthai=0

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
/****** Object:  StoredProcedure [dbo].[NH_infor_thongtinhanghoa_inlai]    Script Date: 06/01/2024 00:26:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_infor_thongtinhanghoa_inlai]  --NH_infor_thongtinhanghoa_inlai 'BH_113'
	@sohoadon as nvarchar(50)
AS
BEGIN

declare @checkaraoke  as nvarchar(10)
declare @giohatkaraoke  as float
declare @sohoadon1 as nvarchar(10)

declare @tenphong as nvarchar(10)

set @tenphong = (select tenphong FROM htsocai where sohd=@sohoadon)

--set @sohoadon = (select top(1) ID from [Warehouse_BPS].[dbo].[htsocai] where Flag=1 order by ID desc)
set @sohoadon1 = (select top 1 sohd FROM htsocai where Flag =1 order by id desc)

if exists(select karaoke from htphong where karaoke=1 and tenphong=@tenphong)
begin
	set @checkaraoke = 'Karaoke'
	--set @giohatkaraoke = (select tiengiohat from [Warehouse_BPS].[dbo].[htphong] where  tenphong=@tenphong)
	set @giohatkaraoke = (select tiengiohat from htphong where  tenphong=@tenphong)
end
else if exists(select nhanghi from htphong where karaoke=0 and nhanghi=1 and tenphong=@tenphong)
begin
	set @checkaraoke = 'hotel'
	set @giohatkaraoke = 0
end
else
begin
	set @checkaraoke = 'Nhahang'
	set @giohatkaraoke = 0
end

	if exists(select * from htsocai where sohd=@sohoadon )   -- truong hop in lai hoa don   --tenphong=@tenphong and Flag='1'
	begin			
			select [items],tienhang,giaphong,CONVERT(varchar,ngaygiothue,22) as ngaygiothue,@checkaraoke as statusKaraoke,tiengiohat as giohat,sohd as sohoadon,ngaygiora,tenphong,convert(varchar, created, 23)as ngaytao,tiensauchietkhau,psco from htsocai where sohd=@sohoadon
	end
	else
	begin
		select 0
	end



END
GO
/****** Object:  StoredProcedure [dbo].[NH_gop_phongban1]    Script Date: 06/01/2024 00:26:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_gop_phongban1]
	@nameitem as nvarchar(50)
AS
BEGIN
	select items from htsocai where tenphong=@nameitem and Flag=0
END
GO
/****** Object:  StoredProcedure [dbo].[NH_gop_phongban2]    Script Date: 06/01/2024 00:26:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_gop_phongban2]
	@newroom as nvarchar(50)
AS
BEGIN
	select items from htsocai where tenphong=@newroom and Flag=0
END
GO
/****** Object:  StoredProcedure [dbo].[NH_Xemlaihoadon2]    Script Date: 06/01/2024 00:26:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_Xemlaihoadon2]
	@idhoadon as nvarchar(50)
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

--set @checkaraoke = 'Nhahang'
set @checkaraoke = 'Banhang'
	set @giohatkaraoke = 0
	set @nghigio = 0	
	set @nghidem = 0
	set @nghingay = 0
	set @nghithang = 0
	set @tienphutroi = 0
	set @tienphutroiphut =0
	set @timephutroi =0


	--hoa don da duoc thanh toan roi, o dang nha hang <> khong phai ban hang
if exists(select * from htsocai where sohd=@idhoadon and Flag='1' and type='2')
	begin			
		select [items],tienhang,giaphong,CONVERT(varchar,ngaygiothue,22) as ngaygiothue,@checkaraoke as statusKaraoke,@giohatkaraoke as giohat,sohd as sohoadon,hinhthucnghi,@nghigio,@nghidem,@nghingay,@nghithang,@tienphutroi,@tienphutroiphut,@timephutroi,convert(varchar, created, 23) as ngaytao,chietkhau,tiensauchietkhau,psco from htsocai where sohd=@idhoadon and Flag='1' and type='2'
	end
	else
	begin
		select 0
	end

END
GO
/****** Object:  StoredProcedure [dbo].[NH_Baocaotonkho_lolai2]    Script Date: 06/01/2024 00:26:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_Baocaotonkho_lolai2] --NH_Baocaotonkho_lolai2 '2024-05-04','2024-05-04'
	@fromdate as nvarchar(50),
	@todate as nvarchar(50)
AS
BEGIN
	
	select items,sohd from htsocai 
where convert(varchar,created,23) BETWEEN CONVERT(varchar,@fromdate,23) AND CONVERT(varchar,@todate,23)


END
GO
/****** Object:  StoredProcedure [dbo].[NH_infor_thongtinhanghoa2_inlai]    Script Date: 06/01/2024 00:26:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_infor_thongtinhanghoa2_inlai]  --NH_infor_thongtinhanghoa2_inlai 'BH_74'
	@idhoadon as nvarchar(50)
AS
BEGIN
--	declare @sohoadon_new as nvarchar(50)
--	declare @maxHD as nvarchar(10)
--	set @maxHD = (select max(cast(substring(@idhoadon,4,len(@idhoadon)-3) as int))+1 )
--	set @sohoadon_new = 'BH_'+@maxHD

	if exists(select * from htsocai where sohd=@idhoadon)
	begin
			--select tenphong,giaphong,[items] from [Warehouse_BPS].[dbo].[htsocai] where tenphong=@tenphong
			--select [items],tienhang,giaphong from [Warehouse_BPS].[dbo].[htsocai] where tenphong=@tenphong and Flag='0'
			--select [items],tienhang,giaphong,ngaygiothue from [Warehouse_BPS].[dbo].[htsocai] where tenphong=@tenphong and Flag='0'
		select [items],tienhang,giaphong,CONVERT(varchar,ngaygiothue,22) as ngaygiothue,'' as statusKaraoke,'' as giohat,sohd as sohoadon,hinhthucnghi,chietkhau,tiensauchietkhau,psco,created from htsocai where sohd=@idhoadon
	end
	else
	begin
		select 0
	end



END
GO
/****** Object:  StoredProcedure [dbo].[NH_infor_thongtinhanghoa2]    Script Date: 06/01/2024 00:26:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_infor_thongtinhanghoa2]  --NH_infor_thongtinhanghoa2 'BH_74'
	@idhoadon as nvarchar(50)
AS
BEGIN
	declare @sohoadon_new as nvarchar(50)
	declare @maxHD as nvarchar(10)
	set @maxHD = (select max(cast(substring(@idhoadon,4,len(@idhoadon)-3) as int))+1 )
	set @sohoadon_new = 'BH_'+@maxHD

	if exists(select * from htsocai where sohd=@sohoadon_new)
	begin
			--select tenphong,giaphong,[items] from [Warehouse_BPS].[dbo].[htsocai] where tenphong=@tenphong
			--select [items],tienhang,giaphong from [Warehouse_BPS].[dbo].[htsocai] where tenphong=@tenphong and Flag='0'
			--select [items],tienhang,giaphong,ngaygiothue from [Warehouse_BPS].[dbo].[htsocai] where tenphong=@tenphong and Flag='0'
		select [items],tienhang,giaphong,CONVERT(varchar,ngaygiothue,22) as ngaygiothue,'' as statusKaraoke,'' as giohat,sohd as sohoadon,hinhthucnghi,chietkhau,tiensauchietkhau,psco,created from htsocai where sohd=@sohoadon_new
	end
	else
	begin
		select 0
	end



END
GO
/****** Object:  StoredProcedure [dbo].[NH_Xemlaihoadon]    Script Date: 06/01/2024 00:26:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_Xemlaihoadon]
	@idhoadon as nvarchar(50)
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

set @checkaraoke = 'Nhahang'
	set @giohatkaraoke = 0
	set @nghigio = 0	
	set @nghidem = 0
	set @nghingay = 0
	set @nghithang = 0
	set @tienphutroi = 0
	set @tienphutroiphut =0
	set @timephutroi =0


	--hoa don da duoc thanh toan roi, o dang nha hang <> khong phai ban hang
if exists(select * from htsocai where sohd=@idhoadon and Flag='1' and type='1')
	begin			
		select [items],tienhang,giaphong,CONVERT(varchar,ngaygiothue,22) as ngaygiothue,@checkaraoke as statusKaraoke,@giohatkaraoke as giohat,sohd as sohoadon,hinhthucnghi,@nghigio,@nghidem,@nghingay,@nghithang,@tienphutroi,@tienphutroiphut,@timephutroi,convert(varchar, created, 23) as ngaytao,chietkhau,tiensauchietkhau,psco from htsocai where sohd=@idhoadon and Flag='1' and type='1'
	end
	else
	begin
		select 0
	end

END
GO
/****** Object:  StoredProcedure [dbo].[NH_BaocaoBH]    Script Date: 06/01/2024 00:26:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_BaocaoBH]
	
AS
BEGIN

select * from 
(
select id,sohd,type,ngaygiothue,ngaygiora,tongthoigianthue,tenphong,
tienphong,tiengiohat,items,tienhang,tongtien,chietkhau,tiensauchietkhau,hinhthucnghi,mohinh,created,idnhanvien,psco,CONVERT(VARCHAR(5),ngaygiothue,108) as giovao,CONVERT(VARCHAR(5),ngaygiora,108) as giora from htsocai where convert(varchar, created, 23) = convert(varchar, getdate(), 23)

union 

select '' as id,'-','-','','','','Tong tien',
(select sum(tienphong) from htsocai where convert(varchar, created, 23) = convert(varchar, getdate(), 23)) as tienphong,
(select sum(tiengiohat) from htsocai where convert(varchar, created, 23) = convert(varchar, getdate(), 23)) as tiengiohat,
'' as items,
(select sum(tienhang) from htsocai where convert(varchar, created, 23) = convert(varchar, getdate(), 23)) as tienhang,
(select sum(tongtien) from htsocai where convert(varchar, created, 23) = convert(varchar, getdate(), 23)) as tongtien,
(select sum(chietkhau) from htsocai where convert(varchar, created, 23) = convert(varchar, getdate(), 23)) as chietkhau,
(select sum(tiensauchietkhau) from htsocai where convert(varchar, created, 23) = convert(varchar, getdate(), 23))as tiensauchietkhau,
'' as hinhthucnghi,
'' as mohinh,
GETDATE() as created,
'' as idnhanvien,
'' as psco,
'' as giovao,
'' as giora
from htsocai where convert(varchar, created, 23) = convert(varchar, getdate(), 23)
) ABC order by created asc





END
GO
/****** Object:  StoredProcedure [dbo].[NH_BaocaoBH_theongay]    Script Date: 06/01/2024 00:26:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_BaocaoBH_theongay] -- NH_BaocaoBH_theongay '2024-05-02','2024-05-02'
	@_fromdate as nvarchar(50),
	@_todate as nvarchar(50)
AS
BEGIN

select id,sohd,type,ngaygiothue,ngaygiora,tongthoigianthue,tenphong,
tienphong,tiengiohat,items,tienhang,tongtien,chietkhau,tiensauchietkhau,hinhthucnghi,mohinh,created,idnhanvien,psco,CONVERT(VARCHAR(5),ngaygiothue,108) as giovao,CONVERT(VARCHAR(5),ngaygiora,108)as giora from htsocai 
where convert(varchar,created,23) BETWEEN convert(varchar,@_fromdate,23) AND convert(varchar,@_todate,23)
--convert(varchar,created,23) BETWEEN convert(varchar,@_fromdate,23) AND convert(varchar,@_todate,23)
union 

select '1000' as id,'-','-','','','','Tong tien',
(select sum(tienphong) from htsocai where convert(varchar,created,23) BETWEEN convert(varchar,@_fromdate,23) AND convert(varchar,@_todate,23)) as tienphong,
(select sum(tiengiohat) from htsocai where convert(varchar,created,23) BETWEEN convert(varchar,@_fromdate,23) AND convert(varchar,@_todate,23)) as tiengiohat,
'' as items,
(select sum(tienhang) from htsocai where convert(varchar,created,23) BETWEEN convert(varchar,@_fromdate,23) AND convert(varchar,@_todate,23)) as tienhang,
(select sum(tongtien) from htsocai where convert(varchar,created,23) BETWEEN convert(varchar,@_fromdate,23) AND convert(varchar,@_todate,23)) as tongtien,
(select sum(chietkhau) from htsocai where convert(varchar,created,23) BETWEEN convert(varchar,@_fromdate,23) AND convert(varchar,@_todate,23)) as chietkhau,
(select sum(tiensauchietkhau) from htsocai where convert(varchar,created,23) BETWEEN convert(varchar,@_fromdate,23) AND convert(varchar,@_todate,23))as tiensauchietkhau,
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
/****** Object:  StoredProcedure [dbo].[NH_save_khthanhtoan]    Script Date: 06/01/2024 00:26:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_save_khthanhtoan]  -- NH_save_khthanhtoan '2','P05','45000','0','0','0','-45000','0','{"biahn,20000,20000":1,"biaken,25000,25000":1}',''
	@idkhachhang as nvarchar(10),
	@tenphong as nvarchar(50), 	 
	@tongtienhang as nvarchar(50),
	@tongtienhat as nvarchar(50),
	@tongtienphong as nvarchar(50),
	@psco as nvarchar(50),
	@tienno as nvarchar(50),
	@tienck as nvarchar(50),
	@items as nvarchar(500),
	@listtoncuoiky as nvarchar(500)
AS
BEGIN
	
	declare @sohd as nvarchar(50)

	--set @sohd = (select id  FROM htsocai where tenphong=@tenphong and Flag='0')
	set @sohd = (select sohd  FROM htsocai where tenphong=@tenphong and Flag='0')


	if exists(select * FROM htsocai where tenphong=@tenphong and Flag='0')
	begin
		--update trang thai thanh toan
		update htsocai set Flag='1',items=@items,tienhang=@tongtienhang,tongtien=@psco,psno=@tienno,tiengiohat=@tongtienhat,tienphong=@tongtienphong,tiensauchietkhau=@psco,ngaygiora=GETDATE(),idncc=cast(@idkhachhang as int),chietkhau=@tienck,listtoncuoiky=@listtoncuoiky where sohd=@sohd

		--update trang thai bang mater khi thanh toan xong  trangthai='0'  (khong co khach)
		update htphong set trangthai='0' where tenphong=@tenphong

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
/****** Object:  StoredProcedure [dbo].[NH_gop_phongban]    Script Date: 06/01/2024 00:26:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_gop_phongban] --NH_gop_phongban 'Ban1','Ban6'
	@nameitem as nvarchar(50),
	@newroom as nvarchar(50),
@chuoighep as nvarchar(500)
AS
BEGIN	

BEGIN TRANSACTION;

--lay ra tong tien hang
declare @tienhang1 as nvarchar(50)
declare @tienhang2 as nvarchar(50)
declare @tongtienhangnew as nvarchar(50)

--lay ra danh sach hang hoa 2 phong

set @tienhang1 = (select tienhang from htsocai where tenphong=@nameitem and Flag=0)
set @tienhang2 = (select tienhang from htsocai where tenphong=@newroom and Flag=0)
set @tongtienhangnew = cast((cast(@tienhang1 as int) + cast(@tienhang2 as int)) as nvarchar(50))
print @tongtienhangnew

--1. update ban can gop: tinh tong tien, tong hang hoa
update htsocai set tienhang=@tongtienhangnew,items=@chuoighep  where tenphong=@nameitem and Flag=0

--2. update ban gop 2  = 0
update htsocai set Flag=1,tienhang=0,items='{}'  where tenphong=@newroom and Flag=0

--3. update trang thai ban o bang mater
update htphong set trangthai=0 where tenphong=@newroom and trangthai=1


-- Nếu có lỗi xảy ra, ta sẽ hủy bỏ giao dịch
IF @@ERROR <> 0
BEGIN
    ROLLBACK TRANSACTION;
	select 0
    PRINT 'Giao dịch đã bị hủy bỏ.';
END
ELSE
BEGIN
    COMMIT TRANSACTION;
	select 1
    PRINT 'Giao dịch đã được thực hiện thành công.';
END


END
GO
/****** Object:  StoredProcedure [dbo].[NH_thongtinthekho_KH]    Script Date: 06/01/2024 00:26:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_thongtinthekho_KH] -- NH_thongtinthekho_KH '1','2024-03-24','2024-04-24'
	@makh as nvarchar(50), 
	@_fromdate as nvarchar(50), 
	@_todate as nvarchar(50)
AS
BEGIN

	select a.sohd as sohoadon,
	a.idncc as makh,
	(select tenkh from htkhachhang b where b.id=a.idncc) as tenkh,
	a.tongtien as tongtien,
	a.psco as congnoden,	
	a.created as createddate
 from htsocai a where a.idncc=@makh and a.psco<0 and convert(varchar,a.created,120) BETWEEN convert(varchar,@_fromdate,120) AND convert(varchar,@_todate,120)

	
END
GO
/****** Object:  StoredProcedure [dbo].[NH_Baocaocongno_theongay]    Script Date: 06/01/2024 00:26:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_Baocaocongno_theongay] --NH_Baocaocongno_theongay '2024-03-01','2024-05-14'
	@_fromdate as nvarchar(50),
	@_todate as nvarchar(50)
AS
BEGIN

	select a.id,
	a.idncc as makh,
	(select tenkh from htkhachhang b where b.id=a.idncc) as tenkh,
	a.psco as congnoden,
	a.sohd as sohoadon,
	a.created as createddate
 from htsocai a where a.psco<0 and convert(varchar,a.created,23) BETWEEN convert(varchar,@_fromdate,23) AND convert(varchar,@_todate,23)


END
GO
/****** Object:  StoredProcedure [dbo].[NH_insert_thongtindoanhnghiep]    Script Date: 06/01/2024 00:26:23 ******/
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
/****** Object:  StoredProcedure [dbo].[NH_Update_doanhnghiep]    Script Date: 06/01/2024 00:26:28 ******/
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
/****** Object:  StoredProcedure [dbo].[NH_thongtin_doanhnghiep]    Script Date: 06/01/2024 00:26:27 ******/
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
/****** Object:  StoredProcedure [dbo].[NH_Phieuchi_Phieuthu2]    Script Date: 06/01/2024 00:26:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_Phieuchi_Phieuthu2]
	@guoinhan as nvarchar(50), 
	@nhacc as nvarchar(50), 
	@sotien as nvarchar(50), 
	@conoid as nvarchar(50), 
	@motaid as nvarchar(50), 
	@ngaychi as nvarchar(50), 
	@phuongthuc as nvarchar(50), 
	@nguoichitienid as nvarchar(50)
AS
BEGIN

declare @maxHD as nvarchar(10)
declare @sohd as nvarchar(50)

declare @checkbegin as int
set @checkbegin = (select COUNT (*) FROM htSoQuy where typeHD='1')


if (@checkbegin > 0)
begin
	set @maxHD = (select max(cast(substring(MaHD,4,len(MaHD)-3) as int))+1 from htSoQuy where typeHD='1')
	set @soHD = 'PT_'+@maxHD	

	insert into htSoQuy(typeHD,MaHD,IDketoan,IDnguoinhan,IDkhachhang,IDnhacungcap,psco,psno,Mota,ngaygiaodich,phuongthucTT,Createdate) 
	values('1',@soHD,@nguoichitienid,@guoinhan,'',@nhacc,@sotien,'',@motaid,@ngaychi,@phuongthuc,getdate())


	--update cong no
	
	update htkhachhang set congnoden=congnoden + cast(@sotien as float) where id = cast(@nhacc as int)

  
	select 1,@soHD
end
else
begin
	--- truong hop chua co ban ghi nao
	set @maxHD = '1'
	set @soHD = 'PT_'+@maxHD	

	insert into htSoQuy(typeHD,MaHD,IDketoan,IDnguoinhan,IDkhachhang,IDnhacungcap,psco,psno,Mota,ngaygiaodich,phuongthucTT,Createdate) 
	values('1',@soHD,@nguoichitienid,@guoinhan,'',@nhacc,@sotien,'',@motaid,@ngaychi,@phuongthuc,getdate())

	--update cong no nha cung cap
	update htkhachhang set congnoden=congnoden + cast(@sotien as float) where id = cast(@nhacc as int)
	select 1,@soHD

end




END
GO
/****** Object:  StoredProcedure [dbo].[NH_Baocaosoquy]    Script Date: 06/01/2024 00:26:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_Baocaosoquy]
	
AS
BEGIN

declare @tongthutheongay as nvarchar(50)
declare @tongchitheongay as nvarchar(50)

if exists(select psco as tongthu from htSoQuy where typeHD=1 and convert(varchar,Createdate,23) = convert(varchar,getdate(),23))
begin
	set @tongthutheongay = (select sum(psco) as tongthu from htSoQuy where typeHD=1 and convert(varchar,Createdate,23) = convert(varchar,getdate(),23))
end
else
begin
	set @tongthutheongay = '0'
end

if exists(select psno as tongthu from htSoQuy where typeHD=0 and convert(varchar,Createdate,23) = convert(varchar,getdate(),23))
begin
	set @tongchitheongay = (select sum(psno) as tongthu from htSoQuy where typeHD=0 and convert(varchar,Createdate,23) = convert(varchar,getdate(),23))
end
else
begin
	set @tongchitheongay = '0'
end

	
select * from 
(
SELECT id,
(CASE
    WHEN typeHD='0' THEN 'Phieu Chi'
    ELSE 'Phieu Thu'
END) as typeHD
--typeHD
,MaHD,IDketoan,IDnguoinhan,IDkhachhang,IDnhacungcap,psco,psno,Mota,ngaygiaodich,phuongthucTT,Createdate FROM htSoQuy where convert(varchar,Createdate,23) = convert(varchar,getdate(),23)

union

select '','','','','','','',
@tongthutheongay as psco,--(select @tongthutheongay as psco from htSoQuy where convert(varchar,Createdate,23) = convert(varchar,getdate(),23)) as psco,
@tongchitheongay as psno,--(select @tongchitheongay as psno from htSoQuy where convert(varchar,Createdate,23) = convert(varchar,getdate(),23)) as psco,
'',
'',
'',GETDATE() as Createdate
from htSoQuy 
) ABC order by Createdate asc 



END
GO
/****** Object:  StoredProcedure [dbo].[NH_Baocaosoquy_theongay]    Script Date: 06/01/2024 00:26:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_Baocaosoquy_theongay] --NH_Baocaosoquy_theongay '2024-04-24','2024-05-04'
	@_fromdate as nvarchar(50),
	@_todate as nvarchar(50)
AS
BEGIN


select * from 
(

SELECT id,
(CASE
    WHEN typeHD='0' THEN 'Phieu Chi'
    ELSE 'Phieu Thu'
END) as typeHD
--typeHD
,MaHD,IDketoan,IDnguoinhan,IDkhachhang,IDnhacungcap,psco,psno,Mota,ngaygiaodich,phuongthucTT,Createdate FROM htSoQuy
where convert(varchar,Createdate,23) BETWEEN convert(varchar,@_fromdate,23) AND convert(varchar,@_todate,23)

union

select '','','','','','','',
(select sum(psco) from htSoQuy where convert(varchar,Createdate,23) BETWEEN convert(varchar,@_fromdate,23) AND convert(varchar,@_todate,23)) as psco,
(select sum(psno) from htSoQuy where convert(varchar,Createdate,23) BETWEEN convert(varchar,@_fromdate,23) AND convert(varchar,@_todate,23)) as psco,
'',
'',
'',GETDATE() as Createdate
from htSoQuy

) ABC order by Createdate asc 

END
GO
/****** Object:  StoredProcedure [dbo].[NH_sochungtu_PT]    Script Date: 06/01/2024 00:26:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_sochungtu_PT] --NH_sochungtu_PT 'PT_5'
	@_sohoadon as nvarchar(50)
AS
BEGIN

select * from htSoQuy where MaHD = 	@_sohoadon

END
GO
/****** Object:  StoredProcedure [dbo].[NH_getsohoadon_PC]    Script Date: 06/01/2024 00:26:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[NH_getsohoadon_PC]

AS
BEGIN
	declare @sohoadon as nvarchar(10)

	if exists (select * from htSoQuy where typeHD='0')
	begin
		set @sohoadon = (select top 1 MaHD from htSoQuy where typeHD='0' order by ID desc)
		select @sohoadon
	end
	else
	begin
		set @sohoadon = 0
		select @sohoadon
	end
	--lay so hoa don
	


END
GO
/****** Object:  StoredProcedure [dbo].[NH_sochungtu_PC]    Script Date: 06/01/2024 00:26:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[NH_sochungtu_PC] --NH_sochungtu_PC 'PT_5'
	@_sohoadon as nvarchar(50)
AS
BEGIN

select * from htSoQuy where MaHD = 	@_sohoadon

END
GO
/****** Object:  StoredProcedure [dbo].[NH_getsohoadon_PT]    Script Date: 06/01/2024 00:26:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_getsohoadon_PT]

AS
BEGIN
	declare @sohoadon as nvarchar(10)

	if exists (select * from htSoQuy where typeHD='1')
	begin
		set @sohoadon = (select top 1 MaHD from htSoQuy where typeHD='1' order by ID desc)
		select @sohoadon
	end
	else
	begin
		set @sohoadon = 0
		select @sohoadon
	end
	--lay so hoa don
	


END
GO
/****** Object:  StoredProcedure [dbo].[NH_Get_kieunghi]    Script Date: 06/01/2024 00:26:19 ******/
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
/****** Object:  StoredProcedure [dbo].[NH_select_info_phong1]    Script Date: 06/01/2024 00:26:25 ******/
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
      
  FROM htphong where khuvucid=2

END
GO
/****** Object:  StoredProcedure [dbo].[NH_danhmucbanphong]    Script Date: 06/01/2024 00:26:18 ******/
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
/****** Object:  StoredProcedure [dbo].[NH_Update_phongban]    Script Date: 06/01/2024 00:26:29 ******/
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
/****** Object:  StoredProcedure [dbo].[NH_addnew_phongban]    Script Date: 06/01/2024 00:26:15 ******/
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
/****** Object:  StoredProcedure [dbo].[NH_select_info_phong3]    Script Date: 06/01/2024 00:26:26 ******/
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
/****** Object:  StoredProcedure [dbo].[NH_Setting_phongban]    Script Date: 06/01/2024 00:26:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_Setting_phongban] 
	@mohinh as nvarchar(20), 
	@maphongid as nvarchar(50), 
	@tiengionghiid as nvarchar(50), 
	@thoigianphutroiid as nvarchar(50), 
	@tiengiophutroiid as nvarchar(50), 
	@tiengiophutroitheophutid as nvarchar(50), 
	@tiennghidemid as nvarchar(50), 
	@tiennghingayid as nvarchar(50), 
	@tiennghithangid as nvarchar(50), 
	@tienkaraokeid as nvarchar(50)
AS
BEGIN
declare @nhahang as nvarchar(2)
declare @karaoke as nvarchar(2)
declare @hotel as nvarchar(2)

if(@mohinh = 'nhahang')
begin
	set @nhahang = '1'
	set @karaoke = '0'
	set @hotel = '0'
end
else if(@mohinh = 'karaoke')
begin
	set @nhahang = '0'
	set @karaoke = '1'
	set @hotel = '0'
end
else if(@mohinh = 'hotel')
begin
	set @nhahang = '0'
	set @karaoke = '0'
	set @hotel = '1'
end
	
update htphong set giophutroi=cast(@tiengiophutroiid as float),giophutroitheophut=cast(@tiengiophutroitheophutid as float),timephutroi=cast(@thoigianphutroiid as int),
karaoke=cast(@karaoke as int),tiengiohat=cast(@tienkaraokeid as int),nhanghi=cast(@hotel as int),tiengionghi=cast(@tiengionghiid as int),tiennghidem=cast(@tiennghidemid as int),
tiennghingay=cast(@tiennghingayid as int),tiennghithang=cast(@tiennghithangid as int) where tenphong=@maphongid

select 1

END
GO
/****** Object:  StoredProcedure [dbo].[NH_select_info_phong4]    Script Date: 06/01/2024 00:26:26 ******/
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
/****** Object:  StoredProcedure [dbo].[NH_get_trangthaiphong]    Script Date: 06/01/2024 00:26:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_get_trangthaiphong]
	@nameroom as nvarchar(20)
AS
BEGIN

if exists(select id from htphong where tenphong=@nameroom and trangthai=1)
begin
	--phong/ban co khach
	select 1,trangthai,tenphong from htphong where tenphong=@nameroom
end
else
begin
	select 0
end
	

END
GO
/****** Object:  StoredProcedure [dbo].[NH_select_info_phong]    Script Date: 06/01/2024 00:26:25 ******/
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
      
  FROM htphong where khuvucid=1

END
GO
/****** Object:  StoredProcedure [dbo].[NH_insert_DMnhanvien]    Script Date: 06/01/2024 00:26:22 ******/
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
/****** Object:  StoredProcedure [dbo].[NH_Get_nhanvien]    Script Date: 06/01/2024 00:26:20 ******/
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
/****** Object:  StoredProcedure [dbo].[pro_user_login_N]    Script Date: 06/01/2024 00:26:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pro_user_login_N] --'2013525','123456'
@username as varchar(50),
@password as varchar(100)
AS
BEGIN	
  		
	select * from TBL_USER2 where U_NAME = @username and U_PASSWORD=@password and U_ACTIVE = 'Y';	
END
GO
/****** Object:  StoredProcedure [dbo].[NH_Update_nhanvien]    Script Date: 06/01/2024 00:26:29 ******/
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
/****** Object:  StoredProcedure [dbo].[NH_danhmucnhanvien]    Script Date: 06/01/2024 00:26:18 ******/
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
/****** Object:  StoredProcedure [dbo].[NH_Update_tonkho]    Script Date: 06/01/2024 00:26:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_Update_tonkho]
	@mahang as nvarchar(50),
	@tenhang as nvarchar(100),
	@slcu as nvarchar(10),
	@slmoi as nvarchar(10),
	@userid as nvarchar(10)
AS
BEGIN

declare @listoncuoiky as nvarchar(200)
set @listoncuoiky ='{'+'"'+@tenhang+'":'+ @slmoi+'}'; --{"bia ha noi":39,"bia ken":65,"Bò khô":2,"bim bim":0}
--insert vao bang can doi ton kho
insert into htcandoihangton (mahang,tenhang,slcu,slmoi,listtoncuoiky,created,userid) values(@mahang,@tenhang,@slcu,@slmoi,@listoncuoiky,getdate(),@userid)

-- update ton kho danh muc hang hoa
update hthanghoa set soluongton = cast(@slmoi as float)  where mahang=@mahang

select 1
	


END
GO
/****** Object:  StoredProcedure [dbo].[NH_check_order]    Script Date: 06/01/2024 00:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_check_order]
	@tenhang as nvarchar(100),
	@soluong as nvarchar(10),
	@tenphong as nvarchar(50)
AS
BEGIN
	
declare @solanin as int
	
	if exists(select Solanin from htOrderMonan where tenhang=@tenhang and banid=@tenphong)
	begin
		set @solanin = (select top 1 Solanin from htOrderMonan where tenhang=@tenhang and banid=@tenphong order by id desc)
		set @solanin = @solanin + 1
	end
	else
	begin
		set @solanin = 1
	end


	--kiem tra ten hang thuoc hang order hay khong
	if exists(select * from hthanghoa where tenhang=@tenhang and Orderid=1)
	begin
		delete htOrderMonan where tenhang=@tenhang and banid=@tenphong

		insert into htOrderMonan([tenhang],[soluong],[banid],[Solanin]) values(@tenhang,@soluong,@tenphong,@solanin)
		select 1
	end
	else
	begin
		select 0
	end

END
GO
/****** Object:  StoredProcedure [dbo].[NH_Update_hanghoa]    Script Date: 06/01/2024 00:26:28 ******/
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
/****** Object:  StoredProcedure [dbo].[NH_insert_hanghoa]    Script Date: 06/01/2024 00:26:23 ******/
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
/****** Object:  StoredProcedure [dbo].[NH_updatekho_BH_suaHD]    Script Date: 06/01/2024 00:26:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[NH_updatekho_BH_suaHD] --NH_updatekho_BH_suaHD 'bia ha noi',1,'nhaphang',''	
	@mahang as nvarchar(50), 
	@soluong as nvarchar(10),
	@type_act as nvarchar(50)
AS
BEGIN
if(@type_act = 'nhaphang')
begin
	update hthanghoa set soluongton=soluongton+cast(@soluong as int) where tenhang=@mahang
	select 1,soluongton from hthanghoa where tenhang=@mahang
end
else
begin
	--@type_act = 'banhang'
--truong hop sua hoa don se khong update so luong ton kho
--ton kho se duoc update o thao tac sua xoa.
--da chon vao sua hoa don thi bat phai luu lai hoa don  ==> truong hop nay phai bat chat o client
	
--update hthanghoa set soluongton=soluongton-cast(@soluong as int) where tenhang=@mahang	

	select 1,soluongton from hthanghoa where tenhang=@mahang
end

	
	

END
GO
/****** Object:  StoredProcedure [dbo].[NH_updatekho_BH]    Script Date: 06/01/2024 00:26:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[NH_updatekho_BH] --NH_updatekho_BH 'bia ha noi',1,'nhaphang',''	
	@mahang as nvarchar(50), 
	@soluong as nvarchar(10),
	@type_act as nvarchar(50)
AS
BEGIN
if(@type_act = 'nhaphang')
begin
	update hthanghoa set soluongton=soluongton+cast(@soluong as int) where tenhang=@mahang
	select 1,soluongton from hthanghoa where tenhang=@mahang
end
else
begin
	--@type_act = 'banhang'
	update hthanghoa set soluongton=soluongton-cast(@soluong as int) where tenhang=@mahang	

	select 1,soluongton from hthanghoa where tenhang=@mahang
end

	
	

END
GO
/****** Object:  StoredProcedure [dbo].[htupdate_tonkho_suahang]    Script Date: 06/01/2024 00:26:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[htupdate_tonkho_suahang]
	@tenhang as nvarchar(100), 
	@soluongupdate as nvarchar(10)
AS
BEGIN
	
--select 1,soluongton from hthanghoa where tenhang=@mahang
update hthanghoa set soluongton=soluongton+ cast(@soluongupdate as float) where tenhang=@tenhang
select 1


END
GO
/****** Object:  StoredProcedure [dbo].[htupdate_tonkho_xoahang]    Script Date: 06/01/2024 00:26:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[htupdate_tonkho_xoahang]
	@tenhang as nvarchar(100), 
	@soluongxoa as nvarchar(10)
AS
BEGIN
	
--select 1,soluongton from hthanghoa where tenhang=@mahang
update hthanghoa set soluongton=soluongton+ cast(@soluongxoa as float) where tenhang=@tenhang
select 1


END
GO
/****** Object:  StoredProcedure [dbo].[NH_updatekho]    Script Date: 06/01/2024 00:26:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_updatekho] --NH_updatekho 'bia ha noi',1,'nhaphang',''	
	@mahang as nvarchar(50), 
	@soluong as nvarchar(10),
	@type_act as nvarchar(50),
	@tenphong as nvarchar(50)
AS
BEGIN
if(@type_act = 'nhaphang')
begin
	update hthanghoa set soluongton=soluongton+cast(@soluong as int) where tenhang=@mahang
	select 1,soluongton from hthanghoa where tenhang=@mahang
end
else
begin
	--@type_act = 'banhang'
	update hthanghoa set soluongton=soluongton-cast(@soluong as int) where tenhang=@mahang

	-- xoa danh sach mon an da duoc order o bep sau khi thanh toan xong
	delete htOrderMonan where tenhang=@mahang and banid=@tenphong

	select 1,soluongton from hthanghoa where tenhang=@mahang
end

	
	

END
GO
/****** Object:  StoredProcedure [dbo].[NH_danhmuchanghoa]    Script Date: 06/01/2024 00:26:18 ******/
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
/****** Object:  StoredProcedure [dbo].[NH_delete_order]    Script Date: 06/01/2024 00:26:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_delete_order]
	@tenhangid as nvarchar(50),
	@tenbanid as nvarchar(50)
AS
BEGIN
	delete htOrderMonan where tenhang=@tenhangid and banid= @tenbanid
	select 1
END
GO
/****** Object:  StoredProcedure [dbo].[NH_danhmucorder]    Script Date: 06/01/2024 00:26:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_danhmucorder]

AS
BEGIN
	
select [tenhang]
      ,[soluong]
      ,[banid]      
      ,[createtime] from htOrderMonan order by createtime desc

END
GO
/****** Object:  StoredProcedure [dbo].[NH_thongtinbep]    Script Date: 06/01/2024 00:26:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_thongtinbep] 
	@tenphong as nvarchar(50)
AS
BEGIN
	
select tenhang,soluong,banid,Solanin from htOrderMonan where banid=@tenphong

END
GO
/****** Object:  StoredProcedure [dbo].[NH_get_Giahansudung]    Script Date: 06/01/2024 00:26:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_get_Giahansudung]
	@ngaygiahan as nvarchar(50)
AS
BEGIN
	if exists (select * from htlogin where convert(nvarchar,checkdate,23) = convert(nvarchar,@ngaygiahan,23))
	begin
		select 0
	end
	else
	begin
		--ok
		insert into htlogin(checkdate) values(@ngaygiahan)
		select 1
	end

END
GO
/****** Object:  StoredProcedure [dbo].[NH_check_login]    Script Date: 06/01/2024 00:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_check_login]
	
AS
BEGIN
	declare @checkdate as datetime
	set @checkdate = (select top 1 checkdate from  htlogin order by id desc)
	print(@checkdate)

	select DATEDIFF(day, getdate(), @checkdate)
	--DATEDIFF(day, '2019/01/01', '2019/04/28')
END
GO
/****** Object:  StoredProcedure [dbo].[NH_Get_DVT]    Script Date: 06/01/2024 00:26:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_Get_DVT]
	
AS
BEGIN

select distinct dvtto from htdonvitinh

END
GO
/****** Object:  StoredProcedure [dbo].[NH_show_dvt]    Script Date: 06/01/2024 00:26:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_show_dvt]  --NH_show_dvt 'goi','migoi','cay'
	@donvinhonhat as nvarchar(50), 
	@kiemtramahang as nvarchar(50), 
	@donvilonhon as nvarchar(50)
AS
BEGIN		

	if exists(select (id) from htdonvitinh where mahang = @kiemtramahang)
	begin
	--print '1'
		select 1,soluongqudoi from htdonvitinh  where mahang=@kiemtramahang and dvtto=@donvilonhon and dvtnho=@donvinhonhat
		--select 1
	end
	else
	begin
	--print '0'
		select 0
	end





END
GO
/****** Object:  StoredProcedure [dbo].[NH_DMCauthanhDVT]    Script Date: 06/01/2024 00:26:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_DMCauthanhDVT]

AS
BEGIN
	select * from htdonvitinh
END
GO
/****** Object:  StoredProcedure [dbo].[NH_update_cauthanhdvt]    Script Date: 06/01/2024 00:26:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_update_cauthanhdvt]
	@id as nvarchar(10), 
	@mahang as nvarchar(50), 
	@donvito as nvarchar(50), 
	@soluongquydoi as nvarchar(10), 
	@donvinho as nvarchar(50)
AS
BEGIN
	
	update htdonvitinh set dvtto=@donvito,dvtnho=@donvinho,soluongqudoi=@soluongquydoi where id=@id
	select 1

END
GO
/****** Object:  StoredProcedure [dbo].[NH_insert_cauthanhdvt]    Script Date: 06/01/2024 00:26:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_insert_cauthanhdvt]	
	@mahang as nvarchar(50), 
	@donvito as nvarchar(50), 
	@soluongquydoi as nvarchar(10), 
	@donvinho as nvarchar(50)
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
      ,[dvtnho]) values (@mahang,@donvito,@soluongquydoi,@donvinho)

	  --update code trang thai cau thanh san pham
	  update hthanghoa set cauthanhsanpham=1 where mahang=@mahang

		select 1
	end	

END
GO
/****** Object:  StoredProcedure [dbo].[NH_Baocaocongno]    Script Date: 06/01/2024 00:26:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_Baocaocongno]
	
AS
BEGIN
	
select id,makh,tenkh,congnoden,'' sohoadon,createddate from htkhachhang

END
GO
/****** Object:  StoredProcedure [dbo].[NH_insert_khachhang]    Script Date: 06/01/2024 00:26:23 ******/
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
/****** Object:  StoredProcedure [dbo].[NH_Update_khachhang]    Script Date: 06/01/2024 00:26:29 ******/
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
/****** Object:  StoredProcedure [dbo].[NH_danhmuckhachhang]    Script Date: 06/01/2024 00:26:18 ******/
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
/****** Object:  StoredProcedure [dbo].[NH_insert_DMkhachhang]    Script Date: 06/01/2024 00:26:22 ******/
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
/****** Object:  StoredProcedure [dbo].[NH_Get_KH]    Script Date: 06/01/2024 00:26:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[NH_Get_KH]
	
AS
BEGIN
	select id,makh from htkhachhang
END
GO
/****** Object:  StoredProcedure [dbo].[NH_select_khuvuc1]    Script Date: 06/01/2024 00:26:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_select_khuvuc1]
	

AS
BEGIN
	
	SELECT [tenkhuvuc] FROM htkhuvuc where makhuvuc='2'

END
GO
/****** Object:  StoredProcedure [dbo].[NH_select_khuvuc4]    Script Date: 06/01/2024 00:26:26 ******/
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
/****** Object:  StoredProcedure [dbo].[NH_danhmuckhuvuc]    Script Date: 06/01/2024 00:26:18 ******/
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
/****** Object:  StoredProcedure [dbo].[NH_Update_khuvuc]    Script Date: 06/01/2024 00:26:29 ******/
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
/****** Object:  StoredProcedure [dbo].[NH_select_khuvuc]    Script Date: 06/01/2024 00:26:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_select_khuvuc]
	

AS
BEGIN
	
	SELECT [tenkhuvuc] FROM htkhuvuc where makhuvuc='1'

END
GO
/****** Object:  StoredProcedure [dbo].[NH_insert_khuvuc]    Script Date: 06/01/2024 00:26:23 ******/
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
/****** Object:  StoredProcedure [dbo].[NH_select_khuvuc3]    Script Date: 06/01/2024 00:26:26 ******/
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
/****** Object:  StoredProcedure [dbo].[NH_Get_Khuvuc]    Script Date: 06/01/2024 00:26:19 ******/
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
/****** Object:  StoredProcedure [dbo].[NH_Get_nhomhang]    Script Date: 06/01/2024 00:26:20 ******/
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
/****** Object:  StoredProcedure [dbo].[NH_danhmucnhomhang]    Script Date: 06/01/2024 00:26:19 ******/
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
/****** Object:  StoredProcedure [dbo].[NH_Update_nhomhang]    Script Date: 06/01/2024 00:26:29 ******/
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
/****** Object:  StoredProcedure [dbo].[NH_insert_nhomhang]    Script Date: 06/01/2024 00:26:23 ******/
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
/****** Object:  StoredProcedure [dbo].[NH_select_nhomhang]    Script Date: 06/01/2024 00:26:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_select_nhomhang]
	
AS
BEGIN

	select [id],[manhomhang] ,[tennhomhang] from htnhomhang
	 
END
GO
/****** Object:  StoredProcedure [dbo].[NH_DMCauthanhsanpham]    Script Date: 06/01/2024 00:26:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_DMCauthanhsanpham]	

AS
BEGIN
	
	SELECT [id]
      ,[mahang]
      ,[Slquydoi]
      ,[mahangquydoi]
      ,[Createdate]
  FROM htcauthanhsanpham
	
END
GO
/****** Object:  StoredProcedure [dbo].[NH_update_cauthanhsanpham]    Script Date: 06/01/2024 00:26:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_update_cauthanhsanpham]
	@id as nvarchar(10), 
	@mahang as nvarchar(50), 
	@soluongquydoi as nvarchar(50), 
	@maquydoi as nvarchar(50)
AS
BEGIN
	
	if exists(select * from htcauthanhsanpham where id=@id)
	begin
		update htcauthanhsanpham set Slquydoi=@soluongquydoi,mahangquydoi=@maquydoi where id=@id
		select 1
	end
	else
	begin
		select 0
	end



END
GO
/****** Object:  StoredProcedure [dbo].[NH_insert_cauthanhsanpham]    Script Date: 06/01/2024 00:26:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_insert_cauthanhsanpham]
	@mahang as nvarchar(50),
	@soluongquydoi as nvarchar(50), 
	@maquydoi as nvarchar(50)
AS
BEGIN
	
	if exists(select * from htcauthanhsanpham where mahang=@mahang and mahangquydoi=@maquydoi)
	begin		
		select 0
	end
	else
	begin
		insert into htcauthanhsanpham(mahang, Slquydoi, mahangquydoi) values(@mahang,@soluongquydoi,@maquydoi)
		--update hang hoa co cau thanh san pham trong bang mater
		update hthanghoa set cauthanhsanpham=1 where mahang=@mahang
		select 1
	end


END
GO
/****** Object:  StoredProcedure [dbo].[NH_check_cauthanh]    Script Date: 06/01/2024 00:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_check_cauthanh]  --NH_check_cauthanh N'Cafe Nâu','1'
	@mahang as nvarchar(50),
	@soluong as nvarchar(50)
AS
BEGIN
	
	declare @soluongquydoi_ as nvarchar(50)
	declare @mahangquydoi_ as nvarchar(50)

	declare @mahangnew as nvarchar(50)
	--doi ten hang thanh ma hang o day
	set @mahangnew = (select mahang from hthanghoa where tenhang=@mahang)

	--print(@mahangnew)

	----- begin rollback ----
--SET XACT_ABORT ON
--	BEGIN TRAN
--	BEGIN TRY

	if exists(select * from hthanghoa where mahang=@mahangnew and cauthanhsanpham=1)
	begin
		-- tru ton kho trong danh muc
		DECLARE test311 CURSOR  FOR
		select Slquydoi,mahangquydoi from htcauthanhsanpham where mahang=@mahangnew
		OPEN test311 --mở con trỏ để duyệt danh sách
		FETCH NEXT FROM test311 INTO @soluongquydoi_ ,@mahangquydoi_
		WHILE @@FETCH_STATUS = 0
		begin
			--soluongton = soluongton  - soluongquydoi*soluong duoc xuat di
			--print (cast(@soluongquydoi_ as float)* cast(@soluong as int))
			--print(@mahangquydoi_)
			--print'---'
			update hthanghoa set soluongton= ROUND((cast(soluongton as float)-(cast(@soluongquydoi_ as float)* cast(@soluong as int))),2) where mahang=@mahangquydoi_

		FETCH NEXT FROM test311 INTO @soluongquydoi_,@mahangquydoi_
		end

		CLOSE test311 --đóng con trỏ
		DEALLOCATE test311 -- giải phóng con trỏ		

		select 1
	end
	else
	begin
		select 0
	end


	----- end rollback ----
-- COMMIT
--	END TRY
--	BEGIN CATCH
--	   ROLLBACK
--	   DECLARE @ErrorMessage VARCHAR(2000)
--	   SELECT @ErrorMessage = 'Lỗi: ' + ERROR_MESSAGE()
--	   RAISERROR(@ErrorMessage, 16, 1)
--	END CATCH


END
GO
