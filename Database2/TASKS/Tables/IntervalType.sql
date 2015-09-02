CREATE TABLE [TASKS].[IntervalType] (
    [IntervalTypeID] SMALLINT      NOT NULL,
    [Name]           NVARCHAR (50) NOT NULL,
    CONSTRAINT [PK_Interval] PRIMARY KEY CLUSTERED ([IntervalTypeID] ASC) ON [PRIMARY]
);

