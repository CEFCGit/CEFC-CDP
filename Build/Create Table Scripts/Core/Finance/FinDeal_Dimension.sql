CREATE TABLE [core].[FinDeal_Dimension](
	[Account_Number] [nvarchar](5) NOT NULL,
	[Account_Description] [nvarchar](100) NULL,
	[Project_Name] [nvarchar](50) NULL,
	[Geographic_Location] [nvarchar](4) NULL,
	[Entity] [numeric](3, 0) NULL,
	[Cost_Centre] [numeric](5, 0) NULL,
	[Investment_Type] [numeric](3, 0) NULL,
	[Technology_Type] [numeric](3, 0) NULL,
	[iMart_TNum] [nvarchar](10) NULL,
	[PBR_Govt_Bond_Rate] [numeric](15, 6) NULL,
	[First_Draw_Date] [nvarchar](20) NULL,
	[Initial_Commitment] [numeric](15, 6) NULL,
	[Commitment_Changes] [numeric](15, 6) NULL,
	[Mandate] [numeric](3, 0) NULL,
	[Platform] [nvarchar](5) NULL,
	[AASB9_Subcategory] [nvarchar](5) NULL,
	[Phase] [nvarchar](20) NULL,
	[SCR] [nvarchar](10) NULL,
	[Performance_Rating] [nvarchar](5) NULL,
	[Commitment_Category] [nvarchar](20) NULL,
	[Updated_by] [nvarchar](20) NULL,
	[Update_from_TS] [datetime] NOT NULL,
	[Update_to_TS] [datetime] NULL,
	[Update_Reason] [nvarchar](20) NULL,
PRIMARY KEY ([Account_Number] ,[Update_from_TS])
)

ALTER TABLE [core].[FinDeal_Dimension] ADD  DEFAULT ('SSIS ETL') FOR [Updated_by]
GO

ALTER TABLE [core].[FinDeal_Dimension] ADD  DEFAULT (NULL) FOR [Update_to_TS]
GO

ALTER TABLE [core].[FinDeal_Dimension] ADD  DEFAULT ('Population process') FOR [Update_Reason]
GO

