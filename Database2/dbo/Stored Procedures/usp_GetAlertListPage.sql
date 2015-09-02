
CREATE PROCEDURE [dbo].[usp_GetAlertListPage]
	@authIdentityID int,
	@alertEventTypeId int = null,
	@startDt datetime,
	@endDt datetime,
	@pageSize int,
	@pageNumber int,
	@orderByFieldName nvarchar(100),
	@AscendingOrDescending nvarchar(10)
as
	SET NOCOUNT ON

	/*
		exec usp_GetAlertListPage 1, null, '1/1/2015', '7/1/2015', 20, 1, 'SentTimestamp', 'desc'
	*/

	declare @sql nvarchar(max)
	declare @scount int
	set @sql = 'select distinct a.AlertID, ROW_NUMBER() OVER(ORDER BY [' + cast(@orderByFieldName as nvarchar) + '] ' + cast(@AscendingOrDescending as nvarchar) + ') - 1 AS RowNum
				  from Alert a
					inner join AlertEventType aet on a.AlertEventTypeID = aet.AlertEventTypeID'


	if not exists(select * 
	            from SecurityAssignmentCache 
			    where AuthIdentityID = @authIdentityID
				  and PermissionID in (7,8))	  
		set @sql = @sql + '
				inner join SecurityAssignmentCache sac
						on sac.AuthIdentityID = ' + cast(@authIdentityID as nvarchar) +'
							and sac.ModuleScopeTypeID = a.ModuleScopeTypeID
							and sac.ScopeKey = a.ScopeID
							and sac.PermissionID = 1' -- Read

	set @sql = @sql + ' where a.SentTimestamp between ''' + cast(@startDt as nvarchar) + ''' and ''' + cast(@endDt as nvarchar) + ''''
	
	if @alertEventTypeId is not null
		set @sql = @sql + ' and a.AlertEventTypeID = ' + cast(@alertEventTypeID as nvarchar)

	--print @sql

	create table #ttt (AlertID int not null, RowNum int not null)
	insert #ttt exec (@sql)
	select @scount=count (*) from #ttt
	select a.*
	  from Alert a
		inner join #ttt t on a.AlertID = t.AlertID
	 where t.RowNum between (@pageNumber - 1) * @scount 
	                    and (@pageNumber * @scount) - 1

	drop table #ttt
