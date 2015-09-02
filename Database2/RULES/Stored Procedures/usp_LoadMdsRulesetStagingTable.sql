
CREATE PROCEDURE [RULES].[usp_LoadMdsRulesetStagingTable]
AS
	declare @batchtag varchar(100) = convert(varchar(100), NEWID())

	insert CompassMDS.stg.RuleSet_2_Leaf (ImportType, BatchTag, Code, Name, AssemblyPath, ActivityName, ModifiedBy, MajorVersion, MinorVersion, IsActive, ModifiedDate)
		select 0, @batchtag, RuleSetID, Name, AssemblyPath, ActivityName, ModifiedBy, MajorVersion, MinorVersion, IsActive, ModifiedDate
		  from RULES.RuleSet

	exec CompassMDS.stg.udp_RuleSet_2_Leaf
			@VersionName = N'VERSION_1',
			@LogFlag = 1,
			@BatchTag = @batchtag

