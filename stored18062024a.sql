USE [DataNhaHang]
GO
/****** Object:  StoredProcedure [dbo].[NH_select_banorder]    Script Date: 06/18/2024 5:21:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[NH_select_banorder]   --NH_select_banorder ''
	@tenkhuvuc as nvarchar(50)
AS
BEGIN
	
	if(@tenkhuvuc <> '' )  --or @tenkhuvuc <> '==ChonKV=='
	begin
		select tenphong from htphong where khuvucid = @tenkhuvuc
	end
	else
	begin
		select tenphong from htphong
	end

	--select tenphong from htphong



END
GO
/****** Object:  StoredProcedure [dbo].[NH_select_khuvucorder]    Script Date: 06/18/2024 5:21:05 PM ******/
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
