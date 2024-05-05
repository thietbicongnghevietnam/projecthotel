USE [Warehouse_BPS]
GO
/****** Object:  StoredProcedure [dbo].[NH_thongtinthekho]    Script Date: 05/06/2024 01:06:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_thongtinthekho] --NH_thongtinthekho '','2024-05-04','2024-05-04'
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




END
GO
/****** Object:  StoredProcedure [dbo].[NH_getsohoadon]    Script Date: 05/06/2024 01:06:53 ******/
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
/****** Object:  StoredProcedure [dbo].[NH_infor_thongtinhanghoa2]    Script Date: 05/06/2024 01:06:53 ******/
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
/****** Object:  StoredProcedure [dbo].[NH_infor_thongtinhanghoa2_inlai]    Script Date: 05/06/2024 01:06:53 ******/
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
/****** Object:  StoredProcedure [dbo].[NH_Baocaothuchi_theongay]    Script Date: 05/06/2024 01:06:53 ******/
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
/****** Object:  StoredProcedure [dbo].[NH_Baocaotonkho_lolai2]    Script Date: 05/06/2024 01:06:53 ******/
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
/****** Object:  StoredProcedure [dbo].[NH_Baocaosoquy_theongay]    Script Date: 05/06/2024 01:06:53 ******/
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
/****** Object:  StoredProcedure [dbo].[NH_Baocaosoquy]    Script Date: 05/06/2024 01:06:53 ******/
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
(select @tongthutheongay as psco from htSoQuy where convert(varchar,Createdate,23) = convert(varchar,getdate(),23)) as psco,
(select @tongchitheongay as psno from htSoQuy where convert(varchar,Createdate,23) = convert(varchar,getdate(),23)) as psco,
'',
'',
'',GETDATE() as Createdate
from htSoQuy 
) ABC order by Createdate asc 



END
GO
/****** Object:  StoredProcedure [dbo].[NH_updatekho]    Script Date: 05/06/2024 01:06:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_updatekho] --NH_updatekho 'bia ha noi',1,'nhaphang'	
	@mahang as nvarchar(50), 
	@soluong as nvarchar(10),
	@type_act as nvarchar(50)
AS
BEGIN
if(@type_act = 'nhaphang')
begin
	update hthanghoa set soluongton=soluongton+cast(@soluong as int) where tenhang=@mahang
	select 1
end
else
begin
	--@type_act = 'banhang'
	update hthanghoa set soluongton=soluongton-cast(@soluong as int) where tenhang=@mahang
	select 1
end

	
	

END
GO
/****** Object:  StoredProcedure [dbo].[NH_select_documentNo]    Script Date: 05/06/2024 01:06:53 ******/
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
/****** Object:  StoredProcedure [dbo].[NH_Baocaotonkho_lolai]    Script Date: 05/06/2024 01:06:53 ******/
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
  FROM [Warehouse_BPS].[dbo].[hthanghoa]


END
GO
/****** Object:  StoredProcedure [dbo].[NH_select_hanghoa]    Script Date: 05/06/2024 01:06:53 ******/
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
/****** Object:  StoredProcedure [dbo].[NH_laymahang_tk]    Script Date: 05/06/2024 01:06:54 ******/
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
	select mahang from hthanghoa where tenhang=@tenhang
	--select 1
end
else
begin
	select 0
end	

END
GO
/****** Object:  StoredProcedure [dbo].[NH_select_documentNo2]    Script Date: 05/06/2024 01:06:54 ******/
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
/****** Object:  StoredProcedure [dbo].[NH_select_documentNo_NH]    Script Date: 05/06/2024 01:06:54 ******/
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
