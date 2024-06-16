USE [DataNhaHang]
GO
/****** Object:  StoredProcedure [dbo].[addthongtinhanghoa_PBH]    Script Date: 06/17/2024 05:47:29 ******/
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

declare @tongtiensauchietkhau  as float

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
		if(cast(@thanhtoantien as float) > cast(@tienhang as float))
		begin
			set @tongtiensauchietkhau = cast(@tienhang as float)
		end
		else
		begin
			set @tongtiensauchietkhau = @thanhtoantien   --(so tien khach thanh toan)
			--cast(@thanhtoantien as float)	
		end

		insert into htsocai (sohd,idncc,items,tienhang,tongtien,chietkhau,tiensauchietkhau,psco,type,Flag,listtoncuoiky) values(@soHD,cast(@nhacungcap as int),@items,@tienhang,@tienhang,@chietkhau,@tongtiensauchietkhau,cast(@psno as float),2,1,@listtoncuoiky)    

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

	if(cast(@thanhtoantien as float) > cast(@tienhang as float))
	begin
		set @tongtiensauchietkhau = cast(@tienhang as float)
	end
	else
	begin
		set @tongtiensauchietkhau = @thanhtoantien   --(so tien khach thanh toan)
		--cast(@thanhtoantien as float)	
	end

	insert into htsocai (sohd,idncc,items,tienhang,tongtien,chietkhau,tiensauchietkhau,psco,type,Flag,listtoncuoiky) values(@soHD,cast(@nhacungcap as int),@items,@tienhang,@tienhang,@chietkhau,@tongtiensauchietkhau,cast(@psno as float),2,1,@listtoncuoiky)    
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
/****** Object:  StoredProcedure [dbo].[NH_save_khthanhtoan2]    Script Date: 06/17/2024 05:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_save_khthanhtoan2]  -- NH_save_khthanhtoan '2','P05','45000','0','0','0','-45000','0','{"biahn,20000,20000":1,"biaken,25000,25000":1}',''
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

	declare @tongtiensauchietkhau  as float
	declare @tongtienno  as float

	--set @sohd = (select id  FROM htsocai where tenphong=@tenphong and Flag='0')
	set @sohd = (select sohd  FROM htsocai where tenphong=@tenphong and Flag='0')


	if exists(select * FROM htsocai where tenphong=@tenphong and Flag='0')
	begin
		
		if(cast(@psco as float) > cast(@tongtienhang as float))
		begin
			set @tongtiensauchietkhau = cast(@tongtienhang as float)
		end
		else
		begin
			set @tongtiensauchietkhau = @psco   --(so tien khach thanh toan)
			--@psco
		end

		if(cast(@tienno as float) < 0)
		begin
			set @tongtienno = cast(@tienno as float)
		end
		else
		begin
			set @tongtienno = 0
		end

		--update trang thai thanh toan
		--update htsocai set Flag='1',items=@items,tienhang=@tongtienhang,tongtien=@psco,psno=@tienno,tiengiohat=@tongtienhat,tienphong=@tongtienphong,tiensauchietkhau=@psco,ngaygiora=GETDATE(),idncc=cast(@idkhachhang as int),chietkhau=@tienck,listtoncuoiky=@listtoncuoiky where sohd=@sohd
		update htsocai set Flag='1',items=@items,tienhang=@tongtienhang,tongtien=@tongtiensauchietkhau,psco=@tongtienno,tiengiohat=@tongtienhat,tienphong=@tongtienphong,tiensauchietkhau=@tongtiensauchietkhau,ngaygiora=GETDATE(),idncc=cast(@idkhachhang as int),chietkhau=@tienck,listtoncuoiky=@listtoncuoiky where sohd=@sohd

		--update trang thai bang mater khi thanh toan xong  trangthai='0'  (khong co khach)
		update htphong set trangthai='0' where tenphong=@tenphong

		--update cong no khach NCC
		if(@tienno <> '0')
		begin
			--print('vao cong no')
			--update cong no bang mater
			update htkhachhang set congnoden=congnoden + cast(@tienno as float) where id =cast(@idkhachhang as int)
		end

		select 1,@sohd
	end
	else
	begin
		-- khong ton tai, kiem tra lai
		select 0
	end

END
GO
/****** Object:  StoredProcedure [dbo].[NH_timkiemhanghoa]    Script Date: 06/17/2024 05:47:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_timkiemhanghoa]  --NH_timkiemhanghoa 'da'
	@mahangtk as nvarchar(50)
AS
BEGIN
	
	select mahang, tenhang, dvt, giaban FROM hthanghoa WHERE mahang LIKE '%'+@mahangtk+'%'

END
GO
