/** Enabling SQL Server Agent XP*/

EXEC SP_CONFIGURE 'Agent XPs'
GO

EXEC SP_CONFIGURE 'show advanced options',1
GO
RECONFIGURE
GO

EXEC SP_CONFIGURE 'show advanced options'

EXEC SP_CONFIGURE 'Agent XPs'

EXEC SP_CONFIGURE 'Agent XPs',1
GO
RECONFIGURE