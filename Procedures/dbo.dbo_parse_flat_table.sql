SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[dbo_parse_flat_table]
as
begin
	delete from flight
	delete from Airline
	delete from Plane
	delete from Arrival
	delete from Departure

	--declare variables
	declare @flight_num	numeric(18,0),
			@pilot_id	numeric(18,0),
			@airline_carrier varchar(50),
			@year numeric(18,0),
			@carry_on_bag_fee numeric(18,0),
			@terminal nchar(10),
			@arrival_time numeric(18,0),
			@arrival_city varchar(50),
			@departure_time numeric(18,0),
			@departure_city varchar(50),
			@plane_manufacturer varchar(50),
			@material varchar(50),
			@num_of_seats numeric(18,0),
			@model_num numeric(18,0)

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

	from [sd_airport_flat_table - flat_table]

	open curs1
		fetch next from curs1 into @flight_num, @pilot_id, @airline_carrier, @year, @carry_on_bag_fee, @terminal, @arrival_time, @arrival_city, @departure_time, @departure_city, @plane_manufacturer, @material, @num_of_seats, @model_num
		while (@@FETCH_STATUS = 0)
		begin
			if(not exists(select * from flight where flight_num=@flight_num))
			begin
				exec insert_flight @flight_num, @pilot_id, @airline_carrier, @year
			end

			if(not exists(select * from Airline where airline_carrier=@airline_carrier AND flight_num=@flight_num))
			begin
				exec insert_airline @flight_num, @pilot_id, @airline_carrier, @carry_on_bag_fee
			end

			if(not exists(select * from Plane where flight_num=@flight_num AND model_num=@model_num))
			begin
				exec insert_plane @flight_num, @plane_manufacturer, @material, @num_of_seats, @model_num
			end

			if(not exists(select * from Arrival where flight_num=@flight_num AND arrival_time=@arrival_time AND arrival_city=@arrival_city))
			begin
				exec insert_arrival @flight_num, @arrival_time, @arrival_city
			end

			if(not exists(select * from Departure where flight_num=@flight_num AND departure_time=@departure_time AND departure_city=@departure_city))
			begin
				exec insert_departure @flight_num, @departure_time, @departure_city
			end
		
			fetch next from curs1 into @flight_num, @pilot_id, @airline_carrier, @year, @carry_on_bag_fee, @terminal, @arrival_time, @arrival_city, @departure_time, @departure_city, @plane_manufacturer, @material, @num_of_seats, @model_num
		end

	--deallocate curs1
	close curs1
	deallocate curs1
end
GO
