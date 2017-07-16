SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Airline] (
		[airline_carrier]      [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[pilot_id]             [numeric](18, 0) NULL,
		[flight_num]           [numeric](18, 0) NOT NULL,
		[carry_on_bag_fee]     [numeric](18, 0) NULL,
		[terminal]             [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[id]                   [int] NOT NULL,
		CONSTRAINT [PK_Airline]
		PRIMARY KEY
		CLUSTERED
		([id])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Airline]
	WITH CHECK
	ADD CONSTRAINT [FK_Airline_flight]
	FOREIGN KEY ([flight_num]) REFERENCES [dbo].[flight] ([flight_num])
ALTER TABLE [dbo].[Airline]
	CHECK CONSTRAINT [FK_Airline_flight]

GO
ALTER TABLE [dbo].[Airline] SET (LOCK_ESCALATION = TABLE)
GO
