SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure dbo.[sp_MSupd_dboAirline]
		@c1 varchar(50) = NULL,
		@c2 numeric(18,0) = NULL,
		@c3 numeric(18,0) = NULL,
		@c4 numeric(18,0) = NULL,
		@c5 int = NULL,
		@c6 int = NULL,
		@pkc1 int = NULL,
		@bitmap binary(1)
as
begin  
	declare @primarykey_text nvarchar(100) = ''
if (substring(@bitmap,1,1) & 32 = 32)
begin 
update [dbo].[Airline] set
		[airline_carrier] = case substring(@bitmap,1,1) & 1 when 1 then @c1 else [airline_carrier] end,
		[pilot_id] = case substring(@bitmap,1,1) & 2 when 2 then @c2 else [pilot_id] end,
		[flight_num] = case substring(@bitmap,1,1) & 4 when 4 then @c3 else [flight_num] end,
		[carry_on_bag_fee] = case substring(@bitmap,1,1) & 8 when 8 then @c4 else [carry_on_bag_fee] end,
		[terminal] = case substring(@bitmap,1,1) & 16 when 16 then @c5 else [terminal] end,
		[id] = case substring(@bitmap,1,1) & 32 when 32 then @c6 else [id] end
	where [id] = @pkc1
if @@rowcount = 0
    if @@microsoftversion>0x07320000
		Begin
			
			set @primarykey_text = @primarykey_text + '[id] = ' + convert(nvarchar(100),@pkc1,1)
			exec sp_MSreplraiserror @errorid=20598, @param1=N'[dbo].[Airline]', @param2=@primarykey_text, @param3=13233
		End
end  
else
begin 
update [dbo].[Airline] set
		[airline_carrier] = case substring(@bitmap,1,1) & 1 when 1 then @c1 else [airline_carrier] end,
		[pilot_id] = case substring(@bitmap,1,1) & 2 when 2 then @c2 else [pilot_id] end,
		[flight_num] = case substring(@bitmap,1,1) & 4 when 4 then @c3 else [flight_num] end,
		[carry_on_bag_fee] = case substring(@bitmap,1,1) & 8 when 8 then @c4 else [carry_on_bag_fee] end,
		[terminal] = case substring(@bitmap,1,1) & 16 when 16 then @c5 else [terminal] end
	where [id] = @pkc1
if @@rowcount = 0
    if @@microsoftversion>0x07320000
		Begin
			
			set @primarykey_text = @primarykey_text + '[id] = ' + convert(nvarchar(100),@pkc1,1)
			exec sp_MSreplraiserror @errorid=20598, @param1=N'[dbo].[Airline]', @param2=@primarykey_text, @param3=13233
		End
end 
end 
GO
