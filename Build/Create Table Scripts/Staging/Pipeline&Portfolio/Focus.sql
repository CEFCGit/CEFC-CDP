CREATE TABLE [staging].[Focus](
	[ID_Focus] [numeric](18, 0) NOT NULL,
	[code] [nvarchar](10) NULL,
	[Created_By] [nvarchar](27) NULL,
	[Created_Date] [nvarchar](27) NULL,
	[Description] [nvarchar](128) NULL,
	[Focus_Area] [nvarchar](128) NULL,
	[id_constant] [numeric](2, 0) NULL,
	[Lead] [nvarchar](50) NULL,
	[Modified_By] [nvarchar](32) NULL,
	[Modified_Date] [nvarchar](46) NULL,
	[Sort_Order] [numeric](2, 0) NULL,
	[temp_ID] [nvarchar](50) NULL,
PRIMARY KEY ([ID_Focus])

) 
GO

