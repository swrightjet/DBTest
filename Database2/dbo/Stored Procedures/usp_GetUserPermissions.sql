CREATE procedure [dbo].[usp_GetUserPermissions]
	@authIdentityID int,
	@moduleScopeTypeID int = null,
	@scopeKey int = null,
	@permissionID int = null
AS
	/*
		exec usp_GetUserPermissions 1, null, null, null -- All perms for the user
	*/

	select sac.ModuleScopeTypeID, sac.ScopeKey, sac.PermissionID
	  from dbo.SecurityAssignmentCache sac
	 where sac.AuthIdentityID = @authIdentityID
	   and sac.ModuleScopeTypeID = isnull(@moduleScopeTypeID, sac.ModuleScopeTypeID)	   
	   and sac.ScopeKey = isnull(@scopeKey, sac.ScopeKey)
	   and sac.PermissionID = isnull(@permissionID, sac.PermissionID)

