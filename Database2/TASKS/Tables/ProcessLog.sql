CREATE TABLE [TASKS].[ProcessLog] (
    [ProcessLogID]  BIGINT        IDENTITY (1, 1) NOT NULL,
    [ProcessStepID] INT           NOT NULL,
    [StartTime]     DATETIME      NOT NULL,
    [EndTime]       DATETIME      NULL,
    [Details]       VARCHAR (MAX) NULL,
    CONSTRAINT [PK_ProcessLog] PRIMARY KEY CLUSTERED ([ProcessLogID] ASC) ON [PRIMARY],
    CONSTRAINT [FK_ProcessLog_ProcessStep] FOREIGN KEY ([ProcessStepID]) REFERENCES [TASKS].[ProcessStep] ([ProcessStepID])
) TEXTIMAGE_ON [PRIMARY];

