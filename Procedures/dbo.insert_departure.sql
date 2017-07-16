SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insert_departure]
	@departure_time numeric(18,0) output,
	@departure_city varchar(50),
	@flight_num numeric(18,0)
as
begin
	begin try
		begin tran
		
		exec sp_get_next_id 'Departure', @departure_time output

		if (@departure_city <> '') 
		begin
			insert Departure
			(
				departure_time,
				departure_city,
				flight_num
			)
			select
				@departure_time,
				@departure_city,
				@flight_num
		end

		commit
	end try
	begin catch
		-- do some shit
	end catch
end
GO
