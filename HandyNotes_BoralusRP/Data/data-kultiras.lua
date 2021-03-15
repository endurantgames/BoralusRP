--[[ structure:
    [uiMapID] = { 
        [coord] = {
            label = [string],  -- label: text that'll be the label
            text = [string],  -- some text which might be helpful
            npc = [string],  -- primary npc at the location

                                  -- type of establishment (determines map icon)
            alcohol = [boolean]  -- does it sell alcohol?
            cuisine = [string],  -- what kind of cuisine?
            wares = [sring],   -- if sells items, either IC or in game, indicate in wares, not food/alcohol
            poi = [boolean], -- is a point of interest
            official = [boolean], -- if an official building
            basement = [boolean], -- if a basement or cellar
            misc = [boolean], -- if a miscellaneous location
            boat = [boolean],
            sailboat = [boolean],
            landing = [boolean],

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
            animals = [int],     -- number of pettable animals, indicate type in note
            floors = [int],     -- number of floors
            decks = [int],     -- number of decks on a ship
            ship = [enum],    -- the size of the ship, LARGE, MEDIUM, SMALL, WRECK

                                  -- extras
            dancing = [boolean], -- is there dancing?
            music = [boolean], -- is there music?

        },
    },
    --]]

-- -------------------------------------------------------------------------------------------------------------------
local myname, ns = ...

local C = ns.CONST;
local arrow = ns.textures.arrow;

if not ns.points then ns.points = {} end;
-- -------------------------------------------------------------------------------------------------------------------
ns.points[C.ZONES.TIRAGARDE] = { -- Tiragarde
-- -------------------------------------------------------------------------------------------------------------------
-- Shipwrecks
-- -------------------------------------------------------------------------------------------------------------------
   [81333149] = { label = "Shipwreck", ship = "WRECK", }, 
   [84753238] = { label = "Shipwreck", ship = "WRECK", }, 
   [87692320] = { label = "Shipwreck", ship = "WRECK", }, 
   [86811631] = { label = "Shipwreck", ship = "WRECK", }, 
   [81892346] = { label = "Shipwreck", ship = "WRECK", hostile = true, }, 
   [55753615] = { label = "Shipwreck", ship = "WRECK", hostile = true, },
   [53163760] = { label = "Shipwreck", ship = "WRECK", hostile = true, },
   [50543732] = { label = "Shipwreck", ship = "WRECK", hostile = true, },
   [59536475] = { label = "Shipwreck", ship = "WRECK", hostile = true, },
   [61333608] = { label = "Sunken Ship", ship = "WRECK", },
   [59486705] = { label = "Sunken Ship", ship = "WRECK", },
   [85112706] = { label = "Sunken Ship", ship = "WRECK", },
   [86343445] = { label = "Sunken Ship", ship = "WRECK", }, 
   [59444511] = { label = "Sunken Ship", ship = "WRECK", },
   [54263428] = { label = "Ship's Mast", ship = "WRECK", hostile = true, },
-- -------------------------------------------------------------------------------------------------------------------
-- Miscellaneous stuff
-- -------------------------------------------------------------------------------------------------------------------
   [78644375] = { npc = "Sawtooth", hostile = true, sub = "Rare elite shark", text = "Location Approximate", },
   [60983082] = { npc = "Jenny Swiftbrook", stall = true, text = "She sell seashells by the seashore.", },  
   [61093106] = { npc = "Jeorge Swiftbrook", text = "Keeping an eye on Jenny", }, 
   [70932139] = { label = "Scavenger's Shack", conjecture = true, beds = 1, },
   [80181930] = { label = "Mysterious cave", conjecture = true, basement = true, },
   [79962034] = { label = "Path to mysterious cave", conjecture = true, atlas = "VignetteEventElite", scale = 1.15, }, 
   [62792979] = { label = "Thovas Base-Camp", desks = 1, seats = 3, beds = 1, text = "Base camp for the Explorers' League", },
   [60655905] = { label = "The Thirsty Otter", desks = 1, seats = 3, beds = 1, tables = 1, floors = 2, text = "The name sounds like this is a bar, but it's not.", },
   [87522365] = { label = "Harbor Guard Tower", official = true, tables = 1, chairs = 1, artillery = "1 cannon", },
   [69504723] = { label = "Ghost of the Deep's lair", hostile = true, basement = true, }, 
   [70994944] = { npc = "Paratrooper Jacobs", hostile = true, sub = "Infiltration specialist", }, 
   [43293169] = { label = "Anglepoint Bridge", conjecture = true, landmark = true, },
   [43762963] = { label = "Guard outpost", conjecture = true, floors = 3, closed = true, official = true, },
-- -------------------------------------------------------------------------------------------------------------------
-- Greystone ruins
-- -------------------------------------------------------------------------------------------------------------------
   [81773658] = { label = "Path to Greystone Ruins", empty = true, text = "Located below Greystone Keep", },
   [82833636] = { label = "Bridge to Greystone Ruins", empty = true, text = "Note that there is still a torch burning here." },
   [83703588] = { label = "Ruins of Greystone Tower", landmark = true, empty = true, },
   [82003434] = { label = "Sea access to Greystone Ruins", empty = true, },
-- -------------------------------------------------------------------------------------------------------------------
-- Transport
-- -------------------------------------------------------------------------------------------------------------------
   [66922310] = { sub = "Flight Master", npc = "Mariah McKee", atlas = "FlightMaster", scale = 1.2, transport = true, flightmaster = true, },
   [75784859] = { sub = "Flight Master", npc = "Jeb Johnson", atlas = "FlightMaster", scale = 1.2, transport = true, flightmaster = true, },
   [63682995] = { npc = "Denzel Crocker", transport = true, sub = "Ferry Master", ship = "LANDING", beds = 1, }, 
   [54015321] = { npc = "Theresa Norman", transport = true, sub = "Ferry Master", ship = "LANDING", }, 
   [74234433] = { npc = "Rosha Carrol", transport = true, sub = "Ferry Master", ship = "LANDING", }, 
   [66744976] = { npc = "Bindy Bracklesprig", transport = true, sub = "Ferry Master", ship = "LANDING", }, 
-- -------------------------------------------------------------------------------------------------------------------
-- Ships and Boats
-- -------------------------------------------------------------------------------------------------------------------
   [66584974] = { label = "Fizzsprings passenger ferry", conjecture = true, empty = true, },
   [66064923] = { label = "Fizzsprings supply barge", conjecture = true, },
   [55515364] = { label = "Sailboat", ship = "SAILBOAT", empty = true, hostile = true, },
   [74744893] = { label = "Crab trap sailboat", empty = true, ship = "SAILBOAT", }, 
   [69891874] = { label = "Sailboat", ship = "SAILBOAT", empty = true, hostile = true, },
   [53795326] = { label = "Sailboat", ship = "SAILBOAT", empty = true, },
   [74484382] = { label = "Sailboat", ship = "SAILBOAT", empty = true, },
   [74184534] = { label = "Sailboat", ship = "SAILBOAT", empty = true, },
   [58656582] = { label = "Pirate Rowboat", ship = "BOAT", empty = true, hostile = true, },
   [58397050] = { label = "Pirate Rowboat", ship = "BOAT", empty = true, hostile = true, },
   [58726533] = { label = "Vigil Hill Sailboat", ship = "SAILBOAT", empty = true, hostile = true, },
   [72544598] = { label = "Smuggler's Sailboat", ship = "SAILBOAT", empty = true, conjecture = true, },
   [73964967] = { label = "Bridgeport Sentry rowboat", conjecture = true, ship = "BOAT", empty = true, },
   [77204746] = { label = "Ashvane Foundry cargo barge", ship = "BOAT", empty = true, }, 
   [75095108] = { label = "Ashvane chemicals sailboat", ship = "SAILBOAT", },
   [67652548] = { label = "Hatherford Wharf Sailboat", ship = "SAILBOAT", empty = true, },
   [70141921] = { label = "Beached Dinghy", ship = "BOAT", empty = true, hostile = true, },
   [56425415] = { label = "Abandoned dinghy", ship = "BOAT", empty = true, hostile = true, },
   [62982995] = { label = "Explorers' League rowboat", ship = "BOAT", empty = true, text = "Beached", },
   [59683318] = { label = "Delia Hanako's rowboat", ship = "BOAT", hostile = true, },
   [59836823] = { label = "Burning ship", ship = "MEDIUM", closed = true, decks = 3, empty = true, text = "This ship is on fire", },
   [70732146] = { label = "Scavenger's Boat", ship = "BOAT", conjecture = true, },
   [53975303] = { label = "Fletcher's Hollow barge", ship = "BOAT", conjecture = true, }, 
   [58094291] = { label = "Commodore Rook's Flagship", ship = "LARGE", official = true, decks = 5, alcohol = true, novendor = true, cuisine = "Seafood", floors = 5, beds = 18, desks = 4, tables = 10, seats = 21, maxseats = 4, conjecture = true, artillery = "24 side-facing deck cannons, 2 rear-facing deck cannons", },
   [56935126] = { label = "Moored ship", ship = "MEDIUM", decks = 4, floors = 2, tables = 4, seats = 12, maxseats = 3, beds = 9, alcohol = true, novendor = true, cuisine = "Seafood", hostile = true, empty = true, }, 
-- -------------------------------------------------------------------------------------------------------------------
-- Hatherford 
-- -------------------------------------------------------------------------------------------------------------------
   [68592281] = { label = "Hatherford Cemetery", conjecture = true, statue = true, graveyard = true, },
   [68852043] = { label = "Algerson Lumber Office", desks = 1, tables = 1, seats = 2, floors = 2, }, 
   [66452443] = { label = "Tide's Inn", tables = 2, seats = 5, maxseats = 4, beds = 3, cuisine = "Boralus desserts and snacks", floors = 2, },
   [67002460] = { label = "Unmarked building", floors = 2, closed = true, misc = true, }, 
   [66192341] = { label = "Hatherford Stables", stall = true, text = "No in-game stablemaster here", }, 
   [67452470] = { label = "Hatherford Storage Cellar", basement = true, misc = true, },
   [67072508] = { label = "Hatherford Inspector's tent", official = true, desks = 1, seats = 3, tables = 2, text = "Also, two tables outside the tent", }, 
   [66802523] = { npc = "Taylor Liptz", stall = true, sub = "General Goods", wares = "Crafting supplies", }, 
   [66622505] = { npc = "Horatio Mueller", stall = true, sub = "Farrier", wares = "Blacksmithing and engineering supplies", },
   [66132400] = { npc = "Tweekette", text = "Stoned vulpera sleeping it off under the boardwalk", },
   [67402413] = { npc = "Davey Brindle", text = "Workers' rights agitator", },
   [66432295] = { label = "Hatherford Inspector's shack", official = true, },
   [65402587] = { label = "Hatherford Inspector's tent", official = true, desks = 1, },
   [66182293] = { label = "Stormsong Trader's wagon", novendor = true, wares = "Barrels", conjecture = true, }, 
   [66302245] = { label = "Stormsong Trader's wagon", novendor = true, wares = "Crates and barrels", conjecture = true, }, 
   [65362636] = { label = "Anglepoint Dockworker's wagon", conjecture = true, novendor = true, wares = "Fresh fish", }, 
   [65042654] = { label = "Drustvar Trader's wagon", conjecture = true, novendor = true, wares = "Vegetables", }, 
   [65252594] = { label = "Roughneck's tent", beds = 1, conjecture = true, }, 
-- -------------------------------------------------------------------------------------------------------------------
-- Eastpoint 
-- -------------------------------------------------------------------------------------------------------------------
   [74484481] = { label = "Eastpoint Station", floors = 2, beds = 1, tables = 1, seats = 1, maxseats = 1, },
   [74284502] = { label = "Market Stall", stall = true, empty = true, }, 
-- -------------------------------------------------------------------------------------------------------------------
-- Ashvane Foundry
-- -------------------------------------------------------------------------------------------------------------------
   [78994575] = { label = "Ashvane Foundry Guard Post", hostile = true, desks = 1, seats = 1, floors = 1, },
   [77454756] = { label = "Ashvane Foundry docks", }, 
   [79275003] = { label = "Rail Cart", hostile = true, seats = 1, transport = true, atlas = "Vehicle-SilvershardMines-MineCartRed", scale = 1.10, },
   [78104847] = { label = "Rail Cart track terminus", atlas = "XMarksTheSpot", scale = 1.10, },
   [77854911] = { label = "Ashvane Foundry break room", conjecture = true, floors = 1, cuisine = "snack foods", tables = 1, seats = 4, maxseats = 2, },
-- -------------------------------------------------------------------------------------------------------------------
-- Turtle Bar
-- -------------------------------------------------------------------------------------------------------------------
   [53854469] = { label = "The Whale's Belly", alcohol = true, dancing = true, cuisine = "Tortollan drinks", music = true, text = "Tortollan bar, underwater", },
   [53634499] = { npc = "Professor Augustine", stall = true, sub = "Scrolls and Sundry", wares = "Tortollan scrolls", text = "Underwater, at the Whale's Belly", }, 
   [52964292] = { label = "Tunnel to dry cave", basement = true, text = "Underwater, at The Whale's Belly", },
-- -------------------------------------------------------------------------------------------------------------------
-- Old Drust Road border guard outpost
-- -------------------------------------------------------------------------------------------------------------------
   [54145359] = { npc = "Percy Vesser", stall = true, wares = "Fishing Supplies", sub = "Fishing Supplies", },
   [53765424] = { label = "Sergeant Davies' office", conjecture = true, },
   [53795509] = { label = "Fletcher's Hollow refugee tent", conjecture = true, beds = 1, }, 
   [53525494] = { label = "Border Guard's cannon", conjecture = true, artillery = true, }, 
   [54345436] = { label = "Border Guard quartermaster's office", conjecture = true, tables = 2, },
   [52505378] = { label = "Old Drustvar Bridge", conjecture = true, landmark = true, }, 
-- -------------------------------------------------------------------------------------------------------------------
-- Bridgeport
-- -------------------------------------------------------------------------------------------------------------------
   [76104854] = { label = "Unmarked building", floors = 3, closed = true, }, 
   [75574906] = { label = "Work area", stall = true, tables = 1, seats = 3, maxseats = 3, },
   [74904890] = { label = "Dock stall", stall = true, empty = true, },
   [75064975] = { label = "Dockmaster's office", stall = true, npc = "Dockmaster Leighton", official = true, desks = 1, seats = 1, },
   [74745001] = { label = "Ashvane Trading laboratory", stall = true, tables = 2, seats = 1, maxseats = 1, },
   [75365066] = { label = "Ashvane Trading laboratory", floors = 1, tables = 3, seats = 3, maxseats = 1, },
   [75404981] = { npc = "Jen the Fixer", sub = "Repairs", wares = "Mining and engineering supplies", stall = true, },
   [75505016] = { npc = "Byron Burnside", sub = "Trade Goods", wares = "Crafting supplies", stall = true, },
   [75574993] = { label = "Notice board", statue = true, }, 
   [75745041] = { label = "Shelter Storm Inn", desks = 1, seats = 3, npc = "Lidia Plank, Innkeeper", tables = 2, maxseats = 4, cuisine = "sailor grub", floors = 3, text = "The inn has no beds", },
   [75745081] = { npc = "Lionel Rowe", sub = "Stablemaster", atlas = "Stablemaster", scale = 1.2, }, 
   [75995092] = { label = "Bridgeport graveyard", atlas = "poi-graveyard-neutral", scale = 1.0, graveyard = true, },
   [75315229] = { label = "The Low Bridge", landmark = true, conjecture = true, },
   [76265015] = { label = "The High Bridge", landmark = true, conjecture = true, },
   [73504887] = { label = "The High Bridge", landmark = true, conjecture = true, },
   [73374854] = { label = "Two Spans Tavern", alcohol = true, cuisine = "bar grub", seats = 15, maxseats = 5, tables = 5, }, 
-- -------------------------------------------------------------------------------------------------------------------
-- Fizzsprings
-- -------------------------------------------------------------------------------------------------------------------
   [67695221] = { label = "Fizzsprings bridge", landmark = true, conjecture = true, },
   [67365168] = { npc = "Rowan Berthold", atlas = "Stablemaster", scale = 1.2, text = "He is a bit of a horse fanatic", },
   [67285120] = { label = "Fizzsprings Inn", conjecture = true, floors = 3, alcohol = true, cuisine = "seafood", tables = 4, seats = 14, beds = 3, empty = true, maxseats = 6, },
   [66715000] = { label = "Fizzsprings souvenir stand", conjecture = true, stall = true, npc = "Lead Guide Zipwrench", wares = "souvenirs", novendor = true, },
   [66205039] = { label = "Southwind Ferry Dock", floors = 1, official = true, },
   [65855009] = { npc = "Dockmaster Tyndall", official = true, },
   [66515055] = { label = "Fizzsprings tour staging area", conjecture = true, stall = true, seats = 6, maxseats = 3, table = 1, },
-- -------------------------------------------------------------------------------------------------------------------
-- Vigil Hill
-- -------------------------------------------------------------------------------------------------------------------
   [59745963] = { label = "Vigil Hill Bridge", landmark = true, conjecture = true, },
   [58496042] = { label = "Road to Vigil Hill", landmark = true, },
   [58077030] = { label = "Pirate cave", hostile = true, basement = true, },
   [59006918] = { label = "Daelin's Gate", hostile = true, landmark = true, },
-- -------------------------------------------------------------------------------------------------------------------
-- For the Horde!
-- -------------------------------------------------------------------------------------------------------------------
   [53046261] = { label = "Horde Camp", hostile = true, atlas = "poi-horde", scale = 1.20, beds = 4, }, 
-- -------------------------------------------------------------------------------------------------------------------
}; -- /Tiragarde
-- -------------------------------------------------------------------------------------------------------------------

-- -------------------------------------------------------------------------------------------------------------------
ns.points[C.ZONES.STORMSONG] = { -- Stormsong
-- -------------------------------------------------------------------------------------------------------------------
   [91226053] = { label = "Shipwreck", ship = "WRECK", hostile = true, text = "Top of the mast rises above the waterline."   }, 
   [88445903] = { label = "Sunken Ship", ship = "WRECK", hostile = true, }, 
-- -------------------------------------------------------------------------------------------------------------------
   }; -- /Stormsong
-- -------------------------------------------------------------------------------------------------------------------

-- -------------------------------------------------------------------------------------------------------------------
ns.points[C.ZONES.DRUSTVAR] = { -- Drustvar
-- -------------------------------------------------------------------------------------------------------------------
   [71074080] = { sub = "Flight Master", npc = "Aaron Ridgeley", atlas = "FlightMaster", scale = 1.2, transport = true, flightmaster = true, },
   [62612399] = { sub = "Flight Master", npc = "Anna Ridgeley", atlas = "FlightMaster", scale = 1.2, transport = true, flightmaster = true, },
   [70904101] = { npc = "Amos Ridgeley", sub = "General Goods", wares = "crafting supplies", stall = true, },
   [72063926] = { label = "Waycrest Sailboat", ship = "SAILBOAT", empty = true, },
   [72003977] = { label = "Waycrest Guard Outpost", floors = 3, npc = "Guardsman Bray", closed = true, }, 
   [70094286] = { label = "Hangman's Point gallows", npc = "Constable Henry Framer", },
   [69524375] = { npc = "Auntie Amanda Hale", },
   [61693655] = { npc = "Helen Waterview", transport = true, sub = "Ferry Master", ship = "LANDING", }, 
   [63773238] = { label = "Carver's Harbor rowboat", ship = "BOAT", hostile = true, empty = true, },
   [64593147] = { label = "Carver's Harbor rowboat", ship = "BOAT", hostile = true, empty = true, },
   [64943182] = { label = "Carver's Harbor sailboat", ship = "SAILBOAT", hostile = true, empty = true, },
   [62862279] = { label = "Rowboat", ship = "BOAT", empty = true, },
   [62201677] = { label = "Horde Camp", hostile = true, atlas = "poi-horde", scale = 1.20, beds = 4, }, 
   [62471678] = { label = "Murdered fisherman's sailboat", hostile = true, ship = "SAILBOAT", },
-- -------------------------------------------------------------------------------------------------------------------
   }; -- /Drustvar
-- -------------------------------------------------------------------------------------------------------------------

-- -------------------------------------------------------------------------------------------------------------------
ns.points[C.ZONES.TOLDAGOR] = { -- Tol Dagor
-- -------------------------------------------------------------------------------------------------------------------
-- Outside
-- -------------------------------------------------------------------------------------------------------------------
   [51374768] = { label = "Entrance to the Drain", subzone = "", atlas = "poi-door-left", scale = 1.5, },
   [50036270] = { label = "Shipwreck", ship = "WRECK", subzone = "", }, 
   [23234624] = { npc = "Erika Jones", sub = "Horde Flightmaster", atlas = "FlightMaster", scale = arrow.scale, transport = true, flightmaster = true, text = "Not visible to Alliance", subzone = "", },
   [23295021] = { npc = "William Jones", sub = "Repairs", atlas = "worldquest-icon-engineering", scale = 1.1, stall = true, wares = "Engineering and Blacksmithing supplies", tables = 1, beds = 1, text = "Not visible to Alliance", subzone = "", },
   [21514555] = { label = "Horde Rowboat", ship = "BOAT", text = "Contains plague barrels", subzone = "", },
   [22354404] = { label = "Horde Rowboat", ship = "BOAT", empty = true, subzone = "", },
   [24654921] = { label = "Horde Camp", atlas = "poi-horde", scale = 1.20, subzone = "", }, 
   [38967437] = { label = "Meeting Stone", transport = true, text = "Tol Dagor summoning stone", atlas = "Reagents", scale = 1.1, subzone = "", },
   [39166897] = { label = "Tol Dagor Prison", landmark = true, text = "Entrance to the Tol Dagor instance", subzone = "", },
   [38019154] = { npc = "Jorum Hayes", sub = "Alliance Flightmaster", atlas = "FlightMaster", scale = arrow.scale, transport = true, flightmaster = true, text = "Not visible to Horde", subzone = "", },
   [41288881] = { npc = "Officer Rainfield", sub = "Repairs", wares = "Blacksmithing supplies", scale = 1.1, atlas = "worldquest-icon-blacksmithing", text = "Not visible to Horde",subzone = "", },
   [51145780] = { label = "Prison Graveyard", graveyard = true, subzone = "", atlas = "poi-graveyard-neutral", scale = 1.2, },
   [42446129] = { label = "Tol Dagor Lighthouse", landmark = true, subzone = "", atlas = "MovieRecordingIcon", scale = 1.5, },
   [59695945] = { label = "Krolusk Beach", hostile = true, conjecture = true, subzone = "", atlas = "Warfronts-BaseMapIcons-Horde-Barracks-Minimap",  scale = 1.5, },
   [50051824] = { label = "North Beach", hostile = true, conjecture = true, subzone = "", atlas = "Warfronts-BaseMapIcons-Horde-Barracks-Minimap",  scale = 1.5, },
   [72973895] = { label = "Turtle Dunes", conjecture = true, subzone = "", atlas = "Warfronts-FieldMapIcons-Neutral-Banner-Minimap", scale = 1.5, },
   [79622728] = { label = "Crab Beach", conjecture = true, subzone = "", atlas = "Warfronts-FieldMapIcons-Neutral-Banner-Minimap", scale = 1.5, },
   [67682596] = { label = "Barnacled Hill", conjecture = true, subzone = "", atlas = "Warfronts-FieldMapIcons-Empty-Banner-Minimap-small", scale = 1.5, text = "Mostly inaccessible", },
   [30792480] = { label = "Quiet Cove", conjecture = true, subzone = "", atlas = "Warfronts-FieldMapIcons-Neutral-Banner-Minimap", scale = 1.5, },
   [33554009] = { label = "Seacliff", conjecture = true, subzone = "", atlas = "Warfronts-FieldMapIcons-Empty-Banner-Minimap-small", scale = 1.5, text = "Mostly inaccessible", },
   [46482753] = { label = "Seacliff", conjecture = true, subzone = "", atlas = "Warfronts-FieldMapIcons-Empty-Banner-Minimap-small", scale = 1.5, text = "Mostly inaccessible", },
   [59613868] = { label = "Seacliff", conjecture = true, subzone = "", atlas = "Warfronts-FieldMapIcons-Empty-Banner-Minimap-small", scale = 1.5, text = "Mostly inaccessible", },
   [37239818] = { label = "Tol Dagor Cargo Boat", ship = "BOAT", empty = true, text = "Not visible to Horde", subzone = "", },
   [41189812] = { label = "Tol Dagor Escort Boat", ship = "BOAT", empty = true, text = "Not visible to Horde", subzone = "", },
   [42979614] = { label = "Tol Dagor Harpoon Boat", ship = "BOAT", empty = true, text = "Not visible to Horde", subzone = "", }, 
   [40869436] = { npc = "Galeheart", sub = "Proudmoore Gryphon", text = "Not visible to Horde", subzone = "", atlas = "Vehicle-Air-Occupied", scale = 1.5, },
   [39188356] = { label = "Tol Dagor Rowboat", ship = "BOAT", empty = true, text = "Beached", subzone = "", },
-- -------------------------------------------------------------------------------------------------------------------
-- Sewers - "The Drain"
-- -------------------------------------------------------------------------------------------------------------------
   [50484673] = { label = "Exit to the outside world",      subzone = "The Drain", scale = arrow.scale, atlas = arrow.right, },
   [38015374] = { label = "Passageway up to Sodden Depths", subzone = "The Drain", scale = arrow.scale, atlas = arrow.up,    },
   [46994319] = { label = "Passageway up to Sodden Depths", subzone = "The Drain", scale = arrow.scale, atlas = arrow.up,    },
-- -------------------------------------------------------------------------------------------------------------------
-- Basement - "The Sodden Depths"
-- -------------------------------------------------------------------------------------------------------------------
   [41183698] = { label = "Access to the Drain",             subzone = "Sodden Depths", scale = arrow.scale, atlas = arrow.down, },
   [39225110] = { label = "Access to the Drain",             subzone = "Sodden Depths", scale = arrow.scale, atlas = arrow.down, },
   [47014315] = { label = "Passageway upstairs to the Brig", subzone = "Sodden Depths", scale = arrow.scale, atlas = arrow.up,   }, 
-- -------------------------------------------------------------------------------------------------------------------
-- First Floor - "The Brig"
-- -------------------------------------------------------------------------------------------------------------------
   [42235796] = { label = "Front Door", closed = true, subzone = "The Brig", text = "Doesn't open for players", atlas = "worldquest-tracker-lock", scale = 1.2, }, 
   [43163690] = { label = "Passageway downstairs to the Sodden Depths", subzone = "The Brig", scale = arrow.scale, atlas = arrow.down, },
   [36864716] = { label = "Passageway upstairs to Detention Block",     subzone = "The Brig", scale = arrow.scale, atlas = arrow.up,   },
   [41163717] = { label = "Side Room",       subzone = "The Brig", tables = 1, seats = 2, maxseats = 2, empty = true, },
   [41883059] = { label = "Hidden Room",     subzone = "The Brig", atlas = "XMarksTheSpot", scale = 1.2,          },
   [37844518] = { label = "Prison cell", subzone = "The Brig", beds = 0, empty = true,                        },
   [38644381] = { label = "Prison cell", subzone = "The Brig", beds = 1, empty = true, text = "Larger cell with adjoining room, access to hidden room", atlas = "Vehicle-SilvershardMines-MineCartRed", scale = 1.35, },
   [39924087] = { label = "Prison cell", subzone = "The Brig", beds = 1,               text = "One skeleton", },
   [40543938] = { label = "Prison cell", subzone = "The Brig", beds = 2, empty = true,                        },
   [46144520] = { label = "Prison cell", subzone = "The Brig", beds = 1, empty = true,                        },
   [43255083] = { label = "Prison cell", subzone = "The Brig", beds = 1, empty = true,                        },
   [44034950] = { label = "Prison cell", subzone = "The Brig", beds = 2, empty = true,                        },
   [44744803] = { label = "Prison cell", subzone = "The Brig", beds = 2, empty = true,                        },
   -- [37844073] = { label = "Path to hidden room", subzone = "The Brig", atlas = "ComboPoints-ComboPointDash", scale = 1.00, },
   [38464158] = { label = "Path to hidden room", subzone = "The Brig", atlas = "ComboPoints-ComboPoint", scale = 1.00, },
   [37903910] = { label = "Path to hidden room", subzone = "The Brig", atlas = "ComboPoints-ComboPoint", scale = 1.00, },
   [39373593] = { label = "Path to hidden room", subzone = "The Brig", atlas = "ComboPoints-ComboPoint", scale = 1.00, },
   [40753293] = { label = "Path to hidden room", subzone = "The Brig", atlas = "ComboPoints-ComboPoint", scale = 1.00, },
-- -------------------------------------------------------------------------------------------------------------------
-- Second Floor - "Detention Block"
-- -------------------------------------------------------------------------------------------------------------------
   [40835354] = { label = "Passageway downstairs to the Brig",       subzone = "Detention Block", scale = arrow.scale, atlas = arrow.down, },
   [36884716] = { label = "Passageway upstairs to Officer Quarters", subzone = "Detention Block", scale = arrow.scale, atlas = arrow.up,   },
   [39284234] = { label = "Prison cell", subzone = "Detention Block", beds = 1, empty = true,                        },
   [39944087] = { label = "Prison cell", subzone = "Detention Block", beds = 2, empty = true,                        },
   [40673949] = { label = "Prison cell", subzone = "Detention Block", beds = 0,               text = "One skeleton", },
   [46124518] = { label = "Prison cell", subzone = "Detention Block", beds = 1, empty = true,                        },
   [45434663] = { label = "Prison cell", subzone = "Detention Block", beds = 0,               text = "One skeleton", },
   [44714803] = { label = "Prison cell", subzone = "Detention Block", beds = 2, empty = true, text = "Larger cell with adjoining room", },
   [48274162] = { label = "Storeroom",       subzone = "Detention Block", empty = true, text = "Currently on fire", },
   [44013688] = { label = "Fire",            subzone = "Detention Block", atlas = "Relic-Fire-TraitGlow", scale = 1.4, },
   [50104054] = { label = "Fire",            subzone = "Detention Block", atlas = "Relic-Fire-TraitGlow", scale = 1.4, },
   [39585592] = { label = "Fire",            subzone = "Detention Block", atlas = "Relic-Fire-TraitGlow", scale = 1.4, },
   [38284555] = { label = "Fire",            subzone = "Detention Block", atlas = "Relic-Fire-TraitGlow", scale = 1.4, },
   [41434847] = { label = "Fire",            subzone = "Detention Block", atlas = "Relic-Fire-TraitGlow", scale = 1.4, },
-- -------------------------------------------------------------------------------------------------------------------
-- Third Floor (Inside) - "Officer Quarters"
-- -------------------------------------------------------------------------------------------------------------------
   [44963883] = { label = "Passageway outside to Overseer's Redoubt", subzone = "Officer Quarters", scale = arrow.scale, atlas = arrow.right, },
   [42023465] = { label = "Tol Dagor Officers' Bar", subzone = "Officer Quarters", tables = 6, seats = 7, maxseats = 2, novendor = true, alcohol = true, empty = true, cuisine = "Seafood", },
   [39224228] = { label = "Armory", subzone = "Officer Quarters", empty = true, atlas = "Warfronts-BaseMapIcons-Empty-Armory-Minimap", scale = 1.5, },
   [44704805] = { label = "Officers' Quarters", subzone = "Officer Quarters", empty = true, tables = 3, seats = 2, maxseats = 1, beds = 7, atlas = "Warfronts-BaseMapIcons-Empty-Barracks-Minimap", scale = 1.5, },
   [40815352] = { label = "Passageway downstairs to Detention Block", subzone = "Officer Quarters", scale = arrow.scale, atlas = arrow.down, },
-- -------------------------------------------------------------------------------------------------------------------
-- Third Floor (Outside) - "Overseer's Redoubt"
-- -------------------------------------------------------------------------------------------------------------------
   [50033761] = { label = "Stairs up to Overseer's Summit", subzone = "Overseer's Redoubt", scale = arrow.scale, atlas = arrow.up, },
   [39195765] = { label = "Door out to Overseer's Redoubt", subzone = "Overseer's Redoubt", scale = arrow.scale, atlas = arrow.right, },
   [45125635] = { label = "Door out to Overseer's Redoubt", subzone = "Overseer's Redoubt", scale = arrow.scale, atlas = arrow.left, },
   [45263301] = { label = "Passageway inside to Officer Quarters", subzone = "Overseer's Redoubt", scale = arrow.scale, atlas = arrow.left, },
   [41262842] = { label = "Large Cannon", subzone = "Overseer's Redoubt", atlas = "Warfronts-BaseMapIcons-Empty-Tower-Minimap", scale = 1.3, }, 
   [52824042] = { label = "Large Cannon", subzone = "Overseer's Redoubt", atlas = "Warfronts-BaseMapIcons-Empty-Tower-Minimap", scale = 1.3, }, 
   [31164996] = { label = "Large Cannon", subzone = "Overseer's Redoubt", atlas = "Warfronts-BaseMapIcons-Empty-Tower-Minimap", scale = 1.3, }, 
   [42686132] = { label = "Munitions Storage Room", subzone = "Overseer's Redoubt", empty = true, },
-- -------------------------------------------------------------------------------------------------------------------
-- Roof / Fourth Floor (Outside) - "Overseer's Summit"
-- -------------------------------------------------------------------------------------------------------------------
   [46703504] = { label = "Stairs down to Overseer's Redoubt", subzone = "Overseer's Summit", scale = arrow.scale, atlas = arrow.down, }, 
   [41725378] = { label = "Locked Door", closed = true, subzone = "Overseer's Summit", atlas = "map-icon-SuramarDoor.tga", scale = 1.3, }, 
   [47234181] = { label = "Locked Door", closed = true, subzone = "Overseer's Summit", atlas = "map-icon-SuramarDoor.tga", scale = 1.3, }, 
   [42213659] = { label = "Locked Door", closed = true, subzone = "Overseer's Summit", atlas = "map-icon-SuramarDoor.tga", scale = 1.3, }, 
   [36654849] = { label = "Locked Door", closed = true, subzone = "Overseer's Summit", atlas = "map-icon-SuramarDoor.tga", scale = 1.3, }, 
   [42446129] = { label = "Lighthouse Tower", landmark = true, subzone = "Overseer's Summit", atlas = "MovieRecordingIcon", scale = 1.3, },
   [44893887] = { label = "Large Cannon", subzone = "Overseer's Summit", atlas = "Warfronts-BaseMapIcons-Empty-Tower-Minimap", scale = 1.3, }, 
   [40344001] = { label = "Large Cannon", subzone = "Overseer's Summit", atlas = "Warfronts-BaseMapIcons-Empty-Tower-Minimap", scale = 1.3, }, 
   [38174464] = { label = "Large Cannon", subzone = "Overseer's Summit", atlas = "Warfronts-BaseMapIcons-Empty-Tower-Minimap", scale = 1.3, }, 
   [39045149] = { label = "Large Cannon", subzone = "Overseer's Summit", atlas = "Warfronts-BaseMapIcons-Empty-Tower-Minimap", scale = 1.3, }, 
   [43615033] = { label = "Large Cannon", subzone = "Overseer's Summit", atlas = "Warfronts-BaseMapIcons-Empty-Tower-Minimap", scale = 1.3, }, 
   [45814572] = { label = "Large Cannon", subzone = "Overseer's Summit", atlas = "Warfronts-BaseMapIcons-Empty-Tower-Minimap", scale = 1.3, }, 
   [42753258] = { label = "Pirate Pepe", subzone = "Overseer's Summit", text = "On bell on roof; mostly inaccessible", },
-- -------------------------------------------------------------------------------------------------------------------
   }; -- /Tol Dagor
-- -------------------------------------------------------------------------------------------------------------------


-- -------------------------------------------------------------------------------------------------------------------
-- Make Indices
-- -------------------------------------------------------------------------------------------------------------------
if not ns.index then ns.index = {} end;
ns.index[C.ZONES.TIRAGARDE] = ns.utils.points.index(ns.points[C.ZONES.TIRAGARDE]);
ns.index[C.ZONES.STORMSONG] = ns.utils.points.index(ns.points[C.ZONES.STORMSONG]);
ns.index[C.ZONES.DRUSTVAR]  = ns.utils.points.index(ns.points[C.ZONES.DRUSTVAR]);
-- -------------------------------------------------------------------------------------------------------------------
-- Check if any points belong on the Boralus map
-- -------------------------------------------------------------------------------------------------------------------
ns.utils.points.translate(ns.points[C.ZONES.TIRAGARDE], C.ZONES.TIRAGARDE);
ns.utils.points.translate(ns.points[C.ZONES.STORMSONG], C.ZONES.STORMSONG);
ns.utils.points.translate(ns.points[C.ZONES.DRUSTVAR],  C.ZONES.DRUSTVAR);
-- -------------------------------------------------------------------------------------------------------------------
-- Check if any points belong on the Tiragarde map
-- -------------------------------------------------------------------------------------------------------------------
ns.utils.points.translate(ns.points[C.ZONES.STORMSONG], C.ZONES.STORMSONG, C.ZONES.TIRAGARDE);
ns.utils.points.translate(ns.points[C.ZONES.DRUSTVAR],  C.ZONES.DRUSTVAR,  C.ZONES.TIRAGARDE);
-- -------------------------------------------------------------------------------------------------------------------
-- Check if any points belong on the Stormsong map
-- -------------------------------------------------------------------------------------------------------------------
ns.utils.points.translate(ns.points[C.ZONES.TIRAGARDE], C.ZONES.TIRAGARDE, C.ZONES.STORMSONG);
ns.utils.points.translate(ns.points[C.ZONES.DRUSTVAR],  C.ZONES.DRUSTVAR,  C.ZONES.STORMSONG);
-- -------------------------------------------------------------------------------------------------------------------
-- Check if any points belong on the Drustvar map
-- -------------------------------------------------------------------------------------------------------------------
ns.utils.points.translate(ns.points[C.ZONES.TIRAGARDE], C.ZONES.TIRAGARDE, C.ZONES.DRUSTVAR);
ns.utils.points.translate(ns.points[C.ZONES.STORMSONG], C.ZONES.STORMSONG, C.ZONES.DRUSTVAR);
-- -------------------------------------------------------------------------------------------------------------------
