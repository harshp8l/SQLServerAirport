USE [sd_live_database]
GO
/****** Object:  StoredProcedure [dbo].[create_random_orders]    Script Date: 28-07-2017 22:12:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Rajit Dang, Harsh Patel
-- Create date: 26-07-2017
-- Description:	Populate the order and the order item tables
-- =============================================
ALTER procedure [dbo].[create_random_orders] 
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
			@flight_num numeric(18,0),
			@ticket_price numeric(8,2),
			@child numeric(8,2) = 80.40,
			@adult numeric(8,2) = 100.39,
			@coin_prob float = 0.5,
			@random_number float = null

	-- set index to 0
	set @index = 0

	update next_id set next_value = 10000 where table_name='Orders'
	delete from order_item	
	delete from Orders


	-- Create a temp table to store all the flight numbers that appear on the
	-- database
	create table #flight_number_array
	(
		flight_id int,
		flight_number int
	)

	-- insert all unique flight_nunbers in the temp table for random generation
	insert into #flight_number_array (flight_id, flight_number) values
				(0, 124), (1, 177), (2, 200), (3, 248), 
				(4, 277), (5, 287), (6,328), (7, 390), 
				(8,432), (9, 439), (10, 469), (11, 526), (12, 600) 

	select * from #flight_number_array
	

	create table #airline_array
	(
		carrier_id int,
		airline_carrier varchar(50)
	)

	insert into #airline_array (carrier_id, airline_carrier) values
			(0, 'Alaska Airlines'), (1, 'American Airlines'),
			(2, 'Delta'), (3, 'Frontier'), (4, 'Jet Blue'), (5, 'Spirit'), 
			(6, 'Southwest'), (7, 'United Airline'), (8, 'Virigin America')
	
	select * from #airline_array
	
	while (@index < 20000)
	begin
	
		-- retrieving a random customer_id
		select
			@lower = min(customer_id),
			@upper = max(customer_id)
		from
			Customer

		select @random = round(((@upper - @lower - 1) * rand() + @lower), 0)
		select @customer_id = @random
		-- retrieving a random quantity
		select
			@lower = 1,
			@upper = 4

		select @random = round(((@upper - @lower - 1) * rand() + @lower), 0)
		select @quantity = @random

		-- retrieving a random date
		select
			@lower = 1,
			@upper = 730

		select @random = round(((@upper - @lower - 1) * rand() + @lower), 0)
		select @date_created = dateadd(day, -@random, GETDATE())

		-- retrieving a random flight_number
		select
			@lower = 0,
			@upper = 12

		select @random = round(((@upper - @lower - 1) * rand() + @lower), 0)
		set @flight_num = (select flight_number from #flight_number_array where flight_id = @random)

		--retrieving a random Airline Carrier
		select 
			@lower = 0,
			@upper = 8

		
		select @random = round(((@upper - @lower - 1) * rand() + @lower), 0)
		select @airline_carrier = (select airline_carrier from #airline_array where carrier_id = @random)
		print @airline_carrier

		--retrieve a random ticket price its either $80.40 or $100.39
		set @random_number = rand()
		/*
		select 
            @random_number,
            case
                when @random_number >= @coin_prob then (@ticket_price = @adult)
                else @c
            end,
            case
                when @random_number >= @coin_prob then 0
                else null
            end;
		*/
		if(@random_number >= @coin_prob)
		begin
			select @ticket_price = @adult
		end
		
		else
		begin
			select @ticket_price = @child
		end		

		exec sp_get_next_id 'Orders',  @order_id output

		--insert in order table
		insert Orders
		(
			order_id,
			customer_id,
			sub_total,
			tax_total,
			grand_total,
			date_created	
		)

		select
			@order_id,
			@customer_id,
			0,
			0,
			0,
			@date_created
		
		-- insert in order_item table
		insert order_item
		(
			order_id,
			flight_num,
			airline_carrier,
			quantity,
			ticket_price
		)

		select
			@order_id,
			@flight_num,
			@airline_carrier,
			@quantity,
			@ticket_price

		update 
			Orders
		set
			sub_total = oi.ticket_price * oi.quantity
		from 
			order_item oi,
			Orders o

		where 
			o.order_id = @order_id and
			o.order_id = oi.order_id

		update
			Orders
		set
			tax_total = sub_total * 0.0875
		from
			Orders o,
			Customer c
		where
			o.order_id = @order_id
		and o.customer_id = @customer_id
		and o.customer_id = c.customer_id

		update
			Orders
		set
			grand_total = sub_total + tax_total
		where
			order_id = @order_id

		set @index = @index + 1
	end	
end


