local myname, ns = ...

local HandyNotes = LibStub("AceAddon-3.0"):GetAddon("HandyNotes")
local HL = LibStub("AceAddon-3.0"):NewAddon(myname, "AceEvent-3.0")
ns.HL = HL

local login_message           = ns.utils.text.login_message;
local potd_message            = ns.utils.text.potd_message;
local get_point_info_by_coord = ns.utils.coords.get_info;
local get_point_info          = ns.utils.points.get_info;
local handle_tooltip_by_coord = ns.utils.coords.tt;

local path_meta = {__index = {
    label = "Path to treasure",
    atlas = "map-icon-SuramarDoor.tga", -- 'PortalPurple'
    path = true,
    scale = 1.1,
}}
local path = function(details)
    return setmetatable(details or {}, path_meta)
end
ns.path = path

local merge = function(t1, t2)
    if not t2 then return t1 end
    for k, v in pairs(t2) do
        t1[k] = v
    end
end
ns.merge = merge

local next            = next
local GameTooltip     = GameTooltip
local WorldMapTooltip = WorldMapTooltip
-- local HandyNotes      = HandyNotes
local cache_tooltip   = CreateFrame("GameTooltip", "HNBoralusRPTooltip")

cache_tooltip:AddFontStrings(
    cache_tooltip:CreateFontString("$parentTextLeft1",  nil, "GameTooltipText"),
    cache_tooltip:CreateFontString("$parentTextRight1", nil, "GameTooltipText")
)

---------------------------------------------------------
-- Plugin Handlers to HandyNotes
local HLHandler = {}
local info = {}

function HLHandler:OnEnter(uiMapID, coord)
    local tooltip = self:GetParent() == WorldMapFrame:GetCanvas() and WorldMapTooltip or GameTooltip
    if self:GetCenter() > UIParent:GetCenter() then -- compare X coordinate
        tooltip:SetOwner(self, "ANCHOR_LEFT")
    else
        tooltip:SetOwner(self, "ANCHOR_RIGHT")
    end
    handle_tooltip_by_coord(tooltip, uiMapID, coord)
end

local function createWaypoint(_, uiMapID, coord)
    if TomTom then
        local x, y = HandyNotes:getXY(coord)
        TomTom:AddWaypoint(uiMapID, x, y, {
            title = get_point_info_by_coord(uiMapID, coord),
            persistent = nil,
            minimap = true,
            world = true
        })
    end
end

local function closeAllDropdowns()
    CloseDropDownMenus(1)
end

do
    local currentZone, currentCoord
    local function generateMenu(_, level)
        if (not level) then return end
        wipe(info)
        if (level == 1) then
            -- Create the title of the menu
            info.isTitle      = 1
            info.text         = "HandyNotes - " .. myname:gsub("HandyNotes_", "")
            info.notCheckable = 1
            UIDropDownMenu_AddButton(info, level)
            wipe(info)

            if TomTom then
                -- Waypoint menu item
                info.text = "Create waypoint"
                info.notCheckable = 1
                info.func = createWaypoint
                info.arg1 = currentZone
                info.arg2 = currentCoord
                UIDropDownMenu_AddButton(info, level)
                wipe(info)
            end

            -- Close menu item
            info.text         = "Close"
            info.func         = closeAllDropdowns
            info.notCheckable = 1
            UIDropDownMenu_AddButton(info, level)
            wipe(info)
        end
    end
    local HL_Dropdown = CreateFrame("Frame", myname.."DropdownMenu")
    HL_Dropdown.displayMode = "MENU"
    HL_Dropdown.initialize = generateMenu

    function HLHandler:OnClick(button, down, uiMapID, coord)
        currentZone = uiMapID
        currentCoord = coord
        if button == "RightButton" and not down then
            ToggleDropDownMenu(1, nil, HL_Dropdown, self, 0, 0)
        end
    end
end

function HLHandler:OnLeave(uiMapID, coord)
    if self:GetParent() == WorldMapFrame:GetCanvas() then
        WorldMapTooltip:Hide()
    else
        GameTooltip:Hide()
    end
    ShoppingTooltip1:Hide()
end

do
    -- This is a custom iterator we use to iterate over every node in a given zone
    local currentZone, isMinimap
    local function iter(t, prestate)
        if not t then return nil end
        local state, value = next(t, prestate)
        while state do -- Have we reached the end of this zone?
            if value and ns.utils.points.show(state, value, currentZone, isMinimap) then
                local _, icon, _, _, _, scale, alpha = get_point_info(value)
                scale = (scale or 1) * (icon and icon.scale or 1) * ns.db.icon_scale
                return state, nil, icon, scale, ns.db.icon_alpha * alpha
            end
            state, value = next(t, state) -- Get next data
        end
        return nil, nil, nil, nil
    end
    function HLHandler:GetNodes2(uiMapID, minimap)
        -- Debug("GetNodes2", uiMapID, minimap)
        currentZone = uiMapID
        isMinimap = minimap
        return iter, ns.points[uiMapID], nil
    end
end

---------------------------------------------------------
-- Addon initialization, enabling and disabling

function HL:OnInitialize()
    -- Set up our database
    self.db   = LibStub("AceDB-3.0"):New(myname.."DB", ns.defaults)
    ns.db     = self.db.profile
    ns.hidden = self.db.char.hidden

    -- Initialize our database with HandyNotes
    HandyNotes:RegisterPluginDB(myname:gsub("HandyNotes_", ""), HLHandler, ns.options)

    if ns.db.print_login_message then print(login_message()); end;
    if ns.db.print_potd_message  then print(potd_message());  end;

    self:RegisterEvent("ZONE_CHANGED_INDOORS",  "Refresh")
    self:RegisterEvent("ZONE_CHANGED",          "Refresh")
    self:RegisterEvent("ZONE_CHANGED_NEW_AREA", "Refresh")

end

function HL:Refresh() self:SendMessage("HandyNotes_NotifyUpdate", myname:gsub("HandyNotes_", "")) end;
