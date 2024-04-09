USE [Warehouse_BPS]
GO
/****** Object:  Table [dbo].[htsonhaphang]    Script Date: 04/10/2024 04:50:17 ******/
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
	[psco] [float] NULL,
	[psno] [float] NULL,
	[ghichu] [nvarchar](50) NULL,
	[userid] [nvarchar](50) NULL,
	[created] [datetime] NULL,
	[modified] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[addthongtinhanghoa_PNH]    Script Date: 04/10/2024 04:50:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[addthongtinhanghoa_PNH]  --addthongtinhanghoa_PNH '0','0','NCC','13000','{"biahn,5000,5000":1,"biaken,8000,8000":1}'
	@psno as nvarchar(20),
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

--declare @NCC as int
--set @NCC =1

set 	@countid = (select count(ID) FROM htsonhaphang)
if (@countid > 0)
begin
	--select 1  -- co ban ghi roi
	--tao so hoadon
	set @maxHD = (select max(cast(substring(sohd,4,len(sohd)-3) as int))+1 from htsonhaphang)
	set @soHD = 'NH_'+@maxHD
	set @tongtienthanhtoan = cast(@tienhang as float) - cast(@chietkhau as float)
	insert into htsonhaphang (sohd,idncc,items,tongtien,chietkhau,tongtienthanhtoan,psno) values(@soHD,cast(@nhacungcap as int),@items,@tienhang,@chietkhau,@tongtienthanhtoan,cast(@psno as float))    

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
	insert into htsonhaphang (sohd,idncc,items,tongtien,chietkhau,tongtienthanhtoan,psno) values(@soHD,cast(@nhacungcap as int),@items,@tienhang,@chietkhau,@tongtienthanhtoan,cast(@psno as float))
	--update kho
	
	select 1	

end
	
END
GO
