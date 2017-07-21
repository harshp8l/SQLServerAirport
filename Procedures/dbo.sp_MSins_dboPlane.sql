SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
create procedure dbo.[sp_MSins_dboPlane]
    @c1 numeric(18,0),
    @c2 varchar(50),
    @c3 varchar(50),
    @c4 numeric(18,0),
    @c5 numeric(18,0),
    @c6 int
as
begin  
	insert into [dbo].[Plane] (
		[flight_num],
		[plane_manufacturer],
		[material],
		[num_of_seats],
		[model_num],
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
