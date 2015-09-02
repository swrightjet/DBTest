CREATE TABLE [dbo].[AlertEventType] (
    [AlertEventTypeID]       INT            NOT NULL,
    [ModuleID]               INT            NOT NULL,
    [Name]                   NVARCHAR (50)  NOT NULL,
    [SubjectFormat]          NVARCHAR (255) NOT NULL,
    [BodyFormat]             NVARCHAR (MAX) NOT NULL,
    [DiscardIfNoSubscribers] BIT            CONSTRAINT [DF_AlertEventType_DiscardIfNoSubscribers] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_AlertEventType] PRIMARY KEY CLUSTERED ([AlertEventTypeID] ASC),
    CONSTRAINT [FK_AlertEventType_Module] FOREIGN KEY ([ModuleID]) REFERENCES [dbo].[Module] ([ModuleID])
) TEXTIMAGE_ON [PRIMARY];

