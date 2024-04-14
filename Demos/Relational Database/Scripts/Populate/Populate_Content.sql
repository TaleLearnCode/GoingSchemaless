SET IDENTITY_INSERT dbo.Content ON
GO

MERGE dbo.Content AS TARGET
USING (VALUES ( 1, 1, 1), -- Theme: 
              ( 2, 2, 1), -- Theme:
              ( 3, 1, 1), -- Theme:
              ( 4, 2, 1), -- Theme:
              ( 5, 1, 1), -- Theme:
              ( 6, 2, 1), -- Theme:
              ( 7, 1, 1), -- Theme:
              ( 8, 2, 1), -- Theme:
              ( 9, 1, 1), -- Theme:
              (10, 2, 1), -- Theme:
              (11, 1, 1), -- Theme:
              (12, 2, 1), -- Theme:
              (13, 1, 1), -- Theme:
              (14, 2, 1), -- Theme:
              (15, 1, 1), -- Theme:
              (16, 2, 1), -- Theme:
              (17, 3, 1), -- Product: Great Pryamid of Giza
              (18, 4, 1), -- Product: Great Pryamid of Giza
              (19, 3, 1), -- Product: Himeji Castle
              (20, 4, 1), -- Product: Himeji Castle
              (21, 3, 1), -- Product: The White House
              (22, 4, 1), -- Product: The White House
              (23, 3, 1), -- Product: EVE & WALL•E
              (24, 4, 1), -- Product: EVE & WALL•E
              (25, 3, 1), -- Product: Pets - French Bulldog
              (26, 4, 1), -- Product: Pets - French Bulldog
              (27, 3, 1), -- Product: Battle of Endor™ Heroes
              (28, 4, 1), -- Product: Battle of Endor™ Heroes
              (29, 3, 1), -- Product: Arctic Explorer Ship
              (30, 4, 1), -- Product: Arctic Explorer Ship
              (31, 3, 1), -- Product: Deep-Sea Explorer Submarine
              (32, 4, 1), -- Product: Deep-Sea Explorer Submarine
              (33, 3, 1), -- Product: Downtown
              (34, 4, 1), -- Product: Downtown
              (35, 3, 1), -- Product: The Friends Apartments
              (36, 4, 1), -- Product: The Friends Apartments
              (37, 3, 1), -- Product: Colosseum
              (38, 4, 1), -- Product: Colosseum
              (39, 3, 1), -- Product: LEGO® Titanic
              (40, 4, 1), -- Product: LEGO® Titanic
              (41, 3, 1), -- Product: Optimus Prime
              (42, 4, 1), -- Product: Optimus Prime
              (43, 3, 1), -- Product: Disney Hocus Pocus: The Sanderson Sisters' Cottage
              (44, 4, 1), -- Product: Disney Hocus Pocus: The Sanderson Sisters' Cottage
              (45, 3, 1), -- Product: Motorized Lighthouse
              (46, 4, 1), -- Product: Motorized Lighthouse
              (47, 3, 1), -- Product: LEGO® Ideas Fender® Stratocaster™
              (48, 4, 1), -- Product: LEGO® Ideas Fender® Stratocaster™
              (49, 3, 1), -- Product: Eiffel tower
              (50, 4, 1), -- Product: Eiffel tower
              (51, 3, 1), -- Product: Dried Flower Centerpiece
              (52, 4, 1), -- Product: Dried Flower Centerpiece
              (53, 3, 1), -- Product: Tranquil Garden,
              (54, 4, 1), -- Product: Tranquil Garden
              (55, 3, 1), -- Product: Galaxy Explorer
              (56, 4, 1), -- Product: Galaxy Explorer
              (57, 3, 1), -- Product: 2 Fast 2 Furious Nissan Skyline GT-R (R34)
              (58, 4, 1), -- Product: 2 Fast 2 Furious Nissan Skyline GT-R (R34)
              (59, 3, 1), -- Product: Ferrari 812 Competizione
              (60, 4, 1), -- Product: Ferrari 812 Competizione
              (61, 3, 1), -- Lamborghini Countach
              (62, 4, 1), -- Lamborghini Countach
              (63, 3, 1), -- AT-AT™
              (64, 4, 1), -- AT-AT™
              (65, 3, 1), -- Millennium Falcon™
              (66, 4, 1), -- Millennium Falcon™
              (67, 3, 1), -- Chewbacca™
              (68, 4, 1)) -- Chewbacca™
AS SOURCE (ContentId, ContentTypeId, IsActive)
ON TARGET.ContentId = SOURCE.ContentId
WHEN MATCHED THEN UPDATE SET TARGET.ContentTypeId = SOURCE.ContentTypeId,
                             TARGET.IsActive      = SOURCE.IsActive
WHEN NOT MATCHED THEN INSERT (ContentId,
                              ContentTypeId,
                              IsActive)
                      VALUES (SOURCE.ContentId,
                              SOURCE.ContentTypeId,
                              SOURCE.IsActive);
GO

SET IDENTITY_INSERT dbo.Content OFF
GO