CREATE TABLE [METADATA].[EntityState] (
    [EntityStateID]  INT            NOT NULL,
    [EntityStatusID] INT            NOT NULL,
    [Name]           NVARCHAR (100) NOT NULL,
    [ShortName]      NVARCHAR (50)  NOT NULL,
    [IsActive]       BIT            NOT NULL,
    [Sequence]       INT            CONSTRAINT [DF_EntityState_Sequence] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_StateType] PRIMARY KEY CLUSTERED ([EntityStateID] ASC),
    CONSTRAINT [FK_StateType_StatusType] FOREIGN KEY ([EntityStatusID]) REFERENCES [METADATA].[EntityStatus] ([EntityStatusID])
);

