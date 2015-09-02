CREATE TABLE [TASKS].[ProcessStep] (
    [ProcessStepID] INT           NOT NULL,
    [ProcessID]     SMALLINT      NOT NULL,
    [StepTypeID]    INT           NOT NULL,
    [Name]          VARCHAR (150) NOT NULL,
    [StepSequence]  INT           NOT NULL,
    [StepParameter] VARCHAR (MAX) NULL,
    [IsActive]      BIT           NOT NULL,
    [InsertedBy]    VARCHAR (255) NOT NULL,
    [InsertedDate]  DATETIME      NOT NULL,
    CONSTRAINT [PK_ProcessStep] PRIMARY KEY CLUSTERED ([ProcessStepID] ASC) ON [PRIMARY],
    CONSTRAINT [FK_ProcessStep_Process] FOREIGN KEY ([ProcessID]) REFERENCES [TASKS].[Process] ([ProcessID]),
    CONSTRAINT [FK_ProcessStep_StepType] FOREIGN KEY ([StepTypeID]) REFERENCES [TASKS].[StepType] ([StepTypeID])
) TEXTIMAGE_ON [PRIMARY];

