/****** Object:  StoredProcedure [core].[Purge_Backup_CDP_Tables]    Script Date: 19/06/2018 12:23:30 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



-- ==========================================================================
-- Created by: Yolinda Moodley
-- Create date: 13/06/2018
-- Description:	Create stored procedure to keep only the most recent backup schema and tables
-- Version Control
-- ==========================================================================

ALTER      procedure [core].[Purge_Backup_CDP_Tables]
as

declare @SqlStatement nvarchar(400)
declare @schname nvarchar(50)
declare @tabname nvarchar(100)

--==============================================================
--Drop Tables
--===============================================================
declare table_cursor cursor for 
		select	s.name,
				st.name
		from sys.tables st
		join sys.schemas s
			on st.schema_id = s.schema_id
		where s.name <> (
							select sn.name
							from sys.schemas sn
							join sys.tables tab
								on sn.schema_id = tab.schema_id
							where tab.create_date = (
														select max(sta.create_date)
														from sys.schemas sch
														join sys.tables sta
															on sta.schema_id = sch.schema_id
														where sch.name like 'backup_%'
													)
						)
		and s.name like 'backup_%'

				

open table_cursor
	fetch next from table_cursor 
	into @schname, @tabname

while @@FETCH_STATUS = 0
	begin
	  
	   set @SqlStatement = 'drop table '+'['+@schname+'].['+@tabname+']'

		--print @SqlStatement
		exec sp_executesql @SqlStatement
		
      fetch next from table_cursor 
	  into @schname, @tabname
	  	 
	end 

CLOSE table_cursor
DEALLOCATE table_cursor

--==============================================================
--Drop Schemas
--===============================================================
declare schema_cursor cursor for
 
  select sc.name
  from sys.schemas sc
  where sc.name <> ( 
  select sn.name
  from sys.schemas sn
  join sys.tables tab
	on sn.schema_id = tab.schema_id
  where tab.create_date = (
							select max(sta.create_date)
							from sys.schemas sch
							join sys.tables sta
								on sta.schema_id = sch.schema_id
							where sch.name like 'backup_%'
						  )
					)
					
   and sc.name like 'backup_%'	
   
   								
	open schema_cursor
	fetch next from schema_cursor
	into @schname

	while @@FETCH_STATUS = 0
		begin

			set @SqlStatement = 'drop schema '+'['+@schname+']'
			--print @SqlStatement
			exec sp_executesql @SqlStatement

			fetch next from schema_cursor 
			into @schname
	  	 
		end 

CLOSE schema_cursor
DEALLOCATE schema_cursor
GO


