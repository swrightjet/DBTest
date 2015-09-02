CREATE TABLE [dbo].[ModuleConfig] (
    [ModuleConfigID] INT            NOT NULL,
    [ModuleID]       INT            NOT NULL,
    [TenantID]       INT            NOT NULL,
    [Setting]        NVARCHAR (50)  NOT NULL,
    [Value]          NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_ModuleConfig] PRIMARY KEY CLUSTERED ([ModuleConfigID] ASC),
    CONSTRAINT [FK_ModuleConfig_Module] FOREIGN KEY ([ModuleID]) REFERENCES [dbo].[Module] ([ModuleID]),
    CONSTRAINT [FK_ModuleConfig_Tenant] FOREIGN KEY ([TenantID]) REFERENCES [dbo].[Tenant] ([TenantID])
) TEXTIMAGE_ON [PRIMARY];


GO
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20150603-204735]
    ON [dbo].[ModuleConfig]([TenantID] ASC, [ModuleID] ASC, [Setting] ASC);

