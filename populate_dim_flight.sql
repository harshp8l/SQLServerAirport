USE [sd_airport_datamart]
GO
/****** Object:  StoredProcedure [dbo].[populate_dim_flight]    Script Date: 28-07-2017 22:00:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[populate_dim_flight]
as
begin
	delete from dimFlight
	dbcc checkident('dimFlight', reseed, 0)

	insert dimFlight
	(
		flight_yfa_name,
		flight_year_key,
		flight_year_name,
		flight_airline_name,
		flight_num_key,
		flight_num
	)

	select
		CONVERT(varchar(4), fi.year) + '' + convert(varchar(10), fi.flight_num) + '' + fi.airline_carrier,
		fi.year,
		fi.year,
		fi.airline_carrier,
		fi.flight_num,
		fi.flight_num
	from
		sd_report_database.dbo.order_item oi,
		sd_report_database.dbo.flight fi
	
	where
		oi.flight_num = fi.flight_num
	and oi.airline_carrier = fi.airline_carrier

	group by
		fi.year,
		fi.year,
		fi.airline_carrier,
		fi.flight_num,
		fi.flight_num
end