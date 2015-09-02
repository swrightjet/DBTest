CREATE TABLE [CODES].[AuthType] (
    [AuthTypeID]   INT           NOT NULL,
    [Description]  NVARCHAR (50) NOT NULL,
    [IsActive]     BIT           NOT NULL,
    [DisplayOrder] INT           DEFAULT ((1)) NOT NULL,
    CONSTRAINT [PK_AuthType] PRIMARY KEY CLUSTERED ([AuthTypeID] ASC)
);

