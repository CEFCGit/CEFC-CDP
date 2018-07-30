create table staging.ContractSummary_Natalie
(
[Contract No.] nvarchar(20),
[Asset No.] nvarchar(20),
[Lease type] nvarchar(20),
[Equipment type] nvarchar(50),
[Make] nvarchar(50),
[Model] nvarchar(100),
[Year] nvarchar(4),
[Interest rate] nvarchar(6),
[Discretion applied] nvarchar(10),
[Check] nvarchar(3),
[Repayment frequency] nvarchar(20),
[Total amount financed] nvarchar(15),
[Term] nvarchar(3),
[Outstanding balance] nvarchar(15),
[Principal Outstanding] nvarchar(15),
[ Balloon / Residual amount ] nvarchar(15),
[LOIS CEFC Note] nvarchar(400),
[LQS CEFC Note] nvarchar(100),
[Asset Group] nvarchar(50),
[State] nvarchar(20),
[Postcode] nvarchar(10),
[Industry class] nvarchar(20),
[Drawdown date] nvarchar(20),
[Day Count] nvarchar(5),
[Monthly Day Count] nvarchar(3),
[CEFC Rate Adjustment] nvarchar(20),
[Total repayable amount] nvarchar(15),
[FileDate] nvarchar(20)
)

create table staging.RemovedAssets_Natalie
(
  [Contract] nvarchar(20),
  [Reason] nvarchar(70),
  [FileDate] nvarchar(20)
)
