USE [Warehouse_BPS]
GO
/****** Object:  Table [dbo].[htsonhaphang]    Script Date: 04/09/2024 06:06:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[htsonhaphang](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[sohd] [nvarchar](50) NULL,
	[idncc] [int] NULL,
	[items] [nvarchar](500) NULL,
	[tongtien] [float] NULL,
	[chietkhau] [float] NULL,
	[tongtienthanhtoan] [float] NULL,
	[ghichu] [nvarchar](50) NULL,
	[userid] [nvarchar](50) NULL,
	[created] [datetime] NULL,
	[modified] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[addthongtinhanghoa_PNH]    Script Date: 04/09/2024 06:06:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[addthongtinhanghoa_PNH]  --addthongtinhanghoa_PNH '0','NCC','13000','{"biahn,5000,5000":1,"biaken,8000,8000":1}'
	@chietkhau as nvarchar(20), 
    @nhacungcap as nvarchar(20), 
	@tienhang as nvarchar(20), 
	@items as nvarchar(300)
AS
BEGIN
--check ban ghi dau tien
declare @countid int
declare @soHD as nvarchar(50)
declare @maxHD as nvarchar(10)
declare @tongtienthanhtoan  as float

declare @NCC as int
set @NCC =1

set 	@countid = (select count(ID) FROM htsonhaphang)
if (@countid > 0)
begin
	--select 1  -- co ban ghi roi
	--tao so hoadon
	set @maxHD = (select max(cast(substring(sohd,4,len(sohd)-3) as int))+1 from htsonhaphang)
	set @soHD = 'NH_'+@maxHD
	set @tongtienthanhtoan = cast(@tienhang as float) - cast(@chietkhau as float)
	insert into htsonhaphang (sohd,idncc,items,tongtien,chietkhau,tongtienthanhtoan) values(@soHD,@NCC,@items,@tienhang,@chietkhau,@tongtienthanhtoan)    

	select 1
	

--select substring('NH_1',4,1) as abc

end
else
begin
	-- TRUONG HOP khong co ban ghi
	--select 0
	--tao so hoadon
	set @maxHD = '1'
	set @soHD = 'NH_'+@maxHD
	set @tongtienthanhtoan = cast(@tienhang as float) - cast(@chietkhau as float)
	--insert ban ghi
	insert into htsonhaphang (sohd,idncc,items,tongtien,chietkhau,tongtienthanhtoan) values(@soHD,@NCC,@items,@tienhang,@chietkhau,@tongtienthanhtoan)
	--update kho
	
	select 1	

end
	
END
GO
/****** Object:  StoredProcedure [dbo].[NH_updatekho]    Script Date: 04/09/2024 06:06:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_updatekho] --NH_updatekho 'nhaphang','biahn',1
	@type_act as nvarchar(50),
	@mahang as nvarchar(50), 
	@soluong as nvarchar(10)
AS
BEGIN
if(@type_act = 'nhaphang')
begin
	update hthanghoa set soluongton=cast(soluongton as int)+cast(@soluong as int) where mahang=@mahang
end
else
begin
	update hthanghoa set soluongton=soluongton-@soluong where mahang=@mahang
end

	
	

END
GO
