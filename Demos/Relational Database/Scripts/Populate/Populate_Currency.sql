MERGE dbo.Currency AS TARGET
USING (VALUES ('USD', '840', 1, 'United States dollar'),
              ('EUR', '978', 1, 'Euro'),
              ('GBP', '826', 1, 'Pound sterling'),
              ('CAD', '124', 1, 'Canadian dollar'))
AS SOURCE (CurrencyCode, CurrencyNumber, IsActive, CurrencyName)
ON TARGET.CurrencyCode = SOURCE.CurrencyCode
WHEN MATCHED THEN UPDATE SET TARGET.CurrencyNumber = SOURCE.CurrencyNumber,
                             TARGET.CurrencyName   = SOURCE.CurrencyName,
                             TARGET.IsActive       = SOURCE.IsActive
WHEN NOT MATCHED THEN INSERT (CurrencyCode,
                              CurrencyNumber,
                              CurrencyName,
                              IsActive)
                      VALUES (SOURCE.CurrencyCode,
                              SOURCE.CurrencyNumber,
                              SOURCE.CurrencyName,
                              SOURCE.IsActive);