CREATE TABLE dbo.ProductTheme
(
  ProductThemeId INT     NOT NULL IDENTITY (1,1),
  ProductId      CHAR(5) NOT NULL,
  ThemeId        INT     NOT NULL,
  SortOrder      INT     NOT NULL,
  CONSTRAINT pkcProductTheme PRIMARY KEY CLUSTERED (ProductThemeId),
  CONSTRAINT fkProductTheme_Product FOREIGN KEY (ProductId) REFERENCES dbo.Product (ProductId),
  CONSTRAINT fkProductTheme_Theme   FOREIGN KEY (ThemeId)   REFERENCES dbo.Theme (ThemeId)
)
GO

EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'ProductTheme',                                        @value=N'Links a product to a marketing theme.',                                                            @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'ProductTheme', @level2name=N'ProductThemeId',         @value=N'The identifier of the product theme record.',                                                      @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'ProductTheme', @level2name=N'ProductId',              @value=N'Identifier of the referenced product.',                                                            @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'ProductTheme', @level2name=N'ThemeId',                @value=N'Identifier of the referenced theme.',                                                              @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'ProductTheme', @level2name=N'SortOrder',              @value=N'The sorting order of the product within the theme.',                                               @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'ProductTheme', @level2name=N'pkcProductTheme',        @value=N'Defines the primary key for the ProductTheme table using the ProductThemeId column.',              @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'ProductTheme', @level2name=N'fkProductTheme_Product', @value=N'Defines the relationship between the ProductTheme and Product tables using the ProductId column.', @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'ProductTheme', @level2name=N'fkProductTheme_Theme',   @value=N'Defines the relationship between the ProductTheme and Theme tables using the ThemeId column.',     @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO