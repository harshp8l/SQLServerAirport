SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
create procedure dbo.[sp_MSupd_dboflight]
		@c1 numeric(18,0) = NULL,
		@c2 numeric(18,0) = NULL,
		@c3 varchar(50) = NULL,
		@c4 numeric(18,0) = NULL,
		@pkc1 numeric(18,0) = NULL,
		@bitmap binary(1)
as
begin  
	declare @primarykey_text nvarchar(100) = ''
if (substring(@bitmap,1,1) & 1 = 1)
begin 
update [dbo].[flight] set
		[flight_num] = case substring(@bitmap,1,1) & 1 when 1 then @c1 else [flight_num] end,
		[pilot_id] = case substring(@bitmap,1,1) & 2 when 2 then @c2 else [pilot_id] end,
		[airline_carrier] = case substring(@bitmap,1,1) & 4 when 4 then @c3 else [airline_carrier] end,
		[year] = case substring(@bitmap,1,1) & 8 when 8 then @c4 else [year] end
	where [flight_num] = @pkc1
if @@rowcount = 0
    if @@microsoftversion>0x07320000
		Begin
			
			set @primarykey_text = @primarykey_text + '[flight_num] = ' + convert(nvarchar(100),@pkc1,1)
			exec sp_MSreplraiserror @errorid=20598, @param1=N'[dbo].[flight]', @param2=@primarykey_text, @param3=13233
		End
end  
else
begin 
update [dbo].[flight] set
		[pilot_id] = case substring(@bitmap,1,1) & 2 when 2 then @c2 else [pilot_id] end,
		[airline_carrier] = case substring(@bitmap,1,1) & 4 when 4 then @c3 else [airline_carrier] end,
		[year] = case substring(@bitmap,1,1) & 8 when 8 then @c4 else [year] end
	where [flight_num] = @pkc1
if @@rowcount = 0
    if @@microsoftversion>0x07320000
		Begin
			
			set @primarykey_text = @primarykey_text + '[flight_num] = ' + convert(nvarchar(100),@pkc1,1)
			exec sp_MSreplraiserror @errorid=20598, @param1=N'[dbo].[flight]', @param2=@primarykey_text, @param3=13233
		End
end 
end 
GO
