CREATE TABLE dbo.Product
(
  ProductId             CHAR(5)       NOT NULL,
  ProductName           NVARCHAR(100) NOT NULL,
  YearReleased          INT               NULL,
  ShippingWeight        INT               NULL,
  PieceCount            INT               NULL,
  LoyalityPoints        INT               NULL,
  ProductAvailabilityId INT           NOT NULL CONSTRAINT dfProduct_ProductAvailabilityId DEFAULT (0),
  HardToFind            BIT           NOT NULL CONSTRAINT dfProduct_HardToFind DEFAULT (0),
  LocalizedNameId       INT               NULL,
  DescriptionId         INT               NULL,
  IsActive              BIT           NOT NULL CONSTRAINT dfProduct_IsActive DEFAULT (1),
  CONSTRAINT pkcProduct PRIMARY KEY CLUSTERED (ProductId),
  CONSTRAINT fkProduct_ProductAvailability   FOREIGN KEY (ProductAvailabilityId) REFERENCES dbo.ProductAvailability (ProductAvailabilityId),
  CONSTRAINT fkProduct_Content_LocalizedName FOREIGN KEY (LocalizedNameId)       REFERENCES dbo.Content (ContentId),
  CONSTRAINT fkProduct_Content_Description   FOREIGN KEY (DescriptionId)         REFERENCES dbo.Content (ContentId)
)
GO

EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'Product',                                                 @value=N'Represents a product sold by Building Bricks.',                                                                       @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'Product', @level2name=N'ProductId',                       @value=N'The identifier of the product record.',                                                                               @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'Product', @level2name=N'ProductName',                     @value=N'The name of the product.',                                                                                            @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'Product', @level2name=N'YearReleased',                    @value=N'The year the product was released.',                                                                                  @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'Product', @level2name=N'ShippingWeight',                  @value=N'The shipping weight for the product.',                                                                                @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'Product', @level2name=N'PieceCount',                      @value=N'The number of pieces in the product.',                                                                                @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'Product', @level2name=N'LoyalityPoints',                  @value=N'The number of loyality points awarded to purchasers of the product.',                                                 @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'Product', @level2name=N'ProductAvailabilityId',           @value=N'Identifier of the product''s current availability online.',                                                           @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'Product', @level2name=N'HardToFind',                      @value=N'Flag indicating whether the product is hard to find in retail stores.',                                               @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'Product', @level2name=N'LocalizedNameId',                 @value=N'Identifier of the content element representing the localized name of the product.',                                   @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'Product', @level2name=N'DescriptionId',                   @value=N'Identifier of the content element representing the description of the product.',                                      @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'Product', @level2name=N'IsActive',                        @value=N'Flag indicating whether the product record is active (not soft-deleted).',                                            @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'Product', @level2name=N'pkcProduct',                      @value=N'Defines the primary key for the Product table using the ProductId column.',                                           @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'Product', @level2name=N'fkProduct_ProductAvailability',   @value=N'Defines the relationship between the Product and ProductAvailability tables using the ProductAvailabilityId column.', @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'Product', @level2name=N'fkProduct_Content_LocalizedName', @value=N'Defines the relationship between the Product and Content tables using the LocalizedNameId column.',                   @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'Product', @level2name=N'fkProduct_Content_Description',   @value=N'Defines the relationship between the Product and Content tables using the DescriptionId column.',                     @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'Product', @level2name=N'dfProduct_ProductAvailabilityId', @value=N'Defines the default value of the ProductAvailabilityId column as 0 (Product Development).',                           @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'Product', @level2name=N'dfProduct_HardToFind',            @value=N'Defines the default value of the ProductAvailabilityId column as 0 (false).',                                         @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'Product', @level2name=N'dfProduct_IsActive',              @value=N'Defines the default value of the IsActive column as 1 (true).',                                                       @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO