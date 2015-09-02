CREATE procedure [dbo].[usp_UpdateAllMDSEntities]
as
	exec dbo.[usp_UpdateMDSEntityTable] 'CompassMDS.mdm.Tenant', 'dbo', 'Tenant', 0
	exec dbo.[usp_UpdateMDSEntityTable] 'CompassMDS.mdm.Module', 'dbo', 'Module', 0
	exec dbo.[usp_UpdateMDSEntityTable] 'CompassMDS.mdm.Permission', 'dbo', 'Permission', 0
	exec dbo.[usp_UpdateMDSEntityTable] 'CompassMDS.mdm.ModuleScopeType', 'dbo', 'ModuleScopeType', 0
	exec dbo.[usp_UpdateMDSEntityTable] 'CompassMDS.mdm.ModuleConfiguration', 'dbo', 'ModuleConfig', 1
	exec dbo.[usp_UpdateMDSEntityTable] 'CompassMDS.mdm.AlertEventType', 'dbo', 'AlertEventType', 0;
	exec dbo.[usp_UpdateMDSEntityTable] 'CompassMDS.mdm.AlertSubscription', 'dbo', 'AlertSubscription', 0;

	exec dbo.[usp_UpdateMDSEntityTable] 'CompassMDS.mdm.Entity', 'METADATA', 'Entity', 1;
	exec dbo.[usp_UpdateMDSEntityTable] 'CompassMDS.mdm.LookupTable', 'METADATA', 'LookupTable', 0;
	exec dbo.[usp_UpdateMDSEntityTable] 'CompassMDS.mdm.LookupValue', 'METADATA', 'LookupValue', 0;
	exec dbo.[usp_UpdateMDSEntityTable] 'CompassMDS.mdm.DataType', 'METADATA', 'DataType', 0;
	exec dbo.[usp_UpdateMDSEntityTable] 'CompassMDS.mdm.EntityAttribute', 'METADATA', 'EntityAttribute', 0;
	exec dbo.[usp_UpdateMDSEntityTable] 'CompassMDS.mdm.EntityStatus', 'METADATA', 'EntityStatus', 1
	exec dbo.[usp_UpdateMDSEntityTable] 'CompassMDS.mdm.EntityState', 'METADATA', 'EntityState', 1
	exec dbo.[usp_UpdateMDSEntityTable] 'CompassMDS.mdm.EventType', 'METADATA', 'EventType', 1

	exec dbo.[usp_UpdateMDSEntityTable] 'CompassMDS.mdm.IntervalType', 'TASKS', 'IntervalType', 0
	exec dbo.[usp_UpdateMDSEntityTable] 'CompassMDS.mdm.StepType', 'TASKS', 'StepType', 0
	exec dbo.[usp_UpdateMDSEntityTable] 'CompassMDS.mdm.Process', 'TASKS', 'Process', 0
	exec dbo.[usp_UpdateMDSEntityTable] 'CompassMDS.mdm.ProcessStep', 'TASKS', 'ProcessStep', 0
	
	exec dbo.[usp_UpdateMDSEntityTable] 'CompassMDS.mdm.Questionnaire', 'RULES', 'Questionnaire', 0
	exec dbo.[usp_UpdateMDSEntityTable] 'CompassMDS.mdm.QuestionnaireDimension', 'RULES', 'QuestionnaireDimension', 0
	exec dbo.[usp_UpdateMDSEntityTable] 'CompassMDS.mdm.QuestionnaireDimensionScale', 'RULES', 'QuestionnaireDimensionScale', 0
	exec dbo.[usp_UpdateMDSEntityTable] 'CompassMDS.mdm.Question', 'RULES', 'Question', 0

	

