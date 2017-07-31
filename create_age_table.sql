USE [sd_airport_datamart]
GO

/****** Object:  Table [dbo].[dimAge]    Script Date: 28-07-2017 17:43:14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[dimAge](
	[age_id] [int] IDENTITY(1,1) NOT NULL,
	[age_key] [int] NOT NULL,
	[age_name] [varchar](50) NOT NULL,
	[age_group_key] [int] NOT NULL,
	[age_group_name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_dimAge] PRIMARY KEY CLUSTERED 
(
	[age_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO