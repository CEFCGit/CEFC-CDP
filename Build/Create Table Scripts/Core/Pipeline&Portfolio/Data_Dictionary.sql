CREATE TABLE [core].[Data_Dictionary](
	[Type] [varchar](20) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Field] [varchar](50) NOT NULL,
	[Source] [varchar](50) NOT NULL,
	[Source_Table] [varchar](50) NOT NULL,
	[Source_Field] [varchar](50) NOT NULL,
	[CDP_Table] [varchar](50) NOT NULL,
	[CDP_Field] [varchar](50) NOT NULL,
	[Description] [varchar](500) NULL,
	[label] [varchar](50) NULL,
PRIMARY KEY([Type] ,[Name] ,[Field] ,[Source] ,[Source_Table] ,[Source_Field] ,[CDP_Table] ,[CDP_Field])
) 
GO

