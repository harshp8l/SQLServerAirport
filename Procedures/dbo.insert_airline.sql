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
		
		declare @id int		
		exec sp_get_next_id 'Airline', @id output
		
		if(@id > 0)
		begin
			insert Airline
			(
				airline_carrier,
				pilot_id,
				flight_num,
				carry_on_bag_fee,
				id
			)
			select
				@airline_carrier,
				@flight_num,
				@pilot_id,
				@carry_on_bag_fee,
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
