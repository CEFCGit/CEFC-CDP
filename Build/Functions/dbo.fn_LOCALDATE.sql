CREATE FUNCTION [dbo].[fn_LOCALDATE] (@DATE datetime)  
RETURNS datetime  
WITH EXECUTE AS CALLER  
AS  
BEGIN

	DECLARE @CurrentDate datetime;
	DECLARE @ReturnDate datetime;
	set @CurrentDate = GETDATE();
	set @ReturnDate = DATEADD (hh,10,@CurrentDate);
	RETURN(@ReturnDate);  
END;  
GO

