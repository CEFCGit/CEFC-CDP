CREATE TABLE [core].[Investment_Transaction_Type_Dimension](
	[Account_Number] [numeric](3, 0) NOT NULL,
	[Account_Description] [nvarchar](50) NULL,
	[Natural_Account] [nvarchar](5) NULL,
	[Updated_by] [nvarchar](20) NULL,
	[Update_from_TS] [datetime] NOT NULL,
	[Update_to_TS] [datetime] NULL,
	[Update_Reason] [nvarchar](20) NULL,
PRIMARY KEY ([Account_Number] ,	[Update_from_TS] )
)
GO

ALTER TABLE [core].[Investment_Transaction_Type_Dimension] ADD  DEFAULT ('SSIS ETL') FOR [Updated_by]
GO

ALTER TABLE [core].[Investment_Transaction_Type_Dimension] ADD  DEFAULT (NULL) FOR [Update_to_TS]
GO

ALTER TABLE [core].[Investment_Transaction_Type_Dimension] ADD  DEFAULT ('Population process') FOR [Update_Reason]
GO


