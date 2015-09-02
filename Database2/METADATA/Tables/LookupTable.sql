CREATE TABLE [METADATA].[LookupTable] (
    [LookupTableID] INT            NOT NULL,
    [Name]          NVARCHAR (100) NOT NULL,
    [TableName]     NVARCHAR (100) NOT NULL,
    CONSTRAINT [PK_LookupTable] PRIMARY KEY CLUSTERED ([LookupTableID] ASC)
);

