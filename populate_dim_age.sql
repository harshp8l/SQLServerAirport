alter procedure [dbo].[populate_dim_age]
as
begin
	DBCC CHECKIDENT('dimAge', RESEED, 0)

	delete from dimAge

	declare @count int
	select @count = 1
	while(@count < 100)
	begin
		insert dimAge(age_key, age_name)
		select @count, @count
		
		select @count = @count + 1
	end

	update dimAge set age_group_key=0, age_group_name = 'Underage'
	where age_key < 18

	update dimAge set age_group_key=1, age_group_name = 'College or young workers'
	where age_key between 18 and 22

	update dimAge set age_group_key=2, age_group_name = 'Professionals'
	where age_key between 23 and 30

	update dimAge set age_group_key=3, age_group_name = 'Very professional'
	where age_key between 31 and 40

	update dimAge set age_group_key=4, age_group_name = 'Middle Age crisis'
	where age_key between 41 and 50

	update dimAge set age_group_key=5, age_group_name = 'Almost retiring'
	where age_key between 51 and 60

	update dimAge set age_group_key=6, age_group_name = 'Retired'
	where age_key > 60
end