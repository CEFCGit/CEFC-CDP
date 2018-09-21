-- ==========================================================================
-- Created by: Yolinda Moodley
-- Create date: 06/09/2018
-- Description:	Create stored procedure to get the relevant Aggregation Data for Portfolio Reporting 
-- ==========================================================================

CREATE OR ALTER procedure [core].[Portfolio_Aggregation_Data] @file_date datetime
as 

	declare @local_date datetime

	declare @t_file_date datetime

  	select @local_date =  DBO.FN_LOCALDATE (GETDATE());

	select @file_date = cast(@file_date as datetime);

	select @t_file_date = case when @file_date = 'Mar  1 2018 12:00AM' then cast('Apr  1 2018 12:00AM' as datetime) else cast(@file_date as datetime) end; 

	with temp
	as 
	    (
		select	max(prjd.Update_From_TS) b_Update_From_TS,
		max(prjd.Update_to_TS) b_Update_To_TS,
		prjd.ID_Project,
		sum(Amt_CEFC) as Amt_CEFC,
		prjd.ID_Project_TNumber
		from core.Projects_Dimension prjd
		join 
		(select max(bdf.Update_From_TS) b_Update_From_TS,
				max(bdf.Update_to_TS) b_Update_To_TS,
			    sum(bdf.Amt_cCEFC) as Amt_CEFC,
				case when charindex('II',pd1.Project_Name) > 0 then substring(pd1.Project_name,1,(charindex('II',pd1.Project_Name)-2)) else pd1.Project_Name end  as Project_Name     
		 from core.Base_Data_Fact bdf
			join 
			(
			select	 max(pd.Update_From_TS) a_Update_From_TS,
					 max(pd.Update_to_TS) a_Update_To_TS,
					 pd.ID_Project,
					 pd.Project_Name
			from core.Projects_Dimension pd
				join 
					(select max(a.Update_From_TS) a_Update_From_TS,
							max(a.Update_to_TS) a_Update_To_TS,
							max(b.Update_From_TS) b_Update_From_TS,
							max(b.Update_to_TS) b_Update_To_TS,
							a.ID_Project,
							b.Project_Name
					from core.Aggregation_Fact a
					join core.Projects_Dimension b
					  on a.ID_Project = b.ID_Project
					where EOMONTH(@t_file_date) >= cast(b.Update_From_TS as datetime) 
					and EOMONTH(@t_file_date) <= cast(isnull(b.Update_to_TS,@local_date) as datetime)
					--and a.File_Date = @file_date 
					group by a.ID_Project,
							 b.Project_Name  ) pd2
				on pd.Project_Name like pd2.Project_Name+'%'
				where EOMONTH(@t_file_date) >= cast(pd.Update_From_TS as datetime ) 
				and EOMONTH(@t_file_date) <= cast(isnull(pd.Update_to_TS,@local_date) as datetime)
				group by pd.ID_Project,
						 pd.Project_Name) pd1
			on bdf.ID_Project = pd1.ID_Project
			where EOMONTH(@t_file_date) >= cast(bdf.Update_From_TS as datetime) 
			and EOMONTH(@t_file_date) <= cast(isnull(bdf.Update_to_TS,@local_date) as datetime)
			group by case when charindex('II',pd1.Project_Name) > 0 then substring(pd1.Project_name,1,(charindex('II',pd1.Project_Name)-2)) else pd1.Project_Name end       
			) as camt
		on prjd.Project_Name = camt.Project_Name
		where EOMONTH(@t_file_date) >= cast(prjd.Update_From_TS as datetime) 
		and EOMONTH(@t_file_date) <= cast(isnull(prjd.Update_to_TS,@local_date) as datetime)
		group by prjd.ID_Project,
				 prjd.ID_Project_TNumber
		) 

		
		select max(af.Update_from_TS) as Update_from_TS
			  ,max(af.Update_to_TS) as Update_to_TS
			  ,af.[ID_Project]
			  ,af.[Postcode]
			  ,af.[Principal_Outstanding]
			  ,af.[Total_Amount_Financed]
			  ,af.[Total_Rebate_to_date_exclGST]
			  ,af.[Total_Rebate_to_date_inclGST]
			  ,t.Amt_CEFC
			  ,t.ID_Project_TNumber
			  ,b.state as postcode_state
			  ,c.Electoral_division as Electorate
			  ,case when acd1.CEFC_Technology = '' then acd1.Asset_Category else acd1.CEFC_Technology end as CEFC_Technology
			  ,af.Contract_Number
			  ,isnull(asd.Status,'Active') as Status
		from core.Aggregation_Fact af
		join (select  max(cast(af1.File_Date as datetime)) as Agg_FileDate
		        	,af1.[ID_Project]   	    	  
				from core.Aggregation_Fact af1
				where cast(af1.file_date as datetime) <= eomonth(format(@file_date,'yyyy-MM-dd'))   
				group by af1.[ID_Project]) max_dates 
		 on af.File_Date = max_dates.Agg_FileDate
			and af.ID_Project = max_dates.ID_Project
		left join [core].[Assets_Dimension] asd
		 on af.ID_Project = asd.ID_Project
		    and af.Contract_Number = asd.Contract_Number
		    and case when af.Asset_Number = 'Not Available' then asd.Asset_Number end = asd.Asset_Number
		    and cast(af.File_Date as datetime) = cast(asd.FileDate as datetime)
		left join temp t
		 on af.ID_Project = t.ID_Project
		left join core.Post_Codes b
		 on (case when substring(af.Postcode,1,1) = '0' then substring(af.Postcode,2,len(af.Postcode)-1) else af.Postcode end) = b.postcode
		left join core.Post_Codes_Electorate c
		on b.postcode = c.Postcode 
		left join (select max(acd.Update_From_TS) acd_Update_From_TS
						 ,max(acd.Update_to_TS) acd_Update_To_TS
						 ,acd.Asset_Category
						 ,acd.CEFC_Technology 
					from core.Asset_Category_Dimension acd
					where EOMONTH(@file_date) >= cast(isnull(acd.Update_From_TS,@file_date) as datetime) 
					and EOMONTH(@file_date) <= cast(isnull(acd.Update_to_TS,@local_date) as datetime)
					group by acd.Asset_Category
							,acd.CEFC_Technology ) acd1
		  on asd.Category = acd1.Asset_Category
   where (af.ID_Project = 'S2537'
   and asd.Description in ('Solar Energy Battery','Solar Energy Equipment','Solar Energy Panels','Solar Water Heater'))
    or
   af.ID_Project != 'S2537' 

   group by  af.[ID_Project]
			  ,af.[Postcode]
			  ,af.[Principal_Outstanding]
			  ,af.[Total_Amount_Financed]
			  ,af.[Total_Rebate_to_date_exclGST]
			  ,af.[Total_Rebate_to_date_inclGST]
			  ,t.Amt_CEFC
			  ,t.ID_Project_TNumber
			  ,b.state 
			  ,c.Electoral_division 
			  ,case when acd1.CEFC_Technology = '' then acd1.Asset_Category else acd1.CEFC_Technology end 
			  ,af.Contract_Number
			  ,isnull(asd.Status,'Active') 
  

  
	
GO


