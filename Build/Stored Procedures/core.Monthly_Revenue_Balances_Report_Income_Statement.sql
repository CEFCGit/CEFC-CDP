-- ==========================================================================
-- Created by: Yolinda Moodley
-- Create date: 19/09/2018
-- Description:	Create stored procedure to build the Monthly Revenue Balances Income Statement
-- Version Control
-- ==========================================================================

Create  or alter procedure [core].[Monthly_Revenue_Balances_Report_Income_Statement] 
as 

with Income_Statement
as
(
		SELECT 'Dividend/Trust Distributions' as [Header],
				'Revenue' as Flag,
				sum(rf.[Dividend/Trust_Distributions]) as [Actual],
				case when To_Period >= 7 then year(To_Date)-1 else year(To_Date) end  as [year],
				To_Period,
				Account_Number,
				iMart_TNum
		FROM core.Revenue_Fact rf
		group by case when To_Period >= 7 then year(To_Date)-1 else year(To_Date) end,
				 To_Period,
				 Account_Number,
				 iMart_TNum
		UNION
		select 'Loan Interest Income' as Header,
				'Revenue' as Flag,
				sum(rf.Loan_Interest) as [Actual],
				case when To_Period >= 7 then year(To_Date)-1 else year(To_Date) end  as [year],
				To_Period,
				Account_Number,
				iMart_TNum

		from core.Revenue_Fact rf
		group by case when To_Period >= 7 then year(To_Date)-1 else year(To_Date) end,
				 To_Period,
				 Account_Number,
				 iMart_TNum
		UNION
		select 'Commitment Fees' as Header,
				'Revenue' as Flag,
				sum(rf.Committment_Fees) as [Actual],
				case when To_Period >= 7 then year(To_Date)-1 else year(To_Date) end  as [year],
				To_Period,
				Account_Number,
				iMart_TNum
		from core.Revenue_Fact rf
		group by case when To_Period >= 7 then year(To_Date)-1 else year(To_Date) end,
				 To_Period,
				 Account_Number,
				 iMart_TNum
		UNION
		select 'Establishment Fees' as Header,
				'Revenue' as Flag,
				sum(rf.Establishment_Fees) as [Actual],
				case when To_Period >= 7 then year(To_Date)-1 else year(To_Date) end  as [year],
				To_Period,
				Account_Number,
				iMart_TNum
		from core.Revenue_Fact rf
		group by case when To_Period >= 7 then year(To_Date)-1 else year(To_Date) end,
				 To_Period,
				 Account_Number,
				 iMart_TNum
		UNION
		select 'SFA Interest Income' as Header,
				'Revenue' as Flag,
				sum(rf.SFA_Interest_Received) as [Actual],
				case when To_Period >= 7 then year(To_Date)-1 else year(To_Date) end  as [year],
				To_Period,
				Account_Number,
				iMart_TNum
		from core.Revenue_Fact rf
		group by case when To_Period >= 7 then year(To_Date)-1 else year(To_Date) end,
				 To_Period,
				 Account_Number,
				 iMart_TNum
		UNION
		select 'Loan Discount Interest' as Header,
				'Revenue' as Flag,
				sum(rf.Concession_Unwind) as [Actual],
				case when To_Period >= 7 then year(To_Date)-1 else year(To_Date) end  as [year],
				To_Period,
				Account_Number,
				iMart_TNum
		from core.Revenue_Fact rf
		group by case when To_Period >= 7 then year(To_Date)-1 else year(To_Date) end,
				 To_Period,
				 Account_Number,
				 iMart_TNum
		UNION
		select 'Share of Profit / (Loss) of Associates & JVs' as Header,
				'Fair Value Adjustments & Share of Assoc & JVs' as Flag,
				sum(rf.[Share_Of_Profit/(Loss)_Assoc/JVs]) as [Actual],
				case when To_Period >= 7 then year(To_Date)-1 else year(To_Date) end  as [year],
				To_Period,
				Account_Number,
				iMart_TNum
		from core.Revenue_Fact rf
		group by case when To_Period >= 7 then year(To_Date)-1 else year(To_Date) end,
				 To_Period,
				 Account_Number,
				 iMart_TNum
		UNION
		select 'Fair value gains / (losses) - Bonds' as Header,
				'Fair Value Adjustments & Share of Assoc & JVs' as Flag,
				sum(rf.Fair_Value_Gains_Bonds+rf.Fair_Value_Losses_Bonds) as [Actual],
				case when To_Period >= 7 then year(To_Date)-1 else year(To_Date) end  as [year],
				To_Period,
				Account_Number,
				iMart_TNum
		from core.Revenue_Fact rf
		group by case when To_Period >= 7 then year(To_Date)-1 else year(To_Date) end,
				 To_Period,
				 Account_Number,
				 iMart_TNum
		UNION
		select 'Fair value gains / (losses) - Equity' as Header,
				'Fair Value Adjustments & Share of Assoc & JVs' as Flag,
				sum(rf.Fair_Value_Gains_Equity+rf.Fair_Value_Losses_Equity) as [Actual],
				case when To_Period >= 7 then year(To_Date)-1 else year(To_Date) end  as [year],
				To_Period,
				Account_Number,
				iMart_TNum
		from core.Revenue_Fact rf
		group by case when To_Period >= 7 then year(To_Date)-1 else year(To_Date) end,
				 To_Period,
				 Account_Number,
				 iMart_TNum 
		UNION
		select 'Fair value gains / (losses) - Loans and Advances' as Header,
				'Fair Value Adjustments & Share of Assoc & JVs' as Flag,
				sum(rf.[Fair_Value_Gains_Loans/Advances]+rf.[Fair_Value_Losses_Loans/Advances]) as [Actual],
				case when To_Period >= 7 then year(To_Date)-1 else year(To_Date) end  as [year],
				To_Period,
				Account_Number,
				iMart_TNum
		from core.Revenue_Fact rf
		group by case when To_Period >= 7 then year(To_Date)-1 else year(To_Date) end,
				 To_Period,
				 Account_Number,
				 iMart_TNum

)

select  i.iMart_TNum,
		i.Account_Number,
		fd.iMart_TNum as [iMart Deal],
		fd.Project_Name as Project,
		fd.Account_Number+' - '+fd.Account_Description as [Financial Deal],
		i.Actual,
		i.Flag,
		i.Header,
		i.To_Period,
		i.year
from Income_Statement i
left join core.FinDeal_Dimension fd
  on i.Account_Number = fd.Account_Number

GO