-- =============================================
-- Author:		Rajit Dang, Harsh Patel
-- Create date: 26-07-2017
-- Description:	Populate the order and the order item tables
-- =============================================
alter procedure [dbo].[create_random_orders] 
as
begin
	-- declare variables for popualting order and order_item tables
	declare @lower int,
			@upper int,
			@random int,
			@index int,
			@customer_id int,
			@order_id int,
			@quantity int,
			@date_created datetime,
			@airline_carrier varchar(50),
			@flight_num numeric(18,0)

	-- set index to 0
	set @index = 0

	update next_id set next_value = 10000 where table_name='Order'
	delete from order_item
	delete from Orders

	create table #flight_number_array
	(
		flight_id int,
		flight_num int
	)

	insert into #flight_number_array (flight_id, flight_num) values
				(0, 124), (1, 177), (2, 200), (3, 248), 
				(4, 277), (5, 287), (6,328), (7, 390), 
				(8,432), (9, 439), (10, 469), (11, 526), (12, 600) 

	select * from #flight_number_array
	/*
	while (@index < 200)
	begin
	
		-- retrieving a random customer_id
		select
			@lower = min(customer_id),
			@upper = max(customer_id)
		from
			Customer

		select @random = round(((@upper - @lower - 1) * rand() + @lower), 0)

		-- retrieving a random quantity
		select
			@lower = 1,
			@upper = 4

		select @random = round(((@upper - @lower - 1) * rand() + @lower), 0)
		select @quantity = @random

		-- retrieving a random date
		select
			@lower = 1,
			@upper = 1460

		select @random = round(((@upper - @lower - 1) * rand() + @lower), 0)
		select @date_created = dateadd(day, -@random, GETDATE())

		-- retrieving a random flight_number
		-- create a temp table that stores flight numbers from 0-13
		
	end
	*/
end

