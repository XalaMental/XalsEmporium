-- DecorDetail.lua
-- Xal's Emporium - the "how do I get it" popup.
--
-- Opens when a decor item is clicked in the collection window. Shows the
-- sourcing info for that item as a bordered card (same pattern as Xal's
-- Armoire's AppearanceDetail.lua - see the card-layout skill), with a real
-- "Set Waypoint" button whenever a map ID resolved for this vendor.
--
-- Lua can't open a browser, so the Wowhead link button pops the standard
-- copy-a-URL box (Brand.ShowCopyBox) instead - same mechanism as the
-- Discord link.

local addonName, addonTable = ...
local Detail    = addonTable.DecorDetail
local Brand     = addonTable.BrandStyle
local DecorData = addonTable.DecorData

-- No fixed height - card content length varies a lot per item. The real
-- height is added up directly from each element's own size every time an
-- item is shown (see Detail:Show below); this initial size is just a
-- throwaway starting value, always overwritten before the frame is ever shown.
local WIN_W = 400
local INITIAL_H = 400

local frame

-- Sets a real waypoint toward a vendor's coordinates. TomTom's current
-- AddWaypoint(mapID, x, y, opts) takes 0-1 normalized coordinates (confirmed
-- against TomTom.lua's own call sites, which divide a 0-100 /way-style pair
-- by 100 before calling it - exactly the format DecorSources.lua stores).
-- Native C_Map.SetUserWaypoint is the fallback when TomTom isn't installed.
-- Same safeguards as HousingDecorGuide's own waypoint code (HDGR_Waypoints.lua,
-- read directly): bail in combat, validate the map ID against the client
-- before using it, pcall the TomTom call, point TomTom's arrow at the new
-- waypoint, and only set a native waypoint on a map that allows one.
local function SetWaypoint(mapID, x, y)
    if not mapID or not x or not y then return end
    if InCombatLockdown() then
        print("|cff681417Xal's Emporium:|r can't set a waypoint in combat.")
        return
    end
    if not (C_Map and C_Map.GetMapInfo and C_Map.GetMapInfo(mapID)) then
        print("|cff681417Xal's Emporium:|r no map found for this vendor.")
        return
    end

    local mapX = math.max(0, math.min(1, x / 100))
    local mapY = math.max(0, math.min(1, y / 100))

    if TomTom and TomTom.AddWaypoint then
        local ok, uid = pcall(TomTom.AddWaypoint, TomTom, mapID, mapX, mapY,
            { title = "Xal's Emporium vendor", persistent = false, from = "XalsEmporium" })
        if ok and uid then
            if TomTom.SetCrazyArrow then
                pcall(TomTom.SetCrazyArrow, TomTom, uid,
                    TomTom.profile and TomTom.profile.arrow and TomTom.profile.arrow.arrival or 5,
                    "Xal's Emporium vendor")
            end
            print("|cff681417Xal's Emporium:|r waypoint set via TomTom.")
            return
        end
    end

    if C_Map.CanSetUserWaypointOnMap and C_Map.CanSetUserWaypointOnMap(mapID)
        and UiMapPoint and UiMapPoint.CreateFromCoordinates then
        C_Map.SetUserWaypoint(UiMapPoint.CreateFromCoordinates(mapID, mapX, mapY))
        if C_SuperTrack then C_SuperTrack.SetSuperTrackedUserWaypoint(true) end
        print("|cff681417Xal's Emporium:|r waypoint set.")
    else
        print("|cff681417Xal's Emporium:|r the game doesn't allow a waypoint on this map.")
    end
end

-- ── Source card ──────────────────────────────────────────────────
-- A bordered card for the vendor/source info, same pattern as Armoire's
-- AppearanceDetail.lua - a frame pool rather than a single fixed element,
-- since a future item with more than one real source (not just a
-- faction-mirrored one) can grow this to more than one card without any
-- layout rework. Today this is almost always exactly one card.
local cardPool = {}

local function AcquireCard(parent, index)
    local card = cardPool[index]
    if card then return card end

    card = CreateFrame("Frame", nil, parent)
    Brand.DrawBorder(card, 0)

    local text = Brand.FS(card, "", Brand.BODY_FONT_PATH, 13, nil, 1, 1, 1)
    text:SetPoint("TOPLEFT", card, "TOPLEFT", 8, -8)
    text:SetJustifyH("LEFT")
    text:SetWordWrap(true)
    text:SetSpacing(3)
    card.text = text

    local waypointBtn = Brand.MakeTextLink(card, "Set Waypoint", function()
        SetWaypoint(card.waypointMapID, card.waypointX, card.waypointY)
    end)
    waypointBtn:SetPoint("TOPRIGHT", card, "TOPRIGHT", -8, -8)
    card.waypointBtn = waypointBtn

    cardPool[index] = card
    return card
end

local function BuildFrame()
    if frame then return frame end

    local f = CreateFrame("Frame", "XalsEmporiumDecorDetail", UIParent)
    tinsert(UISpecialFrames, "XalsEmporiumDecorDetail")
    f:SetSize(WIN_W, INITIAL_H)
    f:SetFrameStrata("DIALOG")
    f:SetToplevel(true)
    f:SetMovable(true)
    f:EnableMouse(true)
    f:RegisterForDrag("LeftButton")
    f:SetScript("OnDragStart", f.StartMoving)
    f:SetScript("OnDragStop", function(self)
        self:StopMovingOrSizing()
        if type(XalsEmporiumDB) == "table" then
            local point, _, relPoint, x, y = self:GetPoint()
            XalsEmporiumDB.detailPos = { point = point, relPoint = relPoint, x = x, y = y }
        end
    end)
    f:SetClampedToScreen(true)

    -- Distinct default offset, checked against the family-wide registry in
    -- project_addon_visual_brand.md - nothing else currently uses (100, -260).
    local pos = type(XalsEmporiumDB) == "table" and XalsEmporiumDB.detailPos or nil
    if pos and pos.point then
        f:SetPoint(pos.point, UIParent, pos.relPoint, pos.x, pos.y)
    else
        f:SetPoint("CENTER", UIParent, "CENTER", 100, -260)
    end

    Brand.ApplyBackground(f)
    Brand.DrawBorder(f)

    local icon = f:CreateTexture(nil, "ARTWORK")
    icon:SetSize(44, 44)
    icon:SetPoint("TOPLEFT", f, "TOPLEFT", Brand.SAFE_MARGIN + 4, -Brand.SAFE_MARGIN - 4)
    icon:SetTexCoord(0.07, 0.93, 0.07, 0.93)
    f.icon = icon

    local title = Brand.FS(f, "", Brand.TITLE_FONT_PATH, 20, nil,
        Brand.ACCENT[1], Brand.ACCENT[2], Brand.ACCENT[3])
    title:SetPoint("TOPLEFT", icon, "TOPRIGHT", 12, -4)
    title:SetPoint("RIGHT", f, "RIGHT", -Brand.SAFE_MARGIN, 0)
    title:SetJustifyH("LEFT")
    title:SetWordWrap(true)
    f.titleText = title

    local status = Brand.FS(f, "", Brand.BODY_FONT_PATH, 12, nil, 1, 1, 1)
    status:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -4)
    status:SetJustifyH("LEFT")
    f.statusText = status

    -- Anchored to the status line, not parked at a fixed height - a long item
    -- name wraps the title to two lines and a hardcoded divider/heading then
    -- sits straight through the text. The status's left edge is 60px past the
    -- window margin (icon + gap), so the divider backs out by that much and a
    -- second point pins its right edge, overriding DrawHeaderDivider's fixed
    -- width the same way Armoire's detail popup does.
    local divider = Brand.DrawHeaderDivider(f, 0, 72, WIN_W - (Brand.SAFE_MARGIN * 2))
    divider:ClearAllPoints()
    divider:SetPoint("TOPLEFT", status, "BOTTOMLEFT", -60, -10)
    divider:SetPoint("RIGHT", f, "RIGHT", -Brand.SAFE_MARGIN, 0)

    local heading = Brand.FS(f, "How to get it", Brand.TITLE_FONT_PATH, 15, nil,
        Brand.ACCENT[1], Brand.ACCENT[2], Brand.ACCENT[3])
    heading:SetPoint("TOPLEFT", divider, "BOTTOMLEFT", 4, -12)
    f.headingText = heading

    -- Fallback-only plain text (no sourcing info at all) - a real source
    -- renders as a card instead, built fresh each Detail:Show since whether
    -- it needs a waypoint button varies per item.
    local sourceStatus = Brand.FS(f, "", Brand.BODY_FONT_PATH, 13, nil, 1, 1, 1)
    sourceStatus:SetPoint("TOPLEFT", heading, "BOTTOMLEFT", 0, -6)
    sourceStatus:SetPoint("RIGHT", f, "RIGHT", -Brand.SAFE_MARGIN - 4, 0)
    sourceStatus:SetJustifyH("LEFT")
    sourceStatus:SetWordWrap(true)
    f.sourceStatusText = sourceStatus

    local wowhead = Brand.MakeTextLink(f, "Wowhead link", function()
        if f.wowheadURL then Brand.ShowCopyBox("Wowhead - copy this link", f.wowheadURL) end
    end)
    f.wowheadButton = wowhead

    local close = Brand.MakeCloseButton(f, function() f:Hide() end)
    f.closeButton = close

    f:Hide()
    frame = f
    return f
end

function Detail:IsShown()
    return frame and frame:IsShown()
end

function Detail:Show(entry)
    if not entry then return end

    local f = BuildFrame()
    f.entry = entry

    f.icon:SetTexture(entry.icon)
    f.titleText:SetText(entry.name or "Unknown decor")

    if entry.isOwned then
        f.statusText:SetText("|cff44dd66Owned|r")
    else
        f.statusText:SetText("|cff999999Missing|r")
    end

    -- Hand-researched vendor data (DecorSources.lua) takes priority - it
    -- carries a specific NPC name and, where known, real coordinates and a
    -- map ID, more precise than whatever the game's own sourceText says
    -- (often just a bare zone name or nothing at all). Rendered as a card,
    -- same pattern as Armoire's AppearanceDetail.lua - one bordered box per
    -- source, with its own room for a "Set Waypoint" button so the button
    -- never fights word-wrap the way an inline link embedded in body text can.
    local src = DecorData:GetSourceEntry(entry)
    local cardText, waypointMapID, waypointX, waypointY

    if src then
        cardText = (src.method or "Vendor") .. ": " .. (src.vendor or "?")
        if src.zone then cardText = cardText .. ", " .. src.zone end
        local vx, vy = DecorData:GetVendorCoords(entry)
        waypointMapID = DecorData:GetVendorMapID(entry)
        waypointX, waypointY = vx, vy
    elseif entry.sourceText and entry.sourceText ~= "" then
        cardText = entry.sourceText
    end

    local lastAnchor
    if cardText then
        f.sourceStatusText:Hide()

        local card = AcquireCard(f, 1)
        card:ClearAllPoints()
        card:SetPoint("TOPLEFT", f.headingText, "BOTTOMLEFT", 0, -8)
        card:SetPoint("RIGHT", f, "RIGHT", -Brand.SAFE_MARGIN - 4, 0)

        card.waypointMapID, card.waypointX, card.waypointY = waypointMapID, waypointX, waypointY
        if waypointMapID and waypointX and waypointY then
            card.waypointBtn:Show()
            -- Fixed inset, not computed from the button's own width, so the
            -- text can never run underneath it regardless of this button's
            -- label length.
            card.text:SetPoint("RIGHT", card, "RIGHT", -90, 0)
        else
            card.waypointBtn:Hide()
            card.text:SetPoint("RIGHT", card, "RIGHT", -8, 0)
        end
        card.text:SetText(cardText)

        -- Height follows content - GetStringHeight() only reflects the REAL
        -- wrapped layout once width is actually set.
        local textHeight = math.max(card.text:GetStringHeight() or 16, 16)
        card:SetHeight(textHeight + 16)
        card:Show()

        for i = 2, #cardPool do cardPool[i]:Hide() end
        lastAnchor = card
    else
        for i = 1, #cardPool do cardPool[i]:Hide() end
        f.sourceStatusText:SetText("The game doesn't provide sourcing text for this one.")
        f.sourceStatusText:Show()
        lastAnchor = f.sourceStatusText
    end

    f.wowheadURL = entry.itemID and ("https://www.wowhead.com/item=" .. entry.itemID) or nil
    f.wowheadButton:ClearAllPoints()
    if f.wowheadURL then
        f.wowheadButton:SetPoint("TOPLEFT", lastAnchor, "BOTTOMLEFT", 0, -Brand.SAFE_MARGIN)
        f.wowheadButton:Show()
        lastAnchor = f.wowheadButton
    else
        f.wowheadButton:Hide()
    end

    f.closeButton:ClearAllPoints()
    f.closeButton:SetPoint("TOP", lastAnchor, "BOTTOM", 0, -Brand.SAFE_MARGIN)

    -- Total height, measured from the window's real top down to whatever
    -- ended up being the last thing anchored - a card's height varies with
    -- its wrapped text, so this can't be computed by adding up fixed numbers
    -- the way the old single-paragraph layout could.
    local top, bottom = f:GetTop(), f.closeButton:GetBottom()
    if top and bottom then
        f:SetHeight((top - bottom) + Brand.SAFE_MARGIN)
    else
        f:SetHeight(INITIAL_H)
    end

    f:Show()
end
