MERGE dbo.ContentType AS TARGET
USING (VALUES (1, 1, 'Theme Name'),
              (2, 1, 'Theme Description'),
              (3, 1, 'Product Name'),
              (4, 1, 'Product Description'))
AS SOURCE (ContentTypeId, IsActive, ContentTypeName)
ON TARGET.ContentTypeId = SOURCE.ContentTypeId
WHEN MATCHED THEN UPDATE SET TARGET.ContentTypeName = SOURCE.ContentTypeName,
                             TARGET.IsActive        = SOURCE.IsActive
WHEN NOT MATCHED THEN INSERT (ContentTypeId,
                              ContentTypeName,
                              IsActive)
                      VALUES (SOURCE.ContentTypeId,
                             SOURCE.ContentTypeName,
                             SOURCE.IsActive);