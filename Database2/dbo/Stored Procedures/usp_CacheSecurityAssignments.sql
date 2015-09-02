
CREATE procedure [dbo].[usp_CacheSecurityAssignments]
	@authIdentityID int,
	@authIdentityKeysCSV varchar(8000)
AS
	set nocount on

	/*
		exec dbo.usp_CacheSecurityAssignments 1, 'BF200LNK\swrigh5,BF200LNK\DOMAIN ADMINS'
	*/

	begin transaction

	delete dbo.SecurityAssignmentCache 
	 where AuthIdentityID = @authIdentityID

	if exists(select * from AuthIdentity where AuthIdentityID = @authIdentityID and IsActive = 1)	 
	begin
		INSERT INTO [dbo].[SecurityAssignmentCache]
			   (AuthIdentityID,ModuleScopeTypeID,ScopeKey,PermissionID)
			select distinct @authIdentityID, sa.ModuleScopeTypeID, sa.ScopeKey, sa.PermissionID
			  from dbo.SecurityAssignment sa
				inner join dbo.AuthIdentity ai on ai.AuthIdentityID = sa.AuthIdentityID
				inner join dbo.tvf_DelimitedSplit(@authIdentityKeysCSV,',') keys on ai.IdentityKey = keys.Item
	end

	commit transaction