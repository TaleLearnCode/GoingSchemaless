SET IDENTITY_INSERT dbo.ProductTheme ON
GO

MERGE dbo.ProductTheme AS TARGET
USING (VALUES (  1, '21058', 1,  1),
              (  2, '21060', 1,  2),
              (  3, '21054', 1,  3),
              (  4, '40619', 2,  1),
              (  5, '40544', 2,  2),
              (  6, '40623', 2, 16),
              (  7, '60368', 3,  1),
              (  8, '60379', 3,  2),
              (  9, '60380', 3,  3),
              ( 10, '10292', 4,  1),
              ( 11, '10276', 4,  2),
              ( 12, '10294', 4,  3),
              ( 13, '10302', 4, 14),
              ( 14, '21341', 5,  1),
              ( 15, '21335', 5,  2),
              ( 16, '21329', 5,  3),
              ( 17, '10307', 6,  1),
              ( 18, '10314', 6,  2),
              ( 19, '10315', 6,  3),
              ( 20, '10497', 6,  4),
              ( 21, '10294', 6,  5),
              ( 22, '10276', 6,  6),
              ( 23, '10302', 6, 11),
              ( 24, '10292', 6, 12),
              ( 25, '76917', 7,  1),
              ( 26, '76914', 7,  2),
              ( 27, '75313', 8,  1),
              ( 28, '75313', 8,  2),
              ( 29, '40623', 8,  3),
              ( 30, '75371', 8,  4))
AS SOURCE (ProductThemeId, ProductId, ThemeId, SortOrder)
ON TARGET.ProductThemeId = SOURCE.ProductThemeId
WHEN MATCHED THEN UPDATE SET TARGET.ProductId = SOURCE.ProductId,
                             TARGET.ThemeId   = SOURCE.ThemeId,
                             TARGET.SortOrder = SOURCE.SortOrder
WHEN NOT MATCHED THEN INSERT (ProductThemeId,
                              ProductId,
                              ThemeId,
                              SortOrder)
                      VALUES (SOURCE.ProductThemeId,
                              SOURCE.ProductId,
                              SOURCE.ThemeId,
                              SOURCE.SortOrder);
GO

SET IDENTITY_INSERT dbo.ProductTheme OFF
GO