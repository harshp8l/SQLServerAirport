SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
create procedure dbo.[sp_MSins_dboApexSQL_SourceControl_DatabaseLog]
    @c1 int,
    @c2 int,
    @c3 datetime,
    @c4 nvarchar(50),
    @c5 nvarchar(max),
    @c6 nvarchar(max),
    @c7 nvarchar(255),
    @c8 nvarchar(max),
    @c9 nvarchar(50),
    @c10 nvarchar(255),
    @c11 nvarchar(255),
    @c12 nvarchar(255),
    @c13 nvarchar(max),
    @c14 xml
as
begin  
	insert into [dbo].[ApexSQL_SourceControl_DatabaseLog] (
		[ID],
		[ObjectID],
		[PostTime],
		[DatabaseUser],
		[Event],
		[SchemaName],
		[DatabaseName],
		[ObjectName],
		[ObjectType],
		[NewObjectName],
		[ParentObjectName],
		[ParentObjectType],
		[TSQL],
		[XmlEvent]
	) values (
		@c1,
		@c2,
		@c3,
		@c4,
		@c5,
		@c6,
		@c7,
		@c8,
		@c9,
		@c10,
		@c11,
		@c12,
		@c13,
		@c14	) 
end  
GO
