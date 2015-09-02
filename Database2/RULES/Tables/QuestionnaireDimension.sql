CREATE TABLE [RULES].[QuestionnaireDimension] (
    [QuestionnaireDimensionID] INT             NOT NULL,
    [QuestionnaireID]          INT             NOT NULL,
    [Name]                     NVARCHAR (100)  NOT NULL,
    [Title]                    NVARCHAR (100)  CONSTRAINT [DF_QuestionnaireDimension_Title] DEFAULT ('') NOT NULL,
    [RatingText]               NVARCHAR (1000) NULL,
    [ShowRatingScale]          BIT             NOT NULL,
    [Sequence]                 INT             NOT NULL,
    [IsActive]                 BIT             NOT NULL,
    CONSTRAINT [PK_QuestionnaireDimension] PRIMARY KEY CLUSTERED ([QuestionnaireDimensionID] ASC),
    CONSTRAINT [FK_QuestionnaireDimension_Questionnaire] FOREIGN KEY ([QuestionnaireID]) REFERENCES [RULES].[Questionnaire] ([QuestionnaireID])
);

