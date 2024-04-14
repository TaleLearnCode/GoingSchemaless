CREATE TABLE dbo.LanguageCulture
(
  LanguageCultureId VARCHAR(15)   NOT NULL,
  LanguageCode      CHAR(3)       NOT NULL,
  EnglishName       VARCHAR(100)  NOT NULL,
  NativeName        NVARCHAR(100) NOT NULL,
  IsActive          BIT           NOT NULL,
  CONSTRAINT pkcLanguageCulture PRIMARY KEY CLUSTERED (LanguageCultureId)
)
GO

EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'LanguageCulture',                                               @value=N'Represents a language with culture differences that is spoken/written.',             @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'LanguageCulture', @level2name=N'LanguageCultureId',             @value=N'Identifier of the language culture record.',                                         @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'LanguageCulture', @level2name=N'LanguageCode',                  @value=N'Code for the associated language.',                                                  @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'LanguageCulture', @level2name=N'EnglishName',                   @value=N'The English name of the language culture.',                                          @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'LanguageCulture', @level2name=N'NativeName',                    @value=N'The native name of the language culture.',                                           @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'LanguageCulture', @level2name=N'IsActive',                      @value=N'Flag indicating whether the language culture is active.',                            @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'LanguageCulture', @level2name=N'pkcLanguageCulture',            @value=N'Defines the primary key for the Content table using the ContentId column.',          @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO