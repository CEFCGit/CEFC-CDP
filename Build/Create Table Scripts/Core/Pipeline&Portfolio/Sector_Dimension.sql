CREATE TABLE [core].[Sector_Dimension](
	[ID_Client_Sector] [numeric](18, 0) NOT NULL,
	[ID_PrimaryFocus] [nvarchar](10) NULL,
	[Business_Platform] [nvarchar](75) NULL,
	[cColour] [nvarchar](10) NULL,
	[cFocus] [nvarchar](128) NULL,
	[Created_By] [nvarchar](27) NULL,
	[Created_Date] [nvarchar](46) NULL,
	[ctColour] [nvarchar](10) NULL,
	[Decarbonisationpathway] [nvarchar](82) NULL,
	[DecarbonisationSector] [nvarchar](128) NULL,
	[Description] [nvarchar](89) NULL,
	[ED] [nvarchar](32) NULL,
	[icon] [nvarchar](50) NULL,
	[id_constant] [numeric](2, 0) NULL,
	[Lead] [nvarchar](36) NULL,
	[Modified_By] [nvarchar](27) NULL,
	[Modified_Date] [nvarchar](27) NULL,
	[Sort_Order] [numeric](2, 0) NULL,
	[Strategic_Priority_Area] [nvarchar](58) NULL,
	[Strategic_sector] [nvarchar](75) NULL,
	[tColour] [nvarchar](15) NULL,
	[temp_ID] [nvarchar](50) NULL,
	[Updated_by] [nvarchar](20) NULL,
	[Update_from_TS] [datetime] NOT NULL,
	[Update_to_TS] [datetime] NULL,
	[Update_Reason] [nvarchar](20) NULL,
 PRIMARY KEY ([ID_Client_Sector] ,[Update_from_TS])
 )


ALTER TABLE [core].[Sector_Dimension] ADD  DEFAULT ('SSIS ETL') FOR [Updated_by]
GO

ALTER TABLE [core].[Sector_Dimension] ADD  DEFAULT (NULL) FOR [Update_to_TS]
GO

ALTER TABLE [core].[Sector_Dimension] ADD  DEFAULT ('Population process') FOR [Update_Reason]
GO

