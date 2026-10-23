-- CollectionWindow.lua
-- Xal's Emporium - the decor collection window.
--
-- Shows the WHOLE housing decor catalog, owned and not-owned together, since
-- "what am I still missing" is the actual useful question for a decor
-- tracker - unlike Reins' collection window, which only shows what you
-- already have. Not-owned rows are dimmed rather than hidden.
--
-- Same row/scroll construction as Reins' CollectionWindow: plain ScrollFrame
-- with the thin custom accent scrollbar, rows built once and reused.

local addonName, addonTable = ...
local Collection = addonTable.CollectionWindow
local Brand      = addonTable.BrandStyle
local DecorData  = addonTable.DecorData

local WIN_W, WIN_H = 400, 520
local ROW_H        = 30
local HEADER_H     = 26
local ROW_INSET    = 10

local frame, scrollFrame, scrollChild, content, countText, searchBox, zoneCheck, missingCheck
local rows = {}
local headers = {}
local filterText = ""
local zoneOnly = false
local missingOnly = false

-- Written only while Options > Collection > "Remember filters" is on.
local function SaveFilters()
    if type(XalsEmporiumDB) == "table" and XalsEmporiumDB.rememberFilters then
        XalsEmporiumDB.filters = { zone = zoneOnly, missing = missingOnly, text = filterText }
    end
end

-- Section header row - a category name (Seating, Lighting, ...) with a count,
-- no icon, distinct from an item row so the two never get visually confused
-- while scrolling.
local function AcquireHeader(index)
    local header = headers[index]
    if header then return header end

    header = CreateFrame("Frame", nil, content)
    header:SetHeight(HEADER_H)

    local label = Brand.FS(header, "", Brand.TITLE_FONT_PATH, 13, nil,
        Brand.ACCENT[1], Brand.ACCENT[2], Brand.ACCENT[3])
    label:SetPoint("BOTTOMLEFT", header, "BOTTOMLEFT", 0, 2)
    header.label = label

    Brand.DrawDivider(header, 0, HEADER_H, WIN_W - (Brand.SAFE_MARGIN * 2) - ROW_INSET - 12)

    headers[index] = header
    return header
end

local function AcquireRow(index)
    local row = rows[index]
    if row then return row end

    row = CreateFrame("Button", nil, content)
    row:SetHeight(ROW_H)

    local hl = row:CreateTexture(nil, "BACKGROUND")
    hl:SetAllPoints()
    hl:SetColorTexture(Brand.ACCENT[1], Brand.ACCENT[2], Brand.ACCENT[3], 0.16)
    hl:Hide()
    row.highlight = hl

    local icon = row:CreateTexture(nil, "ARTWORK")
    icon:SetSize(ROW_H - 8, ROW_H - 8)
    icon:SetPoint("LEFT", row, "LEFT", 0, 0)
    icon:SetTexCoord(0.07, 0.93, 0.07, 0.93)
    row.icon = icon

    local status = Brand.FS(row, "", Brand.BODY_FONT_PATH, 11, nil,
        Brand.GOLD[1], Brand.GOLD[2], Brand.GOLD[3])
    status:SetPoint("RIGHT", row, "RIGHT", -6, 0)
    status:SetJustifyH("RIGHT")
    row.statusText = status

    local name = Brand.FS(row, "", Brand.BODY_FONT_PATH, 13, nil, 1, 1, 1)
    name:SetPoint("LEFT", icon, "RIGHT", 8, 0)
    name:SetPoint("RIGHT", status, "LEFT", -8, 0)
    name:SetJustifyH("LEFT")
    name:SetWordWrap(false)
    row.nameText = name

    row:EnableMouse(true)
    row:SetScript("OnEnter", function(self)
        self.highlight:Show()
        if self.entry and self.entry.itemID then
            GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
            GameTooltip:SetItemByID(self.entry.itemID)
            -- Where to actually go get it, for anything still missing. Not
            -- owned items have nothing useful to add beyond the item tooltip
            -- itself.
            if not self.entry.isOwned and self.entry.sourceText and self.entry.sourceText ~= "" then
                GameTooltip:AddLine(" ")
                GameTooltip:AddLine(self.entry.sourceText, 1, 1, 1, true)
            end
            GameTooltip:Show()
        end
    end)
    row:SetScript("OnLeave", function(self)
        self.highlight:Hide()
        GameTooltip:Hide()
    end)
    row:RegisterForClicks("AnyUp")
    row:SetScript("OnClick", function(self)
        if self.entry then addonTable.DecorDetail:Show(self.entry) end
    end)

    rows[index] = row
    return row
end

-- Whole catalog, owned and not, optionally narrowed by the search box, the
-- current-zone filter, and/or the missing-only filter.
local function BuildList()
    local roster = DecorData:Ensure()
    if not roster then return {} end

    local needle = filterText ~= "" and filterText:lower() or nil
    local zoneNames = zoneOnly and DecorData:CurrentZoneNames() or nil

    local list = {}
    for i = 1, #roster do
        local entry = roster[i]
        local matchesText = entry.name and (not needle or entry.name:lower():find(needle, 1, true))
        local matchesZone = not zoneOnly or DecorData:MatchesCurrentZone(entry, zoneNames)
        local matchesMissing = not missingOnly or not entry.isOwned
        if matchesText and matchesZone and matchesMissing then
            list[#list + 1] = entry
        end
    end
    return list
end

function Collection:Refresh()
    if not frame then return end

    local list = BuildList()
    local sections = DecorData:GroupByCategory(list)

    local y, rowIndex, headerIndex = 0, 0, 0

    for s = 1, #sections do
        local section = sections[s]

        local sectionOwned = 0
        for e = 1, #section.entries do
            if section.entries[e].isOwned then sectionOwned = sectionOwned + 1 end
        end

        headerIndex = headerIndex + 1
        local header = AcquireHeader(headerIndex)
        header:ClearAllPoints()
        header:SetPoint("TOPLEFT", content, "TOPLEFT", 0, -y)
        header:SetPoint("TOPRIGHT", content, "TOPRIGHT", 0, -y)
        header.label:SetText(section.name .. "  |cff999999(" .. sectionOwned .. " of " ..
            #section.entries .. ")|r")
        header:Show()
        y = y + HEADER_H

        for e = 1, #section.entries do
            local entry = section.entries[e]
            rowIndex = rowIndex + 1
            local row = AcquireRow(rowIndex)
            row:ClearAllPoints()
            row:SetPoint("TOPLEFT", content, "TOPLEFT", 0, -y)
            row:SetPoint("TOPRIGHT", content, "TOPRIGHT", 0, -y)
            row.entry = entry
            row.icon:SetTexture(entry.icon)
            row.nameText:SetText(entry.name)
            if entry.isOwned then
                row.icon:SetVertexColor(1, 1, 1)
                row.nameText:SetTextColor(1, 1, 1)
                row.statusText:SetText("|cff44dd66Owned|r")
            else
                row.icon:SetVertexColor(0.5, 0.5, 0.5)
                row.nameText:SetTextColor(0.6, 0.6, 0.6)
                row.statusText:SetText("|cff999999Missing|r")
            end
            row:Show()
            y = y + ROW_H
        end
    end

    for i = headerIndex + 1, #headers do
        headers[i]:Hide()
    end
    for i = rowIndex + 1, #rows do
        rows[i]:Hide()
        rows[i].entry = nil
    end

    local stats = DecorData.stats
    if stats then
        if filterText ~= "" or zoneOnly or missingOnly then
            countText:SetText(#list .. " shown  |cff999999(" .. stats.owned .. " of " ..
                stats.total .. " owned overall)|r")
        else
            countText:SetText(stats.owned .. " owned  |cff999999of " ..
                stats.total .. " total|r")
        end
    else
        countText:SetText("Open the housing catalog once to scan your decor")
    end

    local height = math.max(1, y)
    content:SetHeight(height)
    scrollChild:SetHeight(height)
    if frame.UpdateScrollRange then frame.UpdateScrollRange() end
end

local function BuildWindow()
    if frame then return frame end

    local f = CreateFrame("Frame", "XalsEmporiumCollection", UIParent)
    tinsert(UISpecialFrames, "XalsEmporiumCollection")
    f:SetSize(WIN_W, WIN_H)
    f:SetFrameStrata("MEDIUM")
    f:SetToplevel(true)
    f:SetMovable(true)
    f:EnableMouse(true)
    f:RegisterForDrag("LeftButton")
    f:SetScript("OnDragStart", f.StartMoving)
    f:SetScript("OnDragStop", function(self)
        self:StopMovingOrSizing()
        if type(XalsEmporiumDB) == "table" then
            local point, _, relPoint, x, y = self:GetPoint()
            XalsEmporiumDB.collectionPos = { point = point, relPoint = relPoint, x = x, y = y }
        end
    end)
    f:SetClampedToScreen(true)

    -- Distinct default offset, checked against the family-wide registry in
    -- project_addon_visual_brand.md - nothing else currently uses (-320, 220).
    local pos = type(XalsEmporiumDB) == "table" and XalsEmporiumDB.collectionPos or nil
    if pos and pos.point then
        f:SetPoint(pos.point, UIParent, pos.relPoint, pos.x, pos.y)
    else
        f:SetPoint("CENTER", UIParent, "CENTER", -320, 220)
    end

    -- Kept as f.keepChrome so Xal's Keep can hide them while this window
    -- sits inside it (the Keep draws its own).
    local bg = Brand.ApplyBackground(f)
    local bTop, bBottom, bLeft, bRight = Brand.DrawBorder(f)
    f.keepChrome = { bg, bTop, bBottom, bLeft, bRight }

    Brand.Title(f, "Decor Collection", 22, "TOP", f, "TOP", 0, -Brand.SAFE_MARGIN - 4)

    countText = Brand.FS(f, "", Brand.BODY_FONT_PATH, 12, nil,
        Brand.GOLD[1], Brand.GOLD[2], Brand.GOLD[3])
    countText:SetPoint("TOP", f, "TOP", 0, -48)

    -- Native edit box per the widget rule - only buttons/checkboxes/borders are
    -- custom brand art.
    searchBox = CreateFrame("EditBox", nil, f, "InputBoxTemplate")
    searchBox:SetHeight(20)
    searchBox:SetPoint("TOPLEFT", f, "TOPLEFT", Brand.SAFE_MARGIN + 14, -70)
    searchBox:SetPoint("TOPRIGHT", f, "TOPRIGHT", -Brand.SAFE_MARGIN - 4, -70)
    searchBox:SetAutoFocus(false)
    searchBox:SetFontObject("GameFontHighlightSmall")
    searchBox:SetScript("OnTextChanged", function(self)
        filterText = self:GetText() or ""
        SaveFilters()
        Collection:Refresh()
    end)
    searchBox:SetScript("OnEscapePressed", function(self)
        self:SetText("")
        self:ClearFocus()
    end)

    local ZONE_CHECK_SIZE = 16
    zoneCheck = Brand.MakeCheckbox(f, ZONE_CHECK_SIZE)
    zoneCheck:SetPoint("TOPLEFT", searchBox, "BOTTOMLEFT", 0, -10)
    zoneCheck.OnToggle = function(self)
        zoneOnly = self:GetChecked() and true or false
        SaveFilters()
        Collection:Refresh()
    end

    local zoneLabel = Brand.FS(f, "This zone only", Brand.BODY_FONT_PATH, 13, nil,
        Brand.GOLD[1], Brand.GOLD[2], Brand.GOLD[3])
    zoneLabel:SetPoint("LEFT", zoneCheck, "RIGHT", 6, 0)

    -- Same row as the zone checkbox, anchored off its label rather than a
    -- fixed x offset since the label's width varies by client language.
    missingCheck = Brand.MakeCheckbox(f, ZONE_CHECK_SIZE)
    missingCheck:SetPoint("LEFT", zoneLabel, "RIGHT", 20, 0)
    missingCheck.OnToggle = function(self)
        missingOnly = self:GetChecked() and true or false
        SaveFilters()
        Collection:Refresh()
    end

    local missingLabel = Brand.FS(f, "Missing only", Brand.BODY_FONT_PATH, 13, nil,
        Brand.GOLD[1], Brand.GOLD[2], Brand.GOLD[3])
    missingLabel:SetPoint("LEFT", missingCheck, "RIGHT", 6, 0)

    -- "Remember filters" (Options > Collection): restore last session's
    -- filters. Set after the checkboxes/search box exist; the search box's
    -- OnTextChanged then refreshes the list, so nothing else needs to.
    local saved = type(XalsEmporiumDB) == "table" and XalsEmporiumDB.rememberFilters
        and XalsEmporiumDB.filters
    if saved then
        zoneOnly = saved.zone and true or false
        missingOnly = saved.missing and true or false
        zoneCheck:SetChecked(zoneOnly)
        missingCheck:SetChecked(missingOnly)
        if saved.text and saved.text ~= "" then searchBox:SetText(saved.text) end
    end

    Brand.DrawHeaderDivider(f, Brand.SAFE_MARGIN, 122, WIN_W - (Brand.SAFE_MARGIN * 2))

    scrollFrame = CreateFrame("ScrollFrame", "XalsEmporiumCollectionScroll", f)
    scrollFrame:SetPoint("TOPLEFT", f, "TOPLEFT", Brand.SAFE_MARGIN + ROW_INSET, -132)
    scrollFrame:SetPoint("BOTTOMRIGHT", f, "BOTTOMRIGHT", -Brand.SAFE_MARGIN - 12, 48)

    local scrollTrack = CreateFrame("Frame", nil, f, "BackdropTemplate")
    scrollTrack:SetPoint("TOPRIGHT", scrollFrame, "TOPRIGHT", 10, 0)
    scrollTrack:SetPoint("BOTTOMRIGHT", scrollFrame, "BOTTOMRIGHT", 10, 0)
    scrollTrack:SetWidth(8)
    scrollTrack:SetBackdrop({ bgFile = "Interface\\Buttons\\WHITE8x8" })
    scrollTrack:SetBackdropColor(1, 1, 1, 0.08)
    scrollTrack:Hide()

    local scrollThumb = CreateFrame("Slider", nil, scrollTrack)
    scrollThumb:SetOrientation("VERTICAL")
    scrollThumb:SetPoint("TOP", scrollTrack, "TOP", 0, 0)
    scrollThumb:SetPoint("BOTTOM", scrollTrack, "BOTTOM", 0, 0)
    scrollThumb:SetWidth(8)
    scrollThumb:SetThumbTexture("Interface\\Buttons\\WHITE8x8")
    local scrollThumbTex = scrollThumb:GetThumbTexture()
    scrollThumbTex:SetVertexColor(Brand.ACCENT[1], Brand.ACCENT[2], Brand.ACCENT[3], 1)
    scrollThumbTex:SetWidth(8)

    local suppressScrollCallback = false
    scrollThumb:SetScript("OnValueChanged", function(_, value)
        if suppressScrollCallback then return end
        scrollFrame:SetVerticalScroll(value)
    end)

    scrollChild = CreateFrame("Frame", nil, scrollFrame)
    scrollChild:SetPoint("TOPLEFT", scrollFrame, "TOPLEFT", 0, 0)
    scrollChild:SetWidth(scrollFrame:GetWidth())
    scrollChild:SetHeight(1)
    scrollFrame:SetScrollChild(scrollChild)
    scrollFrame:SetScript("OnSizeChanged", function(_, width) scrollChild:SetWidth(width) end)

    content = CreateFrame("Frame", nil, scrollChild)
    content:SetPoint("TOPLEFT", scrollChild, "TOPLEFT", 0, 0)
    content:SetPoint("TOPRIGHT", scrollChild, "TOPRIGHT", 0, 0)
    content:SetHeight(1)

    scrollFrame:EnableMouseWheel(true)
    scrollFrame:SetScript("OnMouseWheel", function(_, delta)
        scrollThumb:SetValue(scrollThumb:GetValue() - delta * 40)
    end)

    function f.UpdateScrollRange()
        local visibleHeight = scrollFrame:GetHeight()
        local contentHeight = scrollChild:GetHeight()
        local maxScroll = math.max(0, contentHeight - visibleHeight)
        suppressScrollCallback = true
        scrollThumb:SetMinMaxValues(0, maxScroll)
        suppressScrollCallback = false
        if maxScroll > 0 then
            scrollTrack:Show()
            local ratio = math.min(1, visibleHeight / contentHeight)
            scrollThumbTex:SetHeight(math.max(20, visibleHeight * ratio))
        else
            scrollTrack:Hide()
            scrollFrame:SetVerticalScroll(0)
        end
    end

    local close = Brand.MakeCloseButton(f, function() f:Hide() end)
    close:SetPoint("BOTTOM", f, "BOTTOM", 0, Brand.SAFE_MARGIN)
    f.keepChrome[#f.keepChrome + 1] = close

    f:Hide()
    frame = f
    return f
end

-- ── Xal's Keep ───────────────────────────────────────────────────
-- When Xal's Keep is installed, this window lives inside the Keep instead of
-- floating on its own, and every way of opening it (minimap button, /xemp,
-- the zone alert) opens the Keep on the Emporium tab. Without the Keep,
-- nothing here runs and the window behaves exactly as before.
local KEEP_KEY = "emporium"

-- Re-homes the window into the Keep's content area. The Keep supplies the
-- background, border, Close and dragging, so ours step aside; mouse goes off
-- on the window itself so a click on empty space drags the Keep instead.
-- Rows and checkboxes are their own frames and still take clicks.
local function AttachToKeep(container)
    local f = BuildWindow()
    f.keepHost = container
    f:SetParent(container)
    f:ClearAllPoints()
    f:SetPoint("TOP", container, "TOP", 0, 0)
    f:SetPoint("BOTTOM", container, "BOTTOM", 0, 0)
    f:SetFrameStrata(container:GetFrameStrata())
    f:SetFrameLevel(container:GetFrameLevel() + 1)
    f:SetToplevel(false)
    f:SetMovable(false)
    f:EnableMouse(false)
    f:SetClampedToScreen(false)
    for _, region in ipairs(f.keepChrome) do region:Hide() end
    -- Escape closes the Keep as a whole, not just this tab.
    for i = #UISpecialFrames, 1, -1 do
        if UISpecialFrames[i] == "XalsEmporiumCollection" then table.remove(UISpecialFrames, i) end
    end
    return f
end

local function ShowInKeep()
    Collection:Refresh()
    frame:Show()
end

if XalsKeep and XalsKeep.Register then
    XalsKeep:Register(KEEP_KEY, {
        label    = "Emporium",
        addon    = "XalsEmporium",
        attach   = AttachToKeep,
        show     = ShowInKeep,
        showZone = function() Collection:ShowZoneOnly() end,
    })
end

-- Called from the floating zone-alert icon's right-click - forces the zone
-- filter on and opens the window, rather than duplicating the filter logic
-- there.
function Collection:ShowZoneOnly()
    local f = BuildWindow()
    zoneOnly = true
    if zoneCheck then zoneCheck:SetChecked(true) end
    if XalsKeep then return XalsKeep:Show(KEEP_KEY) end
    self:Refresh()
    f:Show()
end

function Collection:Toggle()
    if XalsKeep then return XalsKeep:Toggle(KEEP_KEY) end
    local f = BuildWindow()
    if f:IsShown() then
        f:Hide()
    else
        self:Refresh()
        f:Show()
    end
end

-- Inside the Keep, "shown" has to mean actually on screen - the window stays
-- flagged shown while the Keep is closed or on another tab.
function Collection:IsShown()
    if frame and frame.keepHost then return frame:IsVisible() end
    return frame and frame:IsShown()
end
