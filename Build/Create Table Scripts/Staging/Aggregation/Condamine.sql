create table staging.RemovedAssets_Condamine
(
[ASSET_NUMBER] nvarchar(50),
[AGREEMENT] nvarchar(50),
[CUSTOMER_NUMBER] nvarchar(50),
[CUSTOMER_NAME] nvarchar(100),
[AFS] nvarchar(50),
[CCL] nvarchar(50),
[ASSET_STATE_LOCATION] nvarchar(50),
[SEGMENT] nvarchar(50),
[DEPT_NAME] nvarchar(100),
[TECHNOLOGY] nvarchar(100),
[ASSET_DESCRIPTION] nvarchar(100),
[REVIEW] nvarchar(100),
[FUNDING_DATE] nvarchar(20),
[SCHEDULE_TERM] numeric(3),
[TOTAL_AMOUNT_FINANCED] numeric(15,2),
[FINACIER_INT_RATE] numeric(15,2),
[TOTAL_CEFC_REBATE_TODATE] numeric(15,2),
[REMOVAL MONTH] nvarchar(20)

)


create table staging.ContractSummary_Condamine
(
[ASSET_NUMBER] nvarchar(50),
[AGREEMENT] nvarchar(50),
[CUSTOMER_NUMBER] nvarchar(50),
[CUSTOMER_NAME] nvarchar(100),
[POST_CODE] nvarchar(20),
[ASSET_STATE_LOCATION] nvarchar(50),
[ANZSIC] nvarchar(20),
[PRODUCT] nvarchar(50),
[ENTITY] nvarchar(20),
[INTRODUCER] nvarchar(20),
[SEGMENT] nvarchar(20),
[DEPT_NAME] nvarchar(100),
[RESIDUAL] numeric(15,2),
[ASSET_TYPE] nvarchar(50),
[EEF_FLAG] nvarchar(20),
[TECHNOLOGY] nvarchar(100),
[ASSET_DESCRIPTION] nvarchar(100),
[FUNDING_DATE] nvarchar(20),
[PAYMENT_FREQUENCY] nvarchar(20),
[SCHEDULE_TERM] numeric(3),
[SCHEDULE_MATURITY_DATE] nvarchar(20),
[NPV] numeric(15,2),
[TERMINATION_DATE] nvarchar(20),
[TOTAL_AMOUNT_FINANCED] numeric(15,2),
[Financier Rate] numeric(15,2),
[Customer Rate] numeric(15,2),
[MONTHLY_INTEREST_INCOME] numeric(15,2),
[MTHLY_TERMINATION_INC] numeric(15,2),
[TOTAL_MONTHLY_INCOME] numeric(15,2),
[TOTAL_INTEREST_INCOME_TODATE] numeric(15,2),
[TOTAL_TERMINATION_INCOME_TODATE] numeric(15,2),
[TOTAL_INCOME_TODATE] numeric(15,2),
[CEFC_MONTHLY_REBATE] numeric(15,2),
[TOTAL_CEFC_REBATE_TODATE] numeric(15,2)

)
