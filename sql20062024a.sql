USE [DataNhaHang]
GO
/****** Object:  StoredProcedure [dbo].[NH_select_banorder2]    Script Date: 06/20/2024 3:31:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[NH_select_banorder2]   --NH_select_banorder2 ''
	@tenkhuvuc as nvarchar(50)
AS
BEGIN

declare @checkmakhuvuc  as nvarchar(50)

set @checkmakhuvuc = (select makhuvuc from htkhuvuc where tenkhuvuc=@tenkhuvuc)
	
	if(@tenkhuvuc <> '' )  --or @tenkhuvuc <> '==ChonKV=='
	begin
		select tenphong from htphong where khuvucid = @checkmakhuvuc
	end
	else
	begin
		select tenphong from htphong
	end

	--select tenphong from htphong



END
GO
/****** Object:  StoredProcedure [dbo].[NH_select_khuvucorder]    Script Date: 06/20/2024 3:31:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[NH_select_khuvucorder]
	
AS
BEGIN
	
	select makhuvuc,tenkhuvuc from htkhuvuc

END
GO
