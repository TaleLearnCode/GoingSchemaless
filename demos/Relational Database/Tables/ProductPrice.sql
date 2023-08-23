CREATE TABLE dbo.ProductPrice
(
  ProductPriceId INT        NOT NULL IDENTITY(1,1),
  ProductId      CHAR(5)    NOT NULL,
  CurrencyCode   CHAR(3)    NOT NULL,
  Price          SMALLMONEY NOT NULL,
  CONSTRAINT pkcProductPrice PRIMARY KEY CLUSTERED (ProductPriceId),
  CONSTRAINT fkProductPrice_Product  FOREIGN KEY (ProductId)    REFERENCES dbo.Product (ProductId),
  CONSTRAINT fkProductPrice_Currency FOREIGN KEY (CurrencyCode) REFERENCES dbo.Currency (CurrencyCode)
)
GO

EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'ProductPrice',                                         @value=N'Represents the currency-specific pricing for a product.',                                              @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'ProductPrice', @level2name=N'ProductPriceId',          @value=N'The identifier of the product pricing record.',                                                        @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'ProductPrice', @level2name=N'ProductId',               @value=N'Identifier of the referenced product.',                                                                @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'ProductPrice', @level2name=N'CurrencyCode',            @value=N'Identifier of the referenced currency.',                                                               @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'ProductPrice', @level2name=N'Price',                   @value=N'The price of the referenced product in the referenced currency.',                                      @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'ProductPrice', @level2name=N'pkcProductPrice',         @value=N'Defines the primary key for the ProductPrice table using the ProductPriceId column.',                  @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'ProductPrice', @level2name=N'fkProductPrice_Product',  @value=N'Defines the relationship between the ProductPrice and Product tables using the ProductId column.',     @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'ProductPrice', @level2name=N'fkProductPrice_Currency', @value=N'Defines the relationship between the ProductPrice and Currency tables using the CurrencyCode column.', @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO