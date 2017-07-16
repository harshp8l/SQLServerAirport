SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insert_airline]
	@flight_num numeric(18,0),
	@pilot_id numeric(18,0),
	@airline_carrier varchar(50),
	@carry_on_bag_fee numeric(18,0)
as
begin

	begin try
		begin tran

		exec sp_get_next_id 'Airline', @flight_num output
		
		if(@flight_num > 0)
		begin
			insert Airline
			(
				airline_carrier,
				pilot_id,
				flight_num,
				carry_on_bag_fee
			)
			select
				@flight_num,
				@pilot_id,
				@airline_carrier,
				@carry_on_bag_fee
		end
		
		commit
	end try
	begin catch
		-- do something
	end catch
end
GO
