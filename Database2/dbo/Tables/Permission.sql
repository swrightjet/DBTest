CREATE TABLE [dbo].[Permission] (
    [PermissionID] INT           NOT NULL,
    [ModuleID]     INT           NOT NULL,
    [Name]         NVARCHAR (50) NOT NULL,
    CONSTRAINT [PK_Permission] PRIMARY KEY CLUSTERED ([PermissionID] ASC),
    CONSTRAINT [FK_Permission_Module] FOREIGN KEY ([ModuleID]) REFERENCES [dbo].[Module] ([ModuleID])
);

