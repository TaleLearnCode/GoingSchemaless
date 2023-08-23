SET IDENTITY_INSERT dbo.CustomerAddress ON
GO

MERGE dbo.CustomerAddress AS TARGET
USING (VALUES ( 1,  1, 1, 'Donnell Kirkpatrick', 'US', 'MD', '21222',    '410-288-0254',   '4492 Blue Spruce Lane',    'Dundalk'),
              ( 2,  2, 1, 'Richard Topete',      'US', 'FL', '33830',    '813-865-3459',   '1003 Collins Street',      'Winter Haven'),
              ( 3,  3, 1, 'Steven Whisler',      'US', 'CA', '92801',    '661-917-4118',   '4128 Gateway Avenue',      'Anaheim'),
              ( 4,  4, 1, 'Angelo Crabb',        'US', 'AR', '72212',    '870-456-6963',   '1315 Rosebud Avenue',      'Little Rock'),
              ( 5,  5, 1, 'Jenniffer Ligon',     'US', 'MO', '65616',    '417-334-4807',   '412 Lighthouse Drive',     'Branson'),
              ( 6,  6, 1, 'Barbara Warthen',     'CA', 'ON', 'M3B 2W6',  '416-448-3233',   '2417 Halsey Avenue',       'Toronto'),
              ( 7,  7, 1, 'Yolanda Harwood',     'CA', 'AB', 'T5J 3N2',  '780-232-1464',   '139 Jasper Avenue',        'Edmonton'),
              ( 8,  8, 1, 'Richard Madden',      'CA', 'AB', 'T3E 0K6',  '403-686-3847',   '1782 Silver Springs Blvd', 'Calgary'),
              ( 9,  9, 1, 'Irene Pitts',         'CA', 'ON', 'N7L 4M5',  '519-784-8023',   '3743 Scotchmere Dr',       'Chatham'),
              (10, 10, 1, 'Greta Brault',        'CA', 'NS', 'B0J 1J0',  '902-980-0826',   '3565 King Street',         'Chester'),
              (11, 11, 1, 'Richard Craig',       'GB', NULL, 'LN2 3PQ',  '070-7805-2619',  '86 Davids Lane',           'SUDBROOKE'),
              (12, 12, 1, 'Rachael Lyons',       'GB', NULL, 'IP14 8BY', '078-0122-4313',  '88 Dover Road',            'WESTHORPE'),
              (13, 13, 1, 'Zachary Dixon',       'GB', NULL, 'KT22 0DD', '078-8781-1924',  '90 Park Avenue',           'LEATHERHEAD'),
              (14, 14, 1, 'Skye Parsons',        'GB', NULL, 'PH9 2SZ',  '078-6146-2420',  '62 Spilman Street',        'GRANDTULLY'),
              (15, 15, 1, 'Alfie Barker',        'GB', NULL, 'PH31 8WG', '070-3403-6752',  '33 Hexham Road',           'INVERROY'),
              (16, 16, 1, 'Robert Trommler',     'DE', NULL, '55595',    '06706-68-56-34', 'Guentzelstrasse 93',       'Argenschwang'),
              (17, 17, 1, 'Kathrin Richter',     'DE', NULL, '70173',    '0711-68-44-40',  'Ollenhauer Str. 34',       'Stuttgart Mitte'),
              (18, 18, 1, 'Tobias Beike',        'DE', NULL, '86837',    '08232-24-19-31', 'Paderborner Strasse 40',   'Untermeitingen'),
              (19, 19, 1, 'Maximilian Abt',      'DE', NULL, '45739',    '02368-32-70-23', 'Knesebeckstraße 49',       'Oer-Erkenschwick'),
              (20, 20, 1, 'Stefanie Wolf',       'DE', NULL, '97461',    '06122-63-01-70', 'Mollstrasse 11',           'Hofheim'))
AS SOURCE (CustomerAddressId, CustomerId, IsDefaultAddress, FullName, CountryCode, CountryDivisionCode, PostalCode, PhoneNumber, AddressLine1, City)
ON TARGET.CustomerAddressId = SOURCE.CustomerAddressId
WHEN MATCHED THEN UPDATE SET TARGET.CustomerId          = SOURCE.CustomerId,
                             TARGET.FullName            = SOURCE.FullName,
                             TARGET.PhoneNumber         = SOURCE.PhoneNumber,
                             TARGET.AddressLine1        = SOURCE.AddressLine1,
                             TARGET.City                = SOURCE.City,
                             TARGET.CountryCode         = SOURCE.CountryCode,
                             TARGET.CountryDivisionCode = SOURCE.CountryDivisionCode,
                             TARGET.PostalCode          = SOURCE.PostalCode,
                             TARGET.IsDefaultAddress    = SOURCE.IsDefaultAddress
WHEN NOT MATCHED THEN INSERT (CustomerAddressId,
                              CustomerId,
                              FullName,
                              PhoneNumber,
                              AddressLine1,
                              City,
                              CountryCode,
                              CountryDivisionCode,
                              PostalCode,
                              IsDefaultAddress)
                      VALUES (SOURCE.CustomerAddressId,
                              SOURCE.CustomerId,
                              SOURCE.FullName,
                              SOURCE.PhoneNumber,
                              SOURCE.AddressLine1,
                              SOURCE.City,
                              SOURCE.CountryCode,
                              SOURCE.CountryDivisionCode,
                              SOURCE.PostalCode,
                              SOURCE.IsDefaultAddress);

SET IDENTITY_INSERT dbo.CustomerAddress OFF
GO