CREATE TABLE dbo.Content
(
  ContentId INT NOT NULL IDENTITY(1,1),
  ContentTypeId INT NOT NULL,
  IsActive      BIT NOT NULL CONSTRAINT dfContent_IsActive DEFAULT (1),
  CONSTRAINT pkcContent PRIMARY KEY CLUSTERED (ContentId),
  CONSTRAINT fkContent_ContentType FOREIGN KEY (ContentTypeId) REFERENCES dbo.ContentType (ContentTypeId)
)
GO

EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'Content',                                       @value=N'Represents content for an item managed by the platform',                                              @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'Content', @level2name=N'ContentId',             @value=N'Identifier for the content record.',                                                                  @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'Content', @level2name=N'ContentTypeId',         @value=N'Identifier of the type of content being represented.',                                                @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'Content', @level2name=N'IsActive',              @value=N'Flag indicating whether the content is active.',                                                      @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'Content', @level2name=N'pkcContent',            @value=N'Defines the primary key for the Content table using the ContentId column.',                           @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'Content', @level2name=N'fkContent_ContentType', @value=N'Defines the relationship between the Content and ContentType tables using the ContentTypeId column.', @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO