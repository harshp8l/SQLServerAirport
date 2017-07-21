SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
create procedure dbo.[sp_MSins_dboArrival]
    @c1 numeric(18,0),
    @c2 time,
    @c3 varchar(50),
    @c4 int
as
begin  
	insert into [dbo].[Arrival] (
		[flight_num],
		[arrival_time],
		[arrival_city],
		[id]
	) values (
		@c1,
		@c2,
		@c3,
		@c4	) 
end  
GO
