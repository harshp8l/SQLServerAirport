USE [sd_airport_datamart]
GO

/****** Object:  Table [dbo].[dimFlight]    Script Date: 28-07-2017 17:46:12 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[dimFlight](
	[flight_yfa_id] [int] IDENTITY(1,1) NOT NULL,
	[flight_yfa_name] [varchar](50) NOT NULL,
	[flight_year_key] [int] NOT NULL,
	[flight_year_name] [varchar](50) NOT NULL,
	[flight_airline_key] [int] NOT NULL,
	[flight_airline_name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_dimFlight] PRIMARY KEY CLUSTERED 
(
	[flight_yfa_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


