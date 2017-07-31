USE [sd_airport_datamart]
GO

/****** Object:  Table [dbo].[dimTime]    Script Date: 28-07-2017 17:48:31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[dimTime](
	[day_id] [int] IDENTITY(1,1) NOT NULL ,
	[date_key] [int] NOT NULL,
	[day_name] [varchar](50) NOT NULL,
	[month_key] [int] NOT NULL,
	[month_name] [varchar](50) NOT NULL,
	[year_key] [int] NOT NULL,
	[year_name] [varchar](50) NOT NULL,
	[quarter_key] [int] NOT NULL,
	[quarter_name] [varchar](50) NOT NULL,
	[day_of_week_name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_dimTime] PRIMARY KEY CLUSTERED 
(
	[day_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


