CREATE TABLE [dbo].[SecurityAssignment] (
    [SecurityAssignmentID] INT IDENTITY (2, 1) NOT NULL,
    [TenantID]             INT NOT NULL,
    [ModuleScopeTypeID]    INT NOT NULL,
    [ScopeKey]             INT NOT NULL,
    [AuthIdentityID]       INT NOT NULL,
    [PermissionID]         INT NOT NULL,
    CONSTRAINT [PK_SecurityAssingment] PRIMARY KEY CLUSTERED ([SecurityAssignmentID] ASC),
    CONSTRAINT [FK_SecurityAssignment_ModuleScopeType] FOREIGN KEY ([ModuleScopeTypeID]) REFERENCES [dbo].[ModuleScopeType] ([ModuleScopeTypeID]),
    CONSTRAINT [FK_SecurityAssingment_AuthIdentity] FOREIGN KEY ([AuthIdentityID]) REFERENCES [dbo].[AuthIdentity] ([AuthIdentityID]),
    CONSTRAINT [FK_SecurityAssingment_Permission] FOREIGN KEY ([PermissionID]) REFERENCES [dbo].[Permission] ([PermissionID]),
    CONSTRAINT [FK_SecurityAssingment_Tenant] FOREIGN KEY ([TenantID]) REFERENCES [dbo].[Tenant] ([TenantID])
);

