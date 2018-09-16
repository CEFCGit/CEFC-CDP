/****** Object:  Table [core].[Projects_Dimension]    Script Date: 14/09/2018 3:16:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [core].[Projects_Dimension](
	[ID_Project] [nvarchar](100) NOT NULL,
	[cAssessment_Date] [nvarchar](60) NULL,
	[cAssessment_Start_Date] [nvarchar](60) NULL,
	[cAssessment_Status] [nvarchar](60) NULL,
	[cAssessment_Tech_Outcome] [nvarchar](100) NULL,
	[cAssessment_Tech_Review_Date] [nvarchar](60) NULL,
	[cAssessment_Working_Notes] [nvarchar](1000) NULL,
	[CEFC_Focus] [nvarchar](20) NULL,
	[CEFC_Section] [nvarchar](100) NULL,
	[CEFC_Special_Focus_Area] [nvarchar](1000) NULL,
	[CEFC_Strategic_Sector] [nvarchar](200) NULL,
	[cExecution_Target_Date] [nvarchar](100) NULL,
	[cFocus] [nvarchar](300) NULL,
	[cInvestment_Priority] [nvarchar](100) NULL,
	[cMasterProject] [nvarchar](300) NULL,
	[cOrganisations] [nvarchar](300) NULL,
	[cPhase] [nvarchar](300) NULL,
	[cStatus] [nvarchar](60) NULL,
	[cTechnology] [nvarchar](200) NULL,
	[cTransaction_Analyst] [nvarchar](100) NULL,
	[cTransaction_Credit] [nvarchar](100) NULL,
	[cTransaction_ED] [nvarchar](100) NULL,
	[cTransaction_ExtLegal] [nvarchar](300) NULL,
	[cTransaction_Lead] [nvarchar](100) NULL,
	[cTransaction_Legal] [nvarchar](100) NULL,
	[cTransaction_PM] [nvarchar](100) NULL,
	[cTransaction_ReviewAnalyst] [nvarchar](100) NULL,
	[Date_Commitment] [nvarchar](100) NULL,
	[Date_Created] [nvarchar](100) NULL,
	[Date_Modified] [nvarchar](100) NULL,
	[Description] [nvarchar](4000) NULL,
	[Exposure_LRET] [nvarchar](20) NULL,
	[Exposure_Merchant] [nvarchar](100) NULL,
	[Externalities] [nvarchar](300) NULL,
	[Finance_Type] [nvarchar](100) NULL,
	[flag_Information_Barrier] [nvarchar](3) NULL,
	[flag_Information_Barrier_Current] [nvarchar](3) NULL,
	[Grant_Funding] [nvarchar](100) NULL,
	[ID_is_master] [nvarchar](3) NULL,
	[ID_Master_Project] [nvarchar](300) NULL,
	[ID_Project_TNumber] [nvarchar](20) NULL,
	[Industry_Division] [nvarchar](300) NULL,
	[LCAL_Deal] [nvarchar](3) NULL,
	[Performance_Rating] [nvarchar](3) NULL,
	[Permited_Investment] [nvarchar](300) NULL,
	[Project_Borrower_Entity] [nvarchar](300) NULL,
	[Project_Name] [nvarchar](400) NULL,
	[rpt_Note] [nvarchar](1000) NULL,
	[rpt_Project_Description] [nvarchar](300) NULL,
	[Secondary_Leverage] [nvarchar](9) NULL,
	[Secondary_Leverage_Note] [nvarchar](3000) NULL,
	[Shadow_Credit_Rating] [nvarchar](12) NULL,
	[State] [nvarchar](24) NULL,
	[UserName_Created] [nvarchar](123) NULL,
	[UserName_Modified] [nvarchar](60) NULL,
	[Fund_Cities] [nvarchar](9) NULL,
	[Fund_Innovation] [nvarchar](9) NULL,
	[Fund_North] [nvarchar](6) NULL,
	[Fund_Reef] [nvarchar](6) NULL,
	[Finance_Type_End_Borrower_Risk] [nvarchar](100) NULL,
	[Direct_Indirect] [nvarchar](50) NULL,
	[Project_Name_Alias] [nvarchar](100) NULL,
	[Updated_by] [nvarchar](20) NULL,
	[Update_From_TS] [datetime] NOT NULL,
	[Update_To_TS] [datetime] NULL,
	[Update_Reason] [nvarchar](20) NULL,
 CONSTRAINT [PK_projects_Dim] PRIMARY KEY CLUSTERED 
(
	[ID_Project] ASC,
	[Update_From_TS] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [core].[Projects_Dimension] ADD  DEFAULT ('SSIS ETL') FOR [Updated_by]
GO

ALTER TABLE [core].[Projects_Dimension] ADD  DEFAULT (NULL) FOR [Update_To_TS]
GO

ALTER TABLE [core].[Projects_Dimension] ADD  DEFAULT ('Population process') FOR [Update_Reason]
GO


