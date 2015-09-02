CREATE TABLE [METADATA].[EntityStatus] (
    [EntityStatusID] INT           NOT NULL,
    [EntityID]       INT           NOT NULL,
    [Name]           NVARCHAR (50) NOT NULL,
    CONSTRAINT [PK_StatusType] PRIMARY KEY CLUSTERED ([EntityStatusID] ASC),
    CONSTRAINT [FK_StatusType_EntityType] FOREIGN KEY ([EntityID]) REFERENCES [METADATA].[Entity] ([EntityID])
);

