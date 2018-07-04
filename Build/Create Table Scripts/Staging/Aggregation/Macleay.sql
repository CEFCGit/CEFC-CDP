create table staging.ContractSummary_Macleay
(
[Loan_Number] nvarchar(20),
[UsageType] nvarchar(20),
[SupplierType] nvarchar(20),
[FacilityType] nvarchar(50),
[Sec_AssetType] nvarchar(50),
[Sec_CO2] nvarchar(20),
[Sec_Make] nvarchar(20),
[Sec_Model] nvarchar(100),
[Sec_Variant] nvarchar(50),
[Sec_VehicleGroup] nvarchar(50),
[Sec_VehicleCategory] nvarchar(50),
[GV_VehicleSegment] nvarchar(50),
[GV_ClassName] nvarchar(50),
[DiscountedRate] numeric(5,3),
[UndiscountedRate] numeric(5,3),
[Quo_AmountFinanced] numeric(15,2),
[Quo_GSTFinanced] numeric(15,2),
[TermPeriod] numeric(3),
[CurrentLoanAmt] numeric(15,2),
[WDV] numeric(15,2),
[Quo_ResidualAmount] numeric(15,2),
[Quo_ResidualPercent] numeric(15,2),
[Add_PostCode] nvarchar(10),
[Add_State] nvarchar(20),
[Status] nvarchar(20),
[DateSubmitted] nvarchar(20),
[DateSettled] nvarchar(20),
[MaturityDate] nvarchar(20),
[FinalisedDate] nvarchar(20)

)


