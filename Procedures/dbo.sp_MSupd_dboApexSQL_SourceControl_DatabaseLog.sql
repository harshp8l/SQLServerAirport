SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
create procedure dbo.[sp_MSupd_dboApexSQL_SourceControl_DatabaseLog]
		@c1 int = NULL,
		@c2 int = NULL,
		@c3 datetime = NULL,
		@c4 nvarchar(50) = NULL,
		@c5 nvarchar(max) = NULL,
		@c6 nvarchar(max) = NULL,
		@c7 nvarchar(255) = NULL,
		@c8 nvarchar(max) = NULL,
		@c9 nvarchar(50) = NULL,
		@c10 nvarchar(255) = NULL,
		@c11 nvarchar(255) = NULL,
		@c12 nvarchar(255) = NULL,
		@c13 nvarchar(max) = NULL,
		@c14 xml = NULL,
		@pkc1 int = NULL,
		@bitmap binary(2)
as
begin  
	declare @primarykey_text nvarchar(100) = ''
update [dbo].[ApexSQL_SourceControl_DatabaseLog] set
		[ObjectID] = case substring(@bitmap,1,1) & 2 when 2 then @c2 else [ObjectID] end,
		[PostTime] = case substring(@bitmap,1,1) & 4 when 4 then @c3 else [PostTime] end,
		[DatabaseUser] = case substring(@bitmap,1,1) & 8 when 8 then @c4 else [DatabaseUser] end,
		[Event] = case substring(@bitmap,1,1) & 16 when 16 then @c5 else [Event] end,
		[SchemaName] = case substring(@bitmap,1,1) & 32 when 32 then @c6 else [SchemaName] end,
		[DatabaseName] = case substring(@bitmap,1,1) & 64 when 64 then @c7 else [DatabaseName] end,
		[ObjectName] = case substring(@bitmap,1,1) & 128 when 128 then @c8 else [ObjectName] end,
		[ObjectType] = case substring(@bitmap,2,1) & 1 when 1 then @c9 else [ObjectType] end,
		[NewObjectName] = case substring(@bitmap,2,1) & 2 when 2 then @c10 else [NewObjectName] end,
		[ParentObjectName] = case substring(@bitmap,2,1) & 4 when 4 then @c11 else [ParentObjectName] end,
		[ParentObjectType] = case substring(@bitmap,2,1) & 8 when 8 then @c12 else [ParentObjectType] end,
		[TSQL] = case substring(@bitmap,2,1) & 16 when 16 then @c13 else [TSQL] end,
		[XmlEvent] = case substring(@bitmap,2,1) & 32 when 32 then @c14 else convert(xml,[XmlEvent]) end
	where [ID] = @pkc1
if @@rowcount = 0
    if @@microsoftversion>0x07320000
		Begin
			
			set @primarykey_text = @primarykey_text + '[ID] = ' + convert(nvarchar(100),@pkc1,1)
			exec sp_MSreplraiserror @errorid=20598, @param1=N'[dbo].[ApexSQL_SourceControl_DatabaseLog]', @param2=@primarykey_text, @param3=13233
		End
end 
GO
