SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
create procedure dbo.[sp_MSins_dboflight]
    @c1 numeric(18,0),
    @c2 numeric(18,0),
    @c3 varchar(50),
    @c4 numeric(18,0)
as
begin  
	insert into [dbo].[flight] (
		[flight_num],
		[pilot_id],
		[airline_carrier],
		[year]
	) values (
		@c1,
		@c2,
		@c3,
		@c4	) 
end  
GO
