SET IDENTITY_INSERT dbo.CustomerOrderItem ON
GO

MERGE dbo.CustomerOrderItem AS TARGET
USING (VALUES ( 1, '93669345-859D-45D4-A571-29B3D110A6E7', '21058', 1, 4, '2022-06-01 12:00:00'),
              ( 2, '56F725F0-9F70-4F10-8638-4ABC6505D385', '21060', 1, 4, '2023-06-01 12:00:00'),
              ( 3, 'E62A1E8E-1172-4E29-8AB3-DB7939A05425', '21054', 1, 4, '2020-06-01 12:00:00'),
              ( 4, 'FFF6ED47-9A16-4569-9CB5-15420EB2965A', '40619', 1, 4, '2023-06-01 12:00:00'),
              ( 5, '22B0740F-3EE6-48D6-9F70-58BE1351F4DB', '40544', 1, 4, '2022-06-01 12:00:00'),
              ( 6, 'EAB4CAA6-5D81-41CB-8E7F-7312EE328472', '40623', 1, 4, '2023-06-01 12:00:00'),
              ( 7, '2E505253-BA1E-4FA2-A4DD-BB23DFC410E0', '60368', 1, 4, '2023-06-01 12:00:00'),
              ( 8, '81330FA2-E422-41CE-B1A5-C0159C2C263D', '60379', 1, 4, '2023-06-01 12:00:00'),
              ( 9, 'D70F6F99-6322-4131-9329-FE270F5CE7B4', '60380', 1, 4, '2023-06-01 12:00:00'),
              (10, 'F8C595F4-4E5B-4955-8B8C-F930CF4645A9', '10292', 1, 4, '2021-06-01 12:00:00'),
              (11, 'D4B2E250-7DC4-4FDD-BB84-815D7AB6D5F3', '10276', 1, 4, '2020-06-01 12:00:00'),
              (12, '42F0B13A-2A2E-4B07-BA83-B9FC4E707349', '10294', 1, 4, '2021-06-01 12:00:00'),
              (13, '2412393E-B3D0-4754-BCD7-7BAC3EC817FE', '10302', 1, 4, '2022-06-01 12:00:00'),
              (14, 'C5027F80-9BE4-4743-9D7F-BF24DD2267ED', '21341', 1, 4, '2023-06-01 12:00:00'),
              (15, '61B9FBBE-8DFC-439F-A2D0-FA163E067CB6', '21335', 1, 4, '2022-06-01 12:00:00'),
              (16, '7AD5F919-14FF-4DDD-A79A-446003CDA187', '21329', 1, 4, '2021-06-01 12:00:00'),
              (17, '72092556-0A72-4701-AE24-1AD704ED65F8', '10307', 1, 4, '2022-06-01 12:00:00'),
              (18, '49964921-C195-45A5-AB40-B986FAE03E83', '10314', 1, 4, '2023-06-01 12:00:00'),
              (19, '0FA5E501-1B11-440B-991C-0AFB0BF1FB67', '10315', 1, 4, '2023-06-01 12:00:00'),
              (20, '8CC6C3BD-B623-451A-8AA4-FBEBBB84BCA9', '10497', 1, 4, '2022-06-01 12:00:00'))
AS SOURCE (CustomerOrderItemId, CustomerOrderId, ProductId, Quantity, OrderItemStatusId, DateTimeAdded)
ON TARGET.CustomerOrderItemId = SOURCE.CustomerOrderItemId
WHEN MATCHED THEN UPDATE SET TARGET.CustomerOrderId   = SOURCE.CustomerOrderId,
                             TARGET.ProductId         = SOURCE.ProductId,
                             TARGET.Quantity          = SOURCE.Quantity,
                             TARGET.OrderItemStatusId = SOURCE.OrderItemStatusId,
                             TARGET.DateTimeAdded     = SOURCE.DateTimeAdded
WHEN NOT MATCHED THEN INSERT (CustomerOrderItemId,
                              CustomerOrderId,
                              ProductId,
                              Quantity,
                              OrderItemStatusId,
                              DateTimeAdded)
                      VALUES (SOURCE.CustomerOrderItemId,
                              SOURCE.CustomerOrderId,
                              SOURCE.ProductId,
                              SOURCE.Quantity,
                              SOURCE.OrderItemStatusId,
                              SOURCE.DateTimeAdded);

SET IDENTITY_INSERT dbo.CustomerOrderItem OFF
GO