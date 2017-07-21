SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
create procedure dbo.[sp_MSins_dboAirline]
    @c1 varchar(50),
    @c2 numeric(18,0),
    @c3 numeric(18,0),
    @c4 numeric(18,0),
    @c5 int,
    @c6 int
as
begin  
	insert into [dbo].[Airline] (
		[airline_carrier],
		[pilot_id],
		[flight_num],
		[carry_on_bag_fee],
		[terminal],
		[id]
	) values (
		@c1,
		@c2,
		@c3,
		@c4,
		@c5,
		@c6	) 
end  
GO
