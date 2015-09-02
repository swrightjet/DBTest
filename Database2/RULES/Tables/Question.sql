CREATE TABLE [RULES].[Question] (
    [QuestionID]               INT             NOT NULL,
    [QuestionnaireDimensionID] INT             NOT NULL,
    [Name]                     NVARCHAR (100)  NOT NULL,
    [QuestionText]             NVARCHAR (4000) NOT NULL,
    [ShowCondition]            NVARCHAR (1000) NULL,
    [Sequence]                 INT             NOT NULL,
    [IsActive]                 BIT             NOT NULL,
    [AnswersCSV]               NVARCHAR (4000) NULL,
    CONSTRAINT [PK_Question] PRIMARY KEY CLUSTERED ([QuestionID] ASC),
    CONSTRAINT [FK_Question_QuestionnaireDimension] FOREIGN KEY ([QuestionnaireDimensionID]) REFERENCES [RULES].[QuestionnaireDimension] ([QuestionnaireDimensionID])
);

