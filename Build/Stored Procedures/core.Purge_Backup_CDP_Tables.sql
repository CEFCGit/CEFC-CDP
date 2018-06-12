-- ==========================================================================
-- Created by: Yolinda Moodley
-- Create date: 13/06/2018
-- Description:	Create stored procedure to keep only the most recent backup schema and tables
-- Version Control
-- ==========================================================================

create or alter   procedure [core].[Purge_Backup_CDP_Tables]
as

declare @SqlStatement nvarchar(400)
declare @schname nvarchar(50)
declare @tabname nvarchar(100)

--==============================================================
--Drop Tables
--===============================================================
declare table_cursor cursor for 
		with back_up 
		as

		(	select	st.name as table_name,
					bk_sh.name as schema_name,
					format(create_date,'yyyy-MM-dd hh:mm') create_date,
					dense_rank() over (order by format(create_date,'yyyy-MM-dd hh:mm') desc) rownum
			from sys.tables st
			inner join (select schema_id,name
						from sys.schemas
						where name like 'backup_%'
						) as bk_sh
				on st.schema_id = bk_sh.schema_id
		)

		select schema_name,
			   table_name
		from back_up
		where rownum > 1

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
  with back_up 
		as

		(	select	bk_sh.name as schema_name,
					dense_rank() over (order by format(create_date,'yyyy-MM-dd hh:mm') desc) rownum
			from sys.tables st
			inner join (select schema_id,name
						from sys.schemas
						where name like 'backup_%'
						) as bk_sh
				on st.schema_id = bk_sh.schema_id
		)

		select distinct schema_name
		from back_up
		where rownum > 1

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


