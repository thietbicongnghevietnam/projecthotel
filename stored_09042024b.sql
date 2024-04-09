USE [Warehouse_BPS]
GO
/****** Object:  Table [dbo].[htnhacungcap]    Script Date: 04/09/2024 5:15:43 PM ******/
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
/****** Object:  Table [dbo].[htsocai]    Script Date: 04/09/2024 5:15:43 PM ******/
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
	[songuoio] [int] NULL,
	[ghichu] [nvarchar](50) NULL,
	[idnhanvien] [int] NULL,
	[Flag] [nvarchar](10) NULL,
	[userid] [nvarchar](50) NULL,
	[created] [datetime] NULL,
	[modified] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[htsocai_BK]    Script Date: 04/09/2024 5:15:43 PM ******/
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
ALTER TABLE [dbo].[htnhacungcap] ADD  CONSTRAINT [DF_htnhacungcap_createdate]  DEFAULT (getdate()) FOR [createdate]
GO
ALTER TABLE [dbo].[htsocai] ADD  CONSTRAINT [DF_htsocai_Flag]  DEFAULT ((0)) FOR [Flag]
GO
ALTER TABLE [dbo].[htsocai] ADD  CONSTRAINT [DF_htsocai_created]  DEFAULT (getdate()) FOR [created]
GO
/****** Object:  StoredProcedure [dbo].[NH_save_thongtinhanghoa]    Script Date: 04/09/2024 5:15:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[NH_save_thongtinhanghoa]   --NH_save_thongtinhanghoa 'P02','35000','{"Chanhmuoi":1,"biahn":1}'
	@tenphong as nvarchar(50), 	 
	@tienhang as nvarchar(50),
	@items as nvarchar(500)
	
AS
BEGIN
	declare @status_checking as nvarchar(10)

	declare @sohd as nvarchar(50)
	declare @namthangngay  as nvarchar(50)
	declare @unitno as nvarchar(50)
	declare @maxunitno as nvarchar(50)
	
	declare @maxHD as nvarchar(10)

	declare @checkbegin as int
	set @checkbegin = (select COUNT (*) FROM [Warehouse_BPS].[dbo].[htsocai])

	print @checkbegin


	set @namthangngay = (SELECT CONVERT(CHAR(8),getdate(),112))



	set @status_checking = (select top(1) [Flag]  FROM [Warehouse_BPS].[dbo].[htsocai] where tenphong=@tenphong and Flag='0')
	print @status_checking

	if (@checkbegin > 0)
	begin
		print 'vao 1'
		--NH20221212_1
		--tao so hoadon
		set @maxHD = (select max(cast(substring(sohd,4,len(sohd)-3) as int))+1 from htsocai)
		set @sohd = 'NH_'+@maxHD

		if(@status_checking is null)
		begin
			print 'aaa'
			--them moi
			set @maxunitno = (select top(1) ID  FROM [Warehouse_BPS].[dbo].[htsocai] where tenphong=@tenphong and Flag='0' order by ID desc)
									
				insert into [Warehouse_BPS].[dbo].[htsocai] ([sohd],
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
			  ,[idnhanvien]) values(@sohd,'1',GETDATE(),'','','nguyen van a',@tenphong,8000,'','',@tienhang,'','','','','','','1','1',@items,3,'',2)

			  --update trang thai phong co khach  trangthai='1'  (co khach)
			  update [Warehouse_BPS].[dbo].[htphong] set trangthai='1' where tenphong=@tenphong

			  select 1

		end
		else
		begin
			--update
			print 'update'
			update [Warehouse_BPS].[dbo].[htsocai] set items=@items,tienhang=@tienhang where tenphong=@tenphong and Flag='0' 

			select 1

		end

		

		
	end
	else
	begin
		print 'vao 0: truong hop khong ban ghi'
		set @maxHD = '1'
		set @soHD = 'NH_'+@maxHD

		insert into [Warehouse_BPS].[dbo].[htsocai] ([sohd],
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
      ,[idnhanvien]) values(@soHD,'1',GETDATE(),'','','nguyen van a',@tenphong,8000,'','',@tienhang,'','','','','','','1','1',@items,3,'',2)

		select 1
	end


END
GO
/****** Object:  StoredProcedure [dbo].[NH_updatekho]    Script Date: 04/09/2024 5:15:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_updatekho] --NH_updatekho 'biahn',1,'nhaphang'	
	@mahang as nvarchar(50), 
	@soluong as nvarchar(10),
	@type_act as nvarchar(50)
AS
BEGIN
if(@type_act = 'nhaphang')
begin
	update hthanghoa set soluongton=soluongton+cast(@soluong as int) where mahang=@mahang
	select 1
end
else
begin
	--@type_act = 'banhang'
	update hthanghoa set soluongton=soluongton-cast(@soluong as int) where mahang=@mahang
	select 1
end

	
	

END
GO
