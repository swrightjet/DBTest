CREATE TABLE [RULES].[QuestionnaireDimensionScale] (
    [QuestionnaireDimensionScaleID] INT             NOT NULL,
    [Name]                          NVARCHAR (100)  NOT NULL,
    [QuestionnaireDimensionID]      INT             NOT NULL,
    [RatingValue]                   SMALLINT        NOT NULL,
    [ScaleLabel]                    NVARCHAR (100)  NOT NULL,
    [HelpHtml]                      NVARCHAR (4000) NULL,
    CONSTRAINT [PK_QuestionnaireDimensionScale] PRIMARY KEY CLUSTERED ([QuestionnaireDimensionScaleID] ASC),
    CONSTRAINT [FK_QuestionnaireDimensionScale_QuestionnaireDimension] FOREIGN KEY ([QuestionnaireDimensionID]) REFERENCES [RULES].[QuestionnaireDimension] ([QuestionnaireDimensionID])
);

