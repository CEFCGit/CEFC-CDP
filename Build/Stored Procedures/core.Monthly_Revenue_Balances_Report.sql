/****** Object:  StoredProcedure [core].[Monthly_Revenue_Balances_Report]    Script Date: 31/08/2018 2:28:34 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- ==========================================================================
-- Created by: Yolinda Moodley
-- Create date: 31/08/2018
-- Description:	Create stored procedure to build the Monthly Revenue Balances
-- Version Control
-- ==========================================================================

Create  or alter procedure [core].[Monthly_Revenue_Balances_Report] 
as 


with Period_tots 
as
(
	select 
	    Account_Number,
		iMart_TNum,
		Investment_Type,		
		case when To_Period >= 7 then year(To_Date)-1 else year(To_Date) end  as [year],
		sum(case when To_Period = 1 then YTD_Total_TY end) Jul,
		sum(case when To_Period = 2 then YTD_Total_TY end) Aug, 
		sum(case when To_Period = 3 then YTD_Total_TY end) Sep, 
		sum(case when To_Period = 4 then YTD_Total_TY end) Oct, 
		sum(case when To_Period = 5 then YTD_Total_TY end) Nov, 
		sum(case when To_Period = 6 then YTD_Total_TY end) [Dec], 
		sum(case when To_Period = 7 then YTD_Total_TY end) Jan, 
		sum(case when To_Period = 8 then YTD_Total_TY end) Feb, 
		sum(case when To_Period = 9 then YTD_Total_TY end) Mar, 
		sum(case when To_Period = 10 then YTD_Total_TY end) Apr, 
		sum(case when To_Period = 11 then YTD_Total_TY end) May,
		sum(case when To_Period = 12 then YTD_Total_TY end) Jun 
	from core.Revenue_Fact 
	group by Account_Number,
			 iMart_TNum,
			 Investment_Type,
			 case when To_Period >= 7 then year(To_Date)-1 else year(To_Date) end
)

select	pt.iMart_TNum,
		fd.iMart_TNum as [iMart Deal],
		fd.Project_Name as Project,
		fd.Account_Number+' - '+fd.Account_Description as [Financial Deal],
		pt.Investment_Type,
		[year],
		Jul as July,
		Aug-Jul as August,
		Sep-Aug as September,
		Oct-Sep as October,
		Nov-Oct as November,
		[Dec]-Nov as December,
		Jan-[Dec] as January,
		Feb-Jan as February,
		Mar-Feb as March,
		Apr-Mar as April,
		May-Apr as May,
		Jun-May as June
from Period_tots pt
left join core.FinDeal_Dimension fd
  on pt.Account_Number = fd.Account_Number
  order by pt.Account_Number

GO


