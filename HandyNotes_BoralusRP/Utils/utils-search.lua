-- -------------------------------------------------------------------------------------------------------------------
-- 
--
local myname, ns = ...

if not ns.utils        then ns.utils        = {} end;
if not ns.utils.cat    then ns.utils.cat    = {} end;
if not ns.utils.search then ns.utils.search = {} end;

-- -------------------------------------------------------------------------------------------------------------------
--
local C          = ns.CONST;
local utils      = ns.utils;
local fmt        = string.format;
local showPoint  = utils.points.format;
local CAT        = ns.cat.data;
local distance   = utils.coords.distance;
local getloc     = utils.coords.get;
local getzone    = utils.coords.zone;
local shouldShow = utils.points.show;

-- -------------------------------------------------------------------------------------------------------------------
local function category_info(cat)
  local filter;
  if cat then filter = function(n) return string.find(n, cat) end
     else filter = function() return true end
     end; -- if

  if not ns.cat.index
     then local catList = {};
          for c in pairs (CAT) do table.insert(catList, c) end; -- for
          table.sort(catList);
          ns.cat.index = catList;
     end;
  
  local text = "";
  local parens = false;
  local comma = C.INDENT;
  local count = 0;
  for _, c in ipairs(ns.cat.index)
      do local label = CAT[c].label
         label = string.gsub(label, "%$", "s");
         if filter(c) or filter(label)
            then
              if        not string.find(c, ":") and not parens then   
                        text   = fmt("%s%s%s%s|r: %s",  text, comma, C.COLOR.YELLOW,   c, label); 
                        parens = false;
                        count  = count + 1;
                        if (count % 12) == 0 then comma = ", \n" .. C.INDENT else comma = ", " end;
                 elseif not string.find(c, ":") then
                        text   = fmt("%s)%s%s%s|r: %s", text, comma, C.COLOR.YELLOW,   c, label); 
                        parens = false;
                        count = count + 1; 
                        if (count % 12) == 0 then comma = ", \n" .. C.INDENT else comma = ", " end;
                 elseif parens then
                        text   = fmt("%s%s%s:%s|r",     text, comma, C.COLOR.APP, string.gsub(c, ".+:", "")); 
                        parens = true;
                 else   text   = fmt("%s (%s:%s|r",     text,        C.COLOR.APP, string.gsub(c, ".+:", "")); 
                        parens = true; 
              end; -- if
            end; -- if filter
         end; -- for
         print(fmt("%s Predefined criteria: \n\n%s", C.BORA, text));
  end; -- function
-- -------------------------------------------------------------------------------------------------------------------  

local function show_results(searchRule, coordsCache, countsByZone, totalCount, listOfPoints, resultLabel, hideSetHelp)
  local thisZone = ns.utils.coords.zone(); -- the current zone
  local filter = { rule = searchRule, cache = coordsCache, points = listOfPoints, count = totalCount, };

  if countsByZone[thisZone] and countsByZone[thisZone] > 0

     -- found at least one match in the current zone -----------------------------------------------------------------
     then local text = {}; -- create the text array
          resultLabel = resultLabel:gsub("%$", countsByZone[thisZone] == 1 and "" or "s"); -- pluralize
          for _, i in ipairs(listOfPoints[thisZone]) do local c, p = unpack(i); table.insert(text, showPoint(c, p)); end;
          table.sort(text);
          print(fmt("%s %s %s found in %s:\n%s\n", C.BORA, countsByZone[thisZone], 
                resultLabel, C.ZONENAMES[thisZone], table.concat(text,"\n") 
                ));
          if not hideSetHelp 
             then print(fmt("%s Type %s%s setlast|r to save this as your custom filter.",
                        C.BORA, C.COLOR.APP, C.SLASH_BORA));
             end; -- showing set help
          ns.last_filter = filter;
          return filter;

     -- no matches in this zone but found matches in a different zone ------------------------------------------------
     elseif totalCount > 0
     then local text = {}; -- create the text array
          resultLabel = resultLabel:gsub("%$", totalCount == 1 and "" or "s"); -- pluralize
          local zoneCount = 0
          for zone, count in pairs(countsByZone) 
              do if count > 0 then table.insert(text, count .. " in " .. C.ZONENAMES[zone]); 
                    zoneCount = zoneCount + 1;
                    end; -- if
              end;
          print(fmt("%s %s %s found in %s other zone%s: %s",
                C.BORA, totalCount, resultLabel, zoneCount, zoneCount == 1 and "" or "s",
                table.concat(text, ", ")));
          if not hideSetHelp 
             then print(fmt("%s Type %s%s setlast|r to save this as your custom filter.",
                        C.BORA, C.COLOR.APP, C.SLASH_BORA));
             end; -- showing set help
          ns.last_filter = filter;
          return filter;

     -- no matches listOfPoints anywhere ------------------------------------------------------------------------------------
     else resultLabel = resultLabel:gsub("%$", "s")
          print(fmt("%s No %s found.", C.BORA, resultLabel));
          ns.last_filter = nil;
          return nil;
     end; -- end if
end; -- show_results() function

-- -------------------------------------------------------------------------------------------------------------------
local function via_category(cat, hideSetHelp)
  local test     = CAT[cat].test;  -- these just simplify 
  local label    = CAT[cat].label; -- the code

  local found, cache, count = {}, {}, {};
  local allCount = 0; --
  for zone in pairs(ns.points)
    do found[zone] = {}; -- for holding results per zone
       cache[zone] = {}; -- for storing for later
       count[zone] = 0;  -- track the number of hits per zone
       for coords, point in pairs(ns.points[zone]) 
         do if test(point) 
               then table.insert(found[zone], { coords, point } );
                    count[zone]         = count[zone] + 1;
                    allCount            = allCount + 1;
                    cache[zone][coords] = true;
               end; -- if
         end -- for coords, point
    end; -- for zone

  --     show_results(searchRule, coordsCache, countsByZone, totalCount, listOfPoints, resultLabel, hideSetHelp);
  return show_results(cat,        cache,       count,        allCount,   found,        label,       hideSetHelp);
end;

-- -------------------------------------------------------------------------------------------------------------------
local function via_search(searchTerms, hideSetHelp)
  local matchers = {};

  local found, cache, count = {}, {}, {};
  local allCount = 0; 

  -- set up the search matchers
  for _, term in ipairs(searchTerms)
      do if     CAT[term]                 then table.insert(matchers, CAT[term].test)
         elseif CAT[term .. "s"]          then table.insert(matchers, CAT[term .. "s"].test)
         elseif CAT[term:gsub(".+:", "")] then table.insert(matchers, CAT[term:gsub(".+:", "")].test)
         else table.insert(matchers,  -- this is the text match
                function(p) 
                  local t = string.lower(term);
                  return (p.label   and string.find(string.lower(p.label),   t)) -- these are the fields
                      or (p.npc     and string.find(string.lower(p.npc),     t)) -- where a text match
                      or (p.sub     and string.find(string.lower(p.sub),     t)) -- might possibly occur
                      or (p.text    and string.find(string.lower(p.text),    t))
                      or (p.wares   and string.find(string.lower(p.wares),   t))
                      or (p.cuisine and string.find(string.lower(p.cuisine), t))
                      or (p.trainer and string.find(string.lower(p.trainer), t))
                  end); -- function
            end; -- if/elseif/else
      end; -- for term

  for zone in pairs(ns.points)
    do found[zone] = {}; -- for holding results per zone
       cache[zone] = {}; -- for storing for later
       count[zone] = 0;  -- track the number of hits per zone
       for coords, point in pairs(ns.points[zone]) 
           do local f;   -- track if we found a match

              for _, m in ipairs(matchers)
                  do if m(point) 
                        then f = true; 
                        else f = false; break; -- exit the loop early
                        end; -- if
              end; -- for m

              if f then table.insert(found[zone], { coords, point } ) ; 
                        count[zone] = count[zone] + 1; 
                        allCount    = allCount    + 1;
                        cache[zone][coords] = true;
                   end; -- found a match

              if count[zone] >= 100 
                 then print(fmt("%s Matches limited to 100.", C.BORA)); 
                      break; -- exit the loop if 100+
                 end; -- count >= 100

           end; -- for coords
    end; -- for zone

  --     show_results(searchRule,                      coordsCache, countsByZone, totalCount, listOfPoints, resultLabel, hideSetHelp);
  return show_results(table.concat(searchTerms, ", "), cache,       count,        allCount,   found,        "result$",   hideSetHelp);
end; -- function

-- -------------------------------------------------------------------------------------------------------------------
local function via_range(range)
  local thisZone = getzone();

  if not ns.points[thisZone] -- in case we're not somewhere that we can get results
     then print(fmt("%s You aren't in a zone with known RP spots.", C.BORA)); return; end; 

  -- range-checking on the range, how ironic
  local new_range = math.floor(range and tonumber(range) or ns.db.range_default or C.RANGE.DEFAULT);

  if (new_range < C.RANGE.MIN) or (new_range > C.RANGE.MAX)
     then new_range = math.min(math.max(new_range, C.RANGE.MIN), C.RANGE.MAX); 
          print(fmt("%s %sRange must be between %s and %s; using |r%s%s %s|r%s for this search.", 
                    C.BORA, C.COLOR.GRAY, C.RANGE.MIN, C.RANGE.MAX, C.COLOR.YELLOW,
                    new_range, C.RANGE.UNITS, C.COLOR.GRAY));
          end;

  local current  = getloc(); -- get the player's current location
  local found    = { [thisZone] = {}, };
  local count    = { [thisZone] = 0,  };
  local cache    = { [thisZone] = {}, };
  local countAll = 0;
  local location = ns.utils.coords.format(current, C.COLOR.WHITE);

  for coords, point in pairs(ns.points[thisZone]) 
      do if distance(coords, current) < new_range and shouldShow(coords, point, thisZone)
            then table.insert(found[thisZone], { coords, point } ); 
                 count[thisZone] = count[thisZone] + 1; 
                 countAll        = countAll        + 1;
                 cache[thisZone][coords] = true;
            end; -- if
      end; -- for
  
  --                 show_results(searchRule,  
  local new_filter = show_results(fmt("within %s %s of %s", new_range, C.RANGE.UNITS, location),          
  --                    coordsCache, countsByZone, totalCount, listOfPoints, 
                        cache,       count,        countAll,   found,        
  --                    resultLabel, hideSetHelp);
                        fmt("RP spot$ within %s %s of %s", new_range, C.RANGE.UNITS, location), true);

  if countAll < 1 and ns.db.show_custom and ns.db.custom_filter
     then print(fmt("%s %sYour |r%scustom filter|r%s may prevent you from seeing some nearby spots.", 
                    C.BORA, C.COLOR.GRAY, C.COLOR.YELLOW, C.COLOR.GRAY), 
                fmt("%sType |r%s%s toggle|r%s to turn the filter off.",
                    C.COLOR.GRAY, C.COLOR.APP, C.SLASH_BORA, C.COLOR.GRAY)); 
     end -- if

  return new_filter;
end; 

-- -------------------------------------------------------------------------------------------------------------------
-- exported functions
--
ns.utils.search.range = via_range;
ns.utils.search.cat   = via_category;
ns.utils.search.text  = via_search;
ns.utils.cat.info     = category_info;
