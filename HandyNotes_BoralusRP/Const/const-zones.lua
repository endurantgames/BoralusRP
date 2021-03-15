local myname, ns = ...

local C         = ns.CONST;

if not ns.CONST       then ns.CONST       = {}; end;

C.ZONES         =
  { BORALUS     = 1161,
    DRUSTVAR    = 896,
    NAZMIR      = 863,
    STORMSONG   = 942,
    TIRAGARDE   = 895, 
    VOLDUN      = 864,
    ZULZADAR    = 862,
    TOLDAGOR    = 1169,
  };

C.ZONENAMES     = 
  { [ 862]      = "Zuldazar",
    [ 863]      = "Nazmir",
    [ 864]      = "Vol'dun",
    [ 895]      = "Tiragarde Sound",
    [ 896]      = "Drustvar",
    [ 942]      = "Stormsong Valley",
    [1161]      = "Boralus",
    [1169]      = "Tol Dagor",
  };

C.ZONE          = C.ZONES.BORALUS;

