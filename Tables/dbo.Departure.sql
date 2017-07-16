SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Departure] (
		[flight_num]         [numeric](18, 0) NOT NULL,
		[departure_time]     [numeric](18, 0) NOT NULL,
		[departure_city]     [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		CONSTRAINT [PK_Departure]
		PRIMARY KEY
		CLUSTERED
		([flight_num], [departure_time], [departure_city])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Departure]
	WITH CHECK
	ADD CONSTRAINT [FK_Departure_flight]
	FOREIGN KEY ([flight_num]) REFERENCES [dbo].[Flight] ([flight_num_])
ALTER TABLE [dbo].[Departure]
	CHECK CONSTRAINT [FK_Departure_flight]

GO
ALTER TABLE [dbo].[Departure] SET (LOCK_ESCALATION = TABLE)
GO