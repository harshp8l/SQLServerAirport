create procedure [dbo].[populate_dim_gender]
as
begin
	dbcc checkident('dimGender', reseed, 0)

	delete from dimGender

	insert dimGender (gender_key, gender_name)
	select 0, 'Unknown'

	insert dimGender (gender_key, gender_name)
	select 1, 'Male'
	
	insert dimGender (gender_key, gender_name)
	select 2, 'Female'
end