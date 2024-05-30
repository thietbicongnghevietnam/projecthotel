USE [DataNhaHang]
GO
/****** Object:  StoredProcedure [dbo].[NH_updatekho_BH_suaHD]    Script Date: 05/31/2024 03:25:07 ******/
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
/****** Object:  StoredProcedure [dbo].[htupdate_tonkho_xoahang]    Script Date: 05/31/2024 03:25:07 ******/
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
/****** Object:  StoredProcedure [dbo].[htupdate_tonkho_suahang]    Script Date: 05/31/2024 03:25:07 ******/
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
