
CREATE PROCEDURE [dbo].[usp_GetAlertCounts]
	@authIdentityID int,
	@startDt datetime, 
	@endDt datetime
AS
	SET NOCOUNT ON

	/*
		exec usp_GetAlertCounts 1, '1/1/2015', '7/1/2015'
	*/

	if exists(select * 
	            from SecurityAssignmentCache 
			    where AuthIdentityID = @authIdentityID
				  and PermissionID in (7,8))	  
		select distinct aet.AlertEventTypeID, aet.Name as AlertEventType, Count(*) as [Count] 
		  from Alert a 
				inner join AlertEventType aet 
					on a.AlertEventTypeID = aet.AlertEventTypeID
		 where a.SentTimestamp between @startDt AND @endDt
		 group by aet.AlertEventTypeID, aet.Name
		 order by aet.Name
	 else
		select distinct aet.AlertEventTypeID, aet.Name as AlertEventType, Count(*) as [Count] 
		  from Alert a 
				inner join AlertEventType aet 
					on a.AlertEventTypeID = aet.AlertEventTypeID
				inner join SecurityAssignmentCache sac
					on sac.AuthIdentityID = @authIdentityID
						and sac.ModuleScopeTypeID = a.ModuleScopeTypeID
						and sac.ScopeKey = a.ScopeID
						and sac.PermissionID = 1 -- Read
		 where a.SentTimestamp between @startDt AND @endDt
		 group by aet.AlertEventTypeID, aet.Name
		 order by aet.Name



