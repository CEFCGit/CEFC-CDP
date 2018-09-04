create table core.Asset_Category_Dimension
(
	Asset_Category nvarchar(100),
	CEFC_Technology nvarchar(100),
	[Updated_by] [nvarchar](20) ,
	[Update_from_TS] [datetime] ,
	[Update_to_TS] [datetime] ,
	[Update_Reason] [nvarchar](20) ,
	PRIMARY KEY (Asset_Category,[Update_from_TS])

)

ALTER TABLE core.Asset_Category_Dimension ADD  DEFAULT ('SSIS ETL') FOR [Updated_by]
GO

ALTER TABLE core.Asset_Category_Dimension ADD  DEFAULT (NULL) FOR [Update_to_TS]
GO

ALTER TABLE core.Asset_Category_Dimension ADD  DEFAULT ('Population process') FOR [Update_Reason]
GO

