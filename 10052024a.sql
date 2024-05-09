USE [Warehouse_BPS]
GO
/****** Object:  StoredProcedure [dbo].[NH_gop_phongban]    Script Date: 05/10/2024 01:23:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_gop_phongban] --NH_gop_phongban 'Ban1','Ban6'
	@nameitem as nvarchar(50),
	@newroom as nvarchar(50),
@chuoighep as nvarchar(500)
AS
BEGIN	

BEGIN TRANSACTION;

--lay ra tong tien hang
declare @tienhang1 as nvarchar(50)
declare @tienhang2 as nvarchar(50)
declare @tongtienhangnew as nvarchar(50)

--lay ra danh sach hang hoa 2 phong

set @tienhang1 = (select tienhang from htsocai where tenphong=@nameitem and Flag=0)
set @tienhang2 = (select tienhang from htsocai where tenphong=@newroom and Flag=0)
set @tongtienhangnew = cast((cast(@tienhang1 as int) + cast(@tienhang2 as int)) as nvarchar(50))
print @tongtienhangnew

--1. update ban can gop: tinh tong tien, tong hang hoa
update htsocai set tienhang=@tongtienhangnew,items=@chuoighep  where tenphong=@nameitem and Flag=0

--2. update ban gop 2  = 0
update htsocai set Flag=1,tienhang=0,items='{}'  where tenphong=@newroom and Flag=0

--3. update trang thai ban o bang mater
update htphong set trangthai=0 where tenphong=@newroom and trangthai=1


-- Nếu có lỗi xảy ra, ta sẽ hủy bỏ giao dịch
IF @@ERROR <> 0
BEGIN
    ROLLBACK TRANSACTION;
	select 0
    PRINT 'Giao dịch đã bị hủy bỏ.';
END
ELSE
BEGIN
    COMMIT TRANSACTION;
	select 1
    PRINT 'Giao dịch đã được thực hiện thành công.';
END


END
GO
/****** Object:  StoredProcedure [dbo].[NH_gop_phongban1]    Script Date: 05/10/2024 01:23:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_gop_phongban1]
	@nameitem as nvarchar(50)
AS
BEGIN
	select items from htsocai where tenphong=@nameitem and Flag=0
END
GO
/****** Object:  StoredProcedure [dbo].[NH_gop_phongban2]    Script Date: 05/10/2024 01:23:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_gop_phongban2]
	@newroom as nvarchar(50)
AS
BEGIN
	select items from htsocai where tenphong=@newroom and Flag=0
END
GO
