/****** Object:  Table [staging].[TEC_Technology]    Script Date: 5/06/2018 12:27:52 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [staging].[TEC_Technology](
	[Created_Date] [nvarchar](20) NULL,
	[Modified_Date] [nvarchar](20) NULL,
	[Modified_By] [nvarchar](30) NULL,
	[Created_By] [nvarchar](30) NULL,
	[ID_Technology] [nvarchar](6) NULL,
	[ID_Project] [nvarchar](100) NULL,
	[ID_Organisation] [nvarchar](3) NULL,
	[cTechnology] [nvarchar](100) NULL,
	[Technology_Description] [nvarchar](100) NULL,
	[ID_TechnologyLink] [nvarchar](10) NULL,
	[Percent_of_Project_Amt] [numeric](5, 2) NULL,
	[Percent_of_Project_tCO2_savings] [numeric](5, 2) NULL,
	[Tec_CEFC_Section] [nvarchar](50) NULL,
	[Tec_Technology] [nvarchar](50) NULL,
	[Tec_Category_Equipment] [nvarchar](50) NULL,
	[id_constant] [nvarchar](3) NULL,
	[temp_ID] [varchar](50) NULL,
	[temp_ID_old] [varchar](50) NULL,
	[xxxPercent_renewable] [numeric](5, 2) NULL,
	[Percent_renewable_calc] [numeric](5, 2) NULL
) ON [PRIMARY]
GO

