﻿CREATE TABLE [METADATA].[EntityAttribute] (
    [EntityAttributeID] INT            NOT NULL,
    [EntityID]          INT            NOT NULL,
    [Name]              NVARCHAR (100) CONSTRAINT [DF_EntityAttribute_Name] DEFAULT ('') NOT NULL,
    [DisplayName]       NVARCHAR (100) CONSTRAINT [DF_EntityAttribute_DisplayName] DEFAULT ('') NOT NULL,
    [ColumnName]        NVARCHAR (100) NOT NULL,
    [IsMultiValueField] BIT            NOT NULL,
    [IsNullableField]   BIT            NOT NULL,
    [IsPII]             BIT            CONSTRAINT [DF_EntityAttribute_IsPII] DEFAULT ((0)) NOT NULL,
    [TSQLFormatString]  NVARCHAR (50)  NULL,
    [IsActive]          BIT            NOT NULL,
    [MaxLength]         INT            NULL,
    [IsIncludedInDW]    BIT            CONSTRAINT [DF_EntityAttribute_IsIncludedInDW] DEFAULT ((0)) NOT NULL,
    [LookupTableID]     INT            NULL,
    [DataTypeID]        INT            NOT NULL,
    [ControlWidthPx]    INT            NULL,
    [ControlClassName]  NVARCHAR (100) NULL,
    [ControlMaxLength]  INT            NULL,
    [ToolTip]           NVARCHAR (100) NULL,
    CONSTRAINT [PK_AttributeType] PRIMARY KEY CLUSTERED ([EntityAttributeID] ASC),
    CONSTRAINT [FK_AttributeType_EntityType] FOREIGN KEY ([EntityID]) REFERENCES [METADATA].[Entity] ([EntityID]),
    CONSTRAINT [FK_EntityAttribute_DataType] FOREIGN KEY ([DataTypeID]) REFERENCES [METADATA].[DataType] ([DataTypeID]),
    CONSTRAINT [FK_EntityAttribute_LookupTable] FOREIGN KEY ([LookupTableID]) REFERENCES [METADATA].[LookupTable] ([LookupTableID])
);

