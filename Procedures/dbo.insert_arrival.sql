SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insert_arrival]
	@arrival_time numeric(18,0),
	@arrival_city varchar(50),
	@flight_num numeric(18,0)
as
begin
	--begin try
		--begin tran
		
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

		--commit
	--end try
	--begin catch
		--IF @@TRANCOUNT > 0
		--	rollback
		--declare @ErrorMessage varchar(200)
		--select @ErrorMessage = 'value not found in table'
		--RAISERROR (@ErrorMessage, 16, 1);
	--end catch
end
GO
