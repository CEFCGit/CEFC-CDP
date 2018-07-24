create table [core].[ANZSIC_Dimension]
(
	[ID_Project] nvarchar(100),
	[Code] nvarchar(5),
	[Division] nvarchar(100),
	[Subdivision] nvarchar(100),
	[Description] nvarchar(100),
	[ABS_Division] nvarchar(100),
	[ABS_Subdivision] nvarchar(100),
	[Updated_by] nvarchar(20) ,
	[Update_from_TS] datetime ,
	[Update_to_TS] datetime ,
	[Update_Reason] nvarchar(20),
	PRIMARY KEY ([ID_Project],[Code],[Update_from_TS])
)

ALTER TABLE [core].[ANZSIC_Dimension] ADD  DEFAULT ('SSIS ETL') FOR [Updated_by]
GO

ALTER TABLE [core].[ANZSIC_Dimension] ADD  DEFAULT (NULL) FOR [Update_to_TS]
GO

ALTER TABLE [core].[ANZSIC_Dimension] ADD  DEFAULT ('Population process') FOR [Update_Reason]
GO
