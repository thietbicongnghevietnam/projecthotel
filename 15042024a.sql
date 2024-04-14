USE [Warehouse_BPS]
GO
/****** Object:  Table [dbo].[htSoQuy]    Script Date: 04/15/2024 05:17:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[htSoQuy](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[typeHD] [tinyint] NULL,
	[MaHD] [nvarchar](50) NULL,
	[IDketoan] [nvarchar](50) NULL,
	[IDnguoinhan] [nvarchar](50) NULL,
	[IDkhachhang] [int] NULL,
	[IDnhacungcap] [int] NULL,
	[psco] [float] NULL,
	[psno] [float] NULL,
	[Mota] [nvarchar](50) NULL,
	[ngaygiaodich] [datetime] NULL,
	[phuongthucTT] [nvarchar](50) NULL,
	[Createdate] [datetime] NOT NULL CONSTRAINT [DF_htSoQuy_Createdate]  DEFAULT (getdate())
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[NH_Phieuchi_Phieuthu]    Script Date: 04/15/2024 05:17:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_Phieuchi_Phieuthu]
	@guoinhan as nvarchar(50), 
	@nhacc as nvarchar(50), 
	@sotien as nvarchar(50), 
	@conoid as nvarchar(50), 
	@motaid as nvarchar(50), 
	@ngaychi as nvarchar(50), 
	@phuongthuc as nvarchar(50), 
	@nguoichitienid as nvarchar(50)
AS
BEGIN

declare @maxHD as nvarchar(10)
declare @sohd as nvarchar(50)

declare @checkbegin as int
set @checkbegin = (select COUNT (*) FROM [Warehouse_BPS].[dbo].[htSoQuy] where typeHD='0')


if (@checkbegin > 0)
begin
	set @maxHD = (select max(cast(substring(MaHD,4,len(MaHD)-3) as int))+1 from htSoQuy where typeHD='0')
	set @soHD = 'PC_'+@maxHD	

	insert into htSoQuy(typeHD,MaHD,IDketoan,IDnguoinhan,IDkhachhang,IDnhacungcap,psco,psno,Mota,ngaygiaodich,phuongthucTT,Createdate) 
	values('0',@soHD,@nguoichitienid,@guoinhan,'',@nhacc,'',@sotien,@motaid,@ngaychi,@phuongthuc,getdate())


	--update cong no
	
	update htnhacungcap set congnodi=congnodi + cast(@sotien as float) where id = cast(@nhacc as int)

  
	select 1
end
else
begin
	--- truong hop chua co ban ghi nao
	set @maxHD = '1'
	set @soHD = 'PC_'+@maxHD	

	insert into htSoQuy(typeHD,MaHD,IDketoan,IDnguoinhan,IDkhachhang,IDnhacungcap,psco,psno,Mota,ngaygiaodich,phuongthucTT,Createdate) 
	values('0',@soHD,@nguoichitienid,@guoinhan,'',@nhacc,'',@sotien,@motaid,@ngaychi,@phuongthuc,getdate())

	--update cong no nha cung cap
	update htnhacungcap set congnodi=congnodi + cast(@sotien as float) where id = cast(@nhacc as int)
	select 1

end




END
GO
/****** Object:  StoredProcedure [dbo].[NH_getcongno]    Script Date: 04/15/2024 05:17:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_getcongno]
	@idcongno as nvarchar(10),
	@type_cono as nvarchar(10)
AS
BEGIN
	
if(@type_cono = 'phieuchi')
begin
	select congnodi from htnhacungcap where id = cast(@idcongno as int)
end
else
begin
	select congnoden from htkhachhang where id = cast(@idcongno as int)
end
	

END
GO
/****** Object:  StoredProcedure [dbo].[NH_Phieuchi_Phieuthu2]    Script Date: 04/15/2024 05:17:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NH_Phieuchi_Phieuthu2]
	@guoinhan as nvarchar(50), 
	@nhacc as nvarchar(50), 
	@sotien as nvarchar(50), 
	@conoid as nvarchar(50), 
	@motaid as nvarchar(50), 
	@ngaychi as nvarchar(50), 
	@phuongthuc as nvarchar(50), 
	@nguoichitienid as nvarchar(50)
AS
BEGIN

declare @maxHD as nvarchar(10)
declare @sohd as nvarchar(50)

declare @checkbegin as int
set @checkbegin = (select COUNT (*) FROM [Warehouse_BPS].[dbo].[htSoQuy] where typeHD='1')


if (@checkbegin > 0)
begin
	set @maxHD = (select max(cast(substring(MaHD,4,len(MaHD)-3) as int))+1 from htSoQuy where typeHD='1')
	set @soHD = 'PT_'+@maxHD	

	insert into htSoQuy(typeHD,MaHD,IDketoan,IDnguoinhan,IDkhachhang,IDnhacungcap,psco,psno,Mota,ngaygiaodich,phuongthucTT,Createdate) 
	values('1',@soHD,@nguoichitienid,@guoinhan,'',@nhacc,@sotien,'',@motaid,@ngaychi,@phuongthuc,getdate())


	--update cong no
	
	update htkhachhang set congnoden=congnoden + cast(@sotien as float) where id = cast(@nhacc as int)

  
	select 1
end
else
begin
	--- truong hop chua co ban ghi nao
	set @maxHD = '1'
	set @soHD = 'PT_'+@maxHD	

	insert into htSoQuy(typeHD,MaHD,IDketoan,IDnguoinhan,IDkhachhang,IDnhacungcap,psco,psno,Mota,ngaygiaodich,phuongthucTT,Createdate) 
	values('1',@soHD,@nguoichitienid,@guoinhan,'',@nhacc,@sotien,'',@motaid,@ngaychi,@phuongthuc,getdate())

	--update cong no nha cung cap
	update htkhachhang set congnoden=congnoden + cast(@sotien as float) where id = cast(@nhacc as int)
	select 1

end




END
GO
