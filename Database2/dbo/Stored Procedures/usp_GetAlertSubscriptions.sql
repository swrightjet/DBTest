CREATE procedure [dbo].[usp_GetAlertSubscriptions]
	@tenantID int,
	@alertEventTypeID int,
	@dataSourceID int = null,
	@moduleScopeTypeID int,
	@scopeID int,
	@timestamp datetime
as
	set nocount on

	declare @subjectFormat nvarchar(255), 
			@bodyFormat nvarchar(max), 
			@toAddrs nvarchar(max), 
			@ccAddrs nvarchar(max), 
			@bccAddrs nvarchar(max),
			@discard bit

	/*
		exec usp_GetAlertSubscriptions 1, 13, null, 1, 1, '1/1/2015'
	*/

	select @subjectFormat = SubjectFormat,
		   @bodyFormat = BodyFormat,
		   @discard = DiscardIfNoSubscribers
	  from AlertEventType
	 where AlertEventTypeID = @alertEventTypeID

	set @dataSourceID = isnull(@dataSourceID, -1)
	set @moduleScopeTypeID = isnull(@moduleScopeTypeID, -1)
	set @scopeID = isnull(@scopeID, -1)

	select [To], CC, BCC
	  into #ttt
	  from AlertSubscription
	 where AlertEventTypeID = @alertEventTypeID
	   and TenantID = @tenantID
	   and @timestamp between StartDt and isnull(EndDt,'12/31/2999')
	   and isnull(ModuleScopeTypeID, @dataSourceID) = @dataSourceID
	   and isnull(ModuleScopeTypeID, @moduleScopeTypeID) = @moduleScopeTypeID
	   and isnull(ScopeKey, @scopeID) = @scopeID

	 -- some alerts should only be stored if someone has subscribed to them.
	 if (@@ROWCOUNT > 0)
		set @discard = 0

	 set @toAddrs = (select [To] + ';' from #ttt where [To] is not null FOR XML PATH(''))
	 set @toAddrs = left(@toAddrs, len(@toAddrs)-1)

	 set @ccAddrs = (select CC + ';' from #ttt where CC is not null FOR XML PATH(''))
	 set @ccAddrs = left(@ccAddrs, len(@ccAddrs)-1)

	 set @bccAddrs = (select BCC + ';' from #ttt where BCC is not null FOR XML PATH(''))
	 set @bccAddrs = left(@bccAddrs, len(@bccAddrs)-1)
	 
	 drop table #ttt

	 select @subjectFormat as SubjectFormat, @bodyFormat as BodyFormat, @toAddrs as ToAddrs, @ccAddrs as CCAddrs, @bccAddrs as BCCAddrs, @discard as IsDiscarded
