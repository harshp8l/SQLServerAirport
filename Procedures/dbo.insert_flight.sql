SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insert_flight]
	@flight_num numeric(18,0),
	@pilot_id numeric(18,0),
	@airline_carrier varchar(50),
	@year numeric(18,0)
as
begin

	begin try
		begin tran

		exec sp_get_next_id 'Airline', @flight_num output
		
		if(@flight_num > 0)
		begin
			insert flight
			(
				flight_num,
				pilot_id,
				airline_carrier,
				year
			)
			select
				@flight_num,
				@pilot_id,
				@airline_carrier,
				@year
		end
		
		commit
	end try
	begin catch
		declare @ErrorMessage varchar(200)
		select @ErrorMessage = 'value not found in table'
		RAISERROR (@ErrorMessage, 16, 1);
	end catch
end
GO
