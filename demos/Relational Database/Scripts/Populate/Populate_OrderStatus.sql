MERGE dbo.OrderStatus AS TARGET
USING (VALUES (1, 'Placed'),
              (2, 'Reserved'),
              (3, 'Shipped'),
              (4, 'Complete'),
              (5, 'Cancelled'))
AS SOURCE (OrderStatusId, OrderStatusName)
ON TARGET.OrderStatusId = SOURCE.OrderStatusId
WHEN MATCHED THEN UPDATE SET TARGET.OrderStatusName = SOURCE.OrderStatusName
WHEN NOT MATCHED THEN INSERT (OrderStatusId,
                              OrderStatusName)
                      VALUES (SOURCE.OrderStatusId,
                             SOURCE.OrderStatusName);