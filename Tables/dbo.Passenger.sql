SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Passenger] (
		[SSN]            [numeric](18, 0) NOT NULL,
		[first_name]     [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[last_name]      [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[seat_num]       [numeric](18, 0) NULL,
		[seat_type]      [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[flight_num]     [numeric](18, 0) NULL,
		CONSTRAINT [PK_Passenger]
		PRIMARY KEY
		CLUSTERED
		([SSN])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Passenger] SET (LOCK_ESCALATION = TABLE)
GO
