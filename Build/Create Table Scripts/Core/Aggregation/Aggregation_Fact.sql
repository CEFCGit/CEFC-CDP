create table [core].[Aggregation_Fact]
(
	[ID_Project] nvarchar(100),
	[Contract_Number] nvarchar(50) ,
	[Asset_Number] nvarchar(20),
	[ANZSIC_Code] nvarchar(5),
	[Balloon_Amount] numeric(20,2),
	[Brand] nvarchar(20),
	[CEFC_Rebate_Monthly] numeric(20,4)  ,
	[Contract_Start_Date] nvarchar(20),
	[Discounted_Interest_Rate] numeric(10,2) ,
	[Funder_Margin] numeric(10,2),
	[Maturity_Date] nvarchar(20),
	[Postcode] nvarchar(5) ,
	[Principal_Outstanding] numeric(20,2),
	[Product_Type] nvarchar(50) ,
	[Repayment_Frequency] nvarchar(20),
	[State] nvarchar(20),
	[Term] numeric(3),
	[Termination_Date] nvarchar(20),
	[Total_Amount_Financed] numeric(20,2),
	[Total_Rebate_to_date_exclGST] numeric(20,2),
	[Total_Rebate_to_date_inclGST] numeric(20,2),
	[File_Date] nvarchar(20),
	[Updated_by] nvarchar(20) ,
	[Update_from_TS] datetime ,
	[Update_to_TS] datetime ,
	[Update_Reason] nvarchar(20),
	PRIMARY KEY([ID_Project],[Contract_Number],[Asset_Number],[ANZSIC_Code],[Update_from_TS])	 
)

ALTER TABLE [core].[Aggregation_Fact] ADD  DEFAULT ('SSIS ETL') FOR [Updated_by]
GO

ALTER TABLE [core].[Aggregation_Fact] ADD  DEFAULT (NULL) FOR [Update_to_TS]
GO

ALTER TABLE [core].[Aggregation_Fact] ADD  DEFAULT ('Population process') FOR [Update_Reason]
GO
