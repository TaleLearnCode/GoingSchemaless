MERGE dbo.ProductAvailability AS TARGET
USING (VALUES (1, 1, 1, 'Available Now'),
              (2, 1, 2, 'Backordered'),
              (3, 1, 3, 'Comming Soon'),
              (4, 1, 4, 'Temporary Out of Stock'),
              (5, 1, 5, 'Retired'),
              (6, 1, 0, 'Product Development'))
AS SOURCE (ProductAvailabilityId, IsActive, SortOrder, ProductAvailabilityName)
ON TARGET.ProductAvailabilityId = SOURCE.ProductAvailabilityId
WHEN MATCHED THEN UPDATE SET TARGET.ProductAvailabilityName = SOURCE.ProductAvailabilityName,
                             TARGET.SortOrder               = SOURCE.SortOrder,
                             TARGET.IsActive                = SOURCE.IsActive
WHEN NOT MATCHED THEN INSERT (ProductAvailabilityId,
                              ProductAvailabilityName,
                              SortOrder,
                              IsActive)
                      VALUES (SOURCE.ProductAvailabilityId,
                              SOURCE.ProductAvailabilityName,
                              SOURCE.SortOrder,
                              SOURCE.IsActive);