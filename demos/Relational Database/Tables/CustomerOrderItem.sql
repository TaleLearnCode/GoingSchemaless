CREATE TABLE dbo.CustomerOrderItem
(
  CustomerOrderItemId INT       NOT NULL IDENTITY(1,1),
  CustomerOrderId     CHAR(36)  NOT NULL,
  ProductId           CHAR(5)   NOT NULL,
  Quantity            INT       NOT NULL,
  OrderItemStatusId   INT       NOT NULL CONSTRAINT dfOrderItem_OrderStatusId DEFAULT(1),
  DateTimeAdded       DATETIME2 NOT NULL CONSTRAINT dfOrderItem_DateTimeAdded DEFAULT(GETUTCDATE()),
  DateTimeModified    DATETIME2     NULL,
  CONSTRAINT pkcCustomerOrderItem PRIMARY KEY CLUSTERED (CustomerOrderItemId),
  CONSTRAINT fkCustomerOrderItem_CustomerOrder FOREIGN KEY (CustomerOrderId)   REFERENCES dbo.CustomerOrder (CustomerOrderId),
  CONSTRAINT fkCustomerOrderItem_Product       FOREIGN KEY (ProductId)         REFERENCES dbo.Product (ProductId),
  CONSTRAINT fkCustomerOrderItem_OrderStatus   FOREIGN KEY (OrderItemStatusId) REFERENCES dbo.OrderStatus (OrderStatusId)
)
GO

EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'CustomerOrderItem',                                                   @value=N'Represents an item within a customer order.',                                                                       @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'CustomerOrderItem', @level2name=N'CustomerOrderItemId',               @value=N'Identifier of the customer order item record.',                                                                     @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'CustomerOrderItem', @level2name=N'CustomerOrderId',                   @value=N'Identifier of the associated customer order record.',                                                               @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'CustomerOrderItem', @level2name=N'ProductId',                         @value=N'Identifier of the product being ordered.',                                                                          @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'CustomerOrderItem', @level2name=N'Quantity',                          @value=N'The quantity of producting being ordered.',                                                                         @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'CustomerOrderItem', @level2name=N'OrderItemStatusId',                 @value=N'Identifier of the associated order item status.',                                                                   @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'CustomerOrderItem', @level2name=N'DateTimeAdded',                     @value=N'The UTC date/time the item was added to the product.',                                                              @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'CustomerOrderItem', @level2name=N'DateTimeModified',                  @value=N'The UTC date/time the item was modified.',                                                                          @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'CustomerOrderItem', @level2name=N'pkcCustomerOrderItem',              @value=N'Defines the primary key for the CustomerOrderItem table using the CustomerOrderItemId column.',                     @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'CustomerOrderItem', @level2name=N'fkCustomerOrderItem_CustomerOrder', @value=N'Defines the relationship between the CustomerOrderItem and CustomerOrder tables using the CustomerOrderId column.', @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'CustomerOrderItem', @level2name=N'fkCustomerOrderItem_Product',       @value=N'Defines the relationship between the CustomerOrderItem and Product tables using the ProductId column.',             @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'CustomerOrderItem', @level2name=N'fkCustomerOrderItem_OrderStatus',   @value=N'Defines the relationship between the CustomerOrderItem and OrderStatus tables using the OrderStatusId column.',     @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'CustomerOrderItem', @level2name=N'dfOrderItem_OrderStatusId',         @value=N'Defines the default value of the OrderStatusId column as 1 (placed).',                                              @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'CustomerOrderItem', @level2name=N'dfOrderItem_DateTimeAdded',         @value=N'Defines the default value of the DateTimeAdded column as the current UTC date/time.',                               @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO
