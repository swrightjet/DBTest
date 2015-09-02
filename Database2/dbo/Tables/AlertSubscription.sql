CREATE TABLE [dbo].[AlertSubscription] (
    [AlertSubscriptionID] INT            NOT NULL,
    [AlertEventTypeID]    INT            NOT NULL,
    [TenantID]            INT            NOT NULL,
    [DataSourceID]        INT            NULL,
    [ModuleScopeTypeID]   INT            NULL,
    [ScopeKey]            INT            NULL,
    [To]                  NVARCHAR (MAX) NOT NULL,
    [CC]                  NVARCHAR (MAX) NULL,
    [BCC]                 NVARCHAR (MAX) NULL,
    [StartDt]             DATETIME       NOT NULL,
    [EndDt]               DATETIME       NULL,
    CONSTRAINT [PK_AlertSubscription] PRIMARY KEY CLUSTERED ([AlertSubscriptionID] ASC),
    CONSTRAINT [FK_AlertSubscription_AlertEventType] FOREIGN KEY ([AlertEventTypeID]) REFERENCES [dbo].[AlertEventType] ([AlertEventTypeID]),
    CONSTRAINT [FK_AlertSubscription_ModuleScopeType] FOREIGN KEY ([ModuleScopeTypeID]) REFERENCES [dbo].[ModuleScopeType] ([ModuleScopeTypeID]),
    CONSTRAINT [FK_AlertSubscription_Tenant] FOREIGN KEY ([TenantID]) REFERENCES [dbo].[Tenant] ([TenantID])
) TEXTIMAGE_ON [PRIMARY];

