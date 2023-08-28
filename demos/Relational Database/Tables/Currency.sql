CREATE TABLE dbo.Currency
(
  CurrencyCode   CHAR(3)      NOT NULL,
  CurrencyNumber CHAR(3)      NOT NULL,
  CurrencyName   VARCHAR(100) NOT NULL,
  IsActive       BIT          NOT NULL,
  CONSTRAINT pkcCurrency PRIMARY KEY CLUSTERED (CurrencyCode)
)
GO

EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'Currency',                                @value=N'Lookup table representing the world currencies as defined by the ISO 4217 standard.', @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'Currency', @level2name=N'CurrencyCode',   @value=N'Identifier of the currency using the ISO 4217 Code field.',                           @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'Currency', @level2name=N'CurrencyNumber', @value=N'Identifier of the currency using the ISO 4217 Num field.',                            @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'Currency', @level2name=N'CurrencyName',   @value=N'The standard name for the currency per the ISO 4217 standard.',                       @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'Currency', @level2name=N'IsActive',       @value=N'Flag indicating whether the currency is active.',                                     @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'Currency', @level2name=N'pkcCurrency',    @value=N'Defines the primary key for the Currency table using the CurrencyCode column.',       @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO