CREATE PROCEDURE [Staging].[usp_RemovedProcessedRecords]
-- WITH ENCRYPTION
AS
/*
-------------------------------------------------------------------------------------- 
	 Example Call - 
			EXEC [dbo].[usp_RemovedProcessedRecords]
 */
-------------------------------------------------------------------------------------- 
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		
		DELETE FROM [Staging].[UniqueLearnerNumbers] WITH (ROWLOCK)
		WHERE [Processed] = 1;

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