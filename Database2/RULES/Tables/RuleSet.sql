CREATE TABLE [RULES].[RuleSet] (
    [RuleSetID]    INT            IDENTITY (1, 1) NOT NULL,
    [Name]         NVARCHAR (128) NOT NULL,
    [MajorVersion] INT            NOT NULL,
    [MinorVersion] INT            NOT NULL,
    [RuleSet]      NVARCHAR (MAX) NOT NULL,
    [IsActive]     BIT            CONSTRAINT [DF_ RuleSet_IsActive] DEFAULT ((1)) NOT NULL,
    [AssemblyPath] NVARCHAR (256) NULL,
    [ActivityName] NVARCHAR (128) NULL,
    [ModifiedBy]   NVARCHAR (128) CONSTRAINT [DF_RuleSet_ModifiedBy] DEFAULT (suser_sname()) NOT NULL,
    [ModifiedDate] DATETIME       CONSTRAINT [DF_RuleSet_ModifiedDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_RuleSet] PRIMARY KEY CLUSTERED ([RuleSetID] ASC),
    CONSTRAINT [UK_RuleSet_NameMajorVersionMinorVersion] UNIQUE NONCLUSTERED ([Name] ASC, [MajorVersion] ASC, [MinorVersion] ASC)
);

