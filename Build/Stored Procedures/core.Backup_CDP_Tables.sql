-- ==========================================================================
-- Created by: Yolinda Moodley
-- Create date: 05/06/2018
-- Description:	Create stored procedure to backup all the tables in the staging and core schemas
-- Version Control
-- ==========================================================================

create or alter procedure core.Backup_CDP_Tables
as

declare @SqlStatement nvarchar(400)
declare @schname nvarchar(50)
declare @tabname nvarchar(100)
declare @date nvarchar(20)
declare @backup_schema nvarchar(50)

select @date =  format(DBO.FN_LOCALDATE (GETDATE()), 'yyyyMMddHHmm');

select @backup_schema = '[backup_'+@date+']'

set @SqlStatement = 'create schema '+@backup_schema 

	  --print @date
	  exec sp_executesql @SqlStatement

declare table_cursor cursor for 
		select sch.name,tab.name from sys.tables tab
		join sys.schemas sch on tab.schema_id = sch.schema_id
	    where sch.name in ('staging','core')

open table_cursor
	fetch next from table_cursor 
	into @schname, @tabname

while @@FETCH_STATUS = 0
	begin
	  
	  set @SqlStatement = 'select * into '+@backup_schema+'.['+@tabname+'] from '
						   +'['+@schname+'].['+@tabname+']'

		--print @SqlStatement
		exec sp_executesql @SqlStatement

      fetch next from table_cursor 
	  into @schname, @tabname

	  --print @tabname
	end 

CLOSE table_cursor
DEALLOCATE table_cursor
