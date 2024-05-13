USE [Warehouse_BPS]
GO
/****** Object:  StoredProcedure [dbo].[NH_insert_cauthanhsanpham]    Script Date: 05/14/2024 04:36:11 ******/
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
/****** Object:  StoredProcedure [dbo].[NH_Phieuchi_Phieuthu]    Script Date: 05/14/2024 04:36:11 ******/
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
set @checkbegin = (select COUNT (*) FROM [Warehouse_BPS].[dbo].[htSoQuy] where typeHD='0')


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
/****** Object:  StoredProcedure [dbo].[NH_Baocaosoquy]    Script Date: 05/14/2024 04:36:11 ******/
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
/****** Object:  StoredProcedure [dbo].[NH_Phieuchi_Phieuthu2]    Script Date: 05/14/2024 04:36:10 ******/
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
set @checkbegin = (select COUNT (*) FROM [Warehouse_BPS].[dbo].[htSoQuy] where typeHD='1')


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
/****** Object:  StoredProcedure [dbo].[NH_sochungtu_PT]    Script Date: 05/14/2024 04:36:10 ******/
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
/****** Object:  StoredProcedure [dbo].[NH_getsohoadon_PC]    Script Date: 05/14/2024 04:36:10 ******/
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
/****** Object:  StoredProcedure [dbo].[NH_sochungtu_PC]    Script Date: 05/14/2024 04:36:10 ******/
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
/****** Object:  StoredProcedure [dbo].[NH_getsohoadon_PT]    Script Date: 05/14/2024 04:36:10 ******/
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
