USE [Warehouse_BPS]
GO
/****** Object:  Table [dbo].[htdonvitinh]    Script Date: 05/11/2024 5:20:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[htdonvitinh](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[mahang] [nvarchar](50) NULL,
	[dvtto] [nvarchar](50) NULL,
	[soluongqudoi] [int] NULL,
	[dvtnho] [nvarchar](50) NULL,
	[createdate] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[htdonvitinh] ADD  CONSTRAINT [DF_htdonvitinh_createdate]  DEFAULT (getdate()) FOR [createdate]
GO
/****** Object:  StoredProcedure [dbo].[NH_Get_DVT]    Script Date: 05/11/2024 5:20:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[NH_Get_DVT]
	
AS
BEGIN

select distinct dvtto from htdonvitinh

END
GO
/****** Object:  StoredProcedure [dbo].[NH_laymahang_tk]    Script Date: 05/11/2024 5:20:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_laymahang_tk] -- NH_laymahang_tk N'Bia Hà Nội'
	@tenhang as nvarchar(300)
AS
BEGIN

if exists(select mahang from hthanghoa where tenhang=@tenhang)
begin
	select mahang,dvt from hthanghoa where tenhang=@tenhang
	--select 1
end
else
begin
	select 0
end	

END
GO
/****** Object:  StoredProcedure [dbo].[NH_show_dvt]    Script Date: 05/11/2024 5:20:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[NH_show_dvt]  --NH_show_dvt 'goi','migoi','cay'
	@donvinhonhat as nvarchar(50), 
	@kiemtramahang as nvarchar(50), 
	@donvilonhon as nvarchar(50)
AS
BEGIN		

	if exists(select (id) from htdonvitinh where mahang = @kiemtramahang)
	begin
	--print '1'
		select 1,soluongqudoi from htdonvitinh  where mahang=@kiemtramahang and dvtto=@donvilonhon and dvtnho=@donvinhonhat
		--select 1
	end
	else
	begin
	--print '0'
		select 0
	end





END
GO
