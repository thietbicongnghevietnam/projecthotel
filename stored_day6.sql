USE [Warehouse_BPS]
GO
/****** Object:  StoredProcedure [dbo].[NH_getsohoadon]    Script Date: 04/04/2024 5:17:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[NH_getsohoadon]
	
AS
BEGIN
	declare @sohoadon as nvarchar(10)
	if exists(select id  FROM [Warehouse_BPS].[dbo].[htsocai] where Flag='0')
	begin		
		--set @sohoadon = (select count(ID) as countid  from [Warehouse_BPS].[dbo].[htsocai] where Flag=1 )
	    set @sohoadon = (select top(1) id FROM [Warehouse_BPS].[dbo].[htsocai] where Flag =1 order by id desc)
		select @sohoadon
	end
	else
	begin
		--set @sohoadon = 0
		select 0
	end

END
GO
/****** Object:  StoredProcedure [dbo].[NH_infor_thongtinhanghoa_inlai]    Script Date: 04/04/2024 5:17:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[NH_infor_thongtinhanghoa_inlai]  --NH_infor_thongtinhanghoa_inlai '1022'
	@sohoadon as nvarchar(50)
AS
BEGIN

declare @checkaraoke  as nvarchar(10)
declare @giohatkaraoke  as float
declare @sohoadon1 as nvarchar(10)

declare @tenphong as nvarchar(10)

set @tenphong = (select tenphong FROM [Warehouse_BPS].[dbo].[htsocai] where id=@sohoadon)

--set @sohoadon = (select top(1) ID from [Warehouse_BPS].[dbo].[htsocai] where Flag=1 order by ID desc)
set @sohoadon1 = (select top(1) id FROM [Warehouse_BPS].[dbo].[htsocai] where Flag =1 order by id desc)

if exists(select karaoke from [Warehouse_BPS].[dbo].[htphong] where karaoke=1 and tenphong=@tenphong)
begin
	set @checkaraoke = 'Karaoke'
	--set @giohatkaraoke = (select tiengiohat from [Warehouse_BPS].[dbo].[htphong] where  tenphong=@tenphong)
	set @giohatkaraoke = (select tiengiohat from [Warehouse_BPS].[dbo].[htphong] where  tenphong=@tenphong)
end
else
begin
	set @checkaraoke = 'Nhahang'
	set @giohatkaraoke = 0
end

	if exists(select * from [Warehouse_BPS].[dbo].[htsocai] where id=@sohoadon )   -- truong hop in lai hoa don   --tenphong=@tenphong and Flag='1'
	begin			
			select [items],tienhang,giaphong,FORMAT(ngaygiothue,'MM/dd/yyyy HH:mm:ss') as ngaygiothue,@checkaraoke as statusKaraoke,tiengiohat as giohat,@sohoadon1 as sohoadon,FORMAT(ngaygiora,'MM/dd/yyyy HH:mm:ss') as ngaygiora,tenphong from [Warehouse_BPS].[dbo].[htsocai] where id=@sohoadon
	end
	else
	begin
		select 0
	end



END
GO
/****** Object:  StoredProcedure [dbo].[NH_save_khthanhtoan]    Script Date: 04/04/2024 5:17:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[NH_save_khthanhtoan]  -- NH_save_khthanhtoan 'P01','0','0','0','0','{}'
	@tenphong as nvarchar(50), 	 
	@tongtienhang as nvarchar(50),
	@tongtienhat as nvarchar(50),
	@psco as nvarchar(50),
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
		update [Warehouse_BPS].[dbo].[htsocai] set Flag='1',items=@items,tienhang=@tongtienhang,psno=@tienno,tiengiohat=@tongtienhat,tiensauchietkhau=@psco,ngaygiora=GETDATE() where id=@sohd

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
