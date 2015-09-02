CREATE TABLE [dbo].[AuthIdentity] (
    [AuthIdentityID]      INT            IDENTITY (5, 1) NOT NULL,
    [AuthTypeID]          INT            NOT NULL,
    [IdentityKey]         NVARCHAR (50)  NOT NULL,
    [FriendlyName]        NVARCHAR (50)  NOT NULL,
    [UserPreferencesJSON] NVARCHAR (MAX) NULL,
    [IsActive]            BIT            CONSTRAINT [DF_AuthIdentity_IsActive] DEFAULT ((1)) NOT NULL,
    [UpdateDateTime]      DATETIME2 (7)  CONSTRAINT [DF_AuthIdentity_UpdateDateTime] DEFAULT (getdate()) NOT NULL,
    [UpdatedBy]           NVARCHAR (50)  CONSTRAINT [DF_AuthIdentity_UpdatedBy] DEFAULT ('') NOT NULL,
    [LastLoginDateTime]   DATETIME2 (7)  NULL,
    CONSTRAINT [PK_AuthIdentity] PRIMARY KEY CLUSTERED ([AuthIdentityID] ASC),
    CONSTRAINT [FK_AuthIdentity_AuthType1] FOREIGN KEY ([AuthTypeID]) REFERENCES [CODES].[AuthType] ([AuthTypeID])
);

