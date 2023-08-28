CREATE TABLE dbo.OrderStatus
(
  OrderStatusId   INT          NOT NULL,
  OrderStatusName VARCHAR(100) NOT NULL,
  CONSTRAINT pkcOrderStatus PRIMARY KEY CLUSTERED (OrderStatusId)
)
GO

EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'OrderStatus',                                               @value=N'Represents the status of a customer order.',                                        @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'OrderStatus', @level2name=N'OrderStatusId',                 @value=N'Identifier of the customer order status record.',                                   @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'OrderStatus', @level2name=N'OrderStatusName',               @value=N'The name of the customer order status.',                                            @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'OrderStatus', @level2name=N'pkcOrderStatus',                @value=N'Defines the primary key for the OrderStatus table using the OrderStatusId column.', @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO