create procedure [dbo].[populate_dim_geography]
as
begin
	dbcc checkident('dimGeography', reseed, 0)
	
	delete from dimGeography

	insert dimGeography
	(
		state_key,
		state_name
	)

	select
		ROW_NUMBER() over (order by state),
		state
	from
		sd_report_database.dbo.Customer
	group by
		state
end
