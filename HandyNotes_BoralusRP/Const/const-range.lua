local myname, ns = ...

if not ns.CONST       then ns.CONST       = {}; end;
if not ns.CONST.RANGE then ns.CONST.RANGE = {}; end;

local C = ns.CONST;
C.RANGE = { DEFAULT = 100, MIN = 5, MAX = 500, UNIT = "yard", UNITS = "yards", };
