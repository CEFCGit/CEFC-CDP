-- ==========================================================================
-- Created by: Yolinda Moodley
-- Create date: 15/05/2018
-- Description:	Create stored procedure to build the Finance Report
-- Version Control
--06/06(YM) Removed all reference to the Security Table
-- ==========================================================================

Create or alter procedure [core].[Finance_Report] @load_date datetime
as 

declare @local_date datetime 

select @local_date =  DBO.FN_LOCALDATE (GETDATE());

SELECT @load_date AS ParamIn ,
       max(cast(b.Update_From_TS AS datetime)) Update_From_TS_b ,
       max(cast(b.Update_to_TS AS datetime)) Update_To_TS_b ,
       max(cast(p.Update_From_TS AS datetime)) Update_From_TS_p ,
       max(cast(p.Update_to_TS AS datetime)) Update_To_TS_p ,
       max(cast(pd.Update_From_TS AS datetime)) Update_From_TS_pd ,
       max(cast(pd.Update_to_TS AS datetime)) Update_To_TS_pd ,
	   max(cast(phd.Update_From_TS AS datetime)) Update_From_TS_phd ,
       max(cast(phd.Update_to_TS AS datetime)) Update_To_TS_phd ,
	   --us.UserID ,
	   p.ID_Project_TNumber,
	   case when cMasterProject is not null then cMasterProject else Project_Name end as Project_Name,
	   p.Description,
       p.Project_Borrower_Entity,
	   p.cMasterProject,
	   p.Finance_Type,
	   p.CEFC_Section,
	   b.ID_Client_Sector,
	   p.Industry_Division,
	   '' as State,
	   sum(b.Amt_cCEFC) as Amt_cCEFC ,
	   p.Date_Commitment,
	   p.Shadow_Credit_Rating,
	   sum(b.Loss_Given_Default_pct) as Loss_Given_Default_pct,
	   sum(b.Loss_Estimated_pct) as Loss_Estimated_pct,
	   sum(b.Loss_Estimated_dollar) as Loss_Estimated_dollar,
	   sum(b.Amt_cTenor) as Amt_cTenor ,
	   sum(b.Amt_cYield) as Amt_cYield,
	   sum(b.Amt_cCGBR_5yr) as Amt_cCGBR_5yr,
	   pd.ID_Priority,
	   pd.Priority,
	   phd.ID_Phase,
	   phd.Phase_Name,
	   phd.Phase_Description
	   
from core.Base_Data_Fact b
left join core.Projects_Dimension p
	 on b.ID_Project = p.ID_Project
left join core.Priority_Dimension pd
	 on b.ID_Priority = pd.ID_Priority
left join core.Phases_Dimension phd
	  on b.ID_Phase = phd.ID_Phase
--left join security.User_Security us
	 --on p.id_project_TNumber = us.Project_TNumber

WHERE @load_date >=  cast(b.Update_From_TS as datetime) and @load_date < cast(isnull(b.Update_To_TS,@local_date) as datetime)
and @load_date >=  cast(p.Update_From_TS as datetime) and @load_date < cast(isnull(p.Update_To_TS,@local_date) as datetime)
and @load_date >=  cast(pd.Update_From_TS as datetime) and @load_date < cast(isnull(pd.Update_To_TS,@local_date) as datetime)
and @load_date >=  cast(phd.Update_From_TS as datetime) and @load_date < cast(isnull(phd.Update_To_TS,@local_date) as datetime)
group by --us.UserID ,
	   p.ID_Project_TNumber,
	   p.Project_Name,
	   p.Description,
       p.Project_Borrower_Entity,
	   p.cMasterProject,
	   p.Finance_Type,
	   p.CEFC_Section,
	   b.ID_Client_Sector,
	   p.Industry_Division,
	   p.Date_Commitment,
	   p.Shadow_Credit_Rating,
	   pd.ID_Priority,
	   pd.Priority,
	   phd.ID_Phase,
	   phd.Phase_Name,
	   phd.Phase_Description
	   
GO

