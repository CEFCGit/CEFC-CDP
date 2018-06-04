CREATE TABLE [core].[Focus_Dimension](
	[ID_Focus] [numeric](18, 0) NOT NULL,
	[code] [nvarchar](10) NULL,
	[Created_By] [nvarchar](27) NULL,
	[Created_Date] [nvarchar](27) NULL,
	[Description] [nvarchar](128) NULL,
	[Focus_Area] [nvarchar](128) NULL,
	[id_constant] [numeric](2, 0) NULL,
	[Lead] [nvarchar](50) NULL,
	[Modified_By] [nvarchar](32) NULL,
	[Modified_Date] [nvarchar](46) NULL,
	[Sort_Order] [numeric](2, 0) NULL,
	[temp_ID] [nvarchar](50) NULL,
	[Updated_by] [nvarchar](20) NULL,
	[Update_from_TS] [datetime] NOT NULL,
	[Update_to_TS] [datetime] NULL,
	[Update_Reason] [nvarchar](20) NULL,
	PRIMARY KEY([ID_Focus] ,[Update_from_TS]) 
)
GO

ALTER TABLE [core].[Focus_Dimension] ADD  DEFAULT ('SSIS ETL') FOR [Updated_by]
GO

ALTER TABLE [core].[Focus_Dimension] ADD  DEFAULT (NULL) FOR [Update_to_TS]
GO

ALTER TABLE [core].[Focus_Dimension] ADD  DEFAULT ('Population process') FOR [Update_Reason]
GO

