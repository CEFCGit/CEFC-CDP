/****** Object:  Table [core].[Base_Data_Fact]    Script Date: 14/09/2018 3:15:38 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [core].[Base_Data_Fact](
	[ID_Project] [nvarchar](100) NOT NULL,
	[ID_Loc_Project]  AS ([ID_Project]),
	[ID_Focus] [nvarchar](5) NULL,
	[ID_Priority] [nvarchar](3) NULL,
	[ID_Client_Sector] [nvarchar](50) NULL,
	[ID_Phase] [numeric](18, 0) NULL,
	[Amt_cBoardApproved] [numeric](25, 6) NULL,
	[Amt_cBoardApproved_Expiry] [nvarchar](60) NULL,
	[Amt_cBoardApprovedNotes] [nvarchar](2000) NULL,
	[Amt_cCEFC] [numeric](25, 6) NULL,
	[Amt_cCEFC_Renewable] [numeric](25, 6) NULL,
	[Amt_cCEFCweighted] [numeric](25, 6) NULL,
	[Amt_cCGBR_5yr] [numeric](25, 6) NULL,
	[Amt_cCommitment] [numeric](25, 6) NULL,
	[Amt_cConcessionality] [numeric](25, 6) NULL,
	[Amt_cEquity_Internal] [numeric](25, 6) NULL,
	[Amt_cEquity_Other] [numeric](25, 6) NULL,
	[Amt_cFunding_3rd_Party] [numeric](25, 6) NULL,
	[Amt_cFunding_Grant] [numeric](25, 6) NULL,
	[Amt_cFunding_Partner] [numeric](25, 6) NULL,
	[Amt_cProject] [numeric](25, 6) NULL,
	[Amt_cSum_Funding_Other] [numeric](25, 6) NULL,
	[Amt_cTenor] [numeric](25, 6) NULL,
	[Amt_cYield] [numeric](25, 6) NULL,
	[cAssessment_Credit_Risk] [numeric](25, 6) NULL,
	[cAssessment_NPV_Gov_Cost] [numeric](25, 6) NULL,
	[cAssessment_Savings_Annual_TCO2] [numeric](25, 6) NULL,
	[cAssessment_Savings_TCO2_Life] [numeric](25, 6) NULL,
	[Leverage_PrivateSector] [numeric](25, 6) NULL,
	[Leverage_Total] [numeric](25, 6) NULL,
	[Loss_Estimated_dollar] [numeric](25, 6) NULL,
	[Loss_Estimated_pct] [numeric](25, 6) NULL,
	[Loss_Given_Default_pct] [numeric](25, 6) NULL,
	[Nameplate_Generation_CapacityMW_Existing] [numeric](25, 6) NULL,
	[Nameplate_Generation_CapacityMW_New] [numeric](25, 6) NULL,
	[Secondary_Leverage_Amt] [numeric](25, 6) NULL,
	[Concessionality_Calc] [numeric](15, 2) NULL,
	[Update_From_TS] [datetime] NOT NULL,
	[Update_to_TS] [datetime] NULL,
	[Updated_by] [nvarchar](20) NULL,
	[Update_Reason] [nvarchar](20) NULL,
	[Amt_cLiveCommitment] [numeric](25, 6) NULL,
	[Amt_cNonTriggeredCommitment] [numeric](25, 6) NULL,
	[cAssessment_NPV_CEFC_Cost] [numeric](18, 6) NULL,
 CONSTRAINT [PK_BDF_Dim] PRIMARY KEY CLUSTERED 
(
	[ID_Project] ASC,
	[Update_From_TS] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [core].[Base_Data_Fact] ADD  DEFAULT (NULL) FOR [Update_to_TS]
GO

ALTER TABLE [core].[Base_Data_Fact] ADD  DEFAULT ('SSIS ETL') FOR [Updated_by]
GO

ALTER TABLE [core].[Base_Data_Fact] ADD  DEFAULT ('Population process') FOR [Update_Reason]
GO


