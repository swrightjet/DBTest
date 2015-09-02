CREATE TABLE [CODES].[LogType] (
    [LogTypeID]    INT           NOT NULL,
    [Description]  NVARCHAR (50) NOT NULL,
    [IsActive]     BIT           NOT NULL,
    [DisplayOrder] INT           DEFAULT ((1)) NOT NULL,
    CONSTRAINT [PK_LogType] PRIMARY KEY CLUSTERED ([LogTypeID] ASC)
);

