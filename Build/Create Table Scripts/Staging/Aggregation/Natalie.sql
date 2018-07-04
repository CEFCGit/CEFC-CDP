create table staging.ContractSummary_Natalie
(
[Contract No.] nvarchar(20),
[Asset No.] nvarchar(20),
[Lease type] nvarchar(20),
[Equipment type] nvarchar(50),
[Make] nvarchar(50),
[Model] nvarchar(100),
[Year] numeric(4),
[Interest rate] numeric(6,4),
[Discretion applied] numeric(6,4),
[Check] nvarchar(3),
[Repayment frequency] nvarchar(20),
[Total amount financed] numeric(15,2),
[Term] numeric(3),
[Outstanding balance] numeric(15,2),
[Principal Outstanding] numeric(15,2),
[ Balloon / Residual amount ] numeric(15,2),
[LOIS CEFC Note] nvarchar(100),
[LQS CEFC Note] nvarchar(100),
[Asset Group] nvarchar(50),
[State] nvarchar(20),
[Postcode] nvarchar(10),
[Industry class] nvarchar(20),
[Drawdown date] nvarchar(20),
[Day Count] numeric(3),
[Monthly Day Count] numeric(3),
[CEFC Rate Adjustment] numeric(15,2),
[Total repayable amount] numeric(15,2)
)

create table staging.RemovedAssets_Natalie
(
  [Contract] nvarchar(20),
  [Reason] nvarchar(50)
)
