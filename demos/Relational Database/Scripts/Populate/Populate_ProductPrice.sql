SET IDENTITY_INSERT dbo.ProductPrice ON
GO

MERGE dbo.ProductPrice AS TARGET
USING (VALUES 

             -- Great Pryamid of Giza
             (  1, '21058', 'USD', 129.99),
             (  2, '21058', 'CAD', 169.99),
             (  3, '21058', 'GBP', 119.99),
             (  4, '21058', 'EUR', 139.99),
             
             -- Himeji Castle
             (  5, '21060', 'USD', 159.99),
             (  6, '21060', 'CAD', 209.99),
             (  7, '21060', 'GBP', 139.99),
             (  8, '21060', 'EUR', 159.99),
             
             -- The White House
             (  9, '21054', 'USD',  99.99),
             ( 10, '21054', 'CAD', 149.99),
             ( 11, '21054', 'GBP',  89.99),
             ( 12, '21054', 'EUR',  99.99),
             
             -- EVE & WALL•E
             ( 13, '40619', 'USD',   14.99),
             ( 14, '40619', 'CAD',   19.99),
             ( 15, '40619', 'GBP',   13.49),
             ( 16, '40619', 'EUR',   14.99),
             
             -- Pets - French Bulldog
             ( 17, '40544', 'USD',   14.99),
             ( 18, '40544', 'CAD',   19.99),
             ( 19, '40544', 'GBP',   13.49),
             ( 20, '40544', 'EUR',   14.99),
             
             -- Battle of Endor™ Heroes
             ( 21, '40623', 'USD',   39.99),
             ( 22, '40623', 'CAD',   49.99),
             ( 23, '40623', 'GBP',   39.99),
             ( 24, '40623', 'EUR',   39.99),
             
             -- Arctic Explorer Ship
             ( 25, '60368', 'USD',  159.99),
             ( 26, '60368', 'CAD',  209.99),
             ( 27, '60368', 'GBP',  129.99),
             ( 28, '60368', 'EUR',  149.99),

             -- Deep-Sea Explorer Submarine
             ( 29, '60379', 'USD',  109.99),
             ( 30, '60379', 'CAD',  139.99),
             ( 31, '60379', 'GBP',   94.99),
             ( 32, '60379', 'EUR',  104.99),

             -- Downtown
             ( 33, '60380', 'USD',  199.99),
             ( 34, '60380', 'CAD',  259.99),
             ( 35, '60380', 'GBP',  179.99),
             ( 36, '60380', 'EUR',  209.99),

             -- The Friends Apartments
             ( 37, '10292', 'USD',  179.99),
             ( 38, '10292', 'CAD',  229.99),
             ( 39, '10292', 'GBP',  159.99),
             ( 40, '10292', 'EUR',  179.99),

             -- Colosseum
             ( 41, '10276', 'USD',  549.99),
             ( 42, '10276', 'CAD',  649.99),
             ( 43, '10276', 'GBP',  474.99),
             ( 44, '10276', 'EUR',  549.99),

             -- LEGO® Titanic
             ( 45, '10294', 'USD',  679.99),
             ( 46, '10294', 'CAD',  849.99),
             ( 47, '10294', 'GBP',  589.99),
             ( 48, '10294', 'EUR',  679.99),

             -- Optimus Prime
             ( 49, '10302', 'USD',  179.99),
             ( 50, '10302', 'CAD',  239.99),
             ( 51, '10302', 'GBP',  159.99),
             ( 52, '10302', 'EUR',  179.99),

             -- Disney Hocus Pocus: The Sanderson Sisters' Cottage
             ( 53, '21341', 'USD',  229.99),
             ( 54, '21341', 'CAD',  299.99),
             ( 55, '21341', 'GBP',  199.99),
             ( 56, '21341', 'EUR',  229.99),

             -- Motorized Lighthouse
             ( 57, '21335', 'USD',  299.99),
             ( 58, '21335', 'CAD',  379.99),
             ( 59, '21335', 'GBP',  259.99),
             ( 60, '21335', 'EUR',  299.99),

             -- LEGO® Ideas: Fender® Stratocaster™
             ( 61, '21329', 'USD',  119.99),
             ( 62, '21329', 'CAD',  149.99),
             ( 63, '21329', 'GBP',  104.99),
             ( 64, '21329', 'EUR',  119.99),

             -- Eiffel tower
             ( 65, '10307', 'USD',  629.99),
             ( 66, '10307', 'CAD',  799.99),
             ( 67, '10307', 'GBP',  554.99),
             ( 68, '10307', 'EUR',  629.99),

             -- Dried Flower Centerpiece
             ( 69, '10314', 'USD',   49.99),
             ( 70, '10314', 'CAD',   69.99),
             ( 71, '10314', 'GBP',   44.99),
             ( 72, '10314', 'EUR',   49.99),

             -- Tranquil Garden
             ( 73, '10315', 'USD',  109.99),
             ( 74, '10315', 'CAD',  139.99),
             ( 75, '10315', 'GBP',   94.99),
             ( 76, '10315', 'EUR',  104.99),

             -- Galaxy Explorer
             ( 77, '10497', 'USD',   99.99),
             ( 78, '10497', 'CAD',  129.99),
             ( 79, '10497', 'GBP',   89.99),
             ( 80, '10497', 'EUR',   99.99),

             -- 2 Fast 2 Furious Nissan Skyline GT-R (R34)
             ( 81, '76917', 'USD',   24.99),
             ( 82, '76917', 'CAD',   29.99),
             ( 83, '76917', 'GBP',   19.99),
             ( 84, '76917', 'EUR',   24.99),

             -- Ferrari 812 Competizione
             ( 85, '76914', 'USD',   24.99),
             ( 86, '76914', 'CAD',   29.99),
             ( 87, '76914', 'GBP',   19.99),
             ( 88, '76914', 'EUR',   24.99),

             -- Lamborghini Countach
             ( 89, '76908', 'USD',   19.99),
             ( 90, '76908', 'CAD',   29.99),
             ( 91, '76908', 'GBP',   19.99),
             ( 92, '76908', 'EUR',   24.99),

             -- AT-AT™
             ( 93, '75313', 'USD',  849.99),
             ( 94, '75313', 'CAD', 1049.99),
             ( 95, '75313', 'GBP',  734.99),
             ( 96, '75313', 'EUR',  849.99),

             -- Millennium Falcon™
             ( 97, '75192', 'USD',  849.99),
             ( 98, '75192', 'CAD', 1049.99),
             ( 99, '75192', 'GBP',  734.99),
             (100, '75192', 'EUR',  849.99),

             -- Chewbacca™
             (101, '75371', 'USD',  199.99),
             (102, '75371', 'CAD',  259.99),
             (103, '75371', 'GBP',  179.99),
             (104, '75371', 'EUR',  209.99)

             )
AS SOURCE (ProductPriceId, ProductId, CurrencyCode, Price)
ON TARGET.ProductPriceId = SOURCE.ProductPriceId
WHEN MATCHED THEN UPDATE SET TARGET.ProductId    = SOURCE.ProductId,
                             TARGET.CurrencyCode = SOURCE.CurrencyCode,
                             TARGET.Price        = SOURCE.Price
WHEN NOT MATCHED THEN INSERT (ProductPriceId,
                              ProductId,
                              CurrencyCode,
                              Price)
                      VALUES (SOURCE.ProductPriceId,
                              SOURCE.ProductId,
                              SOURCE.CurrencyCode,
                              SOURCE.Price);
GO

SET IDENTITY_INSERT dbo.ProductPrice OFF
GO