SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
create procedure dbo.[sp_MSins_dbosysdiagrams]
    @c1 nvarchar(128),
    @c2 int,
    @c3 int,
    @c4 int,
    @c5 varbinary(max)
as
begin  
	insert into [dbo].[sysdiagrams] (
		[name],
		[principal_id],
		[diagram_id],
		[version],
		[definition]
	) values (
		@c1,
		@c2,
		@c3,
		@c4,
		@c5	) 
end  
GO
