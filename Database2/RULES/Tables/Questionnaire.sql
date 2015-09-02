CREATE TABLE [RULES].[Questionnaire] (
    [QuestionnaireID] INT            NOT NULL,
    [Name]            NVARCHAR (100) NOT NULL,
    [Description]     NVARCHAR (100) CONSTRAINT [DF_Questionnaire_Description] DEFAULT ('') NOT NULL,
    CONSTRAINT [PK_Questionnaire] PRIMARY KEY CLUSTERED ([QuestionnaireID] ASC)
);

