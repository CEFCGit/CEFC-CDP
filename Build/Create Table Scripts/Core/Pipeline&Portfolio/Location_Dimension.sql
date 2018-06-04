CREATE TABLE [core].[Location_Dimension](
	[ID_Location] [nvarchar](50) NULL,
	[ID_LocationLink] [nvarchar](50) NOT NULL,
	[id_project] [nvarchar](100) NULL,
	[Created_By] [nvarchar](41) NULL,
	[Created_Date] [nvarchar](27) NULL,
	[id_constant] [numeric](2, 0) NULL,
	[Loc_Electorate] [nvarchar](36) NULL,
	[Loc_Postcode] [nvarchar](12) NULL,
	[Loc_State] [nvarchar](20) NULL,
	[Modified_By] [nvarchar](36) NULL,
	[Modified_Date] [nvarchar](27) NULL,
	[Percent_of_Project_Amt] [numeric](5, 2) NULL,
	[Percent_of_Project_tCO2_savings] [numeric](5, 2) NULL,
	[zzzid_organisation] [nvarchar](150) NULL,
	[Updated_by] [nvarchar](20) NULL,
	[Update_from_TS] [datetime] NOT NULL,
	[Update_to_TS] [datetime] NULL,
	[Update_Reason] [nvarchar](20) NULL,
PRIMARY KEY ([ID_LocationLink] ,[Update_from_TS])
)

GO

ALTER TABLE [core].[Location_Dimension] ADD  DEFAULT ('SSIS ETL') FOR [Updated_by]
GO

ALTER TABLE [core].[Location_Dimension] ADD  DEFAULT (NULL) FOR [Update_to_TS]
GO

ALTER TABLE [core].[Location_Dimension] ADD  DEFAULT ('Population process') FOR [Update_Reason]
GO

