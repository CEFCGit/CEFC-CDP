create table [core].[Assets_Dimension]
(
    [ID_Project] nvarchar(100),
	[Contract_Number] nvarchar(50),
	[Asset_Number] nvarchar(20),
	[Category] nvarchar(50), 
	[Description] nvarchar(100),
	[Variant] nvarchar(50), 
	[Make] nvarchar(100),
	[Model] nvarchar(100),
	[Year] nvarchar(4),
	[Status] nvarchar(20),
	[FileDate] nvarchar(20),
	[Updated_by] nvarchar(20) ,
	[Update_from_TS] datetime ,
	[Update_to_TS] datetime ,
	[Update_Reason] nvarchar(20),
	PRIMARY KEY ([ID_Project],[Contract_Number],[Asset_Number],[Description],[Update_from_TS])
)

ALTER TABLE [core].[Assets_Dimension] ADD  DEFAULT ('SSIS ETL') FOR [Updated_by]
GO

ALTER TABLE [core].[Assets_Dimension] ADD  DEFAULT (NULL) FOR [Update_to_TS]
GO

ALTER TABLE [core].[Assets_Dimension] ADD  DEFAULT ('Population process') FOR [Update_Reason]
GO

