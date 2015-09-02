
CREATE procedure [dbo].[usp_UpdateMDSEntityTable]
	@mdsViewName sysname,
	@targetSchema sysname,
	@targetTable sysname,
	@allowDeletes bit = 0
as
	set nocount on
	set textsize 1000000

	-- exec dbo.[usp_UpdateMDSEntityTable] 'CompassMDS.mdm.Module','dbo','Module', 0
	-- exec dbo.[usp_UpdateMDSEntityTable] 'CompassMDS.mdm.ModuleConfig','dbo','ModuleConfig', 1
  
	declare @cols table (prodColName sysname, mdsColName sysname)

	insert @cols
		select '[' + COLUMN_NAME + ']', 
				case 
					when right(COLUMN_NAME,2) = 'ID' 
						then '[' + COLUMN_NAME + '_Code]' 
					when DATA_TYPE = 'bit'
						then '[' + COLUMN_NAME + '_Code]' 
					else '[' + COLUMN_NAME + ']'
				end
		  from INFORMATION_SCHEMA.COLUMNS
		 where TABLE_SCHEMA = @targetSchema
		   and TABLE_NAME = @targetTable
		   and COLUMN_NAME <> @targetTable + 'ID';
	
	declare @mdsFldList nvarchar(max)
	declare @fldList nvarchar(max)
	declare @assignList nvarchar(max)
	declare @sql nvarchar(max)
	declare @tbl nvarchar(max) = @targetSchema + '.' + @targetTable
	declare @id nvarchar(max) = @targetTable + 'ID'

	SELECT @mdsFldList = SUBSTRING((SELECT ',' + mdsColName FROM @cols FOR XML PATH('')),2,200000)
	SELECT @fldList = SUBSTRING((SELECT ',' + prodColName FROM @cols FOR XML PATH('')),2,200000)
	SELECT @assignList = SUBSTRING((SELECT ', ProdTable.' + prodColName + ' = NewValues.' + prodColName FROM @cols FOR XML PATH('')),2,200000)

	set @sql = '
		WITH NewValues (' + @id + ', ' + @fldList + ') 
			AS (SELECT Code, ' + @mdsFldList + ' FROM ' + @mdsViewName + ')
		MERGE ' + @tbl + ' AS ProdTable
			USING NewValues ON (ProdTable.' + @id + ' = NewValues.' + @id + ')
			WHEN MATCHED
				THEN UPDATE SET ' + @assignList + '
			WHEN NOT MATCHED THEN
				INSERT (' + @id + ', ' + @fldList + ')
					VALUES (NewValues.' + @id + ', ' + @fldList + ')'			
			
	if @allowDeletes = 1
		set @sql = @sql + '
			WHEN NOT MATCHED BY SOURCE THEN DELETE'

	set @sql = @sql + '
		OUTPUT $action, inserted.' + @id + ';'
	
	print @sql
	exec (@sql)
