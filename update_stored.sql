USE [Warehouse_BPS]
GO
/****** Object:  StoredProcedure [dbo].[NH_infor_thongtinhanghoa]    Script Date: 03/29/2024 5:16:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[NH_infor_thongtinhanghoa]  --NH_infor_thongtinhanghoa 'P02'
	@tenphong as nvarchar(50)
AS
BEGIN
	if exists(select * from [Warehouse_BPS].[dbo].[htsocai] where tenphong=@tenphong and Flag='0')
	begin
			--select tenphong,giaphong,[items] from [Warehouse_BPS].[dbo].[htsocai] where tenphong=@tenphong
			--select [items],tienhang,giaphong,FORMAT(ngaygiothue,'dd-MM-yyyy HH:mm:ss') as ngaygiothue from [Warehouse_BPS].[dbo].[htsocai] where tenphong=@tenphong and Flag='0'
			select [items],tienhang,giaphong,FORMAT(ngaygiothue,'MM/dd/yyyy HH:mm:ss') as ngaygiothue from [Warehouse_BPS].[dbo].[htsocai] where tenphong=@tenphong and Flag='0'
	end
	else
	begin
		select 0
	end



END
GO
