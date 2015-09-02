CREATE TABLE [dbo].[SecurityAssignmentCache] (
    [SecurityAssignmentCacheID] BIGINT        IDENTITY (1, 1) NOT NULL,
    [AuthIdentityID]            INT           NOT NULL,
    [ModuleScopeTypeID]         INT           NOT NULL,
    [ScopeKey]                  INT           NOT NULL,
    [PermissionID]              INT           NOT NULL,
    [CreateDateTime]            DATETIME2 (7) CONSTRAINT [DF_SecurityAssignmentCache_CreateDateTime] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_SecurityAssingmentCache] PRIMARY KEY CLUSTERED ([SecurityAssignmentCacheID] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_SecurityAssingmentCache]
    ON [dbo].[SecurityAssignmentCache]([AuthIdentityID] ASC, [ModuleScopeTypeID] ASC, [ScopeKey] ASC, [PermissionID] ASC);


GO
CREATE NONCLUSTERED INDEX [IDX_SecurityAssingmentCache_ByPermission]
    ON [dbo].[SecurityAssignmentCache]([AuthIdentityID] ASC, [PermissionID] ASC, [ModuleScopeTypeID] ASC, [ScopeKey] ASC);

