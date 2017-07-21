SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
create procedure dbo.[sp_MSdel_dboflight]
		@pkc1 numeric(18,0)
as
begin  
	declare @primarykey_text nvarchar(100) = ''
	delete [dbo].[flight] 
	where [flight_num] = @pkc1
if @@rowcount = 0
    if @@microsoftversion>0x07320000
		Begin
			
			set @primarykey_text = @primarykey_text + '[flight_num] = ' + convert(nvarchar(100),@pkc1,1)
			exec sp_MSreplraiserror @errorid=20598, @param1=N'[dbo].[flight]', @param2=@primarykey_text, @param3=13234
		End
end  
GO
