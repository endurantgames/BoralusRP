-- -------------------------------------------------------------------------------------------------------------------
-- utils-text: Utilities for manipulating text
--

-- setup -------------------------------------------------------------------------------------------------------------
local myname, ns = ...

if not ns.utils then ns.utils = {} end;
if not ns.utils.text then ns.utils.text = {} end;
local C = ns.CONST;
local fmt = string.format;

-- split text on a pattern -------------------------------------------------------------------------------------------
local function split(str, pat)
      local t          = {};
      local fpat       = "(.-)" .. pat;
      local last_end   = 1;
      local s, e, cap  = str:find(fpat, 1)
      while s do if s ~= 1 or cap ~= ""
                    then table.insert(t,cap);
                 end -- if
                 last_end  = e+1;
                 s, e, cap = str:find(fpat, last_end);
              end -- while/do
      if last_end <= #str
         then cap = str:sub(last_end);
              table.insert(t, cap);
         end -- if
      return t;
end; 

-- add plurals -------------------------------------------------------------------------------------------------------
local function es(n)          if n == 1 then return "" else return "es"       end; end;
local function ss(n)          if n == 1 then return "" else return  "s"       end; end;
local function plur(n, s, e)  if e then return fmt("%s %s%s", n, s, es(n))
                                   else return fmt("%s %s%s", n, s, ss(n)) end; end; 

-- add hilites and replace text---------------------------------------------------------------------------------------
local function hilite_and_replace(s)
  return s:gsub("SLASH",   C.SLASH)                                    -- slash commands
          :gsub("%[=",     C.COLOR.GREEN .. "- "):gsub("%=]", " -|r") -- headlines
          :gsub("%[%[",    C.COLOR.ORANGE):gsub("%]%]", "|r")          -- hilites
          :gsub("%[",      C.COLOR.YELLOW .. "%["):gsub("%]", "%]|r")  -- parameters
          :gsub("%(%(",    C.COLOR.GRAY .. "%["):gsub("%)%)", "%]|r")  -- optional parameters
          :gsub("APPNAME", C.APPNAME);                                 -- name of the app
end;

-- color a string with an rgb tuple -- colorize("text", 0.5, 0.5, 1) -------------------------------------------------
local function colorize(s, r, g, b)

      if r <= 1 then r = math.floor(r * 255); end;
      if g <= 1 then g = math.floor(g * 255); end;
      if b <= 1 then b = math.floor(b * 255); end;

      return string.format("|cff%02x%02x%02x%s|r", r, g, b, s)
end;

-- format the login message ------------------------------------------------------------------------------------------
local function login_message()
  return string.format(
           "[%s%s|r] v%s loaded. See %s%s|r for help.", 
           C.COLOR.APP, 
           C.APPNAME, 
           C.VERSION, 
           C.COLOR.APP, 
           C.SLASH_BORA);
end;

-- format the links list ---------------------------------------------------------------------------------------------

local function links_list()

   return hilite_and_replace(C.LINK.Help);

end; 

-- format the point of the day ---------------------------------------------------------------------------------------
local function potd_message()
  local date_table = date("*t");
  local yday = date_table.yday;
  local num_index = #ns.index.BORALUS;
  local iday = 1 + (yday % num_index);
  local point_index = ns.index.BORALUS[iday];
  local point = ns.points[C.ZONE][point_index];

  return string.format(
           "[%s%s|r] %sSpot of the Day:|r %s %s[#%s of %s]|r",
           C.COLOR.APP, 
           C.APPNAME, 
           C.COLOR.GRAY, 
           ns.utils.points.format(point_index, point), 
           C.COLOR.GRAY, 
           iday, 
           num_index);
end;

-- -------------------------------------------------------------------------------------------------------------------
-- exported functions
--
--
ns.utils.text.es                 = es;
ns.utils.text.ss                 = ss;
ns.utils.text.plur               = plur;
ns.utils.text.fmt                = string.format;
ns.utils.text.hilite_and_replace = hilite_and_replace;
ns.utils.text.login_message      = login_message;
ns.utils.text.potd_message       = potd_message;
ns.utils.text.split              = split;
ns.utils.text.colorize           = colorize;
ns.utils.text.links_list         = links_list;
