SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[dbo_parse_flat_table]
as
begin
	delete from Arrival
	delete from Departure
	delete from Airline
	delete from Plane
	delete from flight

	--declare variables
	declare @flight_num	numeric(18,0),
			@pilot_id	numeric(18,0),
			@airline_carrier varchar(50),
			@year numeric(18,0),
			@carry_on_bag_fee numeric(18,0),
			@terminal int,
			@arrival_time time(7),
			@arrival_city varchar(50),
			@departure_time time(7),
			@departure_city varchar(50),
			@plane_manufacturer varchar(50),
			@material varchar(50),
			@num_of_seats numeric(18,0),
			@model_num numeric(18,0)

	declare @id int

	declare curs1 cursor
	for
	select
		flight_num,
		pilot_id,
		airline_carrier,
		year,
		carry_on_bag_fee,
		terminal,
		arrival_time,
		arrival_city,
		departure_time,
		departure_city,
		plane_manufacturer,
		material,
		num_of_seats,
		model_num

	from [sd_airport_flat_table]

	open curs1
		fetch next from curs1 into @flight_num, @pilot_id, @airline_carrier, @year, @carry_on_bag_fee, @terminal, @arrival_time, @arrival_city, @departure_time, @departure_city, @plane_manufacturer, @material, @num_of_seats, @model_num
		while (@@FETCH_STATUS = 0)
		begin
			
			--inserting flight
			if(not exists(select * from flight where flight_num=@flight_num))
			begin
				exec insert_flight @flight_num, @pilot_id, @airline_carrier, @year
			end

			--inserting airline
			select
				@id = null

			select
				@id = id
			from
				Airline
			where
				flight_num = @flight_num
			AND	airline_carrier = @airline_carrier

			if (@id is null)
			begin
				exec insert_airline @flight_num, @pilot_id, @airline_carrier, @terminal, @carry_on_bag_fee
			end

			--inserting plane
			select
				@id = null

			select
				@id = id
			from
				Plane
			where
				flight_num = @flight_num
			AND	model_num = @model_num

			if (@id is null)
			begin
				exec insert_plane @flight_num, @plane_manufacturer, @material, @num_of_seats, @model_num
			end

			--inserting arrival 
			select
				@id = null

			select
				@id = id
			from
				Arrival
			where
				flight_num = @flight_num
			AND	arrival_time = @arrival_time
			AND arrival_city = @arrival_city

			if (@id is null)
			begin
				exec insert_arrival @arrival_time, @arrival_city, @flight_num
			end

			--inserting departure
			select
				@id = null

			select
				@id = id
			from
				Departure
			where
				flight_num = @flight_num
			AND	departure_time = @departure_time
			AND departure_city = @departure_city

			if (@id is null)
			begin
				exec insert_departure @departure_time, @departure_city, @flight_num
			end
			
			fetch next from curs1 into @flight_num, @pilot_id, @airline_carrier, @year, @carry_on_bag_fee, @terminal, @arrival_time, @arrival_city, @departure_time, @departure_city, @plane_manufacturer, @material, @num_of_seats, @model_num
		end

	--deallocate curs1
	close curs1
	deallocate curs1
end
GO
