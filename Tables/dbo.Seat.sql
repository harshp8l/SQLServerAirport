SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Seat] (
		[seat_num]      [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[seat_type]     [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		CONSTRAINT [PK_Seat]
		PRIMARY KEY
		CLUSTERED
		([seat_num])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Seat] SET (LOCK_ESCALATION = TABLE)
GO
