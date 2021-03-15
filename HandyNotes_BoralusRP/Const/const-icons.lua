local myname, ns = ...

if not ns.textures      then ns.textures      = {}; end;
if not ns.textures.ship then ns.textures.ship = {}; end;
if not ns.textures.misc then ns.textures.misc = {}; end;

local     t = ns.textures;
local atlas = ns.utils.textures.atlas;

t.statue        = atlas("Warfronts-BaseMapIcons-Empty-Heroes-Minimap",    1.60);
t.spoilers      = atlas("ShipMissionIcon-Legendary-Map",                  2.50);
-- t.landmark      = atlas("collections-icon-favorites",         2.20);
t.landmark      = atlas("Warfronts-FieldMapIcons-Neutral-Banner-Minimap", 1.50);
t.ship.LARGE    = atlas("Ships_DreadnaughtA-Map",                         4.00);
t.ship.MEDIUM   = atlas("Ships_Dreadnaught-Map",                          3.00);
t.ship.SMALL    = atlas("Ships_GalleonA-Map",                             2.75);
t.ship.WRECK    = atlas("MantidTowerDestroyed",                           2.00);
t.ship.SAILBOAT = atlas("Ships_TroopTransport-Map",                       2.00);
-- t.ship.BOAT     = atlas("Ships_CarrierA-Map",                 2.00);
t.ship.BOAT     = atlas("FlightMasterFerry",                              1.60);
t.ship.LANDING  = atlas("ShipMissionIcon-SiegeA-Map",                     2.00);
t.official      = atlas("ShipMissionIcon-Training-Map",                   1.85);
t.academy       = atlas("Profession",                                     1.65);
t.basement      = atlas("poi-door-down",                                  1.35);
t.shop          = atlas("poi-town",                                       1.25);
-- t.alcohol       = atlas("MagePortalHorde",                    1.50);
t.alcohol       = atlas("chatframe-button-icon-mic-silenced",             1.40);
t.food          = atlas("Food",                                           1.50);
t.hostile       = atlas("PlayerEnemy",                                    1.75);
t.bed           = atlas("Vehicle-SilvershardMines-MineCart",              1.70);
t.animal        = atlas("WildBattlePet",                                  1.35);
t.npc           = atlas("groupfinder-waitdot",                            1.10);
t.alliance      = atlas("poi-alliance",                                   2.00);
t.closed        = atlas("PlayerNeutral",                                  1.75);
t.default       = atlas("PlayerFriend",                                   1.75);

-- t.arrow         = 
--   { up          = "NPE_ArrowUpGlow", 
--     down        = "NPE_ArrowDownGlow", 
--     left        = "NPE_ArrowLeftGlow",
--     right       = "NPE_ArrowRightGlow",
--     scale       = 1.30, };
-- 
t.arrow         = 
  { up          = "poi-door-up",
    down        = "poi-door-down",
    left        = "poi-door-left",
    right       = "poi-door-right",
    scale       = 1.30, };

