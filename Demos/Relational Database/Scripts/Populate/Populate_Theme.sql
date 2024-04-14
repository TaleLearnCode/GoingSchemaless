SET IDENTITY_INSERT dbo.Theme ON
GO

MERGE dbo.Theme AS TARGET
USING (VALUES (1, 1,  1,  2, 'Architecture'),
              (2, 1,  3,  4, 'BrickHeadz'),
              (3, 1,  5,  6, 'City'),
              (4, 1,  7,  8, 'Creator Expert'),
              (5, 1,  9, 10, 'Ideas'),
              (6, 1, 11, 12, 'LEGO® Icons'),
              (7, 1, 13, 14, 'Speed Champions'),
              (8, 1, 15, 16, 'Star Wars™'))
AS SOURCE (ThemeId, IsActive, LocalizedNameId, DescriptionId, ThemeName)
ON TARGET.ThemeId = SOURCE.ThemeId
WHEN MATCHED THEN UPDATE SET TARGET.ThemeName        = SOURCE.ThemeName,
                             TARGET.LocalizedNameId  = SOURCE.LocalizedNameId,
                             TARGET.DescriptionId    = SOURCE.DescriptionId,
                             TARGET.IsActive         = SOURCE.IsActive
WHEN NOT MATCHED THEN INSERT (ThemeId,
                              ThemeName,
                              LocalizedNameId,
                              DescriptionId,
                              IsActive)
                      VALUES (SOURCE.ThemeId,
                              SOURCE.ThemeName,
                              SOURCE.LocalizedNameId,
                              SOURCE.DescriptionId,
                              SOURCE.IsActive);
GO

SET IDENTITY_INSERT dbo.Theme OFF
GO