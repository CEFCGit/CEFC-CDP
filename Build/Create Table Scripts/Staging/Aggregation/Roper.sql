create table staging.ContractSummary_Roper
(
[ContractID] nvarchar(20),
[ContractDate] nvarchar(20),
[LoanTerm] numeric(3),
[AnnualRate] numeric(5,2),
[FinanceAmount] numeric(15,2),
[PrincipalOutstanding] numeric(15,2),
[FinancePurpose] nvarchar(50),
[BorrowerState] nvarchar(10),
[BorrowerAge] nvarchar(10),
[EmploymentStatus] nvarchar(20),
[BorrowerIncome] nvarchar(20),
[HousingStatus] nvarchar(50),
[Gender] nvarchar(10),
[EarlyPaymentsMade] nvarchar(3),
[RepaymentStatus] nvarchar(20)
)

