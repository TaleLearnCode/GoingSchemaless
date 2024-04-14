CREATE TABLE dbo.Theme
(
  ThemeId         INT           NOT NULL IDENTITY(1,1),
  ThemeName       NVARCHAR(100) NOT NULL,
  LocalizedNameId INT               NULL,
  DescriptionId   INT               NULL,
  IsActive        BIT           NOT NULL CONSTRAINT dfTheme_IsActive DEFAULT (1)
  CONSTRAINT pkcTheme PRIMARY KEY CLUSTERED (ThemeId),
  CONSTRAINT fkTheme_Content_LocalizedName FOREIGN KEY (LocalizedNameId) REFERENCES dbo.Content (ContentId),
  CONSTRAINT fkTheme_Content_Description FOREIGN KEY (DescriptionId) REFERENCES dbo.Content (ContentId)
)
GO

EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'Theme',                                               @value=N'Represents a theme within the products for classification and marketing purposes.',               @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE';
GO                                                                                                                                                                                                                             
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'Theme', @level2name=N'ThemeId',                       @value=N'The identifier of the theme record.',                                                             @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'Theme', @level2name=N'ThemeName',                     @value=N'The name of the theme.',                                                                          @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'Theme', @level2name=N'LocalizedNameId',               @value=N'Identifier of the content that represents the localized name of the product theme.',              @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'Theme', @level2name=N'DescriptionId',                 @value=N'Identifier of the content that represents the description of the product theme.',                 @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'Theme', @level2name=N'pkcTheme',                      @value=N'Defines the primary key for the Theme table using the ThemeId column.',                           @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'Theme', @level2name=N'fkTheme_Content_LocalizedName', @value=N'Defines the relationship between the Theme and Content tables using the DescriptionId column.',   @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'Theme', @level2name=N'fkTheme_Content_Description',   @value=N'Defines the relationship between the Theme and Content tables using the LocalizedNameId column.', @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'Theme', @level2name=N'dfTheme_IsActive',              @value=N'Defines the default value of the IsActive column as 1 (true).',                                   @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO