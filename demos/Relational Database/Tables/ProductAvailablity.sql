CREATE TABLE dbo.ProductAvailability
(
  ProductAvailabilityId   INT          NOT NULL,
  ProductAvailabilityName VARCHAR(100) NOT NULL,
  SortOrder               INT          NOT NULL,
  IsActive                BIT          NOT NULL,
  CONSTRAINT pkcProductAvailability PRIMARY KEY CLUSTERED (ProductAvailabilityId)
)
GO

EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'ProductAvailability',                                         @value=N'The current availability of a product.',                                                            @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'ProductAvailability', @level2name=N'ProductAvailabilityId',   @value=N'The identifier of the product availability record.',                                                @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'ProductAvailability', @level2name=N'ProductAvailabilityName', @value=N'The name of the product availability.',                                                             @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'ProductAvailability', @level2name=N'SortOrder',               @value=N'The sorting order of the product availability.',                                                    @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'ProductAvailability', @level2name=N'IsActive',                @value=N'Flag indicating whether the product availability is active.',                                       @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'ProductAvailability', @level2name=N'pkcProductAvailability',  @value=N'Defines the primary key for the ProductAvailability table using the ProductAvailabilityId column.', @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO