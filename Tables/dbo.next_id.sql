SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[next_id] (
		[table_name]        [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[next_id_value]     [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[next_id] SET (LOCK_ESCALATION = TABLE)
GO
