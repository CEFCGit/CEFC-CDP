create table core.Revenue_Fact
(
   Account_Number nvarchar(5),
   iMart_TNum nvarchar(10),
   ID_Project_TNumber nvarchar(20),
   Investment_Type numeric(3),
   [Dividend/Trust_Distributions] numeric(15,2),
   [Loan_Interest] numeric(15,2),
   [Committment_Fees] numeric (15,2),
   [Establishment_Fees] [numeric](15, 2) ,
   [Concession_Unwind] [numeric](15, 2) ,
   [SFA_Interest_Received] [numeric](15, 2) ,
   [Bank_Interest_Income] [numeric](15, 2) ,
   [Profit_On_Sale_Of_Asset] numeric(15,2),
   [Fair_Value_Gains_Bonds] numeric(15,2),
   [Fair_Value_Gains_Equity] numeric(15,2),
   [Fair_Value_Gains_Loans/Advances] numeric(15,2),
   [Fair_Value_Losses_Bonds] numeric(15,2),
   [Fair_Value_Losses_Equity] numeric(15,2),
   [Fair_Value_Losses_Loans/Advances] numeric(15,2),
   [Share_Of_Profit/(Loss)_Assoc/JVs] numeric(15,2),
   [YTD_Total_TY] [numeric](15, 2) ,
   [YTD_Total_LY] [numeric](15, 2) ,
   [Variance] [numeric](15, 2) ,
   [Initial_Concessional_Charge] [numeric](15, 2) ,
   [To_Period] [nvarchar](3) ,
   [To_Date] [nvarchar](20),
   [Updated_by] [nvarchar](20) ,
   [Update_from_TS] [datetime]  ,
   [Update_to_TS] [datetime] ,
   [Update_Reason] [nvarchar](20) ,
   primary key (Account_Number,Update_from_TS)
)

ALTER TABLE [core].[Revenue_Fact] ADD  DEFAULT ('SSIS ETL') FOR [Updated_by]
GO

ALTER TABLE [core].[Revenue_Fact] ADD  DEFAULT (NULL) FOR [Update_to_TS]
GO

ALTER TABLE [core].[Revenue_Fact] ADD  DEFAULT ('Population process') FOR [Update_Reason]
GO
