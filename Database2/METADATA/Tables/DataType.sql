CREATE TABLE [METADATA].[DataType] (
    [DataTypeID] INT            NOT NULL,
    [Name]       NVARCHAR (100) NOT NULL,
    [IsActive]   BIT            NOT NULL,
    CONSTRAINT [PK_DataType] PRIMARY KEY CLUSTERED ([DataTypeID] ASC)
);

