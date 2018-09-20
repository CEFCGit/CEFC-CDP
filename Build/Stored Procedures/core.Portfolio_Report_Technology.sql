-- ==========================================================================
-- Created by: Yolinda Moodley
-- Create date: 15/05/2018
-- Description:	Create stored procedure to build the Portfolio Report by Technology
-- Version Control
--01/06/18(YM)	: Added the Sub Amortisation Amount from Commitments_Deployments Fact
--06/06/18(YM)	: Removed all references to the Security Table
--16/07/18(YM)  : Added the Live Commitment and NonTriggered Commitment
--20/09/18(YM)  : Added the CEFC_Strategic_Sector
-- ==========================================================================

CREATE or alter procedure [core].[Portfolio_Report_Technology] @load_date datetime
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
	   max(cast(td.Update_From_TS AS datetime)) Update_From_TS_td ,
       max(cast(td.Update_to_TS AS datetime)) Update_To_TS_td ,
	   max(cast(tm.Update_From_TS AS datetime)) Update_From_TS_tm ,
       max(cast(tm.Update_to_TS AS datetime)) Update_To_TS_tm ,
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
	   p.Fund_Innovation,
	   p.Fund_North,
	   p.Fund_Reef,
	   p.Fund_Cities,
	   p.Industry_Division,
	   p.cTechnology,
	   sum(b.Nameplate_Generation_CapacityMW_New*td.Percent_of_Project_Amt)as Nameplate_Generation_CapacityMW_New ,
	   sum(b.Nameplate_Generation_CapacityMW_Existing*td.Percent_of_Project_Amt) as Nameplate_Generation_CapacityMW_Existing,
	   p.Permited_Investment,
	   p.CEFC_Section,
	   p.LCAL_Deal,
	   p.Shadow_Credit_Rating,
	   sum(b.Amt_cCEFC*td.Percent_of_Project_Amt) as Amt_cCEFC,
	   sum(b.Amt_cFunding_3rd_Party*td.Percent_of_Project_Amt) as Amt_cFunding_3rd_Party,
	   sum(b.Amt_cFunding_Partner*td.Percent_of_Project_Amt) as Amt_cFunding_Partner,
	   sum(b.Amt_cEquity_Internal*td.Percent_of_Project_Amt) as Amt_cEquity_Internal,
	   sum(b.Amt_cEquity_Other*td.Percent_of_Project_Amt) as Amt_cEquity_Other,
	   sum(b.Amt_cFunding_Grant*td.Percent_of_Project_Amt) as Amt_cFunding_Grant,
	   sum(b.Amt_cSum_Funding_Other*td.Percent_of_Project_Amt) as Amt_cSum_Funding_Other,
	   sum(((([Amt_cCEFC]+[Amt_cFunding_Partner])+[Amt_cEquity_Other])+[Amt_cFunding_Grant])*td.Percent_of_Project_Amt) as Total_Funds_Mobilised_Calc,
	   sum((([Amt_cEquity_Other]+[Amt_cFunding_Partner])/nullif([Amt_cCEFC],(0)))*td.Percent_of_Project_Amt) as Private_Sector_Leverage_Calc,
	   sum(b.cAssessment_Savings_Annual_TCO2*td.Percent_of_Project_Amt) as cAssessment_Savings_Annual_TCO2,
	   sum(b.cAssessment_Savings_TCO2_Life*td.Percent_of_Project_Amt) as cAssessment_Savings_TCO2_Life,
	   sum(b.cAssessment_NPV_CEFC_Cost*td.Percent_of_Project_Amt) as Assessment_NPV_CEFC_Cost,
	   sum(b.cAssessment_NPV_Gov_Cost*td.Percent_of_Project_Amt) as cAssessment_NPV_Gov_Cost,
	   (case when [Concessionality_Calc]>(0) then 'Y' else 'N' end) as Concession_flag_Calc,
	   sum(b.Amt_cConcessionality*td.Percent_of_Project_Amt) as Amt_cConcessionality,
	   sum(([Concessionality_Calc]/nullif([cAssessment_Savings_TCO2_Life],(0)))*td.Percent_of_Project_Amt) as Concession_per_tCO2_Calc ,
	   b.cAssessment_Credit_Risk,
	   sum(b.Amt_cCGBR_5yr*td.Percent_of_Project_Amt) as Amt_cCGBR_5yr ,
	   p.ID_Master_Project,
	   p.cMasterProject,
	   p.cStatus,
	   pd.ID_Priority,
	   pd.Priority,
	   phd.ID_Phase,
	   phd.Phase_Name,
	   phd.Phase_Description,
	   td.cTechnology,
	   td.Tec_Technology,
	   td.Percent_of_Project_Amt as tech_Percent_of_Project_Amt,
	   td.Percent_of_Project_tCO2_savings as tech_Percent_of_Project_tCO2_savings,
	   td.Percent_renewable_calc,
	   tm.Renewable,
	   sum(b.Amt_cCommitment*td.Percent_of_Project_Amt) as Amt_cCommitment,
	   sum(cdf.Gross_Principal*td.Percent_of_Project_Amt) as Gross_Principal,
	   sum(cdf.Capitalised_Interest*td.Percent_of_Project_Amt) as Capitalised_Interest,
	   sum(cdf.Capitalised_Fees*td.Percent_of_Project_Amt) as Capitalised_Fees,
	   sum([Amt_cLiveCommitment]*td.Percent_of_Project_Amt) as Amt_cLiveCommitment,
	   sum([Amt_cNonTriggeredCommitment]*td.Percent_of_Project_Amt) as Amt_cNonTriggeredCommitment,
	   P.CEFC_Strategic_Sector
FROM CORE.Base_Data_Fact b
	left JOIN core.Projects_Dimension p ON b.ID_Project = p.ID_Project
	left join core.Priority_Dimension pd
	on b.ID_Priority = pd.ID_Priority
	left join core.Phases_Dimension phd
	  on b.ID_Phase = phd.ID_Phase
    left join core.Technology_Dimension td
	  on b.ID_Project = td.ID_Project
    left join core.TechMatrix_Dimension tm
	  on td.ID_Technology = tm.ID_Technology
	--LEFT JOIN security.User_Security us ON p.id_project_TNumber = us.Project_TNumber
	left join (select ID_Project_TNumber,
					  sum(Gross_Principal) as Gross_Principal,
					  sum(Capitalised_Interest) as Capitalised_Interest,
					  sum(Capitalised_Fees) as Capitalised_Fees
		       from core.Commitments_Deployments_Fact 
			   where To_Date = EOMONTH(dateadd(month,-1,@load_date))
			   group by ID_Project_TNumber
			   ) cdf
	  on p.ID_Project_TNumber = cdf.ID_Project_TNumber

WHERE @load_date >=  cast(b.Update_From_TS as datetime) and @load_date < cast(isnull(b.Update_To_TS,@local_date) as datetime)
and @load_date >=  cast(p.Update_From_TS as datetime) and @load_date < cast(isnull(p.Update_To_TS,@local_date) as datetime)
and @load_date >=  cast(pd.Update_From_TS as datetime) and @load_date < cast(isnull(pd.Update_To_TS,@local_date) as datetime)
and @load_date >=  cast(phd.Update_From_TS as datetime) and @load_date < cast(isnull(phd.Update_To_TS,@local_date) as datetime)
and @load_date >=  cast(td.Update_From_TS as datetime) and @load_date < cast(isnull(td.Update_To_TS,@local_date) as datetime)
and @load_date >=  cast(tm.Update_From_TS as datetime) and @load_date < cast(isnull(tm.Update_To_TS,@local_date) as datetime)
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
	   (case when [Concessionality_Calc]>(0) then 'Y' else 'N' end),
	   b.cAssessment_Credit_Risk,
	   b.Loss_Given_Default_pct,
	   b.Loss_Estimated_pct,
	   p.ID_Master_Project,
	   p.cMasterProject,
	   p.cStatus,
	   pd.ID_Priority,
	   pd.Priority,
	   phd.ID_Phase,
	   phd.Phase_Name,
	   phd.Phase_Description,
	   td.cTechnology,
	   td.Tec_Technology,
	   td.Percent_of_Project_Amt,
	   td.Percent_of_Project_tCO2_savings,
	   td.Percent_renewable_calc,
	   tm.Renewable,
	   p.CEFC_Strategic_Sector
GO

