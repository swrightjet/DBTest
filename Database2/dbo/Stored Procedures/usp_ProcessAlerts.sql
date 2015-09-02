
CREATE procedure [dbo].[usp_ProcessAlerts]
as
	declare @AlertID int, 
			@To varchar(max), @CC varchar(max), @BCC varchar(max), 
			@Subject varchar(max), @Body varchar(max),
			@DBMailID int

	-- Find any unsent alerts
	SELECT AlertID, [To], CC, BCC, Subject, Body
	  INTO #pending
	  FROM Alert
	 WHERE DBMailID IS NULL
	   AND [To] is not null

	while (select count(*) from #pending) > 0 
	begin
		select top 1 @AlertID = AlertID, @To = [To], @CC = CC, @BCC = BCC, @Subject = Subject, @Body = Body
		  from #pending

		set @DBMailID = null
		EXEC msdb.dbo.sp_send_dbmail
			@profile_name = 'Compass DBMail Profile',
			@recipients = @To,
			@copy_recipients = @CC,
			@blind_copy_recipients = @BCC,
			@body = @Body,
			@subject = @Subject,
			@mailitem_id = @DBMailID output

		update Alert
		   set DBMailID = @DBMailID
		 where AlertID = @AlertID

		delete #pending
		 where AlertID = @AlertID
	end

	drop table #pending
