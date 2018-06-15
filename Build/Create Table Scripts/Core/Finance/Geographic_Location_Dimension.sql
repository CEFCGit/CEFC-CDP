CREATE TABLE [core].[Geographic_Location_Dimension](
	[Selection_Code] [nvarchar](4) NOT NULL,
	[Short_Description] [nvarchar](70) NULL,
	[Updated_by] [nvarchar](20) NULL,
	[Update_from_TS] [datetime] NOT NULL,
	[Update_to_TS] [datetime] NULL,
	[Update_Reason] [nvarchar](20) NULL,
PRIMARY KEY ([Selection_Code] ,	[Update_from_TS] )
)
GO

ALTER TABLE [core].[Geographic_Location_Dimension] ADD  DEFAULT ('SSIS ETL') FOR [Updated_by]
GO

ALTER TABLE [core].[Geographic_Location_Dimension] ADD  DEFAULT (NULL) FOR [Update_to_TS]
GO

ALTER TABLE [core].[Geographic_Location_Dimension] ADD  DEFAULT ('Population process') FOR [Update_Reason]
GO


