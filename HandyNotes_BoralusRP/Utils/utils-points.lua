-- -------------------------------------------------------------------------------------------------------------------
-- utils-points: Utilities for manipulating points and coordinates
--

-- setup -------------------------------------------------------------------------------------------------------------
local myname, ns = ...

local C        = ns.CONST;
local fmt      = string.format;
local ss       = ns.utils.text.ss;
local plur     = ns.utils.text.plur;
local colorize = ns.utils.text.colorize;
local HBD      = LibStub("HereBeDragons-2.0");

-- -------------------------------------------------------------------------------------------------------------------
local function get_current_location()
      local x, y, _, _ = HBD:GetPlayerZonePosition(true);
      if x and y 
         then -- print("Coordinates are",x,", ",y) -- debugging only
              x = math.floor(x * 10000);
              y = math.floor(y * 10000);
              return fmt("%04.f%04.f", x, y);
         else return "00000000"; -- dummy value
      end; -- if 
end;

-- -------------------------------------------------------------------------------------------------------------------
local function get_current_zone() return HBD:GetPlayerZone() end;
-- -------------------------------------------------------------------------------------------------------------------

-- format coordinates for printing -----------------------------------------------------------------------------------
local function formatCoords(coords, color)
      if not coords then return "" end;
      local x = math.floor(coords / 10000);
      local y = coords % 10000;
      return fmt("%s(%0.2f, %0.2f)|r", color or C.COLOR.APP, x / 100, y / 100);
end;
-- -------------------------------------------------------------------------------------------------------------------

-- -------------------------------------------------------------------------------------------------------------------
local function getInfo(point)
      if not point.cache then point.cache = {} end;
      if point.cache.info then return point.cache.info; end;

      local text = "";

      if point.monastery then text = text .. ", |cff990000Stormsong Monastery|r" end;
      if point.academy   then text = text .. ", |cff0088b9Proudmoore Academy|r"  end;
      if point.cuisine   then text = text .. ", food (" .. point.cuisine .. ")"  end;
      if point.alcohol   then text = text .. ", bar"                             end;

      if        point.dancing and point.music then text = text .. " (dancing, music)"
         elseif point.dancing                 then text = text .. " (dancing)"
         elseif point.music                   then text = text .. " (music)"
         end;

      if point.desks and not point.alcohol and not point.cuisine then text = text .. fmt(", %s desk%s", point.desks, ss(point.desks)) end;
      if point.seats                                             then text = text .. fmt(", %s seat%s", point.seats, ss(point.seats)) end;
      if point.wares                                             then text = text .. fmt(", shop (%s)", point.wares)                  end;

      if point.ship
         then if     point.ship == "LANDING" then text = text .. ", landing"
              elseif point.ship == "SAILBOAT" then text = text .. ", sailboat"
              elseif point.ship == "BOAT"     then text = text .. ", boat" 
              elseif point.ship == "WRECK"    then text = text .. ", shipwreck"
              else                                 text = text .. ", " .. string.lower(point.ship) .. " ship"
              end;
         end; -- if ship

      if point.text then text = text .. ": " .. C.COLOR.YELLOW .. point.text .. "|r" end;
      point.cache.info = text;
      return text
end; 
              
-- -------------------------------------------------------------------------------------------------------------------
local function work_out_label(point)

    if not point.cache then point.cache = {} end;
    if point.cache.label then return unpack(point.cache.label); end;

    local label;
    local r, g, b = 0, 1, 0;

    -- if has a label, use it, otherwise if it has an npc, use it, otherwise just give up, haha
    if point.stall and point.label and point.npc then label = fmt("%s (%s)", point.npc, point.label)
       elseif point.label                        then label = point.label
       elseif point.npc                          then label = point.npc
       else label = "Unknown"
       end; -- if

    -- sublabels
    if point.sub then label = label .. ", " .. point.sub end;

    -- how to handle unofficial names
    if        point.conjecture and ns.db.display_unknown    then label = "Unknown"
       elseif point.conjecture and ns.db.display_conjecture then label = label .. " (*)" 
       end;

    -- change the colors for ships and closed stuff and empty stuff and official stuff
    if        point.official                                  then r, g, b = 0, 0.75, 1;
       elseif point.spoiler                                   then r, g, b = 1, 0.5, 0;  label = "Spoilers: " .. label
       elseif point.empty and point.closed and not point.ship then r, g, b = 0.75, 0.75, 0.75; label = label .. " [empty, closed]"
       elseif point.empty                                     then r, g, b = 1, 1, 1;          label = label .. " [empty]"
       elseif point.closed and not point.ship                 then r, g, b = 1, 1, 1;          label = label .. " [closed]"
       end;
    point.cache.label = { label, r, g, b };
    return label, r, g, b;
end; 
  
-- -------------------------------------------------------------------------------------------------------------------
local function getLabel(point)
      local label, r, g, b = work_out_label(point);
      return colorize(label, r, g, b)
end;

-- -------------------------------------------------------------------------------------------------------------------
local function showPoint(coords, point, zone)
      if not zone  then zone  = C.ZONE;                  end;
      if not point then point = ns.points[zone][coords]; end;
      return fmt("%s %s|r%s", getLabel(point), formatCoords(coords), getInfo(point))
end;
      
-- -------------------------------------------------------------------------------------------------------------------
local function work_out_texture(point)

    if not point.cache then point.cache = {} end;
    if point.cache.texture then return point.cache.texture; end;

    local t      = ns.textures;
    local atlas  = ns.utils.textures.atlas;
    local custom = ns.db.show_custom and ns.db.custom_filter;

    local texture;
    
    if     point.atlas                                        then texture = atlas(point.atlas, point.scale);
    elseif point.spoiler  and (ns.db.show_spoilers or custom) then texture = t.spoilers
    elseif point.alliance and (ns.db.show_alliance or custom) then texture = t.alliance
    elseif point.statue   and (ns.db.show_misc  or custom)    then texture = t.statue
    elseif point.landmark and (ns.db.show_misc  or custom)    then texture = t.landmark
    elseif point.ship     and (ns.db.show_ships or custom)    then texture = t.ship[point.ship]
    elseif point.academy  and (ns.db.show_misc  or custom)    then texture = t.academy
    elseif point.official and (ns.db.show_misc  or custom)    then texture = t.official
    elseif point.basement and (ns.db.show_misc  or custom)    then texture = t.basement
    elseif point.wares    and (ns.db.show_shops or custom)    then texture = t.shop
    elseif point.alcohol  and (ns.db.show_bars  or custom)    then texture = t.alcohol
    elseif point.cuisine  and (ns.db.show_food  or custom)    then texture = t.food
    elseif point.beds     and (ns.db.show_misc  or custom)    then texture = t.bed
    elseif point.animals  and (ns.db.show_misc  or custom)    then texture = t.animal
    elseif point.npc      and (ns.db.show_misc  or custom)    then texture = t.npc
    elseif point.closed   and (ns.db.show_misc  or custom)    then texture = t.closed
    elseif point.hostile  and (ns.db.show_misc  or custom)    then texture = t.hostile
    end; -- if/elseif

    if not texture then texture = t.default; end;
    point.cache.texture = texture;
    return texture;
end

-- -------------------------------------------------------------------------------------------------------------------
local function get_point_info(point)
    if point then
        local label = work_out_label(point)
        local icon = work_out_texture(point)
        local category = "rpspot"
        return label, icon, category, point.quest, point.faction, point.scale, point.alpha or 1
    end
end


-- -------------------------------------------------------------------------------------------------------------------
local function get_point_info_by_coords(uiMapID, coord)
    return get_point_info(ns.points[uiMapID] and ns.points[uiMapID][coord])
end

local function tt_main_label(point)
  local section = {};
  local label, r, g, b = work_out_label(point);
           
  if point.hostile
     then table.insert(section, { { label, "|cffff0000Hostile Territory|r"}, r, g, b } )
     else table.insert(section, {   label,                                   r, g, b } )
     end; -- if

  return section;
end;

local function tt_sub_label(point)
   local section = {};
   if point.sub -- explicit SUB field
      then table.insert(section,  { point.sub, 0, 1, 0 } );
      elseif point.academy -- ACADEMY
      then table.insert(section,  { "Proudmoore Academy", 0, 0.85, 1 } );
      elseif point.trainer and point.npc and not point.label -- trainer
      then table.insert(section,  { point.trainer .. " trainer", 0, 1, 0 } );
      end; -- if

   return section;
end;

local function tt_type_of_thing(point)
  local section = {};
  local r, g, b;
  if        point.ship and point.ship == "SAILBOAT" then table.insert(section, { "Small sailoat", 1, 1, 1 });  
     elseif point.ship and point.ship == "BOAT"     then table.insert(section, { "Small boat",    1, 1, 1 });  
     elseif point.ship and point.ship == "WRECK"    then table.insert(section, { "Shipwreck", 1, 1, 1 });
     elseif point.ship and point.ship == "LANDING"  then table.insert(section, { "Landing/Departure Point", 1, 0.75, 0} );
     elseif point.statue   then table.insert(section, { "Monument", 1, 0.75, 0 } );

     -- ------------------------------------------------------------------------------------------------------------------------
     -- ship
     elseif point.ship  -- type of thing = SHIP (that isn't a boat, landing, or wreck)

     then local size_info, deck_info;
          r, g, b = 0.75, 0.75, 0.75;

          if point.decks and point.floors
             then deck_info = plur(point.decks, "exterior deck") .. ", " ..  plur("floor", "interior floor")
             elseif point.decks then deck_info = plur(point.decks, "deck")
             elseif point.floors then deck_info = plur(point.floors, "interior deck")
             else deck_info = nil
             end; --if

          if        point.ship == "SMALL"  then size_info, r, g, b = "Small ship",  0.00, 1.00, 0.00;
             elseif point.ship == "MEDIUM" then size_info, r, g, b = "Medium ship", 0.25, 0.55, 1.00;
             elseif point.ship == "LARGE"  then size_info, r, g, b = "Large ship",  0.85, 0.25, 1.00;
             end; -- if

          if size_info and deck_info
             then table.insert(section,  { size_info .. ", " .. deck_info, r, g, b } )
             elseif size_info
             then table.insert(section,  { size_info, r, g, b } )
             elseif deck_info
             then table.insert(section,  { deck_info, r, g, b } )
             else table.insert(section,  { "Ship", r, g, b } )
             end; -- if

     -- ------------------------------------------------------------------------------------------------------------------------
    elseif point.floors -- type of thing = BUILDING
    then r, g, b = 1, 0.75, 0;
         local building = point.floors .. "-story building";
         if       point.alcohol then table.insert(section, { { building, "Bar"},         r, g, b })
           elseif point.wares   then table.insert(section, { { building, "Shop"},        r, g, b })
           elseif point.cuisine then table.insert(section, { { building, "Restaurant"} , r, g, b })
           else                      table.insert(section, { building,                   r, g, b });
           end; -- if 
             
     -- ------------------------------------------------------------------------------------------------------------------------
    elseif point.stall -- type of thing = STALL
    then r, g, b = 1, 0.75, 0;
         local stall = "Market stall";
         if       point.wares   then table.insert(section, { { stall, "Vendor"        }, r, g, b })
           elseif point.alcohol then table.insert(section, { { stall, "Drinks stand", }, r, g, b });
           elseif point.cuisine then table.insert(section, { { stall, "Food stand",   }, r, g, b });
           else                      table.insert(section, { stall,                      r, g, b });
           end; -- if

     -- ------------------------------------------------------------------------------------------------------------------------
    elseif point.basement -- type of thing = BASEMENT
    then r, g, b = 1, 0.75, 0;
         local basement = "Basement/Cellar";
         if       point.alcohol then table.insert(section, { { basement, "Bar"},         r, g, b })
           elseif point.cuisine then table.insert(section, { { basement, "Restaurant" }, r, g, b })
           else                      table.insert(section, { "Basement/Cellar",          r, g, b });
           end; -- if
  
     -- ------------------------------------------------------------------------------------------------------------------------
    elseif point.landmark then table.insert(section, { "Boralus landmark", 1, 0.75, 0 } );
    end; 

    r, g, b = 0, 1, 0;
    -- npcs
    --
    if point.npc and point.label 
       then -- figure out what kind of npc we have
            if point.trainer         then table.insert(section, { { point.npc, point.trainer .. " trainer"}, r, g, b });
               elseif point.wares    then table.insert(section, { { point.npc, point.wares}, r, g, b } );
               elseif point.alcohol  then table.insert(section, { { point.npc, "Bartender"}, r, g, b } );
               elseif point.cuisine  then table.insert(section, { { point.npc, "Server"},    r, g, b } );
               else                       table.insert(section, { { point.npc, "NPC"},       r, g, b } );
               end; 
       -- or maybe we have a shop
       elseif  point.wares           
               then table.insert(section, { { " ", point.wares},       r, g, b } );
       end; -- if 
       return section;
end; 

local function tt_details(point)
      local r, g, b = 1, 1, 1; -- white as the default color for stuff
      local section = {};

      local serves = "Menu";
      if point.novendor then serves = "Menu (no vendor)"; r, g, b = 0.75, 0.75, 0.75; end;
  
      if point.alcohol and point.cuisine then table.insert(section, { {serves, "Alcohol, Food (" .. point.cuisine .. ")"}, r, g, b });
         elseif point.alcohol            then table.insert(section, { {serves, "Alcohol"                                }, r, g, b });
         elseif point.cuisine            then table.insert(section, { {serves, "Food (" .. point.cuisine .. ")"         }, r, g, b });
         end; -- if
  
      r, g, b = 1, 1, 1;
      if        point.dancing and point.music then table.insert(section, { {" ", "Features music, dancing" }, r, g, b});
         elseif point.dancing                 then table.insert(section, { {" ", "Features dancing"        }, r, g, b});
         elseif point.music                   then table.insert(section, { {" ", "Features music"          }, r, g, b});
         end; -- if 
  
      -- seating
      if point.seats or point.tables or point.desks or point.maxseats then 
    
         local seating = {};

         -- first seat counts
         if point.seats then table.insert(seating, plur(point.seats, "seat")) end;

         -- then table counts
         if point.tables 
            -- we have tables
            then if point.maxseats
                 then -- we have maxseats
                      if point.table == 1 -- we have one table
                         then table.insert(seating, plur(point.tables, "table") .. " (" .. plur(point.maxseats, "seat") .. ")")
                         -- we have more than one table
                         else table.insert(seating, plur(point.tables, "table") .. " (max. " .. plur(point.maxseats, "seat") .. ")")
                      end; -- if one table
                 -- we don't have maxseats information
                 else table.insert(seating, plur(point.tables, "table"));
                 end; -- if maxseats
            end; -- if tables
            
         -- finally desk counts
         if point.desks then table.insert(seating, plur(point.desks, "desk")) end;

         table.insert(section, { { "Seating", table.concat(seating, ", ") }, r, g, b });

      end; -- seating

      if point.beds 
         then table.insert( section, { {"Accomodations", plur(point.beds, "bed")}, r, g, b } );
      end;
  
      if point.animals and point.animals == 1
         then table.insert( section, { "Pettable animal",                      r, g, b });
         elseif point.animals
         then table.insert( section, { plur(point.animals, "pettable animal"), r, g, b });
      end;
      return section;
end;

local function tt_text(point)
      local section = {};
      if point.text then table.insert(section, { "|cffbbbbbbNote:|r " .. point.text, 1, 0.75, 0 } ); end; -- if
      return section;
end

-- -------------------------------------------------------------------------------------------------------------------
local function handle_tooltip(tooltip, point)
    if not point.cache then point.cache = {} end;

    -- helper function
    local function populate(section, blank)
          if not section then return end;
          for _, line in ipairs(section)
            do local label, r, g, b = unpack(line)
               if blank then tooltip:AddLine(" ", 0, 0, 0, true); blank = false; end;
               if type(label) == "table" 
                  then -- we have a double line
                  local one, two = unpack(label)
                  tooltip:AddDoubleLine(one, two, r, g, b, r, g, b)
                  else -- we have a single line
                    tooltip:AddLine(label, r, g, b, true)
                    end; -- if
            end; -- for
    end;  -- helper function
        
    local tip;

    -- handle the cache
    if point.cache.tooltip 
       then tip = point.cache.tooltip; 
       else tip = { label    = tt_main_label(    point),
                    sublabel = tt_sub_label(     point),
                    type     = tt_type_of_thing( point),
                    details  = tt_details(       point),
                    text     = tt_text(          point), }
            point.cache.tooltip = tip;
       end;

    -- populate the tooltip
    populate(tip.label        );
    populate(tip.sublabel     );
    populate(tip.type         );
    populate(tip.details, true);
    populate(tip.text,    true);

    -- show the tooltip
    tooltip:Show()
end

-- -------------------------------------------------------------------------------------------------------------------
local function handle_tooltip_by_coords(tooltip, uiMapID, coord)
    return handle_tooltip(tooltip, ns.points[uiMapID] and ns.points[uiMapID][coord]) end;

  --
-- -------------------------------------------------------------------------------------------------------------------
local function should_show_point(coord, point, currentZone, isMinimap)

    -- if it's in our custom filters and custom filters are on
    -- the we can just shortcut nearly everything
    if ns.db.show_custom and ns.db.custom_filter
       and ((isMinimap and ns.db.show_on_minimap) or (not isMinimap and ns.db.show_on_city) )
       then if ns.db.custom_filter and ns.db.custom_filter.cache and ns.db.custom_filter.cache[currentZone]
               and ns.db.custom_filter.cache[currentZone][coord] then return true; else return false; end;
       end; -- if the custom filter is on and set

    local show = false;

    -- try to find a reason to show it
    if ns.db.show_ships    and point.ship              then show = true; end;
    if ns.db.show_food     and point.cuisine           then show = true; end;
    if ns.db.show_shops    and point.wares             then show = true; end;
    if ns.db.show_alliance and point.alliance          then show = true; end;
    if ns.db.show_bars     and point.alcohol           then show = true; end;
    if ns.db.show_spoilers and point.spoiler == "list" then show = true; end;
    if ns.db.show_misc     and not point.ship 
                           and not point.cuisine 
                           and not point.wares 
                           and not point.alliance 
                           and not point.alcohol
                           and not point.spoiler       then show = true; end;

    -- try to find a reason to not show it
    if show and point.hidden                            then show = false end;
    if show and point.empty    and ns.db.hide_empty     then show = false end;
    if show and point.closed   and ns.db.hide_closed    then show = false end;
    if show and point.novendor and ns.db.hide_novendor  then show = false end;

    -- but even if it's empty or closed we still want to show it if it's claimed or a ship
    if not show and point.ship and ns.db.show_ships then show = true end; 

    -- if we're not only showing boralus points then don't show boralized points
    if show and point.originZone and not ns.db.show_on_kultiras then show = false end;

    -- more reasons to not show it
    if show and point.hostile and ns.db.hide_hostile                then show = false end;
    if show and point.subzone and point.subzone ~= GetSubZoneText() then show = false end; 

    -- only show if we're on the right map or minimap or whatever
    if isMinimap and not ns.db.show_on_minimap 
       -- on the minimap but not showing it
       then show = false
       -- on the main map and not in boralus and we're not showing other maps
       elseif not isMinimap and currentZone ~= C.ZONES.BORALUS and not ns.db.show_on_kultiras
       then show = false
       -- on the main map and we're not showing boralus locations
       elseif not isMinimap and not ns.db.show_on_city 
       then show = false
    end; -- if/then/elseif/then

    return show;
end; --

-- -------------------------------------------------------------------------------------------------------------------
-- returns an indexed table of points
local function index_points(zonePoints)
      local count = 0; 
      local point_index = {}; 
      for k, _ in pairs(zonePoints) 
          do count = count + 1; 
             point_index[count] = k; 
          end; -- for k
      return point_index;
end; 

-- -------------------------------------------------------------------------------------------------------------------
local function convert_coords(param1, param2)
  if param2 
     then param1 = math.floor(param1 * 10000);
          param2 = math.floor(param2 * 10000);
          return param1 * 10000 + param2;
     else param1 = tonumber(param1);
          local x = math.floor(param1 / 10000);
          local y = param1 % 10000;
          return x / 10000, y / 10000;
     end;
end; -- function

-- -------------------------------------------------------------------------------------------------------------------
local function translate_zones(zonePoints, zoneID, targetZoneID)
      for coords, point in pairs(zonePoints)
          do 
            if not point.originZone then -- only copy original points not copies of points
               local x, y = convert_coords(coords);
               local targetX, targetY = HBD:TranslateZoneCoordinates(x, y, zoneID, targetZoneID or C.ZONES.BORALUS);
               if targetX and targetY 
                  then 
                    local targetCoords = convert_coords(targetX, targetY);
                    ns.points[targetZoneID or C.ZONES.BORALUS][targetCoords] = point;
                    ns.points[targetZoneID or C.ZONES.BORALUS][targetCoords]["originZone"] = zoneID;
                  end; -- if not nil
             end; -- if not originZone
           end; -- for loop
end; -- function
   
-- -------------------------------------------------------------------------------------------------------------------
local function distance_between(one, two, zoneOne, zoneTwo)
  local distance, instance, _;
  one = tonumber(one); local oneX = math.floor(one / 10000); local oneY = one % 10000; oneX = oneX / 10000; oneY = oneY / 10000;
  two = tonumber(two); local twoX = math.floor(two / 10000); local twoY = two % 10000; twoX = twoX / 10000; twoY = twoY / 10000;

  oneX,     oneY, instance = HBD:GetWorldCoordinatesFromZone(oneX, oneY, zoneOne or C.ZONE);
  twoX,     twoY, _        = HBD:GetWorldCoordinatesFromZone(twoX, twoY, zoneTwo or C.ZONE);
  distance, _,    _        = HBD:GetWorldDistance(instance, oneX, oneY, twoX, twoY);

  return distance;
end;

-- -------------------------------------------------------------------------------------------------------------------
-- Geofence code
-- Based on answer by Peter Gilmour - Oct 12, 2016 at 10:22 pm
-- https://stackoverflow.com/questions/31730923/check-if-point-lies-in-polygon-lua
--
-- these geofences are only polygons, no circles etc
--
-- example usage:
--
-- local myFence = { 35107657, 35667562, 40128374, 41837872, 44838736, 52607388 };
-- 
-- if insideFence(myFence, get_current_location())
--    then print("inside fence")
--    else print("outside fence");
--    end;
--
-- -------------------------------------------------------------------------------------------------------------------
local function insideFence(fence, coords)
  local oddNodes = false; -- initial value is false
  local j = #fence; 

  local cy, cx = coords % 10000, math.floor(coords / 10000);

  for i = 1, #fence 
      do local fiy, fix = fence[i] % 10000, math.floor(fence[i] / 10000);
         local fjy, fjx = fence[j] % 10000, math.floor(fence[j] / 10000);

--            if (fence[i].y < coords.y and fence[j].y >= coords.y or fence[j].y < coords.y and fence[i].y >= coords.y) 
--               then if (fence[i].x + ( coords.y - fence[i].y ) / (fence[j].y - fence[i].y) * (fence[j].x - fence[i].x) < coords.x) 
            
         if (fiy < cy and fjy >= cy or fjy < cy and fiy >= cy )
            then if (fix + (cy - fiy) / (fjy - fiy) * (fjx - fix) < cx)
                    then oddNodes = not oddNodes; 
                    end -- inner if
            end -- outer if
         j = i; -- important
      end; -- for loop
  return oddNodes;
end; -- function

-- -------------------------------------------------------------------------------------------------------------------
-- Export utilities
-- -------------------------------------------------------------------------------------------------------------------
if not ns.utils then ns.utils = {} end;
-- -------------------------------------------------------------------------------------------------------------------
-- exported player location funtions
-- -------------------------------------------------------------------------------------------------------------------
if not ns.utils.here then ns.utils.here = {} end;
       ns.utils.here.coords        = get_current_location;
       ns.utils.here.zone          = get_current_zone;
       ns.utils.here.inside        = insideFence;
-- -------------------------------------------------------------------------------------------------------------------
-- exported coordinate functions
-- -------------------------------------------------------------------------------------------------------------------
if not ns.utils.coords then ns.utils.coords = {} end;
       ns.utils.coords.format      = formatCoords;
       ns.utils.coords.get_info    = get_point_info_by_coords;
       ns.utils.coords.tt          = handle_tooltip_by_coords;
       ns.utils.coords.distance    = distance_between;
       ns.utils.coords.convert     = convert_coords;
       ns.utils.coords.get         = get_current_location; -- to become obsolete
       ns.utils.coords.fence       = insideFence;          -- to become obsolete
       ns.utils.coords.zone        = get_current_zone;     -- to become obsolete
-- -------------------------------------------------------------------------------------------------------------------
-- exported points functions
-- -------------------------------------------------------------------------------------------------------------------
if not ns.utils.points then ns.utils.points = {} end;
       ns.utils.points.format      = showPoint;
       ns.utils.points.get_info    = get_point_info;
       ns.utils.points.info        = getInfo;
       ns.utils.points.label       = getLabel;
       ns.utils.points.show        = should_show_point;
       ns.utils.points.texture     = work_out_texture;
       ns.utils.points.tt          = handle_tooltip;
       ns.utils.points.tt_label    = work_out_label;
       ns.utils.points.index       = index_points;     -- to become obsolete
       ns.utils.points.translate   = translate_zones;  -- to become obsolete
-- -------------------------------------------------------------------------------------------------------------------
-- exported pointset functions
-- -------------------------------------------------------------------------------------------------------------------
if not ns.utils.sets then ns.utils.sets = {} end;
       ns.utils.sets.translate     = translate_zones;
       ns.utils.sets.index         = index_points;
-- -------------------------------------------------------------------------------------------------------------------
