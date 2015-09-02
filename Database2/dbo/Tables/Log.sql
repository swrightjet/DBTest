CREATE TABLE [dbo].[Log] (
    [LogID]        INT            IDENTITY (1, 1) NOT NULL,
    [LogTypeID]    INT            NOT NULL,
    [Severity]     NVARCHAR (32)  NOT NULL,
    [Timestamp]    DATETIME       NOT NULL,
    [MachineName]  NVARCHAR (32)  NOT NULL,
    [ProcessName]  NVARCHAR (512) NOT NULL,
    [UserIdentity] NVARCHAR (512) NOT NULL,
    [Message]      NVARCHAR (MAX) NOT NULL,
    [Data]         XML            NOT NULL,
    CONSTRAINT [PK_Log] PRIMARY KEY CLUSTERED ([LogID] ASC),
    CONSTRAINT [FK_Log_LogType] FOREIGN KEY ([LogTypeID]) REFERENCES [CODES].[LogType] ([LogTypeID])
) TEXTIMAGE_ON [PRIMARY];

