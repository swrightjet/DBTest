CREATE procedure [dbo].[usp_SendAlert]
	@tenantID int,
	@alertEventTypeID int,
	@dataSourceID int,
	@moduleScopeTypeID int,
	@scopeID int,
	@subject nvarchar(255),
	@body nvarchar(max),
	@sentBy nvarchar(255)
as
	set nocount on

	declare @subjectFormat nvarchar(255), 
			@bodyFormat nvarchar(max), 
			@toAddrs nvarchar(max), 
			@ccAddrs nvarchar(max), 
			@bccAddrs nvarchar(max),
			@discard bit,
			@ts datetime

	create table #params (
		SubjectFormat nvarchar(255), 
		BodyFormat nvarchar(max), 
		ToAddrs nvarchar(max), 
		CcAddrs nvarchar(max), 
		BccAddrs nvarchar(max),
		IsDiscarded bit
	)

	set @ts = getdate()
	insert #params
		exec dbo.usp_GetAlertSubscriptions @tenantID, @alertEventTypeID,@dataSourceID,@moduleScopeTypeID,@scopeID,@ts

	select @subjectFormat = SubjectFormat, @bodyFormat = BodyFormat, @toAddrs = ToAddrs, @ccAddrs = CCAddrs, @bccAddrs = BCCAddrs, @discard = IsDiscarded
	  from #params
	  	  
	if @discard = 0 or len(@toAddrs) > 0
		INSERT INTO dbo.Alert(AlertEventTypeID, DataSourceID, ModuleScopeTypeID, ScopeID, [To], CC, BCC, Subject, Body, SentTimestamp, SentBy)
			VALUES(@alertEventTypeID, @dataSourceID, @moduleScopeTypeID, @scopeID, @toAddrs, @ccAddrs, @bccAddrs, @subject, @body, @ts, @sentBy)

--select SCOPE_IDENTITY(), @alertEventTypeID, @dataSourceID, @moduleScopeTypeID, @scopeID, @toAddrs, @ccAddrs, @bccAddrs, @subject, @body, @ts, @sentBy

	drop table #params