USE [Warehouse_BPS]
GO
/****** Object:  Table [dbo].[htcauthanhsanpham]    Script Date: 05/13/2024 5:03:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[htcauthanhsanpham](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[mahang] [nvarchar](50) NULL,
	[Slquydoi] [float] NULL,
	[mahangquydoi] [nvarchar](50) NULL,
	[Createdate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hthanghoa]    Script Date: 05/13/2024 5:03:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hthanghoa](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[mahang] [nvarchar](50) NULL,
	[tenhang] [nvarchar](50) NULL,
	[dvt] [nvarchar](50) NULL,
	[soluongton] [float] NULL,
	[anh] [nvarchar](50) NULL,
	[gianhap] [float] NULL,
	[giaban] [float] NULL,
	[nhomhangid] [int] NULL,
	[cauthanhsanpham] [tinyint] NULL,
	[userid] [nvarchar](50) NULL,
	[created] [datetime] NULL,
	[modified] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[htcauthanhsanpham] ADD  CONSTRAINT [DF_htcauthanhsanpham_Createdate]  DEFAULT (getdate()) FOR [Createdate]
GO
ALTER TABLE [dbo].[hthanghoa] ADD  CONSTRAINT [DF_hthanghoa_cauthanhsanpham]  DEFAULT ((0)) FOR [cauthanhsanpham]
GO
ALTER TABLE [dbo].[hthanghoa] ADD  CONSTRAINT [DF_hthanghoa_created]  DEFAULT (getdate()) FOR [created]
GO
/****** Object:  StoredProcedure [dbo].[NH_check_cauthanh]    Script Date: 05/13/2024 5:03:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[NH_check_cauthanh]  --NH_check_cauthanh N'Cafe Nâu','1'
	@mahang as nvarchar(50),
	@soluong as nvarchar(50)
AS
BEGIN
	
	declare @soluongquydoi_ as nvarchar(50)
	declare @mahangquydoi_ as nvarchar(50)

	declare @mahangnew as nvarchar(50)
	--doi ten hang thanh ma hang o day
	set @mahangnew = (select mahang from hthanghoa where tenhang=@mahang)

	--print(@mahangnew)

	----- begin rollback ----
SET XACT_ABORT ON
	BEGIN TRAN
	BEGIN TRY

	if exists(select * from hthanghoa where mahang=@mahangnew and cauthanhsanpham=1)
	begin
		-- tru ton kho trong danh muc
		DECLARE test311 CURSOR  FOR
		select Slquydoi,mahangquydoi from htcauthanhsanpham where mahang=@mahangnew
		OPEN test311 --mở con trỏ để duyệt danh sách
		FETCH NEXT FROM test311 INTO @soluongquydoi_ ,@mahangquydoi_
		WHILE @@FETCH_STATUS = 0
		begin
			--soluongton = soluongton  - soluongquydoi*soluong duoc xuat di
			--print (cast(@soluongquydoi_ as float)* cast(@soluong as int))
			--print(@mahangquydoi_)
			--print'---'
			update hthanghoa set soluongton= ROUND((cast(soluongton as float)-(cast(@soluongquydoi_ as float)* cast(@soluong as int))),2) where mahang=@mahangquydoi_

		FETCH NEXT FROM test311 INTO @soluongquydoi_,@mahangquydoi_
		end

		CLOSE test311 --đóng con trỏ
		DEALLOCATE test311 -- giải phóng con trỏ		

		select 1
	end
	else
	begin
		select 0
	end


	----- end rollback ----
 COMMIT
	END TRY
	BEGIN CATCH
	   ROLLBACK
	   DECLARE @ErrorMessage VARCHAR(2000)
	   SELECT @ErrorMessage = 'Lỗi: ' + ERROR_MESSAGE()
	   RAISERROR(@ErrorMessage, 16, 1)
	END CATCH


END
GO
/****** Object:  StoredProcedure [dbo].[NH_DMCauthanhsanpham]    Script Date: 05/13/2024 5:03:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[NH_DMCauthanhsanpham]	

AS
BEGIN
	
	SELECT [id]
      ,[mahang]
      ,[Slquydoi]
      ,[mahangquydoi]
      ,[Createdate]
  FROM [Warehouse_BPS].[dbo].[htcauthanhsanpham]
	
END
GO
/****** Object:  StoredProcedure [dbo].[NH_getsohoadon_PT]    Script Date: 05/13/2024 5:03:03 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NH_insert_cauthanhdvt]    Script Date: 05/13/2024 5:03:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[NH_insert_cauthanhdvt]	
	@mahang as nvarchar(50), 
	@donvito as nvarchar(50), 
	@soluongquydoi as nvarchar(10), 
	@donvinho as nvarchar(50)
AS
BEGIN
	
	if exists(select * from htdonvitinh where mahang=@mahang and dvtto=@donvito and dvtnho=@donvinho)
	begin
		select 0
	end
	else
	begin
		insert into htdonvitinh([mahang]
      ,[dvtto]
      ,[soluongqudoi]
      ,[dvtnho]) values (@mahang,@donvito,@soluongquydoi,@donvinho)

	  --update code trang thai cau thanh san pham
	  update hthanghoa set cauthanhsanpham=1 where mahang=@mahang

		select 1
	end	

END
GO
/****** Object:  StoredProcedure [dbo].[NH_insert_cauthanhsanpham]    Script Date: 05/13/2024 5:03:03 PM ******/
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
		select 1
	end


END
GO
/****** Object:  StoredProcedure [dbo].[NH_update_cauthanhdvt]    Script Date: 05/13/2024 5:03:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[NH_update_cauthanhdvt]
	@id as nvarchar(10), 
	@mahang as nvarchar(50), 
	@donvito as nvarchar(50), 
	@soluongquydoi as nvarchar(10), 
	@donvinho as nvarchar(50)
AS
BEGIN
	
	update htdonvitinh set dvtto=@donvito,dvtnho=@donvinho,soluongqudoi=@soluongquydoi where id=@id
	select 1

END
GO
/****** Object:  StoredProcedure [dbo].[NH_update_cauthanhsanpham]    Script Date: 05/13/2024 5:03:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[NH_update_cauthanhsanpham]
	@id as nvarchar(10), 
	@mahang as nvarchar(50), 
	@soluongquydoi as nvarchar(50), 
	@maquydoi as nvarchar(50)
AS
BEGIN
	
	if exists(select * from htcauthanhsanpham where id=@id)
	begin
		update htcauthanhsanpham set Slquydoi=@soluongquydoi,mahangquydoi=@maquydoi where id=@id
		select 1
	end
	else
	begin
		select 0
	end



END
GO
