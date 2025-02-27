CREATE TABLE [core].[Commitments_Deployments_Fact](
	[Account_Number] [nvarchar](5) NOT NULL,
	[iMart_TNum] [nvarchar](10) NULL,
	[ID_Project_TNumber] [nvarchar](20) NULL,
	[Investment_Type] [numeric](3, 0) NULL,
	[BFB_Principal] [numeric](15, 2) NULL,
	[BFB_Capitalised_Interest] [numeric](15, 2) NULL,
	[BFB_Capitalised_Fees] [numeric](15, 2) NULL,
	[BFB_FX_Translation_Gain/Loss] [numeric](15, 2) NULL,
	[BFB_Fees_Accrued] [numeric](15, 2) NULL,
	[BFB_Net_Interest_Accrued] [numeric](15, 2) NULL,
	[BFB_Unrealised_Gain/Loss] [numeric](15, 2) NULL,
	[BFB_Realised_Gain/Loss] [numeric](15, 2) NULL,
	[BFB_Realised_Impairment] [numeric](15, 2) NULL,
	[BFB_Total_Excluding_Concession] [numeric](15, 2) NULL,
	[REPAY_Amounts_Drawn] [numeric](15, 2) NULL,
	[REPAY_Interest_Capitalised] [numeric](15, 2) NULL,
	[REPAY_Establishment_Fees_Capitalised] [numeric](15, 2) NULL,
	[REPAY_Commitment_Fees_Capitalised] [numeric](15, 2) NULL,
	[REPAY_Legal_Fees_Capitalised] [numeric](15, 2) NULL,
	[REPAY_Commitment_Fees_Accrued] [numeric](15, 2) NULL,
	[REPAY_Interest_Accrued] [numeric](15, 2) NULL,
	[REPAY_Discount_Amortisation] [numeric](15, 2) NULL,
	[REPAY_Unrealised_Gain/Loss] [numeric](15, 2) NULL,
	[REPAY_Realised_Gain/Loss] [numeric](15, 2) NULL,
	[REPAY_Realised_Impairment] [numeric](15, 2) NULL,
	[REPAY_Equity_Acct_Gain/Loss] [numeric](15, 2) NULL,
	[REPAY_FX_Translation_Gain/Loss] [numeric](15, 2) NULL,
	[REPAY_Principal_Repaid] [numeric](15, 2) NULL,
	[REPAY_Capitalised_Interest_Repaid] [numeric](15, 2) NULL,
	[REPAY_Capitalised_Fees_Repaid] [numeric](15, 2) NULL,
	[REPAY_Interest_Received] [numeric](15, 2) NULL,
	[REPAY_Total_Excluding_Concession] [numeric](15, 2) NULL,
	[Gross_Principal] [numeric](15, 2) NULL,
	[Realised_Gain/Loss] [numeric](15, 2) NULL,
	[Equity_Acct_Gain/Loss] [numeric](15, 2) NULL,
	[Realised_Impairment] [numeric](15, 2) NULL,
	[Principal_Net_Capital_Losses] [numeric](15, 2) NULL,
	[Capitalised_Interest] [numeric](15, 2) NULL,
	[Discount_Amortisation] [numeric](15, 2) NULL,
	[Capitalised_Fees] [numeric](15, 2) NULL,
	[FX_Translation_Gain/Loss] [numeric](15, 2) NULL,
	[Fees_Accrued] [numeric](15, 2) NULL,
	[Net_Interest_Accrued] [numeric](15, 2) NULL,
	[Unrealised_Gain/Loss] [numeric](15, 2) NULL,
	[Total_Excluding_Concession] [numeric](15, 2) NULL,
	[Variance] [numeric](15, 2) NULL,
	[BFB_Book_Value_Excluding_Concession_Accrued_Interest_Fees] [numeric](15, 2) NULL,
	[REPAY_Net_Movement] [numeric](15, 2) NULL,
	[Book_Value_Excluding_Concession_Accrued_Interest_Fees] [numeric](15, 2) NULL,
	[Net_Concession_Reserve] [numeric](15, 2) NULL,
	[Book_Value_Excluding_Accrued_Interest_Fees_Less_Net_Concession] [numeric](15, 2) NULL,
	[Maximum_Facility] [numeric](15, 2) NULL,
	[Repaid/Cancelled/Discount_Amort] [numeric](15, 2) NULL,
	[Remaining_To_Fund] [numeric](15, 2) NULL,
	[Code] [nvarchar](3) NULL,
	[Business_Platform] [nvarchar](50) NULL,
	[Commitment_Category] nvarchar(20),
	[Adjustments_to_Facility_Limit] numeric(15,2),
	[To_Period] [numeric](3, 0) NULL,
	[To_Date] [varchar](20) NULL,
	[Updated_by] [nvarchar](20) NULL,
	[Update_from_TS] [datetime] NOT NULL,
	[Update_to_TS] [datetime] NULL,
	[Update_Reason] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Account_Number] ASC,
	[Update_from_TS] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [core].[Commitments_Deployments_Fact] ADD  DEFAULT ('SSIS ETL') FOR [Updated_by]
GO

ALTER TABLE [core].[Commitments_Deployments_Fact] ADD  DEFAULT (NULL) FOR [Update_to_TS]
GO

ALTER TABLE [core].[Commitments_Deployments_Fact] ADD  DEFAULT ('Population process') FOR [Update_Reason]
GO


