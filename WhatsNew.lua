-- WhatsNew.lua
-- Xal's Emporium
--
-- Shows a "what's new" splash automatically the FIRST time a player logs in
-- after the addon has been updated to a new version - never during normal,
-- unchanged play. Compares the addon's real installed version (read from the
-- .toc at runtime) against the last version this player actually saw, and
-- only pops up when they differ.
--
-- CHANGELOG.md already gets written by hand before every release, in Dev,
-- before Jason ever commits/pushes anything - same moment, update WHATS_NEW
-- below (the "date" field and the intro/sections content) to match. The
-- version NUMBER shown on the splash does NOT need updating here - it's
-- read live from the real installed .toc version, same value used for the
-- update-check itself, so there's only ever one place that can go stale.
local addonName, addonTable = ...
addonTable.WhatsNew = {}
local W = addonTable.WhatsNew
local Brand = addonTable.BrandStyle

-- ── Update this block every release to match CHANGELOG.md ──────
-- (no "version" field here on purpose - see note above)
W.WHATS_NEW = {
    date = "October 23, 2026",
    intro = "A housing-decor collection tracker - finds every decor item you're missing and where to get it.",
    sections = {
        { heading = "New", items = {
            "Browse your whole decor collection, owned and missing, with search and filters.",
            "Click any item to see who sells it, with a Set Waypoint button that takes you there.",
            "Exact vendor locations for nearly 1,750 decor items.",
            "A zone alert icon when the zone you're in has decor you're missing.",
            "New settings window with a sidebar, and support for Xal's Keep.",
        } },
    },
}

-- ── Version check ────────────────────────────────────────────
-- C_AddOns.GetAddOnMetadata is the current namespaced API (available on
-- Retail, MoP Classic, and Classic Era alike since Dragonflight); the bare
-- global is kept as a fallback only, same defensive pattern used elsewhere
-- in Jason's addons for other C_* namespaces.
local function GetInstalledVersion()
    local v
    if C_AddOns and C_AddOns.GetAddOnMetadata then
        v = C_AddOns.GetAddOnMetadata(addonName, "Version")
    elseif _G.GetAddOnMetadata then
        v = _G.GetAddOnMetadata(addonName, "Version")
    end
    -- The .toc's "@project-version@" token only gets replaced with a real
    -- number by the packager, which only runs on an actual tagged release.
    -- Testing straight from local files (no tag pushed) leaves it as this
    -- literal, unsubstituted text - show a friendly fallback instead of the
    -- broken-looking placeholder string.
    if v == "@project-version@" then
        return "dev"
    end
    return v
end

local FW = 460
local MAX_FH = 560 -- clamp so an unusually long release note can't run off-screen

local function BuildFrame(installedVersion)
    local f = CreateFrame("Frame", "XalsEmporiumWhatsNewFrame", UIParent)
    f:SetSize(FW, 360) -- placeholder height; set for real below once content is laid out
    -- Distinct default offset + SetToplevel + saved position, per the
    -- suite-wide window rule: a bare SetPoint("CENTER") makes this land on
    -- top of another Xal's addon's window whenever two are open at once.
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
            XalsEmporiumDB.whatsNewPos = { point = point, relPoint = relPoint, x = x, y = y }
        end
    end)
    f:SetClampedToScreen(true)

    local pos = type(XalsEmporiumDB) == "table" and XalsEmporiumDB.whatsNewPos or nil
    if pos and pos.point then
        f:SetPoint(pos.point, UIParent, pos.relPoint, pos.x, pos.y)
    else
        f:SetPoint("CENTER", UIParent, "CENTER", -220, 140)
    end

    Brand.ApplyBackground(f)
    Brand.DrawBorder(f)

    local data = W.WHATS_NEW
    Brand.Title(f, "What's New", 26, "TOP", f, "TOP", 0, -24)

    local discord = Brand.MakeDiscordLink(f)
    discord:SetPoint("TOPRIGHT", f, "TOPRIGHT", -Brand.SAFE_MARGIN, -Brand.SAFE_MARGIN)

    -- "installedVersion" is the REAL live version (from CheckAndShow), not a
    -- hand-typed field - it always matches whatever actually got tagged.
    local verLine = Brand.FS(f, "Version " .. installedVersion .. (data.date and ("  ·  " .. data.date) or ""),
        Brand.BODY_FONT_PATH, 12, "", Brand.GOLD[1], Brand.GOLD[2], Brand.GOLD[3])
    verLine:SetPoint("TOP", f, "TOP", 0, -58)
    verLine:SetJustifyH("CENTER")

    Brand.DrawHeaderDivider(f, 30, 78, FW - 60)

    local y = 92
    if data.intro and data.intro ~= "" then
        local intro = Brand.FS(f, data.intro, Brand.BODY_FONT_PATH, 12, "", 0.85, 0.85, 0.85)
        intro:SetPoint("TOPLEFT", f, "TOPLEFT", 30, -y)
        intro:SetWidth(FW - 60)
        intro:SetJustifyH("LEFT")
        intro:SetWordWrap(true)
        y = y + (intro:GetStringHeight() or 14) + 14
    end

    for _, section in ipairs(data.sections or {}) do
        local head = Brand.FS(f, section.heading, Brand.BODY_FONT_PATH_SEMIBOLD, 13, "",
            Brand.ACCENT[1], Brand.ACCENT[2], Brand.ACCENT[3])
        head:SetPoint("TOPLEFT", f, "TOPLEFT", 30, -y)
        y = y + 20

        for _, item in ipairs(section.items or {}) do
            local bullet = Brand.FS(f, "-  " .. item, Brand.BODY_FONT_PATH, 12, "",
                Brand.GOLD[1], Brand.GOLD[2], Brand.GOLD[3])
            bullet:SetPoint("TOPLEFT", f, "TOPLEFT", 36, -y)
            bullet:SetWidth(FW - 76)
            bullet:SetJustifyH("LEFT")
            bullet:SetWordWrap(true)
            y = y + (bullet:GetStringHeight() or 14) + 6
        end
        y = y + 10
    end

    local closeBtn = Brand.MakeButton(f, "Got it", 110, 28, function()
        f:Hide()
    end)
    closeBtn:SetPoint("BOTTOM", f, "BOTTOM", 0, 18)

    -- Size the frame to its ACTUAL content (y = how far the layout got, plus
    -- room for the close button + bottom padding) instead of a guessed fixed
    -- height - a longer release's content would otherwise clip or overlap
    -- the button.
    f:SetHeight(math.min(y + 56, MAX_FH))

    return f
end

-- Call this from Engine's Init - checks the version and shows the splash
-- only when it's genuinely changed since this player last saw it.
function W:CheckAndShow()
    local installed = GetInstalledVersion()
    if not installed then return end -- metadata unavailable, don't error, just skip

    -- Uses the addon's account-wide DB - XalsEmporiumDB - same table every
    -- other saved setting lives in, so no extra SavedVariables entry needs
    -- registering in the .toc.
    local db = _G["XalsEmporiumDB"]
    if not db then return end

    if db.lastSeenVersion ~= installed then
        db.lastSeenVersion = installed
        -- pcall so a bad edit to WHATS_NEW (typo, missing field) can never
        -- break the rest of the addon's login - worst case, the splash just
        -- silently doesn't show that one time.
        local ok, frame = pcall(BuildFrame, installed)
        if ok and frame then frame:Show() end
    end
end
