﻿MERGE dbo.[Language] AS TARGET
USING (VALUES ('ab', 1, 'Abkhazian',                                                                        'аҧсуа бызшәа, аҧсшәа'),
              ('aa', 1, 'Afar',                                                                             'Afaraf'),
              ('af', 1, 'Afrikaans',                                                                        'Afrikaans'),
              ('ak', 1, 'Akan',                                                                             'Akan'),
              ('sq', 1, 'Albanian',                                                                         'Shqip'),
              ('am', 1, 'Amharic',                                                                          'አማርኛ'),
              ('ar', 1, 'Arabic',                                                                           'العربية'),
              ('an', 1, 'Aragonese',                                                                        'aragonés'),
              ('hy', 1, 'Armenian',                                                                         'Հայերեն'),
              ('as', 1, 'Assamese',                                                                         'অসমীয়া'),
              ('av', 1, 'Avaric',                                                                           'авар мацӀ, магӀарул мацӀ'),
              ('ae', 1, 'Avestan',                                                                          'avesta'),
              ('ay', 1, 'Aymara',                                                                           'aymar aru'),
              ('az', 1, 'Azerbaijani',                                                                      'azərbaycan dili, تۆرکجه'),
              ('bm', 1, 'Bambara',                                                                          'bamanankan'),
              ('ba', 1, 'Bashkir',                                                                          'башҡорт теле'),
              ('eu', 1, 'Basque',                                                                           'euskara, euskera'),
              ('be', 1, 'Belarusian',                                                                       'беларуская мова'),
              ('bn', 1, 'Bengali',                                                                          'বাংলা'),
              ('bi', 1, 'Bislama',                                                                          'Bislama'),
              ('bs', 1, 'Bosnian',                                                                          'bosanski jezik'),
              ('br', 1, 'Breton',                                                                           'brezhoneg'),
              ('bg', 1, 'Bulgarian',                                                                        'български език'),
              ('my', 1, 'Burmese',                                                                          'ဗမာစာ'),
              ('ca', 1, 'Catalan, Valencian',                                                               'català, valencià'),
              ('ch', 1, 'Chamorro',                                                                         'Chamoru'),
              ('ce', 1, 'Chechen',                                                                          'нохчийн мотт'),
              ('ny', 1, 'Chichewa, Chewa, Nyanja',                                                          'chiCheŵa, chinyanja'),
              ('zh', 1, 'Chinese',                                                                          '中文 (Zhōngwén), 汉语, 漢語'),
              ('cv', 1, 'Chuvash',                                                                          'чӑваш чӗлхи'),
              ('kw', 1, 'Cornish',                                                                          'Kernewek'),
              ('co', 1, 'Corsican',                                                                         'corsu, lingua corsa'),
              ('cr', 1, 'Cree',                                                                             'ᓀᐦᐃᔭᐍᐏᐣ'),
              ('hr', 1, 'Croatian',                                                                         'hrvatski jezik'),
              ('cs', 1, 'Czech',                                                                            'čeština, český jazyk'),
              ('da', 1, 'Danish',                                                                           'dansk'),
              ('dv', 1, 'Divehi, Dhivehi, Maldivian',                                                       'ދިވެހި'),
              ('nl', 1, 'Dutch, Flemish',                                                                   'Nederlands, Vlaams'),
              ('dz', 1, 'Dzongkha',                                                                         'རྫོང་ཁ'),
              ('en', 1, 'English',                                                                          'English'),
              ('eo', 1, 'Esperanto',                                                                        'Esperanto'),
              ('et', 1, 'Estonian',                                                                         'eesti, eesti keel'),
              ('ee', 1, 'Ewe',                                                                              'Eʋegbe'),
              ('fo', 1, 'Faroese',                                                                          'føroyskt'),
              ('fj', 1, 'Fijian',                                                                           'vosa Vakaviti'),
              ('fi', 1, 'Finnish',                                                                          'suomi, suomen kieli'),
              ('fr', 1, 'French',                                                                           'français'),
              ('ff', 1, 'Fulah',                                                                            'Fulfulde, Pulaar, Pular'),
              ('gl', 1, 'Galician',                                                                         'Galego'),
              ('ka', 1, 'Georgian',                                                                         'ქართული'),
              ('de', 1, 'German',                                                                           'Deutsch'),
              ('el', 1, 'Greek',                                                                            'ελληνικά'),
              ('gn', 1, 'Guarani',                                                                          'Avañe''ẽ'),
              ('gu', 1, 'Gujarati',                                                                         'ગુજરાતી'),
              ('ht', 1, 'Haitian, Haitian Creole',                                                          'Kreyòl ayisyen'),
              ('ha', 1, 'Hausa',                                                                            '(Hausa) هَوُسَ'),
              ('he', 1, 'Hebrew',                                                                           'עברית'),
              ('hz', 1, 'Herero',                                                                           'Otjiherero'),
              ('hi', 1, 'Hindi',                                                                            'हिन्दी, हिंदी'),
              ('ho', 1, 'Hiri Motu',                                                                        'Hiri Motu'),
              ('hu', 1, 'Hungarian',                                                                        'magyar'),
              ('ia', 1, 'Interlingua',                                                                      'Interlingua'),
              ('id', 1, 'Indonesian',                                                                       'Bahasa Indonesia'),
              ('ie', 1, 'Interlingue, Occidental',                                                          'Interlingue'),
              ('ga', 1, 'Irish',                                                                            'Gaeilge'),
              ('ig', 1, 'Igbo',                                                                             'Asụsụ Igbo'),
              ('ik', 1, 'Inupiaq',                                                                          'Iñupiaq, Iñupiatun'),
              ('io', 1, 'Ido',                                                                              'Ido'),
              ('is', 1, 'Icelandic',                                                                        'Íslenska'),
              ('it', 1, 'Italian',                                                                          'Italiano'),
              ('iu', 1, 'Inuktitut',                                                                        'ᐃᓄᒃᑎᑐᑦ'),
              ('ja', 1, 'Japanese',                                                                         '日本語 (にほんご)'),
              ('jv', 1, 'Javanese',                                                                         'ꦧꦱꦗꦮ, Basa Jawa'),
              ('kl', 1, 'Kalaallisut, Greenlandic',                                                         'kalaallisut, kalaallit oqaasii'),
              ('kn', 1, 'Kannada',                                                                          'ಕನ್ನಡ'),
              ('kr', 1, 'Kanuri',                                                                           'Kanuri'),
              ('ks', 1, 'Kashmiri',                                                                         'कॉशुर, کٲشُر‎'),
              ('kk', 1, 'Kazakh',                                                                           'қазақ тілі'),
              ('km', 1, 'Central Khmer',                                                                    'ខ្មែរ, ខេមរភាសា, ភាសាខ្មែរ'),
              ('ki', 1, 'Kikuyu, Gikuyu',                                                                   'Gĩkũyũ'),
              ('rw', 1, 'Kinyarwanda',                                                                      'Ikinyarwanda'),
              ('ky', 1, 'Kirghiz, Kyrgyz',                                                                  'Кыргызча, Кыргыз тили'),
              ('kv', 1, 'Komi',                                                                             'коми кыв'),
              ('kg', 1, 'Kongo',                                                                            'Kikongo'),
              ('ko', 1, 'Korean',                                                                           '한국어'),
              ('ku', 1, 'Kurdish',                                                                          'Kurdî, کوردی‎'),
              ('kj', 1, 'Kuanyama, Kwanyama',                                                               'Kuanyama'),
              ('la', 1, 'Latin',                                                                            'latine, lingua latina'),
              ('lb', 1, 'Luxembourgish, Letzeburgesch',                                                     'Lëtzebuergesch'),
              ('lg', 1, 'Ganda',                                                                            'Luganda'),
              ('li', 1, 'Limburgan, Limburger, Limburgish',                                                 'Limburgs'),
              ('ln', 1, 'Lingala',                                                                          'Lingála'),
              ('lo', 1, 'Lao',                                                                              'ພາສາລາວ'),
              ('lt', 1, 'Lithuanian',                                                                       'lietuvių kalba'),
              ('lu', 1, 'Luba-Katanga',                                                                     'Kiluba'),
              ('lv', 1, 'Latvian',                                                                          'latviešu valoda'),
              ('gv', 1, 'Manx',                                                                             'Gaelg, Gailck'),
              ('mk', 1, 'Macedonian',                                                                       'македонски јазик'),
              ('mg', 1, 'Malagasy',                                                                         'fiteny malagasy'),
              ('ms', 1, 'Malay',                                                                            'Bahasa Melayu, بهاس ملايو‎'),
              ('ml', 1, 'Malayalam',                                                                        'മലയാളം'),
              ('mt', 1, 'Maltese',                                                                          'Malti'),
              ('mi', 1, 'Maori',                                                                            'te reo Māori'),
              ('mr', 1, 'Marathi',                                                                          'मराठी'),
              ('mh', 1, 'Marshallese',                                                                      'Kajin M̧ajeļ'),
              ('mn', 1, 'Mongolian',                                                                        'Монгол хэл'),
              ('na', 1, 'Nauru',                                                                            'Dorerin Naoero'),
              ('nv', 1, 'Navajo, Navaho',                                                                   'Diné bizaad'),
              ('nd', 1, 'North Ndebele',                                                                    'isiNdebele'),
              ('ne', 1, 'Nepali',                                                                           'नेपाली'),
              ('ng', 1, 'Ndonga',                                                                           'Owambo'),
              ('nb', 1, 'Norwegian Bokmål',                                                                 'Norsk Bokmål'),
              ('nn', 1, 'Norwegian Nynorsk',                                                                'Norsk Nynorsk'),
              ('no', 1, 'Norwegian',                                                                        'Norsk'),
              ('ii', 1, 'Sichuan Yi, Nuosu',                                                                'ꆈꌠ꒿ Nuosuhxop'),
              ('nr', 1, 'South Ndebele',                                                                    'isiNdebele'),
              ('oc', 1, 'Occitan',                                                                          'occitan, lenga d''òc'),
              ('oj', 1, 'Ojibwa',                                                                           'ᐊᓂᔑᓈᐯᒧᐎᓐ'),
              ('cu', 1, 'Church Slavic, Old Slavonic, Church Slavonic, Old Bulgarian, Old Church Slavonic', 'ѩзыкъ словѣньскъ'),
              ('om', 1, 'Oromo',                                                                            'Afaan Oromoo'),
              ('or', 1, 'Oriya',                                                                            'ଓଡ଼ିଆ'),
              ('os', 1, 'Ossetian, Ossetic',                                                                'ирон ӕвзаг'),
              ('pa', 1, 'Punjabi, Panjabi',                                                                 'ਪੰਜਾਬੀ, پنجابی‎'),
              ('pi', 1, 'Pali',                                                                             'पालि, पाळि'),
              ('fa', 1, 'Persian',                                                                          'فارسی'),
              ('pl', 1, 'Polish',                                                                           'język polski, polszczyzna'),
              ('ps', 1, 'Pashto, Pushto',                                                                   'پښتو'),
              ('pt', 1, 'Portuguese',                                                                       'Português'),
              ('qu', 1, 'Quechua',                                                                          'Runa Simi, Kichwa'),
              ('rm', 1, 'Romansh',                                                                          'Rumantsch Grischun'),
              ('rn', 1, 'Rundi',                                                                            'Ikirundi'),
              ('ro', 1, 'Romanian, Moldavian, Moldovan',                                                    'Română, Moldovenească'),
              ('ru', 1, 'Russian',                                                                          'русский'),
              ('sa', 1, 'Sanskrit',                                                                         'संस्कृतम्, 𑌸𑌂𑌸𑍍𑌕𑍃𑌤𑌮𑍍'),
              ('sc', 1, 'Sardinian',                                                                        'sardu'),
              ('sd', 1, 'Sindhi',                                                                           'सिंधी, سنڌي‎'),
              ('se', 1, 'Northern Sami',                                                                    'Davvisámegiella'),
              ('sm', 1, 'Samoan',                                                                           'gagana fa''a Samoa'),
              ('sg', 1, 'Sango',                                                                            'yângâ tî sängö'),
              ('sr', 1, 'Serbian',                                                                          'српски језик'),
              ('gd', 1, 'Gaelic, Scottish Gaelic',                                                          'Gàidhlig'),
              ('sn', 1, 'Shona',                                                                            'chiShona'),
              ('si', 1, 'Sinhala, Sinhalese',                                                               'සිංහල'),
              ('sk', 1, 'Slovak',                                                                           'Slovenčina, Slovenský jazyk'),
              ('sl', 1, 'Slovenian',                                                                        'Slovenski jezik, Slovenščina'),
              ('so', 1, 'Somali',                                                                           'Soomaaliga, af Soomaali'),
              ('st', 1, 'Southern Sotho',                                                                   'Sesotho'),
              ('es', 1, 'Spanish, Castilian',                                                               'Español'),
              ('su', 1, 'Sundanese',                                                                        'Basa Sunda'),
              ('sw', 1, 'Swahili',                                                                          'Kiswahili'),
              ('ss', 1, 'Swati',                                                                            'SiSwati'),
              ('sv', 1, 'Swedish',                                                                          'Svenska'),
              ('ta', 1, 'Tamil',                                                                            'தமிழ்'),
              ('te', 1, 'Telugu',                                                                           'తెలుగు'),
              ('tg', 1, 'Tajik',                                                                            'тоҷикӣ, toçikī, تاجیکی‎'),
              ('th', 1, 'Thai',                                                                             'ไทย'),
              ('ti', 1, 'Tigrinya',                                                                         'ትግርኛ'),
              ('bo', 1, 'Tibetan',                                                                          'བོད་ཡིག'),
              ('tk', 1, 'Turkmen',                                                                          'Türkmençe, Türkmen dili'),
              ('tl', 1, 'Tagalog',                                                                          'Wikang Tagalog'),
              ('tn', 1, 'Tswana',                                                                           'Setswana'),
              ('to', 1, 'Tonga (Tonga Islands)',                                                            'Faka Tonga'),
              ('tr', 1, 'Turkish',                                                                          'Türkçe'),
              ('ts', 1, 'Tsonga',                                                                           'Xitsonga'),
              ('tt', 1, 'Tatar',                                                                            'татар теле, tatar tele'),
              ('tw', 1, 'Twi',                                                                              'Twi'),
              ('ty', 1, 'Tahitian',                                                                         'Reo Tahiti'),
              ('ug', 1, 'Uighur, Uyghur',                                                                   'ئۇيغۇرچە‎, Uyghurche'),
              ('uk', 1, 'Ukrainian',                                                                        'Українська'),
              ('ur', 1, 'Urdu',                                                                             'اردو'),
              ('uz', 1, 'Uzbek',                                                                            'Oʻzbek, Ўзбек, أۇزبېك‎'),
              ('ve', 1, 'Venda',                                                                            'Tshivenḓa'),
              ('vi', 1, 'Vietnamese',                                                                       'Tiếng Việt'),
              ('vo', 1, 'Volapük',                                                                          'Volapük'),
              ('wa', 1, 'Walloon',                                                                          'Walon'),
              ('cy', 1, 'Welsh',                                                                            'Cymraeg'),
              ('wo', 1, 'Wolof',                                                                            'Wollof'),
              ('fy', 1, 'Western Frisian',                                                                  'Frysk'),
              ('xh', 1, 'Xhosa',                                                                            'isiXhosa'),
              ('yi', 1, 'Yiddish',                                                                          'ייִדיש'),
              ('yo', 1, 'Yoruba',                                                                           'Yorùbá'),
              ('za', 1, 'Zhuang, Chuang',                                                                   'Saɯ cueŋƅ, Saw cuengh'),
              ('zu', 1, 'Zulu',                                                                             'isiZulu'))
AS SOURCE (LanguageCode,
           IsActive,
           LanguageName,
           NativeName)
ON TARGET.LanguageCode =  SOURCE.LanguageCode
WHEN MATCHED THEN UPDATE SET TARGET.LanguageName = SOURCE.LanguageName,
                             TARGET.NativeName   = SOURCE.NativeName,
                             TARGET.IsActive     = SOURCE.IsActive
WHEN NOT MATCHED THEN INSERT (LanguageCode,
                              LanguageName,
                              NativeName,
                              IsActive)
                      VALUES (SOURCE.LanguageCode,
                              SOURCE.LanguageName,
                              SOURCE.NativeName,
                              SOURCE.IsActive)
WHEN NOT MATCHED BY SOURCE THEN DELETE;
GO