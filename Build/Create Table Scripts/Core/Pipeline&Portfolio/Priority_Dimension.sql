CREATE TABLE [core].[Priority_Dimension](
	[Priority_Key] [nvarchar](100) NOT NULL,
	[ID_Priority] [nvarchar](3) NULL,
	[Priority] [nvarchar](36) NULL,
	[Percent] [numeric](3, 0) NULL,
	[constant] [numeric](18, 0) NULL,
	[Sort] [numeric](2, 0) NULL,
	[txt_Priority] [nvarchar](51) NULL,
	[Updated_by] [nvarchar](20) NULL,
	[Update_from_TS] [datetime] NOT NULL,
	[Update_to_TS] [datetime] NULL,
	[Update_Reason] [nvarchar](20) NULL,
 PRIMARY KEY ([Priority_Key] ,[Update_from_TS])
)
GO

ALTER TABLE [core].[Priority_Dimension] ADD  DEFAULT (newid()) FOR [Priority_Key]
GO

ALTER TABLE [core].[Priority_Dimension] ADD  DEFAULT ('SSIS ETL') FOR [Updated_by]
GO

ALTER TABLE [core].[Priority_Dimension] ADD  DEFAULT (NULL) FOR [Update_to_TS]
GO

ALTER TABLE [core].[Priority_Dimension] ADD  DEFAULT ('Population process') FOR [Update_Reason]
GO

