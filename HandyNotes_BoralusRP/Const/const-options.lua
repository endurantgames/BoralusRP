-- -------------------------------------------------------------------------------------------------------------------
-- options: Settings and defaults
--

-- setup -------------------------------------------------------------------------------------------------------------
local myname, ns = ...

-- default value table -----------------------------------------------------------------------------------------------
ns.defaults = {
    profile = {
        show_on_city = true,
        show_on_minimap = false,
        show_on_kultiras = true,

        show_bars = true,
        show_food = false,
        show_shops = false,
        show_ships = true,
        show_misc = false,
        show_spoilers = false,
        show_alliance = false,

        use_custom = false,
        custom_filter = nil,

        hide_closed = true,
        hide_empty = false,
        hide_novendor = true,
        hide_hostile = false,

        display_conjecture = true,
        display_unknown = false,

        range_default = 50,

        icon_scale = 1.0,
        icon_alpha = 1.0,

        print_login_message = true,
        print_potd_message = true,
    },
    char = {
        hidden = {
            ['*'] = {},
        },
    },
}

-- options table -----------------------------------------------------------------------------------------------------
ns.options = {
  type = "group",
  name = myname:gsub("HandyNotes_", ""),
  desc = GetAddOnMetadata(myname, "Notes"),
  get = function(info)    return ns.db[info[#info]]                                                                           end,
  set = function(info, v) ns.db[info[#info]] = v ns.HL:SendMessage("HandyNotes_NotifyUpdate", myname:gsub("HandyNotes_", "")) end,
  args = {
    -- ------------------------------------------------------------------------------------------------------------------------------------------------
    icon = { type = "group", name = "Icon settings", inline = true, order = 100,
      args = {
        desc       = { name = "These settings control the look and feel of the Boralus RP Spots icons.", type = "description", order = 110, },
        icon_scale = { type = "range", name = "Icon Scale", order = 120, desc = "The scale of the icons", min = 0.25, max = 2, step = 0.01, },
        icon_alpha = { type = "range", name = "Icon Alpha", order = 130, desc = "The alpha transparency of the icons", min = 0, max = 1, step = 0.01, }, 
      }, },
    -- ------------------------------------------------------------------------------------------------------------------------------------------------
    maps = { type = "group", name = "Map selections", inline = true, order = 200,
      args = {
        desc             = { name = "Choose maps on which to display icons.", type = "description", order = 210, },
        show_on_city     = { type = "toggle", name = "Boralus Map",    order = 220, desc = "Show icons on city map",                 },
        show_on_minimap  = { type = "toggle", name = "Minimap",        order = 230, desc = "Show icons on the minimap",              },
        show_on_kultiras = { type = "toggle", name = "Kul Tiras Maps", order = 240, desc = "Show icons on nearby maps in Kul Tiras", }, 
      }, },
    -- ------------------------------------------------------------------------------------------------------------------------------------------------
    custom = { type = "group", name = "Custom Filter", inline = true, order = 300,
      args  = { 
        desc        = { name = "You set the custom filter with /bora commands.", type = "description", order = 310, },
        show_custom = { type = "toggle", name = "Use Custom Filter", order= 320, desc = "The custom filter takes priority over other settings", },
        another_desc = { name = "You can use /bora nearby to search for nearby RP spots.", type = "description", order = 325, },
        range_default = { type = "range", name = "Default Range", order = 330, desc = "The default range for /bora nearby searches",
                          min = 5, max = 100, step = 5, };
      }, }, 
    -- ------------------------------------------------------------------------------------------------------------------------------------------------
    show = { type = "group", name = "Location Types", inline = true, order = 400,
      args = {
        desc          = { name = "These are locations to display when the custom filter is inactive.", type = "description", order = 410, },
        show_bars     = { type = "toggle", name = "Bars/Taverns",  order = 420, desc = "Show bars and taverns",                                   },
        show_food     = { type = "toggle", name = "Food",          order = 430, desc = "Show restaurants, food stalls, and others places to eat", },
        show_shops    = { type = "toggle", name = "Shopping",      order = 440, desc = "Show places you can go shopping",                         },
        show_ships    = { type = "toggle", name = "Ships",         order = 450, desc = "Show ships and boats",                                    }, 
        show_alliance = { type = "toggle", name = "War Effort",    order = 460, desc = "Show representatives of the Alliance war effort",         },
        show_spoilers = { type = "toggle", name = "Spoilers",      order = 470, desc = "Show hints for quests, achievements, and puzzles",        },
        show_misc     = { type = "toggle", name = "Miscellaneous", order = 499, desc = "Show everything else",                                    },
      }, },
    -- ------------------------------------------------------------------------------------------------------------------------------------------------
    hide = { type = "group", name = "Locations to hide", inline = true, order = 500,
      args = { 
        desc          = { name = "You can filter these locations out of the default display.", type = "description", order = 510, }, 
        hide_empty    = { type = "toggle", name = "Hide Empty Buildings",  order = 520, desc = "Only show buildings with people in them", },
        hide_closed   = { type = "toggle", name = "Hide Closed Buildings", order = 530, desc = "Only show buildings that have open doors", }, 
        hide_novendor = { type = "toggle", name = "Hide No-Vendor Shops",  order = 540, desc = "Only show shops or bars that have a vendor that can be interacted with", },
        hide_hostile  = { type = "toggle", name = "Hide Unsafe Locations", order = 550, desc = "Only show locations without hostile NPCs around", },
      }, }, 
    -- ------------------------------------------------------------------------------------------------------------------------------------------------
    display = { type = "group", name = "Unofficial names", inline = true, order = 600,
      args = {
        desc               = { name = "Unofficial names are those assigned by the app creator. How do you want to handle those?", type = "description", order = 610, },
        display_conjecture = { type = "toggle", name = "Identify Conjecture", desc = "Display an asterisk next to unofficial names", order = 620, },
        display_unknown = { type = "toggle", name = "No Unofficial Names", desc = "Display 'Unknown' instead of unofficial names", order = 630, },
      }, },
    -- ------------------------------------------------------------------------------------------------------------------------------------------------
    messages = { type = "group", name = "Login messages", inline = true, order = 700,
      args = {
        desc                = { name = "Choose which messages to display when you log on.", order = 710, type = "description", },
        print_login_message = { type = "toggle", name = "Standard Message", desc = "Print the message listing how to access /bora help", order = 720, },
        print_potd_message = { type = "toggle", name = "Spot of the Day", desc = "Print the spot of the day", order = 730, },
      }, },
    -- ------------------------------------------------------------------------------------------------------------------------------------------------
  }, -- args
}; -- options
 
