USE [sd_airport_datamart]
GO

/****** Object:  Table [dbo].[dimGeography]    Script Date: 28-07-2017 17:47:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[dimGeography](
	[geography_id] [int] NOT NULL,
	[state_key] [int] NOT NULL,
	[state_name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_dimGeography] PRIMARY KEY CLUSTERED 
(
	[geography_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


