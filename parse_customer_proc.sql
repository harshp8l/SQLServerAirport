USE [sd_live_database]
GO
/****** Object:  StoredProcedure [dbo].[parse_customer]    Script Date: 25-07-2017 23:33:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[parse_customer]
AS
BEGIN
	delete from Customer

	declare @customer_id int,
			@id int,
			@first_name varchar(50),
			@last_name varchar(50),
			@address varchar(100),
			@city varchar(50),
			@state varchar(50),
			@zip int,
			@age int,
			@gender char(10),
			@hobby varchar(100),
			@income int,
			@children  int,
			@degree varchar(50),
			@own_house int

	declare curs1 cursor
	for
	select
			first_name,
			last_name,
			address,
			city,
			state,
			zip,
			age,
			gender,
			hobby,
			income,
			children,
			degree,
			ownHouse,
			id 
	
	from [flat_customer]

	open curs1
		fetch next from curs1 into @first_name,@last_name,@address,@city,
								   @state,@zip, @age, @gender,@hobby, @income, 
								   @children, @degree, @own_house, @id
		
		while (@@FETCH_STATUS = 0)
		begin
			if(not exists(select * from Customer where @customer_id=customer_id))
			begin
				insert Customer
				(
					customer_id,
					first_name,
					last_name,
					address,
					city,
					state,
					zip,
					age,
					gender,
					hobby,
					income,
					children,
					degree,
					own_house
				)
				
				select
					@customer_id,
					@first_name,
					@last_name,
					@address,
					@city,
					@state,
					@zip,
					@age,
					@gender,
					@hobby,
					@income,
					@children,
					@degree,
					@own_house
			end

			fetch next from curs1 into @first_name,@last_name,@address,
									   @city,@state,@zip, @age, @gender,
									   @hobby, @income, @children, @degree, 
									   @own_house, @id 
		end

	--deallocate curs1
	close curs1
	deallocate curs1
END
