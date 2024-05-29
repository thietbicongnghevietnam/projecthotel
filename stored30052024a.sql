USE [DataNhaHang]
GO
/****** Object:  StoredProcedure [dbo].[addthongtinhanghoa_PBH]    Script Date: 05/30/2024 00:49:24 ******/
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
/****** Object:  StoredProcedure [dbo].[NH_Xemlaihoadon2]    Script Date: 05/30/2024 00:49:24 ******/
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
/****** Object:  StoredProcedure [dbo].[NH_updatekho_BH]    Script Date: 05/30/2024 00:49:24 ******/
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
