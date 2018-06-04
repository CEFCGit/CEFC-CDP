CREATE TABLE [staging].[PHA_Phases](
	[ID_Phase] [numeric](18, 0) NOT NULL,
	[_ID_Constant] [numeric](18, 0) NULL,
	[Act_PhaseID] [nvarchar](2) NULL,
	[Default_Field] [nvarchar](3) NULL,
	[DM_Activities] [nvarchar](50) NULL,
	[DM_Documents_Required] [nvarchar](50) NULL,
	[DM_GateKeepers] [nvarchar](50) NULL,
	[DM_Gates] [nvarchar](50) NULL,
	[DM_Information_Outcomes] [nvarchar](50) NULL,
	[DM_Staff] [nvarchar](50) NULL,
	[DM_Target_Days] [numeric](18, 0) NULL,
	[DM_Target_Outcomes] [nvarchar](50) NULL,
	[Field_12] [nvarchar](50) NULL,
	[Likelyhood] [numeric](18, 0) NULL,
	[Likelyhood_Model] [nvarchar](3) NULL,
	[Phase_Gate_Description] [nvarchar](111) NULL,
	[Phase_Description] [nvarchar](44) NULL,
	[Phase_Name] [nvarchar](111) NULL,
	[Phase_Name_Model] [nvarchar](5) NULL,
	[Process_Link] [nvarchar](50) NULL,
PRIMARY KEY ([ID_Phase])
)
GO

