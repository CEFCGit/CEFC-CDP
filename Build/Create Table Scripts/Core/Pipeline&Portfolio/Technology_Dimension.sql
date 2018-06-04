CREATE TABLE [core].[Technology_Dimension](
	[Created_Date] [nvarchar](20) NULL,
	[Modified_Date] [nvarchar](20) NULL,
	[Modified_By] [nvarchar](30) NULL,
	[Created_By] [nvarchar](30) NULL,
	[ID_Technology] [nvarchar](6) NULL,
	[ID_Project] [nvarchar](100) NULL,
	[ID_Organisation] [nvarchar](3) NULL,
	[cTechnology] [nvarchar](100) NULL,
	[Technology_Description] [nvarchar](100) NULL,
	[ID_TechnologyLink] [nvarchar](10) NOT NULL,
	[Percent_of_Project_Amt] [numeric](5, 2) NULL,
	[Percent_of_Project_tCO2_savings] [numeric](5, 2) NULL,
	[Tec_CEFC_Section] [nvarchar](50) NULL,
	[Tec_Technology] [nvarchar](50) NULL,
	[Tec_Category_Equipment] [nvarchar](50) NULL,
	[id_constant] [nvarchar](3) NULL,
	[temp_ID] [nvarchar](50) NULL,
	[temp_ID_old] [nvarchar](50) NULL,
	[xxxPercent_renewable] [numeric](5, 2) NULL,
	[Percent_renewable_calc] [numeric](5, 2) NULL,
	[Updated_by] [nvarchar](20) NULL,
	[Update_from_TS] [datetime] NOT NULL,
	[Update_to_TS] [datetime] NULL,
	[Update_Reason] [nvarchar](20) NULL,
PRIMARY KEY([ID_TechnologyLink] ,[Update_from_TS])

)
GO

ALTER TABLE [core].[Technology_Dimension] ADD  DEFAULT ('SSIS ETL') FOR [Updated_by]
GO

ALTER TABLE [core].[Technology_Dimension] ADD  DEFAULT (NULL) FOR [Update_to_TS]
GO

ALTER TABLE [core].[Technology_Dimension] ADD  DEFAULT ('Population process') FOR [Update_Reason]
GO

