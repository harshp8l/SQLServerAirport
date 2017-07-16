SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insert_plane]
	@flight_num numeric(18,0),
	@plane_manufacturer varchar(50),
	@material varchar(50),
	@num_seats numeric(18,0),
	@model_num numeric(18,0) output
as
begin
	begin try
		begin tran
		
		exec sp_get_next_id'Plane', @model_num output

		if (@model_num > 0) 
		begin
			insert plane
			(
				flight_num,
				plane_manufacturer,
				material,
				num_of_seats,
				model_num
			)
			select
				@flight_num,
				@plane_manufacturer,
				@material,
				@num_seats,
				@model_num
		end

		commit
	end try
	begin catch
		-- do some shit
	end catch
end
GO
