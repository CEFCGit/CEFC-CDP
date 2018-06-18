/****** Object:  StoredProcedure [core].[Purge_Backup_CDP_Tables]    Script Date: 19/06/2018 9:36:15 AM ******/
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

create or alter    procedure [core].[Purge_Backup_CDP_Tables]
as

declare @SqlStatement nvarchar(400)
declare @schname nvarchar(50)
declare @tabname nvarchar(100)

--==============================================================
--Drop Tables
--===============================================================
declare table_cursor cursor for 
		select	st.name as table_name,
					bk_sh.name as schema_name
			from sys.tables st
			inner join (select distinct name,
			             schema_id 
						from sys.schemas
						where name like 'backup_%'
						and schema_id < (select max(schema_id)
										from sys.schemas
										 where name like 'backup_%'
										 )
						) as bk_sh
				on st.schema_id = bk_sh.schema_id
				

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
  select distinct name as schema_name
            from sys.schemas
			where name like 'backup_%'
			and schema_id < (select max(schema_id)
			                 from sys.schemas
							 where name like 'backup_%'
							 )
				
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


