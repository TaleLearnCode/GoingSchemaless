MERGE dbo.CurrencyCountry AS TARGET
USING (VALUES 

              -- United States Dollar (USD)
              (  1, 1, 'USD', 'US'),
              (  2, 1, 'USD', 'AS'),
              (  3, 1, 'USD', 'IO'),
              (  4, 1, 'USD', 'VG'),
              (  5, 1, 'USD', 'BQ'),
              (  6, 1, 'USD', 'EC'),
              (  7, 1, 'USD', 'SV'),
              (  8, 1, 'USD', 'GU'),
              (  9, 1, 'USD', 'MH'),
              ( 10, 1, 'USD', 'FM'),
              ( 11, 1, 'USD', 'MP'),
              ( 12, 1, 'USD', 'PW'),
              ( 13, 1, 'USD', 'PA'),
              ( 14, 1, 'USD', 'PR'),
              ( 15, 1, 'USD', 'TL'),
              ( 16, 1, 'USD', 'TC'),
              ( 17, 1, 'USD', 'VI'),
              ( 18, 1, 'USD', 'UM'),

              -- Euro (EUR)
              ( 19, 1, 'EUR', 'AX'),
              ( 20, 1, 'EUR', 'AD'),
              ( 21, 1, 'EUR', 'AT'),
              ( 22, 1, 'EUR', 'BE'),
              ( 23, 1, 'EUR', 'HR'),
              ( 24, 1, 'EUR', 'CY'),
              ( 25, 1, 'EUR', 'EE'),
              ( 26, 1, 'EUR', 'FI'),
              ( 27, 1, 'EUR', 'FR'),
              ( 28, 1, 'EUR', 'GF'),
              ( 29, 1, 'EUR', 'TF'),
              ( 30, 1, 'EUR', 'DE'),
              ( 31, 1, 'EUR', 'GR'),
              ( 32, 1, 'EUR', 'GP'),
              ( 33, 1, 'EUR', 'IE'),
              ( 34, 1, 'EUR', 'IT'),
              ( 35, 1, 'EUR', 'XK'),
              ( 36, 1, 'EUR', 'LV'),
              ( 37, 1, 'EUR', 'LT'),
              ( 38, 1, 'EUR', 'LU'),
              ( 39, 1, 'EUR', 'MT'),
              ( 40, 1, 'EUR', 'MQ'),
              ( 41, 1, 'EUR', 'YT'),
              ( 42, 1, 'EUR', 'MC'),
              ( 43, 1, 'EUR', 'ME'),
              ( 44, 1, 'EUR', 'NL'),
              ( 45, 1, 'EUR', 'PT'),
              ( 46, 1, 'EUR', 'RE'),
              ( 47, 1, 'EUR', 'BL'),
              ( 48, 1, 'EUR', 'MF'),
              ( 49, 1, 'EUR', 'PM'),
              ( 50, 1, 'EUR', 'SM'),
              ( 51, 1, 'EUR', 'SK'),
              ( 52, 1, 'EUR', 'SI'),
              ( 53, 1, 'EUR', 'ES'),
              ( 54, 1, 'EUR', 'VA'),

              -- Pound Sterling (GBP)
              ( 55, 1, 'GBP', 'GB'),
              ( 56, 1, 'GBP', 'IM'),
              ( 57, 1, 'GBP', 'JE'),
              ( 58, 1, 'GBP', 'GG'),

              -- Canadian dollar (CAD)
              ( 59, 1, 'CAD', 'CA')
              
              )
AS SOURCE (CurrencyCountryId, IsActive, CurrencyCode, CountryCode)
ON TARGET.CurrencyCountryId = SOURCE.CurrencyCountryId
WHEN MATCHED THEN UPDATE SET TARGET.CurrencyCode = SOURCE.CurrencyCode,
                             TARGET.CountryCode  = SOURCE.CountryCode,
                             TARGET.IsActive     = SOURCE.IsActive
WHEN NOT MATCHED THEN INSERT (CurrencyCountryId,
                              CurrencyCode,
                              CountryCode,
                              IsActive)
                      VALUES (SOURCE.CurrencyCountryId,
                              SOURCE.CurrencyCode,
                              SOURCE.CountryCode,
                              SOURCE.IsActive);