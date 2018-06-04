CREATE TABLE [core].[Business_Platform_Dimension](
	[BP_key] [nvarchar](100) NOT NULL,
	[Business_Platform] [nvarchar](75) NULL,
	[Sort_Order] [int] NULL,
	[Hex] [nvarchar](15) NULL,
	[ID_Primaryfocus] [int] NULL,
	[Focus__Focus_Area] [nvarchar](128) NULL,
	[Updated_by] [nvarchar](20) NULL,
	[Update_from_TS] [datetime] NOT NULL,
	[Update_to_TS] [datetime] NULL,
	[Update_Reason] [nvarchar](20) NULL,
 PRIMARY KEY([BP_key] ,[Update_from_TS])
)

ALTER TABLE [core].[Business_Platform_Dimension] ADD  DEFAULT (newid()) FOR [BP_key]
GO

ALTER TABLE [core].[Business_Platform_Dimension] ADD  DEFAULT ('SSIS ETL') FOR [Updated_by]
GO

ALTER TABLE [core].[Business_Platform_Dimension] ADD  DEFAULT (NULL) FOR [Update_to_TS]
GO

ALTER TABLE [core].[Business_Platform_Dimension] ADD  DEFAULT ('Population process') FOR [Update_Reason]
GO

