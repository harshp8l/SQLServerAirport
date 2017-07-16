SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Plane] (
		[flight_num]             [numeric](18, 0) NOT NULL,
		[plane_manufacturer]     [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[material]               [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[num_of_seats]           [numeric](18, 0) NULL,
		[model_num]              [numeric](18, 0) NOT NULL,
		[id]                     [int] NOT NULL,
		CONSTRAINT [PK_Plane]
		PRIMARY KEY
		CLUSTERED
		([id])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Plane]
	WITH CHECK
	ADD CONSTRAINT [FK_Plane_flight]
	FOREIGN KEY ([flight_num]) REFERENCES [dbo].[flight] ([flight_num])
ALTER TABLE [dbo].[Plane]
	CHECK CONSTRAINT [FK_Plane_flight]

GO
ALTER TABLE [dbo].[Plane] SET (LOCK_ESCALATION = TABLE)
GO
