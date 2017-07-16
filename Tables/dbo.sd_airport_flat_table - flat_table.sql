SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sd_airport_flat_table - flat_table] (
		[year]                   [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[flight_num]             [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[airline_carrier]        [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[departure_time]         [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[departure_city]         [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[arrival_time]           [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[arrival_city]           [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[terminal]               [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[pilot_id]               [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[carry_on_bag_fee]       [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[plane_manufacturer]     [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[model_num]              [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[num_of_seats]           [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[material]               [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[sd_airport_flat_table - flat_table] SET (LOCK_ESCALATION = TABLE)
GO
