USE [sd_airport_datamart]
GO

/****** Object:  Table [dbo].[factOrders]    Script Date: 28-07-2017 17:50:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[factOrders](
	[order_id] [int] NOT NULL,
	[geography_id] [int] NOT NULL,
	[day_id] [int] NOT NULL,
	[age_id] [int] NOT NULL,
	[gender_id] [int] NOT NULL,
	[interest_id] [int] NOT NULL,
	[flight_yfa_id] [int] NOT NULL,
	[sub_total] [numeric](8, 2) NOT NULL,
	[tax_total] [numeric](8, 2) NOT NULL,
	[grand_total] [numeric](8, 2) NOT NULL,
	[date_created] [datetime] NOT NULL,
 CONSTRAINT [PK_factOrders] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[factOrders]  WITH CHECK ADD  CONSTRAINT [FK_factOrders_dimAge] FOREIGN KEY([age_id])
REFERENCES [dbo].[dimAge] ([age_id])
GO

ALTER TABLE [dbo].[factOrders] CHECK CONSTRAINT [FK_factOrders_dimAge]
GO

ALTER TABLE [dbo].[factOrders]  WITH CHECK ADD  CONSTRAINT [FK_factOrders_dimFlight] FOREIGN KEY([flight_yfa_id])
REFERENCES [dbo].[dimFlight] ([flight_yfa_id])
GO

ALTER TABLE [dbo].[factOrders] CHECK CONSTRAINT [FK_factOrders_dimFlight]
GO

ALTER TABLE [dbo].[factOrders]  WITH CHECK ADD  CONSTRAINT [FK_factOrders_dimGender] FOREIGN KEY([gender_id])
REFERENCES [dbo].[dimGender] ([gender_id])
GO

ALTER TABLE [dbo].[factOrders] CHECK CONSTRAINT [FK_factOrders_dimGender]
GO

ALTER TABLE [dbo].[factOrders]  WITH CHECK ADD  CONSTRAINT [FK_factOrders_dimGeography] FOREIGN KEY([geography_id])
REFERENCES [dbo].[dimGeography] ([geography_id])
GO

ALTER TABLE [dbo].[factOrders] CHECK CONSTRAINT [FK_factOrders_dimGeography]
GO

ALTER TABLE [dbo].[factOrders]  WITH CHECK ADD  CONSTRAINT [FK_factOrders_dimTime] FOREIGN KEY([day_id])
REFERENCES [dbo].[dimTime] ([day_id])
GO

ALTER TABLE [dbo].[factOrders] CHECK CONSTRAINT [FK_factOrders_dimTime]
GO


