-- ==========================================================================
-- Created by: Yolinda Moodley
-- Create date: 26/06/2018
-- Description:	Provides a list of all Tables and columns with their precisions
-- Version Control
-- ==========================================================================


select	 sch.name [Schema]
		,tab.name [Table Name]
		,col.name [Column Name]
		,typ.name [Column Type]	
		,col.length [Column Length]		
from sys.tables tab
  join sys.syscolumns col
    on tab.object_id = col.id
  join sys.types typ
    on col.xusertype = typ.user_type_id
  join sys.schemas sch
    on tab.schema_id = sch.schema_id
where sch.name in ('staging','core','security')
order by 1,2,3





