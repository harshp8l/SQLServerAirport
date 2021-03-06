USE [sd_airport_db]
GO
/****** Object:  StoredProcedure [dbo].[sp_get_next_id]    Script Date: 21-07-2017 19:40:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[sp_get_next_id]
	@table_name varchar(50),
	@next_id int output

as
begin
	
	select @next_id = -1

	select
		@next_id = next_id_value
	from
		next_id
	where
		table_name = @table_name

	update
		next_id
	set
		next_id_value = next_id_value + 1
	where
		table_name = @table_name
		
end

