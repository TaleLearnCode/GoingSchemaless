CREATE TABLE dbo.[Language]
(
  LanguageCode CHAR(2)       NOT NULL,
  LanguageName VARCHAR(100)  NOT NULL,
  NativeName   NVARCHAR(100) NOT NULL,
  IsActive     BIT           NOT NULL,
  CONSTRAINT pkcLanguage PRIMARY KEY CLUSTERED (LanguageCode)
)
GO

EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'Language',                              @value=N'Represents a spoken/written language.',                                         @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'Language', @level2name=N'LanguageCode', @value=N'Identifier of the language.',                                                   @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'Language', @level2name=N'LanguageName', @value=N'Name of the language.',                                                         @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'Language', @level2name=N'NativeName',   @value=N'Native name of the language.',                                                  @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'Language', @level2name=N'IsActive',     @value=N'Flag indicating whether the language is active.',                               @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'Language', @level2name=N'pkcLanguage',  @value=N'Defines the primary key for the Language table using the LanguageCode column.', @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO