--[[ structure:
    [uiMapID] = {
        [coord] = {
            label = [string],  -- label: text that'll be the label
            text = [string],  -- some text which might be helpful
            npc = [string],  -- primary npc at the location

                                  -- type of establishment (determines map icon)
            alcohol = [boolean], -- if a bar (serves alcohol)
            cuisine = [string],  -- if a restaurant, what kind of food?
            wares = [string],  -- if sells items, either IC or in game
            official = [boolean], -- if an official building
            alliance = [boolean], -- if part of the alliance war effort
            basement = [boolean], -- if a basement or cellar

                                  -- modifiers
            empty = [boolean], -- if empty (no npcs at all)
            hostile = [boolean], -- if occupied by hostile NPCs
            closed = [boolean], -- if the door is closed / building not enterable
            novendor = [boolean], -- if there's no player-friendly vendor

                                  -- counts (icons)
            beds = [int],     -- number of beds in the building, optional
            tables = [int],     -- number of empty tables, optional
            seats = [int],     -- number of empty seats, optional
            maxseats = [int],     -- size of the largest table
            animals = [int],     -- number of pettable animals
            floors = [int],     -- number of floors
            decks = [int],     -- number of decks on a ship
            ship = [enum],    -- the size of the ship, LARGE, MEDIUM, SMALL, WRECK, BOAT, SAILBOAT, or LANDING

                                  -- extras
            dancing = [boolean], -- is there dancing?
            music = [boolean], -- is there music?

        },
    },
    --]]

-- -------------------------------------------------------------------------------------------------------------------
local myname, ns = ...

local C = ns.CONST;

if not ns.points then ns.points = {} end;

-- -------------------------------------------------------------------------------------------------------------------
ns.points[C.ZONES.BORALUS] = { -- Boralus
-- -------------------------------------------------------------------------------------------------------------------
-- Bars: We define anything that serves alcohol as a "bar"
-- -------------------------------------------------------------------------------------------------------------------
   [69412981] = { npc   = "Rudy the Rat",                            alcohol = true, stall = true, },
   [36267971] = { label = "The Taproot",                             alcohol = true, novendor = true, seats = 7, tables = 2, maxseats = 2, conjecture = true, basement = true, },
   [48104508] = { label = "Stephen's Food Court",                    alcohol = true, cuisine = "various", seats = 7, tables = 2, maxseats = 4, text = "Several places to buy food from the Stevens family", },
   [51604416] = { label = "Hook Point Bar",                          alcohol = true, novendor = true, seats = 22, tables = 3, maxseats = 6, conjecture = true, hostile = true, },
   [52841813] = { label = "Hops, Line, & Sinker Brewing (indoors)",  alcohol = true, cuisine = "bar food", music = true, true, floors = 2, seats = 13, tables = 3, maxseats = 3, },
   [52855049] = { label = "Barnacled Crab",                          alcohol = true, novendor = true, dancing = true, floors = 2, cuisine = "seafood", seats = 9, beds = 1, tables = 2, maxseats = 2, },
   [53486576] = { label = "The Scurvy Lamb",                         alcohol = true, novendor = true, empty = true, seats = 6, beds = 1, tables = 3, maxseats = 2, },
   [53622077] = { label = "The Ravens Flock Tavern",                 alcohol = true, novendor = true, floors = 4, cuisine = "seafood", seats = 20, beds = 1, tables = 7, maxseats = 4, text = "Door is up the stairs, two tables at street level", },
   [54013443] = { label = "Priscilla's Parlor",                      alcohol = true, novendor = true, empty = true, floors = 2, hostile = true, seats = 12, tables = 3, maxseats = 4, },
   [54224523] = { label = "The Kelp Club",                           alcohol = true, novendor = true, text = "Nightclub (possible strip joint)", hostile = true, seats = 28, floors = 3, tables = 3, maxseats = 2, animals = 2, dancing = true, cuisine = "seafood buffet downstairs", },
   [54987437] = { label = "The Cupola Cafe",                         alcohol = true, text = "There are no empty booths", seats = 15, tables = 1, maxseats = 4, cuisine = "seafood, hipster coffee", },
   [55141710] = { label = "Hops, Line, & Sinker Brewing (outdoors)", alcohol = true, cuisine = "bar food", seats = 6, animals = 1, tables = 2, maxseats = 4, },
   [55794398] = { label = "The Loose Cannon",                        alcohol = true, hostile = true, npc = "Crimper Mirjam", floors = 2, dancing = true, text = "Brawling upstairs", beds = 3, animals = 4, seats = 3, tables = 1, maxseats = 2, cuisine = "seafood", },
   [55852506] = { label = "Salt and Shandy",                         alcohol = true, alliance = true, text = "Alliance War Headquarters", floors = 2, seats = 20, tables = 9, maxseats = 4, cuisine = "PVP feasts", },
   [56436284] = { label = "Fireside Anchors",                        alcohol = true, closed = true, text = "The firepit is around back", },
   [57836904] = { label = "Pinky's Groggery",                        alcohol = true, seats = 13, tables = 5, maxseats = 6, },
   [58406424] = { label = "Fireside Anchors (firepit)",              alcohol = true, seats = 6, novendor = true, },
   [59243779] = { label = "The Drunken Gryphon",                     alcohol = true, novendor = true, beds = 1, floors = 2, hostile = true, seats = 13, tables = 1, maxseats = 6, },
   [61194033] = { label = "Dampwick Tavern",                         alcohol = true, novendor = true, seats = 2, beds = 3, floors = 2, hostile = true, },
   [63111710] = { label = "Scully's Catch of the Day",               alcohol = true, empty = true, novendor = true, text = "Escaped crabs outside", cuisine = "seafood", seats = 13, tables = 3, maxseats = 4, },
   [65394018] = { label = "Anchors Away",                            alcohol = true, floors = 2, npc = "Ron Mahogany, the Anchor Man", animals = 3, seats = 3, desks = 1, tables = 1, maxseats = 2, },
   [66346030] = { label = "The Shark",                               alcohol = true, novendor = true, seats = 2, tables = 1, maxseats = 2, beds = 3, floors = 2, hostile = true, },
   [67114080] = { label = "Brews from the Mist",                     alcohol = true, stall = true, cuisine = "Pandaren drinks", },
   [73416876] = { label = "The Curious Octopus",                     alcohol = true, floors = 2, music = true, dancing = true, cuisine = "bar food", seats = 20, tables = 5, maxseats = 5, text = "Jaela Billman cannot set your hearth, despite appearances", },
   [73501384] = { label = "Snug Harbor Inn",                         alcohol = true, floors = 2, cuisine = "Kul Tiran foods", seats = 9, beds = 3, tables = 2, maxseats = 4, text = "Small library on second floor", animals = 1, },
   [74051786] = { label = "Harborside Spirits",                      alcohol = true, seats = 2, npc = "Allison Weber", },
   [74337268] = { label = "Friends and Anenomes",                    alcohol = true, novendor = true, misc = true, seats = 9, floors = 2, tables = 2, maxseats = 2, text = "Two occupied beds and a parrot upstairs", },
   [75171441] = { label = "Harbor Bar",                              alcohol = true, floors = 2, seats = 10, beds = 2, tables = 1, maxseats = 2, conjecture = true, },
-- -------------------------------------------------------------------------------------------------------------------
-- food (groceries)   
-- -------------------------------------------------------------------------------------------------------------------
   [48724657] = { npc   = "Janice Penia",       wares = "Bakery goods", stall = true, label = "Bread vendor",       },
   [49354873] = { npc   = "Luke Cutler",        wares = "Meats",        stall = true, label = "Meat vendor",        },
   [49374744] = { npc   = "Cynthia Sprout",     wares = "Vegetarian",   stall = true, label = "Vegetable vendor",   },
   [69955698] = { npc   = "Darrah Anderson",    wares = "Fruit",        stall = true, sub   = "Fruit vendor",       },
   [70022394] = { npc   = "Raina Lee",          wares = "Dried meats",  stall = true, sub   = "Jerked Meat & Fish", },
   [75092175] = { npc   = "Akua the Tortollan", wares = "Fish",         stall = true, sub   = "Fish Hawker",        },
   [76552131] = { npc   = "Hauke Hartford",     wares = "Vegetables",   stall = true, label = "Stormsong Produce",  },
-- -------------------------------------------------------------------------------------------------------------------
-- food only (no bar)
-- -------------------------------------------------------------------------------------------------------------------
   [66323340] = { label = "Trader from the Mists",    cuisine = "Food from Pandaria",           npc = "Traveler Nali", stall = true, },
   [70562388] = { npc   = "Tal'ana the Tuskar",       cuisine = "Northrend cuisine",            sub = "Trader from the North", stall = true, },
   [59942232] = { npc   = "Col. Tenders",             cuisine = "Fried chicken, take-out only", animals = 3, stall = true, wares = "Ancona chicken pet", },
   [54715086] = { label = "Bo's Crab Shack",          cuisine = "seafood",                      seats = 18, tables = 6, maxseats = 3, text = "Restaurant", floors = 2, novendor = true, },
   [55576249] = { label = "Goldman's Cafe",           cuisine = "Bakery, desserts",             seats = 13, tables = 3, maxseats = 3, floors = 3, novendor = true, },
   [64563139] = { label = "Quimby's Chowder",         cuisine = "Soup",                         sub = "Soup kitchen", novendor = true, seats = 7, tables = 3, maxseats = 3, text = "Tables are on either side along the road", },
   [65665874] = { label = "Clams & Cockles",          cuisine = "seafood",                      seats = 9, novendor = true, tables = 4, maxseats = 3, },
   [69794025] = { label = "Paw'don Bean Dumplings",   cuisine = "Pandaren dumplings",           seats = 4, tables = 2, maxseats = 2, text = "Up the stairs", stall = true, novendor = true, },
   [70502118] = { label = "Fallhaven Sausages",       cuisine = "Sausages",                     npc = "Charisse Payton", stall = true, seats = 2, tables = 1, maxseats = 2, },
   [70575989] = { label = "That's a Moray",           cuisine = "seafood",                      seats = 5, novendor = true, tables = 2, maxseats = 3, text = "When the moon hits your eye like a big pizza pie", },
   [72051184] = { label = "Tradewinds Food Court",    cuisine = "various",                      seats = 16, animals = 1, tables = 2, maxseats = 4, text = "You have to cook your own food", novendor = true, },
   [75611652] = { label = "Pandaria Cuisine",         cuisine = "Pandaria cuisine",             seats = 6, tables = 3, maxseats = 2, },
-- -------------------------------------------------------------------------------------------------------------------
-- Profession Trainers 
-- -------------------------------------------------------------------------------------------------------------------
   [71000505] = { label = "Tradewinds Gardens",                 trainer = "Herbalism",                npc = "Declan Senal",                      stall = true, atlas = "worldquest-icon-herbalism",      scale = 1.1, landmark = true, },
   [73090895] = { label = "The Ironfist Forge",                 trainer = "Blacksmithing",            npc = "Grix 'Ironfists' Barlow",           stall = true, atlas = "worldquest-icon-blacksmithing",  scale = 1.1, },
   [73350682] = { label = "Inksprocket Inscriptions",           trainer = "Inscription",              npc = "Zooey Inksprocket",                 stall = true, atlas = "worldquest-icon-inscription",    scale = 1.1, },
   [73890602] = { label = "Alan's Freshwater Fishing",          trainer = "Fishing",                  npc = "Alan Goyle",                        stall = true, atlas = "worldquest-icon-fishing",        scale = 1.1, },
   [74220712] = { label = "Whalgrene's Lab",                    trainer = "Alchemy",                  npc = "Eric Whalgrene",                    stall = true, atlas = "worldquest-icon-alchemy",        scale = 1.1, },
   [74231136] = { label = "Fairweather's Fine Enchantments",    trainer = "Enchanting",               npc = "Emily Fairweather",                 stall = true, atlas = "worldquest-icon-enchanting",     scale = 1.1, },
   [75031009] = { label = "Colton's Jewels",                    trainer = "Jewelcrafting",            npc = "Samuel D. Colton III",              stall = true, atlas = "worldquest-icon-jewelcrafting",  scale = 1.1, },
   [75130760] = { label = "Big Mountain Mining Supply Company", trainer = "Mining",                   npc = "Myra Cabot",                        stall = true, atlas = "worldquest-icon-mining",         scale = 1.1, },
   [76471091] = { label = "Tradewinds Tailors",                 trainer = "Tailoring",                npc = "Daniel Brineweaver",                stall = true, atlas = "worldquest-icon-tailoring",      scale = 1.1, },
   [77301423] = { label = "Evenkeel's Engineered Marvels",      trainer = "Engineering",              npc = "Layla Evenkeel",                    stall = true, atlas = "worldquest-icon-engineering",    scale = 1.1, },
   [68970882] = { label = "Hudson Archaeological",              trainer = "Archaeology",              npc = "Jane Hudson",                                     atlas = "worldquest-icon-archaeology",    scale = 1.1, basement = true, floors = 2, tables = 3, seats = 16, maxseats = 6, },
   [75841309] = { label = "Kul Tiran Skins and Leathers",       trainer = "Skinning, Leatherworking", npc = "Camilla Dansky, Cassandra Brennor", stall = true, atlas = "worldquest-icon-leatherworking", scale = 1.1, },
   [71281089] = { label = "Byron & Bros. Boralan B.B.Q.",       trainer = "Cooking",                  npc = "'Cap'n' Byron Mehlsack",            stall = true, atlas = "worldquest-icon-cooking",        scale = 1.1, cuisine = "Boralan barbeque",  },
-- -------------------------------------------------------------------------------------------------------------------
-- Market stalls - What they sell is in the wares field
-- -------------------------------------------------------------------------------------------------------------------
   [56022291] = { label = "Ashvane Trader",                  stall = true, novendor = true, },
   [59962001] = { label = "Ashvane Trader",                  stall = true, novendor = true, },
   [49194980] = { npc   = "Megan Pescar",                    stall = true, wares = "Fishing supplies", },
   [66483814] = { npc   = "Jovani Gartside",                 stall = true, wares = "Fishing supplies", },
   [69893645] = { label = "Strange Artifacts",               stall = true, npc = "Kalo the Tortollan", wares = "strange artifacts", },
   [73726654] = { label = "Conestoga Wagons",                stall = true, wares = "Wagons", novendor = true, },
   [50185021] = { label = "Green's Alchemy and Potions",     stall = 1, scale = 1.1, wares = "Alchemy supplies", atlas = "worldquest-icon-alchemy", },
   [75531830] = { label = "South Seas Merchant",             alcohol = true, wares = "Ropes, some alcohol", npc = "Garrett Elmendorf", stall = true, },
   [69495626] = { label = "General Goods",                   stall = true, wares = "General goods", npc = "Bruce Morales", },
   [73351116] = { label = "Maps, Scrolls, & Mysteries",      wares = "Trade goods", npc = "Henrick Wyther", stall = true, },
   [55394714] = { sub   = "Black Market Liaison",            wares = "Black market goods", hostile = true, npc = "Madam Gosu", stall = true, },
   [65823283] = { label = "Spells & Scrolls",                stall = true, npc = "Scrollmaster Uro", text = "Up the stairs from lower level", wares = "Tortollan scrolls", },
   [66594083] = { label = "Thrift Goods",                    stall = true, wares = "Low-level gray clothing", npc = "Arwin Blakemore", },
   [66934110] = { label = "Amateur Potions",                 stall = true, wares = "Potions", npc = "Alchemist Hart", },
   [66972987] = { npc   = "Enges the vrykul",                stall = true, wares = "Fjarnskaggl", text = "Currently out of fjarnskaggl", },
   [67824131] = { label = "Fiona's Wagon",                   stall = true, wares = "General goods", atlas = "Vehicle-AllianceCart", npc = "Fiona the worgen", },
   [71806348] = { label = "Combs & Morris Packing Supplies", text = "I've seen kids do it", wares = "packing supplies", stall = true, novendor = true, },
   [67984013] = { label = "Arcane Oddities",                 stall = true, wares = "Enchanting supplies", npc = "Magus Delitha", },
   [70701963] = { label = "Cobbler",                         stall = true, npc = "Phil Gresham", text = "Will shine your shoes", seats = 1, },
   [71221747] = { label = "Drustvar Trader",                 stall = true, novendor = true, wares = "Pottery from Drustvar", },
   [72291621] = { npc   = "'Risky' Liz Seminario",           wares = "Tailoring supplies", sub = "Fur Trader", stall = true, },
   [72571790] = { sub   = "General Goods",                   stall = true, wares = "General goods", npc = "Ninette Shoames", },
   [72951578] = { sub   = "Spice Vendor",                    stall = true, wares = "Cooking supplies", npc = "Sara Bartlett", },
   [73541597] = { sub   = "Gadget Vendor",                   stall = true, wares = "Engineering supplies", npc = "Miri Fiddlewizz", },
   [74021628] = { sub   = "Firearm Vendor",                  stall = true, wares = "Firearms", npc = "Patrick Markson", },
   [56674682] = { label = "Shady Dealer",                    hostile = true, npc = "Tricky Nick", wares = "Smuggled brutosaurs", },
   [67254190] = { npc   = "Merchant Woolhands",              stall = true, novendor = true, text = "Grummle trader with an alpaca (not for sale)", atlas = "Vehicle-GrummleConvoy", scale = 1.4, },
-- -------------------------------------------------------------------------------------------------------------------
-- Shops - What they sell is in the wares field
-- -------------------------------------------------------------------------------------------------------------------
   [57746707] = { label = "Barrel & Crate", wares = "Containers", floors = 1, },
   [56096506] = { label = "Tucker's Toys", floors = 2, wares = "Toys", },
   [50504951] = { npc   = "Annie Lacier", stall = true, wares = "Weapons", },
   [46083998] = { label = "Burnie's Smithey",            floors = 1, wares = "Blacksmithing supplies", text = "Anvil, forge", scale = 1.1, atlas = "worldquest-icon-blacksmithing", },
   [54764156] = { label = "Bishops, Rooks, and Prawns",  empty = true, hostile = true, novendor = true, sub = "Magic shop", floors = 2, beds = 1, },
   [57951527] = { label = "Algersons & Sons Lumber Co.", floors = 1, wares = "Lumber", novendor = true, },
   [60981690] = { label = "Poole's Cutting",             floors = 1, novendor = true, wares = "Cuttings", text = "Upstairs", seats = 2, tables = 1, maxseats = 2, },
   [72067108] = { label = "Braddock & Son's Ladder Co.", floors = 1, novendor = true, desks = 2, seats = 2, wares = "Ladders", },
   [74717066] = { label = "Streetside Hawker", novendor = true, text = "He advertises his wares but has none for sale", wares = "Incredible bargains", },
   [64754189] = { label = "Streetside Hawker", novendor = true, text = "He advertises his wares but has none for sale", wares = "Incredible bargains", },
   [56046838] = { label = "Dock 1 Exports", floors = 2, wares = "Overpriced home decor, general goods", beds = 1, seats = 6, tables = 1, maxseats = 4, },
   [57243420] = { label = "McGloin's Fish Hooks", floors = 1, wares = "Fishing supplies", novendor = true, atlas = "worldquest-icon-fishing", scale = 1.1, hostile = true, },
   [50404675] = { label = "Ruff Waters", floors = 2, wares = "Pets and pet supplies", beds = 1, seats = 2, tables = 1, maxseats = 1, atlas = "WildBattlePetCapturable", scale = 1.2, animals = 28, },
   [65086446] = { label = "Baubles, Bobbers, & Beyond", floors = 1, hostile = true, wares = "Fishing supplies", novendor = true, atlas = "worldquest-icon-fishing", scale = 1.1, },
   [70256607] = { label = "Lost at Sea", floors = 2, wares = "Maps", beds = 2, desks = 3, atlas = "ShipMissionIcon-Bonus-Map", scale = 1.4, },
   [75756875] = { label = "Mariner's Row Fish & Tackle", desks = 1, novendor = true, seats = 3, floors = 2, maxseats = 2, wares = "Fishing supplies", text = "Apparently they have a bad case of crabs", tables = 1, },
   [52244747] = { label = "Scribes & Nobles", floors = 2, wares = "Books, inscription supplies", beds = 1, seats = 2, tables = 1, scale = 1.2, atlas = "Class", text = "Famous steamy romance novelist Laurence E. Craft is doing a signing outside", },
-- -------------------------------------------------------------------------------------------------------------------
-- Empty Market Stalls
-- -------------------------------------------------------------------------------------------------------------------
   [55801829] = { label = "Market stall",             stall = true, empty = true, novendor = true, wares = "Honey",            seats = 2, maxseats = 2, tables = 1,  },
   [56114600] = { label = "Market stall",             stall = true, empty = true, novendor = true, wares = "Stolen paintings", hostile = true,                       },
   [56832278] = { label = "Market stall",             stall = true, empty = true, novendor = true, wares = "none",                                                   },
   [65663088] = { label = "Vendor's stall",           stall = true, empty = true, novendor = true, wares = "none",             text = "Behind scrollmaster Uro",     },
   [66623496] = { label = "Fishmonger's stand",       stall = true, empty = true, novendor = true, wares = "Fish",                                                   },
   [68092229] = { label = "Vegetable Stand",          stall = true, empty = true, novendor = true, wares = "Vegetables",                                             },
   [70260831] = { label = "Produce Stand",            stall = true, empty = true, novendor = true, wares = "Produce",                                                },
   [70760878] = { label = "Sausage Stand",            stall = true, empty = true, novendor = true, wares = "Sausages",                                               },
   [72271726] = { label = "Fishmonger's Stand",       stall = true, empty = true, novendor = true, wares = "Fish",                                                   },
   [74932272] = { label = "Barrels of Fish",          stall = true, empty = true, novendor = true, wares = "Fish",                                                   },
   [73781717] = { label = "Barrels of Fish",          stall = true, empty = true, novendor = true, wares = "Fish",                                                   },
   [69291921] = { label = "Farmer's Stand",           stall = true, empty = true, novendor = true, wares = "Corn",                                                   },
   [49877898] = { label = "Unity Square Fruit Stand", stall = true, empty = true, novendor = true, wares = "Fruit",            conjecture = true                     },
-- -------------------------------------------------------------------------------------------------------------------
-- Freestanding Basements/Caves/Cellars
-- -------------------------------------------------------------------------------------------------------------------
   [36687428] = { label = "Hedge Maze Cellar",            basement = true, },
   [61701037] = { label = "Empty Cave",                   basement = true, },
   [37428033] = { label = "Game Cellar",                  basement = true, text = "They're playing D&D while hiding from Taskmaster Emday", },
   [46344635] = { label = "Cold room",                    basement = true, empty = true, text = "Basement ice room (brr!)", },
   [52367807] = { label = "Dori's Cellar",                basement = true, animals = 1, npc = "Dori", },
   [58166087] = { label = "Fireside Anchors wine cellar", basement = true, },
   [61597786] = { label = "Monastery Cellar",             basement = true, hostile = true, },
   [66978038] = { label = "Tidesage Archives",            basement = true, hostile = true, },
   [70168550] = { label = "Monastery Cellar",             basement = true, hostile = true, },
-- -------------------------------------------------------------------------------------------------------------------
-- Monastery Buildings
-- -------------------------------------------------------------------------------------------------------------------
   [72257920] = { label = "Monastery Wharf Shack", monastery = true, hostile = true, empty = true, floors = 2, },
   [63238124] = { label = "Monastery Tower",       monastery = true, hostile = true, floors = 2, basement = true, tables = 3, seats = 16, maxseats = 6, },
   [65307821] = { label = "Open-Air Cathedral",    monastery = true, hostile = true, landmark = true, seats = 32, floors = 1, },
   [71148213] = { label = "Monastery Building",    monastery = true, hostile = true, basement = true, floors = 2, empty = true, maxseats = 6, tables = 2, seats = 11, },
   [72047745] = { label = "Monastery Docks",       monastery = true, hostile = true, },
   [55749106] = { label = "Ominous Altar",         monastery = true, hostile = true, statue = true, text = "Take the underwater tunnel to get here", spoiler = "depths", },
   [61578397] = { label = "Underwater Tunnel",     monastery = true, hostile = true, basement = true, spoiler = "depths", },
   [62087688] = { label = "Brazier",               monastery = true, hostile = true, statue = true, },
   [63957573] = { label = "Fountain",              monastery = true, hostile = true, statue = true, },
   [64048006] = { label = "Altar",                 monastery = true, hostile = true, statue = true, },
   [66168511] = { label = "Tentacled Sculpture",   monastery = true, hostile = true, statue = true, },
   [67887440] = { label = "Tentacled Sculpture",   monastery = true, hostile = true, statue = true, },
   [69508811] = { label = "Brazier",               monastery = true, hostile = true, statue = true, },
   [70258172] = { label = "Brazier",               monastery = true, hostile = true, statue = true, },
   [71828476] = { label = "Brazier",               monastery = true, hostile = true, statue = true, },
-- -------------------------------------------------------------------------------------------------------------------
-- Secret of the Depths spoilers
-- -------------------------------------------------------------------------------------------------------------------
   [61527772] = { label = "A Damp Scroll", monastery = true, hostile = true, spoiler = "depths", text = "In the basement",                        },
   [70328576] = { label = "A Damp Scroll", monastery = true, hostile = true, spoiler = "depths", text = "In the basement",                        },
   [67147982] = { label = "A Damp Scroll", monastery = true, hostile = true, spoiler = "depths", text = "Near candles under the wooden platform", },
   [63078186] = { label = "A Damp Scroll", monastery = true, hostile = true, spoiler = "depths", text = "On the second floor",                    },
   [55979126] = { label = "A Damp Scroll", monastery = true, hostile = true, spoiler = "depths", text = "Inside underwater cave",                 },
-- -------------------------------------------------------------------------------------------------------------------
-- Official Buildings: Administrative Bureaucracy
-- -------------------------------------------------------------------------------------------------------------------
   [68162197] = { npc   = "Taelia",                             official = true, text = "Beside the Scouting Map", },
   [67992191] = { npc   = "Cyrus Crestfall",                    official = true, sub = "Harbormaster",                             },
   [77657262] = { label = "Inspector's tent",                   official = true, stall = true, },
   [67982239] = { label = "Harbormaster's Office",              official = true, floors = 3, },
   [76412009] = { label = "Inspector's Desk",                   official = true, stall = true, },
   [61766082] = { label = "Crosswind Ferry Registrar's Office", official = true, floors = 2, seats = 1, text = "They handle postal service", },
   [69721544] = { label = "Guildmaster's Office",               official = true, floors = 2, seats = 3, maxseats = 2, tables = 1, desks = 1, },
   [71801428] = { label = "Ethereal Embassy",                   official = true, floors = 2, seats = 1, text = "Transmog and void storage", desks = 1, },
   [75551918] = { label = "Tradewinds Counting House",          official = true, scale = 1.25, text = "Bank (in-game)", atlas = "Banker", },
   [76437712] = { label = "Department of Mariner's Vessels",    official = true, floors = 2, seats = 2, text = "They seem to handle the mail, despite being disorganized", desks = 1, },
   [77332469] = { label = "Dockmaster's Office",                official = true, seats = 7, npc = "Kate Banks", maxseats = 2, tables = 1, desks = 1, },
   [40896770] = { label = "Lord Admiral's Rest",                official = true, text = "Graves of Daelin, Derek, and Tandred Proudmoore", statue = true, },
   [32897272] = { label = "Proudmoore Keep Graveyard",          official = true, graveyard = true, },
   [49981852] = { label = "Inspector's Shack",                  official = true, stall = true, seats = 1, empty = true, desks = 1, },
   [67532156] = { label = "Proudmoore Admiralty Emissary",      official = true, npc = "Provisioner Fray", wares = "Gear, mount, recipes, toys", },
-- -------------------------------------------------------------------------------------------------------------------
-- Official Buildings: Government
-- -------------------------------------------------------------------------------------------------------------------
   [49178541] = { label = "The Assemblage of Houses",     official = true, text = "Large amphitheater", landmark = true, },
   [46228576] = { label = "Assemblage Side Hall (South)", official = true, conjecture = true, seats = 3, tables = 1, maxseats = 3, },
   [50728265] = { label = "Assemblage Side Hall (North)", official = true, conjecture = true, seats = 6, tables = 2, maxseats = 4, },
-- -------------------------------------------------------------------------------------------------------------------
-- Official Buildings: Military and Guards
-- -------------------------------------------------------------------------------------------------------------------
   [36903787] = { npc   = "Drill Sergeant Smithson",               official = true, tables = 1, seats = 4, maxseats = 4, },
   [38143815] = { label = "Proudmoore Barracks mess hall",         official = true, tables = 3, seats = 8, maxseats = 2, alcohol = true, basement = true, novendor = true, },
   [39983830] = { label = "Proudmoore Barracks brig",              official = true, tables = 6, seats = 11, maxseats = 2, text = "Horde quest area", beds = 6, floors = 2, },
   [42123773] = { label = "Proudmoore Barracks sleeping quarters", official = true, tables = 2, seats = 8, maxseats = 4, text = "Horde quest area", desks = 1, beds = 9, },
   [44463625] = { label = "Proudmoore Barracks training Yard",     official = true, tables = 3, seats = 4, maxseats = 2, text = "Horde quest area", desks = 1, floors = 2, },
   [61781962] = { label = "Gallows",                               official = true, landmark = true, text = "Two prisoners to be executed", atlas = "DungeonSkull", scale = 1.15, },
   [64532124] = { label = "Security post tent",                    official = true, desks = 1, seats = 1, npc = "Captain Donnel", stall = true, },
   [68053809] = { label = "Stocks",                                official = true, seats = 6, empty = true, text = "They're currently empty", },
   [77507529] = { label = "Boralus guard training grounds",        official = true, text = "Players can't use these training dummies", },
-- -------------------------------------------------------------------------------------------------------------------
-- Alliance Presence: War Supplies Questgivers
-- -------------------------------------------------------------------------------------------------------------------
   [67072794] = { sub = "Tailoring", npc = "Faella", alliance = true, atlas = "worldquest-icon-tailoring", scale = 1.01, text = "War supplies questgiver", },
   [66242763] = { npc = "Paymaster Vauldren", alliance = true, atlas = "Auctioneer", scale = 1.01, text = "War supplies questgiver", },
   [66052848] = { sub = "Blacksmithing & Mining", npc = "Brandal Darkbeard", alliance = true, atlas = "worldquest-icon-blacksmithing", scale = 1.01, text = "War supplies questgiver", },
   [67212917] = { sub = "Leatherworking & Skinning", npc = "Charlane", alliance = true, atlas = "worldquest-icon-leatherworking", scale = 1.01, text = "War supplies questgiver", },
   [67562406] = { sub = "Jewelcrafting", npc = "Larold Kyne", alliance = true, atlas = "worldquest-icon-jewelcrafting", scale = 1.01, text = "War supplies questgiver", },
   [67452376] = { sub = "Inscription", npc = "Liao", alliance = true, atlas = "worldquest-icon-inscription", scale = 1.01, text = "War supplies questgiver", },
   [66672349] = { sub = "Alchemy & Herbalism", npc = "Chelsea Strand", alliance = true, atlas = "worldquest-icon-alchemy", scale = 1.01, text = "War supplies questgiver", },
   [66342508] = { sub = "Enchanting", npc = "Mae Wagglewand", alliance = true, atlas = "worldquest-icon-enchanting", scale = 1.01, text = "War supplies questgiver", },
   [66302545] = { sub = "Engineering", npc = "Norber Togglesprocket", alliance = true, atlas = "worldquest-icon-engineering", scale = 1.01, text = "War supplies questgiver", },
-- -------------------------------------------------------------------------------------------------------------------
-- Alliance Presence: Troops
-- -------------------------------------------------------------------------------------------------------------------
   [67193060] = { label = "Briona's Buccaneers", npc = "Briona the Bloodthirsty", alliance = true, atlas = "worldquest-icon-pvp-ffa", scale = 1.01, text = "'Stabby' Lottie, Varigg, and Gore", },
   [65943084] = { label = "The Wolfpack", alliance = true, atlas = "worldquest-icon-pvp-ffa", scale = 1.01, text = "Fenrae the Cunning, Raul the Tenacious, Gunnolf the Ferocious, and Lyco", },
   [67293470] = { label = "Light's Vengeance", alliance = true, atlas = "worldquest-icon-pvp-ffa", scale = 1.01, text = "Vindicator Baatul, Anchorite Lanna, and Archmage Tamuura", },
   [67293640] = { label = "Razak's Roughriders", alliance = true, npc = "Razak Ironsides", atlas = "worldquest-icon-pvp-ffa", scale = 1.01, text = "Tally and Rally Zapnabber, Dizzy Dina, Medic Bot, and BomBot 9000", },
   [66833897] = { label = "Dark Iron Demolishers", alliance = true, atlas = "worldquest-icon-pvp-ffa", scale = 1.01, text = "Airyn Swiftfeet, Lady Tamakeen, and Blaze; Brother Bruen is wandering around", },
   [66293570] = { label = "Riftrunners", alliance = true, atlas = "worldquest-icon-pvp-ffa", scale = 1.01, text = "Riftblade Kelain, Shadeweaver Zarra, Duskrunner Lorinas, and a Voidling", },
   [69982988] = { label = "Night Elf Sentinel Assembly", alliance = true, atlas = "worldquest-icon-pvp-ffa", scale = 1.01, text = "They all have the 'Night Warrior' appearance", },
   [70843002] = { label = "Auric's Angels", alliance = true, atlas = "worldquest-icon-pvp-ffa", scale = 1.01, text = "Squallshaper Auran, Frostfencer Seraphi, and Squallshaper Bryson", },
-- -------------------------------------------------------------------------------------------------------------------
-- Alliance Presence: Quartermasters, Questing, and Queueing
-- -------------------------------------------------------------------------------------------------------------------
   [66342488] = { sub = "Portal Trainer", npc = "Yvera Dawnwing", alliance = true, transport = true, atlas = "WarlockPortalAlliance", scale = 1.2, text = "Warfront portals", },
   [66872579] = { sub = "7th Legion Commendations", alliance = true, npc = "Provisioner Stoutforge", stall = true, wares = "Heirlooms, pets, cosmetic items, toys, mounts", text = "Sells items for 7th Legion Service Medals.", },
   [65862602] = { sub = "Recruitment Officer", tables = 1, npc = "Ralston Karn", atlas = "TaskPOI-IconSelect", scale = 1.1, text = "War Table to queue for Warfronts", alliance = true, },
   [66873325] = { npc = "Flynn Fairwind", stall = true, tables = 1, alliance = true, atlas = "ShipMissionIcon-Treasure-Map", scale = 1.2, text = "Queue for Island Expeditions", },
   [66053231] = { sub = "Dubloons Trader", stall = true, alliance = true, text = "Island expedition rewards", wares = "Hats, quest items, pets, toys", npc = "Captain Klarisa", },
   [68962471] = { sub = "7th Legion Emissary", npc = "Vindicator Jaelanna", alliance = true, text = "7th Legion Faction quartermaster", stall = true, wares = "Gear, pets, toys, tabard, outpost missions, recipes", },
-- -------------------------------------------------------------------------------------------------------------------
-- Alliance Presence: Lore Characters
-- -------------------------------------------------------------------------------------------------------------------
   [68912733] = { npc = "Grand Lector Enaara",      scale = 1.1,  alliance = true, text = "Two decks down",                                 atlas = "ClassOverlay-HolyPower2on",          },
   [68272646] = { npc = "Brann Bronzebeard",        scale = 1.1,  alliance = true, text = "One deck down",                                  atlas = "worldquest-icon-archaeology",        },
   [67932626] = { npc = "Kelsey Steelspark",        scale = 1.01, alliance = true, text = "One deck down, reading Halford's private diary", atlas = "Class",                             },
   [70642741] = { npc = "Alleria Windrunner",       scale = 1.1,  alliance = true, text = "War resources upgrades",                         atlas = "shadoworbs-large-Orb",               },
   [70702708] = { npc = "Master Mathias Shaw",      scale = 1.1,  alliance = true, atlas = "Poisons",                           text = "Follower recruitment", sub  = "Leader of SI:7",                                 },
   [70482726] = { npc = "Falstad Wildhammer",       scale = 1.01, alliance = true, atlas = "FlightMaster",                      text = "Watches over the Mission Command Table", sub  = "High Thane",                                     },
   [69302702] = { npc = "Halford Wyrmbane",         scale = 1.1,  alliance = true, sub  = "7th Legion High Commander",                      atlas = "poi-alliance",                      text = "Watches over the Zandalar Campaign table", },
   [68182636] = { npc = "Magister Umbric",          scale = 1.1,  alliance = true, text = "Inside the first deck of the ship",              atlas = "shadoworbs-small-Orb",               },
   [70222762] = { npc = "Shandris Feathermoon",     scale = 1.1,  alliance = true, sub  = "General of the Sentinel Army",                   atlas = "DruidEclipse-BaseMoon",             text = "One deck down; with Jai'alator", },
   [70612723] = { npc = "John J. Keeshan",          scale = 1.1,  alliance = true, text = "Two decks down",                                 atlas = "Ammunition",                         },
   [72412753] = { npc = "Aysa Cloudsinger",         scale = 1.1,  alliance = true, sub  = "Master of Tushui",                               atlas = "groupfinder-icon-class-monk",       text = "Meditating on the bow of the Wind's Redemption", },
   [69532668] = { npc = "Grand Admiral Jes-Tereth", scale = 1.1,  alliance = true, sub  = "Captain of the Wind's Redemption",               atlas = "SihpMissionIcon-Training-MapBadge", transport = true, text = "Access to Zuldazar, Vol'dun, and Nazmir", },
   [68032217] = { npc = "Genn Greymane",            scale = 1.01, alliance = true, sub  = "King of Gilneas",                                atlas = "groupfinder-icon-leader",           text = "Inside the Harbormaster's Office", },
-- -------------------------------------------------------------------------------------------------------------------
-- Proudmoore Academy
-- -------------------------------------------------------------------------------------------------------------------
   [21447906] = { label = "Cadet's Pier",                         academy = true, conjecture = true, },
   [37585797] = { label = "Stormsong Courtyard",                  academy = true, landmark = true, conjecture = true, },
   [30186862] = { label = "Erickson Quad",                        academy = true, landmark = true, conjecture = true, },
   [26847465] = { label = "Ramshackle Tower",                     academy = true, tables = 1, seats = 1, },
   [27586806] = { label = "Admirality Office",                    academy = true, closed = true, },
   [34226389] = { label = "The Golden Bell",                      academy = true, statue = true, conjecture = true, },
   [25666254] = { label = "Tidesage Classroom",                   academy = true, seats = 3, conjecture = true, },
   [27926335] = { label = "Enrollment Line",                      academy = true, conjecture = true, },
   [31536393] = { label = "The Grand Map",                        academy = true, landmark = true, atlas = "ShipMissionIcon-Bonus-MapBadge", scale = 1.3, },
   [35306987] = { label = "Entrance to Proudmoore Academy",       academy = true, landmark = true, conjecture = true, },
   [35445616] = { label = "Memorial to Admiral Waylon Stormsong", academy = true, statue = true, },
   [26606235] = { label = "Navigation Classroom",                 academy = true, conjecture = true, npc = "Fleet Navigator Norrison", desks = 1, seats = 4, },
   [27516239] = { label = "Knot-Tying Classroom",                 academy = true, conjecture = true, text = "Bring your Handbook of Knot Tying", },
   [27947514] = { label = "Obstacle Course",                      academy = true, conjecture = true, text = "Follow the torches!", },
   [28156569] = { label = "Harbor Hall",                          academy = true, seats = 4, desks = 4, npc = "Commodore Altham", text = "The main lecture hall at the Academy", },
   [29026048] = { label = "Teaching Square",                      academy = true, seats = 4, conjecture = true, npc = "Instructor Alexander", },
   [31625958] = { label = "Daelin's Hall",                        academy = true, cuisine = "seafood", novendor = true, },
   [31687052] = { label = "Erickson Hall",                        academy = true, tables = 3, basement = true, floors = 2, seats = 16, maxseats = 6, text = "Proudmoore Academy library", conjecture = true, },
   [29818013] = { label = "The Shipwreck",                        academy = true, alcohol = true, seats = 1, novendor = true, stall = true, conjecture = true, },
   [31698311] = { label = "Shipwreck Cave",                       academy = true, alcohol = true, tables = 3, novendor = true, empty = true, seats = 9, maxseats = 4, conjecture = true, basement = true, },
-- -------------------------------------------------------------------------------------------------------------------
-- Animals - on their own, should be pettable but not all are
-- -------------------------------------------------------------------------------------------------------------------
   [63152337] = { npc = "City Pup", animals = 1, },
   [63662722] = { npc = "Barn Cat", animals = 1, text = "Playing with some kids", },
   [64265365] = { npc = "City Pup", animals = 1, text = "Watching some kids fishing", },
   [75750844] = { npc = "Whiskey the dog", animals = 1, text = "He sleeps unders the stairs", },
   [64095395] = { npc = "Playful Water Elementals", text = "Apparently Jaina put them here for the local youths to play with.", },
-- -------------------------------------------------------------------------------------------------------------------
-- Points of Interest: Miscellaneous
-- -------------------------------------------------------------------------------------------------------------------
   [76991631] = { label = "Scrap-O-Matic 1000", stall = true, },
   [67311284] = { label = "Healing Practice Dummies", },
   [46028034] = { npc   = "Boralus Crier", text = "All the news that's fit to yell", },
   [69921149] = { npc   = "Boralus Crier", text = "All the news that's fit to yell", },
   [78011752] = { label = "Abandoned book", text = "Also has an apple and waterskin", },
   [74071435] = { label = "Chronicler Toopa", text = "Weekly questgiver", },
   [70742987] = { label = "Ritual book", scale = 1.2, atlas = "Class", },
   [54364678] = { label = "Outhouses", seats = 2, text = "Connected to the Kelp Club", },
   [66091454] = { label = "Clandestine Table", seats = 2, tables = 1, maxseats = 2, text = "Down on the lowest level", conjecture = true, },
   [64702884] = { label = "Harbor Barber", floors = 2, seats = 10, maxseats = 1, beds = 1, tables = 1, },
   [51585996] = { label = "Tiragarde Trader's Wagon", conjecture = true, text = "It appears he's being cited by the guard", },
   [67492370] = { label = "Little Library", stall = true, conjecture = true, atlas = "Class", scale = 1.2, },
   [33568042] = { npc   = "Kuko Cai", sub = "Artist", animals = 2, text = "She has a number of paintings here", seats = 1, tables = 1, maxseats = 1, },
   [51075049] = { label = "Lemptheby's Auction House", stall = true, text = "Auction house (not an in-game AH)", atlas = "Auctioneer", scale = 1.15, },
   [70351790] = { label = "Sanctum of the Sages", desks = 2, seats = 2, transport = true, atlas = "MagePortalAlliance", scale = 1.2, npc = "Yvia Wavebound", text = "Portals to Stormwind, Ironforge, Exodar, Silithus", trainer = "Portals", },
   [66003770] = { npc   = "Joseph Furlong", text = "He's had a little too much to drink", },
-- -------------------------------------------------------------------------------------------------------------------
-- Flightmasters
-- -------------------------------------------------------------------------------------------------------------------
   [47856532] = { sub   = "Gryphon Master", npc = "Jessica Clarke", atlas = "FlightMaster", scale = 1.2, transport = true, flightmaster = true, },
   [67131496] = { sub   = "Gryphon Master", npc = "Joan Weber",     atlas = "FlightMaster", scale = 1.2, transport = true, flightmaster = true, },
   [76677255] = { sub   = "Gryphon Master", npc = "Nicolas Araujo", atlas = "FlightMaster", scale = 1.2, transport = true, flightmaster = true, },
-- -------------------------------------------------------------------------------------------------------------------
-- Summoning Stones
-- -------------------------------------------------------------------------------------------------------------------
   [70913616] = { label = "Meeting Stone", transport = true, text = "Battle of Dazar'alor summoning stone", atlas = "Reagents", scale = 1.1, },
-- -------------------------------------------------------------------------------------------------------------------
-- Stables - both real and fake
-- -------------------------------------------------------------------------------------------------------------------
   [69731299] = { label = "Stables", npc  = "Leila Stafford, stablemaster",                atlas = "Stablemaster", scale = 1.2, },
   [47147087] = { label = "Stables", text = "No actual stablemaster, nor mounts for sale", atlas = "Stablemaster", scale = 1.2, },
   [64412579] = { label = "Stables", text = "No actual stablemaster, nor mounts for sale", atlas = "Stablemaster", scale = 1.2, },
   [79017301] = { label = "Stables", text = "No actual stablemaster, nor mounts for sale", atlas = "Stablemaster", scale = 1.2, },
-- -------------------------------------------------------------------------------------------------------------------
-- Ships - the ship field is LARGE, MEDIUM, or SMALL
-- -------------------------------------------------------------------------------------------------------------------
   [61466255] = { label = "Docked privateer ship",   ship = "SMALL",  decks = 3, closed = true, },
   [55632928] = { label = "Ashvane ship",            ship = "MEDIUM", decks = 4, closed = true, },
   [53812139] = { label = "Ashvane ship",            ship = "SMALL",  decks = 3, closed = true, text = "Access from the Ravens Flock deck", },
   [20445718] = { label = "Anchored Academy ship",   ship = "LARGE",  decks = 4, floors = 2, empty = true, academy = true, beds = 8, novendor = true, seats = 11, tables = 3, alcohol = true, maxseats = 3, },
   [46173383] = { label = "Docked privateer ship",   ship = "LARGE",  decks = 4, floors = 2, alcohol = true, tables = 3, maxseats = 3, seats = 11, beds = 8, novendor = true, },
   [75068074] = { label = "Anchored privateer ship", ship = "LARGE",  decks = 4, floors = 2, alcohol = true, tables = 3, maxseats = 3, seats = 11, beds = 8, novendor = true, },
   [69803302] = { label = "Empty ship",              ship = "LARGE",  decks = 4, floors = 2, text = "Lacks furniture entirely", empty = true, },
   [70632676] = { label = "Wind's Redemption",       ship = "LARGE",  decks = 2, alliance = true, text = "Alliance warship", beds = 3, floors = 3, desks = 1, seats = 1, atlas = "Ships_GalleonA-Map", scale = 2, },
-- -------------------------------------------------------------------------------------------------------------------
-- Cannons
-- -------------------------------------------------------------------------------------------------------------------
   -- [73304985] = { label = "Cannon", empty = true, official = true, artillery = true, },
   -- [75415492] = { label = "Cannon embankment", official = true, closed = true, artillery = "4 cannons", },
   -- [77835958] = { label = "Cannon embankment", official = true, closed = true, artillery = "4 cannons", },
-- -------------------------------------------------------------------------------------------------------------------
-- Shipwrecks
-- -------------------------------------------------------------------------------------------------------------------
   [82633195] = { label = "Sunken Ship", ship = "WRECK", },
   [88633776] = { label = "Sunken Ship", ship = "WRECK", },
   [80115066] = { label = "Sunken Ship", ship = "WRECK", },
   [92055187] = { label = "Sunken Ship", ship = "WRECK", text = "Mast is visible above the waterline", },
-- -------------------------------------------------------------------------------------------------------------------
-- Sailboats
-- -------------------------------------------------------------------------------------------------------------------
   [64356946] = { label = "Monastery Sailboat", ship = "SAILBOAT", empty = true, hostile = true, },
   [72657745] = { label = "Monastery Sailboat", ship = "SAILBOAT", empty = true, hostile = true, },
   [58681220] = { label = "Trader's sailboat", ship = "SAILBOAT", conjecture = true, },
   [29588511] = { label = "Captain's Sailboat", ship = "SAILBOAT", empty = true, conjecture = true, },
   [58587235] = { label = "Leaky Sailboat", ship = "SAILBOAT", empty = true, text = "At water level", conjecture = true, },
   [54253253] = { label = "Sailboat", ship = "SAILBOAT", empty = true, hostile = true, text = "At water level", },
-- -------------------------------------------------------------------------------------------------------------------
-- Boats - rowboats, dinghys, barges, etc
-- -------------------------------------------------------------------------------------------------------------------
   [76147677] = { label = "Crab trap boat",          ship = "BOAT", },
   [56871352] = { label = "Lumber Barge",            ship = "BOAT", },
   [57574138] = { label = "Cargo Boat",              ship = "BOAT", empty      = true, },
   [49721741] = { label = "Inspector's Dinghy",      ship = "BOAT", empty      = true, conjecture = true, },
   [40812546] = { label = "Hatherford Wharf Dinghy", ship = "BOAT", empty      = true, text = "Under the bridge", },
   [72542009] = { label = "Cargo Barge",             ship = "BOAT", empty      = true, text = "Down at water level", },
   [67311779] = { label = "Tied Dinghy",             ship = "BOAT", empty      = true, text = "Down at water level", },
   [74912424] = { label = "Cargo Barge",             ship = "BOAT", empty      = true, text = "Down at water level", },
   [53603318] = { label = "Dinghy",                  ship = "BOAT", hostile    = true, text = "At water level, contains crates", },
   [54731546] = { label = "Carmine's Food Barge",    ship = "BOAT", cuisine    = "bar food", text = "Docked at Hops, Line & Sinker", },
   [54894152] = { label = "Dinghy",                  ship = "BOAT", hostile    = true, text = "Contains crates", },
   [55142424] = { label = "Smuggler's Dinghy",       ship = "BOAT", conjecture = true, text = "Contains Stormwind shield, weapons", },
   [55481499] = { label = "Patrick's Food Barge",    ship = "BOAT", cuisine    = "bar food", text = "Docked at Hops, Line & Sinker", },
   [59387096] = { label = "Deckhand's Dinghy",       ship = "BOAT", text       = "Below Pinky's Groggery", },
   [68636583] = { label = "Hoisted Dinghy",          ship = "BOAT", hostile    = true, text = "Out of the water", },
   [71392072] = { label = "Andy's Dinghy",           ship = "BOAT", text       = "Down at water level", },
   [74667706] = { label = "Dinghy",                  ship = "BOAT", text       = "Contains sacks", },
   [75652399] = { label = "Franklin's Dinghy",       ship = "BOAT", text       = "At least he's not driving it", conjecture = true, },
   [76332109] = { label = "Suspended Dinghy",        ship = "BOAT", text       = "Held aloft by cranes, contains fruit", },
   [76627766] = { label = "Crab trap boat",          ship = "BOAT", },
   [79911001] = { label = "Beached rowboat",         ship = "BOAT", empty      = true, },
-- -------------------------------------------------------------------------------------------------------------------
-- Landings for Ships and Barges
-- -------------------------------------------------------------------------------------------------------------------
   [66724657] = { label = "Canal Ferry",    transport = true, ship = "LANDING", text = "Ferry to Mariner's Row, round trip duration 2 min 16 sec", }, 
   [66925136] = { label = "Canal Ferry",    transport = true, ship = "LANDING", text = "Ferry to Dampwick Ward, round trip duration 2 min 16 sec", }, 
   [74172471] = { label = "Ferry Master",   transport = true, ship = "LANDING", text = "Ferries for the rest of Tiragarde Sound and Drustvar", npc = "Will Melbourne", },
   [47465054] = { label = "Rolfe's Barge",  transport = true, ship = "LANDING", text = "Round trip duration 8 min 55 sec", wares = "Fish", npc = "Rolfe Braxton, fishmonger", }, 
   [52963612] = { label = "Rolfe's Barge",  transport = true, ship = "LANDING", text = "Round trip duration 8 min 55 sec", wares = "Fish", hostile = true, npc = "Rolfe Braxton, fishmonger", }, 
   [53835276] = { label = "Rolfe's Barge",  transport = true, ship = "LANDING", text = "Round trip duration 8 min 55 sec", wares = "Fish", npc = "Rolfe Braxton, fishmonger", },
   [77902544] = { label = "The Relentless", transport = true, ship = "LANDING", atlas = "ShipMissionIcon-SiegeA-Map", scale = 1.7, wares = "General goods", decks = 4, floors = 2, beds = 9, maxseats = 4, seats = 13, tables = 4, cuisine = "seafood", text = "Ship to Stormwind, round trip duration 4 min 26 sec", }, 
-- -------------------------------------------------------------------------------------------------------------------
-- World Quest: Tidesage Doomspeakers
-- -------------------------------------------------------------------------------------------------------------------
   [59054336] = { npc = "Tidesage Doomspeaker", atlas = "Vehicle-TempleofKotmogu-CyanBall", scale = 1.25, spoiler = "doom", },
   [63043164] = { npc = "Tidesage Doomspeaker", atlas = "Vehicle-TempleofKotmogu-CyanBall", scale = 1.25, spoiler = "doom", },
   [64263656] = { npc = "Tidesage Doomspeaker", atlas = "Vehicle-TempleofKotmogu-CyanBall", scale = 1.25, spoiler = "doom", },
   [56043871] = { npc = "Tidesage Doomspeaker", atlas = "Vehicle-TempleofKotmogu-CyanBall", scale = 1.25, spoiler = "doom", hostile = true, },
   [58063663] = { npc = "Tidesage Doomspeaker", atlas = "Vehicle-TempleofKotmogu-CyanBall", scale = 1.25, spoiler = "doom", hostile = true, },
   [60043420] = { npc = "Tidesage Doomspeaker", atlas = "Vehicle-TempleofKotmogu-CyanBall", scale = 1.25, spoiler = "doom", hostile = true, },
   [62563898] = { npc = "Tidesage Doomspeaker", atlas = "Vehicle-TempleofKotmogu-CyanBall", scale = 1.25, spoiler = "doom", hostile = true, },
-- -------------------------------------------------------------------------------------------------------------------
-- Monuments - statue = true
-- -------------------------------------------------------------------------------------------------------------------
   [34487413] = { label = "Park Fountain",                            statue = true, },
   [73101737] = { label = "Harbor Fountain",                          statue = true, },
   [51797732] = { label = "Memorial Fountain",                        statue = true, conjecture = true, },
   [48105957] = { label = "Candlelight Memorial",                     statue = true, conjecture = true, },
   [38907781] = { label = "Hedge Maze Fountain",                      statue = true, text = "You found it! Now can you find your way out?", spoiler = "picture", },
   [36387214] = { label = "'The Ambassador'",                         statue = true, text = "Statue of a large cannon", },
   [48126829] = { label = "Two Lanterns Fountain",                    statue = true, conjecture = true, },
   [44737112] = { label = "Ship's Bell Statue",                       statue = true, conjecture = true, text = "Possibly from The Liberty", },
   [45557357] = { label = "Captain James Ashvane Memorial Fountain",  statue = true, official = true, },
   [47877846] = { label = "Statue of Lord Admiral Daelin Proudmoore", statue = true, official = true, },
-- -------------------------------------------------------------------------------------------------------------------
-- Bridges, Roads
-- -------------------------------------------------------------------------------------------------------------------
   [39964542] = { label = "Bridge to Proudmoore Keep",     landmark = true, bridge = true, },
   [40025718] = { label = "Bridge to Proudmoore Barracks", landmark = true, bridge = true, },
   [43743267] = { label = "Bridge to Hatherford",          landmark = true, bridge = true, },
   [56935112] = { label = "Bridge to Upton Borough",       landmark = true, bridge = true, },
   [57995696] = { label = "Bridge to Hook Point",          landmark = true, bridge = true, },
   [61341209] = { label = "Broken bridge",                 landmark = true, bridge = true, },
   [80448343] = { label = "Road to Bridgeport",            landmark = true, road = true, },
   [48851959] = { label = "Road to Hatherford",            landmark = true, road = true, },
   [66824380] = { label = "Side Corridor",                 text = "Access to Boralus Harbor", atlas = "VignetteEventElite", scale = 1.15, },
   [81377480] = { label = "Side Path",                     text = "Access to the top of the wall", atlas = "VignetteEventElite", scale = 1.15, },
   [73190081] = { label = "Path to spooky graveyard",      atlas = "VignetteEventElite", scale = 1.15, },
-- -------------------------------------------------------------------------------------------------------------------
-- Landmarks - many for Picturesque Boralus
-- -------------------------------------------------------------------------------------------------------------------
   [47746260] = { label = "Admiral's Elite Guard",               landmark = true, official = true, spoiler = "picture", },
   [52146446] = { label = "Upper Square Fountain",               landmark = true, statue = true, spoiler = "picture", },
   [45086261] = { label = "Proudmoore Keep Outer Courtyard",     landmark = true, official = true, },
   [49027458] = { label = "Unity Square",                        landmark = true, },
   [59942644] = { label = "Ashvane Company Yards",               landmark = true, },
   [74850286] = { label = "Tradewinds Waterfall",                landmark = true, },
   [48416280] = { label = "Proudmoore Keep Steps",               landmark = true, spoiler = "picture", },
   [42776258] = { label = "Proudmoore Keep Front Doors",         landmark = true, spoiler = "picture", closed = true, official = true, },
   [68426239] = { label = "Crosswind Commons",                   landmark = true, hostile = true, text = "Often hostile smugglers, birds, etc", },
   [72401545] = { label = "Entrance to Siege of Boralus",        landmark = true, text = "It's unclear what this is, in character", },
   [48447607] = { label = "Embassy Plaza",                       landmark = true, official = true, spoiler = "picture", },
   [50626393] = { label = "Great view of Upper Square Fountain", landmark = true, spoiler = "picture", },
-- -------------------------------------------------------------------------------------------------------------------
-- Gardens - parks, gardens
-- -------------------------------------------------------------------------------------------------------------------
   [35107657] = { label = "Cadets' Park",               landmark = true, conjecture = true, },
   [35667562] = { label = "Childrens' Park",            landmark = true,   animals = 1, text = "Birthday party in the park", conjecture = true, },
   [40128374] = { label = "Proudmoore Keep Gardens",    landmark = true, },
   [41837872] = { label = "Entrance to the Hedge Maze", landmark = true, text = "Don't get lost!", },
   [44838736] = { label = "Garden Gazebo",              landmark = true, },
   [52607388] = { label = "Family Park",                landmark = true, conjecture = true, text = "The Clarks are picnicking here with their four kids", },
-- -------------------------------------------------------------------------------------------------------------------
-- Spoilers: list of spoilers
   [48366265] = { label = "Picturesque Boralus",  spoiler = "list", text = "Use /bora spoilers:picture to find photography locations", },
   [42187891] = { label = "Hedge Maze",           spoiler = "list", text = "Use /bora spoilers:maze to navigate the maze", },
   [63573251] = { label = "Tidesage Doomseekers", spoiler = "list", text = "Use /bora spoilers:doom to locate doomseekers", },
   [66057211] = { label = "Secret of the Depths", spoiler = "list", text = "Use /bora spoilers:depths to find the secret of the depths", }, 
   -- [38527813] = { label = "Hedge Maze Exit Spoilers", spoiler = "list", text = "use /bora spoilers:mazeexit to find your way out of the maze", },
-- Spoilers: Hedge Maze directions
-- -------------------------------------------------------------------------------------------------------------------
   [42197890] = { label = "a. Enter Hedge Maze",      spoiler = "maze", scale = 1.2, atlas = "CrossedFlags", text = "You might want to zoom in on your minimap for this.", },
   [41167840] = { label = "b. Turn right",            spoiler = "maze", scale = 1.2, atlas = "NPE_ArrowUp", },
   [40197465] = { label = "c. Turn left",             spoiler = "maze", scale = 1.2, atlas = "NPE_ArrowLeft", },
   [39707613] = { label = "d. Sharp left",            spoiler = "maze", scale = 1.2, atlas = "NPE_ArrowDown", },
   [39967578] = { label = "e. First right",           spoiler = "maze", scale = 1.2, atlas = "NPE_ArrowLeft", },
   [38057475] = { label = "f. Turn left",             spoiler = "maze", scale = 1.2, atlas = "NPE_ArrowLeft", },
   [37337511] = { label = "g. Left at lantern",       spoiler = "maze", scale = 1.2, atlas = "NPE_ArrowDown", },
   [36247695] = { label = "h. Turn left",             spoiler = "maze", scale = 1.2, atlas = "NPE_ArrowDown", },
   [36277808] = { label = "i. Veer left",             spoiler = "maze", scale = 1.2, atlas = "NPE_ArrowRight", },
   [36727880] = { label = "j. Turn left",             spoiler = "maze", scale = 1.2, atlas = "NPE_ArrowRight", },
   [37257694] = { label = "k. Continue straight",     spoiler = "maze", scale = 1.2, atlas = "NPE_ArrowUp", },
   [37967622] = { label = "l. Hairpin right on path", spoiler = "maze", scale = 1.2, atlas = "NPE_ArrowDown", },
   [37777878] = { label = "m. Turn left",             spoiler = "maze", scale = 1.2, atlas = "NPE_ArrowRight", },
   [38517814] = { label = "n. Destination!",          spoiler = "maze", scale = 1.2, atlas = "CrossedFlags", }, -- text = "If you need to get out, try /bora spoilers:mazeexit", },
-- -------------------------------------------------------------------------------------------------------------------
-- Warehouses
-- -------------------------------------------------------------------------------------------------------------------
   [56094387] = { label = "Warehouse",           empty = true, },
   [56522007] = { label = "Ashvane warehouse",   floors = 2, },
   [60602388] = { label = "Ashvane warehouse",   floors = 2, },
   [61833137] = { label = "Warehouse",           empty = true, },
   [57301855] = { label = "Warehouse (on roof)", empty = true, text = "This smaller warehouse is only reachable if you can get up on the roof.", },
-- -------------------------------------------------------------------------------------------------------------------
-- Unidentified Buildings
-- -------------------------------------------------------------------------------------------------------------------
   [48203931] = { label = "Unmarked building",       floors = 2, desks = 1, beds = 1, animals = 1, seats = 1, },
   [52864033] = { label = "Unnamed building",        floors = 2, desks = 1, empty = true, text = "Possibly an office", seats = 3, maxseats = 2, hostile = true, tables = 1, },
   [72647369] = { label = "Unmarked building",       desks = 2, seats = 3, beds = 1, floors = 3, text = "Two men on the top balcony watch the monastery", },
   [60184303] = { label = "Tiny unmarked building",  empty = true, hostile = true, text = "Contains broken furniture, spiral staircase outside", },
   [63383863] = { label = "Unmarked building",       floors = 3, desks = 1, hostile = true, tables = 2, seats = 7, maxseats = 4, },
   [65511507] = { label = "Harbor Hideaway",         beds = 1, seats = 1, text = "Has a small bookshelf too", },
   [44558111] = { label = "Unity Square Library",    tables = 2, seats = 8, floors = 2, maxseats = 6, basement = true, conjecture = true, },
   [46967393] = { label = "Unity Square Building",   seats = 9, beds = 1, basement = true, tables = 1, maxseats = 5, floors = 2, text = "A Proudmoore officer is sitting at a table on the second floor", },
   [52887562] = { label = "Proudmoore Keep Nursery", conjecture = true, landmark = true, },
   [57116545] = { label = "Reading Lounge",          seats = 4, text = "Near Fireside Anchors", conjecture = true, },
-- -------------------------------------------------------------------------------------------------------------------
-- Miscellaneous - NPCs' homes
-- -------------------------------------------------------------------------------------------------------------------
   [54077146] = { label = "Catty Cathy's",          text = "Crazy cat lady", animals = 23, floors = 2, },
   [72786402] = { label = "Julie Auklight's House", text = "Can access the top of the wall from the 3rd floor", animals = 3, conjecture = true, floors = 3, beds = 1, seats = 3, tables = 1, desks = 1, maxseats = 1, },
-- -------------------------------------------------------------------------------------------------------------------
-- Closed Buildings - can't be entered
-- -------------------------------------------------------------------------------------------------------------------
   [49077011] = { label = "The Albatross",             closed = true, 
                  official = true, text = "Proudmoore Keep building with unknown purpose", },
   [54706307] = { label = "Unmarked building",         closed = true, },
   [63763635] = { label = "Unmarked building",         closed = true, },
   [64153951] = { label = "Unmarked building",         closed = true, },
   [64324214] = { label = "Unmarked building",         closed = true, },
   [66426279] = { label = "Unmarked building",         closed = true, },
   [67105734] = { label = "Unmarked building",         closed = true, },
   [67236071] = { label = "Unmarked building",         closed = true, },
   [67996135] = { label = "Unmarked building",         closed = true, },
   [68231092] = { label = "Unmarked building",         closed = true, },
   [68262358] = { label = "Unmarked building",         closed = true, },
   [68361984] = { label = "Unmarked building",         closed = true, },
   [69391697] = { label = "Unmarked building",         closed = true, },
   [70516994] = { label = "Unmarked building",         closed = true, },
   [74277017] = { label = "Unmarked building",         closed = true, },
   [75347654] = { label = "Unmarked building",         closed = true, },
   [75750750] = { label = "Unmarked building",         closed = true, },
   [57424236] = { label = "Unmarked building",         closed = true, hostile = true, },
   [60464378] = { label = "Unmarked building",         closed = true, hostile = true, },
   [61723582] = { label = "Unmarked building",         closed = true, hostile = true, },
   [63344024] = { label = "Unmarked building",         closed = true, hostile = true, },
   [67752670] = { label = "Unmarked building",         closed = true, text = "This building has no doors at all", },
   [65764002] = { label = "Unmarked building",         closed = true, text = "Upstairs", },
   [57953263] = { label = "Ashvane Laundry",           closed = true, hostile = true, },
   [50127391] = { label = "Stern Masts",               closed = true, text = "It's unclear what they do here", },
   [53414887] = { label = "Steamed Hamhocks",          closed = true, wares = "Hamhocks", },
   [58714373] = { label = "The Muddy Rudder",          closed = true, hostile = true, alcohol = true, novendor = true, },
   [62533336] = { label = "Chuck's",                   closed = true, wares = "Cheese", },
   [63173412] = { label = "The Cracked Barrel",        closed = true, wares = "Cheese", },
   [50747271] = { label = "Perfect Storm Brewing",     closed = true, },
   [59473282] = { label = "Unmarked sausage shop",     closed = true, hostile = true, wares = "sausages", },
   [49944166] = { label = "Beared Barrel Brewing Co.", closed = true, alcohol = true, floors = 1, tables = 1, seats = 2, maxseats = 2, text = "Seats are outside", },
-- -------------------------------------------------------------------------------------------------------------------
   [95472228] = { label = "Harbor Guard Outpost", conjecture = true, official = true, artillery = "2 cannons", },
     }; -- /Boralus
-- -------------------------------------------------------------------------------------------------------------------

if not ns.index then ns.index = {} end;
ns.index.BORALUS = ns.utils.points.index(ns.points[C.ZONES.BORALUS]);

