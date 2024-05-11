USE [Warehouse_BPS]
GO
/****** Object:  StoredProcedure [dbo].[NH_laymahang_tk_chuan]    Script Date: 05/12/2024 02:02:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[NH_laymahang_tk_chuan]  --NH_laymahang_tk_chuan 'nuocloc'
	@mahang as nvarchar(300)
AS
BEGIN

if exists(select mahang from hthanghoa where mahang=@mahang)
begin
	select mahang,dvt from hthanghoa where mahang=@mahang
	--select 1
end
else
begin
	select 0
end	

END
GO
/****** Object:  StoredProcedure [dbo].[NH_laydungtenhang]    Script Date: 05/12/2024 02:02:27 ******/
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
	select 0
end

END
GO
/****** Object:  StoredProcedure [dbo].[NH_laydungmahang]    Script Date: 05/12/2024 02:02:28 ******/
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
