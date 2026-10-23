-- SettingsPanel.lua
-- Xal's Emporium - settings.
--
-- Two ways in, per the standard: a standalone floating window (the PRIMARY
-- one, opened by /xemp options) and an entry in Blizzard's own AddOns list
-- (secondary, so it's findable where people expect it).
--
-- Structure matches Xal's Warchest's / Welcome Wagon's real SettingsPanel.lua:
-- header with a centered title + divider and a Close link top-right, a left
-- sidebar of section links (Home first), content area to the right, the
-- Discord logo pinned to the sidebar's bottom edge. One small page per
-- section; every setting on a page sits in its own bordered card (NewCard).
--
-- Height is dynamic: the window fits whichever page is open, up to MAX_H.
-- Past that the page scrolls (mouse wheel, thin thumb that only appears when
-- there's something to scroll). The native Esc -> Options entry is only a
-- short pointer panel that can never overflow its canvas.

local addonName, addonTable = ...
local SettingsPanel = addonTable.SettingsPanel
local Brand         = addonTable.BrandStyle

local PANEL_NAME = "Xal's Emporium"

local SIDEBAR_W = 132
local CONTENT_W = 340
local GUTTER    = 8 -- room beside the cards for the scroll thumb
local WIN_W = 14 + SIDEBAR_W + 10 + 2 + 26 + CONTENT_W + GUTTER + 14
local TOP_CHROME = 88 + 32 -- sidebar top offset + content's own top offset
local MIN_H = 400
local MAX_H = 640

local RIGHT_MARGIN = 16
local PANEL_LABEL_FONT_SIZE = 14
local PANEL_DESC_FONT_SIZE  = 13

local window, rootPanel
local sidebar, scroll, content, thumb
local FitWindow
local sectionButtons = {}
local activeSection = "Home"

local function DB()
    if type(XalsEmporiumDB) ~= "table" then XalsEmporiumDB = {} end
    return XalsEmporiumDB
end

-- ── Cards ────────────────────────────────────────────────────────
-- Every setting lives in its own card - a mini panel with the lighter card
-- fill and thin border (Brand.ApplyCardBackground + Brand.DrawBorder(card, 0)),
-- a title, a short divider under it, then the setting's controls. Cards stack
-- down the page. Everything inside a card chains off `card.anchor` (the last
-- element added), so FitCard sizes the card from that element's real bottom
-- once the page has drawn - no GetStringHeight guessing.
local CARD_PAD = 10
local CARD_GAP = 12
local pageCards = {}

local function NewCard(parent, title)
    local card = CreateFrame("Frame", nil, parent)
    local prev = pageCards[#pageCards]
    if prev then
        card:SetPoint("TOPLEFT", prev, "BOTTOMLEFT", 0, -CARD_GAP)
    else
        card:SetPoint("TOPLEFT", parent, "TOPLEFT", 0, 0)
    end
    card:SetWidth(CONTENT_W)
    card:SetHeight(60) -- placeholder; FitCard sets the real height
    Brand.ApplyCardBackground(card)
    Brand.DrawBorder(card, 0)

    if title then
        local t = Brand.FS(card, title, Brand.BODY_FONT_PATH_SEMIBOLD, 14, nil,
            Brand.HEADER_COLOR[1], Brand.HEADER_COLOR[2], Brand.HEADER_COLOR[3])
        t:SetPoint("TOPLEFT", card, "TOPLEFT", CARD_PAD, -8)

        local div = card:CreateTexture(nil, "ARTWORK")
        div:SetColorTexture(Brand.DIVIDER_COLOR[1], Brand.DIVIDER_COLOR[2], Brand.DIVIDER_COLOR[3], 1)
        div:SetHeight(Brand.LINE_THICKNESS)
        div:SetPoint("TOPLEFT", card, "TOPLEFT", CARD_PAD, -30)
        div:SetPoint("TOPRIGHT", card, "TOPRIGHT", -CARD_PAD, -30)
        card.anchor = div
    else
        -- Untitled card (Home, notes): content starts from an invisible top edge.
        local top = card:CreateTexture(nil, "ARTWORK")
        top:SetColorTexture(0, 0, 0, 0)
        top:SetHeight(1)
        top:SetPoint("TOPLEFT", card, "TOPLEFT", CARD_PAD, -2)
        top:SetPoint("TOPRIGHT", card, "TOPRIGHT", -CARD_PAD, -2)
        card.anchor = top
    end
    pageCards[#pageCards + 1] = card
    return card
end

-- Places `elem` under the card's last element, flush with the card's left
-- padding (xNudge shifts it, e.g. -4 for a text link's own inner padding).
local function Place(card, elem, gap, xNudge)
    elem:SetPoint("TOPLEFT", card.anchor, "BOTTOMLEFT", xNudge or 0, -gap)
    card.anchor = elem
end

local function FitCard(card)
    local top, bottom = card:GetTop(), card.anchor and card.anchor:GetBottom()
    if top and bottom then
        card:SetHeight(math.max(40, (top - bottom) + CARD_PAD + 2))
    end
end

-- Wrapped description text.
local function CardDesc(card, text, gap)
    local desc = Brand.FS(card, "", Brand.BODY_FONT_PATH, PANEL_DESC_FONT_SIZE, nil, 0.62, 0.62, 0.62)
    desc:SetPoint("RIGHT", card, "RIGHT", -CARD_PAD, 0)
    desc:SetJustifyH("LEFT")
    desc:SetWordWrap(true)
    desc:SetText(text)
    Place(card, desc, gap)
    return desc
end

-- Checkbox + label + description. `onChange(newValue)` runs when it's clicked.
local function CardCheck(card, label, description, isChecked, onChange)
    local cb = Brand.MakeCheckbox(card, 20)
    cb:SetChecked(isChecked and true or false)
    cb.OnToggle = function(self)
        onChange(self:GetChecked() and true or false)
    end
    Place(card, cb, 10)

    local text = Brand.FS(card, label, Brand.BODY_FONT_PATH, PANEL_LABEL_FONT_SIZE, nil,
        Brand.HEADER_COLOR[1], Brand.HEADER_COLOR[2], Brand.HEADER_COLOR[3])
    text:SetPoint("LEFT", cb, "RIGHT", 8, 0)
    text:SetPoint("RIGHT", card, "RIGHT", -CARD_PAD, 0)
    text:SetJustifyH("LEFT")
    text:SetWordWrap(true)

    CardDesc(card, description, 4)
end

local function CardLink(card, label, onClick)
    local link = Brand.MakeTextLink(card, label, onClick, 12)
    Place(card, link, 6, -4)
    -- Next element lines back up with the card padding, not the link's nudge.
    local spacer = card:CreateTexture(nil, "ARTWORK")
    spacer:SetSize(1, 1)
    spacer:SetColorTexture(0, 0, 0, 0)
    spacer:SetPoint("TOPLEFT", link, "BOTTOMLEFT", 4, 0)
    card.anchor = spacer
end

-- OptionsSliderTemplate's Low/High/Text sub-regions are only reachable via
-- the old global-name convention (_G[name.."Low"] etc), so this needs a real
-- frame name.
local sliderNameCounter = 0
local function CardSlider(card, min, max, step, value, formatFn, onChange)
    sliderNameCounter = sliderNameCounter + 1
    local sliderName = "XalsEmporiumSlider" .. sliderNameCounter
    local slider = CreateFrame("Slider", sliderName, card, "OptionsSliderTemplate")
    slider:SetWidth(CONTENT_W - (CARD_PAD * 2) - 8)
    slider:SetMinMaxValues(min, max)
    slider:SetValueStep(step)
    slider:SetObeyStepOnDrag(true)
    slider:SetValue(value)
    Place(card, slider, 26, 4)

    _G[sliderName .. "Low"]:SetText("")
    _G[sliderName .. "High"]:SetText("")
    _G[sliderName .. "Text"]:SetText(formatFn(value))
    -- Blizzard's template hardcodes these gold - doesn't read the brand color.
    for _, suffix in ipairs({ "Low", "High", "Text" }) do
        _G[sliderName .. suffix]:SetTextColor(Brand.HEADER_COLOR[1], Brand.HEADER_COLOR[2], Brand.HEADER_COLOR[3])
    end

    slider:SetScript("OnValueChanged", function(_, val)
        _G[sliderName .. "Text"]:SetText(formatFn(val))
        onChange(val)
    end)

    local spacer = card:CreateTexture(nil, "ARTWORK")
    spacer:SetSize(1, 1)
    spacer:SetColorTexture(0, 0, 0, 0)
    spacer:SetPoint("TOPLEFT", slider, "BOTTOMLEFT", -4, 0)
    card.anchor = spacer
end

-- With Xal's Keep installed its rook replaces this addon's own minimap button
-- and zone alert, so those pages say so instead of offering dead controls.
local function KeepNote(parent)
    if not XalsKeep then return end
    local card = NewCard(parent, nil)
    CardDesc(card, "Xal's Keep is installed, so its rook replaces this icon. "
        .. "These settings apply when the Keep isn't installed.", 4)
end

-- ── Sidebar link selection ───────────────────────────────────────
-- #323264, the confirmed muted color for an unselected sidebar link - only the
-- active section reads as "on".
local UNSELECTED_LINK_COLOR = { 0.196, 0.196, 0.392 }
local function SetLinkSelected(btn, selected)
    local c = selected and Brand.HEADER_COLOR or UNSELECTED_LINK_COLOR
    btn.label:SetTextColor(c[1], c[2], c[3], 1)
    btn.selected = selected
    btn:SetScript("OnLeave", function()
        local cc = btn.selected and Brand.HEADER_COLOR or UNSELECTED_LINK_COLOR
        btn.label:SetTextColor(cc[1], cc[2], cc[3], 1)
    end)
end

-- ── Pages ────────────────────────────────────────────────────────
local function BuildHome(parent)
    local card = NewCard(parent, nil)

    local icon = card:CreateTexture(nil, "ARTWORK")
    icon:SetSize(100, 100)
    icon:SetTexture("Interface\\AddOns\\XalsEmporium\\Icon.png")
    icon:SetPoint("TOP", card.anchor, "BOTTOM", 0, -10)

    local lead = Brand.FS(card, "Every piece of decor you're still missing, and where to get it.",
        Brand.TITLE_FONT_PATH, 16, nil, Brand.HEADER_COLOR[1], Brand.HEADER_COLOR[2], Brand.HEADER_COLOR[3])
    lead:SetPoint("TOP", icon, "BOTTOM", 0, -14)
    lead:SetWidth(CONTENT_W - 40)
    lead:SetJustifyH("CENTER")
    lead:SetWordWrap(true)

    local rule = card:CreateTexture(nil, "ARTWORK")
    rule:SetColorTexture(Brand.HEADER_COLOR[1], Brand.HEADER_COLOR[2], Brand.HEADER_COLOR[3], 1)
    rule:SetSize(50, Brand.LINE_THICKNESS)
    rule:SetPoint("TOP", lead, "BOTTOM", 0, -14)

    local body = Brand.FS(card,
        "Xal's Emporium tracks the whole housing decor catalog on your account - "
        .. "what you own, what you're missing, and the vendor to buy it from, "
        .. "with a waypoint straight to them where the location is known.",
        Brand.BODY_FONT_PATH, 12, nil, 0.85, 0.85, 0.85)
    body:SetPoint("TOP", rule, "BOTTOM", 0, -14)
    body:SetWidth(CONTENT_W - 40)
    body:SetJustifyH("CENTER")
    body:SetWordWrap(true)

    card.anchor = body
end

local function BuildMinimap(parent)
    KeepNote(parent)

    local db = DB()
    local mm = NewCard(parent, "Minimap button")
    CardCheck(mm, "Show the minimap button",
        "Left-click opens your decor collection, right-click opens these settings.",
        not (db.minimap and db.minimap.hide),
        function(value) addonTable.MinimapButton:SetShown(value) end)

    local lock = NewCard(parent, "Lock position")
    CardCheck(lock, "Lock the minimap button",
        "Stops the button being dragged around the minimap.",
        db.minimap and db.minimap.lock,
        function(value) addonTable.MinimapButton:SetLocked(value) end)
end

local function BuildZoneAlert(parent)
    KeepNote(parent)

    local db = DB()
    local alert = NewCard(parent, "Zone alert icon")
    CardCheck(alert, "Show the zone alert icon",
        "A small floating icon that appears while you're standing in a zone with "
        .. "decor you're still missing. Click it to see what's there.",
        db.zoneAlertDisabled ~= true,
        function(value) addonTable.DecorZoneAlertIcon:SetEnabled(value) end)

    local size = NewCard(parent, "Icon size")
    CardSlider(size, 0.5, 2.0, 0.1, db.zoneIconScale or 1.0,
        function(v) return math.floor(v * 100 + 0.5) .. "%" end,
        function(v)
            DB().zoneIconScale = v
            addonTable.DecorZoneAlertIcon:ApplyScale()
        end)

    local pos = NewCard(parent, "Icon position")
    CardDesc(pos, "Drag the icon anywhere on screen. This puts it back where it started.", 8)
    CardLink(pos, "Reset icon position", function()
        addonTable.DecorZoneAlertIcon:ResetPosition()
    end)
end

local function BuildCollection(parent)
    local db = DB()
    local remember = NewCard(parent, "Remember filters")
    CardCheck(remember, "Remember my filters",
        "Reopens the decor collection with the same search, \"This zone only\" and "
        .. "\"Missing only\" filters you last used.",
        db.rememberFilters,
        function(value)
            DB().rememberFilters = value
            if not value then DB().filters = nil end
        end)
end

local function ScanText()
    local DecorData = addonTable.DecorData
    local stats = DecorData.stats
    if stats and DecorData.lastScan then
        return "Last scanned: " .. date("%b %d, %I:%M %p", DecorData.lastScan)
            .. "\n" .. stats.owned .. " of " .. stats.total .. " decor collected"
    end
    local cached = DB().lastKnownStats
    if cached and cached.total and cached.total > 0 then
        return "Not scanned yet this session.\nLast known: " .. cached.owned
            .. " of " .. cached.total .. " decor collected"
    end
    return "Not scanned yet this session."
end

local function BuildData(parent)
    local card = NewCard(parent, "Decor scan")
    local status = CardDesc(card, ScanText(), 8)
    CardLink(card, "Rescan now", function()
        local DecorData = addonTable.DecorData
        DecorData.stats = nil
        DecorData:Build()
        C_Timer.After(0.5, function() status:SetText(ScanText()) end)
    end)
end

local SECTIONS = {
    { name = "Home",       build = BuildHome },
    { name = "Minimap",    build = BuildMinimap },
    { name = "Zone Alert", build = BuildZoneAlert },
    { name = "Collection", build = BuildCollection },
    { name = "Data",       build = BuildData },
}

-- ── Scrolling + sizing ───────────────────────────────────────────
local function UpdateThumb()
    if not scroll or not thumb then return end
    local range = scroll:GetVerticalScrollRange()
    local viewH = scroll:GetHeight()
    if not range or range <= 1 or not viewH or viewH <= 0 then
        thumb:Hide()
        return
    end
    local thumbH = math.max(20, viewH * (viewH / (viewH + range)))
    local offset = (scroll:GetVerticalScroll() / range) * (viewH - thumbH)
    thumb:SetHeight(thumbH)
    thumb:ClearAllPoints()
    thumb:SetPoint("TOPRIGHT", scroll, "TOPRIGHT", -1, -offset)
    thumb:Show()
end

local function ClearContent()
    for _, child in ipairs({ content:GetChildren() }) do
        child:Hide()
        child:SetParent(nil)
    end
    for _, region in ipairs({ content:GetRegions() }) do
        region:Hide()
    end
    wipe(pageCards)
end

-- Fits the window to the open page: sizes each card to its contents, then
-- (one frame later, once those heights have laid out) sizes the scroll child
-- to the lowest card and the window to that, capped at MAX_H.
local function MeasureWindow()
    if not window or not content then return end
    local top = content:GetTop()
    if not top then return end
    local lowest
    for _, card in ipairs(pageCards) do
        local b = card:GetBottom()
        if b then lowest = math.min(lowest or b, b) end
    end
    if not lowest then return end
    local contentH = top - lowest
    content:SetHeight(contentH)
    window:SetHeight(math.max(MIN_H, math.min(MAX_H, contentH + TOP_CHROME + Brand.SAFE_MARGIN)))
    C_Timer.After(0, UpdateThumb)
end

FitWindow = function()
    if not window or not content then return end
    for _, card in ipairs(pageCards) do FitCard(card) end
    C_Timer.After(0, MeasureWindow)
end

local function ShowSection(name)
    activeSection = name
    for key, btn in pairs(sectionButtons) do
        SetLinkSelected(btn, key == name)
    end
    ClearContent()
    scroll:SetVerticalScroll(0)
    for _, section in ipairs(SECTIONS) do
        if section.name == name then
            section.build(content)
            C_Timer.After(0, FitWindow)
            return
        end
    end
end

local function BuildWindow()
    if window then return window end

    local f = CreateFrame("Frame", "XalsEmporiumOptionsWindow", UIParent)
    tinsert(UISpecialFrames, "XalsEmporiumOptionsWindow")
    f:SetSize(WIN_W, MIN_H)
    f:SetFrameStrata("HIGH")
    f:SetToplevel(true)
    f:SetMovable(true)
    f:EnableMouse(true)
    f:RegisterForDrag("LeftButton")
    f:SetScript("OnDragStart", f.StartMoving)
    f:SetScript("OnDragStop", function(self)
        self:StopMovingOrSizing()
        local point, _, relPoint, x, y = self:GetPoint()
        DB().optionsPos = { point = point, relPoint = relPoint, x = x, y = y }
    end)
    f:SetClampedToScreen(true)

    -- Distinct default offset so this can't land on top of another Xal's
    -- addon's window.
    local pos = DB().optionsPos
    if pos and pos.point then
        f:SetPoint(pos.point, UIParent, pos.relPoint, pos.x, pos.y)
    else
        f:SetPoint("CENTER", UIParent, "CENTER", 260, -40)
    end

    Brand.ApplyBackground(f)
    Brand.DrawBorder(f, 1)

    Brand.Title(f, PANEL_NAME, 28, "TOP", f, "TOP", 0, -20)

    Brand.DrawHeaderDivider(f, Brand.SAFE_MARGIN, 70, WIN_W - (Brand.SAFE_MARGIN * 2))

    local close = Brand.MakeCloseButton(f, function() f:Hide() end)
    close:SetPoint("TOPRIGHT", f, "TOPRIGHT", -Brand.SAFE_MARGIN, -Brand.SAFE_MARGIN)

    -- Sidebar
    sidebar = CreateFrame("Frame", nil, f)
    sidebar:SetPoint("TOPLEFT", f, "TOPLEFT", Brand.SAFE_MARGIN, -88)
    sidebar:SetPoint("BOTTOMLEFT", f, "BOTTOMLEFT", Brand.SAFE_MARGIN, Brand.SAFE_MARGIN)
    sidebar:SetWidth(SIDEBAR_W)

    local vDivider = f:CreateTexture(nil, "ARTWORK")
    vDivider:SetColorTexture(Brand.DIVIDER_COLOR[1], Brand.DIVIDER_COLOR[2], Brand.DIVIDER_COLOR[3], 1)
    vDivider:SetWidth(Brand.LINE_THICKNESS)
    vDivider:SetPoint("TOPLEFT", sidebar, "TOPRIGHT", 10, 0)
    vDivider:SetPoint("BOTTOMLEFT", sidebar, "BOTTOMRIGHT", 10, 0)

    -- Scrollable content area: the scroll frame fills the space right of the
    -- divider, the content frame is its scroll child at the visible card width.
    scroll = CreateFrame("ScrollFrame", nil, f)
    scroll:SetPoint("TOPLEFT", vDivider, "TOPRIGHT", 26, -32)
    scroll:SetPoint("BOTTOMRIGHT", f, "BOTTOMRIGHT", -Brand.SAFE_MARGIN, Brand.SAFE_MARGIN)
    scroll:EnableMouseWheel(true)
    scroll:SetScript("OnMouseWheel", function(self, delta)
        local range = self:GetVerticalScrollRange()
        self:SetVerticalScroll(math.max(0, math.min(range, self:GetVerticalScroll() - delta * 40)))
        UpdateThumb()
    end)

    content = CreateFrame("Frame", nil, scroll)
    content:SetSize(CONTENT_W, 1)
    scroll:SetScrollChild(content)

    -- Thin scroll indicator in the gutter beside the cards, only shown when
    -- the page is taller than the window's maximum height.
    thumb = f:CreateTexture(nil, "OVERLAY")
    thumb:SetWidth(3)
    thumb:SetColorTexture(Brand.HEADER_COLOR[1], Brand.HEADER_COLOR[2], Brand.HEADER_COLOR[3], 0.9)
    thumb:Hide()

    local y = -32
    for _, section in ipairs(SECTIONS) do
        local btn = Brand.MakeTextLink(sidebar, section.name, function() ShowSection(section.name) end)
        -- Inter SemiBold 15, left-justified in a fixed-width button so every
        -- entry starts at the same x instead of centering on its own width.
        btn.label:SetFont(Brand.BODY_FONT_PATH_SEMIBOLD, 15, "")
        btn.label:ClearAllPoints()
        btn.label:SetPoint("LEFT", btn, "LEFT", 0, 0)
        btn.label:SetJustifyH("LEFT")
        btn:SetWidth(SIDEBAR_W - 8)
        btn:SetPoint("TOPLEFT", sidebar, "TOPLEFT", 8, y)
        sectionButtons[section.name] = btn
        y = y - 28
    end

    -- Logo-only Discord link, pinned to the sidebar's own bottom edge so it
    -- stays put regardless of how many sections get added later.
    local discordLogo = Brand.MakeDiscordLogoLink(sidebar, SIDEBAR_W - 16)
    discordLogo:SetPoint("BOTTOMLEFT", sidebar, "BOTTOMLEFT", 8, 0)

    f:Hide()
    window = f
    ShowSection(activeSection)
    return f
end

-- The AddOns-list entry. Points people at the standalone window rather than
-- duplicating controls in two places. Short enough that it can never overflow
-- the native settings canvas.
local function BuildCanvasPanel()
    if rootPanel then return rootPanel end

    local panel = CreateFrame("Frame")
    panel.name = PANEL_NAME

    local title = Brand.FS(panel, PANEL_NAME, Brand.TITLE_FONT_PATH, 22, nil,
        Brand.HEADER_COLOR[1], Brand.HEADER_COLOR[2], Brand.HEADER_COLOR[3])
    title:SetPoint("TOPLEFT", panel, "TOPLEFT", 16, -16)

    local blurb = Brand.FS(panel, "A housing-decor collection tracker - finds every decor "
        .. "item you're missing and where to get it.", Brand.BODY_FONT_PATH, 13, nil, 0.85, 0.85, 0.85)
    blurb:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -10)
    blurb:SetPoint("RIGHT", panel, "RIGHT", -RIGHT_MARGIN, 0)
    blurb:SetJustifyH("LEFT")
    blurb:SetWordWrap(true)

    local open = Brand.MakeButton(panel, "Open Xal's Emporium options", 240, 28, function()
        SettingsPanel:Open()
    end)
    open:SetPoint("TOPLEFT", blurb, "BOTTOMLEFT", 0, -20)

    rootPanel = panel
    return panel
end

function SettingsPanel:Init()
    BuildCanvasPanel()

    if Settings and Settings.RegisterCanvasLayoutCategory then
        local category = Settings.RegisterCanvasLayoutCategory(rootPanel, rootPanel.name)
        category.ID = rootPanel.name
        Settings.RegisterAddOnCategory(category)
        SettingsPanel.category = category
    elseif InterfaceOptions_AddCategory then
        InterfaceOptions_AddCategory(rootPanel)
    end
end

-- The primary entry point: the standalone window.
function SettingsPanel:Open()
    local f = BuildWindow()
    if f:IsShown() then f:Hide() else f:Show() end
end
