USE [sd_airport_db]
GO
/****** Object:  StoredProcedure [dbo].[insert_arrival]    Script Date: 21-07-2017 19:37:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[insert_arrival]
	@arrival_time time(7),
	@arrival_city varchar(50),
	@flight_num numeric(18,0)
as
begin
	begin try
		begin tran
		
		declare @id int
		exec sp_get_next_id 'Arrival', @id output

		if (@id > 0) 
		begin
			insert Arrival
			(
				arrival_time,
				arrival_city,
				flight_num,
				id
			)
			select
				@arrival_time,
				@arrival_city,
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
