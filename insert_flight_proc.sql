USE [sd_airport_db]
GO
/****** Object:  StoredProcedure [dbo].[insert_flight]    Script Date: 21-07-2017 19:38:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[insert_flight]
	@flight_num numeric(18,0),
	@pilot_id numeric(18,0),
	@airline_carrier varchar(50),
	@year numeric(18,0)
as
begin

	begin try
		begin tran
		print  @flight_num
		print  @pilot_id
		print  @airline_carrier
		print  @year
		
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
