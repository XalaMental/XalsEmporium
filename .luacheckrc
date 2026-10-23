-- .luacheckrc
-- Xal's Emporium
--
-- Scoped to the actual WoW API calls and globals this addon uses (not a
-- copy-pasted full addon's config) - add to `globals`/`read_globals` as new
-- API calls get added, rather than pulling in a giant generic list.
std = "lua51"

-- This addon's own globals: the SavedVariables tables and the slash command
-- entries, all of which are genuinely written to.
globals = {
    "XalsEmporiumDB",
    "XalsEmporiumCharDB",
    "StaticPopupDialogs",
    "SLASH_XALSEMPORIUM1",
    "SlashCmdList",
}

-- Read-only: real WoW client API/globals.
read_globals = {
    "XalsKeep", -- Xal's Keep hub API, guarded with a nil-check before use
    "CreateFrame",
    "UIParent",
    "PixelUtil",
    "Settings",
    "InterfaceOptions_AddCategory",
    "InterfaceOptionsFrame_OpenToCategory",
    "StaticPopup_Show",
    "LibStub",
    "GameTooltip",
    "GameFontHighlightSmall",
    "InputBoxTemplate",
    "UISpecialFrames",
    "BackdropTemplateMixin",
    "hooksecurefunc",
    "wipe",
    "tinsert",
    "C_Timer",
    "C_AddOns",
    "GetCursorPosition",
    -- Housing decor (Patch 12.0/Midnight) - the only source in the client
    -- for what decor an account owns. Every one of its functions is read
    -- through pcall in DecorData.lua rather than assumed to exist, since
    -- this is unverified-in-game API on a brand-new system.
    "C_HousingCatalog",
    "Enum",
    "Constants",
    "C_Map",
    "UnitFactionGroup",
    "GetRealZoneText",
    "GetZoneText",
    "GetSubZoneText",
    "GetInstanceInfo",
    "ZONE",
    "LOCATION_COLON",
    -- Waypoint-setting in DecorDetail.lua - TomTom when installed (optional,
    -- guarded with a nil check), native Blizzard waypoint API otherwise.
    "TomTom",
    "UiMapPoint",
    "C_SuperTrack",
    "InCombatLockdown",
    "time",
    "date",
}

-- Textures/backdrop tables and long chained SetPoint calls read as "unused
-- variable"/line-length noise in generated UI code like this - not real bugs.
-- Matches the rest of the family's config. `addonName` specifically comes
-- from the standard `local addonName, addonTable = ...` header every file
-- carries and is intentionally unused in most of them.
max_line_length = false
unused_args = false
ignore = { "211/addonName" }
