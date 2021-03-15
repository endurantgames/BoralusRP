local myname, ns = ...

-- -------------------------------------------------------------------------------------------------------------------
local C             = ns.CONST;
local utils         = ns.utils;
local split         = utils.text.split;
local es            = utils.text.es;
local fmt           = string.format;
local CAT           = ns.cat.data;
local category_info = ns.utils.cat.info;
local via_category  = ns.utils.search.cat;
local via_search    = ns.utils.search.text;
local via_range     = ns.utils.search.range;
local hilite        = ns.utils.text.hilite_and_replace;
local links         = ns.utils.text.links_list;
local invite        = ns.utils.frame.invite;
local login_message = ns.utils.text.login_message;
local potd_message  = ns.utils.text.potd_message;

-- -------------------------------------------------------------------------------------------------------------------
-- Processing commands for the custom filter
-- -------------------------------------------------------------------------------------------------------------------
local function filter_cmd(cmd, params)

  -- /bora show -- current filter ------------------------------------------------------------------------------------
  if cmd == "show" and ns.db.custom_filter
     then   print(fmt("%s Current custom filter: [%s] (%s match%s)", 
                      C.BORA, ns.db.custom_filter.rule, 
                      ns.db.custom_filter.count, es(ns.db.custom_filter.count))); 
            return;
     elseif cmd == "show" then print(fmt("%s No filter set.", C.BORA)); 
            return; 
     end;

  -- /bora set -- new filter -----------------------------------------------------------------------------------------
  if cmd == "set" 
     then local newfilter = via_search(params, true); 
          if newfilter -- get a new filter
             then print(fmt("%s Setting custom filter to: [%s] (%s match%s)", C.BORA, 
                        newfilter.rule, newfilter.count, es(newfilter.count)));
                  ns.db.custom_filter = newfilter;
                  -- if we don't have the filter turned on, the turn it on
                  if not ns.db.show_custom then ns.db.show_custom = true end; 
                  -- tell HandyNotes it's time to update
                  ns.HL:SendMessage("HandyNotes_NotifyUpdate", myname:gsub("HandyNotes_", ""))
                  return;
             else print(fmt("%s Custom filter not set.", C.BORA)); return;
             end;
     end;

  -- /bora clear -- clear the filter ---------------------------------------------------------------------------------
  if cmd == "clear" 
     then print(fmt("%s Filter cleared.", C.BORA));
          ns.db.custom_filter = nil;
          ns.last_filter      = nil;
          -- tell HandyNotes it's time to update
          ns.HL:SendMessage("HandyNotes_NotifyUpdate", myname:gsub("HandyNotes_", ""))
          return;
     end;

  -- /bora showlast -- show us the last search -----------------------------------------------------------------------
  if cmd == "showlast" and ns.last_filter
     then   print(fmt("%s Last search: [%s] (%s match%s)", 
                      C.BORA, ns.last_filter.rule, 
                      ns.last_filter.count, es(ns.last_filter.count))); return;
     elseif cmd == "showlast" 
     then   print(fmt("%s %sYou don't have a search to save.", C.BORA, C.COLOR.GRAY));       return;
     end;

  -- /bora setlast -- set the filter to the last search --------------------------------------------------------------
  if cmd == "setlast" and ns.last_filter 
     then print(fmt("%s %sSetting custom filter to:|r [%s] (%s match%s)",
                     C.BORA, C.COLOR.GRAY, ns.last_filter.rule,
                     ns.last_filter.count, es(ns.last_filter.count)));
          ns.db.custom_filter = ns.last_filter;
          -- if we don't have the filter turned on, the turn it on
          if not ns.db.show_custom then ns.db.show_custom = true end; 
          -- tell HandyNotes it's time to update
          ns.HL:SendMessage("HandyNotes_NotifyUpdate", myname:gsub("HandyNotes_", ""))
          return;
     elseif cmd == "setlast" then print(fmt("%s %sYou don't have a previous search to save.", C.BORA, C.COLOR.GRAY)); return
     end; -- if 

  -- /bora toggle -- turn the custom filter on or off ----------------------------------------------------------------
  if cmd == "toggle" then
     print(fmt("%s %sctivating|r %sthe custom filter.", C.BORA, ns.db.show_custom and "Dea" or "A", C.COLOR.GRAY));
     -- switch the setting
     ns.db.show_custom = not ns.db.show_custom;
     -- tell HandyNotes it's time to update
     ns.HL:SendMessage("HandyNotes_NotifyUpdate", myname:gsub("HandyNotes_", "")); return;
     end; -- if
end; -- function

-- -------------------------------------------------------------------------------------------------------------------
-- There were older /bora[whatever] commands that are now obsolete
-- -------------------------------------------------------------------------------------------------------------------
local function obsolete(param)
    print(fmt("%s %sThe |r%s%s%s%s command is being phased out.",
               C.BORA, C.COLOR.GRAY, C.COLOR.APP, C.SLASH_BORA, param or "", C.COLOR.GRAY), 
          fmt("Please use |r%s%s %s|r%s from now on, thanks!",
               C.COLOR.YELLOW, C.SLASH_BORA, param or "", C.COLOR.GRAY));
end; -- function

-- -------------------------------------------------------------------------------------------------------------------
-- The main /bora processor
-- -------------------------------------------------------------------------------------------------------------------
local function slashBora(a)
  local params = split(a, " "); -- split on words
  local cmd = params[1] or nil;
  local arg = params[2] or nil;

  if cmd then cmd = string.lower(cmd) end;
  if arg then arg = string.lower(arg) end;

  -- /bora help -- or just /bora -----------------------------------------------------------------------------------
  if not cmd or cmd == "help" then print(fmt("%s %s", C.BORA, hilite(C.HELP))) return end;

  -- preprocessing to add "s" as an option, e.g /bora bars ---------------------------------------------------------
  local cmds = cmd .. "s"; local cmdsflag = string.gsub(cmd, ":", "s:");

  -- /bora config -- open the HandyNotes configuration screen ------------------------------------------------------
  if cmd == "config" then LibStub("AceConfigDialog-3.0"):Open("HandyNotes", nil, "plugins") return; end;

  -- /bora version -- show use the login message -------------------------------------------------------------------
  if cmd == "version" then print(login_message()) return end;

  -- /bora potd (or sotd because I forget sometimes) -- show the point of the day ----------------------------------
  if cmd == "potd" or cmd == "sotd" or cmd == "daily" or cmd == "today" then print(potd_message()) return end;

  -- /bora inv[vite[s]] or /bora link[s] ---------------------------------------------------------------------------
  if cmd == "inv"  or cmd == "invite" or cmd == "invites" or 
     cmd == "link" or cmd == "links"
     then if arg == "borarp"  or arg == "rp"     then invite("BoraRP");
      elseif arg == "portrp"  or arg == "port"   then invite("LKT");
      elseif arg == "lkt"     or arg == "kt"     then invite("LKT");
      elseif arg == "living"                     then invite("LKT");
      elseif arg == "wra"                        then invite("LKT");
      elseif arg == "discord"                    then invite("Discord");
      elseif arg == "events"                     then invite("Events");
      elseif arg == "twitter"                    then invite("Twitter");
      elseif arg == "rpspots" or arg == "addon"  or 
             arg == "spots"   or arg == "notes"  or
             arg == "handynotes"                 then invite("RPSpots");
      elseif arg == "site"    or arg == "city"   or 
             arg == "web"     or arg == "tumblr" then invite("City");
      else print(fmt("%s %s", C.BORA, hilite(links())))
      end;
      return;
     end;

  -- /bora cat[[egorie]s]] -- /bora list -- list the predef categories----------------------------------------------
  if cmd == "cat" or cmd == "cats" or cmd == "categories" or cmd == "list"
     then category_info(arg) return end;
       
  -- /bora nearby [range] -- spots within range --------------------------------------------------------------------
  if        cmd == "nearby" and arg then via_range(arg) return;
     elseif cmd == "nearby"         then via_range()    return;
     elseif cmd == "range"          then via_range()    return;
     elseif cmd == "range"  and arg then via_range(arg) return;
     end;

  -- /bora find -- /bora search -- just an alias for searching normally --------------------------------------------
  if cmd == "find" or cmd == "search" then table.remove(params, 1); via_search(params) return end;

  -- /bora coords -- our current location and zone -----------------------------------------------------------------
  if cmd == "coords" 
     then print(fmt("%s %sYou are currently at [|r%s%s|r%s] in zone [%s%s|r]", 
                    C.BORA, C.COLOR.GRAY, C.COLOR.YELLOW, utils.coords.get(), 
                    C.COLOR.GRAY, C.COLOR.YELLOW, utils.coords.zone())); return 
     end; -- if

  -- /bora [filter commands] -- show, set, setlast, clear, toggle, -------------------------------------------------
  if        cmd == "show"            then filter_cmd("show")  return
     elseif cmd == "set" and not arg then print(fmt("%s %sYou need to enter at least one criterion.", C.BORA, C.COLOR.GRAY)); return
     elseif cmd == "set"             then table.remove(params, 1); filter_cmd("set", params);                 return
     elseif cmd == "setlast"         then filter_cmd("setlast")                                               return
     elseif cmd == "save"            then filter_cmd("setlast")                                               return 
     elseif cmd == "savelast"        then filter_cmd("setlast")                                               return 
     elseif cmd == "last"            then filter_cmd("showlast")                                              return
     elseif cmd == "clear"           then filter_cmd("clear")                                                 return
     elseif cmd == "toggle" or cmd == "togg" or cmd == "tog" then filter_cmd("toggle")                        return
     end;

  -- /bora [category] -- check if there is a category search already -----------------------------------------------
  if        CAT[cmd]      and not arg then via_category(cmd)      return
     elseif CAT[cmds]     and not arg then via_category(cmds)     return
     elseif CAT[cmdsflag] and not arg then via_category(cmdsflag) return
     end; -- if

  -- /bora [number] -- assume it's a range -------------------------------------------------------------------------
  if        arg == C.RANGE.UNITS and tonumber(cmd) then via_range(tonumber(cmd)) return 
     elseif                          tonumber(cmd) then via_range(tonumber(cmd)) return
     end;

  -- /bora [text] -- if nothing matches then use the text search
  via_search(params);

end; -- function

-- -------------------------------------------------------------------------------------------------------------------
-- Register slash commands
-- -------------------------------------------------------------------------------------------------------------------
SLASH_BORA1        = C.SLASH_BORA;              SlashCmdList["BORA"]        = function(a) slashBora(a);       end;
-- -------------------------------------------------------------------------------------------------------------------

