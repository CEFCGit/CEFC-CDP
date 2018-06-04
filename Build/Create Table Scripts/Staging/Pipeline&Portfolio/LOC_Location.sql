CREATE TABLE [staging].[LOC_Location](
	[ID_Location] [nvarchar](50) NULL,
	[ID_LocationLink] [nvarchar](50) NULL,
	[ID_Project] [nvarchar](87) NULL,
	[Created_By] [nvarchar](41) NULL,
	[Created_Date] [nvarchar](27) NULL,
	[id_constant] [numeric](2, 0) NULL,
	[Loc_Electorate] [nvarchar](36) NULL,
	[Loc_Postcode] [nvarchar](12) NULL,
	[Loc_State] [nvarchar](20) NULL,
	[Modified_By] [nvarchar](36) NULL,
	[Modified_Date] [nvarchar](27) NULL,
	[Percent_of_Project_Amt] [numeric](5, 2) NULL,
	[Percent_of_Project_tCO2_savings] [numeric](5, 2) NULL,
	[zzzid_organisation] [nvarchar](150) NULL
) 
GO

