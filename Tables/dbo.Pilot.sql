SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Pilot] (
		[pilot_id]            [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[airline_carrier]     [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[flight_num]          [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		CONSTRAINT [PK_Pilot]
		PRIMARY KEY
		CLUSTERED
		([pilot_id])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Pilot] SET (LOCK_ESCALATION = TABLE)
GO
