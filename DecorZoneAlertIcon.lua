-- DecorZoneAlertIcon.lua
-- Xal's Emporium - a floating house icon, separate from the fixed minimap
-- button, that appears (with a glow) when the zone you're standing in has
-- decor you're missing and can go get right now.
--
-- Unlike Reins' equivalent icon, this one is ONLY ever shown when the current
-- zone genuinely has something missing - there's no "always show" reminder
-- setting, since Emporium has no last-worked-on concept to keep it up for.
--
-- Left-click opens the Decor Collection filtered to this zone; right-click
-- opens options - same convention as the minimap button.
--
-- The glow is copied exactly from Quest Compass's/Reins' own floating alert
-- icon (Interface\Cooldown\star4, ADD blend, 1.875x the icon, Brand.ACCENT,
-- 0.35-0.85 alpha bounce over 1.1s) so it reads as the same visual language
-- across addons.

local addonName, addonTable = ...
addonTable.DecorZoneAlertIcon = addonTable.DecorZoneAlertIcon or {}
local Alert     = addonTable.DecorZoneAlertIcon
local Brand     = addonTable.BrandStyle
local DecorData = addonTable.DecorData

local ICON_SIZE = 40
local DEFAULT_X, DEFAULT_Y = -250, 260
local ICON_PATH = "Interface\\AddOns\\XalsEmporium\\Textures\\MinimapIcon_House1.png"

local icon

-- Any missing decor item whose sourceText names the zone you're standing in
-- right now, or nil.
local function ZoneDecorEntry()
    local roster = DecorData:Ensure()
    if not roster then return nil end

    local zoneNames = DecorData:CurrentZoneNames()
    for i = 1, #roster do
        local entry = roster[i]
        if not entry.isOwned and DecorData:MatchesCurrentZone(entry, zoneNames) then
            return entry
        end
    end
    return nil
end

-- Xal's Keep installed: the Keep's rook is the one zone alert for the whole
-- collection suite. This icon never shows; the rook asks how many decor
-- items you're missing in this zone, using the same match as above.
local function ZoneDecorCount()
    local roster = DecorData:Ensure()
    if not roster then return 0 end

    local zoneNames = DecorData:CurrentZoneNames()
    local n = 0
    for i = 1, #roster do
        local entry = roster[i]
        if not entry.isOwned and DecorData:MatchesCurrentZone(entry, zoneNames) then
            n = n + 1
        end
    end
    return n
end

if XalsKeep and XalsKeep.RegisterZoneCount then
    XalsKeep:RegisterZoneCount("emporium", ZoneDecorCount)
end

local function BuildIcon()
    if icon then return icon end

    local f = CreateFrame("Button", "XalsEmporiumZoneAlertIcon", UIParent)
    f:SetSize(ICON_SIZE, ICON_SIZE)
    f:SetFrameStrata("MEDIUM")
    f:SetMovable(true)
    f:EnableMouse(true)
    f:RegisterForDrag("LeftButton")
    f:RegisterForClicks("LeftButtonUp", "RightButtonUp")

    local pos = type(XalsEmporiumDB) == "table" and XalsEmporiumDB.zoneIconPos or nil
    if pos and pos.x then
        f:SetPoint("CENTER", UIParent, "CENTER", pos.x, pos.y)
    else
        f:SetPoint("CENTER", UIParent, "CENTER", DEFAULT_X, DEFAULT_Y)
    end
    f:SetScale((type(XalsEmporiumDB) == "table" and XalsEmporiumDB.zoneIconScale) or 1)

    -- No circular backing/border - just the bare house art, matching Reins'
    -- locked design. Glow sits behind it, additive-blended so it reads as
    -- light rather than a flat colored shape.
    local glow = f:CreateTexture(nil, "BACKGROUND")
    glow:SetTexture("Interface\\Cooldown\\star4")
    glow:SetBlendMode("ADD")
    glow:SetSize(ICON_SIZE * 1.875, ICON_SIZE * 1.875)
    glow:SetPoint("CENTER")
    glow:SetVertexColor(Brand.ACCENT[1], Brand.ACCENT[2], Brand.ACCENT[3])
    f.glow = glow

    local glowAnim = glow:CreateAnimationGroup()
    glowAnim:SetLooping("BOUNCE")
    local glowAlpha = glowAnim:CreateAnimation("Alpha")
    glowAlpha:SetFromAlpha(0.35)
    glowAlpha:SetToAlpha(0.85)
    glowAlpha:SetDuration(1.1)
    glowAlpha:SetSmoothing("IN_OUT")
    f.glowAnim = glowAnim

    local tex = f:CreateTexture(nil, "ARTWORK")
    tex:SetAllPoints()
    tex:SetTexCoord(0.07, 0.93, 0.07, 0.93)
    tex:SetTexture(ICON_PATH)

    f:SetScript("OnDragStart", function(self) self:StartMoving() end)
    f:SetScript("OnDragStop", function(self)
        self:StopMovingOrSizing()
        local cx, cy = self:GetCenter()
        local ux, uy = UIParent:GetCenter()
        if type(XalsEmporiumDB) == "table" then
            XalsEmporiumDB.zoneIconPos = { x = cx - ux, y = cy - uy }
        end
    end)

    f:SetScript("OnClick", function(self, button)
        if button == "RightButton" then
            -- The closest actual item, not options - options is redundant
            -- with the minimap button, and the whole point of this icon is
            -- "show me what's here."
            local closest = DecorData:ClosestZoneEntry()
            if closest and addonTable.DecorDetail then
                addonTable.DecorDetail:Show(closest)
            end
        else
            if addonTable.CollectionWindow and addonTable.CollectionWindow.ShowZoneOnly then
                addonTable.CollectionWindow:ShowZoneOnly()
            end
        end
    end)

    f:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetText("Xal's Emporium", Brand.ACCENT[1], Brand.ACCENT[2], Brand.ACCENT[3])
        GameTooltip:AddLine("|cff999999Left-click:|r decor you can get in this zone")
        GameTooltip:AddLine("|cff999999Right-click:|r the closest item")
        GameTooltip:Show()
    end)
    f:SetScript("OnLeave", function() GameTooltip:Hide() end)

    icon = f
    return f
end

local function IsEnabled()
    return type(XalsEmporiumDB) ~= "table" or XalsEmporiumDB.zoneAlertDisabled ~= true
end

-- Backing the Options checkbox.
function Alert:SetEnabled(enabled)
    if type(XalsEmporiumDB) == "table" then
        XalsEmporiumDB.zoneAlertDisabled = not enabled
    end
    self:UpdateVisibility()
end

-- Backing the Options "Icon size" slider.
function Alert:ApplyScale()
    if icon then
        icon:SetScale((type(XalsEmporiumDB) == "table" and XalsEmporiumDB.zoneIconScale) or 1)
    end
end

-- Backing the Options "Reset icon position" link.
function Alert:ResetPosition()
    if type(XalsEmporiumDB) == "table" then XalsEmporiumDB.zoneIconPos = nil end
    if icon then
        icon:ClearAllPoints()
        icon:SetPoint("CENTER", UIParent, "CENTER", DEFAULT_X, DEFAULT_Y)
    end
end

-- Shows the icon (with its glow) only while this zone genuinely has missing
-- decor - hidden the rest of the time, since there's nothing else this icon
-- exists to remind you of. Also hidden outright if the player's turned it
-- off in Options.
function Alert:UpdateVisibility()
    if XalsKeep then
        if icon then icon:Hide() end
        XalsKeep:ZoneUpdated()
        return
    end

    local f = BuildIcon()

    if IsEnabled() and ZoneDecorEntry() then
        f:Show()
        f.glow:Show()
        if not f.glowAnim:IsPlaying() then f.glowAnim:Play() end
    else
        f:Hide()
        f.glow:Hide()
        f.glowAnim:Stop()
    end
end

-- Call once from Engine's Init, after the first scan has had a chance to run.
function Alert:Init()
    self:UpdateVisibility()
end

local frame = CreateFrame("Frame")
frame:RegisterEvent("ZONE_CHANGED_NEW_AREA")
frame:SetScript("OnEvent", function()
    if icon or XalsKeep then Alert:UpdateVisibility() end
end)
