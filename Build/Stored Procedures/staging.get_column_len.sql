create   procedure [staging].[get_column_len] @schema nvarchar(50)
as

	declare @schname nvarchar(50)
	declare @tabname nvarchar(50)
	declare @colname nvarchar(50)
	declare @collen nvarchar(4)
	declare @SqlStatement nvarchar(400)
	declare @column_lens AS TABLE(schema_name nvarchar(50),table_name nvarchar(50),column_name nvarchar(50),column_len nvarchar(4), data_len smallint)

	declare table_cursor cursor for
		select
		 d.name as [Schema] 
		,a.name as [Table]
		,b.name as [Column]
		,b.max_length as [Column_len]
		from sys.objects as a
		join sys.columns as b 
			on a.object_id = b.object_id
		join sys.types as c 
			on b.system_type_id = c.system_type_id
		join sys.schemas d
			on a.schema_id = d.schema_id
		where d.name = @schema
		and c.name = 'nvarchar' 
		order by a.name
				,b.name

	open table_cursor
	fetch next from table_cursor 
	into @schname,@tabname,@colname,@collen

	while @@FETCH_STATUS = 0
	begin
		set @SqlStatement = 'SELECT '+''''+@schname+''''+','+''''+@tabname+''''+','+''''+@colname+''''+
							 ','+''''+@collen+''''+
							 ',MAX(DATALENGTH('+@colname+'))/2 '+
							'FROM '+@schname+'.'+@tabname

		print @SqlStatement
		insert into @column_lens
		exec sp_executesql @SqlStatement

		fetch next from table_cursor 
		into @schname,@tabname,@colname,@collen

	end
	CLOSE table_cursor
	DEALLOCATE table_cursor


	select *
	from @column_lens


GO

