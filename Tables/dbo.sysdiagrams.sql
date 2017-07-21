SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sysdiagrams] (
		[name]             [sysname] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[principal_id]     [int] NOT NULL,
		[diagram_id]       [int] IDENTITY(1, 1) NOT FOR REPLICATION NOT NULL,
		[version]          [int] NULL,
		[definition]       [varbinary](max) NULL,
		CONSTRAINT [UK_principal_name]
		UNIQUE
		NONCLUSTERED
		([principal_id], [name])
		ON [PRIMARY],
		CONSTRAINT [PK__sysdiagr__C2B05B6107EF842B]
		PRIMARY KEY
		CLUSTERED
		([diagram_id])
	ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[sysdiagrams] SET (LOCK_ESCALATION = TABLE)
GO
