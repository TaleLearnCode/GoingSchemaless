CREATE TABLE dbo.CustomerAddress
(
  CustomerAddressId   INT NOT NULL IDENTITY(1,1),
  CustomerId          INT NOT NULL,
  FullName            NVARCHAR(200) NOT NULL,
  PhoneNumber         VARCHAR(20)   NOT NULL,
  AddressLine1        NVARCHAR(100) NOT NULL,
  AddressLine2        NVARCHAR(100)     NULL,
  City                NVARCHAR(100) NOT NULL,
  CountryCode         CHAR(2)       NOT NULL,
  CountryDivisionCode CHAR(3)           NULL,
  PostalCode          VARCHAR(20)       NULL,
  IsDefaultAddress    BIT           NOT NULL CONSTRAINT dfCustomerAddress_IsDefault DEFAULT(0),
  CONSTRAINT pkcCustomerAddress PRIMARY KEY CLUSTERED (CustomerAddressId),
  CONSTRAINT fkCustomerAddress_Customer        FOREIGN KEY (CustomerId)                       REFERENCES dbo.Customer (CustomerId),
  CONSTRAINT fkCustomerAddress_Country         FOREIGN KEY (CountryCode)                      REFERENCES dbo.Country (CountryCode),
  CONSTRAINT fkCustomerAddress_CountryDivision FOREIGN KEY (CountryCode, CountryDivisionCode) REFERENCES dbo.CountryDivision (CountryCode, CountryDivisionCode)
)
GO

EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'CustomerAddress',                                                   @value=N'Represents an address for a Building Bricks customer.',                                                                 @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'CustomerAddress', @level2name=N'CustomerAddressId',                 @value=N'Identifier for the customer address record.',                                                                           @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'CustomerAddress', @level2name=N'CustomerId',                        @value=N'Identifier for the customer the associated record.',                                                                    @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'CustomerAddress', @level2name=N'FullName',                          @value=N'The full name of the address recipient.',                                                                               @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'CustomerAddress', @level2name=N'PhoneNumber',                       @value=N'The phone number to use to assist with delivery.',                                                                      @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'CustomerAddress', @level2name=N'AddressLine1',                      @value=N'The first line of the street address.',                                                                                 @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'CustomerAddress', @level2name=N'AddressLine2',                      @value=N'The second line of the street address.',                                                                                @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'CustomerAddress', @level2name=N'City',                              @value=N'The city where the customer address is located.',                                                                       @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'CustomerAddress', @level2name=N'CountryCode',                       @value=N'The code of the country where the customer address is located.',                                                        @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'CustomerAddress', @level2name=N'CountryDivisionCode',               @value=N'The code of the country division where the customer address is located.',                                               @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'CustomerAddress', @level2name=N'PostalCode',                        @value=N'The postal code for the customer address.',                                                                             @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'CustomerAddress', @level2name=N'IsDefaultAddress',                  @value=N'Indication whether the address is the default for the customer.',                                                       @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'CustomerAddress', @level2name=N'pkcCustomerAddress',                @value=N'Defines the primary key for the CustomerAddress table using the CustomerAddressId column.',                             @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'CustomerAddress', @level2name=N'fkCustomerAddress_Customer',        @value=N'Defines the relationship between the CustomerAddress and Customer tables using the CustomerId column.',                 @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'CustomerAddress', @level2name=N'fkCustomerAddress_Country',         @value=N'Defines the relationship between the CustomerAddress and Country tables using the CountryCode column.',                 @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'CustomerAddress', @level2name=N'fkCustomerAddress_CountryDivision', @value=N'Defines the relationship between the CustomerAddress and CountryDivision tables using the CountryDivisionCode column.', @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'CustomerAddress', @level2name=N'dfCustomerAddress_IsDefault',       @value=N'Defines the default value of the IsDefault column as 0 (false).',                                                       @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO