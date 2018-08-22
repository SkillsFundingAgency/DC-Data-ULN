CREATE TABLE [Staging].[UniqueLearnerNumbers] (
    [ULN]          BIGINT         NOT NULL,
    [IsDelete]     BIT            CONSTRAINT [def_Staging_UniqueLearnerNumbers_IsDelete] DEFAULT ((0)) NOT NULL,
    [LoadTime]     DATETIME       CONSTRAINT [def_Staging_UniqueLearnerNumbers_LoadTime] DEFAULT (getutcdate()) NOT NULL,
    [Processed]    BIT            CONSTRAINT [def_Staging_UniqueLearnerNumbers_Processessed] DEFAULT ((0)) NOT NULL,
    [Created_On]   DATETIME       CONSTRAINT [def_Staging_UniqueLearnerNumbers_CreatedOn] DEFAULT (getutcdate()) NOT NULL,
    [Created_By]   NVARCHAR (256) CONSTRAINT [def_Staging_UniqueLearnerNumbers_CreatedBy] DEFAULT (suser_sname()) NOT NULL,
    [Modified_On]  DATETIME       CONSTRAINT [def_Staging_UniqueLearnerNumbers_ModifiedOn] DEFAULT (getutcdate()) NOT NULL,
    [Modified_By]  NVARCHAR (256) CONSTRAINT [def_Staging_UniqueLearnerNumbers_ModifiedBy] DEFAULT (suser_sname()) NOT NULL,
    CONSTRAINT [PK_Staging_UniqueLearnerNumbers] PRIMARY KEY CLUSTERED ([ULN] ASC, [LoadTime] ASC)
);

GO
GRANT ALTER ON OBJECT::Staging.UniqueLearnerNumbers TO [ULN_RW_User];
GO