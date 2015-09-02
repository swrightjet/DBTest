
CREATE FUNCTION [dbo].[tvf_GetUserPermissions]
(	
	@authIdentityKeysCSV varchar(8000),
	@tenantID int,
	@moduleScopeTypeID int = null,
	@scopeKey int = null,
	@permissionID int = null
)
RETURNS TABLE 
AS

	/*
		select * from dbo.usp_GetUserPermissions('BF200LNK\swrigh5,BF200LNK\DOMAIN ADMINS', null, null, null) -- All perms for the user
		select * from dbo.usp_GetUserPermissions('BF200LNK\swrigh5,BF200LNK\DOMAIN ADMINS', 2, 1, null) -- All perms in region 1
		select * from dbo.usp_GetUserPermissions('BF200LNK\swrigh5,BF200LNK\DOMAIN ADMINS', null, null, 1) -- All readable scopes
		select * from dbo.usp_GetUserPermissions('BF200LNK\swrigh5,BF200LNK\DOMAIN ADMINS', 1, 0, 1) -- super READER
		select * from dbo.usp_GetUserPermissions('BF200LNK\swrigh5,BF200LNK\DOMAIN ADMINS', 1, 0, 8) -- super user
	*/

RETURN 
(	
	select sa.ModuleScopeTypeID, sa.ScopeKey, sa.PermissionID
	  from dbo.SecurityAssignment sa
		inner join dbo.AuthIdentity ai on ai.AuthIdentityID = sa.AuthIdentityID and ai.IsActive = 1
		inner join dbo.tvf_DelimitedSplit(@authIdentityKeysCSV,',') keys on ai.IdentityKey = keys.Item
	 where sa.TenantID = @tenantID
	   and sa.ModuleScopeTypeID = isnull(@moduleScopeTypeID, sa.ModuleScopeTypeID)	   
	   and sa.ScopeKey = isnull(@scopeKey, sa.ScopeKey)
	   and sa.PermissionID = isnull(@permissionID, sa.PermissionID)
)
