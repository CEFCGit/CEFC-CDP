-- ==========================================================================
-- Created by: Yolinda Moodley
-- Create date: 15/05/2018
-- Description:	Create stored procedure to build the Portfolio Report by Location
-- Version Control
--01/06/18(YM) Added the Sub Amortisation Amount from the Commitments_Deployments
--06/06/18(YM) Removed all references to the Security Table
--16/07/18(YM) Added the Live Commitment and NonTriggered Commitment
-- ==========================================================================

CREATE or alter procedure [core].[Portfolio_Report_Location] @load_date datetime
as 

declare @local_date datetime 

select @local_date =  DBO.FN_LOCALDATE (GETDATE());

SELECT @load_date AS ParamIn ,
       max(cast(b.Update_From_TS AS datetime)) Update_From_TS_b ,
       max(cast(b.Update_to_TS AS datetime)) Update_To_TS_b ,
       max(cast(p.Update_From_TS AS datetime)) Update_From_TS_p ,
       max(cast(p.Update_to_TS AS datetime)) Update_To_TS_p ,
       max(cast(l.Update_From_TS AS datetime)) Update_From_TS_l ,
       max(cast(l.Update_to_TS AS datetime)) Update_To_TS_l ,
	   max(cast(pd.Update_From_TS AS datetime)) Update_From_TS_pd ,
       max(cast(pd.Update_to_TS AS datetime)) Update_To_TS_pd ,
	   max(cast(phd.Update_From_TS AS datetime)) Update_From_TS_phd ,
       max(cast(phd.Update_to_TS AS datetime)) Update_To_TS_phd ,
	   --us.UserID ,
       p.Project_Borrower_Entity,
	   p.Project_Name_Alias,
	   p.ID_Project_TNumber,
	   case when cMasterProject is not null then cMasterProject else Project_Name end as Project_Name,
	   p.Description,
	   p.Date_Commitment,
	   p.Direct_Indirect,
	   b.ID_Client_Sector as CEFC_Sector,
	   p.cFocus,
	   p.Finance_Type,
	   p.Finance_Type_End_Borrower_Risk,
	   l.Loc_State,
	   l.Loc_Postcode,
	   l.Loc_Electorate,
	   p.Fund_Innovation,
	   p.Fund_North,
	   p.Fund_Reef,
	   p.Fund_Cities,
	   p.Industry_Division,
	   p.cTechnology,
	   sum(b.Nameplate_Generation_CapacityMW_New*l.Percent_of_Project_Amt)as Nameplate_Generation_CapacityMW_New ,
	   sum(b.Nameplate_Generation_CapacityMW_Existing*l.Percent_of_Project_Amt) as Nameplate_Generation_CapacityMW_Existing,
	   p.Permited_Investment,
	   p.CEFC_Section,
	   p.LCAL_Deal,
	   p.Shadow_Credit_Rating,
	   l.Percent_of_Project_Amt as loc_Percent_of_Project_Amt,
	   l.Percent_of_Project_tCO2_savings as loc_Percent_of_Project_tCO2_savings,
	   sum(b.Amt_cCEFC*l.Percent_of_Project_Amt) as Amt_cCEFC,
	   sum(b.Amt_cFunding_3rd_Party*l.Percent_of_Project_Amt) as Amt_cFunding_3rd_Party,
	   sum(b.Amt_cFunding_Partner*l.Percent_of_Project_Amt) as Amt_cFunding_Partner,
	   sum(b.Amt_cEquity_Internal*l.Percent_of_Project_Amt) as Amt_cEquity_Internal,
	   sum(b.Amt_cEquity_Other*l.Percent_of_Project_Amt) as Amt_cEquity_Other,
	   sum(b.Amt_cFunding_Grant*l.Percent_of_Project_Amt) as Amt_cFunding_Grant,
	   sum(b.Amt_cSum_Funding_Other*l.Percent_of_Project_Amt) as Amt_cSum_Funding_Other,
	   sum(b.Total_Funds_Mobilised_Calc*l.Percent_of_Project_Amt) as Total_Funds_Mobilised_Calc,
	   sum(b.Private_Sector_Leverage_Calc*l.Percent_of_Project_Amt) as Private_Sector_Leverage_Calc,
	   sum(b.cAssessment_Savings_Annual_TCO2*l.Percent_of_Project_Amt) as cAssessment_Savings_Annual_TCO2,
	   sum(b.cAssessment_Savings_TCO2_Life*l.Percent_of_Project_Amt) as cAssessment_Savings_TCO2_Life,
	   sum(b.cAssessment_NPV_CEFC_Cost*l.Percent_of_Project_Amt) as Assessment_NPV_CEFC_Cost,
	   sum(b.cAssessment_NPV_Gov_Cost*l.Percent_of_Project_Amt) as cAssessment_NPV_Gov_Cost,
	   b.Concession_flag_Calc,
	   sum(b.Amt_cConcessionality*l.Percent_of_Project_Amt) as Amt_cConcessionality,
	   sum(b.Concession_per_tCO2_Calc*l.Percent_of_Project_Amt) as Concession_per_tCO2_Calc ,
	   b.cAssessment_Credit_Risk,
	   sum(b.Amt_cCGBR_5yr*l.Percent_of_Project_Amt) as Amt_cCGBR_5yr, 
	   p.ID_Master_Project,
	   p.cMasterProject,
	   p.cStatus,
	   pd.ID_Priority,
	   pd.Priority,
	   phd.ID_Phase,
	   phd.Phase_Name,
	   phd.Phase_Description,
	   sum(b.Amt_cCommitment*l.Percent_of_Project_Amt) as Amt_cCommitment,
	   sum(cdf.Gross_Principal*l.Percent_of_Project_Amt) as Gross_Principal,
	   sum(cdf.Capitalised_Interest*l.Percent_of_Project_Amt) as Capitalised_Interest,
	   sum(cdf.Capitalised_Fees*l.Percent_of_Project_Amt) as Capitalised_Fees,
	   sum([Amt_cLiveCommitment]*l.Percent_of_Project_Amt) as Amt_cLiveCommitment,
	   sum([Amt_cNonTriggeredCommitment]*l.Percent_of_Project_Amt) as Amt_cNonTriggeredCommitment   
FROM CORE.Base_Data_Fact b
	left join core.Projects_Dimension p
	on b.ID_Project = p.ID_Project
	left join core.location_Dimension l
	on l.id_project = p.ID_project
	 left join core.Priority_Dimension pd
	on b.ID_Priority = pd.ID_Priority
	left join core.Phases_Dimension phd
	 on b.ID_Phase = phd.ID_Phase
    --left join security.User_Security us
	 --on p.id_project_TNumber = us.Project_TNumber
	left join (select ID_Project_TNumber,
					  sum(Gross_Principal) as Gross_Principal,
					  sum(Capitalised_Interest) as Capitalised_Interest,
					  sum(Capitalised_Fees) as Capitalised_Fees
		       from core.Commitments_Deployments_Fact 
			   group by ID_Project_TNumber
			   ) cdf
	 on p.ID_Project_TNumber = cdf.ID_Project_TNumber
	
WHERE @load_date >=  cast(b.Update_From_TS as datetime) and @load_date < cast(isnull(b.Update_To_TS,@local_date) as datetime)
and @load_date >=  cast(p.Update_From_TS as datetime) and @load_date < cast(isnull(p.Update_To_TS,@local_date) as datetime)
and @load_date >=  cast(l.Update_From_TS as datetime) and @load_date < cast(isnull(l.Update_To_TS,@local_date) as datetime)
and @load_date >=  cast(pd.Update_From_TS as datetime) and @load_date < cast(isnull(pd.Update_To_TS,@local_date) as datetime)
and @load_date >=  cast(phd.Update_From_TS as datetime) and @load_date < cast(isnull(phd.Update_To_TS,@local_date) as datetime)
group by --us.UserID ,
       p.Project_Borrower_Entity,
	   p.Project_Name_Alias,
	   p.ID_Project_TNumber,
	   p.Project_Name,
	   p.Description,
	   p.Date_Commitment,
	   p.Direct_Indirect,
	   b.ID_Client_Sector ,
	   p.cFocus,
	   p.Finance_Type,
	   p.Finance_Type_End_Borrower_Risk,
	   l.Loc_State,
	   l.Loc_Postcode,
	   l.Loc_Electorate,
	   p.Fund_Innovation,
	   p.Fund_North,
	   p.Fund_Reef,
	   p.Fund_Cities,
	   p.Industry_Division,
	   p.cTechnology,
	   p.Permited_Investment,
	   p.CEFC_Section,
	   p.LCAL_Deal,
	   p.Shadow_Credit_Rating,
	   l.Percent_of_Project_Amt,
	   l.Percent_of_Project_tCO2_savings,
	   b.Concession_flag_Calc,
	   b.cAssessment_Credit_Risk,
	   p.ID_Master_Project,
	   p.cMasterProject,
	   p.cStatus,
	   pd.ID_Priority,
	   pd.Priority,
	   phd.ID_Phase,
	   phd.Phase_Name,
	   phd.Phase_Description
GO

