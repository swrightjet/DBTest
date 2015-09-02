CREATE TABLE [METADATA].[LookupValue] (
    [LookupValueID] INT            NOT NULL,
    [ValueLabel]    NVARCHAR (100) NOT NULL,
    [DisplayOrder]  INT            NOT NULL,
    [LookupTableID] INT            CONSTRAINT [DF_LookupValue_LookupTableID] DEFAULT ((1)) NOT NULL,
    [IsActive]      BIT            CONSTRAINT [DF_LookupValue_IsActive] DEFAULT ((1)) NOT NULL,
    CONSTRAINT [PK_LookupValue] PRIMARY KEY CLUSTERED ([LookupValueID] ASC),
    CONSTRAINT [FK_LookupValue_LookupTable] FOREIGN KEY ([LookupTableID]) REFERENCES [METADATA].[LookupTable] ([LookupTableID])
);

