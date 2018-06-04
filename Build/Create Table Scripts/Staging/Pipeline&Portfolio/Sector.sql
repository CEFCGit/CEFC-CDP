CREATE TABLE [staging].[Sector](
	[ID_Client_Sector] [numeric](18, 0) NOT NULL,
	[ID_PrimaryFocus] [nvarchar](10) NULL,
	[Business_Platform] [nvarchar](75) NULL,
	[cColour] [nvarchar](10) NULL,
	[cFocus] [nvarchar](128) NULL,
	[Created_By] [nvarchar](27) NULL,
	[Created_Date] [nvarchar](46) NULL,
	[ctColour] [nvarchar](10) NULL,
	[DecarbonisationPathway] [nvarchar](82) NULL,
	[DecarbonisationSector] [nvarchar](128) NULL,
	[Description] [nvarchar](89) NULL,
	[ED] [nvarchar](32) NULL,
	[icon] [nvarchar](50) NULL,
	[id_constant] [numeric](2, 0) NULL,
	[Lead] [nvarchar](36) NULL,
	[Modified_By] [nvarchar](27) NULL,
	[Modified_Date] [nvarchar](27) NULL,
	[Sort_Order] [numeric](2, 0) NULL,
	[Strategic_Priority_Area] [nvarchar](58) NULL,
	[Strategic_Sector] [nvarchar](75) NULL,
	[tColour] [nvarchar](15) NULL,
	[temp_ID] [nvarchar](50) NULL,
PRIMARY KEY ([ID_Client_Sector] )
)
GO

