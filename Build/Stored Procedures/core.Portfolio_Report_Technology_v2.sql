-- ==========================================================================
-- Created by: Yolinda Moodley
-- Create date: 15/05/2018
-- Description:	Create stored procedure to build the Portfolio Report by Technology
-- Version Control
--01/06/2018(YM) Added the Sub Amortisation Amount from Commitments_Deployments Fact
--06/06/2018(YM) Removed all references to the Security Table
--16/07/18(YM) Added the Live Commitment and NonTriggered Commitment
--06/09/18(YM) Added the Aggregation Data
-- ==========================================================================

CREATE or alter procedure [core].[Portfolio_Report_Technology] @load_date datetime
as 

declare @local_date datetime 
declare @agg_date datetime

select @local_date =  DBO.FN_LOCALDATE (GETDATE());
select @agg_date = dateadd(month,-1,@load_date);

-- Create temporary table to hold output of stored procedure
CREATE TABLE #TEMP (
[ID_Project] nvarchar(100),
[Postcode] nvarchar(5),
[Principal_Outstanding] numeric(20,2),
[Total_Amount_Financed] numeric(20,2),
[Total_Rebate_to_date_exclGST] numeric(20,2),
[Total_Rebate_to_date_inclGST] numeric(20,2),
Amt_CEFC numeric(20,2),
ID_Project_TNumber nvarchar(20),
postcode_state nvarchar(50),
suburb nvarchar(50),
Electorate nvarchar(50),
CEFC_Technology nvarchar(100),
Contract_Number nvarchar(50)
)
 
-- Insert the output of stored procedures into temp table
INSERT INTO #TEMP EXECUTE core.Portfolio_Aggregation_Data @agg_date;



SELECT @load_date AS ParamIn ,   
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
	   b.Nameplate_Generation_CapacityMW_New*td.Percent_of_Project_Amt as Nameplate_Generation_CapacityMW_New ,
	   b.Nameplate_Generation_CapacityMW_Existing*td.Percent_of_Project_Amt as Nameplate_Generation_CapacityMW_Existing,
	   p.Permited_Investment,
	   p.CEFC_Section,
	   p.LCAL_Deal,
	   p.Shadow_Credit_Rating,
	   b.Amt_cCEFC*td.Percent_of_Project_Amt as Amt_cCEFC,
	   b.Amt_cFunding_3rd_Party*td.Percent_of_Project_Amt as Amt_cFunding_3rd_Party,
	   b.Amt_cFunding_Partner*td.Percent_of_Project_Amt as Amt_cFunding_Partner,
	   b.Amt_cEquity_Internal*td.Percent_of_Project_Amt as Amt_cEquity_Internal,
	   b.Amt_cEquity_Other*td.Percent_of_Project_Amt as Amt_cEquity_Other,
	   b.Amt_cFunding_Grant*td.Percent_of_Project_Amt as Amt_cFunding_Grant,
	   b.Amt_cSum_Funding_Other*td.Percent_of_Project_Amt as Amt_cSum_Funding_Other,
	   b.Total_Funds_Mobilised_Calc*td.Percent_of_Project_Amt as Total_Funds_Mobilised_Calc,
	   b.Private_Sector_Leverage_Calc*td.Percent_of_Project_Amt as Private_Sector_Leverage_Calc,
	   b.cAssessment_Savings_Annual_TCO2*td.Percent_of_Project_Amt as cAssessment_Savings_Annual_TCO2,
	   b.cAssessment_Savings_TCO2_Life*td.Percent_of_Project_Amt as cAssessment_Savings_TCO2_Life,
	   b.cAssessment_NPV_CEFC_Cost*td.Percent_of_Project_Amt as Assessment_NPV_CEFC_Cost,
	   b.cAssessment_NPV_Gov_Cost*td.Percent_of_Project_Amt as cAssessment_NPV_Gov_Cost,
	   b.Concession_flag_Calc,
	   b.Amt_cConcessionality*td.Percent_of_Project_Amt as Amt_cConcessionality,
	   b.Concession_per_tCO2_Calc*td.Percent_of_Project_Amt as Concession_per_tCO2_Calc ,
	   b.cAssessment_Credit_Risk,
	   b.Amt_cCGBR_5yr*td.Percent_of_Project_Amt as Amt_cCGBR_5yr, 
	   p.ID_Master_Project,
	   p.cMasterProject,
	   p.cStatus,
	   pd.ID_Priority,
	   pd.Priority,
	   phd.ID_Phase,
	   phd.Phase_Name,
	   phd.Phase_Description,
	   b.Amt_cCommitment*td.Percent_of_Project_Amt as Amt_cCommitment,
	   cdf.Gross_Principal*td.Percent_of_Project_Amt as Gross_Principal,
	   cdf.Capitalised_Interest*td.Percent_of_Project_Amt as Capitalised_Interest,
	   cdf.Capitalised_Fees*td.Percent_of_Project_Amt as Capitalised_Fees,
	   [Amt_cLiveCommitment]*td.Percent_of_Project_Amt as Amt_cLiveCommitment,
	   [Amt_cNonTriggeredCommitment]*td.Percent_of_Project_Amt as Amt_cNonTriggeredCommitment,
	   t.Amt_CEFC as Agg_CEFC,
	   t.Contract_Number as Agg_Contract,
	   t.Postcode as Agg_Postcode,
	   t.Electorate as Agg_Electorate,
	   t.postcode_state as Agg_State,
	   t.CEFC_Technology as Agg_Technology,
	   t.Principal_Outstanding,
	   td.cTechnology,
	   td.Tec_Technology,
	   td.Percent_of_Project_Amt as tech_Percent_of_Project_Amt,
	   td.Percent_of_Project_tCO2_savings as tech_Percent_of_Project_tCO2_savings,
	   td.Percent_renewable_calc,
	   tm.Renewable
FROM ( select max(cast(Update_From_TS AS datetime)) Update_From_TS_b ,
       max(cast(Update_to_TS AS datetime)) Update_To_TS_b ,
	   Nameplate_Generation_CapacityMW_New,
	   Nameplate_Generation_CapacityMW_Existing,
	   Amt_cCEFC,
	   Amt_cFunding_3rd_Party,
	   Amt_cFunding_Partner,
	   Amt_cEquity_Internal,
	   Amt_cEquity_Other,
	   Amt_cFunding_Grant,
	   Amt_cSum_Funding_Other,
	   Total_Funds_Mobilised_Calc,
	   Private_Sector_Leverage_Calc,
	   cAssessment_Savings_Annual_TCO2,
	   cAssessment_Savings_TCO2_Life,
	   cAssessment_NPV_CEFC_Cost,
	   cAssessment_NPV_Gov_Cost,
	   Concession_flag_Calc,
	   Amt_cConcessionality,
	   Concession_per_tCO2_Calc ,
	   cAssessment_Credit_Risk,
	   Amt_cCGBR_5yr,
	   Amt_cCommitment,
	   Amt_cLiveCommitment,
	   Amt_cNonTriggeredCommitment,
	   ID_Project,
	   ID_Priority,
	   ID_Phase,
	   ID_Client_Sector
	   from CORE.Base_Data_Fact
	   where @load_date >=  cast(Update_From_TS as datetime) and @load_date < cast(isnull(Update_To_TS,@local_date) as datetime)
	   group by Nameplate_Generation_CapacityMW_New,
	   Nameplate_Generation_CapacityMW_Existing,
	   Amt_cCEFC,
	   Amt_cFunding_3rd_Party,
	   Amt_cFunding_Partner,
	   Amt_cEquity_Internal,
	   Amt_cEquity_Other,
	   Amt_cFunding_Grant,
	   Amt_cSum_Funding_Other,
	   Total_Funds_Mobilised_Calc,
	   Private_Sector_Leverage_Calc,
	   cAssessment_Savings_Annual_TCO2,
	   cAssessment_Savings_TCO2_Life,
	   cAssessment_NPV_CEFC_Cost,
	   cAssessment_NPV_Gov_Cost,
	   Concession_flag_Calc,
	   Amt_cConcessionality,
	   Concession_per_tCO2_Calc ,
	   cAssessment_Credit_Risk,
	   Amt_cCGBR_5yr,
	   Amt_cCommitment,
	   Amt_cLiveCommitment,
	   Amt_cNonTriggeredCommitment,
	   ID_Project,
	   ID_Priority,
	   ID_Phase,
	   ID_Client_Sector)  b
	left join ( 
	   select max(cast(Update_From_TS AS datetime)) Update_From_TS_p ,
			  max(cast(Update_to_TS AS datetime)) Update_To_TS_p,
			  Project_Borrower_Entity,
			  Project_Name_Alias,
			  ID_Project_TNumber,
	          cMasterProject,
			  Project_Name,
			  Description,
	          Date_Commitment,
	          Direct_Indirect,
			  cFocus,
			  Finance_Type,
				Finance_Type_End_Borrower_Risk,
				Fund_Innovation,
				Fund_North,
				Fund_Reef,
				Fund_Cities,
				Industry_Division,
				cTechnology,
				Permited_Investment,
				CEFC_Section,
				LCAL_Deal,
				Shadow_Credit_Rating,
				ID_Master_Project,	   
				cStatus,
				ID_Project 
	    from core.Projects_Dimension
		where @load_date >=  cast(Update_From_TS as datetime) and @load_date < cast(isnull(Update_To_TS,@local_date) as datetime)
		group by Project_Borrower_Entity,
			  Project_Name_Alias,
			  ID_Project_TNumber,
	          cMasterProject,
			  Project_Name,
			  Description,
	          Date_Commitment,
	          Direct_Indirect,
			  cFocus,
				Finance_Type,
				Finance_Type_End_Borrower_Risk,
				Fund_Innovation,
				Fund_North,
				Fund_Reef,
				Fund_Cities,
				Industry_Division,
				cTechnology,
				Permited_Investment,
				CEFC_Section,
				LCAL_Deal,
				Shadow_Credit_Rating,
				ID_Master_Project,	   
				cStatus,
				ID_Project ) p
	on b.ID_Project = p.ID_Project
	left join (select	max(cast(Update_From_TS AS datetime)) Update_From_TS_l ,
						max(cast(Update_to_TS AS datetime)) Update_To_TS_l,
						Percent_of_Project_Amt,
						Loc_State,
						Loc_Postcode,
						Loc_Electorate,
						Percent_of_Project_tCO2_savings,
						id_project
			   from core.location_Dimension
			   where @load_date >=  cast(Update_From_TS as datetime) and @load_date < cast(isnull(Update_To_TS,@local_date) as datetime)
			    group by Percent_of_Project_Amt,
						Loc_State,
						Loc_Postcode,
						Loc_Electorate,
						Percent_of_Project_tCO2_savings,
						id_project )l
	on l.id_project = p.ID_project
	 left join (select  max(cast(Update_From_TS AS datetime)) Update_From_TS_pd ,
						max(cast(Update_to_TS AS datetime)) Update_To_TS_pd , 
						ID_Priority,
						Priority
						from core.Priority_Dimension
						where @load_date >=  cast(Update_From_TS as datetime) and @load_date < cast(isnull(Update_To_TS,@local_date) as datetime)
						 group by ID_Priority,
						          Priority) pd
	on b.ID_Priority = pd.ID_Priority
	left join (select	 max(cast(Update_From_TS AS datetime)) Update_From_TS_phd ,
						max(cast(Update_to_TS AS datetime)) Update_To_TS_phd ,
						ID_Phase,
						Phase_Name,
						Phase_Description
				from core.Phases_Dimension
				where @load_date >=  cast(Update_From_TS as datetime) and @load_date < cast(isnull(Update_To_TS,@local_date) as datetime)
			    group by ID_Phase,
				         Phase_Name,
						 Phase_Description) phd
	 on b.ID_Phase = phd.ID_Phase
	 
	left join (select	 max(cast(Update_From_TS AS datetime)) Update_From_TS_td ,
						max(cast(Update_to_TS AS datetime)) Update_To_TS_td ,
						ID_Project,
						ID_Technology,
						cTechnology,
						Tec_Technology,
						Percent_of_Project_Amt as Percent_of_Project_Amt,
						Percent_of_Project_tCO2_savings as Percent_of_Project_tCO2_savings,
						Percent_renewable_calc
				from core.Technology_Dimension
				where @load_date >=  cast(Update_From_TS as datetime) and @load_date < cast(isnull(Update_To_TS,@local_date) as datetime)
			    group by ID_Project,
						ID_Technology,
						cTechnology,
						Tec_Technology,
						Percent_of_Project_Amt,
						Percent_of_Project_tCO2_savings,
						Percent_renewable_calc
				) td
		  on b.ID_Project = td.ID_Project
		left join (select	 max(cast(Update_From_TS AS datetime)) Update_From_TS_td ,
						    max(cast(Update_to_TS AS datetime)) Update_To_TS_td ,
							ID_Technology,
							Renewable
					from core.TechMatrix_Dimension
					where @load_date >=  cast(Update_From_TS as datetime) and @load_date < cast(isnull(Update_To_TS,@local_date) as datetime)
					group by ID_Technology,
							Renewable
				  ) tm
		  on td.ID_Technology = tm.ID_Technology
    --left join security.User_Security us
	 --on p.id_project_TNumber = us.Project_TNumber
	left join (select ID_Project_TNumber,
					  sum(Gross_Principal) as Gross_Principal,
					  sum(Capitalised_Interest) as Capitalised_Interest,
					  sum(Capitalised_Fees) as Capitalised_Fees
		       from core.Commitments_Deployments_Fact
			   where cast(To_Date as datetime) = EOMONTH(@agg_date) 
			   group by ID_Project_TNumber
			   ) cdf
	 on p.ID_Project_TNumber = cdf.ID_Project_TNumber

	 left join #TEMP t
	   on b.ID_Project = t.ID_Project
	



-- CLEAN UP
DROP TABLE #TEMP;

GO


