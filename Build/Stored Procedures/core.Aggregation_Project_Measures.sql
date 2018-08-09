-- ==========================================================================
-- Created by: Yolinda Moodley
-- Create date: 08/08/2018
-- Description:	Create stored procedure to get the relevant commitment amounts based on Aggregation File Date
-- Version Control
-- ==========================================================================

CREATE or alter  procedure [core].Aggregation_Project_Measures @file_date datetime
as 

	declare @local_date datetime
	--declare @t_file_date nvarchar(20)
  

	select @local_date =  DBO.FN_LOCALDATE (GETDATE());

	--select @t_file_date = EOMONTH(case when len(@file_date) = 6 then '01-'+@file_date else @file_date end); 

	with temp
	as 
	    (
		select  b.ID_Project,
		max(b.Update_From_TS) b_Update_From_TS,
		max(b.Update_to_TS) b_Update_To_TS,
		max(p.Update_From_TS) p_Update_From_TS,
		max(p.Update_to_TS) p_Update_To_TS,
		sum(Amt_cCEFC) as Amt_cCEFC,
		sum(Amt_cCommitment) as Amt_cCommitment,
		p.Project_Name,
		p.cOrganisations 
		from core.Base_Data_Fact b
		left join core.Projects_Dimension p
			on b.ID_Project = p.ID_Project
		where EOMONTH(@file_date) >= convert(datetime,b.Update_From_TS) 
		and EOMONTH(@file_date) <= convert(datetime,isnull(b.Update_to_TS,DBO.FN_LOCALDATE(GETDATE())))
		and EOMONTH(@file_date) >= convert(datetime,p.Update_From_TS) 
		and EOMONTH(@file_date) <= convert(datetime,isnull(p.Update_to_TS,DBO.FN_LOCALDATE(GETDATE())))
		group by	b.ID_Project,
					p.Project_Name,
					p.cOrganisations 
		) 

    select af.[ID_Project]
      ,af.[Contract_Number]
      ,af.[Asset_Number]
      ,af.[ANZSIC_Code]
      ,af.[Balloon_Amount]
      ,af.[Brand]
      ,af.[CEFC_Rebate_Monthly]
      ,af.[Contract_Start_Date]
      ,af.[Discounted_Interest_Rate]
      ,af.[Funder_Margin]
      ,af.[Maturity_Date]
      ,af.[Postcode]
      ,af.[Principal_Outstanding]
      ,af.[Product_Type]
      ,af.[Repayment_Frequency]
      ,af.[State]
      ,af.[Term]
      ,af.[Termination_Date]
      ,af.[Total_Amount_Financed]
      ,af.[Total_Rebate_to_date_exclGST]
      ,af.[Total_Rebate_to_date_inclGST]
      ,af.[File_Date]
	  ,asd.[Category]
	  ,asd.[Description]
	  ,asd.[Variant]
	  ,asd.[Make]
	  ,asd.[Model]
	  ,asd.[Year]
	  ,asd.[Status]
	  ,ad.[Code]
      ,ad.[Division]
      ,ad.[Subdivision]
      ,ad.[Description]
	  ,ad.ABS_Division
	  ,ad.ABS_Subdivision
	  ,t.Amt_cCEFC
	  ,t.Amt_cCommitment
	  ,t.Project_Name
	  ,t.cOrganisations
	from core.Aggregation_Fact af
	left join [core].[Assets_Dimension] asd
	  on af.ID_Project = asd.ID_Project
	  and af.Contract_Number = asd.Contract_Number
	  and af.Asset_Number = asd.Asset_Number
	  and af.File_Date = asd.FileDate
	left join core.ANZSIC_Dimension ad
	  on af.ID_Project = ad.ID_Project
	  and af.ANZSIC_Code = ad.Code
	  and EOMONTH(@file_date) >= convert(datetime,ad.Update_From_TS)
	  and EOMONTH(@file_date) <= convert(datetime,isnull(ad.Update_to_TS,DBO.FN_LOCALDATE(GETDATE())))
    left join temp t
	  on af.ID_Project = t.ID_Project

	where convert(datetime,af.File_Date) = @file_date
GO

