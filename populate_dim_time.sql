alter procedure [dbo].[populate_dim_time]
as
begin
print 'fuck'
	DBCC CHECKIDENT('dimTime', RESEED, 0)

	delete from dimTime

	declare @start_date datetime,
			@end_date datetime,
			@increment datetime

	select @increment = '01/01/2009'
	select @end_date = '12/31/2011'

	while(@increment < @end_date)
	begin
		insert dimTime
		(
			date_key
		)
		select
			@increment
		
		select @increment = DATEADD(DAY, 1, @increment)
		print @increment
		print datepart(weekday, @increment)
	end

	print 'WTF'
	declare @test datetime
	select @test=date_key from dimTime
	--print 'hi'@test
	print 'hello: '+ convert(varchar, datepart(year, @test))

	update dimTime set day_name = CONVERT(varchar(50), date_key, 106)
	update dimTime set year_key = DATEPART(year, date_key)
	update dimTime set year_name = DATEPART(year, date_key)
	print 'here2'
	update dimTime set month_key =
		SUBSTRING(replace(convert(varchar(50), date_key, 102), '.', ''), 0, 7)
	update dimTime set month_name = 
		replace(SUBSTRING(convert(varchar(50), date_key, 106), 4, 8), '','-')

	update dimTime set quarter_key =
		convert(varchar(50), DATEPART(year, date_key))
		+ CONVERT(varchar(50), DATEPART(quarter, date_key))

	update dimTime set quarter_name = 
		'Q' + CONVERT(varchar(50), DATEPART(quarter, date_key))
		+ '-' + convert(varchar(50), DATEPART(year, date_key))

		print 'here3'

	--print datepart(weekday, date_key)
	update dimTime set day_of_week_name = 
		case DATEPART(weekday, date_key)
		when 1 then 'Sunday'
		when 2 then 'Monday'
		when 3 then 'Tuesday'
		when 4 then 'Wednesday'
		when 5 then 'Thursday'
		when 6 then 'Friday'
		when 7 then 'Saturday'
		end
		
	print 'here4'
	declare @test2 int
	select @test2 = DATEPART(weekday, date_key) from dimTime
	print 'day ' + convert(varchar(50), @test2)
end
