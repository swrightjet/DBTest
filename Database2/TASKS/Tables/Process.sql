CREATE TABLE [TASKS].[Process] (
    [ProcessID]      SMALLINT      NOT NULL,
    [Name]           VARCHAR (150) NOT NULL,
    [Interval]       INT           NOT NULL,
    [IntervalTypeID] SMALLINT      NOT NULL,
    [IsActive]       BIT           NOT NULL,
    [IsAsync]        BIT           NOT NULL,
    [InsertedBy]     VARCHAR (255) NOT NULL,
    [InsertedDate]   DATETIME      NOT NULL,
    CONSTRAINT [PK_Process] PRIMARY KEY CLUSTERED ([ProcessID] ASC) ON [PRIMARY],
    CONSTRAINT [FK_Process_Interval] FOREIGN KEY ([IntervalTypeID]) REFERENCES [TASKS].[IntervalType] ([IntervalTypeID])
);

