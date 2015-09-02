CREATE TABLE [dbo].[Module] (
    [ModuleID] INT           NOT NULL,
    [Name]     NVARCHAR (50) NOT NULL,
    CONSTRAINT [PK_Module] PRIMARY KEY CLUSTERED ([ModuleID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20150603-204858]
    ON [dbo].[Module]([Name] ASC, [ModuleID] ASC);

