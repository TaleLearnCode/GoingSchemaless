CREATE TABLE dbo.CustomerOrder
(
  CustomerOrderId   CHAR(36)  NOT NULL,
  CustomerId        INT       NOT NULL,
  CustomerAddressId INT       NOT NULL,
  OrderStatusId     INT       NOT NULL CONSTRAINT dfCustomerOrder_OrderStatusId DEFAULT(1),
  OrderDateTime     DATETIME2 NOT NULL CONSTRAINT dfCustomerOrder_OrderTime DEFAULT (GETUTCDATE()),
  ReserveDateTime   DATETIME2     NULL,
  ShipDateTime      DATETIME2     NULL,
  CompleteDateTime  DATETIME2     NULL,
  CONSTRAINT pkcCustomerOrder PRIMARY KEY CLUSTERED (CustomerOrderId),
  CONSTRAINT fkCustomerOrder_OrderStatus     FOREIGN KEY (OrderStatusId)     REFERENCES dbo.OrderStatus (OrderStatusId),
  CONSTRAINT fkCustomerOrder_Customer        FOREIGN KEY (CustomerId)        REFERENCES dbo.Customer (CustomerId),
  CONSTRAINT fkCustomerOrder_CustomerAddress FOREIGN KEY (CustomerAddressId) REFERENCES dbo.CustomerAddress (CustomerAddressId)
)
GO

EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'CustomerOrder',                                                 @value=N'Represents customer orders within the ecommerce platform.',                                                         @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'CustomerOrder', @level2name=N'CustomerOrderId',                 @value=N'Identifier of the customer order record.',                                                                          @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'CustomerOrder', @level2name=N'CustomerId',                      @value=N'Identifier of the associated customer order.',                                                                      @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'CustomerOrder', @level2name=N'OrderStatusId',                   @value=N'Identifier of the associated order status.',                                                                        @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'CustomerOrder', @level2name=N'CustomerAddressId',               @value=N'Identifier of the associated customer address.',                                                                    @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'CustomerOrder', @level2name=N'OrderDateTime',                   @value=N'The UTC date/time the customer order was placed.',                                                                  @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'CustomerOrder', @level2name=N'ReserveDateTime',                 @value=N'The UTC date/time inventory was reserved for the customer order.',                                                  @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'CustomerOrder', @level2name=N'ShipDateTime',                    @value=N'The UTC date/time the customer order was shipped.',                                                                 @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'CustomerOrder', @level2name=N'CompleteDateTime',                @value=N'The UTC date/time the customer order was completed.',                                                               @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'CustomerOrder', @level2name=N'pkcCustomerOrder',                @value=N'Defines the primary key for the CustomerOrder table using the CustomerOrderId column.',                             @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'CustomerOrder', @level2name=N'fkCustomerOrder_OrderStatus',     @value=N'Defines the relationship between the CustomerOrder and OrderStatus tables using the OrderStatusId column.',         @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'CustomerOrder', @level2name=N'fkCustomerOrder_Customer',        @value=N'Defines the relationship between the CustomerOrder and Customer tables using the CustomerId column.',               @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'CustomerOrder', @level2name=N'fkCustomerOrder_CustomerAddress', @value=N'Defines the relationship between the CustomerOrder and CustomerAddress tables using the CustomerAddressId column.', @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'CustomerOrder', @level2name=N'dfCustomerOrder_OrderStatusId',   @value=N'Defines the default value of the OrderStatusId column as 1 (placed).',                                              @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'CustomerOrder', @level2name=N'dfCustomerOrder_OrderTime',       @value=N'Defines the default value of the OrderTime column as the current UTC date/time.',                                   @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO