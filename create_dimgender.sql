USE [sd_airport_datamart]
GO

/****** Object:  Table [dbo].[dimGender]    Script Date: 28-07-2017 17:47:06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[dimGender](
	[gender_id] [int] IDENTITY(1,1) NOT NULL,
	[gender_key] [int] NOT NULL,
	[gender_name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_dimGender] PRIMARY KEY CLUSTERED 
(
	[gender_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


