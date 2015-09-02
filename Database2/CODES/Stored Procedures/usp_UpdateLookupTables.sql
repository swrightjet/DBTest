
CREATE procedure [CODES].[usp_UpdateLookupTables]
as
	set nocount on
	set textsize 1000000

	select lt.TableName as Table_Name, lv.Code as ID, ValueLabel as Description, case IsActive_Name when 'True' then 1 else 0 end as IsActive, DisplayOrder
	  into #ttt
	  from CompassMDS.mdm.LookupValue lv
			inner join CompassMDS.mdm.LookupTable lt on lv.[LookupTableID_ID] = lt.ID

	declare @tbl varchar(255), @sql varchar(max)
	while exists(select top 1 * from #ttt where Table_Name <> 'Common')
	begin
		select top 1 @tbl = Table_name from #ttt where Table_Name <> 'Common'

		if exists(select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='CODES' and TABLE_NAME = @tbl)
		begin 
			print 'Updating "' + @tbl + '"'

			--set @sql ='delete CODES.' + @tbl
			--exec (@sql)

			set @sql ='
				WITH NewValues (ID, Description, IsActive, DisplayOrder) 
					AS (select (case when Table_Name=''Common'' then DisplayOrder else ID end) as ID, Description, IsActive, DisplayOrder 
					      from #ttt 
						 where Table_Name = ''' + @tbl + ''' 
						    or Table_Name = ''Common'')
				MERGE CODES.' + @tbl + ' AS ProdTable
					USING NewValues ON (ProdTable.' + @tbl + 'ID = NewValues.ID)
					WHEN MATCHED AND (ProdTable.Description <> NewValues.Description OR ProdTable.IsActive <> NewValues.IsActive OR  ProdTable.DisplayOrder <> NewValues.DisplayOrder)
						THEN UPDATE SET ProdTable.Description = NewValues.Description, ProdTable.IsActive = NewValues.IsActive, ProdTable.DisplayOrder = NewValues.DisplayOrder
					WHEN NOT MATCHED THEN
						INSERT (' + @tbl + 'ID, Description, IsActive, DisplayOrder)
							VALUES (NewValues.ID, NewValues.Description, NewValues.IsActive, NewValues.DisplayOrder)
					WHEN NOT MATCHED BY SOURCE THEN
						UPDATE SET ProdTable.IsActive = 0
					OUTPUT $action, inserted.' + @tbl + 'ID, inserted.Description, inserted.IsActive, inserted.DisplayOrder;'
			print @sql
			exec (@sql)
		end 

		delete #ttt where Table_Name = @tbl
	end

	drop table #ttt