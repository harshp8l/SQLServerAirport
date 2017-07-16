SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Arrival] (
		[flight_num]       [numeric](18, 0) NOT NULL,
		[arrival_time]     [time](7) NOT NULL,
		[arrival_city]     [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[id]               [int] NOT NULL,
		CONSTRAINT [PK_Arrival]
		PRIMARY KEY
		CLUSTERED
		([id])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Arrival]
	WITH CHECK
	ADD CONSTRAINT [FK_Arrival_flight]
	FOREIGN KEY ([flight_num]) REFERENCES [dbo].[flight] ([flight_num])
ALTER TABLE [dbo].[Arrival]
	CHECK CONSTRAINT [FK_Arrival_flight]

GO
ALTER TABLE [dbo].[Arrival] SET (LOCK_ESCALATION = TABLE)
GO
