local myname, ns = ...

if not ns.CONST       then ns.CONST       = {}; end;

local C         = ns.CONST;
local fmt       = string.format;
local meta      = GetAddOnMetadata;

C.ZONES         =
  { BORALUS     = 1161,
    DRUSTVAR    = 896,
    NAZMIR      = 863,
    STORMSONG   = 942,
    TIRAGARDE   = 895, 
    VOLDUN      = 864,
    ZULZADAR    = 862,
  };

C.ZONENAMES     = 
  { [ 862]      = "Zuldazar",
    [ 863]      = "Nazmir",
    [ 864]      = "Vol'dun",
    [ 895]      = "Tiragarde Sound",
    [ 896]      = "Drustvar",
    [ 942]      = "Stormsong Valley",
    [1161]      = "Boralus",
  };

C.ZONE          = C.ZONES.BORALUS;

C.APPNAME       = "Boralus RP Spots";
C.VERSION       = meta("HandyNotes_BoralusRP", "Version");
C.SLASH_BORA    = "/bora";
C.INDENT        = "     "; -- five spaces

C.BORA          = fmt("[%s%s|r]", C.COLOR.APP, C.APPNAME);
C.SLASH         = fmt("%s%s|r",   C.COLOR.ORANGE, C.SLASH_BORA);

C.HELP          = [==[[=Search Commands=]
SLASH [text] ((text)) ((...)) - Search the database, can be predefined or text search
SLASH [[list]] ((category)) - List predefined criteria 
SLASH [[last]] - Show your most recent successful search 
SLASH [[nearby]] ((range)) - Show nearby spots

[=Filtering Commands=]
SLASH [[set]] [text] ((text)) ((...)) - Set your custom filter 
SLASH [[show]]/[[clear]] - Show or clear your current custom filter 
SLASH [[setlast]] - Set your custom filter to your last search 

[=Miscellaneous Commands=]
SLASH [[today]] - Today's Spot of the Day
SLASH [[link]] [City/Addon/Twitter] - Copy/paste a web link
SLASH [[inv]] [BoraRP/Discord/LKT] - Copy/paste an invite code
SLASH [[config]] - Configure APPNAME ]==];

