local myname, ns = ...

if not ns.cat then ns.cat = {} end;

ns.cat.data = { 
-- ==============================================================================================================================================
-- Tests: simple
-- p.[field]
-- ==============================================================================================================================================
  [ "academy"   ] = { label = "Proudmoore Academy spot$",  test = function(p) return     p.academy   end, },
  [ "beds"      ] = { label = "spot$ with beds",           test = function(p) return     p.beds      end, },
  [ "closed"    ] = { label = "closed spot$",              test = function(p) return     p.closed    end, },
  [ "dancing"   ] = { label = "spot$ with dancing",        test = function(p) return     p.dancing   end, },
  [ "desks"     ] = { label = "spot$ with desks",          test = function(p) return     p.desks     end, },
  [ "landmarks" ] = { label = "landmark$",                 test = function(p) return     p.landmark  end, },
  [ "monastery" ] = { label = "Stormsong Monastery spot$", test = function(p) return     p.monastery end, },
  [ "monuments" ] = { label = "monument$",                 test = function(p) return     p.statue    end, },
  [ "music"     ] = { label = "spot$ with music",          test = function(p) return     p.music     end, },
  [ "novendor"  ] = { label = "spot$ without vendors",     test = function(p) return     p.novendor  end, },
  [ "npcs"      ] = { label = "NPC$",                      test = function(p) return     p.npc       end, },
  [ "pets"      ] = { label = "pettable animal$",          test = function(p) return     p.animals   end, },
  [ "seats"     ] = { label = "spot$ with open seats",     test = function(p) return     p.seats     end, },
  [ "stalls"    ] = { label = "market stall$",             test = function(p) return     p.stall     end, },
  [ "tables"    ] = { label = "spot$ with empty tables",   test = function(p) return     p.tables    end, },
  [ "trainers"  ] = { label = "profession trainer$",       test = function(p) return     p.trainer   end, },
  [ "transport" ] = { label = "transportation service$",   test = function(p) return     p.transport end, },
  [ "unsafe"    ] = { label = "unsafe spot$",              test = function(p) return     p.hostile   end, },
  [ "alliance"  ] = { label = "Alliance representative$",  test = function(p) return     p.alliance  end, }, 
  [ "open"      ] = { label = "spot$ that can be entered", test = function(p) return not p.closed    end, },
  [ "safe"      ] = { label = "safe spot$",                test = function(p) return not p.hostile   end, },
-- ==============================================================================================================================================
-- Tests: simple and open
-- p.[field] and not p.closed
-- ==============================================================================================================================================
  [ "alcohol"  ] = { label = "spot$ serving alcohol", test = function(p) return p.alcohol  and not p.closed end, },
  [ "empty"    ] = { label = "empty spot$",           test = function(p) return p.empty    and not p.closed end, },
  [ "food"     ] = { label = "spot$ serving food",    test = function(p) return p.cuisine  and not p.closed end, },
  [ "official" ] = { label = "official location$",    test = function(p) return p.official and not p.closed end, },
  [ "shops"    ] = { label = "shop$",                 test = function(p) return p.wares    and not p.closed end, },
-- ==============================================================================================================================================
-- Tests: ships
-- p.ship and p.shipsize == [size category]
-- ==============================================================================================================================================
  [ "ships"        ] = { label = "ship$",         test = function(p) return p.ship and (p.ship == "LARGE" or p.ship == "MEDIUM" or    --
                                                                                        p.ship == "SMALL" or p.ship == "WRECK")   end, }, 
  [ "ships:large"  ] = { label = "large ship$",   test = function(p) return p.ship and  p.ship == "LARGE"                         end, },
  [ "ships:medium" ] = { label = "medium ship$",  test = function(p) return p.ship and  p.ship == "MEDIUM"                        end, },
  [ "ships:small"  ] = { label = "small ship$",   test = function(p) return p.ship and  p.ship == "SMALL"                         end, },
  [ "sailboats"    ] = { label = "sailboat$",     test = function(p) return p.ship and  p.ship == "SAILBOAT"                      end, },
  [ "landings"     ] = { label = "landing$",      test = function(p) return p.ship and  p.ship == "LANDING"                       end, },
  [ "boats"        ] = { label = "boat$",         test = function(p) return p.ship and (p.ship == "BOAT" or p.ship == "SAILBOAT") end, },
  [ "vessels"      ] = { label = "water vessel$", test = function(p) return p.ship end,                                                },
-- ==============================================================================================================================================
-- Tests: spoilers
-- p.spoiler or p.spoiler == "specific spoiler"
-- ==============================================================================================================================================
  [ "spoilers"          ] = { label = "quest or achievement spoiler$", test = function(p) return p.spoiler and p.spoiler == "list"     end, },
  [ "spoilers:maze"     ] = { label = "hedge maze spoiler$",           test = function(p) return p.spoiler and p.spoiler == "maze"     end, },    
  [ "spoilers:doom"     ] = { label = "doomspeaker spoiler$",          test = function(p) return p.spoiler and p.spoiler == "doom"     end, },
  [ "spoilers:depths"   ] = { label = "secret of the depths spoiler$", test = function(p) return p.spoiler and p.spoiler == "depths"   end, },
  [ "spoilers:picture"  ] = { label = "Picturesque Boralus spoiler$",  test = function(p) return p.spoiler and p.spoiler == "picture"  end, },
  -- [ "spoilers:mazeexit" ] = { label = "hedge maze exit spoiler$",      test = function(p) return p.spoiler and p.spoiler == "mazeexit" end, },    
-- ==============================================================================================================================================
-- Tests: complex
-- p.[field] [and|or] [not] p.[field] ...
-- ==============================================================================================================================================
  [ "bars"        ] = { label = "bar$",        test = function(p) return p.floors and p.alcohol and not p.closed and not p.ship end, },
  [ "buildings"   ] = { label = "building$",   test = function(p) return p.floors and               not p.closed and not p.ship end, },
  [ "restaurants" ] = { label = "restaurant$", test = function(p) return p.floors and p.cuisine and not p.closed and not p.ship end, },
  [ "vendors"     ] = { label = "vendor$",     test = function(p) return (p.wares or p.alcohol or p.cuisine)     and not p.novendor and not p.closed end, },
-- ==============================================================================================================================================
-- Tests: counts
-- p.[field] and p.[field] > n
-- ==============================================================================================================================================
--[ "beds"        ] = { label = "spot$ with beds",            test = function(p) return p.beds                                        end, },
  [ "beds:2"      ] = { label = "spot$ with at least 2 beds", test = function(p) return p.beds                   and p.beds     >= 2  end, },
  [ "beds:3"      ] = { label = "spot$ with at least 3 beds", test = function(p) return p.beds                   and p.beds     >= 3  end, },
  [ "beds:4"      ] = { label = "spot$ with at least 4 beds", test = function(p) return p.beds                   and p.beds     >= 4  end, },
  [ "beds:5"      ] = { label = "spot$ with at least 5 beds", test = function(p) return p.beds                   and p.beds     >= 5  end, },
--[ "decks"       ] = { label = "ship$ with 1+ decks",        test = function(p) return p.ship   and     p.decks                      end, },
  [ "decks"       ] = { label = "ship$ with 1+ decks",        test = function(p) return p.ship   and     p.decks                      end, },
  [ "decks:2"     ] = { label = "ship$ with 2+ decks",        test = function(p) return p.ship   and     p.decks and p.decks    >= 2  end, },
  [ "decks:3"     ] = { label = "ship$ with 3+ decks",        test = function(p) return p.ship   and     p.decks and p.decks    >= 3  end, },
  [ "decks:4"     ] = { label = "ship$ with 4+ decks",        test = function(p) return p.ship   and     p.decks and p.decks    >= 4  end, },
  [ "decks:5"     ] = { label = "ship$ with 5+ decks",        test = function(p) return p.ship   and     p.decks and p.decks    >= 5  end, },
  [ "decks:6"     ] = { label = "ship$ with 6+ decks",        test = function(p) return p.ship   and     p.decks and p.decks    >= 6  end, },
--[ "floors"      ] = { label = "building$",                  test = function(p) return p.floors and not p.ship                       end, },
  [ "floors"      ] = { label = "building$",                  test = function(p) return p.floors and not p.ship                       end, },
  [ "floors:2"    ] = { label = "building$ with 2+ floors",   test = function(p) return p.floors and not p.ship  and p.floors   >= 2  end, },
  [ "floors:3"    ] = { label = "building$ with 3+ floors",   test = function(p) return p.floors and not p.ship  and p.floors   >= 3  end, },
  [ "floors:4"    ] = { label = "building$ with 4+ floors",   test = function(p) return p.floors and not p.ship  and p.floors   >= 4  end, },
  [ "floors:5"    ] = { label = "building$ with 5+ floors",   test = function(p) return p.floors and not p.ship  and p.floors   >= 5  end, },
--[ "seats"       ] = { label = "spot$ with open seats",      test = function(p) return p.seats                                       end, },
  [ "seats:2"     ] = { label = "spot$ with 2+ seats",        test = function(p) return p.seats                  and p.seats    >= 2  end, },
  [ "seats:3"     ] = { label = "spot$ with 3+ seats",        test = function(p) return p.seats                  and p.seats    >= 3  end, },
  [ "seats:4"     ] = { label = "spot$ with 4+ seats",        test = function(p) return p.seats                  and p.seats    >= 4  end, },
  [ "seats:5"     ] = { label = "spot$ with 5+ seats",        test = function(p) return p.seats                  and p.seats    >= 5  end, },
  [ "seats:10"    ] = { label = "spot$ with 10+ seats",       test = function(p) return p.seats                  and p.seats    >= 10 end, },
  [ "seats:15"    ] = { label = "spot$ with 15+ seats",       test = function(p) return p.seats                  and p.seats    >= 15 end, },
  [ "seats:20"    ] = { label = "spot$ with 20+ seats",       test = function(p) return p.seats                  and p.seats    >= 20 end, },
--[ "tables"      ] = { label = "spot$ with empty tables",    test = function(p) return p.tables                                      end, },
  [ "tables:2"    ] = { label = "spot$ with 2+ empty tables", test = function(p) return p.tables                 and p.tables   >= 2  end, }, 
  [ "tables:3"    ] = { label = "spot$ with 3+ empty tables", test = function(p) return p.tables                 and p.tables   >= 3  end, }, 
  [ "tables:4"    ] = { label = "spot$ with 4+ empty tables", test = function(p) return p.tables                 and p.tables   >= 4  end, }, 
  [ "tables:5"    ] = { label = "spot$ with 5+ empty tables", test = function(p) return p.tables                 and p.tables   >= 5  end, }, 
  [ "tables:min2" ] = { label = "spot$ with a table for 2",   test = function(p) return p.tables and p.maxseats  and p.maxseats >= 2  end, },
  [ "tables:min3" ] = { label = "spot$ with a table for 3",   test = function(p) return p.tables and p.maxseats  and p.maxseats >= 3  end, },
  [ "tables:min4" ] = { label = "spot$ with a table for 4",   test = function(p) return p.tables and p.maxseats  and p.maxseats >= 4  end, },
  [ "tables:min5" ] = { label = "spot$ with a table for 5",   test = function(p) return p.tables and p.maxseats  and p.maxseats >= 5  end, },
  [ "tables:min6" ] = { label = "spot$ with a table for 6",   test = function(p) return p.tables and p.maxseats  and p.maxseats >= 6  end, },

-- ==============================================================================================================================================
-- end of tests
-- ==============================================================================================================================================
  }; 
