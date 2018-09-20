-- ==========================================================================
-- Created by: Yolinda Moodley
-- Create date: 30/04/2018
-- Description:	Create stored procedure to build the Pipeline Report
-- Version Control
-- 08/05(YM) : Commented out the check for the focus table as the Primary Focus ID is null
-- 09/05(YM) : Added logic for the from and to dates to bring back the latest records from the dimension 
-- 25/05(YM) : Removed the load date as a parameter. Pipeline shows the latest records
-- 06/06(YM) : Removed all references to the Security Table
-- 20/09(YM) : Added the CEFC_Strategic_Sector
-- ==========================================================================

CREATE or alter  procedure [core].[Pipeline_Report] --@load_date datetime
as 

declare @local_date datetime 

select @local_date = dbo.fn_LOCALDATE(GETDATE())

select 	
/*@load_date as ParamIn
		,max(cast(bdf.Update_From_TS as datetime)) Update_From_TS_bdf
		,max(cast(isnull(bdf.Update_To_TS,@local_date) as datetime)) Update_To_TS_bdf
		,max(cast(pjd.Update_From_TS as datetime)) Update_From_TS_pjd
        ,max(cast(isnull(pjd.Update_To_TS,@local_date) as datetime)) Update_To_TS_pjd
		,max(cast(pd.Update_From_TS as datetime)) Update_From_TS_pd
        ,max(cast(isnull(pd.Update_To_TS,@local_date) as datetime)) Update_To_TS_pd
		,max(cast(phd.Update_From_TS as datetime)) Update_From_TS_phd
        ,max(cast(isnull(phd.Update_To_TS,@local_date) as datetime)) Update_To_TS_phd	
		,max(cast(sd.Update_From_TS as datetime)) Update_From_TS_sd
        ,max(cast(isnull(sd.Update_To_TS,@local_date) as datetime)) Update_To_TS_sd	
		,max(cast(fd.Update_From_TS as datetime)) Update_From_TS_fd
        ,max(cast(isnull(fd.Update_To_TS,@local_date) as datetime)) Update_To_TS_fd	
*/
		--,
		 --us.UserID
		--,
		 pd.Priority
		,bdf.ID_Priority as id_Priority
		,bdf.ID_Phase as ID_Phase_Current
		,pjd.ID_Master_Project
		,pd.[Percent]
		,bdf.ID_Client_Sector as CEFC_Sector
		,pjd.id_project_TNumber
		,pjd.Project_Name
		,pjd.rpt_Project_Description
		,cTransaction_Lead
		,phd.Phase_Description
		,phd.Phase_Name
		,pjd.cExecution_Target_Date
		,pjd.rpt_Note
		,pjd.Description as Proj_Desc
		,pjd.cOrganisations
		,fd.code Focus
		,fd.Description Focus_Area
		,datediff(day,convert(date,substring(pjd.rpt_note,1,charindex('-',pjd.rpt_Note)-1),3),@local_date) as Note_Days
		,sum(bdf.Amt_cProject) as Amt_cProject
		,sum(bdf.Amt_cCEFC) as Amt_cCEFC
		,pjd.CEFC_Strategic_Sector 
from core.Base_Data_Fact bdf 
left join core.Projects_Dimension pjd
	on bdf.ID_Project = pjd.ID_Project
left join core.Priority_Dimension pd
	on bdf.ID_Priority = pd.ID_Priority
left join core.Phases_Dimension phd
	on bdf.ID_Phase = phd.ID_Phase
left join core.Sector_Dimension sd
	on bdf.ID_Client_Sector = sd.Business_Platform
left join core.Focus_Dimension fd
	on sd.ID_PrimaryFocus = fd.ID_Focus
--left join security.User_Security us
	--on pjd.id_project_TNumber = us.Project_TNumber

where bdf.Update_to_TS is null
and pjd.Update_To_TS is null
and pd.Update_to_TS is null
and phd.Update_to_ts is null
and sd.Update_to_TS is null
and fd.Update_to_TS is null
/*
where @load_date >=  cast(bdf.Update_From_TS as datetime) and @load_date < cast(isnull(bdf.Update_To_TS,@local_date) as datetime)
and @load_date >=  cast(pjd.Update_From_TS as datetime) and @load_date < cast(isnull(pjd.Update_To_TS,@local_date) as datetime)
and @load_date >=  cast(pd.Update_From_TS as datetime) and @load_date < cast(isnull(pd.Update_To_TS,@local_date) as datetime)
and @load_date >=  cast(phd.Update_From_TS as datetime) and @load_date < cast(isnull(phd.Update_To_TS,@local_date) as datetime)
and @load_date >=  cast(sd.Update_From_TS as datetime) and @load_date < cast(isnull(sd.Update_To_TS,@local_date) as datetime)
--and @load_date >=  cast(fd.Update_From_TS as datetime) and @load_date < cast(isnull(fd.Update_To_TS,@local_date) as datetime)
*/
group by --us.UserID
		--,
		 pd.Priority
		,bdf.ID_Priority 
		,bdf.ID_Phase 
		,pjd.ID_Master_Project
		,pd.[Percent]
		,bdf.ID_Client_Sector 
		,pjd.id_project_TNumber
		,pjd.Project_Name
		,pjd.rpt_Project_Description
		,cTransaction_Lead
		,phd.Phase_Description
		,phd.Phase_Name
		,pjd.cExecution_Target_Date
		,pjd.rpt_Note
		,pjd.Description 
		,pjd.cOrganisations
		,fd.code
		,fd.Description 
		,datediff(day,convert(date,substring(pjd.rpt_note,1,charindex('-',pjd.rpt_Note)-1),3),@local_date)
		,pjd.CEFC_Strategic_Sector

GO

