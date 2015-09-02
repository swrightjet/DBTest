CREATE TABLE [dbo].[Tenant] (
    [TenantID] INT           NOT NULL,
    [Name]     NVARCHAR (50) NOT NULL,
    CONSTRAINT [PK_Tenant] PRIMARY KEY CLUSTERED ([TenantID] ASC)
);

