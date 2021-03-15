local myname, ns = ...

if not ns.CONST       then ns.CONST       = {}; end;
if not ns.CONST.LINK  then ns.CONST.LINK  = {}; end;

local C         = ns.CONST;
local fmt       = string.format;
local meta      = GetAddOnMetadata;

local invite_base    = "https://worldofwarcraft.com/en-us/invite/%s?region=US&faction=Alliance";

C.LINK.City_Prefix  = "http://boralus.city";
C.LINK.City         = "";
C.LINK.City_URL     = "http://boralusrp.tumblr.com";
C.LINK.City_Label   = "Boralus.City Tumblr";
C.LINK.City_Help    = fmt("SLASH [[link City]] - %s - [%s%s]", C.LINK.City_Label, C.LINK.City_Prefix, C.LINK.City);

C.LINK.BoraRP       = "/join";
C.LINK.BoraRP_Code  = "m4PpXPGhxn4";
C.LINK.BoraRP_URL   = fmt(invite_base, C.LINK.BoraRP_Code);
C.LINK.BoraRP_Label = "BoraRP Community (US)";
C.LINK.BoraRP_Help  = fmt("SLASH [[invite BoraRP]] - %s - [%s]", C.LINK.BoraRP_Label, C.LINK.BoraRP_Code);

C.LINK.Discord      = "/discord";
C.LINK.Discord_Code = "XKx4mq3";
C.LINK.Discord_URL  = "https://discord.gg/XKx4mq3/";
C.LINK.Discord_Label = "Living Kul Tiras Discord";
C.LINK.Discord_Help = fmt("SLASH [[invite LKT]] - %s - [%s]", C.LINK.Discord_Label, C.LINK.Discord_Code);

C.LINK.LKT          = "/lkt";
C.LINK.LKT_Code     = "D23KZVAf5Zd";
C.LINK.LKT_URL      = fmt(invite_base, C.LINK.LKT_Code);
C.LINK.LKT_Label    = "Living Kul Tiras (WRA-US)";
C.LINK.LKT_Help     = fmt("SLASH [[invite LKT]] - %s - [%s]", C.LINK.LKT_Label, C.LINK.LKT_Code);

C.LINK.RPSpots      = "/addon";
C.LINK.RPSpots_URL  = "https://wow.curseforge.com/projects/handynotes-boralus-rp-spots";
C.LINK.RPSpots_Label = "HandyNotes: Boralus RP Spots";
C.LINK.RPSpots_Help = fmt("SLASH [[link Addon]] - %s - [%s%s]", C.LINK.RPSpots_Label, C.LINK.City_Prefix, C.LINK.RPSpots);

C.LINK.Twitter      = "/twitter";
C.LINK.Twitter_URL  = "http://twitter.com/pictureboralus";
C.LINK.Twitter_Label = "Picturesque Boralus";
C.LINK.Twitter_Help = fmt("SLASH [[link Twitter]] - %s - [%s%s]", C.LINK.Twitter_Label, C.LINK.City_Prefix, C.LINK.Twitter);

C.LINK.Links = C.LINK.City_Help    .. "\n" ..
               C.LINK.RPSpots_Help .. "\n" .. 
               C.LINK.Twitter_Help;

C.LINK.Invites = C.LINK.BoraRP_Help   .. "\n" ..
                 C.LINK.LKT_Help      .. "\n" ..
                 C.LINK.Discord_Help; 

C.LINK.output_format =  [==[
[=Invite Codes=]
%s

[=Web Links=]
%s
]==];

C.LINK.Help = fmt(C.LINK.output_format, C.LINK.Invites, C.LINK.Links);

C.LINK.instruct_both = "\nCopy the code or URL field, then paste it into the Join Community field or your web browser.";
C.LINK.instruct_code = "\nCopy the code, then paste it into the Join Community field.";
C.LINK.instruct_url  = "\nCopy the URL, then paste it into your web browser.";

