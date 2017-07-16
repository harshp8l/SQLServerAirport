SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insert_plane]
	@flight_num numeric(18,0),
	@plane_manufacturer varchar(50),
	@material varchar(50),
	@num_seats numeric(18,0),
	@model_num numeric(18,0)
as
begin
	begin try
		begin tran
		
		declare @id int
		exec sp_get_next_id 'Plane', @id output

		if (@id > 0) 
		begin
			insert plane
			(
				flight_num,
				plane_manufacturer,
				material,
				num_of_seats,
				model_num,
				id
			)
			select
				@flight_num,
				@plane_manufacturer,
				@material,
				@num_seats,
				@model_num,
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
