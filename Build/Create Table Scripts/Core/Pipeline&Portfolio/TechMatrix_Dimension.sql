CREATE TABLE [core].[TechMatrix_Dimension](
	[Created_Date] [nvarchar](20) NULL,
	[Modified_Date] [nvarchar](20) NULL,
	[Modified_By] [nvarchar](30) NULL,
	[Created_By] [nvarchar](30) NULL,
	[CEFC_Section] [nvarchar](50) NULL,
	[Technology] [nvarchar](50) NULL,
	[Category_Equipment] [nvarchar](50) NULL,
	[ID_Technology] [nvarchar](6) NOT NULL,
	[id_constant] [nvarchar](3) NULL,
	[Note] [nvarchar](300) NULL,
	[Renewable] [numeric](3, 0) NULL,
	[Updated_by] [nvarchar](20) NULL,
	[Update_from_TS] [datetime] NOT NULL,
	[Update_to_TS] [datetime] NULL,
	[Update_Reason] [nvarchar](20) NULL,
PRIMARY KEY([ID_Technology] ,[Update_from_TS])
)
GO

ALTER TABLE [core].[TechMatrix_Dimension] ADD  DEFAULT ('SSIS ETL') FOR [Updated_by]
GO

ALTER TABLE [core].[TechMatrix_Dimension] ADD  DEFAULT (NULL) FOR [Update_to_TS]
GO

ALTER TABLE [core].[TechMatrix_Dimension] ADD  DEFAULT ('Population process') FOR [Update_Reason]
GO

