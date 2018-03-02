CREATE TABLE [dbo].[UniqueLearnerNumbers] (
    [ULN] BIGINT NOT NULL,
	[Created_On] [datetime] CONSTRAINT [def_dboUniqueLearnerNumbers_CreatedOn] DEFAULT (GETUTCDATE()) NOT NULL,
	[Created_By] [nvarchar](256) CONSTRAINT [def_DboUniqueLearnerNumbers_CreatedBy] DEFAULT (SUSER_SNAME()) NOT NULL,
	[Modified_On] [datetime] CONSTRAINT [def_dboUniqueLearnerNumbers_ModifiedOn] DEFAULT (GETUTCDATE())  NOT NULL,
	[Modified_By] [nvarchar](256) CONSTRAINT [def_dboUniqueLearnerNumbers_ModifiedBy] DEFAULT (SUSER_SNAME())  NOT NULL,
    CONSTRAINT [PK_UniqueLearnerNumbers] PRIMARY KEY CLUSTERED ([ULN] ASC)
);

