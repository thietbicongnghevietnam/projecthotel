USE [Warehouse_BPS]
GO
/****** Object:  StoredProcedure [dbo].[NH_thongtinthekho_KH]    Script Date: 04/25/2024 05:28:21 ******/
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
/****** Object:  StoredProcedure [dbo].[NH_Baocaocongno_theongay]    Script Date: 04/25/2024 05:28:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_Baocaocongno_theongay] --NH_Baocaocongno_theongay '2024-03-24','2024-04-24'
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
 from htsocai a where a.psco<0 and convert(varchar,a.created,120) BETWEEN convert(varchar,@_fromdate,120) AND convert(varchar,@_todate,120)


END
GO
/****** Object:  StoredProcedure [dbo].[NH_Baocaocongno]    Script Date: 04/25/2024 05:28:21 ******/
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
