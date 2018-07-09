create table staging.ContractSummary_Wingercarribee
(
[Brand] nvarchar(20),
[Contract_Number] nvarchar(20),
[Customer_ID] nvarchar(20),
[Product_Type] nvarchar(20),
[Discounted_Rate] nvarchar(6),
[Undiscounted_Rate] nvarchar(6),
[Repayment_Frequency] nvarchar(10),
[Amount_Financed] nvarchar(15),
[Contract_Term_Months] nvarchar(3),
[Balance_Outstanding] nvarchar(15),
[Balloon_Amount] nvarchar(15),
[State] nvarchar(10),
[Postcode] nvarchar(10),
[ANZSIC_Code] nvarchar(10),
[ANZSIC_Description] nvarchar(100),
[Open_Date] nvarchar(20),
[Drawdown_Date] nvarchar(20),
[Maturity_Date] nvarchar(20),
[GST_Indicator] nvarchar(3),
[CEFC_Rate_Adjusted_Amount] nvarchar(15),
[GST_Adjustment] nvarchar(15),
[FileDate] nvarchar(20)
)



create table staging.AssetDetailsWBC_Wingercarribee
(
[ACCOUNT_ID] nvarchar(50),
[COLLATERAL_TYPE_DESC] nvarchar(50),
[COLLATERAL_DESCRIPTION] nvarchar(100),
[COLLATERAL_MAKE] nvarchar(50),
[COLLATERAL_MODEL] nvarchar(100),
[MANUFACTURE_YEAR] nvarchar(4),
[ASSET TYPE] nvarchar(50),
[ASSET GROUP] nvarchar(1),
[ASSET SUB GROUP] nvarchar(50),
[FileDate] nvarchar(20)

)

create table staging.AssetDetailsSBG_Wingercarribee
(
[Acct_Key] nvarchar(50),
[Equipment_Type] nvarchar(50),
[Description] nvarchar(100),
[Make] nvarchar(50),
[Model] nvarchar(100),
[Year] nvarchar(4),
[ASSET TYPE] nvarchar(50),
[ASSET GROUP] nvarchar(1),
[ASSET SUB GROUP] nvarchar(50),
[FileDate] nvarchar(20)
)


create table staging.AssetDetailsCFAL_Wingercarribee
(
[Contract_Number] nvarchar(50),
[Equipment_Type] nvarchar(50),
[Description] nvarchar(100),
[Make] nvarchar(50),
[Model] nvarchar(100),
[Year] nvarchar(4),
[ASSET TYPE] nvarchar(50),
[ASSET GROUP] nvarchar(1),
[ASSET SUB GROUP] nvarchar(50),
[FileDate] nvarchar(20)
)


create table staging.AssetDetailsNQ_Wingercarribee
(
[ACCOUNT_ID] nvarchar(50),
[COLLATERAL_TYPE_DESC] nvarchar(50),
[COLLATERAL_DESCRIPTION] nvarchar(100),
[COLLATERAL_MAKE] nvarchar(50),
[COLLATERAL_MODEL] nvarchar(100),
[MANUFACTURE_YEAR] nvarchar(4),
[ASSET TYPE] nvarchar(50),
[ASSET GROUP] nvarchar(1),
[ASSET SUB GROUP] nvarchar(50),
[Rebate Month] nvarchar(50),
[Brand] nvarchar(20),
[Contract_Number] nvarchar(20),
[Customer_ID] nvarchar(20),
[Product_Type] nvarchar(20),
[Discounted_Rate] nvarchar(6),
[Undiscounted_Rate] nvarchar(6),
[Repayment_Frequency] nvarchar(10),
[Amount_Financed] nvarchar(15),
[Contract_Term_Months] nvarchar(3),
[Balance_Outstanding] nvarchar(15),
[Balloon_Amount] nvarchar(15),
[State] nvarchar(10),
[Postcode] nvarchar(10),
[ANZSIC_Code] nvarchar(10),
[ANZSIC_Description] nvarchar(100),
[Open_Date] nvarchar(20),
[Drawdown_Date] nvarchar(20),
[Maturity_Date] nvarchar(20),
[GST_Indicator] nvarchar(3),
[CEFC_Rate_Adjusted_Amount] nvarchar(15),
[GST_Adjustment] nvarchar(15),
[FileDate] nvarchar(20)

)
