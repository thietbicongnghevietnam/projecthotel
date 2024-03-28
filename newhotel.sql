USE [Warehouse_BPS]
GO
/****** Object:  StoredProcedure [dbo].[NH_save_khthanhtoan]    Script Date: 03/28/2024 5:15:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[NH_save_khthanhtoan]  -- NH_save_khthanhtoan 'P01','0','0','0','{}'
	@tenphong as nvarchar(50), 	 
	@tongtienhang as nvarchar(50),
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
		update [Warehouse_BPS].[dbo].[htsocai] set Flag='1',items=@items,tienhang=@tongtienhang,psno=@tienno where id=@sohd

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
/****** Object:  StoredProcedure [dbo].[NH_save_thongtinhanghoa]    Script Date: 03/28/2024 5:15:15 PM ******/
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

		if(@status_checking is null)
		begin
			print 'aaa'
			--them moi
			set @maxunitno = (select top(1) ID  FROM [Warehouse_BPS].[dbo].[htsocai] where tenphong=@tenphong and Flag='0' order by ID desc)
									
				insert into [Warehouse_BPS].[dbo].[htsocai] (
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
			  ,[idnhanvien]) values('1',GETDATE(),'','','nguyen van a',@tenphong,8000,'','',@tienhang,'','','','','','','1','1',@items,3,'',2)

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
		

		insert into [Warehouse_BPS].[dbo].[htsocai] (
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
      ,[idnhanvien]) values('1',GETDATE(),'','','nguyen van a',@tenphong,8000,'','',@tienhang,'','','','','','','1','1',@items,3,'',2)

		select 1
	end


END
GO
/****** Object:  StoredProcedure [dbo].[NH_select_info_phong]    Script Date: 03/28/2024 5:15:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[NH_select_info_phong] 
	

AS
BEGIN
	
	SELECT TOP (1000) [id]
      ,[tenphong]
      ,[loaiphongid]
      ,[khuvucid]
      ,[trangthai]
      ,[trangthaidatphong]
      ,[trangthaidonphong]
      ,[giophutroi]
      
  FROM [Warehouse_BPS].[dbo].[htphong]

END
GO
/****** Object:  StoredProcedure [dbo].[NH_select_khuvuc]    Script Date: 03/28/2024 5:15:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[NH_select_khuvuc]
	

AS
BEGIN
	
	SELECT [tenkhuvuc] FROM [Warehouse_BPS].[dbo].[htkhuvuc] where makhuvuc='1'

END
GO
