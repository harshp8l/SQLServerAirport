SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insert_departure]
	@departure_time time(7),
	@departure_city varchar(50),
	@flight_num numeric(18,0)
as
begin
	begin try
		begin tran
		
		declare @id int
		exec sp_get_next_id 'Departure', @id output

		if (@id > 0) 
		begin
			insert Departure
			(
				departure_time,
				departure_city,
				flight_num,
				id
			)
			select
				@departure_time,
				@departure_city,
				@flight_num,
				@id
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
