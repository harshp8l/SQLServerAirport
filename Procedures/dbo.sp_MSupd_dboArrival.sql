SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
create procedure dbo.[sp_MSupd_dboArrival]
		@c1 numeric(18,0) = NULL,
		@c2 time = NULL,
		@c3 varchar(50) = NULL,
		@c4 int = NULL,
		@pkc1 int = NULL,
		@bitmap binary(1)
as
begin  
	declare @primarykey_text nvarchar(100) = ''
if (substring(@bitmap,1,1) & 8 = 8)
begin 
update [dbo].[Arrival] set
		[flight_num] = case substring(@bitmap,1,1) & 1 when 1 then @c1 else [flight_num] end,
		[arrival_time] = case substring(@bitmap,1,1) & 2 when 2 then @c2 else [arrival_time] end,
		[arrival_city] = case substring(@bitmap,1,1) & 4 when 4 then @c3 else [arrival_city] end,
		[id] = case substring(@bitmap,1,1) & 8 when 8 then @c4 else [id] end
	where [id] = @pkc1
if @@rowcount = 0
    if @@microsoftversion>0x07320000
		Begin
			
			set @primarykey_text = @primarykey_text + '[id] = ' + convert(nvarchar(100),@pkc1,1)
			exec sp_MSreplraiserror @errorid=20598, @param1=N'[dbo].[Arrival]', @param2=@primarykey_text, @param3=13233
		End
end  
else
begin 
update [dbo].[Arrival] set
		[flight_num] = case substring(@bitmap,1,1) & 1 when 1 then @c1 else [flight_num] end,
		[arrival_time] = case substring(@bitmap,1,1) & 2 when 2 then @c2 else [arrival_time] end,
		[arrival_city] = case substring(@bitmap,1,1) & 4 when 4 then @c3 else [arrival_city] end
	where [id] = @pkc1
if @@rowcount = 0
    if @@microsoftversion>0x07320000
		Begin
			
			set @primarykey_text = @primarykey_text + '[id] = ' + convert(nvarchar(100),@pkc1,1)
			exec sp_MSreplraiserror @errorid=20598, @param1=N'[dbo].[Arrival]', @param2=@primarykey_text, @param3=13233
		End
end 
end 
GO
