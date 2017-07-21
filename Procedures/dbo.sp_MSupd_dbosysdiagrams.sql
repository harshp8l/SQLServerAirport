SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
create procedure dbo.[sp_MSupd_dbosysdiagrams]
		@c1 nvarchar(128) = NULL,
		@c2 int = NULL,
		@c3 int = NULL,
		@c4 int = NULL,
		@c5 varbinary(max) = NULL,
		@pkc1 int = NULL,
		@bitmap binary(1)
as
begin  
	declare @primarykey_text nvarchar(100) = ''
update [dbo].[sysdiagrams] set
		[name] = case substring(@bitmap,1,1) & 1 when 1 then @c1 else [name] end,
		[principal_id] = case substring(@bitmap,1,1) & 2 when 2 then @c2 else [principal_id] end,
		[version] = case substring(@bitmap,1,1) & 8 when 8 then @c4 else [version] end,
		[definition] = case substring(@bitmap,1,1) & 16 when 16 then @c5 else [definition] end
	where [diagram_id] = @pkc1
if @@rowcount = 0
    if @@microsoftversion>0x07320000
		Begin
			
			set @primarykey_text = @primarykey_text + '[diagram_id] = ' + convert(nvarchar(100),@pkc1,1)
			exec sp_MSreplraiserror @errorid=20598, @param1=N'[dbo].[sysdiagrams]', @param2=@primarykey_text, @param3=13233
		End
end 
GO
