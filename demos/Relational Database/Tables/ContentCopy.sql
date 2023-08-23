CREATE TABLE dbo.ContentCopy
(
  ContentCopyId     INT            NOT NULL IDENTITY(1,1),
  ContentId         INT            NOT NULL,
  LanguageCultureId VARCHAR(15)    NOT NULL,
  CopyText          NVARCHAR(2000) NOT NULL,
  IsActive          BIT            NOT NULL CONSTRAINT dfContentCopy_IsActive DEFAULT (1),
  CONSTRAINT pkcContentCopy PRIMARY KEY CLUSTERED (ContentCopyId),
  CONSTRAINT fkContentCopy_Content         FOREIGN KEY (ContentId)         REFERENCES dbo.Content (ContentId),
  CONSTRAINT fkContentCopy_LanguageCulture FOREIGN KEY (LanguageCultureId) REFERENCES dbo.LanguageCulture (LanguageCultureId)
)
GO

EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'ContentCopy',                                               @value=N'The language/culture-specific version of a content element.',                                                     @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'ContentCopy', @level2name=N'ContentCopyId',                 @value=N'Identifier for the content copy record.',                                                                         @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'ContentCopy', @level2name=N'ContentId',                     @value=N'Identifier of the content element this language/culture-specific version is for.',                                @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'ContentCopy', @level2name=N'LanguageCultureId',             @value=N'Identifier of the language/culture used by the content copy.',                                                    @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'ContentCopy', @level2name=N'CopyText',                      @value=N'Copy for the language/culture-specific version of the content element.',                                          @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'ContentCopy', @level2name=N'IsActive',                      @value=N'Flag indicating whether the content copy is active or not.',                                                      @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'ContentCopy', @level2name=N'pkcContentCopy',                @value=N'Defines the primary key for the ContentCopy table using the ContentCopyId column.',                               @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'ContentCopy', @level2name=N'fkContentCopy_Content',         @value=N'Defines the relationship between the ContentCopy and Content tables using the ContentId column.',                 @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'ContentCopy', @level2name=N'fkContentCopy_LanguageCulture', @value=N'Defines the relationship between the ContentCopy and LanguageCulture tables using the LanguageCultureId column.', @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO