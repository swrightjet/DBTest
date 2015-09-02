
-- Returns a list of users that have access to any of the same scopes as the current user.
create proc usp_GetUserList
	@authIdentityID int
as
	/*
		exec usp_GetUserList 1
	*/

	select distinct ai.*
	  from SecurityAssignmentCache me
		inner join SecurityAssignmentCache them
			on me.ModuleScopeTypeID = them.ModuleScopeTypeID and me.ScopeKey = them.ScopeKey
		inner join AuthIdentity ai
			on ai.AuthIdentityID = them.AuthIdentityID
	 where me.AuthIdentityID = @authIdentityID
	   and me.PermissionID = 6


