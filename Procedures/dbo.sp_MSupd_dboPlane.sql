SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
create procedure dbo.[sp_MSupd_dboPlane]
		@c1 numeric(18,0) = NULL,
		@c2 varchar(50) = NULL,
		@c3 varchar(50) = NULL,
		@c4 numeric(18,0) = NULL,
		@c5 numeric(18,0) = NULL,
		@c6 int = NULL,
		@pkc1 int = NULL,
		@bitmap binary(1)
as
begin  
	declare @primarykey_text nvarchar(100) = ''
if (substring(@bitmap,1,1) & 32 = 32)
begin 
update [dbo].[Plane] set
		[flight_num] = case substring(@bitmap,1,1) & 1 when 1 then @c1 else [flight_num] end,
		[plane_manufacturer] = case substring(@bitmap,1,1) & 2 when 2 then @c2 else [plane_manufacturer] end,
		[material] = case substring(@bitmap,1,1) & 4 when 4 then @c3 else [material] end,
		[num_of_seats] = case substring(@bitmap,1,1) & 8 when 8 then @c4 else [num_of_seats] end,
		[model_num] = case substring(@bitmap,1,1) & 16 when 16 then @c5 else [model_num] end,
		[id] = case substring(@bitmap,1,1) & 32 when 32 then @c6 else [id] end
	where [id] = @pkc1
if @@rowcount = 0
    if @@microsoftversion>0x07320000
		Begin
			
			set @primarykey_text = @primarykey_text + '[id] = ' + convert(nvarchar(100),@pkc1,1)
			exec sp_MSreplraiserror @errorid=20598, @param1=N'[dbo].[Plane]', @param2=@primarykey_text, @param3=13233
		End
end  
else
begin 
update [dbo].[Plane] set
		[flight_num] = case substring(@bitmap,1,1) & 1 when 1 then @c1 else [flight_num] end,
		[plane_manufacturer] = case substring(@bitmap,1,1) & 2 when 2 then @c2 else [plane_manufacturer] end,
		[material] = case substring(@bitmap,1,1) & 4 when 4 then @c3 else [material] end,
		[num_of_seats] = case substring(@bitmap,1,1) & 8 when 8 then @c4 else [num_of_seats] end,
		[model_num] = case substring(@bitmap,1,1) & 16 when 16 then @c5 else [model_num] end
	where [id] = @pkc1
if @@rowcount = 0
    if @@microsoftversion>0x07320000
		Begin
			
			set @primarykey_text = @primarykey_text + '[id] = ' + convert(nvarchar(100),@pkc1,1)
			exec sp_MSreplraiserror @errorid=20598, @param1=N'[dbo].[Plane]', @param2=@primarykey_text, @param3=13233
		End
end 
end 
GO
