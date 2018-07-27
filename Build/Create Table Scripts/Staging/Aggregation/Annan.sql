CREATE TABLE [staging].[AssetDetails_Annan]
(
	[ANZ_fileDate] [nvarchar](20) ,
	[Asset Number] [nvarchar](20) ,
	[Asset Group] [nvarchar](20) ,
	[Agreement] [nvarchar](20) ,
	[Brand] [nvarchar](20) ,
	[Asset Description] [nvarchar](100) ,
	[Year] [nvarchar](4) ,
	[Make] [nvarchar](100) ,
	[Model] [nvarchar](100) ,
	[Asset Group A-D ] [nvarchar](50) ,
	[ANZ_assetAge] [nvarchar](20) ,
	[FileDate] [nvarchar](20) 
) 



CREATE TABLE [staging].[ContractSummary_Annan]
(
	[Agreement] [nvarchar](20) ,
	[Brand] [nvarchar](20) ,
	[Cust Number] [nvarchar](20) ,
	[Product / Loan Type] [nvarchar](50) ,
	[DiscIntRateAvg] [nvarchar](5) ,
	[DiscrAppl/UndiscRateAvg] [nvarchar](5) ,
	[Repayment Frequency] [nvarchar](20) ,
	[Total Amount Financed] [nvarchar](20) ,
	[Residual / Balloon Amount] [nvarchar](20) ,
	[Term (months)] [nvarchar](3) ,
	[Asset Group] [nvarchar](50) ,
	[Post Code] [nvarchar](20) ,
	[State] [nvarchar](20) ,
	[ANZSIC] [nvarchar](20) ,
	[Funding Date] [nvarchar](20) ,
	[Maturity Date] [nvarchar](20) ,
	[Termination Date (AS applicable)] [nvarchar](20) ,
	[Sum of Rebate Calc / Amount] [nvarchar](20) ,
	[Min of Principal Outstanding] [nvarchar](20) ,
	[FileDate] [nvarchar](20) 
) 
