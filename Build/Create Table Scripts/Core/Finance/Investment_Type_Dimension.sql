CREATE TABLE [core].[Investment_Type_Dimension](
	[Account_Number] [numeric](3, 0) NOT NULL,
	[Account_Description] [nvarchar](70) NULL,
	[Loan_Category] [nvarchar](50) NULL,
	[Updated_by] [nvarchar](20) NULL,
	[Update_from_TS] [datetime] NOT NULL,
	[Update_to_TS] [datetime] NULL,
	[Update_Reason] [nvarchar](20) NULL,
PRIMARY KEY ([Account_Number] ,[Update_from_TS])
)
GO

ALTER TABLE [core].[Investment_Type_Dimension] ADD  DEFAULT ('SSIS ETL') FOR [Updated_by]
GO

ALTER TABLE [core].[Investment_Type_Dimension] ADD  DEFAULT (NULL) FOR [Update_to_TS]
GO

ALTER TABLE [core].[Investment_Type_Dimension] ADD  DEFAULT ('Population process') FOR [Update_Reason]
GO

