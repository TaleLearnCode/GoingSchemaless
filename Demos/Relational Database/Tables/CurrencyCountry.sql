CREATE TABLE dbo.CurrencyCountry
(
  CurrencyCountryId INT     NOT NULL,
  CurrencyCode      CHAR(3) NOT NULL,
  CountryCode       CHAR(2) NOT NULL,
  IsActive          BIT     NOT NULL,
  CONSTRAINT pkcCurrencyCountry PRIMARY KEY CLUSTERED (CurrencyCountryId),
  CONSTRAINT fkCurrencyCountry_Currency FOREIGN KEY (CurrencyCode) REFERENCES dbo.Currency (CurrencyCode),
  CONSTRAINT fkCurrencyCountry_Country  FOREIGN KEY (CountryCode)  REFERENCES dbo.Country (CountryCode)
)
GO

EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'CurrencyCountry',                                            @value=N'Linking of currency to country where currency is used.',                                                  @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'CurrencyCountry', @level2name=N'CurrencyCountryId',          @value=N'Identifier for the currency country record.',                                                             @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'CurrencyCountry', @level2name=N'CurrencyCode',               @value=N'Identifier of the referenced currency.',                                                                  @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'CurrencyCountry', @level2name=N'CountryCode',                @value=N'Identifier of the referenced country.',                                                                   @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'CurrencyCountry', @level2name=N'IsActive',                   @value=N'Flag indicating whether the currency/country link is active.',                                            @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'CurrencyCountry', @level2name=N'pkcCurrencyCountry',         @value=N'Defines the primary key for the CurrencyCountry table using the CurrencyCountryId column.',               @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'CurrencyCountry', @level2name=N'fkCurrencyCountry_Currency', @value=N'Defines the relationship between the CurrencyCountry and Currency tables using the CurrencyCode column.', @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'CurrencyCountry', @level2name=N'fkCurrencyCountry_Country',  @value=N'Defines the relationship between the CurrencyCountry and Country tables using the CountryCode column.',   @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO