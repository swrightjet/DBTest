CREATE TABLE [dbo].[ModuleScopeType] (
    [ModuleScopeTypeID] INT           NOT NULL,
    [ModuleID]          INT           NOT NULL,
    [Name]              NVARCHAR (50) NOT NULL,
    CONSTRAINT [PK_ModuleScopeType] PRIMARY KEY CLUSTERED ([ModuleScopeTypeID] ASC),
    CONSTRAINT [FK_ModuleScopeType_Module] FOREIGN KEY ([ModuleID]) REFERENCES [dbo].[Module] ([ModuleID])
);

