CREATE TABLE [dbo].[Alert] (
    [AlertID]           INT            IDENTITY (1, 1) NOT NULL,
    [AlertEventTypeID]  INT            NOT NULL,
    [DataSourceID]      INT            NULL,
    [ModuleScopeTypeID] INT            NULL,
    [ScopeID]           INT            NULL,
    [To]                NVARCHAR (MAX) NULL,
    [CC]                NVARCHAR (MAX) NULL,
    [BCC]               NVARCHAR (MAX) NULL,
    [Subject]           NVARCHAR (255) NOT NULL,
    [Body]              NVARCHAR (MAX) NOT NULL,
    [FormatData]        XML            NULL,
    [RecordData]        XML            NULL,
    [SentTimestamp]     DATETIME       NOT NULL,
    [SentBy]            NVARCHAR (255) NOT NULL,
    [DBMailID]          INT            NULL,
    CONSTRAINT [PK_Alert] PRIMARY KEY CLUSTERED ([AlertID] ASC),
    CONSTRAINT [FK_Alert_AlertEventType] FOREIGN KEY ([AlertEventTypeID]) REFERENCES [dbo].[AlertEventType] ([AlertEventTypeID]),
    CONSTRAINT [FK_Alert_ModuleScopeType] FOREIGN KEY ([ModuleScopeTypeID]) REFERENCES [dbo].[ModuleScopeType] ([ModuleScopeTypeID])
) TEXTIMAGE_ON [PRIMARY];

