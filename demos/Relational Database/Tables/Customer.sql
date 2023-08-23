CREATE TABLE dbo.Customer
(
  CustomerId   INT           NOT NULL IDENTITY(1,1),
  FirstName    NVARCHAR(100)     NULL,
  LastName     NVARCHAR(100) NOT NULL,
  EmailAddress VARCHAR(255)  NOT NULL,
  CONSTRAINT pkcCustomer PRIMARY KEY CLUSTERED (CustomerId)
)
GO

EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'Customer',                              @value=N'Represents a customer of the Buliding Bricks ecommerce platform.',            @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'Customer', @level2name=N'CustomerId',   @value=N'Identifier for the customer record.',                                         @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'Customer', @level2name=N'FirstName',    @value=N'The first name for the customer.',                                            @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'Customer', @level2name=N'LastName',     @value=N'The last name for the customer.',                                             @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'Customer', @level2name=N'EmailAddress', @value=N'The email address for the customer.',                                         @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'Customer', @level2name=N'pkcCustomer',  @value=N'Defines the primary key for the Customer table using the CustomerId column.', @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO