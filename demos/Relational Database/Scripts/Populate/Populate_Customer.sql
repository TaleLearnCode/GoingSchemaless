SET IDENTITY_INSERT dbo.Customer ON
GO

MERGE dbo.Customer AS TARGET
USING (VALUES ( 1, 'Donnell',    'Kirkpatrick', 'DonnellGKirkpatrick@teleworm.us'),
              ( 2, 'Richard',    'Topete',      'RichardTTopete@teleworm.us'),
              ( 3, 'Steven',     'Whisler',     'StevenPWhisler@dayrep.com'),
              ( 4, 'Angelo',     'Crabb',       'AngeloJCrabb@rhyta.com'),
              ( 5, 'Jenniffer',  'Ligon',       'JennifferMLigon@jourrapide.com'),
              ( 6, 'Barbara',    'Warthen',     'BarbaraRWarthen@jourrapide.com'),
              ( 7, 'Yolanda',    'Harwood',     'YolandaMHarwood@jourrapide.com'),
              ( 8, 'Richard',    'Madden',      'RichardAMadden@armyspy.com'),
              ( 9, 'Irene',      'Pitts',       'IreneGPitts@armyspy.com'),
              (10, 'Greta',      'Brault',      'GretaABrault@armyspy.com'),
              (11, 'Richard',    'Craig',       'RichardKCraig@teleworm.us'),
              (12, 'Rachael',    'Lyons',       'RachaelVLyons@jourrapide.com'),
              (13, 'Zachary',    'Dixon',       'ZacharyDixon@armyspy.com'),
              (14, 'Skye',       'Parsons',     'SkyeParsons@teleworm.us'),
              (15, 'Alfie',      'Barker',      'AlfieBarker@jourrapide.com'),
              (16, 'Robert',     'Trommler',    'RobertTrommler@dayrep.com'),
              (17, 'Kathrin',    'Richter',     'KathrinRichter@armyspy.com'),
              (18, 'Tobias',     'Beike',       'TobiasBeike@jourrapide.com'),
              (19, 'Maximilian', 'Abt',         'MaximilianAbt@teleworm.us'),
              (20, 'Stefanie',   'Wolf',        'StefanieWolf@jourrapide.com'))
AS SOURCE (CustomerId, FirstName, LastName, EmailAddress)
ON TARGET.CustomerId = SOURCE.CustomerId
WHEN MATCHED THEN UPDATE SET TARGET.FirstName    = SOURCE.FirstName,
                             TARGET.LastName     = SOURCE.LastName,
                             TARGET.EmailAddress = SOURCE.EmailAddress
WHEN NOT MATCHED THEN INSERT (CustomerId,
                              FirstName,
                              LastName,
                              EmailAddress)
                      VALUES (SOURCE.CustomerId,
                              SOURCE.FirstName,
                              SOURCE.LastName,
                              SOURCE.EmailAddress);

SET IDENTITY_INSERT dbo.Customer OFF
GO