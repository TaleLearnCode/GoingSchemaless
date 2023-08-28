CREATE TABLE dbo.ContentType
(
  ContentTypeId   INT          NOT NULL,
  ContentTypeName VARCHAR(100) NOT NULL,
  IsActive        BIT          NOT NULL,
  CONSTRAINT pkcContentType PRIMARY KEY CLUSTERED (ContentTypeId)
)
GO

EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'ContentType',                                 @value=N'Supported content types for the platform.',                                         @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'ContentType', @level2name=N'ContentTypeId',   @value=N'Identifier for the content type.',                                                  @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'ContentType', @level2name=N'ContentTypeName', @value=N'Name of the content type.',                                                         @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'ContentType', @level2name=N'IsActive',        @value=N'Flag indicating whether the content type is actively supported.',                   @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'ContentType', @level2name=N'pkcContentType',  @value=N'Defines the primary key for the ContentType table using the ContentTypeId column.', @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO