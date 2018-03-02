CREATE PROCEDURE [Staging].[usp_ProcessULNs]
-- WITH ENCRYPTION
AS
/*
-------------------------------------------------------------------------------------- 
	 Example Call - 
			EXEC [dbo].[usp_Set_DataExchangeJobValues] @JobId==1, @Item='Some Value Here'
 */
-------------------------------------------------------------------------------------- 
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @ULN_List TABLE (ULN BIGINT PRIMARY KEY)

	INSERT INTO @ULN_List 
	SELECT DISTINCT [ULN] FROM [Staging].[UniqueLearnerNumbers] WHERE [Processed] = 0;

	BEGIN TRY
		
		INSERT INTO [dbo].[UniqueLearnerNumbers] WITH (ROWLOCK) ([ULN]) 
		SELECT [ULN] 
		FROM 
		(
			SELECT [ULN] FROM @ULN_List
			EXCEPT 
			SELECT [ULN] FROM [dbo].[UniqueLearnerNumbers]
		) as NewRecords

		UPDATE S	
			SET [Processed] = 1
		FROM [Staging].[UniqueLearnerNumbers] S WITH (ROWLOCK) 
		INNER JOIN @ULN_List L
			ON S.[ULN] = L.[ULN]

		RETURN 0;

	END TRY
-- 
-------------------------------------------------------------------------------------- 
-- Handle any problems
-------------------------------------------------------------------------------------- 
-- 
	BEGIN CATCH

		DECLARE   @ErrorMessage		NVARCHAR(4000)
				, @ErrorSeverity	INT 
				, @ErrorState		INT
				, @ErrorNumber		INT
						
		SELECT	  @ErrorNumber		= ERROR_NUMBER()
				, @ErrorMessage		= 'Error in :' + ISNULL(OBJECT_NAME(@@PROCID),'') + ' - Error was :' + ERROR_MESSAGE()
				, @ErrorSeverity	= ERROR_SEVERITY()
				, @ErrorState		= ERROR_STATE();
	
		RAISERROR (
					  @ErrorMessage		-- Message text.
					, @ErrorSeverity	-- Severity.
					, @ErrorState		-- State.
				  );
			  
		RETURN @ErrorNumber;

	END CATCH
-- 
-------------------------------------------------------------------------------------- 
-- All done
-------------------------------------------------------------------------------------- 
-- 
END