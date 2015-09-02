CREATE TABLE [METADATA].[EventType] (
    [EventTypeID]             INT            NOT NULL,
    [Name]                    NVARCHAR (50)  NOT NULL,
    [EntityTypeID]            INT            NOT NULL,
    [BeforeStatusID]          INT            NOT NULL,
    [AfterStatusID]           INT            NOT NULL,
    [BeforeStateID]           INT            NOT NULL,
    [AfterStateID]            INT            NOT NULL,
    [ActionButtonLabel]       NVARCHAR (100) NOT NULL,
    [ActionResultDescription] NVARCHAR (100) CONSTRAINT [DF_EventType_ActionResultDescription] DEFAULT ('') NOT NULL,
    [Sequence]                INT            CONSTRAINT [DF_EventType_Sequence] DEFAULT ((0)) NOT NULL,
    [FormTitle]               NVARCHAR (100) NULL,
    [FormHeight]              INT            NULL,
    [FormWidth]               INT            NULL,
    [FormName]                NVARCHAR (100) NULL,
    [ConfirmMessage]          NVARCHAR (300) NULL,
    CONSTRAINT [PK_EventType] PRIMARY KEY CLUSTERED ([EventTypeID] ASC),
    CONSTRAINT [FK_EventType_EntityStatus] FOREIGN KEY ([AfterStatusID]) REFERENCES [METADATA].[EntityStatus] ([EntityStatusID]),
    CONSTRAINT [FK_EventType_EntityType] FOREIGN KEY ([EntityTypeID]) REFERENCES [METADATA].[Entity] ([EntityID]),
    CONSTRAINT [FK_EventType_StateType] FOREIGN KEY ([BeforeStateID]) REFERENCES [METADATA].[EntityState] ([EntityStateID]),
    CONSTRAINT [FK_EventType_StateType1] FOREIGN KEY ([AfterStateID]) REFERENCES [METADATA].[EntityState] ([EntityStateID]),
    CONSTRAINT [FK_EventType_StatusType] FOREIGN KEY ([BeforeStatusID]) REFERENCES [METADATA].[EntityStatus] ([EntityStatusID])
);

