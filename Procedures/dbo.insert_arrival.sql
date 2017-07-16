SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insert_arrival]
	@arrival_time numeric(18,0) output,
	@arrival_city varchar(50),
	@flight_num numeric(18,0)
as
begin
	begin try
		begin tran
		
		exec sp_get_next_id 'Arrival', @arrival_time output

		if (@arrival_time > 0) 
		begin
			insert Arrival
			(
				arrival_time,
				arrival_city,
				flight_num
			)
			select
				@arrival_time,
				@arrival_city,
				@flight_num
		end

		commit
	end try
	begin catch
		-- do some shit
	end catch
end
GO
